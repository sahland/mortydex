enum PAGES { root, characters, favorites }

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.characters:
        return '/characters';
      case PAGES.favorites:
        return '/favorites';
      default:
        return '/';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.characters:
        return 'CHARACTERS';
      case PAGES.favorites:
        return 'FAVORITES';
      default:
        return 'ROOT';
    }
  }
}
