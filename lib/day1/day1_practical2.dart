import 'package:practice/globleVariable.dart';

/// User input List -> Make it reverse -> check palindrome -> check highest number
 
void day1Practical2(List<int> askList){
  if(askList.isEmpty){
    printF('List is Empty');
    return;
  }

  printF('User Input list: $askList');
  List<int> reverseList = [];
  for(int i=0;i<askList.length;i++){
    reverseList.add(askList[askList.length-i-1]);
  }
  printF('Reverse list: $reverseList');
  
  int highestNum = 0;
  bool palindrome = true;
  for(int i=0;i<askList.length;i++){
    if(highestNum < askList[i]){
      highestNum = askList[i];
    }
    if(askList[i] != reverseList[i]){
      palindrome = false;
    }
  }
  printF('Highest Number: $highestNum');
  if(palindrome == true){
    printF('Yes, This list is Palindrome.');
  }else{
    printF('No, This list is not Palindrome.');
  }
  
}

int? squareNumber(int num){
  if(num < 0) return null;
  int squareNum = num*num;
  return squareNum;
}

void sumList(){
  List<int> list1 = [1,3,52,63,41,52,63,41];
  List<int> list2 = [23,3,52,63,41,12,1,2,3];
  List<int> listSum = [];

  int maxLength  = 0;
  if(list2.length > list1.length){
    maxLength = list2.length;
    for(int i=0;i<maxLength-list1.length+1;i++){
      list1.add(0);
    }
  }else{
    maxLength = list1.length;
    for(int i=0;i<maxLength-list2.length+1;i++){
      list2.add(0);
    }
  }
  printF('list1 : ${list1.length} || list2: ${list2.length}');
  for(int i=0;i<maxLength;i++){
    listSum.add(list1[i]+list2[i]);
  }
  printF('Sum list = $listSum');

}

void evenList(){
  List<int> list1 = [1,3,52,63,41,52,63,41];
  List<int> listEven = [];
  for(int i=0;i<list1.length;i++){
    if(list1[i].isEven){
      listEven.add(list1[i]);
    }
  }
  printF('Even list = $listEven');
}

void countVowel(String name){
  List<String> nameList = name.split('');
  List<String> vowelList = [];
  bool isVowel(String ch) {
    const vowels = ['a', 'e', 'i', 'o', 'u'];
    return vowels.contains(ch.toLowerCase());
  }
  for (int i = 0; i < nameList.length; i++) {
    if (isVowel(nameList[i])) {
      vowelList.add(nameList[i]);
    }
  }
  printF('List of vowel: $vowelList');
}

class MapPerson{
  Map<String,dynamic> person ={};
  void savePerson(String name, String ageS) {
    int age = int.tryParse(ageS) ?? 0;
    person[name] = age;
  }
   void showPerson(){
    if(person.isEmpty){
      printF('List is empty');
      return;
    }
     printF('Person map: $person');
   }
   void youngestPerson(){
     if (person.isEmpty) {
       printF('No persons added.');
       return;
     }

     final youngest = person.entries.reduce(
           (a, b) => a.value <= b.value ? a : b,
     );

     printF("Youngest: ${youngest.key} (Age: ${youngest.value})");}
}