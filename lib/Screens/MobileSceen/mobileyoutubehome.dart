import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtubedemo/Screens/MobileSceen/addbuttonscreen.dart';
import 'package:video_player/video_player.dart';

// Dummy data for demonstration; replace with your actual logic/data source.
final List<String> videoFiles = []; // List of video file paths or URLs.
final List<VideoPlayerController> videoControllers = []; // List of controllers for each video.

class Mobileyoutubehome extends ConsumerWidget {
  const Mobileyoutubehome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final  videoFiles = ref.watch(videoFileProvider);
  final videoControllers =ref.watch(videoPlayerControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.play_arrow, color: Colors.red, size: 40),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),

     body:  videoFiles.isEmpty
          ? Center(child: Text("No videos uploaded or taken yet"))
          : ListView.builder(
              itemCount: videoFiles.length,
              itemBuilder: (context, index) {
                final controller = videoControllers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: controller.value.isInitialized
                      ? GestureDetector(
                        onTap: (){
                          if (controller.value.isPlaying) {
                            controller.pause();
                            
                          }
                          else{
                            controller.play();
                          }
                        },
                        child: AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: VideoPlayer(controller),
                          ),
                      )
                      : CircularProgressIndicator(),
                );
              },
            ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.home_filled, color: Colors.white),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.video_label, color: Colors.white),
            ),
            label: "Shorts",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Addbuttonscreen()));
              },
              icon: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.video_library, color: Colors.white),
            ),
            label: "Subscription",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
              icon: CircleAvatar(backgroundColor: Colors.white),
            ),
            label: "You",
          ),
        ],
      ),
    );
  }
}
