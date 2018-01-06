/*************************************************************
 * Copyright (c) 2016-present, K.							 *
 * All rights reserved.										 *
 *															 *
 * e-mail: xorshine@icloud.com								 *
 * github:https://github.com/xorshine						 *
 *															 *
 * This source code is licensed under the MIT license.		 *
 *************************************************************/

#import "KafkaNativeHeader.h"
#import "UIView+KafkaLayout.h"

@interface KafkaNativeHeader()

@property (strong, nonatomic) UIActivityIndicatorView * indicator;

@end

@implementation KafkaNativeHeader 
 
- (void)setupProperties{
	[super setupProperties];
	[self addSubview:self.indicator];
}

- (void)layoutSubviews{
	[super layoutSubviews];
	 
	self.indicator.center = CGPointMake(self.width/2., self.height/2.); 
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	switch (state) {
		case KafkaRefreshStateNone:
		case KafkaRefreshStateScrolling:break;
		case KafkaRefreshStateReady:{
			break;
		}
		case KafkaRefreshStateRefreshing:{
			[self.indicator startAnimating];
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{
		[self.indicator stopAnimating];
			break;
		}
	}
}

#pragma mark - getter

- (UIActivityIndicatorView *)indicator{
	if (!_indicator) {
		_indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		_indicator.hidesWhenStopped = NO; 
	}
	return _indicator;
}

@end
