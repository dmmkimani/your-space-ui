import 'package:flutter/material.dart';

class EditProfileBtn extends StatefulWidget {
  final Function _editProfile;

  const EditProfileBtn(this._editProfile, {Key? key}) : super(key: key);

  @override
  _EditProfileBtnState createState() => _EditProfileBtnState();
}

class _EditProfileBtnState extends State<EditProfileBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          widget._editProfile();
        },
        child: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}
