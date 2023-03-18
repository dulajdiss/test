class APIConstants {
  //http://www.eis-digital.com/ebbfen/login
  static const MAIN_BASE_URL = "eis-digital.com";
  static const NEWS_LIST_URL = "/ebbfen/mobileapp/newslist";
  static const EVENT_LIST_URL = "/ebbfen/mobileapp/eventslist";
  static const SPONSORS_LIST_URL = "/ebbfen/mobileapp/sponsorslist";
  static const SPORTS_LIST_URL = "/ebbfen/mobileapp/sports";
  static const COACH_LIST_URL = "/ebbfen/mobileapp/coachlist";
  static const GYM_LIST_URL = "/ebbfen/mobileapp/gymslist";
  static const ATHLETE_LIST_URL = "/ebbfen/mobileapp/athletelist";
  // static const GYM_INFO_URL = "/ebbfen/mobileapp/gyminfo";
  static const LOGIN_URL = "/ebbfen/mobileapp/login";
  static const REGISTER_URL = "/ebbfen/mobileapp/register";

  static const OTP_DETAILS_URL = "/ebbfen/mobileapp/otpverificationdetails";
  static const OTP_SMS_SENDER_URL = "/ebbfen/mobileapp/otpverification";
  static const PROFILE = "/ebbfen/mobileapp/profile";
  static const MEDIA_URL = "/ebbfen/mobileapp/media";
  static const EDIT_PROFILE = "/ebbfen/mobileapp/editprofile";

  static const ACHIVEMENTS = "/ebbfen/mobileapp/achivements";
  static const ADDACHIVEMENTS = "/ebbfen/mobileapp/addachivements";
  static const EDITACHIVEMENTS = "/ebbfen/mobileapp/editachivements";
  static const DELETEACHIVEMENTS = "/ebbfen/mobileapp/deleteachivements";
  static const SPORTASSOCIATED = "/ebbfen/mobileapp/sportsassociated";
  static const CHANGE_PASSWORD = "/ebbfen/mobileapp/changepassword";
  static const ATHLE_MEMBERSHIP = "/ebbfen/mobileapp/athletemembership";

  //GYM OWNER or GYM
  static const COACH_APPROVAL_GYM = "/ebbfen/mobileapp/coachapprovalgym";
  // http://eis-digital.com/ebbfen/mobileapp/gymactivities?user_id=298
  static const GYM_ACTIVITIES = "/ebbfen/mobileapp/gymactivities";
  //http://eis-digital.com/ebbfen/mobileapp/coachapprovals?user_id=280
  static const COACH_APPROVAL = "/ebbfen/mobileapp/coachapprovals"; //pending

  //Coach
  //http://eis-digital.com/ebbfen/mobileapp/coachmembership?user_id=278&fullname=teset&last_name=asd&mobile=9912313222&dob=02-10-1987&passport_number=p123&emirate=1&email=srikanth@prodigit.in
  static const COACH_MEMBERSHIP =
      "/ebbfen/mobileapp/coachmembership"; // december 14
  // http://eis-digital.com/ebbfen/mobileapp/coursetypes
  static const COURSE_TYPE = "/ebbfen/mobileapp/coursetypes"; //  december 14
  // http://eis-digital.com/ebbfen/mobileapp/courseslist?ct_id=2
  static const COACH_COURSE_LIST =
      "/ebbfen/mobileapp/courseslist"; // december 15
  //http://eis-digital.com/ebbfen/mobileapp/courseinfo?course_id=2
  static const COACH_TIME_SLOTS_LIST =
      "/ebbfen/mobileapp/courseinfo"; // december 15

// Happy New Year 2023
  //http://eis-digital.com/ebbfen/mobileapp/dashboardetails?user_id=298&user_type=1
  static const DASHBOARD_DETAILS = "/ebbfen/mobileapp/dashboardetails";
  //http://eis-digital.com/ebbfen/mobileapp/addsa?user_id=290&sport=7,8
  static const ADD_SPORT_ASSOCIATE = "/ebbfen/mobileapp/addsa";
  //http://eis-digital.com/ebbfen/mobileapp/deletesa?sa_id=2
  static const DELETE_SPORT_ASSOCIATE = "/ebbfen/mobileapp/deletesa";
  //http://eis-digital.com/ebbfen/mobileapp/atheletemembershipfee
  static const ATHLE_EVENT_FEE = "/ebbfen/mobileapp/atheletemembershipfee";
  // http://eis-digital.com/ebbfen/mobileapp/organizereventslist?user_id=282
  static const ORGANIZER_EVENT_LIST = "/ebbfen/mobileapp/organizereventslist";
  //renew Licence
  // http://eis-digital.com/ebbfen/mobileapp/licensetypes
  static const LICENSE_TYPES = "/ebbfen/mobileapp/licensetypes";
  //http://eis-digital.com/ebbfen/mobileapp/gymlicense?trade_name=sd&l_id=1&t_ln=sdf
  // &issue_date=date&email=sdf@gmail.com&expiry_date=date&activity=dasf
  // &sponsor=sd&phone_number=99999&address=sdf&emirates=location_id&fee=100
  // &b_address=sdf&city=sdf&zip=sdf&address_two=sdf&state=sdf&owners=sdf
  // &trade_name_pic=image%20file&intial_approval=image%20file&id_front=image%20file
  // &id_back=image%20file&sid_front=image%20file&sid_back=image%20file&
  // id_front_one=image%20file&id_back_one=image%20file&id_front_two=image%20file&
  // id_back_two=image%20file
  static const RE_NEW_LICENSE = "/ebbfen/mobileapp/gymlicense";
  // http://eis-digital.com/ebbfen/mobileapp/addorganizerevent?
  // user_id=282&title=asd&description=d&s_date=start_date&end_date=end_date
  // &amount=100&guests=ads&event_date=date&pic=image file&guest_pic=image file
  // &sport=sport1,sport2
  static const ADD_ORGANIZER_EVENTS = "/ebbfen/mobileapp/addorganizerevent";
  // http://eis-digital.com/ebbfen/mobileapp/editorganizerevent?
  // user_id=282&title=asd&description=d&s_date=start_date&end_date=end_date
  // &amount=100&guests=ads&event_date=date&pic=image file&guest_pic=image file
  // &sport=sport1,sport2&e_id=1
  static const EDIT_ORGANIZER_EVENTS = "/ebbfen/mobileapp/editorganizerevent";
  // http://eis-digital.com/ebbfen/mobileapp/deleteorgevent?e_id=3
  static const DELETE_ORGANIZER_EVENTS = "/ebbfen/mobileapp/deleteorgevent";
  // http://eis-digital.com/ebbfen/mobileapp/athleteapplication?user_id=299
  static const ATHLETE_APPLICATION = "/ebbfen/mobileapp/athleteapplication";
  //http://eis-digital.com/ebbfen/mobileapp/locationslist
  static const LOACTION_LIST = "/ebbfen/mobileapp/locationslist";

  // http://eis-digital.com/ebbfen/mobileapp/nocmaindropdown
  static const NOC_MAIN_DROP = "/ebbfen/mobileapp/nocmaindropdown";
  // http://eis-digital.com/ebbfen/mobileapp/nocsubdropdown?user_id=299
  static const NOC_SUB_DROP = "/ebbfen/mobileapp/nocsubdropdown";
  // http://eis-digital.com/ebbfen/mobileapp/noclist?user_id=299
  static const NOC_LIST = "/ebbfen/mobileapp/noclist";

  //http://www.eis-digital.com/ebbfen/mobileapp/genderlist
  static const GENDER_LIST = "/ebbfen/mobileapp/genderlist";
//http://www.eis-digital.com/ebbfen/mobileapp/athletesearch?location&gender&sport
  static const ATHLET_SEARCH = "/ebbfen/mobileapp/athletesearch";

  //http://www.eis-digital.com/ebbfen/mobileapp/gymsearch?keyword=Luckys&gender_id=1&location_id=1&ltr=1
  static const GYM_SEARCH = "/ebbfen/mobileapp/gymsearch";
  //http://www.eis-digital.com/ebbfen/mobileapp/coachsearch?keyword=New%20Coach&location_id=1&gender_id=1&course_id=1
  static const COACH_SEARCH = "/ebbfen/mobileapp/coachsearch";
  //http://eis-digital.com/ebbfen/mobileapp/eventsearch?location_id=1&event_id=1&sport_id=1
  static const EVENT_SEARCH = "/ebbfen/mobileapp/eventsearch";
  //http://www.eis-digital.com/ebbfen/mobileapp/courseslistsearch
  static const COURSE_DROP_LIST = "/ebbfen/mobileapp/courseslistsearch";
  //http://eis-digital.com/ebbfen/mobileapp/eservices
  static const ESERVICE = "/ebbfen/mobileapp/eservices";
  //http://eis-digital.com/ebbfen/mobileapp/eventregistration?user_id=299&fullname=NewMun&mobile=527952673&dob=10-10-1987&category=1&passport_number=P1233&emirate=Duabi&email=newathlete@ggg.ggg&nationality=Ireland&event_name=DUBAI MUSCLE CLASSIC CITY&event_id=5&fee=250&address=sdf&city=sdf&zip=324322&address_two=asd&state=d
  static const ATHLE_EVENT_REGISTER = "/ebbfen/mobileapp/eventregistration";
  //http://eis-digital.com/ebbfen/mobileapp/coursedisplaylogic?user_id=278&course_type_id=2
  static const COURSE_DISPLAY_LOGIC = "/ebbfen/mobileapp/coursedisplaylogic";
}

