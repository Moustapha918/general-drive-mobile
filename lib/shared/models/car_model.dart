import 'dart:convert';

CarModel carModelFromJson(String str) => CarModel.fromJson(json.decode(str));

String carModelToJson(CarModel data) => json.encode(data.toJson());

class CarModel {
  CarModel({
    this.id,
    this.registrationNumber,
    this.brand,
    this.insuranceExpirationDate,
    this.modelYear,
    this.wheelsNbr,
    this.color,
    this.location,
    this.type,
    this.sellPrice,
    this.rentPrice,
    this.documents,
    this.bookings,
    this.images,
    this.owner,
  });

  CarModel.fromJson(dynamic json) {
    id = json['id'];
    registrationNumber = json['registrationNumber'];
    brand = json['brand'];
    insuranceExpirationDate = json['insuranceExpirationDate'];
    modelYear = json['modelYear'];
    wheelsNbr = json['wheelsNbr'];
    color = json['color'];
    location = json['location'];
    type = json['type'];
    sellPrice = json['sellPrice'];
    rentPrice = json['rentPrice'];
    if (json['documents'] != null) {
      documents = [];
      json['documents'].forEach((v) {
        documents?.add(Documents.fromJson(v));
      });
    }
    if (json['bookings'] != null) {
      bookings = [];
      json['bookings'].forEach((v) {
        bookings?.add(Bookings.fromJson(v));
      });
    }
    images = json['images'] != null ? json['images'].cast<String>() : [];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  num? id;
  String? registrationNumber;
  String? brand;
  String? insuranceExpirationDate;
  String? modelYear;
  num? wheelsNbr;
  String? color;
  String? location;
  String? type;
  num? sellPrice;
  num? rentPrice;
  List<Documents>? documents;
  List<Bookings>? bookings;
  List<String>? images;
  Owner? owner;

  CarModel copyWith({
    num? id,
    String? registrationNumber,
    String? brand,
    String? insuranceExpirationDate,
    String? modelYear,
    num? wheelsNbr,
    String? color,
    String? location,
    String? type,
    num? sellPrice,
    num? rentPrice,
    List<Documents>? documents,
    List<Bookings>? bookings,
    List<String>? images,
    Owner? owner,
  }) =>
      CarModel(
        id: id ?? this.id,
        registrationNumber: registrationNumber ?? this.registrationNumber,
        brand: brand ?? this.brand,
        insuranceExpirationDate:
            insuranceExpirationDate ?? this.insuranceExpirationDate,
        modelYear: modelYear ?? this.modelYear,
        wheelsNbr: wheelsNbr ?? this.wheelsNbr,
        color: color ?? this.color,
        location: location ?? this.location,
        type: type ?? this.type,
        sellPrice: sellPrice ?? this.sellPrice,
        rentPrice: rentPrice ?? this.rentPrice,
        documents: documents ?? this.documents,
        bookings: bookings ?? this.bookings,
        images: images ?? this.images,
        owner: owner ?? this.owner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['registrationNumber'] = registrationNumber;
    map['brand'] = brand;
    map['insuranceExpirationDate'] = insuranceExpirationDate;
    map['modelYear'] = modelYear;
    map['wheelsNbr'] = wheelsNbr;
    map['color'] = color;
    map['location'] = location;
    map['type'] = type;
    map['sellPrice'] = sellPrice;
    map['rentPrice'] = rentPrice;
    if (documents != null) {
      map['documents'] = documents?.map((v) => v.toJson()).toList();
    }
    if (bookings != null) {
      map['bookings'] = bookings?.map((v) => v.toJson()).toList();
    }
    map['images'] = images;
    if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    return map;
  }
}

Owner ownerFromJson(String str) => Owner.fromJson(json.decode(str));

String ownerToJson(Owner data) => json.encode(data.toJson());

class Owner {
  Owner({
    this.id,
    this.verified,
    this.active,
    this.registrationDate,
  });

  Owner.fromJson(dynamic json) {
    id = json['id'];
    verified = json['verified'];
    active = json['active'];
    registrationDate = json['registrationDate'];
  }

  num? id;
  bool? verified;
  bool? active;
  String? registrationDate;

  Owner copyWith({
    num? id,
    bool? verified,
    bool? active,
    String? registrationDate,
  }) =>
      Owner(
        id: id ?? this.id,
        verified: verified ?? this.verified,
        active: active ?? this.active,
        registrationDate: registrationDate ?? this.registrationDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['verified'] = verified;
    map['active'] = active;
    map['registrationDate'] = registrationDate;
    return map;
  }
}

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  Bookings({
    this.id,
    this.startDate,
    this.endDate,
    this.originLocation,
    this.destinationLocation,
    this.amount,
    this.creationDate,
    this.cancellationDate,
    this.status,
    this.reviews,
    this.payements,
    this.renter,
    this.vehicle,
  });

