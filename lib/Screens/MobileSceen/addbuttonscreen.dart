import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

// Providers

final videoFileProvider = StateProvider<List<File>>((ref) => []);

final videoPlayerControllerProvider = StateProvider<List<VideoPlayerController>>((ref)=>[]);



class Addbuttonscreen extends ConsumerWidget {
  const Addbuttonscreen({super.key});

  

  Future<void> _pickVideoFromGallery(WidgetRef ref) async {
    final pickfile = await FilePicker.platform.pickFiles(type: FileType.video, allowMultiple: true);
    if (pickfile != null && pickfile.files.isNotEmpty) {
      // Handle the picked files here, for example:
      final files = pickfile.paths.map((path)=>File(path!)).toList();
      // Assuming you want to use the first file
      final controller = <VideoPlayerController>[];
      for(var file in files){
        final videoController = VideoPlayerController.file(file);
        await videoController.initialize();
        videoController.setLooping(false);
        videoController.play();
        controller.add(videoController);
      }
      ref.read(videoFileProvider.notifier).state = files;
      // Assuming you want to use the first file
      ref.read(videoPlayerControllerProvider.notifier).state =controller;
      // You can also use the file path to display the video or perform other actions
    }
  }

  Future<void> _takevideofromcamera(WidgetRef ref) async {
    final picker = ImagePicker();
  final pickedFile = await picker.pickVideo(source: ImageSource.camera);
  if (pickedFile != null) {
    final file = File(pickedFile.path);
    final videocontroller = VideoPlayerController.file(file);
    await videocontroller.initialize();
    videocontroller.setLooping(true);
    videocontroller.play();

    final files = [...ref.read(videoFileProvider)];
    final controllers = [...ref.read(videoPlayerControllerProvider)];
    files.add(file);
    controllers.add(videocontroller);

    ref.read(videoFileProvider.notifier).state = files;
    ref.read(videoPlayerControllerProvider.notifier).state = controllers;
  }
  }
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final videoFile = ref.watch(videoFileProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
           
              TextButton.icon(
                onPressed: () => _takevideofromcamera(ref),
                icon: Icon(Icons.video_label_outlined),
                label: Text("Take video"),
              ),
              TextButton.icon(
                onPressed: () => _pickVideoFromGallery(ref),
                icon: Icon(Icons.video_library),
                label: Text("upload video"),
              ),
              videoFile.isNotEmpty?
              Text("uploaded video")
             
              :Text("please select video"),
                  
            ],
          ),
        ),
      ),
    );
  }
}