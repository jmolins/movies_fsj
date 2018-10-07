class AppState {
  List<int> favorite = [];

  addFavorite(int id) {
    if (!favorite.contains(id)) favorite.add(id);
  }

  removeFavorite(int id) {
    if (favorite.contains(id)) favorite.remove(id);
  }

  bool isFavorite(int id) {
    return favorite.contains(id);
  }
}

AppState appState = AppState();
