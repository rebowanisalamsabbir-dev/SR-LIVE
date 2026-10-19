import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

void main() {
  runApp(const SRLiveApp());
}

class SRLiveApp extends StatelessWidget {
  const SRLiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VoiceRoomLoginScreen(),
    );
  }
}

class VoiceRoomLoginScreen extends StatefulWidget {
  const VoiceRoomLoginScreen({super.key});

  @override
  State<VoiceRoomLoginScreen> createState() => _VoiceRoomLoginScreenState();
}

class _VoiceRoomLoginScreenState extends State<VoiceRoomLoginScreen> {
  final userIdController = TextEditingController(
      text: 'user_${DateTime.now().millisecondsSinceEpoch.remainder(10000)}');
  final userNameController = TextEditingController(
      text: 'User_${DateTime.now().millisecondsSinceEpoch.remainder(10000)}');
  final roomIdController = TextEditingController(text: 'sr_live_room_101');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SR LIVE - Voice Room'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ভয়েস রুমে যুক্ত হতে আপনার নাম ও রুম আইডি দিন',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: roomIdController,
              decoration: const InputDecoration(
                labelText: 'Room ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LivePage(
                      userId: userIdController.text,
                      userName: userNameController.text,
                      roomId: roomIdController.text,
                    ),
                  ),
                );
              },
              child: const Text('ভয়েস রুমে প্রবেশ করুন (Join Room)',
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class LivePage extends StatelessWidget {
  final String userId;
  final String userName;
  final String roomId;

  const LivePage({
    super.key,
    required this.userId,
    required this.userName,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    const int appID = 354674722;
    const String appSign = "your_app_sign_here";

    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: appID,
        appSign: appSign,
        userID: userId,
        userName: userName,
        roomID: roomId,
        config: ZegoUIKitPrebuiltLiveAudioRoomConfig.host(),
      ),
    );
  }
}
