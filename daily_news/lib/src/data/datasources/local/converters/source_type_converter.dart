import 'package:daily_news/src/domain/entities/source.dart';
import 'package:floor/floor.dart';

class SourceTypeConverter extends TypeConverter<Source?, String?>{
  @override
  Source? decode(String? databaseValue) {
    if(databaseValue == null) return null;
    final List<String> result = databaseValue.split(',') ?? const ['non', 'non'];
    return Source(id:result.first, name: result.last);
  }

  @override
  String? encode(Source? value) {
    if(value == null) return null;
    final String result = '${value.id}, ${value.name}';
    return result;
  }

}