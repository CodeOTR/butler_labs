import 'package:json_annotation/json_annotation.dart';

part 'butler_table.g.dart';

@JsonSerializable(explicitToJson: true)
class ButlerTable{
  final String? tableName;

  final String? confidenceScore;

  final List<ButlerRow>? rows;

  ButlerTable({
    this.tableName,
    this.confidenceScore,
    this.rows,
  });

  factory ButlerTable.fromJson(Map<String, dynamic> json) => _$ButlerTableFromJson(json);

  Map<String, dynamic> toJson() => _$ButlerTableToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ButlerRow {
  final List<ButlerCell> cells;

  ButlerRow({
    required this.cells,
  });

  factory ButlerRow.fromJson(Map<String, dynamic> json) => _$ButlerRowFromJson(json);

  Map<String, dynamic> toJson() => _$ButlerRowToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ButlerCell {
  final String? columnName;

  final String? confidenceScore;

  final String? value;


  ButlerCell({
    this.columnName,
    this.confidenceScore,
    this.value,
  });

  factory ButlerCell.fromJson(Map<String, dynamic> json) => _$ButlerCellFromJson(json);

  Map<String, dynamic> toJson() => _$ButlerCellToJson(this);
}