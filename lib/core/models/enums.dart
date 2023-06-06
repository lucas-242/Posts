enum AppLanguage { en, pt }

enum AppPage {
  home(0),
  profile(1);

  final int value;
  const AppPage(this.value);

  static AppPage fromIndex(int value) {
    for (AppPage environment in AppPage.values) {
      if (environment.value == value) {
        return environment;
      }
    }

    return home;
  }
}
