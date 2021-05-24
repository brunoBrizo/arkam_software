import 'package:arkam_software/logic/remote_services.dart';
import 'package:arkam_software/utilities/helpers.dart';
import 'package:arkam_software/utilities/strings.dart';
import 'package:flutter/material.dart';
import 'package:arkam_software/components/default_button.dart';
import 'package:arkam_software/models/project_email.dart';
import 'package:arkam_software/utilities/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({
    Key key,
  }) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _projectType = [
    'Mobile App',
    'Web App',
    'Portfolio',
    'Hosting'
  ];
  List<DropdownMenuItem<String>> _dropDownProjectItems;
  String _selectedProject;

  @override
  void initState() {
    super.initState();
    _dropDownProjectItems = getDropDownProjectItems();
    _selectedProject = 'Mobile App';
  }

  List<DropdownMenuItem<String>> getDropDownProjectItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String project in _projectType) {
      items.add(new DropdownMenuItem(value: project, child: new Text(project)));
    }
    return items;
  }

  void changedDropDownProjectItem(String selectedProject) {
    print("Selected project $selectedProject");
    setState(() {
      _selectedProject = selectedProject;
    });
  }

  TextEditingController _projectDescriptionController =
      new TextEditingController();
  TextEditingController _clientEmailController = new TextEditingController();
  TextEditingController _clientNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String language = getLanguage(context);
    //double height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Wrap(
        spacing: kDefaultPadding * 2.5,
        runSpacing: kDefaultPadding * 1.5,
        children: [
          SizedBox(
            width: width * 0.8,
            child: DropdownButton(
              iconSize: 30.0,
              hint: Text('Project Type'),
              value: _selectedProject,
              items: _dropDownProjectItems,
              onChanged: changedDropDownProjectItem,
            ),
          ),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: _clientNameController,
              onChanged: (value) {},
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                //labelText: "Your Name",
                hintText: kNameHint(language),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return (kNameEmptyError(language));
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            width: width * 0.8,
            child: TextFormField(
              controller: _clientEmailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: InputDecoration(
                //labelText: "Email Address",
                hintText: kEmailHint(language),
              ),
              validator: (value) {
                print(_clientEmailController.text);
                if (value.isEmpty) {
                  return (kEmailEmptyError(language));
                } else if (!EmailValidator.validate(
                    _clientEmailController.text)) {
                  return (kEmailInvalidError(language));
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            // height: 300,
            // TextField by default cover the height, i tryed to fix this problem but i cant
            child: TextFormField(
              controller: _projectDescriptionController,
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              decoration: InputDecoration(
                // labelText: "Description",
                hintText: kDescriptionHint(language),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return (kDescriptionEmptyError(language));
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
          Center(
            child: FittedBox(
              child: DefaultButton(
                imageSrc: "lib/images/contact_icon.png",
                text: kContactButton(language),
                press: () async {
                  if (_formKey.currentState.validate()) {
                    _sendEmail(
                        _clientNameController.text,
                        _clientEmailController.text,
                        _projectDescriptionController.text,
                        _selectedProject,
                        language);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _sendEmail(String clientName, String clientEmail, String projectDescription,
      String projectType, String language) async {
    Email email = new Email();
    email.client = new Client();
    email.client.clientEmail = clientEmail;
    email.client.clientName = clientName;
    email.client.projectDescription = projectDescription;
    email.client.projectName = projectType;
    email.ishtml = true;
    email.mailto = ['bbrizolara7@gmail.com'];
    email.subject = 'Arkam Software Contact Form';

    await RemoteServices.sendEmail(email);
    Fluttertoast.showToast(
        msg: kToastResponse(language),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        webPosition: "center",
        fontSize: 16.0);

    _clientEmailController.text = '';
    _clientNameController.text = '';
    _projectDescriptionController.text = '';
  }
}