  Bookings.fromJson(dynamic json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    originLocation = json['originLocation'];
    destinationLocation = json['destinationLocation'];
    amount = json['amount'];
    creationDate = json['creationDate'];
    cancellationDate = json['cancellationDate'];
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
    if (json['payements'] != null) {
      payements = [];
      json['payements'].forEach((v) {
        payements?.add(Payements.fromJson(v));
      });
    }
    renter = json['renter'] != null ? Renter.fromJson(json['renter']) : null;
    vehicle = json['vehicle'];
  }

  num? id;
  String? startDate;
  String? endDate;
  String? originLocation;
  String? destinationLocation;
  num? amount;
  String? creationDate;
  String? cancellationDate;
  Status? status;
  List<Reviews>? reviews;
  List<Payements>? payements;
  Renter? renter;
  String? vehicle;

  Bookings copyWith({
    num? id,
    String? startDate,
    String? endDate,
    String? originLocation,
    String? destinationLocation,
    num? amount,
    String? creationDate,
    String? cancellationDate,
    Status? status,
    List<Reviews>? reviews,
    List<Payements>? payements,
    Renter? renter,
    String? vehicle,
  }) =>
      Bookings(
        id: id ?? this.id,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        originLocation: originLocation ?? this.originLocation,
        destinationLocation: destinationLocation ?? this.destinationLocation,
        amount: amount ?? this.amount,
        creationDate: creationDate ?? this.creationDate,
        cancellationDate: cancellationDate ?? this.cancellationDate,
        status: status ?? this.status,
        reviews: reviews ?? this.reviews,
        payements: payements ?? this.payements,
        renter: renter ?? this.renter,
        vehicle: vehicle ?? this.vehicle,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['startDate'] = startDate;
    map['endDate'] = endDate;
    map['originLocation'] = originLocation;
    map['destinationLocation'] = destinationLocation;
    map['amount'] = amount;
    map['creationDate'] = creationDate;
    map['cancellationDate'] = cancellationDate;
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (payements != null) {
      map['payements'] = payements?.map((v) => v.toJson()).toList();
    }
    if (renter != null) {
      map['renter'] = renter?.toJson();
    }
    map['vehicle'] = vehicle;
    return map;
  }
}

Renter renterFromJson(String str) => Renter.fromJson(json.decode(str));

String renterToJson(Renter data) => json.encode(data.toJson());

class Renter {
  Renter({
    this.id,
    this.active,
    this.verified,
    this.registrationDate,
    this.licenceExpirationDate,
    this.user,
  });

  Renter.fromJson(dynamic json) {
    id = json['id'];
    active = json['active'];
    verified = json['verified'];
    registrationDate = json['registrationDate'];
    licenceExpirationDate = json['licenceExpirationDate'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  num? id;
  bool? active;
  bool? verified;
  String? registrationDate;
  String? licenceExpirationDate;
  User? user;

  Renter copyWith({
    num? id,
    bool? active,
    bool? verified,
    String? registrationDate,
    String? licenceExpirationDate,
    User? user,
  }) =>
      Renter(
        id: id ?? this.id,
        active: active ?? this.active,
        verified: verified ?? this.verified,
        registrationDate: registrationDate ?? this.registrationDate,
        licenceExpirationDate:
            licenceExpirationDate ?? this.licenceExpirationDate,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['active'] = active;
    map['verified'] = verified;
    map['registrationDate'] = registrationDate;
    map['licenceExpirationDate'] = licenceExpirationDate;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.login,
    this.firstName,
    this.lastName,
    this.email,
    this.activated,
    this.langKey,
    this.imageUrl,
    this.resetDate,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    activated = json['activated'];
    langKey = json['langKey'];
    imageUrl = json['imageUrl'];
    resetDate = json['resetDate'];
  }

  num? id;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  bool? activated;
  String? langKey;
  String? imageUrl;
  String? resetDate;

  User copyWith({
    num? id,
    String? login,
    String? firstName,
    String? lastName,
    String? email,
    bool? activated,
    String? langKey,
    String? imageUrl,
    String? resetDate,
  }) =>
      User(
        id: id ?? this.id,
        login: login ?? this.login,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        activated: activated ?? this.activated,
        langKey: langKey ?? this.langKey,
        imageUrl: imageUrl ?? this.imageUrl,
        resetDate: resetDate ?? this.resetDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['login'] = login;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['activated'] = activated;
    map['langKey'] = langKey;
    map['imageUrl'] = imageUrl;
    map['resetDate'] = resetDate;
    return map;
  }
}

Payements payementsFromJson(String str) => Payements.fromJson(json.decode(str));

String payementsToJson(Payements data) => json.encode(data.toJson());

class Payements {
  Payements({
    this.id,
    this.amount,
    this.payementMethod,
    this.operation,
    this.date,
    this.status,
    this.booking,
  });

  Payements.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    payementMethod = json['payementMethod'];
    operation = json['operation'];
    date = json['date'];
    status = json['status'];
    booking = json['booking'];
  }

  num? id;
  num? amount;
  String? payementMethod;
  String? operation;
  String? date;
  String? status;
  String? booking;

  Payements copyWith({
    num? id,
    num? amount,
    String? payementMethod,
    String? operation,
    String? date,
    String? status,
    String? booking,
  }) =>
      Payements(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        payementMethod: payementMethod ?? this.payementMethod,
        operation: operation ?? this.operation,
        date: date ?? this.date,
        status: status ?? this.status,
        booking: booking ?? this.booking,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['payementMethod'] = payementMethod;
    map['operation'] = operation;
    map['date'] = date;
    map['status'] = status;
    map['booking'] = booking;
    return map;
  }
}

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));

