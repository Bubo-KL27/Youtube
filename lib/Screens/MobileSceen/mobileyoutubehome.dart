import 'package:cloud_firestore/cloud_firestore.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.play_arrow, color: Colors.red, size: 40),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.cast_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),

     body: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
      .collection('videos')
      .orderBy('uploaded_at', descending: true)
      .snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
    final docs = snapshot.data!.docs;
    if (docs.isEmpty) return Center(child: Text("No videos uploaded or taken yet"));
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final data = docs[index].data() as Map<String, dynamic>;
        final url = data['url'];
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoPlayer(VideoPlayerController.networkUrl(url)),
        );
      },
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
