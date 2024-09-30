import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> questions = [

    {
      "question": "Who is founder of Microsoft",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 1,
    },
    {
      "question": "Who is founder of Google",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 2,
    },
    {
      "question": "Who is founder of SpaceX",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 3,
    },
    {
      "question": "Who is founder of Apple",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 0,
    },
    {
      "question": "Who is founder of Core2web",
      "options": ["Shashi Sir", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswer": 0,
    },
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex =-1;
  int countScore =0;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex){
    if (selectedAnswerIndex !=-1){
      
      if(answerIndex ==questions[currentQuestionIndex]["correctAnswer"]){
        return const WidgetStatePropertyAll(Colors.green);
        
      }
      else if(selectedAnswerIndex ==answerIndex){
        return const WidgetStatePropertyAll(Colors.red); 
        
      }
      else{
        return const WidgetStatePropertyAll(null);
      }
    }
    else{
      return const WidgetStatePropertyAll(null);
    }
  }

  bool quetionPage = true;
  

  @override
  Widget build(BuildContext context) {
    
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen(){
    if(quetionPage == true){
      return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.orange,
          ),
        ),

        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          const SizedBox(
            height: 30,

          ),
          Row(
            children: [
              const SizedBox(
                width: 130,
              ),
              Text(
                "Question: ${currentQuestionIndex+1}/${questions.length}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              )

            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 380,
            height: 50,
            child: Text(questions[currentQuestionIndex]["question"],
            style: const TextStyle(
              fontSize:25,
              fontWeight: FontWeight.w600,
              color:Colors.purple,
            ),
            ),
          ),

          const SizedBox(
            height:50,
          ),
          SizedBox(
            height:50,
            width:350,

            child:ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(0),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex =0;
                  setState(() {});
                }
              }, 
            child: Text("A. ${questions[currentQuestionIndex]['options'][0]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),))
          ),

          const SizedBox(
             height:25,
          ),
          
          SizedBox(
            height:50,
            width:350,

            child:ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(1),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex =1;
                  setState(() {});
                }
              }, 
            child: Text("B. ${questions[currentQuestionIndex]['options'][1]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),))
          ),
          
          const SizedBox(
            height: 25,
          ),

          SizedBox(
            height:50,
            width:350,

            child:ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(2),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex =2;
                  setState(() {});
                }
              }, 
            child: Text("C. ${questions[currentQuestionIndex]['options'][2]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),))
          ),

          const SizedBox(
             height:25,
          ),
          
          SizedBox(
            height:50,
            width:350,

            child:ElevatedButton(
              style: ButtonStyle(
                backgroundColor: checkAnswer(3),
              ),
              onPressed: () {
                if(selectedAnswerIndex==-1){
                  selectedAnswerIndex =3;
                  setState(() {});
                }
              }, 
            child: Text("D. ${questions[currentQuestionIndex]['options'][3]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            ),
            ),
          ),

          
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed:(){
        if(selectedAnswerIndex == questions[currentQuestionIndex]['correctAnswer']){
        countScore++;
      }
        if(selectedAnswerIndex !=-1){
          if(currentQuestionIndex <questions.length-1){
            currentQuestionIndex++;
          }
          else{
           quetionPage=false;
          }
          selectedAnswerIndex =-1;
           setState((){}); 
        }
      },
      backgroundColor: Colors.blue,
      child: const Icon(
        Icons.forward,
        color:Colors.orange,
        ),
      ),
    );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Result",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network("https://static.vecteezy.com/system/resources/previews/032/999/982/non_2x/realistic-golden-trophy-ai-generative-free-png.png",
              height: 300,
              ),
              const SizedBox(
                height:30,
              ),
              const Text(
                "Congratulations",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 30),

              Text("Score : $countScore/${questions.length} ",
              style: const TextStyle(
                fontSize: 30,
              ),),
              
            ],
          ),
        ),
      );
    }
  }
}
       
