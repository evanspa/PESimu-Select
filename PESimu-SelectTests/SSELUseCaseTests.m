//
//  SSELUseCaseTests.m
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

#import "SSELUseCase.h"
#import "SSELSimulation.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(SSELUseCaseSpec)

__block SSELUseCase *usecase;

describe(@"SSELUseCase", ^{
    context(@"initWithName:simulations:", ^{
        beforeEach(^{
            usecase = nil;
          });

        it(@"Works with sane inputs", ^{
            [usecase shouldBeNil];
            NSArray *simulations =
              @[[[SSELSimulation alloc]
                  initWithHttpResponse:
                    [[PEHttpResponse alloc]
                      initWithRequestUrl:
                        [NSURL URLWithString:@"http://example.com"]]]];
            usecase =
              [[SSELUseCase alloc] initWithName:@"UC1" simulations:simulations];
            [usecase shouldNotBeNil];
            [[[usecase name] should] equal:@"UC1"];
            [[[usecase simulations] should] equal:simulations];
          });
      });
  });

SPEC_END
