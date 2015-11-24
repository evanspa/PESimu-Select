//
//  SSELUtilsTests.m
//
// Copyright (c) 2014-2015 PESimu-Select
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SSELUtils.h"
#import "SSELUseCase.h"
#import "SSELSimulation.h"
#import <PEWire-Control/PEHttpResponse.h>
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(SSELUtilsSpec)

describe(@"SSELUtils", ^{
    context(@"Class functions", ^{
        it(@"Works properly with sane inputs", ^{
            NSArray *usecases =
              [SSELUtils usecasesForScreen:@"unauthenticated-landing-screen"
                    fromBaseResourceFolder:@"application-screens"];
            [usecases shouldNotBeNil];
            [[theValue([usecases count]) should] equal:theValue(1)];
            SSELUseCase *usecase = [usecases objectAtIndex:0];
            [usecase shouldNotBeNil];
            [[[usecase name] should] equal:@"create-account"];
            NSArray *simulations = [usecase simulations];
            [simulations shouldNotBeNil];
            [[theValue([simulations count]) should] equal:theValue(2)];
            SSELSimulation *simulation = [simulations objectAtIndex:0];
            [simulation shouldNotBeNil];
            [[[[simulation httpResponse] name] should] equal:@"Account Creation - 0"];
            [[[[simulation httpResponse] responseDescription] should]
              equal:@"Represents a successful account creation - 0."];
            simulation = [simulations objectAtIndex:1];
            [simulation shouldNotBeNil];
            [[[[simulation httpResponse] name] should] equal:@"Account Creation - 1"];
            [[[[simulation httpResponse] responseDescription] should]
              equal:@"Represents a successful account creation - 1."];
          });
      });
});

SPEC_END
