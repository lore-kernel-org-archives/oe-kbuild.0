Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9F367B60
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345477; cv=none; b=FGkn27xFkflilTwvww+Ub/7qf15YczmJFLFUjKRltIO5ZAqk3ypWDsiF9ew4jxRgFddf3t1LvCnxw8QmA+4bdsx3pOu0Iby/1g8sr8Tz+GsxTprBsi13z2xswS3mCI//zB34gva4xkBGo9P0QlGh0VuLI+hsL5UVBvOH+Rv9vCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345477; c=relaxed/simple;
	bh=VWLyWjm04DTUYpJ7WWsU16IGC2+D6aXWyvh9X27bStA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VW0jZaCWBUtPFlsBC8UeBpE/YFxZvBNARatnDuHpgCFAcYHgYmjaa3UgYEkN/jeFSAnmZKtrOFAnj/LPDqL7Oww1yjbVGkwsDSsO3NwwTI4tTJQNELOEz3lDOgVHIsq1VHarzk5g1Y6e4K40oru8z93ucdEfUui51/nH4RRevl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku7bEisR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku7bEisR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso42326855e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779345473; x=1779950273; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=ku7bEisRbkhSv4qF8Z9713RegCCsXxGzqSLIE7AekdX9Km1XTngssTiR6ycdCxKFOI
         OHAVBfIuL4mdscn1P5muAHm5M+v/xcuvWRIwukM1hF2HriClkox+MH2Vqc1ia9/qFQm7
         1+1hZ2yjklvaVIemznPXMCADcPWIHgi1ci3lnJhvDDNQncK3UGeatrWgJtJFBKW8gi22
         qRKeyHY+dWy1gvFxY1V5FfUTdeHEJcEkrrDLOOlqv8lp9K45ITDReEbAvbtT2cgIALAU
         SITr679YkxeNW17RpS/+M7QPk3ZfMIh1jS/lpJwCY1Q0eMRVuYZZMY8rASaOgrwHjNo4
         gO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345473; x=1779950273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ahhx+Q7bAbhezZQFMJmiRABaqwf0Ndg5KLiWrpMPDr4=;
        b=mSB4dZU61h5dZwc4o+bxbyEmgfaR+8hRe4nBxkhmRtCEkgNRaGc50KCoRmaWSO4Rl0
         kYDAlm+69r4mJtB6yECsWXvSm5sL+q3hmO8vi2Y4nVIXSvl7QnxdZNOrw8S3SQYYIHGS
         mL4TdVdBfC+MQm3JmiUuZOVEoIaML0DWS/qquAgck35jxMHv7YPdDqP11YSYgR9W4ahb
         jwhjLkqn47+ZSfx8jzRcRBPB/2vRKUQGX7y1C5KZxslzQghST45A8WvtH4iEZoeNP6TX
         3AFu9fEoHi9CO9rZaRexoWMaYmfpH3Bcq2L/W7vk0bANoG69TsWMB2S6zaFhiRDh01Qa
         TMyg==
X-Gm-Message-State: AOJu0Ywwv6kCNs0u0hSknw/kF5olvseBHFzSNr9a/w59gVZwL5q4FNdS
	8/dTd3bDwG2BcNTWZSHrocKnGG2STPDd5YhPxvkp6hNETCuXu4s+OBdnyL1rPA==
X-Gm-Gg: Acq92OFhZpIzYflhD13yGksIT4kkqj7SYRgZZ1ZQjuzDlRvFWhVgOLd4NBI/f0/25zf
	OAhtC0qUqc2K5XuEH06dtsL29fh7jsMQo7VtpPGEYxw+PwpXxVq6QczXprOXW/iss5M+0N0j5bw
	SVB1BDJa1DM59c5o8i8xezTqLpo2TPaINwpEWK6sATCkDBBCQ1XFaCU2X6fgShU2iH6DzVordLC
	6FurezFZKmFU5L4Vy1u1pXx3yXgSFwghIKnLYiVHVKduAdkTsmoyx4MaBUi9DAWU8LAstn06h6N
	VbnxmmaHBakq6l7aAf8ew6ZsP6zv4NM6APtkZD3mIAGpRy8A3uSztO0j5X3ktD6gZwfLhhRdWHn
	d7ePrGXE/30EYAZR5fznXhdDbKD3yCvKp49rnRO6ZzOkgUOAyx77iUAXd2U9npTQeQ/c0oGaXvE
	OSN8UsARVz5aVM8X0ABkrA8NQ=
X-Received: by 2002:a05:600c:4c27:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-4903605f44amr10071075e9.10.1779345473371;
        Wed, 20 May 2026 23:37:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm299931f8f.16.2026.05.20.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:37:52 -0700 (PDT)
Date: Thu, 21 May 2026 09:37:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 12/17]
 drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn:
 passing zero to 'dev_err_probe'
Message-ID: <202605210624.3gcr3prk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260521063749.6XvrzRREk5HSoSSMgLG6xSKpe-jZR4uWpHv6QXPwaNw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   25025253476a64c186592d952c27f24bc3490e42
commit: 3daf2c4ef82b30d4cb017508f6857438ca44da41 [12/17] leds: Add support for TI LP5860 LED driver chip
config: x86_64-randconfig-161-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210624.3gcr3prk-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605210624.3gcr3prk-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-lp5860-core.c:119 lp5860_iterate_subleds() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +119 drivers/leds/rgb/leds-lp5860-core.c

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   97  static int lp5860_iterate_subleds(struct lp5860_led *led, struct led_init_data *init_data)
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   98  {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05   99  	struct fwnode_handle *led_node = NULL;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  100  	struct fwnode_handle *multi_led = init_data->fwnode;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  101  	int subled = 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  102  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  103  	fwnode_for_each_child_node(multi_led, led_node) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  104  		u32 channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  105  		u32 color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  106  		int ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  107  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  108  		ret = fwnode_property_read_u32(led_node, "color", &color_index);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  109  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  110  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  111  				      "%pfwP: Cannot read 'color' property. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  112  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  113  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  114  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  115  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  116  		ret = fwnode_property_read_u32(led_node, "reg", &channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  117  		if (ret < 0 || channel > LP5860_MAX_LED) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  118  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05 @119  				      "%pfwP: 'reg' property is missing. Skipping.\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  120  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  121  			return ret;

Need to set an error code if channel > LP5860_MAX_LED.

3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  122  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  123  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  124  		led->mc_cdev.subled_info[subled].color_index = color_index;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  125  		led->mc_cdev.subled_info[subled].channel = channel;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  126  		ret = lp5860_led_init(led, init_data->fwnode, channel);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  127  		if (ret) {
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  128  			dev_err_probe(led->chip->dev, ret,
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  129  				      "%pfwP: Failed to init LED\n", led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  130  			fwnode_handle_put(led_node);
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  131  			return ret;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  132  		}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  133  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  134  		subled++;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  135  	}
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  136  
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  137  	return 0;
3daf2c4ef82b30d Steffen Trumtrar 2026-05-05  138  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

