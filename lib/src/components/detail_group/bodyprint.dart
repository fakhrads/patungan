import 'package:flutter/material.dart';
class bodyprint extends StatelessWidget {
  const bodyprint({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [ 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                    child: Text(
                      'Participant',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                Text(
                  'Name :'
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 2),
                  child: Text(
                    '- Rei'
                  ),
                ),
                Text(
                  'Item :'
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 2),
                  child: Text(
                    '- Ayam Goreng Rp.'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Subprice : Rp.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                  ],
                ),
              TextButton(
                child: Text(
                          'Print',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: (){},
                      ),
              ],
            ),  
          ),
        ),
      ),
    );
  }
}