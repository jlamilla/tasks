import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/types/hive/hive_key_object.dart';

part 'task.g.dart';

@HiveType(typeId: HiveTypeIds.key0)
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    required this.finalized,
    this.taskDate,
    required this.createDate,
    required this.updateDate,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool finalized;
  @HiveField(3)
  final DateTime? taskDate;
  @HiveField(4)
  final DateTime createDate;
  @HiveField(5)
  final DateTime updateDate;

  static Task fromJson(Map<String, dynamic> json) =>
  Task(
    id: json['id'],
    title: json['title'],
    finalized: json['finalized'],
    taskDate: json['taskDate'],
    createDate: json['createDate'],
    updateDate: json['updateDate'],
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'finalized': finalized,
    'taskDate': taskDate,
    'createDate': createDate,
    'updateDate': updateDate,
  };

  Task copyWith({
    String? id,
    String? title,
    bool? finalized,
    DateTime? taskDate,
    DateTime? createDate,
    DateTime? updateDate,
  }) =>
  Task(
    id: id ?? this.id,
    title: title ?? this.title,
    finalized: finalized ?? this.finalized,
    taskDate: taskDate ?? this.taskDate,
    createDate: createDate ?? this.createDate,
    updateDate: updateDate ?? this.updateDate,
  );

  @override
  List<Object?> get props => <Object?>[
    id,
    title,
    finalized,
    taskDate,
    createDate,
    updateDate,
  ];
}
