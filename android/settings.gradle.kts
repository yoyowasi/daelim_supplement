import org.gradle.kotlin.dsl.*

pluginManagement {
    // flutter.sdk 경로를 읽어오기 위한 run 블록
    val flutterSdkPath = run {
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    plugins {
        id("com.google.gms.google-services") version "4.3.15"
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "1.8.22" apply false
}

rootProject.name = "daelim_supplement"
include(":app")
