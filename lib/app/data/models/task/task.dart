import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/types/hive/hive_key_object.dart';

part 'task.g.dart';

@HiveType(typeId: HiveTypeIds.key0)
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.finalized,
    required this.taskDate,
    required this.createDate,
    required this.updateDate,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool finalized;
  @HiveField(4)
  final DateTime taskDate;
  @HiveField(5)
  final DateTime createDate;
  @HiveField(6)
  final DateTime updateDate;

  static Task fromJson(Map<String, dynamic> json) =>
  Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    finalized: json['finalized'],
    taskDate: json['taskDate'],
    createDate: json['createDate'],
    updateDate: json['updateDate'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'description': description,
    'finalized': finalized,
    'taskDate': taskDate,
    'createDate': createDate,
    'updateDate': updateDate,
  };

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    description,
    finalized,
    taskDate,
    createDate,
    updateDate,
  ];
}
