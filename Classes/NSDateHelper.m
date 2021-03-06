/* *********************************************************************

        Copyright (c) 2010 - 2015 Codeux Software, LLC
     Please see ACKNOWLEDGEMENT for additional information.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:

 * Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
 * Neither the name of "Codeux Software, LLC", nor the names of its 
   contributors may be used to endorse or promote products derived 
   from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.

 *********************************************************************** */

#import "XRSystemInformation.h"

NS_ASSUME_NONNULL_BEGIN

@implementation NSDate (CSDateHelper)
 
+ (NSTimeInterval)timeIntervalSinceNow:(NSTimeInterval)intervalSince1970
{
	return ([self timeIntervalSince1970] - intervalSince1970);
}

+ (NSTimeInterval)timeIntervalSince1970
{
	return [[NSDate date] timeIntervalSince1970];
}

- (BOOL)isInSameDayAsDate:(NSDate *)otherDate
{
	NSParameterAssert(otherDate != nil);

	NSCalendar *currentCalander = [NSCalendar currentCalendar];

	if ([XRSystemInformation isUsingOSXMavericksOrLater]) {
		return [currentCalander isDate:self inSameDayAsDate:otherDate];
	}

	NSCalendarUnit unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitMonth);

	NSDateComponents *selfDateComponents = [currentCalander components:unitFlags fromDate:self];
	NSDateComponents *otherDateComponents = [currentCalander components:unitFlags fromDate:otherDate];

	return ([selfDateComponents day] == [otherDateComponents day] &&
			[selfDateComponents month] == [otherDateComponents month] &&
			[selfDateComponents year] == [otherDateComponents year]);
}

@end

NS_ASSUME_NONNULL_END
