import 'package:flutter/material.dart';
import 'package:layout/presentation/widgets/custom_button.dart';
import 'package:layout/presentation/widgets/text_field_widget.dart';
import 'package:layout/presentation/widgets/social_wall_widget.dart';

class SchedulerLayout extends StatefulWidget {
  const SchedulerLayout({super.key});

  @override
  State<SchedulerLayout> createState() => _SchedulerLayoutState();
}

class _SchedulerLayoutState extends State<SchedulerLayout> {
  String _postText = '';
  static const textSize = 16.0;
  static const textFieldHeight = 150.0;
  final charactersColor = Colors.grey[600];
  static const fillColor = Color(0xFFF0F0F0);
  static const borderSideColor = Colors.blue;
  static const textButtonColor = Colors.white;
  static const buttonColor = Color(0xFF292D32);
  static const textPadding = EdgeInsets.all(8.0);
  static const timeIcon = Icon(Icons.access_time);
  static const arrowBackIcon = Icon(Icons.arrow_back);
  static const personAddIcon = Icon(Icons.person_add);
  static const dateAndTimePadding = EdgeInsets.all(8);
  static const calendarIcon = Icon(Icons.calendar_today);
  final List<String> _users = ['George', 'Ben', 'Sasha'];
  static const charactersPadding = EdgeInsets.only(top: 8.0);
  static const horizontalPadding = EdgeInsets.symmetric(horizontal: 12);

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _postTextController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  Future<void> _openUserSelectionDialog(List<String> users) async {
    String? selectedUser = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select a user'),
          children: users.map((user) {
            return SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, user);
              },
              child: Text(user),
            );
          }).toList(),
        );
      },
    );

    if (selectedUser != null) {
      setState(() {
        _postTextController.text = '@$selectedUser ${_postTextController.text}';
        _postTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _postTextController.text.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: arrowBackIcon,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: textPadding,
                  child: Text(
                    "Message",
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
                TextFieldWidget(
                  height: textFieldHeight,
                  controller: _postTextController,
                  onChanged: (text) {
                    setState(() {
                      _postText = text;
                    });
                  },
                  suffixIcon: IconButton(
                    icon: personAddIcon,
                    onPressed: () {
                      _openUserSelectionDialog(_users);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: charactersPadding,
                    child: Text(
                      '${_postText.length} characters',
                      style: TextStyle(
                        color: charactersColor,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: dateAndTimePadding,
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        _selectDate();
                      },
                      controller: _dateController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: "Date",
                        fillColor: fillColor,
                        prefixIcon: calendarIcon,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: dateAndTimePadding,
                    child: TextField(
                      readOnly: true,
                      onTap: () {
                        _selectTime();
                      },
                      controller: _timeController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: "Time",
                        fillColor: fillColor,
                        prefixIcon: timeIcon,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide(color: borderSideColor)),
                      ),
                    ),
                  ),
                ),
                const SocialWallWidget(),
                TextFieldWidget(
                  labelText: 'Tags',
                  hintText: 'Enter tags separated by spaces',
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: CustomButton(
                    text: 'Schedule',
                    buttonColor: buttonColor,
                    textButtonColor: textButtonColor,
                    onPressed: () {
                      // TODO: Implement GraphQL call with information
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