// http://eis-digital.com/ebbfen/mobileapp/newslist
//
// http://eis-digital.com/ebbfen/mobileapp/eventslist
//
// http://eis-digital.com/ebbfen/mobileapp/coachlist
//
// http://eis-digital.com/ebbfen/mobileapp/gymslist
//
// http://eis-digital.com/ebbfen/mobileapp/athletelist
//
//http://eis-digital.com/ebbfen/mobileapp/sports
//
//http://eis-digital.com/ebbfen/mobileapp/sponsorslist
//
//http://eis-digital.com/ebbfen/mobileapp/gyminfo?gym_id=37
//
//http://eis-digital.com/ebbfen/mobileapp/media
//
//http://eis-digital.com/ebbfen/mobileapp/login?email=srikanth@prodigit.in&password=Srikanth1
//
//http://eis-digital.com/ebbfen/mobileapp/register?fullname=Srikanth&email=srikanth@prodigit.in&mid_name=Goud&last_name=5557&mobile=95501233&trade_name=Srikanth GYM&gender=1&location=1&et_id=1&user_type=1&password=Srikanth12&location_id=1
//
//http://eis-digital.com/ebbfen/mobileapp/otpverificationdetails?o_id=283
//
//http://eis-digital.com/ebbfen/mobileapp/otpverification?o_id=283
//
//http://eis-digital.com/ebbfen/mobileapp/profile?user_id=280&user_type=1
//
//http://eis-digital.com/ebbfen/mobileapp/coachapprovals?user_id=280
//
//http://eis-digital.com/ebbfen/mobileapp/changepassword?user_id=280&password=Srikanth1http://eis-digital.com/ebbfen/mobileapp/changepassword?user_id=280&password=Srikanth1
//
// http://eis-digital.com/ebbfen/mobileapp/athletemembership?user_id=280&fullname=Srikanth11&last_name=Goud11&mobile=9993123111&dob=02-10-2000&passport_number=P1234&emirate=Dubai&email=sss@gmail.com&nationality=Indian&membership_type=Athlete&fee=200&address=Test Adderss&address_two=Test Adderss&city=Test City&state=Test State&zip=12234
//
//http://eis-digital.com/ebbfen/mobileapp/dashboardetails?user_id=298&user_type=1
