
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Variable globale accessible par ce fichier et par le main.dart lors de l'import
final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

class NotificationScreen {
  // 🟢 Correction : "static", suppression du "get" et de l'égal (=) pour avoir une vraie méthode
  static Future<void> demanderPermission() async {
    final androidPlugin = localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      await androidPlugin.requestNotificationsPermission();
    }
  }

  // 🟢 Correction : Ajout du mot-clé "static" pour pouvoir l'appeler facilement partout
  static Future<void> afficherNotification() async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'id_canal_minimal',
      'Canal Minimal',
      importance: Importance.max,
      priority: Priority.high,
    );
    const LinuxNotificationDetails linuxDetails = LinuxNotificationDetails();

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      linux: linuxDetails,
    );

    // 🟢 Correction : La méthode show() prend des arguments positionnels, pas nommés !
    // Supprimez les "id:", "title:", etc.
    await localNotifications.show(
      id:0,                            // ID unique
      title:'Notification Minimale 📢',   // Titre
      body:'Test réussi avec succès !',  // Corps du texte
      notificationDetails:platformDetails,              // Détails de la plateforme
    );
  }
}
