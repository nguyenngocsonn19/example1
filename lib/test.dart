import 'dart:io';

class Music {
  late String title;
  late String artist;
  late int duration; // in seconds

  Music(this.title, this.artist, this.duration);
}

class MusicController {
  List<Music> musicList = [];

  void addMusic(Music music) {
    musicList.add(music);
  }

  void updateMusic(int index, Music music) {
    if (index >= 0 && index < musicList.length) {
      musicList[index] = music;
    }
  }

  void deleteMusic(int index) {
    if (index >= 0 && index < musicList.length) {
      musicList.removeAt(index);
    }
  }

  Music getMusic(int index) {

    if (index >= 0 && index < musicList.length) {
      return musicList[index];
    }
    return Music("", "", 0); // Return an empty music object if index is invalid
  }

  List<Music> getAllMusic() {
    return musicList;
  }
}

void main() {
  var musicController = MusicController();

  while (true) {
    print("1. Add music");
    print("2. Update music");
    print("3. Delete music");
    print("4. Display all music");
    print("5. Exit");

    var choice = int.parse(stdin.readLineSync()!);
    try {
      switch (choice) {
        case 1:
          print("Enter music title:");
          var title = stdin.readLineSync();
          print("Enter artist:");
          var artist = stdin.readLineSync();
          print("Enter duration (seconds):");
          var duration = int.parse(stdin.readLineSync()!);


          var newMusic = Music(title!, artist!, duration);

          musicController.addMusic(newMusic);
          print("Music added");

          break;

        case 2:
          if (musicController.musicList.isEmpty) {
            print("Music is empty");
          } else {
            print("Enter index of music to update:");
            var index = int.parse(stdin.readLineSync()!);
            if (index >= 0 && index < musicController.musicList.length) {
              print("Enter new music title:");
              var newTitle = stdin.readLineSync();
              print("Enter new artist:");
              var newArtist = stdin.readLineSync();
              print("Enter new duration (seconds):");
              var newDuration = int.parse(stdin.readLineSync()!);

              var updatedMusic = Music(newTitle!, newArtist!, newDuration);
              musicController.updateMusic(index, updatedMusic);
              print("Music updated");
            } else {
              print("Invalid index");
            }
          }

          break;

        case 3:
          if (musicController.musicList.isEmpty) {
            print("Music is empty");
            break;
          }
            print("Enter index of music to delete:");
            var index = int.parse(stdin.readLineSync()!);
            if (index >= 0 && index < musicController.musicList.length) {
              musicController.deleteMusic(index);
              print("Music deleted");
            } else {
              print("Invalid index");
            }


          break;

        case 4:
          if (musicController.musicList.isEmpty) {
            print("Music is empty");
          } else {
            print("All Music:");
            for (var index = 0; index <
                musicController.musicList.length; index++) {
              var music = musicController.getMusic(index);

              print("$index. ${music.title} by ${music.artist} (${music
                  .duration} seconds)");
            }
          }
          break;

        case 5:
          print("Exit program");
          return;

        default:
          print("Choose not found");
      }
    }catch(e){
      print("Please enter init");
    }
  }
}
