import 'package:flutter/material.dart';

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({Key? key}) : super(key: key);

  @override
  _MyExpansionPanelListState createState() => _MyExpansionPanelListState();
}
class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  final List<Map<String, dynamic>> _items = List.generate(10,(index) => {
            "id": index,
            "title": "Item $index",
            "content":
                "This is the main content of item $index."
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Page View Expansion Tile')),
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) {
              final item = _items[index];
              return Card(
                key: PageStorageKey(item['id']),
                color: Color.fromARGB(255, 3, 116, 14),
                elevation: 4,
                child: ExpansionTile(
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    childrenPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    children: [
                      Text(item['content'],
                          style: const TextStyle(color: Colors.white)),
                      // This button is used to remove this item
                    ]),
              );
            }));
  }
}
