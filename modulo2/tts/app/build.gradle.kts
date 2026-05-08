plugins {
    alias(libs.plugins.android.application)
<<<<<<< HEAD
    alias(libs.plugins.kotlin.android)
}

android {
    namespace = "com.ute.tts"
    compileSdk {
        version = release(36)
    }

    defaultConfig {
        applicationId = "com.ute.tts"
=======
}

android {
    namespace = "com.example.tts"
    compileSdk {
        version = release(36) {
            minorApiLevel = 1
        }
    }

    defaultConfig {
        applicationId = "com.example.tts"
>>>>>>> 46100c637cc812c039a3edcd1985828f9de3093a
        minSdk = 24
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }
<<<<<<< HEAD
    kotlinOptions {
        jvmTarget = "11"
    }
=======
>>>>>>> 46100c637cc812c039a3edcd1985828f9de3093a
}

dependencies {
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.material)
    implementation(libs.androidx.activity)
    implementation(libs.androidx.constraintlayout)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
}