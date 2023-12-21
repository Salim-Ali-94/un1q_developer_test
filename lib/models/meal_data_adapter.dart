import "package:hive/hive.dart";
import "package:un1q_developer_test/models/meal_data.dart";


class MealDataAdapter extends TypeAdapter<MealData> {

  @override
  MealData read(BinaryReader reader) {

    final meal = reader.readString();
    final id = reader.readString();
    final image = reader.readString();
    final price = reader.readDouble();
    final protein = reader.readDouble();
    final carbohydrate = reader.readDouble();
    final fibre = reader.readDouble();
    final calories = reader.readDouble();

    return MealData(meal: meal, id: id,
                       image: image, price: price,
                       protein: protein,
                       carbohydrate: carbohydrate,
                       fibre: fibre,
                       calories: calories);

  }

  @override
  write(BinaryWriter writer, MealData data) {

    writer.writeString(data.meal);
    writer.writeString(data.id);
    writer.writeString(data.image);
    writer.writeDouble(data.price);
    writer.writeDouble(data.protein);
    writer.writeDouble(data.carbohydrate);
    writer.writeDouble(data.fibre);
    writer.writeDouble(data.calories);

  }

  @override
  int get typeId => 0;

}
