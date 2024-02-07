
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'NutriCal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isFemale = true;

  void _changeGender() {
    setState(() {
      _isFemale = !_isFemale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Row(
                  children: [
                    Text('F', style: Theme.of(context).textTheme.headlineMedium,),
                    Switch(
                      value: _isFemale, 
                      onChanged: (value) {  _changeGender;},),
                    Text('M', style: Theme.of(context).textTheme.headlineMedium,),
                  ],
                  
                ),
              ),
              const SizedBox(height: 20),
             
             const HeigthForm(),          
              
            ],
          ),
        ),
      ),
    );
  }
}



// Create a Form widget.
class HeigthForm extends StatefulWidget {
  const HeigthForm({super.key});

  @override
  HeigthFormState createState() {
    return HeigthFormState();
  }
}

class HeigthFormState extends State<HeigthForm> {

  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _arController = TextEditingController();
  final _lrmController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Talla',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 18,),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Introduce la edad',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },  
            controller: _ageController,          
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Introduce la altura de rodilla',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _arController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Introduce longitud rodilla-maléolo externo(cm)',
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            controller: _lrmController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(                    
                    SnackBar(content: Text( getHeight(true, int.parse(_ageController.text), int.parse(_arController.text)).toString())),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Calcular'),
            ),
          ),
        ],
      ),
    );
  }
}

double getHeight(bool isFamele, int age, int ar)
{
  if(isFamele)
  {
    return 84.88 - (0.24 * age) + (1.83 * ar);
  }
  else
  {
    return 64.19 - (0.04 * age) + (2.02 * ar);
  }
}

double getHeightLRM(bool isFamele, int age, int lrm)
{
  if(isFamele)
  {
    return (lrm * 1.263) - (0.159 * age) + 107.7;
  }
  else
  {
    return (lrm * 1.121) - (0.117 * age) + 119.6;
  }
}