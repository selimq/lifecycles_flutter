package com.example.lifecycles_flutter


import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import android.os.Bundle
import android.content.Intent
import android.app.Service
import android.os.IBinder

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        intent = Intent(this, MyService::class.java)
        startService(intent)
    }
    override fun onStop() {
        super.onStop()
        Log.d("FlutterActivity", "stop")
    }
    override fun onDestroy() {
        super.onDestroy()
        Log.d("FlutterActivity", "destroy")
    }
    
}
class MyService : Service() {
 
    private val TAG = "FlutterActivity"
    override fun onCreate() {
        Log.i(TAG, "Service onCreate")
    }
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        Log.i(TAG, "Service running")
        return Service.START_STICKY
    }
    override fun onBind(intent: Intent): IBinder? {
        Log.i(TAG, "Service onBind")
        return null
    }
    override fun onTaskRemoved(intent: Intent?) {
        Log.i(TAG,"onTaskRemoved")
        stopSelf()
    }
    override fun onDestroy() {
        Log.i(TAG, "Service onDestroy")
    }
}