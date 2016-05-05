//
//  AnnaStatusModel.m
//  weiboa
//
//  Created by Liangkuai on 16/5/4.
//  Copyright © 2016年 Liangkuai. All rights reserved.
//

#import "AnnaStatusModel.h"
#import "AnnaStatusPictureModel.h"
#import "NSDate+Extension.h"
#import "NSObject+MJKeyValue.h"
@implementation AnnaStatusModel

#pragma mark - 重写created_at的get方法.改写标准时输出格式
#warning 仔细考虑的话.存储在本地的时间数据还是和服务器上的时间数据保持一致比较好.格式统一.虽然使用get方法比较消耗性能,不过保证数据统一性比较重要
#warning (或者可以考虑新增一个属性)//如果考虑增加一个属性.则不能在get方法里面设置而应该在set方法里面设置 !在set方法里面写也会导致另一个问题.就是时间不会随着刷新而更新.
#warning 结论.只能用get方法.不需要新增属性 时间自动刷新导致的frame过小的问题.
-(NSString *)created_at{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    // 设置日期格式（声明字符串里面每个数字和单词的含义）
    // E:星期几
    // M:月份
    // d:几号(这个月的第几天)
    // H:24小时制的小时
    // m:分钟
    // s:秒
    // y:年
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy";
    //    _created_at = @"Tue Sep 30 17:06:25 +0600 2014";
    
    // 微博的创建日期
    NSDate *createDate = [fmt dateFromString:_created_at];
    // 当前时间
    NSDate *now = [NSDate date];
    
    // 日历对象（方便比较两个日期之间的差距）
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // NSCalendarUnit枚举代表想获得哪些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear]) { // 今年
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时前", (int)cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createDate];
    }
}

-(void)setSource:(NSString *)source{
    _source = source;

    if ([source isEqualToString:@""]) {
        self.sourceLabelText = @"来自未知来源";
        return;
    }
    
    NSRange range;
    range.location = [source rangeOfString:@">"].location + 1;
    range.length = [source rangeOfString:@"</a>"].location - range.location;

    if (range.length != 0) {
        self.sourceLabelText = [NSString stringWithFormat:@"来自%@", [source substringWithRange:range]];
    } else {
        self.sourceLabelText = @"来自未知来源";
    }
}

-(void)setPic_urls:(NSArray *)pic_urls{
    _pic_urls = [AnnaStatusPictureModel objectArrayWithKeyValuesArray:pic_urls];
}
@end
