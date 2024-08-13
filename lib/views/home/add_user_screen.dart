import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/user_controller.dart';
import 'package:user_manager/models/user_model.dart';
import 'package:user_manager/utils/constants.dart';

class AddUserScreen extends StatelessWidget {
  
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context, listen: false);
    final image = userController.image;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add a New User",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Constants.kheight20,
            Consumer<UserController>(
              builder: (context, userController, child) {
                final image = userController.image;
                return GestureDetector(
                  onTap: () {
                    userController.pickImage();
                  },
                  child: Align(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: image != null
                          ? FileImage(image)
                          : const AssetImage('assets/images/image.png')
                              as ImageProvider,
                      child: image == null
                          ? const Icon(Icons.camera_alt, color: Colors.white)
                          : null,
                    ),
                  ),
                );
              },
            ),
            Constants.kheight20,
            TextField(
              controller: userController.nameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Constants.kheight20,
            TextField(
              controller: userController.ageController,
              decoration: InputDecoration(
                labelText: "Enter Age",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                Constants.kwidth10,
                ElevatedButton(
                  onPressed: () {
                    final user = UserModel(
                      name: userController.nameController.text,
                      age: int.parse(userController.ageController.text),
                      imageUrl: image!.path,
                    );
                    userController.addUser(user);
                    userController.clearControllers();
                    userController.clearImage();
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(' Save '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
