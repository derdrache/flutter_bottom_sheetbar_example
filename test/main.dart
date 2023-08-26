import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    bottomSheet() {
      return showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: 320,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: FractionallySizedBox(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    const SizedBox(
                      height: 60,
                      child: Center(
                          child: Text(
                        "Add item",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SheetSelection(
                              icon: const Icon(Icons.image_outlined,
                                  color: Colors.orange),
                              text: "Photos",
                              onTap: () => print("Photos")),
                          SheetSelection(
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.green,
                              ),
                              text: "Camera",
                              onTap: () => print("Camera")),
                          SheetSelection(
                              icon: const Icon(
                                Icons.text_snippet_outlined,
                                color: Colors.blue,
                              ),
                              text: "Notes",
                              onTap: () => print("Notes")),
                          SheetSelection(
                              icon: const Icon(
                                Icons.folder_outlined,
                                color: Colors.purple,
                              ),
                              text: "Files",
                              onTap: () => print("Files")),
                          SheetSelection(
                              icon: const Icon(
                                Icons.file_copy_outlined,
                                color: Colors.red,
                              ),
                              text: "Documents",
                              onTap: () => print("Documents")),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () => bottomSheet(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class SheetSelection extends StatelessWidget {
  final Icon icon;
  final String text;
  final void Function() onTap;

  const SheetSelection({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            const SizedBox(width: 5),
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
