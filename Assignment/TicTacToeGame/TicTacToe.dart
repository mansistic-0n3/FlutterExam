import 'package:flutter/material.dart';
import 'package:try_app/BCIIT/Assignment/TicTacToeGame/alertDialog.dart';
import 'package:try_app/BCIIT/Assignment/TicTacToeGame/constraints.dart';

class TicTac extends StatefulWidget{
  const TicTac ({super.key});

  @override
  State<TicTac> createState() => _TicTac();
}

class _TicTac extends State<TicTac>{
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnofO = true;
  int _filledBoxes = 0;

  final List<String> _XorOList = [
    '','','',
    '','','',
    '','',''
  ];

   void _clearBoard(){
    setState(() {
      for(int i = 0; i<9; i++){
        _XorOList[i] ='';
      }
    });
    _filledBoxes=0;
  }

  void _clearGame(){
    setState(() {
      for(int i = 0; i<9; i++){
        _XorOList[i] ='';
        _scoreX = 0;
        _scoreO = 0;
      }
    });
    _filledBoxes=0;
  }


  @override
  Widget build(BuildContext context){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 18, 20, 33),
          actions: [
            IconButton(
            onPressed: () {
              _clearBoard();
            }, 
            icon: Icon(Icons.refresh)
            ),
           IconButton(
            onPressed: () {
              _clearGame();
            }, 
            icon: Icon(Icons.stop)
            ),
            ],
          title: Text("Tic - Tac - Toe",
          style:  kCustomText(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
       ),
        ),
        backgroundColor: Color.fromARGB(255, 26, 29, 46),
       body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
       ),
      ),
      );
  }

  Widget _buildPointsTable(){
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Player O',
                  style: kCustomText(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color:  Colors.red[400],
                  ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    _scoreO.toString(),
                    style: kCustomText(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),

              ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Player X',
                  style: kCustomText(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.green[400],
                  ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    _scoreX.toString(),
                    style: kCustomText(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  ),
              ],
              ),
            ),

          ],
        ),
      ),
      );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( 
          crossAxisCount: 3,
          ),
           itemBuilder: (BuildContext context, int  index) {
             return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: Center(
                  child: Text(
                    _XorOList[index],
                    style: TextStyle(
                      color: _XorOList[index] == 'x' ? Colors.green[400] : Colors.red[400],
                      fontSize: 40,
                    ),
                  ),
                  ),
              ),
             );
           })
           );
  }

  Widget _buildTurn(){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            _turnofO ? 'Turn of O' : 'Turn of X',
            style: kCustomText(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  void _tapped(int index){
    setState(() {
      if(_turnofO && _XorOList[index] == ''){
        _XorOList[index] = 'o';
        _filledBoxes += 1;
      } else if(!_turnofO && _XorOList[index] == ''){
        _XorOList[index] = 'x';
        _filledBoxes += 1;
      }

      _turnofO = !_turnofO;
      _checkWinner();
    });
  }

  void _checkWinner(){
    //first row
    if(_XorOList[0] == _XorOList[1] &&
       _XorOList[0] == _XorOList[2] &&
       _XorOList[0] != ''){
        _showAlertDialog('Winner', _XorOList[0]);
        return;
       }
    
    //second row
    if(_XorOList[3] == _XorOList[4] &&
       _XorOList[3] == _XorOList[5] &&
       _XorOList[3] != ''){
        _showAlertDialog('Winner', _XorOList[3]);
        return;
       }
  
    //third row
    if(_XorOList[6] == _XorOList[7] &&
       _XorOList[6] == _XorOList[8] &&
       _XorOList[6] != ''){
        _showAlertDialog('Winner', _XorOList[6]);
        return;
       }

    //first column
    if(_XorOList[0] == _XorOList[3] &&
       _XorOList[0] == _XorOList[6] &&
       _XorOList[0] != ''){
        _showAlertDialog('Winner', _XorOList[0]);
        return;
       }

    //second column
    if(_XorOList[1] == _XorOList[4] &&
       _XorOList[1] == _XorOList[7] &&
       _XorOList[1] != ''){
        _showAlertDialog('Winner', _XorOList[1]);
        return;
       }

    //third column
    if(_XorOList[2] == _XorOList[5] &&
       _XorOList[2] == _XorOList[8] &&
       _XorOList[2] != ''){
        _showAlertDialog('Winner', _XorOList[2]);
        return;
       }

    //diagonal
    if(_XorOList[0] == _XorOList[4] &&
       _XorOList[0] == _XorOList[8] &&
       _XorOList[0] != ''){
        _showAlertDialog('Winner', _XorOList[0]);
        return;
       }

    //diagonal
    if(_XorOList[2] == _XorOList[4] &&
       _XorOList[2] == _XorOList[6] &&
       _XorOList[2] != ''){
        _showAlertDialog('Winner', _XorOList[2]);
        return;
       }
    
    if(_filledBoxes == 9){
      _showAlertDialog('Draw', '');
    }

  }

  void _showAlertDialog(String title, String winner){
    
    showAlertDialog(
      context: context,
      title: title,
      content: winner == ''
      ? 'The match ended in a draw.'
      : 'The winner is ${winner.toUpperCase()}',
      defaultAcionText:'OK',
      onOkPressed: () {
        _clearBoard();
        Navigator.of(context).pop();
      }
    );

    if(winner == 'o'){
      _scoreO += 1;
    } else if(winner == 'x'){
      _scoreX += 1;
    }
  }

}