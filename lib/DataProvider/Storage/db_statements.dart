import 'models.dart';

/*
 *      STATEMENTS FOR CREATING ALL TABLES IN THE DATABASE
 */



class DBStatements{

    static const String txt = 'TEXT ';
    static const String integer = 'INTEGER ';

    static const String nn = 'NOT NULL ';
    static const String pk = 'PRIMARY KEY ';
    static const String real = 'REAL ';

    /*
      static const String idTypeMeasurements = 'TEXT PRIMARY KEY';
      static const String idTypeVarId = 'INTEGER PRIMARY KEY';
      static const String varIdType = 'INTEGER NOT NULL';
      static const String realType = 'REAL NOT NULL';
      static const String textType = 'TEXT NOT NULL';
     */

  String enableDatabaseForeignKeys(){
    return '''PRAGMA foreign_keys = ON''';
  }
    
  /*
   *        CREATE STATEMENTS
   */

  String createMeasurementsTable(){
      return '''CREATE TABLE ${MeasurementFields.tableName}(
      ${MeasurementFields.id} ${integer + pk},
      ${MeasurementFields.variableId} ${integer + nn},
      ${MeasurementFields.value} ${real + nn},
      ${MeasurementFields.time} ${txt + nn},
      FOREIGN KEY (${MeasurementFields.variableId}) REFERENCES ${VariableFields.tableName}(${VariableFields.id})
      ); ''';
  }

  String createVariablesTable(){
      return ''' CREATE TABLE ${VariableFields.tableName}(
      ${VariableFields.id} ${integer + pk}, 
      ${VariableFields.name} ${txt + nn}, 
      ${VariableFields.units} ${txt + nn}, 
      ${VariableFields.desc} ${txt + nn}
      );
      ''';
  }

    String createZonesTable(){
      return ''' CREATE TABLE ${CropFields.tableName}(
      ${CropFields.id} ${integer + pk}, 
      ${CropFields.idOrg} ${integer + nn}, 
      ${CropFields.latitude} ${txt + nn}, 
      ${CropFields.longitude} ${txt + nn}
      );
      ''';
    }

    String createConditionsTable(){
      return ''' CREATE TABLE ${ConditionsFields.tableName}(
      ${ConditionsFields.id} ${integer + pk}, 
      ${ConditionsFields.idVar} ${integer + nn}, 
      ${ConditionsFields.min} ${real + nn}, 
      ${ConditionsFields.max} ${real + nn}
      FOREIGN KEY (${ConditionsFields.idVar}) REFERENCES ${VariableFields.tableName}(${VariableFields.id})
      );
      ''';
    }

  /*
   *        SELECT STATEMENTS
   */

    String distinctVariables(){
      return '''SELECT ${VariableFields.id}, ${VariableFields.units}, ${VariableFields.desc},
        ${VariableFields.name} FROM ${VariableFields.tableName} GROUP BY ${VariableFields.name}''';
    }

  /*
   *        INSERT STATEMENTS
   */

  String insertMeasurement(int id, int varId, int variableId, double value, String time){
      return '''INSERT INTO ${MeasurementFields.tableName}(
      ${MeasurementFields.id}, 
      ${MeasurementFields.idCrop}, 
      ${MeasurementFields.variableId}, 
      ${MeasurementFields.value},
      ${MeasurementFields.time}) VALUES ($id, $varId, $variableId, $value, "$time");
      ''';
  }

  String insertVariable(int id, String name, String units, String desc){
      return '''INSERT INTO ${VariableFields.tableName}(
        ${VariableFields.id}, 
        ${VariableFields.name},
        ${VariableFields.units},
        ${VariableFields.desc}) VALUES ($id, "$name", "$units", "$desc");
        ''';
  }

  String insertCrop(int id, int idOrg, String name, double latitude, double longitude){
    return '''INSERT INTO ${CropFields.tableName}(
        ${CropFields.id}, 
        ${CropFields.idOrg},
        ${CropFields.name},
        ${CropFields.latitude}, 
        ${CropFields.longitude}) VALUES ($id, $idOrg, "$name", $latitude, $longitude);
        ''';
  }

  /*
   *        DELETE STATEMENTS
   */

    String deleteAllVariables(){
      return '''DELETE FROM ${VariableFields.tableName};''';
    }

    String deleteAllMeasurements(){
      return '''DELETE FROM ${MeasurementFields.tableName};''';
    }

}