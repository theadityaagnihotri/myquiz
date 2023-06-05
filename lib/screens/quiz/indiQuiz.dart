import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:image_picker/image_picker.dart';

class IndividualQuiz extends StatefulWidget {
  String code;
  int questions;
  IndividualQuiz({super.key, required this.code, required this.questions});

  @override
  State<IndividualQuiz> createState() =>
      _IndividualQuizState(code: code, questions: questions);
}

class _IndividualQuizState extends State<IndividualQuiz> {
  String code;
  int questions;
  _IndividualQuizState({required this.code, required this.questions});

  List<GlobalKey<FormState>> formKeys = [];
  List<TextEditingController> controllers = [];
  Map<int, XFile?> fileControllers = {};
  Map<int, bool> disab = {};
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Complete creating quiz first.',
            ),
            backgroundColor: Color.fromARGB(255, 97, 194, 162),
          ),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          title: Text(code),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: questions + 1,
          itemBuilder: (context, int index) {
            if (index < questions) {
              formKeys.add(GlobalKey<FormState>());
              for (int i = 5 * index; i < 5 * index + 5; i++) {
                controllers.add(TextEditingController());
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formKeys[index],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextFormField(
                                readOnly: controllers[5 * index].text == ''
                                    ? false
                                    : true,
                                // controller: fileControllers[index] != null
                                //     ? TextEditingController(
                                //         text: "Image Uploaded")
                                //     : controllers[5 * index ],

                                controller: controllers[5 * index],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          fileControllers[index] = image;
                                          controllers[5 * index].text =
                                              image.name;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  labelText:
                                      'Question ' + (index + 1).toString(),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                readOnly: controllers[5 * index + 1].text == ''
                                    ? false
                                    : true,
                                controller: controllers[5 * index + 1],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          fileControllers[index] = image;
                                          controllers[5 * index + 1].text =
                                              image.name;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  labelText: 'Option 1',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                readOnly: controllers[5 * index + 2].text == ''
                                    ? false
                                    : true,
                                controller: controllers[5 * index + 2],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          fileControllers[index] = image;
                                          controllers[5 * index + 2].text =
                                              image.name;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  labelText: 'Option 2',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                readOnly: controllers[5 * index + 3].text == ''
                                    ? false
                                    : true,
                                controller: controllers[5 * index + 3],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          fileControllers[index] = image;
                                          controllers[5 * index + 3].text =
                                              image.name;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  labelText: 'Option 3',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                readOnly: controllers[5 * index + 4].text == ''
                                    ? false
                                    : true,
                                controller: controllers[5 * index + 4],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter a value";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final XFile? image =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (image != null) {
                                        setState(() {
                                          fileControllers[index] = image;
                                          controllers[5 * index + 4].text =
                                              image.name;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      Icons.file_upload_outlined,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                  labelText: 'Option 4',
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return Scaffold(
                            backgroundColor: Theme.of(context).canvasColor,
                            body: CupertinoAlertDialog(
                              title: Text("Added succesfully"),
                            ),
                          );
                        }),
                      );
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 97, 194, 162),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
