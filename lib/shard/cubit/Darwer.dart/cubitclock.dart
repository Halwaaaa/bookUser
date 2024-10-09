import 'dart:typed_data';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:user/core/servers/localNot.dart';

import 'package:user/shard/cubit/Darwer.dart/statesclock.dart';
import 'package:workmanager/workmanager.dart';

//import 'package:path_provider/path_provider.dart';
int? idA;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  List<dynamic> Time = [];
  List<dynamic> madesn = [];

  List<dynamic> TimeDo = [];
  List<dynamic> Timenodo = [];

  void tapIconOpenClock(int isopen, int index) {
    isopen == 0
        ? upDataBaseopen(open: 1, id: Time[index]["id"])
        : upDataBaseopen(open: 0, id: Time[index]["id"]);
  }

  void changedStatusClock(int index) {
    Time[index]["status"] == "do"
        ? upDataBasedoStaus(status: "nodo", id: Time[index]["id"])
        : upDataBasedoStaus(status: "do", id: Time[index]["id"]);
  }

  void changedDaliyClock(int index, bool isdaliy) {
    isdaliy = !isdaliy;
    isdaliy == true
        ? upDataBaseDaliy(daliy: 1, id: Time[index]["id"])
        : upDataBaseDaliy(daliy: 0, id: Time[index]["id"]);
  }

  //String cubit = "";

  late Image image;

  late Database? database;
  Future<Database?> get databasee async {
    if (database == null) {
      await _initiateDatabase();
    }
    return database;
  }

  _initiateDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    //getApplicationDocumentsDirectory();
    String path = join(directory.path, 'doctor.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db
        .execute(
            'CREATE TABLE Time (id INTEGER PRIMARY KEY,daliy INTEGER,week INTEGER,  Hour INTEGER,              min INTEGER, name TEXT,status TEXT)')
        .then((value) {
      emit(AppcrateDataStates());
      print("Database Create");
    });
  }

  void creatDataBase() async {
    database = await openDatabase(
      'doctor.db',
      version: 1,
      onCreate: (Database databasee, int version) async {
        print("database craete");
        // When creating the db, create the table
        await databasee
            .execute(
                'CREATE TABLE Time (id INTEGER PRIMARY KEY,daliy INTEGER,week INTEGER,  Hour INTEGER,              min INTEGER, name TEXT,status TEXT)')
            .then((value) {
          print("table craeted");
        });
      },
      onOpen: (databasee) {
        print("data base open");
        getDataBase(databasee);
      },
    );
  }

  insertDataBase({
    required int Hour,
    required int daliy,
    required int open,
    required int min,
    required String name,
    required String status,
  }) async {
    await database
        ?.transaction((txn) => txn.rawInsert(
            'INSERT INTO Time(daliy,week,Hour,min,name,status) VALUES($daliy,$open, $Hour,$min,"$name",   "$status" )'))
        .then((value) {
      Noti().test();

      getDataBase(database);
      print(value);
    });
  }

  void getDataBase(database) async {
    await database.rawQuery('SELECT * FROM Time').then((value) {
      Time = [];
      TimeDo = [];
      Timenodo = [];

      value.forEach((Element) async {
        Time.add(Element);

        if (Element['status'] == 'do') {
          TimeDo.add(Element);
          await notifications(
              id: Element["id"],
              day: Element["daliy"],
              hours: Element["Hour"],
              min: Element["min"],
              boby: Element["name"]);
        }
        if (Element['status'] == 'nodo') {
          AndroidAlarmManager.cancel(Element["id"]);
          Workmanager().cancelByUniqueName('${Element["id"]}');
        }
      });

      //  print(Time);

      emit(AppgetDataBasestate());
    });
  }

  dalteBase({
    required int id,
  }) async {
    await database
        ?.rawDelete('DELETE FROM Time WHERE id = ?', [id]).then((value) {
      Workmanager().cancelByUniqueName('$id');

      getDataBase(database);
    });
  }

  void upDataBasedoStaus({
    required String status,
    required int id,
  }) async {
    await database?.rawUpdate('UPDATE Time SET status = ? WHERE   id  = ?',
        [status, id]).then((value) {
      //  print(value);

      getDataBase(database);
    });
  }

  void upDataBaseDaliy({
    required int daliy,
    required int id,
  }) async {
    await database?.rawUpdate('UPDATE Time SET daliy  = ? WHERE   id  = ?',
        [daliy, id]).then((value) {
      getDataBase(database);
    });
  }

  void upDataBaseopen({
    required int open,
    required int id,
  }) async {
    await database?.rawUpdate(
        'UPDATE Time SET week = ? WHERE   id  = ?', [open, id]).then((value) {
      getDataBase(database);
    });
  }

  Future<void> notifications(
      {required int day,
      required int id,
      required int hours,
      required int min,
      required String boby}) async {
    final DateTime now = DateTime.now();

    DateTime scheduledDate = DateTime(now.year, now.month, now.day, hours, min);
    DateTime time = scheduledDate.add(const Duration(seconds: 10));
    if (scheduledDate.isBefore(now)) {
      //print(now);
      time = time.add(const Duration(days: 1));
      // print(time.minute);
    }
    Duration discalulate = time.difference(now);

    Workmanager()
        .registerPeriodicTask("$id", "send_notification_task",
            frequency: const Duration(days: 1),
            initialDelay: discalulate,
            inputData: {'id': id, 'h': hours, 'm': min},
            constraints: Constraints(
                networkType: NetworkType.not_required,
                requiresBatteryNotLow: false,
                requiresCharging: false,
                requiresStorageNotLow: false,
                requiresDeviceIdle: false))
        .then((value) {
      print("llllllllllllllllllllllllll");
    });

    //   print("dfghjkkkkkkkk");
    //   //   // print(scheduledDate.day);

    //   print(id);

    //   AndroidAlarmManager.oneShotAt(time, id, show,
    //           allowWhileIdle: true, exact: true, wakeup: true)
    //       .then((value) {
    //     print(value);
    //   });
    // }
  }

  @pragma('vm:entry-point')
  void show() {}

  void changeIndexAppBar(int value) {}
  // Mandatory if the App is obfuscated or using Flutter 3.1+
}
