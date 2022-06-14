enum DrawerSection{
  Home,
  Launches,
  Vehicles,
  Missions,
  History,
  Company,
  About,
  Logout,
}

class DrawerNameList{
  static String nameList(var selection){
    if (selection == DrawerSection.Home){
      return "Home";
    }else if(selection == DrawerSection.Launches){
      return "Launches";
    }else if(selection == DrawerSection.Vehicles){
      return "Vehicles";
    }else if(selection == DrawerSection.Missions){
      return "Missions";
    }else if(selection == DrawerSection.History){
      return "History";
    }else if(selection == DrawerSection.Company){
      return "Company";
    }else if(selection == DrawerSection.About){
      return "About";
    }else if(selection == DrawerSection.Logout){
      return "Logout";
    }else{
      return "Unknown Title";
    }
  }
}