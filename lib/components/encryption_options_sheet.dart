import 'package:flutter/material.dart';

class EncryptionOption {
  final String title;
  final String tag;
  final List<String> description;

  EncryptionOption(
      {required this.title, required this.tag, required this.description});
}

class EncryptionOptionsSheet extends StatefulWidget {
  final Function(int) onProceed;

  const EncryptionOptionsSheet({Key? key, required this.onProceed})
      : super(key: key);

  @override
  _EncryptionOptionsSheetState createState() => _EncryptionOptionsSheetState();
}

class _EncryptionOptionsSheetState extends State<EncryptionOptionsSheet> {
  int? _selectedOption;
  int _expandedIndex = 0;

  final List<EncryptionOption> _options = [
    EncryptionOption(
      title: "Standard Encryption",
      tag: "Free",
      description: [
        "Basic level encryption",
        "Suitable for personal use",
        "Limited file size support"
      ],
    ),
    EncryptionOption(
      title: "Advanced Encryption",
      tag: "Pro",
      description: [
        "Military-grade encryption",
        "Suitable for business use",
        "Unlimited file size support"
      ],
    ),
    EncryptionOption(
      title: "Custom Encryption",
      tag: "Enterprise",
      description: [
        "Customizable encryption algorithms",
        "Dedicated support team",
        "Compliance with industry standards"
      ],
    ),
    EncryptionOption(
      title: "Quantum Encryption",
      tag: "Experimental",
      description: [
        "Next-gen quantum-resistant algorithms",
        "Cutting-edge security features",
        "Early access to new technologies"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Choose Encryption Option",
            style: Theme.of(context).textTheme.labelLarge,
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
    );
  }

  Widget _buildAccordion(int index, EncryptionOption option) {
    bool isExpanded = _expandedIndex == index;
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              Text(option.title),
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
        if (isExpanded)
          Padding(
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
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    ),
                    Text("Agree to Terms & Conditions"),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
