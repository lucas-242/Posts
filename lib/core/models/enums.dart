enum AppLanguage { en, pt }

enum AppPage {
  home(0),
  profile(1),
  addPost(2);

  const AppPage(this.value);

  final int value;

  static AppPage fromIndex(int value) {
    for (AppPage environment in AppPage.values) {
      if (environment.value == value) {
        return environment;
      }
    }

    return home;
  }
}
