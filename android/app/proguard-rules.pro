#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
# Keep rules for Google Play Core
-keep class com.google.android.play.core.** { *; }
-keepclassmembers class * {
    @com.google.android.play.core.splitinstall.SplitInstallManager *;
}
-dontwarn com.google.android.play.core.**
