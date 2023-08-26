import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bottomSheet() {
      return showModalBottomSheet(
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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  const SizedBox(
                    height: 60,
                    child: Center(
                      child: Text("Add Item"),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SheetSelection(
                          icon: const Icon(
                            Icons.image_outlined,
                            color: Colors.orange,
                          ),
                          text: "Photos",
                          onTap: () => null,
                        ),
                        SheetSelection(
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.green,
                          ),
                          text: "Camera",
                          onTap: () => null,
                        ),
                        SheetSelection(
                          icon: const Icon(
                            Icons.text_snippet_outlined,
                            color: Colors.blue,
                          ),
                          text: "Photos",
                          onTap: () => null,
                        ),
                        SheetSelection(
                          icon: const Icon(
                            Icons.folder_outlined,
                            color: Colors.purple,
                          ),
                          text: "Photos",
                          onTap: () => null,
                        ),
                        SheetSelection(
                          icon: const Icon(
                            Icons.file_copy_outlined,
                            color: Colors.red,
                          ),
                          text: "Photos",
                          onTap: () => null,
                        ),
                      ],
                    ),
                  ))
                ],
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
            const SizedBox(
              width: 5,
            ),
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
