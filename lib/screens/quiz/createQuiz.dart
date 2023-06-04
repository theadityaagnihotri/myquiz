import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquiz/screens/quiz/indiQuiz.dart';

class CreateQuiz extends StatefulWidget {
  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    TextEditingController codeController = TextEditingController();
    TextEditingController questionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("Create Quiz"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: codeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a code";
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Enter Code",
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
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: questionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a code";
                          }
                          return null;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "No. of questions",
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
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => alert(
                                    code: codeController.text.trim(),
                                    questions: int.parse(
                                      questionController.text.trim(),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Submit",
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget alertDialog() {
  return const CupertinoAlertDialog(
    title: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

class alert extends StatefulWidget {
  String code;
  int questions;
  alert({required this.code, required this.questions});
  @override
  State<alert> createState() => _alertState(code: code, questions: questions);
}

Future<String> onSubmit(String code, int questions) async {
  try {
    // Fetch documents from the collection
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(code).limit(1).get();

    // Check if any document exists in the query snapshot
    if (querySnapshot.size == 0) {
      print("1");
      return "created";
    } else {
      print("0");
      return "no quiz";
    }
  } catch (e) {
    print("-1");
    return "error";
  }
}

class _alertState extends State<alert> {
  String code;
  int questions;
  _alertState({required this.code, required this.questions});
  int res = 0;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    String _returnString = await onSubmit(code, questions);

    if (_returnString == "created") {
      setState(() {
        res = 1;
      });
    } else if (_returnString == "no quiz") {
      setState(() {
        res = 2;
      });
    } else if (_returnString == "error") {
      setState(() {
        res = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal = alertDialog();
    switch (res) {
      case 1:
        print("2");
        retVal = CupertinoAlertDialog(
          title: Center(
            child: Text("Created Succesfully"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      IndividualQuiz(code: code, questions: questions),
                ),
              ),
              child: const Text('OK'),
            ),
          ],
        );
        break;
      case 2:
        print("3");
        retVal = CupertinoAlertDialog(
          title: Center(
            child: Text("Created Succesfully"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      IndividualQuiz(code: code, questions: questions),
                ),
              ),
              child: const Text('OK'),
            ),
          ],
        );
        break;
      case 3:
        print("4");
        retVal = CupertinoAlertDialog(
          title: Center(
            child: Text("Created Succesfully"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        IndividualQuiz(code: code, questions: questions),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
        break;
      default:
    }
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: retVal,
    );
  }
}
