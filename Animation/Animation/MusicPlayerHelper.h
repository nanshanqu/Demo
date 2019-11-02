//
//  MusicPlayerHelper.h
//  Animation
//
//  Created by Andy on 2019/2/26.
//  Copyright © 2019 李正林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicPlayerHelper : NSObject

+ (nullable AVAudioPlayer *)playMusicWithMusicPath:(nonnull NSString *)musicPath;
+ (nullable AVAudioPlayer *)playAudioWithAudioName:(nonnull NSString *)audioName;

+ (nullable AVAudioPlayer *)playMusicWithMusicPath:(NSString *)musicPath beginAtTime:(NSTimeInterval)cuttrentTime;
+ (void)pauseMusicWithMusicPath:(nonnull NSString *)musicPath;
+ (void)stopMusicWithMusicPath:(nonnull NSString *)musicPath;

+ (void)playOnlineMusicWithUrlString:(nonnull NSString *)urlString;
+ (void)pauseOnlineMusicWithUrlString:(nonnull NSString *)urlString;
+ (void)stopOnlineMusicWithUrlString:(nonnull NSString *)urlString;

+ (void)removeAllPlayers;

@end

NS_ASSUME_NONNULL_END
