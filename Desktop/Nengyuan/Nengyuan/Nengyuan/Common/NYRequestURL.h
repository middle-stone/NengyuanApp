//
//  NYRequestURL.h
//  Nengyuan
//
//  Created by hui on 2019/11/14.
//  Copyright © 2019 hui. All rights reserved.
//

#ifndef NYRequestURL_h
#define NYRequestURL_h

//用于区分各种环境

#define DEVELOP_MODE 1  // 张驰1211-1测试
#define DEVELOP_MODE2 2 // 张驰腾龙测试
#define DEVELOP_MODE3 3 // 康康测试
#define DEVELOP_MODE4 4 // 周德豪测试
#define DEVELOP_MODE5 5 // 余江勇测试
#define DEVELOP_MODE6 6 // 丁耀东测试
#define RELEASE_MODE 7  // 阿里云

#define CURRENT_MODE RELEASE_MODE   // 当前的模式,用于区分测试、开发、生产等环境

#if CURRENT_MODE == DEVELOP_MODE    //  张驰1211-1测试
#define NY_REQUEST_URLString @"http://172.22.132.68:8080"
#elif CURRENT_MODE == RELEASE_MODE  // 阿里云 生产环境
#define NY_REQUEST_URLString @"http://47.105.116.29:18888/"
#elif CURRENT_MODE == DEVELOP_MODE2 //  张驰腾龙测试
#define NY_REQUEST_URLString @"http://172.16.4.43:8080"
#elif CURRENT_MODE == DEVELOP_MODE3 // 康康测试
#define NY_REQUEST_URLString @"http://172.16.4.86:8080"
#elif CURRENT_MODE == DEVELOP_MOD4  //  周德豪测试
#define NY_REQUEST_URLString @"http://172.16.11.125:8080"
#elif CURRENT_MODE == DEVELOP_MOD5  // 余江勇测试
#define NY_REQUEST_URLString @"http://192.168.43.19:8080"
#elif CURRENT_MODE == DEVELOP_MOD6  //  丁耀东测试
#define NY_REQUEST_URLString @"http://172.16.0.139:8080"
#endif


#endif /* NYRequestURL_h */
