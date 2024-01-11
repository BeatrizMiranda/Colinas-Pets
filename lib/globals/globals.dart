bool isAdmin = false;
String token = '';
String userName = '';

final String getHumans = "/human";
final String getAnimals = "/animals";

// void getHumans() async {
//   DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");
//   final ref = FirebaseDatabase.instance.ref();
//   final snapshot = await ref.child('users/$userId').get();
//   if (snapshot.exists) {
//     print(snapshot.value);
//   } else {
//     print('No data available.');
//   }
// }

// void showSuccessMessage(BuildContext context, String message) async {
//   await showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       title: Text(message),
//       actions: <Widget>[
//         FlatButton(onPressed: () => Navigator.pop(ctx), child: const Text("Ok"))
//       ],
//     ),
//   );
//   Navigator.pop(context);
// }

// void showFailMessage(BuildContext context, String message,
//     {String path = ''}) async {
//   await showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       title: Text(message),
//       actions: <Widget>[
//         FlatButton(
//             onPressed: () => (path == '')
//                 ? Navigator.pop(context)
//                 : Navigator.pushReplacementNamed(context, path),
//             child: const Text("Ok"))
//       ],
//     ),
//   );
//   Navigator.pop(context);
// }
