Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734737B;
	Fri,  6 Jan 2023 07:51:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so2976184wmk.4;
        Thu, 05 Jan 2023 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3pRAKha/wzSEcfkkP+wItKC8O2T26cp8rC+a7a/8wE=;
        b=h9qSkZ/lNKRn0GoqXqd51msXoaLrhePp2jwrns+8ZIarLWUXHUwUV7U7LIyPrBy7v0
         v9wQc3vTiWWsrgCRL7y8HGQIHKGe/Jm6pJhOAK6jZckbKoRBQasG3sI6yO8IwdUIy5Ex
         bsErb0FzMDhrZmcqHNsenITTPcBCotVeDqOrCti6GYWann/B8rp8iIkn695yTB0560v8
         IIhH1KMWSqkkc6GPTk39BbA8lTePWJApzDUjpL8LLB3INak3SBgQVZ6y4tDhUpGn58p5
         zmB1C0yNPAh6YwWhVAM7rPsWPrld8ZWG1RIV8YESKDYFlG/Ka7DzlesV6inKaI1BSoQS
         jN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3pRAKha/wzSEcfkkP+wItKC8O2T26cp8rC+a7a/8wE=;
        b=oJQHbk4Frqu0DhjCfJQWlOH3A2oWkemFTyKeBhtXtspVoXZnY/7QwZJhw/WrGACanO
         PklOm9vJ7+UguvEa/29rILDX46Q4lWO/7jkvNB4jI91HvO7ed14GCGHh3FQrqrhP4+MQ
         tWKh2lPwdmBVzRyRxAlonOQPTM7SSSjTxTiIrzSB9wwsPwGv22X+68Vz7UMKSj1V5Gei
         Q9wIMEia/kP8WOXpEUDZjPCw45hbKx+VK6iwx14i+oz3pjHFvh8lducICzrGdeHzkwQS
         RCit11BuDhOLXdax892Pdn6DkuuCfOyvhLoiUNZfQ9H/NVSJ23q+or705iYWEGE4y3FZ
         W6qA==
X-Gm-Message-State: AFqh2kr62r2/4TKg8uaF+SBKtPv4dGR0DqtJymC039P9IL9yMrYNenOP
	Vi/crc69qA8Q+1K6iLILF0n7THiD1YITwQ==
X-Google-Smtp-Source: AMrXdXu6TTTYGLa+SILLMKWwpOWZZYNwmyzupE2o6wzTTk3OqigAVRTAyV6CyW8n+m7PZJRemMcT7w==
X-Received: by 2002:a05:600c:6020:b0:3d1:f0b4:8827 with SMTP id az32-20020a05600c602000b003d1f0b48827mr38023700wmb.25.1672991497451;
        Thu, 05 Jan 2023 23:51:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a1ccc0a000000b003d237d60318sm780111wmb.2.2023.01.05.23.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:51:36 -0800 (PST)
Date: Fri, 6 Jan 2023 10:51:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kiseok Jo <kiseok.jo@irondevice.com>,
	Mark Brown <broonie@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, application@irondevice.com,
	Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 3/3] ASOC: sma1303: change the overall contents
Message-ID: <202301060752.Z9ahR5KX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104064342.2094-4-kiseok.jo@irondevice.com>
Message-ID: <20230106075130.DNkhfRLup_HNvg3IbLgqAhNlkUJ68soxmxHuiJP98J0@z>

Hi Kiseok,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1303-Add-driver-for-Iron-Device-SMA1303-Amp/20230104-150052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230104064342.2094-4-kiseok.jo%40irondevice.com
patch subject: [PATCH 3/3] ASOC: sma1303: change the overall contents
config: ia64-randconfig-m041-20230101
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
sound/soc/codecs/sma1303.c:257 sma1303_regmap_write() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:275 sma1303_regmap_update_bits() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:293 sma1303_regmap_read() error: uninitialized symbol 'ret'.
sound/soc/codecs/sma1303.c:684 sma1303_add_component_controls() error: not allocating enough for = 'name' 8 vs 3
	(This should allocate sizeof() not ARRAY_SIZE()).
sound/soc/codecs/sma1303.c:1539 sma1303_i2c_probe() warn: unsigned 'value' is never less than zero.

vim +/ret +257 sound/soc/codecs/sma1303.c

