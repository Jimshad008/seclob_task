class MediaModel{
  String  filePath;
  String description;
  int likeCount;
  int commentCount;
  String createAt;
  String firstName;
  String lastName;
  String profilePic;

//<editor-fold desc="Data Methods">
  MediaModel({
    required this.filePath,
    required this.description,
    required this.likeCount,
    required this.commentCount,
    required this.createAt,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
  });


  MediaModel copyWith({
    String? filePath,
    String? description,
    int? likeCount,
    int? commentCount,
    String? createAt,
    String? firstName,
    String? lastName,
    String? profilePic,
  }) {
    return MediaModel(
      filePath: filePath ?? this.filePath,
      description: description ?? this.description,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      createAt: createAt ?? this.createAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'filePath': this.filePath,
      'description': this.description,
      'likeCount': this.likeCount,
      'commentCount': this.commentCount,
      'createAt': this.createAt,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'profilePic': this.profilePic,
    };
  }

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      filePath: map['filePath']??"",
      description: map['description']??"",
      likeCount: map['likeCount']??0,
      commentCount: map['commentCount']??0,
      createAt: map['createdAt'],
      firstName: map['firstName'] ??"",
      lastName: map['lastName']??"",
      profilePic: map['profilePic'] ??"",
    );
  }

//</editor-fold>
}