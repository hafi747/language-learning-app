import 'package:flutter/material.dart';

class ForumScreen extends StatefulWidget {
  @override
  _ForumScreenState createState() => _ForumScreenState();
}

class _ForumScreenState extends State<ForumScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _posts = [];

  void _addPost() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _posts.insert(0, _controller.text.trim());
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Forum')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Share something...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addPost,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child:
                  _posts.isEmpty
                      ? Center(child: Text('No posts yet.'))
                      : ListView.builder(
                        itemCount: _posts.length,
                        itemBuilder:
                            (context, index) => Card(
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(_posts[index]),
                              ),
                            ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
