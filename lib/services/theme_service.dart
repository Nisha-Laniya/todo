import '../utils/barrel_export.dart';

class ThemeService {
    final _box = GetStorage();
    final _key = 'isDarkMode';

    saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

    bool _loadThemeFromBox() => _box.read(_key) ?? false;

    ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

    void switchTheme() {
        Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
        saveThemeToBox(!_loadThemeFromBox());
    }
}