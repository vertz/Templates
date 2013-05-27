//
//  MWConstants.m
//  vubooo
//
//  Created by asaf vertz on 12/10/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import "MWVuboooConstants.h"

@implementation MWVuboooConstants

//Registration
NSString *const MWRegisterationUrl = @"/register";

NSString *const MWHost               = @"ios.server.vubooo.com:8080/vubooo-server";
//NSString *const MWPort             = @"8080";
//NSString *const MWHost             = @"private-e597-vubooo1.apiary.io";
//NSString *const MWHost             = @"private-b275-vubooo1.apiary.io";
//NSString *const MWHost             = @"ec2-107-22-134-166.compute-1.amazonaws.com:8080/vubooo-server";

//Matches
NSString *const MWMatchesService             = @"/matches";
NSString *const MWSubscribeMatchesService          = @"/subscribe_matches_list";
NSString *const MWUnsubscribeMatchesService        = @"/unsubscribe_matches_list";
NSString *const MWReorderMatchesListService        = @"/reorder_matches_list";
NSString *const MWMatchesListsService             = @"/matches_lists";
NSString *const MWMoreMatches                = @"/more_matches";
NSString *const MW_MORE_MATCHES     = @"MoreMatchesNotification";

//User
NSString *const MWUserDetailsService             = @"/user_details";
NSString *const MWUserFollowingService             = @"/user_following";
NSString *const MWUserFollowersService             = @"/user_followers";
NSString *const MWFollowUserService                     = @"/follow_user";
NSString *const MWUnfollowUserService                   = @"/unfollow_user";
NSString *const MWSimilarUsersToFollow                   = @"/similar_users_to_follow";

//Team
NSString *const MWTeamDetailsService             = @"/team_details";
NSString *const MWTeamFansService             = @"/team_fans";
NSString *const MWTeamFansToFollowService             = @"/teams_fans_to_follow";

//Generalß
NSString *const MWSearchService             = @"/search";
NSString *const MWMoreSearchResultsService          = @"/more_search_results";
NSInteger const MWSecondsToCacheWeek = 60*60*24*7;
NSInteger const MWSecondsToCacheDay = 60*60*24;

//Profile
NSString *const MWAddTeam             = @"/add_team";
NSString *const MWRemoveTeam             = @"/remove_team";
NSString *const MWReorderTeam             = @"/reorder_team";
NSString *const MWUpdatePic             = @"/upload_profile_picture";
NSString *const MWUpdateName             = @"/update_name";

//Hud
NSString *const MW_HUD_START = @"HudNotificationStart";
NSString *const MW_HUD_STOP = @"HudNotificationStop";

//faild first request
NSString *const MW_Faild_First = @"FailedFirstRequestNotification";

//shout action
NSString *const MW_SHOUT_POST = @"ShoutNotificationPost";
NSString *const MW_SHOUT_ClOSE = @"ShoutNotificationClose";
NSString *const MW_SHOUT_CANCEL = @"ShoutNotificationCancel";

NSString *const MW_SHOUT_NEW_POST = @"NewShoutNotificationPost";
NSString *const MW_SHOUT_NEW_ClOSE = @"NewShoutNotificationClose";
NSString *const MW_SHOUT_NEW_CANCEL = @"NewShoutNotificationCancel";

//Match details
NSString *const MWMatchDetails = @"/match";//{?user_id,auth_token,match_id}
NSString *const MWPreviousElements = @"/previous_match_stream_elements"; // {?user_id,auth_token,match_id,from_element_id}
NSString *const MWNextElements = @"/new_match_stream_elements";

//Stadium
int MWNumberOfItemsInBox = 8;
int MWRefreshStadiumInterval = 10;
NSString *const MWNewActionEvent = @"/new_action";
NSString *const MWJoinMatchRequestUrl = @"/join_match";
NSString *const MWGetActionRequestUrl = @"/action";
NSString *const MWGetEventRequestUrl = @"/event";
NSString *const MWGetTeamImage = @"/event";
NSString *const MWGetEventVubooosUrl = @"/event_vubooos";
NSString *const MWGetActionVubooosUrl = @"/action_vubooos";


NSString *const MWGetHomeMatchUrl = @"/home_match";

NSString *const MWVuvuEvent = @"/vuvu_event";
NSString *const MWBoooEvent = @"/booo_event";
NSString *const MWUnVuvuEvent = @"/unvuvu_event";
NSString *const MWUnBoooEvent = @"/unbooo_event";

NSString *const MWDeleteAction = @"/delete_action";

// Font
NSString *const MW5DotsFont = @"5x5Dots";
NSString *const FontNeoSansIntelMedium = @"NeoSansIntel-Medium";


//Device type
BOOL MWScreenSizeRetina4Inch;

//Vuboos
NSString *const MWVuvuAction = @"/vuvu_action";
NSString *const MWUnvuvuAction = @"/unvuvu_action";
NSString *const MWBooAction = @"/booo_action";
NSString *const MWUnbooAction = @"/unbooo_action";

// Push
NSString *const MW_USERID = @"user_id";
NSString *const MW_USER_NAME = @"user_name";
NSString *const MW_DEVICETOKEN = @"device_token";
NSString *const MW_SET_NOTIFICATIONS = @"/update_notifications_token";
NSString *const MWPushNotificationReceived = @"notification";

//Popup
NSString *const MWPopupDetails = @"/popup_details";

//Rate us
NSString *const MWGetRateUsPopup = @"/show_rate_us_popup";
NSString *const MWRateUsPressed = @"/rate_pressed";

// Localytics
NSString *const MWLocalyticsAppKey = @"d707e4c96e8086a81115d59-0619cfce-8aee-11e2-33b3-008e703cf207";

//Shout
int const MWMaxShoutLength = 140;

//Page Control
int const MWNumberOfPages = 5;

//Facebook
NSString *const MWFBApplicationID = @"169410026478929";

//AppsFlyer
NSString *const MWAppsflyerID = @"624818085;7PFspTf7KVwG8aUvDVk43V";

@end