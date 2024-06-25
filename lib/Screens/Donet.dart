import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference donation =
      FirebaseFirestore.instance.collection('Donations');

  // Add
  Future<void> AddItem(
      String donation_name, String donation_quality, String donation_location) {
    return donation.add({
      'Donation Name': donation_name,
      'timestamp': Timestamp.now(),
      'Donation Quality': donation_quality,
      'Donation Location': donation_location
    });
  }

  // Get Donation
  Stream<QuerySnapshot> getDonation() {
    final donationStream =
        donation.orderBy('timestamp', descending: true).snapshots();
    return donationStream;
  }

  // UpDATE
  Future<void> updateDonation(String docID, String newDonation,
      String newDonation_quilty, String newDonation_location) {
    return donation.doc(docID).update({
      'Donation Name': newDonation,
      'timestamp': Timestamp.now(),
      'Donation Quality': newDonation_quilty,
      'Donation Location': newDonation_location
    });
  }

  //  DELATE
  Future<void> deleteDenation(String docID) {
    return donation.doc(docID).delete();
  }
}
