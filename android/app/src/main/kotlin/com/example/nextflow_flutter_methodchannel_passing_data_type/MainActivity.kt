package com.example.nextflow_flutter_methodchannel_passing_data_type

import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject

class MainActivity: FlutterActivity() {
    private val CHANNEL = "nextflow.in.th/type"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // This method is invoked on the main thread.
            // TODO
            when(call.method) {

                "invokeMethod_PassingMap" -> {
                    var map:MutableMap<String,Any?>? = call.argument("map")
                    Log.d("INFO", "int")
                    result.success(map)
                }

                "invokeMapMethod_2ndLevel_List_WithCommonValue" -> {
                    var map = HashMap<String,Any?>()

                    var longNum:Long = 99999

                    map.put("int", 99)
                    map.put("long", longNum)
                    map.put("String", "Hello")
                    map.put("boolean", true)
                    map.put("null", null)

                    var mapLevel2_a = HashMap<String,Any?>();
                    mapLevel2_a.put("id","12356")
                    mapLevel2_a.put("Name","Silmaril")
                    mapLevel2_a.put("amount", 85000)



                    var mapLevel2_b = HashMap<String,Any?>();
                    mapLevel2_b.put("id","1455")
                    mapLevel2_b.put("Name","Frodo")
                    mapLevel2_b.put("amount", 2000)

                    var list = mutableListOf<HashMap<String,Any?>>()
                    list.add(mapLevel2_a)
                    list.add(mapLevel2_b)

                    map.put("profiles", list)

                    result.success(map)
                }

                "invokeMapMethod_2ndLevelWithCommonValue" -> {
                    var map = HashMap<String,Any?>()

                    var longNum:Long = 99999

                    map.put("int", 99)
                    map.put("long", longNum)
                    map.put("String", "Hello")
                    map.put("boolean", true)
                    map.put("null", null)

                    var mapLevel2 = HashMap<String,Any?>();
                    mapLevel2.put("id","12356")
                    mapLevel2.put("Name","Silmaril")
                    mapLevel2.put("amount", 85000)
                    map.put("profile", mapLevel2)

                    result.success(map)
                }

                "invokeMapMethod_1stLevelWithCommonValue" -> {
                    var map = HashMap<String,Any?>()

                    var longNum:Long = 99999

                    map.put("int", 99)
                    map.put("long", longNum)
                    map.put("String", "Hello")
                    map.put("boolean", true)
                    map.put("null", null)

                    result.success(map)
                }


                "int_to_long" -> {
                    val value: Long? = call.argument("value")
                    result.success(value)
                }
                "int_to_int" -> {
                    val value: Int? = call.argument("value")
                    result.success(value)
                }
                "list_string" -> {
                    val value: List<String>? = call.argument("value")
                    result.success(value)
                }
                "list_int" -> {
                    val value: List<Int>? = call.argument("value")
                    result.success(value)
                }
            }
        }
    }
}
