package com.example.nextflow_flutter_methodchannel_passing_data_type

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "nextflow.in.th/type"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            // This method is invoked on the main thread.
            // TODO
            when(call.method) {
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
