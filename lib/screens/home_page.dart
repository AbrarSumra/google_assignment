import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_assignment/models/signature_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selLanguage = "English (US)";
  String selConCode = "India";
  bool noSign = false;
  bool _fontWeightBool = false;
  bool _fontStyleBool = false;
  bool _fontUnderLineBool = false;
  double _fontSize = 14.0;
  FontWeight _fontWeight = FontWeight.normal;
  FontStyle _fontStyle = FontStyle.normal;
  TextDecoration _fontUnderLine = TextDecoration.none;

  /// For Color Picker
  Color defaultTextColor = Colors.black;
  Color signTextColor = Colors.black;

  void defaultTextChangeColor(Color color) {
    setState(() {
      defaultTextColor = color;
    });
  }

  void signTextChangeColor(Color color) {
    setState(() {
      signTextColor = color;
    });
  }

  List<SignatureModel> allSignature = [];

  TextEditingController signController = TextEditingController();
  TextEditingController signDesignController = TextEditingController();

  List<Widget> firstRow = List.generate(
    6,
    (index) => Icon(
      Icons.star,
      color: Colors.primaries[index],
    ),
  );

  List<Widget> secondRow = List.generate(
    6,
    (index) => Icon(
      Icons.star,
      color: Colors.primaries[index],
    ),
  );

  /// For Font Family
  String defaultFont = "Roboto";
  String signFont = "Roboto";
  List<String> defaultFontFamily = [
    'Roboto',
    'Lato',
    'Open Sans',
    'Montserrat',
    'Oswald',
    'Raleway',
    'Quicksand',
    'Poppins',
  ];

  List<String> languageList = [
    'Afrikaans',
    'Arabic',
    'Bengali',
    'Chinese',
    'English',
    'English (UK)',
    'English (US)',
    'French',
    'Hindi',
    'Portuguese',
    'Russian',
    'Spanish',
    'Urdu',
  ];

  List<String> countryCodeList = [
    'Australia',
    'Canada',
    'Chine',
    'Germany',
    'India',
    'Japan',
    'New Zealand',
    'Sweden',
    'Switzerland',
    'United States',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 21),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldTextMain(name: "Language:"),
                  const SizedBox(width: 250),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldTextMain(name: "Gmail display Language:"),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black26, width: 2),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: selLanguage,
                                icon: const Icon(
                                  CupertinoIcons.arrow_up_down_square,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                items: languageList
                                    .map(
                                      (String lan) => DropdownMenuItem<String>(
                                        value: lan,
                                        child: Text(
                                          lan,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selLanguage = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          customTextButton(
                            onTap: () {},
                            name:
                                "Change language setting for other google product",
                          ),
                        ],
                      ),
                      customTextButton(
                        name: "Show all language options",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 11),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldTextMain(name: "Phone number:"),
                  const SizedBox(width: 217),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          boldTextMain(name: "Default country code:"),
                          const SizedBox(width: 10),
                          Container(
                            height: 30,
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black26, width: 2),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: selConCode,
                                icon: const Icon(
                                  CupertinoIcons.arrow_up_down_square,
                                  color: Colors.blue,
                                  size: 20,
                                ),
                                items: countryCodeList
                                    .map(
                                      (String lan) => DropdownMenuItem<String>(
                                        value: lan,
                                        child: Text(
                                          lan,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selConCode = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 21),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldTextMain(name: "Default text style:"),
                      const Text(
                        "(Use the 'Remove formatting' button on the toolbar to\nreset the default text style)",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Container(
                    height: 116,
                    width: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          blurStyle: BlurStyle.solid,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 111,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: defaultFont,
                                  items: defaultFontFamily
                                      .map(
                                        (String fontFamily) => DropdownMenuItem(
                                          value: fontFamily,
                                          child: Text(
                                            fontFamily,
                                            style:
                                                GoogleFonts.getFont(defaultFont)
                                                    .copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      defaultFont = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                width: 8,
                                thickness: 0.5,
                              ),
                            ),
                            PopupMenuButton(
                              icon: const Icon(Icons.text_fields),
                              itemBuilder: (context) {
                                return [
                                  const PopupMenuItem(
                                    value: 14.0,
                                    child: Text(
                                      'Small',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 16.0,
                                    child: Text(
                                      'Normal',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 20.0,
                                    child: Text(
                                      'Large',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const PopupMenuItem(
                                    value: 24.0,
                                    child: Text(
                                      'Huge',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ];
                              },
                              onSelected: (value) {
                                setState(() {
                                  _fontSize = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                width: 8,
                                thickness: 0.5,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Pick a color'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: defaultTextColor,
                                          onColorChanged:
                                              defaultTextChangeColor,
                                          pickerAreaHeightPercent: 0.8,
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Done'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.text_format),
                            ),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                width: 8,
                                thickness: 0.5,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _fontSize = 14;
                                  defaultTextColor = Colors.black;
                                });
                              },
                              icon: const Icon(Icons.format_clear_outlined),
                            ),
                          ],
                        ),
                        Text(
                          "This is what your body text will look like.",
                          style: GoogleFonts.getFont(defaultFont).copyWith(
                            fontSize: _fontSize,
                            color: defaultTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 21),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Stars:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(width: 285),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Drag the stars between the lists.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextSpan(
                              text:
                                  " The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 11),
                      Row(
                        children: [
                          const Text(
                            "Presets:",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 50),
                          customTextButton(
                            onTap: () {},
                            name: "1 star",
                          ),
                          const SizedBox(width: 10),
                          customTextButton(
                            onTap: () {},
                            name: "4 star",
                          ),
                          const SizedBox(width: 10),
                          customTextButton(
                            onTap: () {},
                            name: "all star",
                          ),
                        ],
                      ),
                      const SizedBox(height: 11),
                      Row(
                        children: [
                          const Text(
                            "In use:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 60),
                          Row(children: firstRow),
                        ],
                      ),
                      const SizedBox(height: 11),
                      Row(
                        children: [
                          const Text(
                            "Not in use:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 31),
                          Row(children: secondRow),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 21),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldTextMain(name: "Signature:"),
                      const Text(
                        "(appended at the end of all outgoing messages)",
                        style: TextStyle(fontSize: 12),
                      ),
                      customTextButton(
                        onTap: () {},
                        name: "Learn more",
                      ),
                    ],
                  ),
                  const SizedBox(width: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      noSign
                          ? signContainer()
                          : const Text(
                              "No signature",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                      const SizedBox(height: 5),
                      ElevatedButton.icon(
                        onPressed: () {
                          customAlertBox();
                          signController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.square(45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.grey.shade400),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        label: const Text(
                          "Create new",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Text Button
  Widget customTextButton({
    required VoidCallback onTap,
    required String name,
  }) {
    return InkWell(
      onTap: onTap,
      child: Text(
        name,
        style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
      ),
    );
  }

  /// Text
  Widget boldTextMain({required String name}) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  /// Alert Dialog Box
  Future<dynamic> customAlertBox({
    String title = "",
    int id = 0,
    bool isUpdate = false,
  }) {
    signController.text = title;
    return showDialog(
        context: context,
        builder: (_) {
          return SizedBox(
            width: 1000,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: const Text(
                "Name new signature",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              content: TextFormField(
                maxLength: 320,
                controller: signController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  hintText: "Signature name",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (signController.text.isNotEmpty) {
                      if (isUpdate) {
                        setState(() {
                          noSign = true;
                          allSignature.add(SignatureModel(
                            signId: id,
                            title: signController.text.toString(),
                          ));
                        });
                      } else {
                        setState(() {
                          noSign = true;
                          allSignature.add(SignatureModel(
                            signId: 0,
                            title: signController.text.toString(),
                          ));
                        });
                      }
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade700),
                  child: const Text(
                    "Create",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  /// Sign Container
  Widget signContainer() {
    return Container(
      height: 184,
      width: 770,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 180,
                      child: ListView.builder(
                        itemCount: allSignature.length,
                        itemBuilder: (_, index) {
                          var title = allSignature[index];
                          return ListTile(
                            title: Text(title.title),
                            trailing: SizedBox(
                              width: 60,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      customAlertBox(
                                        isUpdate: true,
                                        id: title.signId,
                                        title: signController.text,
                                      );
                                      setState(() {});
                                    },
                                    child: const Icon(Icons.edit_outlined),
                                  ),
                                  const SizedBox(width: 11),
                                  InkWell(
                                    onTap: () {},
                                    child: const Icon(Icons.delete_outline),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 182,
                child: VerticalDivider(
                  thickness: 0.5,
                  width: 1,
                  color: Colors.black,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 380,
                    height: 120,
                    child: TextFormField(
                      style: GoogleFonts.getFont(signFont).copyWith(
                        fontSize: _fontSize,
                        fontFamily: signFont,
                        color: signTextColor,
                        fontWeight: _fontWeightBool
                            ? _fontWeight = FontWeight.bold
                            : _fontWeight = FontWeight.normal,
                        fontStyle: _fontStyleBool
                            ? _fontStyle = FontStyle.italic
                            : _fontStyle = FontStyle.normal,
                        decoration: _fontUnderLineBool
                            ? _fontUnderLine = TextDecoration.underline
                            : _fontUnderLine = TextDecoration.none,
                      ),
                      controller: signDesignController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  const SizedBox(
                    width: 567,
                    child: Divider(
                      thickness: 0.5,
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 111,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: signFont,
                              items: defaultFontFamily
                                  .map(
                                    (fontFamily) => DropdownMenuItem(
                                      value: fontFamily,
                                      child: Text(
                                        fontFamily,
                                        style: GoogleFonts.getFont(signFont)
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: fontFamily),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  signFont = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 8,
                            thickness: 0.5,
                          ),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.text_fields),
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value: 14.0,
                                child: Text(
                                  'Small',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 16.0,
                                child: Text(
                                  'Normal',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 20.0,
                                child: Text(
                                  'Large',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 24.0,
                                child: Text(
                                  'Huge',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 5,
                            thickness: 0.5,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _fontWeightBool = !_fontWeightBool;
                            });
                          },
                          icon: const Icon(CupertinoIcons.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _fontStyleBool = !_fontStyleBool;
                            });
                          },
                          icon: const Icon(CupertinoIcons.italic),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _fontUnderLineBool = !_fontUnderLineBool;
                            });
                          },
                          icon: const Icon(CupertinoIcons.underline),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Pick a color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: signTextColor,
                                      onColorChanged: signTextChangeColor,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Done'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.text_format),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 5,
                            thickness: 0.5,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.link),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.image_outlined),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 5,
                            thickness: 0.5,
                          ),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.format_align_left),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.format_align_left),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.format_align_center),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.format_align_right),
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.list_number),
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 5,
                            thickness: 0.5,
                          ),
                        ),
                        PopupMenuButton(
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.format_clear),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.format_quote),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.format_indent_increase),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon:
                                      const Icon(Icons.format_indent_decrease),
                                ),
                              ),
                              PopupMenuItem(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.format_list_bulleted_outlined),
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            setState(() {
                              _fontSize = value;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
