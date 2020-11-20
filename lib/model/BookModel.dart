
class BookModel {
  int id;
  String title;
  String createdAt;
  String updatedAt;
  String deadline;
  int ownerId;
  Status status;
  int readerId;

  BookModel(this.id, this.title, this.createdAt, this.updatedAt, this.deadline, this.ownerId, this.status, this.readerId);
}

enum Status {
  AVAILABLE, TAKEN
}