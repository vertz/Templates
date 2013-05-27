//
//  MWConstants.h
//  vubooo
//
//  Created by asaf vertz on 12/10/12.
//  Copyright (c) 2012 vertz. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CarouselItemsInFrame 5.f

typedef enum{
    MWStadiumBoxTypeEmpty = 0,
    MWStadiumBoxTypeRefresh,
    MWStadiumBoxTypeRegular
} MWStadiumBoxType;

typedef enum{
    MWStadiumBoxDeleteStatusActionNotFound = 0,
    MWStadiumBoxDeleteStatusActionNotPost,
    MWStadiumBoxDeleteStatusSuccess
} MWStadiumBoxDeleteStatus;

typedef enum{
    MWShoutTypeNewAction = 0,
    MWShoutTypeExistingAction
} MWShoutType;

typedef enum{
    MWStadiumNotificationError = 0,
    MWStadiumNotificationNewElements,
    MWStadiumNotificationNewEvent
} MWStadiumNotification;

typedef enum{
    MWDirectionLeft = 0,
    MWDirectionRight = 1
} MWDirection;

typedef enum{
    MWMaskTypeLeftMask = 0,
    MWMaskTypeMonthPastRightMask = 1,
    MWMaskTypeRightMask = 2,
    MWMaskTypeMiddleMask = 3
} MWMaskType;

typedef enum{
    MWUserControllerTypeFollow = 0,
    MWUserControllerTypeTeam = 1,
    MWUserControllerTypeUser = 2
} MWUserControllerType;

typedef enum{
    MonthJanuary = 1,
    MonthFebruary,
    MonthMarch,
    MonthApril,
    MonthMay,
    MonthJune,
    MonthJuly,
    MonthAugust,
    MonthSeptember,
    MonthOctober,
    MonthNovember,
    MonthDecember
}Month;

//typedef enum{
//    MatchLive = 1
//}MatchStatus;

typedef enum{
    MatchesTable = 1,
    SearchTable
}MainPageTableType;

//typedef enum{
//    ResultTypeUser = 1,
//    ResultTypeTeam
//}SearchResultType;

typedef enum{
    UserTeam = 1,
    UserSimilarUser
}UserObjectType;

typedef enum{
    RequestOk = 1,
    RequestError
}RequestFinishState;

typedef enum{
    MWFansTableTypeFollowers = 0,
    MWFansTableTypeFollowing = 1,
    MWFansTableTypeFansToFollow = 2,
    MWFansTableTypeSimilarUsers = 3,
}MWFansTableType;

// Services Enums
typedef enum{
    MWActionTypePrediction = 0,
	MWActionTypePost,
	MWActionTypeYellowCard,
	MWActionTypeRedCard,
	MWActionTypeOffside,
	MWActionTypeSpectacularGoal,
	MWActionTypeBadReferee,
	MWActionTypeBravo,
	MWActionTypeDamn,
	MWActionTypePenalty
}MWActionType;

typedef enum{
    MWEventTypeGoal = 0,
    MWEventTypeYellowCard,
    MWEventTypeSecondYellowCard,
    MWEventTypeRedCard,
    MWEventTypeSubstitution,
    MWEventTypePenalty,
    MWEventTypeKickOff,
    MWEventTypeHalfTime,
    MWEventTypeSecondHalf,
    MWEventTypeFulltime,
    MWEventTypeExtraTime,
    MWEventTypeETFullTime,
    MWEventTypePenalties,
    MWEventTypePenaltiesFullTime
}MWEventType;

typedef enum{
    MWMatchStatusArchived = 0,
    MWMatchStatusActive = 1,
    MWMatchStatusScheduled = 2
}MWMatchStatus;

typedef enum{
    MWSearchResultTypeUser = 0,
    MWSearchResultTypeTeam = 1
}MWSearchResultType;

typedef enum{
    MWNotificationTypeMatchReminder = 0,
    MWNotificationTypeMatchEvent = 1,
    MWNotificationTypeUserReplied = 2,
    MWNotificationTypeUserVuVuud = 3,
    MWNotificationTypeUserBooped = 4,
    MWNotificationTypeSystemMessage = 5
}MWNotificationType;

typedef enum{
    MWSideHost = 0,
    MWSideGuest = 1
}MWSide;

