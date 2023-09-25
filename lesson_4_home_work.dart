class Song {
  late String title;
  late String artist;
  late int duration;
  late int releaseYear;

  Song(this.title, this.artist, this.duration, this.releaseYear);

  toString() =>
      'Title \'${this.title}\' by artist \'${this.artist}\' released in ${this.releaseYear}, duration ${this.duration} s';
}

class Playlist with SearchMixin {
  late String title;

  Playlist(this.title);

  List<Song> get songs => _songs;

  void addSong(Song song) {
    _songs.add(song);
  }
}

mixin SearchMixin {
  var _songs = <Song>[];

  Song? getSongByTitle(String title) {
    var result = _songs.where(
        (song) => song.title.toLowerCase().contains(title.toLowerCase()));
    return result.isNotEmpty ? result.first : null;
  }

  Song? getSongByArtist(String artist) {
    var result = _songs.where(
        (song) => song.artist.toLowerCase().contains(artist.toLowerCase()));
    return result.isNotEmpty ? result.first : null;
  }

  List<Song> getSongsBySearchText(String searchText) {
    return _songs
        .where((song) =>
            song.title.toLowerCase().contains(searchText.toLowerCase()) ||
            song.artist.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

extension PlaylistDuration on List<Song> {
  int getDuration() {
    return this.fold(0, (previous, song) => previous + song.duration);
  }
}

void main() {
  Playlist playlist = Playlist('myPlayList');

  playlist.addSong(Song('Summer', 'PinkFloyd', 400, 1986));
  playlist.addSong(Song('Spring', 'PinkFloyd', 300, 1986));
  playlist.addSong(Song('Winter', 'PinkFloyd', 250, 1986));
  playlist.addSong(Song('Autumn', 'PinkFloyd', 350, 1986));
  playlist.addSong(Song('Sunday', 'Queen', 420, 1981));
  playlist.addSong(Song('Monday', 'Queen', 430, 1987));
  playlist.addSong(Song('Tuesday', 'Queen', 400, 1986));
  playlist.addSong(Song('Wednesday', 'Queen', 400, 1986));
  playlist.addSong(Song('Thursday', 'Roxette', 400, 1986));
  playlist.addSong(Song('Friday', 'Sunday Morning', 400, 1986));

  print('Playlist \'${playlist.title}\' is represented by songs: ');
  playlist.songs.forEach(print);
  print('-----------------------------------------------------------------------------');
  print(
      'Whole playlist \'${playlist.title}\' has duration = ${playlist.songs.getDuration()} seconds');

  String findTitle = 'Su';
  Song? findSong = playlist.getSongByTitle(findTitle);
  print('I can found song by title \'$findTitle\': ${findSong ?? '0'}');

  String findArtist = 'Que';
  Song? findSongByArtist = playlist.getSongByArtist(findArtist);
  print('I can found song by artist \'$findArtist\': ${findSongByArtist ?? '0'}');

  String searchText = 'sunday';
  var findSongByText = playlist.getSongsBySearchText(searchText);
  print(
      'I can found songs by search text \'$searchText\': ${findSongByText.length}');
  print(
      'Filtered playlist by \'$searchText\' has duration = ${findSongByText.getDuration()} seconds');
}
