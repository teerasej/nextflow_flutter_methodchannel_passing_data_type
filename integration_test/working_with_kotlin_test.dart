import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_methodchannel_passing_data_type/kotlin_passing.dart';

void main() {
  late KotlinPassing lib;
  group(
    'Getting complext data from kotlin',
    () {
      setUp(() {
        lib = KotlinPassing();
      });

      test("Get Map with 1st level & common value", () async {
        var result = await lib.getMapByInvokeMapMethod();

        expect(result?['int'], 99);
        expect(result?['long'], 99999);
        expect(result?['String'], "Hello");
        expect(result?['boolean'], true);
        expect(result?['null'], isNull);
        expect(result?['notExists'], isNull);
      });

      test("Get Map with 2st level & common value", () async {
        var result = await lib.getMapByInvokeMapMethod_2ndLevel();

        expect(result?['int'], 99);
        expect(result?['long'], 99999);
        expect(result?['String'], "Hello");
        expect(result?['boolean'], true);
        expect(result?['null'], isNull);
        expect(result?['notExists'], isNull);

        // if property is Map, you can use it with key direcly
        expect(result?['profile']['id'], "12356");
        expect(result?['profile']['Name'], "Silmaril");
        expect(result?['profile']['amount'], 85000);

        // or cast it to Map<dynamic, dynamic>
        var profileMap = result?['profile'] as Map<dynamic, dynamic>;
        expect(profileMap['id'], "12356");
        expect(profileMap['Name'], "Silmaril");
        expect(profileMap['amount'], 85000);
      });

      test("Get List in 2st level & common value", () async {
        var result =
            await lib.getMapByInvokeMapMethod_2ndLevel_List_WithCommonValue();

        // If it is
        var list = result?['profiles'] as List<dynamic>;

        expect(list.length, 2);

        // you can cast it to Map<dynamic, dynamic> if you want to.
        var profileMap = list[0] as Map<dynamic, dynamic>;
        expect(profileMap['id'], "12356");
        expect(profileMap['Name'], "Silmaril");
        expect(profileMap['amount'], 85000);

        // or use it with caution
        expect(list[1]['id'], "1455");
        expect(list[1]['Name'], "Frodo");
        expect(list[1]['amount'], 2000);
      });
    },
  );

  group(
    'Passing complex data to kotlin',
    () {
      setUp(() {
        lib = KotlinPassing();
      });

      test('Passing common map to kotlin', () async {
        var map = <String, dynamic>{};

        map['int'] = 99;
        map['String'] = "Hello Dart";
        map['boolean'] = true;
        map['null'] = null;

        Map<dynamic, dynamic> result = await lib.sendCommonMapToKotlin(map);

        expect(result['int'], 99);
        expect(result['String'], "Hello Dart");
        expect(result['boolean'], true);
        expect(result['null'], isNull);
      });

      test('Passing 2 level map to kotlin', () async {
        var map = <String, dynamic>{};

        map['int'] = 99;
        map['String'] = "Hello Dart";
        map['boolean'] = true;
        map['null'] = null;

        var mapLevel2 = <String, dynamic>{};
        mapLevel2["id"] = "12356";
        mapLevel2["Name"] = "Silmaril";
        mapLevel2["amount"] = 85000;
        map["profile"] = mapLevel2;

        Map<dynamic, dynamic> result = await lib.send2LevelMapToKotlin(map);

        expect(result['int'], 99);
        expect(result['String'], "Hello Dart");
        expect(result['boolean'], true);
        expect(result['null'], isNull);

        // if property is Map, you can use it with key direcly
        expect(result['profile']['id'], "12356");
        expect(result['profile']['Name'], "Silmaril");
        expect(result['profile']['amount'], 85000);

        // or cast it to Map<dynamic, dynamic>
        var profileMap = result['profile'] as Map<dynamic, dynamic>;
        expect(profileMap['id'], "12356");
        expect(profileMap['Name'], "Silmaril");
        expect(profileMap['amount'], 85000);
      });
    },
  );
}
