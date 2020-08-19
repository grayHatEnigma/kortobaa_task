import 'dart:io';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/user.dart';
import '../../models/post.dart';

// database table and column names

// users table
final String usersTable = 'users';
final String columnUserId = 'userId';
final String columnUserName = 'name';
final String columnUserEmail = 'email';
final String columnUserProfileImage = 'profileImage';

// posts table
final String postsTable = 'posts';
final String columnPostId = 'postId';
final String columnPostText = 'text';
final String columnPostImage = 'image';

// Database Provider Class
// a singleton class to manage the database
class DatebaseProvider {
  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "MyDatabase.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatebaseProvider._privateConstructor();
  static final DatebaseProvider instance =
      DatebaseProvider._privateConstructor();

  // factory constructor to ensure there is only
  // one instance of the Database Provider class
  factory DatebaseProvider() => instance;

  // Only allow a single open connection to the database.
  static Database _database;
  // a getter for the _database private instance
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database or create a new one if not existed
  _initDatabase() async {
    // The path_provider plugin gets the directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // Here we join the documents path with our database name
    String path = join(documentsDirectory.path, _databaseName);

    // Open / Create the database.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Execute SQL string to create the database for the first time
  Future _onCreate(Database db, int version) async {
    await db.execute("""
            CREATE TABLE $postsTable (
              $columnPostId INTEGER PRIMARY KEY, 
              $columnUserId INTEGER NOT NULL,
              $columnPostText TEXT NOT NULL,
              $columnPostImage TEXT NOT NULL,
              FOREIGN KEY ($columnUserId) REFERENCES $usersTable ($columnUserId) 
                ON DELETE NO ACTION ON UPDATE NO ACTION
            )""");

    await db.execute("""
            CREATE TABLE $usersTable (
              $columnUserName INTEGER PRIMARY KEY,
              $columnUserName TEXT NOT NULL UNIQUE,
              $columnUserEmail TEXT NOT NULL UNIQUE,
              $columnUserProfileImage TEXT NOT NULL ,
            )""");
  }

  // Database helper methods:

  // add a post to the database ' s posts table and return the auto-gen id for it
  Future<int> insert(Post post) async {
    Database db = await database;

    int id = await db.insert(postsTable, post.toMap());
    post.postId = id;
    return id;
  }

  // get a list of encoded to map posts
  Future<List<Map<String, dynamic>>> _queryAllPosts() async {
    Database db = await database;
    var list = await db.query(postsTable);
    return list;
  }

  // get list of decoded  transactions
  Future<List<Post>> getAllPosts() async {
    var maps = await _queryAllPosts();

    return maps.map((map) {
      return Post.fromMap(map);
    }).toList();
  }
} // DatebaseProvider
