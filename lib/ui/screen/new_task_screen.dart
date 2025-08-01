import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/screen/add_new_task_screen.dart';
import 'package:tm_app_with_firebase/ui/widgets/Task_card.dart';
import 'package:tm_app_with_firebase/ui/widgets/task_summary_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const TaskCard();
              }, separatorBuilder: (BuildContext context, int index) { 
                return const SizedBox(height: 8);
               },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapFab,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(title: 'New Tasks', count: 09),
            TaskSummaryCard(title: 'Completed', count: 09),
            TaskSummaryCard(title: 'Cancelled', count: 09),
            TaskSummaryCard(title: 'In Progress', count: 09),
          ],
        ),
      ),
    );
  }

  void _onTapFab() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
    );
  }
}

