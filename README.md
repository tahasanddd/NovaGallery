# Nova Gallery (`com.novagallery.app`)

A local-first, zero-telemetry Android Gallery built with **Kotlin**, **Jetpack Compose**, **Material 3**, **MVVM + StateFlow**, **Room**, **MediaStore**, **Coil**, and **Media3 ExoPlayer** (Min SDK 26 / Android 8.0 through Target SDK 35 / Android 15).

---

## Shortest Path to Obtain & Install the APK (No Android Studio Required)

1. **Create a New GitHub Repository**
   - Open [github.com/new](https://github.com/new) in your browser (or mobile browser) and create a repository named `nova-gallery`.
2. **Upload Project Files**
   - Upload the contents of this project folder (including `.github/workflows/build-apk.yml`, `app/`, `gradle/`, `build.gradle.kts`, `settings.gradle.kts`, and `gradle.properties`) to the repository and commit to `main`.
3. **Automatic Cloud Build via GitHub Actions**
   - Click the **Actions** tab in your GitHub repository.
   - The **Build Nova Gallery APK** workflow runs automatically on push (or via the **Run workflow** button) and compiles the project in ~2.5 minutes on Ubuntu cloud runners.
4. **Download & Install on Your Android Phone**
   - Open the completed workflow run and scroll down to **Artifacts**.
   - Download **`app-debug`** (contains `app-debug.apk`, which is pre-signed with a debug certificate and ready to install immediately on any Android 8.0+ phone).
   - Open `app-debug.apk` on your Android device and tap **Install**.

---

## How to Sign `app-release-unsigned.apk` Later (Optional)

The workflow also builds `app-release-unsigned.apk` with R8 code shrinking and resource optimization enabled, without exposing any fake signing keys. To sign a production release APK with your own private key:

```bash
# 1. Generate your personal keystore once (using JDK keytool)
keytool -genkey -v -keystore nova-release.jks -keyalg RSA -keysize 2048 -validity 10000 -alias nova

# 2. Align and sign the unsigned release APK using Android build-tools apksigner
zipalign -v -p 4 app-release-unsigned.apk NovaGallery-release-aligned.apk
apksigner sign --ks nova-release.jks --out NovaGallery-release.apk NovaGallery-release-aligned.apk
```