String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews {
  Reviews({
    this.id,
    this.note,
    this.noteBase,
    this.comment,
    this.date,
    this.isOwnerReview,
    this.booking,
  });

  Reviews.fromJson(dynamic json) {
    id = json['id'];
    note = json['note'];
    noteBase = json['noteBase'];
    comment = json['comment'];
    date = json['date'];
    isOwnerReview = json['isOwnerReview'];
    booking = json['booking'];
  }

  num? id;
  num? note;
  num? noteBase;
  String? comment;
  String? date;
  bool? isOwnerReview;
  String? booking;

  Reviews copyWith({
    num? id,
    num? note,
    num? noteBase,
    String? comment,
    String? date,
    bool? isOwnerReview,
    String? booking,
  }) =>
      Reviews(
        id: id ?? this.id,
        note: note ?? this.note,
        noteBase: noteBase ?? this.noteBase,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        isOwnerReview: isOwnerReview ?? this.isOwnerReview,
        booking: booking ?? this.booking,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['note'] = note;
    map['noteBase'] = noteBase;
    map['comment'] = comment;
    map['date'] = date;
    map['isOwnerReview'] = isOwnerReview;
    map['booking'] = booking;
    return map;
  }
}

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    this.id,
    this.status,
    this.isCanceledByOwner,
  });

  Status.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    isCanceledByOwner = json['isCanceledByOwner'];
  }

  num? id;
  String? status;
  bool? isCanceledByOwner;

  Status copyWith({
    num? id,
    String? status,
    bool? isCanceledByOwner,
  }) =>
      Status(
        id: id ?? this.id,
        status: status ?? this.status,
        isCanceledByOwner: isCanceledByOwner ?? this.isCanceledByOwner,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['isCanceledByOwner'] = isCanceledByOwner;
    return map;
  }
}

Documents documentsFromJson(String str) => Documents.fromJson(json.decode(str));

String documentsToJson(Documents data) => json.encode(data.toJson());

class Documents {
  Documents({
    this.id,
    this.fileId,
    this.legend,
    this.fileName,
    this.extension,
    this.vehicle,
  });

  Documents.fromJson(dynamic json) {
    id = json['id'];
    fileId = json['fileId'];
    legend = json['legend'];
    fileName = json['fileName'];
    extension = json['extension'];
    vehicle = json['vehicle'];
  }

  num? id;
  String? fileId;
  String? legend;
  String? fileName;
  String? extension;
  String? vehicle;

  Documents copyWith({
    num? id,
    String? fileId,
    String? legend,
    String? fileName,
    String? extension,
    String? vehicle,
  }) =>
      Documents(
        id: id ?? this.id,
        fileId: fileId ?? this.fileId,
        legend: legend ?? this.legend,
        fileName: fileName ?? this.fileName,
        extension: extension ?? this.extension,
        vehicle: vehicle ?? this.vehicle,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fileId'] = fileId;
    map['legend'] = legend;
    map['fileName'] = fileName;
    map['extension'] = extension;
    map['vehicle'] = vehicle;
    return map;
  }
}