287cf116194f9c Kiseok Jo 2023-01-04  242  static int sma1303_regmap_write(struct sma1303_priv *sma1303,
0b15568ccfb962 Kiseok Jo 2023-01-04  243  				unsigned int reg, unsigned int val)
0b15568ccfb962 Kiseok Jo 2023-01-04  244  {
287cf116194f9c Kiseok Jo 2023-01-04  245  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  246  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  247  
287cf116194f9c Kiseok Jo 2023-01-04  248  	while (cnt--) {

The way I look at it, you need three bugs for this to affect real life:

BUG 1: sma1303_regmap_write() is not written robustly (this warning).
BUG 2: sma1303_i2c_probe() allows sma1303->retry_cnt of zero (it does).
BUG 3: The i2c-retry_count is set to zero.  (Probably not but also not
       unimaginable).

So, yeah, let's fix BUG 2 because retry_cnt of zero is bogus.

                if (!of_property_read_u32(np, "i2c-retry_count", &value)) {
-                        if (value > 50 || value < 0) {
+                        if (value > 50 || value <= 0) {
                                sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;

And BUG 1 to make the checker happy.

-  	int ret;
+  	int ret = -EINVAL;

287cf116194f9c Kiseok Jo 2023-01-04  249  		ret = regmap_write(sma1303->regmap, reg, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  250  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  251  			dev_err(sma1303->dev, "Failed to write [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  252  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  253  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  254  		} else
287cf116194f9c Kiseok Jo 2023-01-04  255  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  256  	}
0b15568ccfb962 Kiseok Jo 2023-01-04 @257  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  258  }
0b15568ccfb962 Kiseok Jo 2023-01-04  259  
287cf116194f9c Kiseok Jo 2023-01-04  260  static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
0b15568ccfb962 Kiseok Jo 2023-01-04  261  		unsigned int reg, unsigned int mask, unsigned int val)
0b15568ccfb962 Kiseok Jo 2023-01-04  262  {
287cf116194f9c Kiseok Jo 2023-01-04  263  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  264  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  265  
287cf116194f9c Kiseok Jo 2023-01-04  266  	while (cnt--) {
287cf116194f9c Kiseok Jo 2023-01-04  267  		ret = regmap_update_bits(sma1303->regmap, reg, mask, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  268  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  269  			dev_err(sma1303->dev, "Failed to update [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  270  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  271  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  272  		} else
287cf116194f9c Kiseok Jo 2023-01-04  273  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  274  	}
0b15568ccfb962 Kiseok Jo 2023-01-04 @275  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  276  }
0b15568ccfb962 Kiseok Jo 2023-01-04  277  
287cf116194f9c Kiseok Jo 2023-01-04  278  static int sma1303_regmap_read(struct sma1303_priv *sma1303,
287cf116194f9c Kiseok Jo 2023-01-04  279  		unsigned int reg, unsigned int *val)
0b15568ccfb962 Kiseok Jo 2023-01-04  280  {
287cf116194f9c Kiseok Jo 2023-01-04  281  	int ret;
287cf116194f9c Kiseok Jo 2023-01-04  282  	int cnt = sma1303->retry_cnt;
0b15568ccfb962 Kiseok Jo 2023-01-04  283  
287cf116194f9c Kiseok Jo 2023-01-04  284  	while (cnt--) {
287cf116194f9c Kiseok Jo 2023-01-04  285  		ret = regmap_read(sma1303->regmap, reg, val);
0b15568ccfb962 Kiseok Jo 2023-01-04  286  		if (ret < 0) {
287cf116194f9c Kiseok Jo 2023-01-04  287  			dev_err(sma1303->dev, "Failed to read [0x%02X]\n", reg);
287cf116194f9c Kiseok Jo 2023-01-04  288  			if (gCallback.set_i2c_err)
287cf116194f9c Kiseok Jo 2023-01-04  289  				gCallback.set_i2c_err(sma1303->dev, ret);
287cf116194f9c Kiseok Jo 2023-01-04  290  		} else
287cf116194f9c Kiseok Jo 2023-01-04  291  			break;
0b15568ccfb962 Kiseok Jo 2023-01-04  292  	}
287cf116194f9c Kiseok Jo 2023-01-04 @293  	return ret;
0b15568ccfb962 Kiseok Jo 2023-01-04  294  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

