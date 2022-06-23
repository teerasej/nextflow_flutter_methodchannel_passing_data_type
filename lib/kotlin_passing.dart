import 'package:flutter/services.dart';

class KotlinPassing {
  static const platform = MethodChannel("nextflow.in.th/type");

  Future<Map<String, dynamic>?> getMapByInvokeMapMethod() async {
    var result = await platform.invokeMapMethod<String, dynamic>(
      'invokeMapMethod_1stLevelWithCommonValue',
    );

    return result;
  }

  Future<Map<String, dynamic>?> getMapByInvokeMapMethod_2ndLevel() async {
    var result = await platform.invokeMapMethod<String, dynamic>(
      'invokeMapMethod_2ndLevelWithCommonValue',
    );

    return result;
  }

  Future<Map<String, dynamic>?>
      getMapByInvokeMapMethod_2ndLevel_List_WithCommonValue() async {
    var result = await platform.invokeMapMethod<String, dynamic>(
      'invokeMapMethod_2ndLevel_List_WithCommonValue',
    );

    return result;
  }
}