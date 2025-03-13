import 'package:test/test.dart';
import 'package:weatherapp/models/location.dart';

void main(){
  test("Testing Location Construction", testMockLocation);
  test("Testing toJson()", testToJson);
  test("testing fromJson()", testFromJson);
  test("testing location equality", testLocationEquality);
}

void testLocationEquality(){
  Location mockLocation = getMockLocation();
  Location mockLocation2 = getMockLocation();
  expect(mockLocation2, mockLocation);
}

void testFromJson(){
  Location mockLocation = getMockLocation();
  Map<String, dynamic> jsonMockLocation = mockLocation.toJson();
  expect(mockLocation.fromJson(jsonMockLocation).city, "Bend");
}

void testToJson(){
  Location mockLocation = getMockLocation();
  Map<String, dynamic> jsonMockLocation = mockLocation.toJson();
  expect(jsonMockLocation.entries, 6);
}

void testMockLocation(){
  Location mockLocation = getMockLocation();
  expect(mockLocation.city, "Bend"); 
}

Location getMockLocation(){
  return(
    Location(
      state: "Oregon",
      city: "Bend",
      zip: "97701",
      latitude: 44,
      longitude: 122,
      url: "www.bendisacity.com",
    )
  );
}