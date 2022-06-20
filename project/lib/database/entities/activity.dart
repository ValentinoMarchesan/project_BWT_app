import 'package:floor/floor.dart';

// per dire a floor che questa è una classe che definisce una entity
@entity
class Activity {
  @PrimaryKey(autoGenerate: true)
  final int? id; //è la primary key, è nullable perchè viene autogenerata

  final double? step;
  final double? actcalories;
  final double? calories;
  final double? minsedentary;

  //constructor
  Activity(
    this.id,
    this.step,
    this.actcalories,
    this.calories,
    this.minsedentary,
  );
}