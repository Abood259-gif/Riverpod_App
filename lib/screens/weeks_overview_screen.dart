import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/model/recent_act_model.dart';
import 'package:responsive_app/widgets/custem_container.dart';
import 'package:responsive_app/widgets/custem_textfield.dart';

class WeeksOverviewScreen extends StatefulWidget {
  const WeeksOverviewScreen({super.key});

  @override
  State<WeeksOverviewScreen> createState() => _WeeksOverviewScreenState();
}

class _WeeksOverviewScreenState extends State<WeeksOverviewScreen> {
  final TextEditingController controller = TextEditingController();
  late final List<RecentActModel> recentActivities = [
    RecentActModel(name: 'John Doe', job: 'Software Engineer', amount: 100),
    RecentActModel(name: 'Jane Smith', job: 'Product Manager', amount: 200),
    RecentActModel(name: 'Michael Johnson', job: 'UX Designer', amount: 150),
    RecentActModel(name: 'Emily Davis', job: 'Data Analyst', amount: 250),
    RecentActModel(name: 'David Wilson', job: 'Marketing Specialist', amount: 300),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E202B),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(constraints.maxWidth*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                         decoration: BoxDecoration(
                         
                            gradient: LinearGradient(
                    colors: [
                        Color(0xFF9333EA), 
                      Color(0xFF4A54F1), 
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 30 , backgroundColor: Colors.transparent,
                            child: Text('JD' , style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),),
                            )
                          ),
                          CustemTextfield(widthFactor: constraints.maxWidth*0.7, 
                          controller: controller, hintText: 'Search analytics…' , 
                          icon: Icon(Icons.search, color: Colors.white,)
                          ) , 
                          Icon(Icons.notifications_active_outlined, color: Colors.white,
                          
                          )
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight*0.02,),  
                    Text('Good morning, Jamie' , style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),) , 
                  
                    Text('This Weeks Overview' , style:TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )) , 
                    SizedBox(height: constraints.maxHeight*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustemContainer(constraints: constraints, 
                        colors_:[
                          Color.fromARGB(255, 16, 83, 43), 
                           Color(0xFF062112), 
                        ] , 
                        text: 'Revenue',
                        price: 12.4,
                        icon: Icon(Icons.attach_money, color: Colors.white, size: 20,),
                        inc: 12.4
                        ),
                        CustemContainer(constraints: constraints, 
                        colors_:[
                         Color(0xFF411E09), 
                         Color(0xFF1A0A02),
                        ] , 
                        price: 318,
                        text: 'Orders',
                        icon: Icon(Icons.shopping_cart, color: Colors.white, size: 20,
                        ) , 
                        inc: 18.2,
                        ),
                      ],
                    ) , 
                    SizedBox(height: constraints.maxHeight*0.02,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/images/rev.png', 
                      width: constraints.maxWidth*0.9, 
                      height: constraints.maxHeight*0.3, 
                      fit: BoxFit.cover,)) ,
                    SizedBox(height: constraints.maxHeight*0.02,),
                    Text('Recent Activities' , style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: constraints.maxHeight*0.02,),
                    SizedBox(
                      width: constraints.maxWidth*0.9,
                      height: constraints.maxHeight*0.3,
                      child: ListView.builder(
                        itemCount: recentActivities.length,
                        itemBuilder: (context, index) {
                          final activity = recentActivities[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(activity.name[0]),
                            ),
                            title: Text(activity.name, style: TextStyle(color: Colors.white),),
                            subtitle: Text(activity.job, style: TextStyle(color: Colors.white.withOpacity(0.5)),),
                            trailing: Text('\$${activity.amount}', style: TextStyle(color: Colors.white),),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
