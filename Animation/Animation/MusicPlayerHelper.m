//
//  MusicPlayerHelper.m
//  Animation
//
//  Created by Andy on 2019/2/26.
//  Copyright © 2019 李正林. All rights reserved.
//

#import "MusicPlayerHelper.h"

static NSMutableDictionary *_players;
static NSMutableDictionary *_onlinePlayers;

@implementation MusicPlayerHelper

+ (void)initialize {
    
    _players = [NSMutableDictionary dictionary];
    _onlinePlayers = [NSMutableDictionary dictionary];
}

+ (AVAudioPlayer *)playMusicWithMusicPath:(NSString *)musicPath {
    
    if (!musicPath) return nil;
    
    // 1.定义播放器
    AVAudioPlayer *player = nil;
    
    // 2.从字典中取出player，如果取出来是空，则对应创建对应的播放器
    player = _players[musicPath];
    if (!player) {
        
        // 2.1获取对应音乐资源
        NSURL *fileUrl = [NSURL URLWithString:musicPath];
        
        if (!fileUrl) return nil;
        // 2.2创建对应的播放器
        NSData *musicData = [[NSFileManager defaultManager] contentsAtPath:[musicPath stringByReplacingOccurrencesOfString:@"file://" withString:@""]];
        NSError *error = nil;
        player = [[AVAudioPlayer alloc] initWithData:musicData error:&error];
        if (error) {
            
            NSLog(@"player error:%@", error);
            return nil;
        }
        
        // 2.3将player存入字典中
        [_players setObject:player forKey:musicPath];
        // 2.4准备播放
        [player prepareToPlay];
    }
    // 3.播放音乐
    [player play];
    
    return player;
}

+ (AVAudioPlayer *)playMusicWithMusicPath:(NSString *)musicPath beginAtTime:(NSTimeInterval)cuttrentTime {
    
    AVAudioPlayer *player = [self playMusicWithMusicPath:musicPath];
    player.currentTime = cuttrentTime;
    return player;
}

+ (AVAudioPlayer *)playAudioWithAudioName:(NSString *)audioName {
    
    if (!audioName) return nil;
    
    AVAudioPlayer *player = nil;
    player = _players[audioName];
    if (!player) {
        
        NSURL *fileUrl = [NSURL URLWithString:audioName];
        
        if (!fileUrl) return nil;
        NSString *path = [[NSBundle mainBundle] pathForResource:audioName ofType:@"mp3"];
        NSData *musicData = [[NSFileManager defaultManager] contentsAtPath:[path stringByReplacingOccurrencesOfString:@"file://" withString:@""]];
        
        NSError *error = nil;
        player = [[AVAudioPlayer alloc] initWithData:musicData error:&error];
        
        if (error) {
            
            NSLog(@"Player error@:%@", error);
            return nil;
        }
        
        [_players setObject:player forKey:audioName];
        [player prepareToPlay];
    }
    
    [player play];
    
    return player;
}

+ (void)pauseMusicWithMusicPath:(NSString *)musicPath {
    
    if (!musicPath) return;
    AVAudioPlayer *player = _players[musicPath];
    
    if (player) {
        [player pause];
    }
}

+ (void)stopMusicWithMusicPath:(NSString *)musicPath {
    
    if (!musicPath) return;
    AVAudioPlayer *player = _players[musicPath];
    
    if (player) {
        
        [player stop];
        [_players removeObjectForKey:musicPath];
        player = nil;
    }
}

static NSThread *_playerThread = nil;
+ (NSThread *)playerThread {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            _playerThread = [[NSThread alloc] init];
            [_playerThread start];
        });
    });
    return _playerThread;
}

+ (void)playOnlineMusicWithUrlString:(NSString *)urlString {
    
    MPMoviePlayerController *player = nil;
    player = _onlinePlayers[urlString];
    if (!player) {
        
        player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:urlString]];
        player.shouldAutoplay = YES;
        [player prepareToPlay];
        [_onlinePlayers setObject:player forKey:urlString];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [player play];
    });
    NSLog(@"************current Thread:%@", [NSThread currentThread]);
}

+ (void)pauseOnlineMusicWithUrlString:(NSString *)urlString {
    
//    MPMoviePlayerController *player = _onlinePlayers[urlString];
//    if (player) {
//
//        [player pause];
//    }
    
    AVPlayer *player = _onlinePlayers[urlString];
    if (player) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [player pause];
        });
    }
}

+ (void)stopOnlineMusicWithUrlString:(NSString *)urlString {
    
//    MPMoviePlayerController *player = _onlinePlayers[urlString];
//    if (player) {
//
//        [player stop];
//        [_onlinePlayers removeObjectForKey:urlString];
//        player = nil;
//    }
    
    __block AVPlayer *player = _onlinePlayers[urlString];
    if (player) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [player pause];
            [_onlinePlayers removeObjectForKey:urlString];
            player = nil;
        });
    }
}

+ (void)removeAllPlayers {
    
    NSMutableArray *players = [NSMutableArray array];
    if ([_players allValues].count) {
        
        [players addObjectsFromArray:[_players allValues]];
    }
    
    if ([_onlinePlayers allValues].count) {
        
        [players addObjectsFromArray:[_onlinePlayers allValues]];
    }
    
    for (NSInteger i = 0; i < players.count; i++) {
        
        NSObject *obj = players[i];
        if ([obj isKindOfClass:[AVPlayer class]]) {
            
            AVPlayer *player = (AVPlayer *)obj;
            [player pause];
        }else if ([obj isKindOfClass:[AVAudioPlayer class]]) {
            
            AVAudioPlayer *player = (AVAudioPlayer *)obj;
            [player stop];
        }
    }
    [_players removeAllObjects];
    [_onlinePlayers removeAllObjects];
}

@end
