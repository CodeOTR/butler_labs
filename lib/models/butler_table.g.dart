// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'butler_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ButlerTable _$ButlerTableFromJson(Map<String, dynamic> json) => ButlerTable(
      tableName: json['tableName'] as String?,
      confidenceScore: json['confidenceScore'] as String?,
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => ButlerRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ButlerTableToJson(ButlerTable instance) =>
    <String, dynamic>{
      'tableName': instance.tableName,
      'confidenceScore': instance.confidenceScore,
      'rows': instance.rows?.map((e) => e.toJson()).toList(),
    };

ButlerRow _$ButlerRowFromJson(Map<String, dynamic> json) => ButlerRow(
      cells: (json['cells'] as List<dynamic>)
          .map((e) => ButlerCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ButlerRowToJson(ButlerRow instance) => <String, dynamic>{
      'cells': instance.cells.map((e) => e.toJson()).toList(),
    };

ButlerCell _$ButlerCellFromJson(Map<String, dynamic> json) => ButlerCell(
      columnName: json['columnName'] as String?,
      confidenceScore: json['confidenceScore'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ButlerCellToJson(ButlerCell instance) =>
    <String, dynamic>{
      'columnName': instance.columnName,
      'confidenceScore': instance.confidenceScore,
      'value': instance.value,
    };
