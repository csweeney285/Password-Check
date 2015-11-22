//
//  main.m
//  Sweeney- Password Test
//
//  Created by Conor Sweeney on 10/26/15.
//  Copyright © 2015 Conor Sweeney. All rights reserved.
//

#import <Foundation/Foundation.h>


BOOL passwordCheck(NSString* password, NSMutableArray* passwordBlacklist){
    //Declare Flag
    int flag1 = 0;
    int flag2 =0;
    int flag3 =0;
    int flag4 =0;
    int flag5 =0;
    
    //Declare Character sets
    NSCharacterSet *upperCaseLetter = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowerCaseLetter = [NSCharacterSet lowercaseLetterCharacterSet];
    NSCharacterSet *symbols = [NSCharacterSet characterSetWithCharactersInString:@"#$%&!"];
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    //Check if password is on blacklis
    for(int i = 0; i < [passwordBlacklist count]; i++ ){
        if([passwordBlacklist[i] isEqualToString:password]){
            return 0;
        }
    }
    
    //Check password length
    if ([password length]<8 || [password length]>16) {
        return 0;
    }
    
    //Check for spaces
    if ([password rangeOfString:@" "].location != NSNotFound) {
        return 0;
    }
    
    //Check if first character is a letter
    if ([upperCaseLetter characterIsMember:[password characterAtIndex:0]]|| [lowerCaseLetter characterIsMember:[password characterAtIndex:0]]) {
        flag1 = 1;
    }
    
    //Check if password contains at least one of the following: #,@,$,%,&,!
    if(flag1 == 1){
        for (int i=0; i < [password length]; i++) {
            if([symbols characterIsMember:[password characterAtIndex:i]]){
                flag2 = 1;
            }
        }
    }
    else
        return 0;
    
    
    //Check if password contains at least one lowercase letter
    if(flag2 ==1){
        for (int i; i < [password length]; i++) {
            if([lowerCaseLetter characterIsMember:[password characterAtIndex:i]]){
                flag3 = 1;
            }
        }
    }
    else
        return 0;
    
    //Check if password contains at least one uppercase letter
    if(flag3 == 1)
    for (int i; i < [password length]; i++) {
        if([upperCaseLetter characterIsMember:[password characterAtIndex:i]]){
            flag4 = 1;
        }
    }
    else
        return 0;
    
    //Check if password contains at least one number
    if (flag4 == 1) {
        for (int i; i < [password length]; i++) {
            if([numbers characterIsMember:[password characterAtIndex:i]]){
                flag5 = 1;
            }
        }
    }
    
    //Return true if all qualifications are met
    if(flag5 == 1){
        return 1;
    }
    else
        return 0;
}




int main(int argc, const char * argv[]) {
    NSMutableArray *passwordBlacklist = [NSMutableArray array];
    [passwordBlacklist addObject:@"A123456a#"];
    [passwordBlacklist addObject:@"X123456a@"];
    [passwordBlacklist addObject:@"a1234&@56a#"];
    [passwordBlacklist addObject:@"aaaaX1#"];
    
    //for(int i=0;i < [passwordBlacklist count];i++){
    //    NSLog(@"\n%@\n",passwordBlacklist[i]);
    //}
    NSString *password = @"Password!55";
    
    BOOL passwordCheck1 = passwordCheck(password, passwordBlacklist);
    
    if (passwordCheck1 == true) {
        NSLog(@"The password works");
    }
    else
        NSLog(@"The password fails");
   
    
    
    
    return 0;
}
