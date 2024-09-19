import 'package:flutter/material.dart';
import 'package:redact/monkey_face.dart';

class EncryptionOption {
  final String title;
  final String tag;
  final List<String> description;

  EncryptionOption({required this.title, required this.tag, required this.description});
}

class EncryptionOptionsSheet extends StatefulWidget {
  final Function(int) onProceed;

  const EncryptionOptionsSheet({Key? key, required this.onProceed}) : super(key: key);

  @override
  _EncryptionOptionsSheetState createState() => _EncryptionOptionsSheetState();
}

class _EncryptionOptionsSheetState extends State<EncryptionOptionsSheet> {
  int? _selectedOption;
  int _expandedIndex = 0;
  double _eyeOpenness = 1.0;

  final List<EncryptionOption> _options = [
    EncryptionOption(
      title: "Basic Redaction",
      tag: "Online / Offline",
      description: [
        "Patti lgaane vaala",
        "dekh lo kaam kre to",
        "kar jayega bharosa rkho"
      ],
    ),
    EncryptionOption(
      title: "Intermediate Redaction",
      tag: "Online / Offline",
      description: ["Thik thak security", "ha ha ha", "Kaam krega"],
    ),
    EncryptionOption(
      title: "Advanced Redaction",
      tag: "Online",
      description: [
        "Blockchain level security",
        "Kuchh Kuchh",
        "Aur v kuchh kuchh"
      ],
    ),
    EncryptionOption(
      title: "Non Recoverable Redaction",
      tag: "Online",
      description: [
        "Once redacted, the data cannot be recovered",
        "May not work as expected on all file types",
        "Kuch aur v likh do"
      ],
    ),
  ];

  void _updateEyeOpenness(int? option) {
    if (option != null) {
      setState(() {
        _selectedOption = option;
        _eyeOpenness = 1.0 - (option / (_options.length - 1));
      });
    }
  }

   @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Choose Redaction Option",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: 16),
                MonkeyFace(
                  eyeOpenness: _eyeOpenness,
                ),
                SizedBox(height: 16),
                ..._options.asMap().entries.map((entry) {
                  int index = entry.key;
                  EncryptionOption option = entry.value;
                  return _buildAccordion(index, option);
                }),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _selectedOption != null
                      ? () => widget.onProceed(_selectedOption!)
                      : null,
                  child: Text("Proceed"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
  Widget _buildAccordion(int index, EncryptionOption option) {
    bool isExpanded = _expandedIndex == index;
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(option.title),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  option.tag,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: () {
            setState(() {
              _expandedIndex = isExpanded ? -1 : index;
            });
          },
        ),
        AnimatedCrossFade(
          firstChild: SizedBox(height: 0),
          secondChild: _buildAccordionContent(option, index),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
        ),
      ],
    );
  }

  Widget _buildAccordionContent(EncryptionOption option, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...option.description.map((desc) => Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("• "),
                    Expanded(child: Text(desc)),
                  ],
                ),
              )),
          SizedBox(height: 8),
          Row(
            children: [
              Radio<int>(
                value: index,
                groupValue: _selectedOption,
                onChanged: (int? value) {
                  _updateEyeOpenness(value);
                },
              ),
              Text("Agree and would like to proceed"),
            ],
          ),
        ],
      ),
    );
  }
}