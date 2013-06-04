//
//  MWConstants.h
//  Templates
//
//  Created by asaf vertz on 5/18/13.
//  Copyright (c) 2013 Mobiwedo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWConstants : NSObject
{
    
}

extern NSInteger const TableTemplateRowHeight;

+(MWConstants *) sharedInstance;

@end


// ############### constants ##################

typedef enum{
    TemplateControllerTypeTable,
    TemplateControllerTypeSettings,
    TemplateControllerTypeSpreadLove,
    TemplateControllerTypeFacebook
}TemplateControllerType;

#ifndef Slide_ly_Constants_h
#define Slide_ly_Constants_h

#define kNotification_PreviewImageGenerated                     @"previewImageGenerated"
#define kNotification_SongSaved                                 @"songSaved"
#define kNotification_WillBecomeInactive                        @"willBecomeInactive"
#define kNotification_WillEnterForeground                       @"willEnterForeground"


#define kUserInfoStory                                          @"story"
#define kUserInfoMovie                                          @"movie"

#define kNewStoryTitle                                          @"My Story Title"

//UI Style

//grey_1 #333333
#define kColorGrey_1    [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]

//grey_2 #666666
#define kColorGrey_2    [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]

//grey_3 #999999
#define kColorGrey_3    [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0]

//pink #ff3c66
#define kColorPink      [UIColor colorWithRed:1.0 green:60.0/255.0 blue:102.0/255.0 alpha:1.0]

//blue #2895e0
#define kColorBlue      [UIColor colorWithRed:40.0/255.0 green:149.0/255.0 blue:224.0/255.0 alpha:1.0]

//white
#define kColorWhite [UIColor whiteColor]

//shadow color 1 - black
#define kColorShadow1 [UIColor blackColor]

//shadow color 2 - white
#define kColorShadow2 [UIColor whiteColor]

//shadow color 3 #2c71b1
#define kColorShadow3 [UIColor colorWithRed:44.0/255.0 green:113.0/255.0 blue:177.0/255.0 alpha:1.0]

//shadow color #7f7f7f
#define kColorShadow4 [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1.0]


#define kShadowOffset 1

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)

#define kStoryRemainingTimeCutoff 0.3

#define kUserDefaultsFirstRun                 @"firstRun"


//#define kCaptureSessionPreset @"AVCaptureSessionPreset640x480"
#define kAVAssetExportPresset @"AVAssetExportPreset640x480"

#define kVideoDimensions16x9 CGSizeMake(640, 480)


#define kCaptureSessionPreset               ([[UIScreen mainScreen] bounds].size.height <= 480.0) ? @"AVCaptureSessionPresetMedium" : @"AVCaptureSessionPreset960x540"
//#define kAVAssetExportPresset                ([[UIScreen mainScreen] bounds].size.height <= 480.0) ?     @"AVAssetExportPreset640x480" :  @"AVAssetExportPreset1280x720"
//
//#define kVideoDimensions16x9 ([[UIScreen mainScreen] bounds].size.height <= 480.0) ? CGSizeMake(640, 480) : CGSizeMake(1280, 720)

#define kPreviewImageHeight                        337.0
#define kPreviewImageWidth                         600.0

#define kScreenSize     ([[UIScreen mainScreen] bounds].size.height <= 480.0) ? 480.0 : 568.0

//keep all Mixpanel keys here for easier editing in the future
#define kMixpanelEventCreateNewButton               @"Storyboard: Start New Story button clicked"
#define kMixpanelEventContinueRecordStoryButton     @"Storyboard: Click on [+] icon to continue capturing video"
#define kMixpanelEventPlayStoryButton               @"Storyboard: Click to play video"
#define kMixpanelEventEditStoryTitle                @"Storyboard: Click on title for editing"
#define kMixpanelEventExportStoryButton             @"Storyboard: Click on Export button"
#define kMixpanelEventSaveStoryButton               @"Storyboard: Save to Cameral Roll"
#define kMixpanelEventShareYouTubeButton            @"Storyboard: Share on YouTube"
#define kMixpanelEventDeleteStoryButton             @"Storyboard: Click to delete my story"

