import 'package:hive/hive.dart';

class TodoDatabase{
    List todolist=[

    ];
    final _mybox = Hive.box('mybox');
//run this method first time ever open this app
    void createInitialData(){
        todolist= [
            ['gym',false]
        ];
    }
    ///load the data
void loaddata(){
    todolist = _mybox.get("todolist");
}
///update to database
void updatabase(){
    _mybox.put("todolist",todolist);
}

}