typedef enum {
    MWVuBooTypeVuvuu = 0,
    MWVuBooTypeBooz,
    MWVuBooTypeNone
}MWVuBooType;

typedef enum {
    MWVuBooEventVuu = 0,
    MWVuBooEventBoo,
    MWVuBooEventNone
}MWVuBooEvent;



@interface MWConstants : NSObject

extern NSString *const MWPort;
extern NSString *const MWHost;
extern NSString *const MWHost2;

//Registration
extern NSString *const MWRegisterationUrl;

//Matches
extern NSString *const MWMatchesService;
extern NSString *const MWSubscribeMatchesService;
extern NSString *const MWUnsubscribeMatchesService;
extern NSString *const MWReorderMatchesListService;
extern NSString *const MWMatchesListsService;
extern NSString *const MWMoreMatches;
extern NSString *const MW_MORE_MATCHES;

//User
extern NSString *const MWUserDetailsService;
extern NSString *const MWUserFollowingService;
extern NSString *const MWUserFollowersService;
extern NSString *const MWFollowUserService;
extern NSString *const MWUnfollowUserService;
extern NSString *const MWSimilarUsersToFollow;

//Team
extern NSString *const MWTeamDetailsService;
extern NSString *const MWTeamFansService;
extern NSString *const MWTeamFansToFollowService;

//General
extern NSString *const MWSearchService;
extern NSString *const MWMoreSearchResultsService;
extern NSInteger const MWSecondsToCacheWeek;
extern NSInteger const MWSecondsToCacheDay;

//Profile
extern NSString *const MWAddTeam;
extern NSString *const MWRemoveTeam;
extern NSString *const MWReorderTeam;
extern NSString *const MWUpdatePic;
extern NSString *const MWUpdateName;

//Hud
extern NSString *const MW_HUD_START ;
extern NSString *const MW_HUD_STOP ;

//faild first request
extern NSString *const MW_Faild_First ;

//shout action
extern NSString *const MW_SHOUT_POST;
extern NSString *const MW_SHOUT_ClOSE;
extern NSString *const MW_SHOUT_CANCEL;

extern NSString *const MW_SHOUT_NEW_POST;
extern NSString *const MW_SHOUT_NEW_ClOSE;
extern NSString *const MW_SHOUT_NEW_CANCEL;

//Match details
extern NSString *const MWMatchDetails;
extern NSString *const MWPreviousElements;
extern NSString *const MWNextElements;

//Stadium
extern int MWNumberOfItemsInBox;
extern int MWRefreshStadiumInterval;
extern NSString *const MWNewActionEvent;
extern NSString *const MWJoinMatchRequestUrl;
extern NSString *const MWGetActionRequestUrl;
extern NSString *const MWGetEventRequestUrl;
extern NSString *const MWGetEventVubooosUrl;
extern NSString *const MWGetActionVubooosUrl;

extern NSString *const MWGetHomeMatchUrl;

extern NSString *const MWVuvuEvent;
extern NSString *const MWBoooEvent;
extern NSString *const MWUnVuvuEvent;
extern NSString *const MWUnBoooEvent;

extern NSString *const MWDeleteAction;

// Font
extern NSString *const MW5DotsFont;
extern NSString *const FontNeoSansIntelMedium;

// Device type,
extern BOOL MWScreenSizeRetina4Inch;

//Action
extern NSString *const MWVuvuAction;
extern NSString *const MWUnvuvuAction;
extern NSString *const MWBooAction;
extern NSString *const MWUnbooAction;

// Push
extern NSString *const MW_USERID ;
extern NSString *const MW_USER_NAME;
extern NSString *const MW_DEVICETOKEN ;
extern NSString *const MW_SET_NOTIFICATIONS ;
extern NSString *const MWPushNotificationReceived;

//Popup
extern NSString *const MWPopupDetails;

//Rate Us
extern NSString *const MWGetRateUsPopup;
extern NSString *const MWRateUsPressed;

// Localytics
extern NSString *const MWLocalyticsAppKey;

//Shout
extern int const MWMaxShoutLength;

//Page Control
extern int const MWNumberOfPages;

//Facebook
extern NSString *const MWFBApplicationID;

//AppsFlyer
extern NSString *const MWAppsflyerID;

@end