#define kMixpanelEventChooseMusicScreenLoaded       @"Music: Choose Music screen is loaded"
#define kMixpanelEventMusicSongsTab                 @"Music: Click on Songs tab"
#define kMixpanelEventMusicArtistsTab               @"Music: Click on Artists tab"
#define kMixpanelEventMusicPlaylistsTab             @"Music: Click on Playlist tab"
#define kMixpanelEventMusicSelectArtist             @"Music: Click to select an Artist"
#define kMixpanelEventMusicSelectPlaylist           @"Music: Click to select a Playlist"
#define kMixpanelEventMusicSelectSong               @"Music: Click on song to preview it prior selecting it for your video"
#define kMixpanelEventMusicChooseSong               @"Music: Song is selected"

#define kMixpanelEventRecordingScreenLoaded         @"Recording: Recording screen is loaded"
#define kMixpanelEventRecordingStartRecord          @"Recording: Click to start recording"
#define kMixpanelEventRecordingStopRecording        @"Recording: Click to stop recording"
#define kMixpanelEventRecordingClose                @"Recording: Click on [x] to quite recording screen"
#define kMixpanelEventRecordingChangeCamera         @"Recording: Click on Switch camera button"

#define kMixpanelEventRecordingNoTimer              @"Recording: no timer selected"
#define kMixpanelEventRecording5SecTimer            @"Recording: 5 seconds timer selected"
#define kMixpanelEventRecording15SecTimer           @"Recording: 15 seconds timer selected"
#define kMixpanelEventRecording30SecTimer           @"Recording: 30 seconds timer selected"

//append filter name dynamically in RecordStoryViewController
#define kMixpanelEventRecordingSelectedFilterFormat @"Recording: selected filter %@"

#define kMixpanelEventPlaybackScreenLoaded          @"Playback: Playback screen is loaded"
#define kMixpanelEventPlaybackSwitchToRecording     @"Playback: Click on [+] button to continue recording"
#define kMixpanelEventPlaybackPlay                  @"Playback: Click on Play button"
#define kMixpanelEventPlaybackFastforward           @"Playback: Click on forward button"
#define kMixpanelEventPlaybackRewind                @"Playback: Click on rewind button"
#define kMixpanelEventPlaybackScrub                 @"Playback: Click on progress bar on top to get back / move forward to specific area"

//spread the love
#define kMSpreadTheLoveLinkToAppstore               @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=640539284&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"
#define kMSpreadTheLoveDownloadSlidelyCam           @"itms-apps://itunes.com/apps/slidelycam"
#define kMSpreadTheLoveFacebookLikeOurPage          @"http://m.facebook.com/slide.ly"
#define kMSpreadTheLoveTwitterFollowUs              @"https://mobile.twitter.com/slidely"

#endif

typedef enum {
    MWSlidelySpreadTypeEmail = 0,
    MWSlidelySpreadTypeFBShare,
    MWSlidelySpreadTypeFBLike,
    MWSlidelySpreadTypeTwitterShare,
    MWSlidelySpreadTypeTwitterFollow,
    MWSlidelySpreadTypeRateUs
} MWSlidelySpreadType;

typedef enum {
    MWRotationDirectionFromPortraitToLandscapeLeft = 0,
    MWRotationDirectionFromPortraitToLandscapeRight,
    MWRotationDirectionFromLandscapeLeftToPortrait,
    MWRotationDirectionFromLandscapeRightToPortrait,
    MWRotationDirectionFromUpsideDownToLandscapeLeft,
    MWRotationDirectionFromUpsideDownToLandscapeRight,
    MWRotationDirectionFromLandscapeLeftToUpsideDown,
    MWRotationDirectionFromLandscapeRightToUpsideDown
} MWRotationDirection;
