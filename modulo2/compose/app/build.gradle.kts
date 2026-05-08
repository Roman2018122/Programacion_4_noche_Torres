plugins {
    alias(libs.plugins.android.application)
<<<<<<< HEAD
    alias(libs.plugins.kotlin.android)
=======
>>>>>>> 46100c637cc812c039a3edcd1985828f9de3093a
    alias(libs.plugins.kotlin.compose)
}

android {
    namespace = "com.ute.compose"
    compileSdk {
<<<<<<< HEAD
        version = release(36)
=======
        version = release(36) {
            minorApiLevel = 1
        }
>>>>>>> 46100c637cc812c039a3edcd1985828f9de3093a
    }

    defaultConfig {
        applicationId = "com.ute.compose"
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
    buildFeatures {
        compose = true
    }
}

dependencies {
<<<<<<< HEAD
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.compose.ui.graphics)
    implementation(libs.androidx.compose.ui.tooling.preview)
    implementation(libs.androidx.compose.material3)
    testImplementation(libs.junit)
    androidTestImplementation(libs.androidx.junit)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.compose.ui.test.junit4)
    debugImplementation(libs.androidx.compose.ui.tooling)
    debugImplementation(libs.androidx.compose.ui.test.manifest)
=======
    implementation(platform(libs.androidx.compose.bom))
    implementation(libs.androidx.activity.compose)
    implementation(libs.androidx.compose.material3)
    implementation(libs.androidx.compose.material.icons.core)
    implementation(libs.androidx.compose.material.icons.extended)
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.compose.ui.graphics)
    implementation(libs.androidx.compose.ui.tooling.preview)
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    testImplementation(libs.junit)
    androidTestImplementation(platform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.compose.ui.test.junit4)
    androidTestImplementation(libs.androidx.espresso.core)
    androidTestImplementation(libs.androidx.junit)
    debugImplementation(libs.androidx.compose.ui.test.manifest)
    debugImplementation(libs.androidx.compose.ui.tooling)
    // ── ViewModel + StateFlow ──────────────────────────────────────────────
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.7")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.7")

    // ── Navigation Compose (Paso 3) ────────────────────────────────────────
    implementation("androidx.navigation:navigation-compose:2.8.5")

    // ── Retrofit + Gson (Paso 5) ───────────────────────────────────────────
    implementation("com.squareup.retrofit2:retrofit:2.11.0")
    implementation("com.squareup.retrofit2:converter-gson:2.11.0")

    // ── Coroutines (necesario para viewModelScope) ─────────────────────────
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.8.1")

    // ── Coil: carga de imágenes desde URL (Paso 5) ────────────────────────
    implementation("io.coil-kt:coil-compose:2.7.0")


>>>>>>> 46100c637cc812c039a3edcd1985828f9de3093a
}