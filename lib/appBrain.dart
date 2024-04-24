import 'question.dart';

class AppBrain {
  int _questionNb = 0;
  List<Question> _questionGroup = [
    Question("The number of planets in the solar system is 8?",
        'images/image-1.jpg', true),
    Question("Cats are reptiles?", 'images/image-2.jpg', true),
    Question("China is located on the African continent?", 'images/image-3.jpg',
        false),
    Question("Earth is flat?", 'images/image-4.jpg', false),
    Question(
        "Human can survive without eating meat?", 'images/image-5.jpg', true),
    Question(
        "The sun revolves around the earth and the earth revolves around the moon",
        'images/image-6.jpg',
        false),
    Question("Animals don't feel pain?", 'images/image-7.jpg', false),
  ];

  void setQuestNb() {
    if (_questionNb < _questionGroup.length - 1) _questionNb++;
  }

  String getQuestText() {
    return _questionGroup[_questionNb].questionText;
  }

  String getQuestImage() {
    return _questionGroup[_questionNb].questionImage;
  }

  bool getQuestAnswer() {
    return _questionGroup[_questionNb].questionAnswer;
  }

  bool ending() {
    if (_questionNb >= _questionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNb = 0;
  }
}
