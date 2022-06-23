import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_methodchannel_passing_data_type/kotlin_passing.dart';

void main() {
  group(
    'Working with Kotlin',
    () {
      late KotlinPassing lib;

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
}
