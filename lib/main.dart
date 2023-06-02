import 'package:flutter/material.dart';
import 'package:flutter_supabase/screens/splashScreen/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  /* Initializing supabase */
  // const String apiKey = 'https://jbmgacmmruhxfdozgsze.supabase.co';
  // const String password =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpibWdhY21tcnVoeGZkb3pnc3plIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODIzMTc3NjAsImV4cCI6MTk5Nzg5Mzc2MH0.iwE6qfnnzPcAJ8QP4NElGpzjOU4_FZ8493Lil5d2gkk';
  // await Supabase.initialize(url: apiKey, anonKey: password);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
