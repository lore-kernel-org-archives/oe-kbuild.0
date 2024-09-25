Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F97158D96
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252594; cv=none; b=gXdOpGssJQy/Pf3oJLf9TI30fAUS8TxCkwar9qQ892HqmiECYJgWS6MhQz270vE50sUFMp/jflHbzJRRd0fZsK8Wx8NuFa9rqpqdykdWRUbEIpQvLQnJxuSE0ADdVUGvFwgpD6Il/ypfSUPTcWvIA2zPa/3sRr+9A2fYp2pkRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252594; c=relaxed/simple;
	bh=EtnlEj5BPoth2an6W4ESD/bR67NE6LAL5OBhxnyYCVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PrUKQFyD4lnciiKa4P1bHAltQ0FfXvL/bXvkTC+sm9WRhBck2BX5naLGqMcrfAicPUSBAe1D4fAUWnQDUy0PkKUQli1FFvc176JKf5n/x9t1/8UovRd0GhmMqoVzH2CrnpBy4rFTws3xB9G4xCZW9alZqM/9A6rUqclsD+VICdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONJjasoi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONJjasoi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3770320574aso4159307f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252590; x=1727857390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
        b=ONJjasoipv31P2cfICr71XDL8yMwM9847lJMJYRNt3hvtWASwM59GMHIzraNsFqJvA
         jprJQ4oVfTt2mD4M7R6diJcnucrsaLZ39UlQ8xz73HrB+dBtmfmNXFI85U4N6kIUSxUG
         lGhNf1GY4lJT6NTLRzapw/lnQpgkbu6fB32VKzju5iULUpMiIvNLgCvMlRllIh3ujwX4
         0O95lcdGyxRoJiIYh6gnL5lZZ64i1O7f8BCD459MiKaUP1khU6qTUnEU8+QrLkzPUdpP
         RWbt1HqAztFyfbT3X8D0rElu7y35mpeyPwq6h0AsDLcM8XuXY6bHX0FslHt8GeJwj4x4
         4h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252590; x=1727857390;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wzg7D4oKky5+3kPOwN3vVZTGu28S/XV+QD50k2fkJd8=;
        b=uQN7dQJZsjiUibt4HBwHjtq3ZCp2RIBF47CvfGUjoAwSrZoTbdm3m8yBnSAR/9Ndvz
         6VEgQq6EHpbOKaDUnBzIYQ//895w5XidRzSlJVK9FjZZkj9G+7Dh4+LYh8k5lfD5Vk7S
         SaxZNSHTtYApz6BihxPg6puobvbq20b6a9ICx4v+v+obypSgEQ60tjtogGhgHpwu0/To
         s0727FQg1jwcW0hRsQV3EdHxh7qS0iIJztLzVcEminGqcI/YfposaB7k7GBPMArgTP8k
         hlD4smeIzhEbEs2wjzZS89iKlCkkzuVL854p8Vugxu8Zef5mIKKYTPLdWTXQXAZJvJnW
         uomQ==
X-Gm-Message-State: AOJu0YxOnUdtdEdr+ySBQQdkrepahQQcMcUs/nUinqS5rCleIxJsscVg
	RewVx3XoCPiy0HIdxCLQnvLuiTo1w8bomIeCAbUvzzdftqPJqs58eB5sALGQ/o/vHXW7F/u/gco
	I
X-Google-Smtp-Source: AGHT+IGETHE/X4esE42miSDoeNFaK9g9vbG+kkIWo8WUvpwJ3K+Mdg5qaJEHKAV4EV3TkiFYuWA+mw==
X-Received: by 2002:adf:fa90:0:b0:374:bf1b:1c20 with SMTP id ffacd0b85a97d-37cc24760dcmr1190372f8f.23.1727252590318;
        Wed, 25 Sep 2024 01:23:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969ddfc9sm10949145e9.5.2024.09.25.01.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:23:09 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:23:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ryan Walklin <ryan@testtoast.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
Message-ID: <cfb1d4c6-9414-4880-9edb-31e5af9f951b@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-19-ryan@testtoast.com>

Hi Ryan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Walklin/drm-sun4i-de2-de3-Change-CSC-argument/20240921-175532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20240921095153.213568-19-ryan%40testtoast.com
patch subject: [PATCH v4 18/26] drm: sun4i: de3: Implement AFBC support
config: microblaze-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230531.ZMb79p9h-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409230531.ZMb79p9h-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sun4i/sun50i_afbc.c:236 sun50i_afbc_atomic_update() warn: right shifting more than type allows 16 vs 16

vim +236 drivers/gpu/drm/sun4i/sun50i_afbc.c

757b2767d5472c Jernej Skrabec 2024-09-21  230  
757b2767d5472c Jernej Skrabec 2024-09-21  231  	regmap_write(regs, SUN50I_FBD_OVL_BG_COLOR(base),
757b2767d5472c Jernej Skrabec 2024-09-21  232  		     SUN8I_MIXER_BLEND_COLOR_BLACK);
757b2767d5472c Jernej Skrabec 2024-09-21  233  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR0(base), def_color0);
757b2767d5472c Jernej Skrabec 2024-09-21  234  	regmap_write(regs, SUN50I_FBD_DEFAULT_COLOR1(base), def_color1);
757b2767d5472c Jernej Skrabec 2024-09-21  235  
757b2767d5472c Jernej Skrabec 2024-09-21 @236  	val = SUN50I_FBD_CTL_GLB_ALPHA(state->alpha >> 16);
                                                                               ^^^^^^^^^^^^^^^^^^
This shifts it to zero

757b2767d5472c Jernej Skrabec 2024-09-21  237  	val |= SUN50I_FBD_CTL_CLK_GATE;
757b2767d5472c Jernej Skrabec 2024-09-21  238  	val |= (state->alpha == DRM_BLEND_ALPHA_OPAQUE) ?
757b2767d5472c Jernej Skrabec 2024-09-21  239  		SUN50I_FBD_CTL_ALPHA_MODE_PIXEL :
757b2767d5472c Jernej Skrabec 2024-09-21  240  		SUN50I_FBD_CTL_ALPHA_MODE_COMBINED;
757b2767d5472c Jernej Skrabec 2024-09-21  241  	val |= SUN50I_FBD_CTL_FBD_EN;
757b2767d5472c Jernej Skrabec 2024-09-21  242  	regmap_write(regs, SUN50I_FBD_CTL(base), val);
757b2767d5472c Jernej Skrabec 2024-09-21  243  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

