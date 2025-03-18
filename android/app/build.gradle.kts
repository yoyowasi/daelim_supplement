plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // Google Services 플러그인은 legacy 방식으로 적용하거나 settings.gradle.kts에서 관리합니다.
}

android {
    namespace = "com.daelim.supplement_app"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.daelim.supplement_app"
        minSdk = 23
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.10.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
}

// legacy 방식으로 Google Services 플러그인 적용 apply(plugin = "com.google.gms.google-services")
