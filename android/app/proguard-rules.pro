
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }

-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }


-keep class com.baseflow.googleapiavailability.** { *; }


-keepnames class * extends androidx.lifecycle.ViewModel
-keep class * extends io.flutter.plugin.common.MethodChannel { *; }

-keep class com.baseflow.permissionhandler.** { *; }

-dontwarn io.flutter.embedding.**
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

-keep class com.google.gson.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

-keep @androidx.annotation.Keep class * { *; }
-keepclassmembers class * { @androidx.annotation.Keep *; }

-dontwarn okhttp3.**
-dontwarn retrofit2.**
-dontwarn io.reactivex.**
-keepattributes SourceFile,LineNumberTable