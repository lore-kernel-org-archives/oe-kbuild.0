Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D01547C9
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 05:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053235; cv=none; b=J1WY6umyC5TSfKlWC832C/WjLLw3hodV8r5rH/o8u81sEsglwoBclr20wEs1pIGQJHDEs3g9pzbSzVRR53YfOSzEAZOw4CEBLf/IZSn1/QcPwrNiSy++AN65X/MuP1l3p3g7P4w8+k5w2WuZUmG+jTLVe3uedCN1nDOLRJIGr5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053235; c=relaxed/simple;
	bh=thMbS49qbqX11dIS6IU1v+POK8UjDMlFhVuo86bY83w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E2orAo+PbS1FCOfIA03Ibk+96t5qtNo2FxtrpXDAlOuOtb8kR+iV9sn1bIIFjg5QDESy66dRT/Eu4Ei69mffii8W53FApJCrruixKbpinoqFOueT3XLiXnNc2RHx8fJrgaUCWiLEfh+fnWQeljZ8mXEagaFsgHLmhCwsOoOEQ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CY2GBxTC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CY2GBxTC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399737f4fa4so147681f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 22:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743053231; x=1743658031; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bOR1/27k/4vBaaEK3EepMLA9XBiPxa8J1dvmh2SqxNw=;
        b=CY2GBxTCPtLC+e3im1rdgbvVYAVWo/sGYIFG7GIpHgBo2956Kb8VQLjUbCP3O6i3xx
         KT4+YVtVNI2FXhZ8Ux+E1JHrWS4E0mal3GSWBPO8hJFUazLZ+gBJ5qiZXRxMmCbR0oTO
         nK47pN2tA4oRAFsTxjQVD7EhbZnErGybiKSv/NWx06mHVClQDDaUp0x7C3jB0xsH36zr
         JrqELyDl/sgIl7TbShW/GVbFMy2XL4dnXLQQRaNxI57rECplUdONofemAr9jhntFLYZk
         MoAU1+FJLMIS3w3t+0m6X+8DtKYD08O6Wjhhu36jv1kJftjnjRx9K/hSP0OMNgUbgTFI
         VDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743053231; x=1743658031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOR1/27k/4vBaaEK3EepMLA9XBiPxa8J1dvmh2SqxNw=;
        b=fOAFLis2HFnKf4nBAORem3YO2H7OLTrhxecYDbYPEM54lZ1ccKiM1Bs24DFFk4AEwL
         2JY16i69fqrrGzW8gSvjYpwGgQbtGQogyhA+AiiAOu5tuYkw0FQtoikfyI8XOrhBffVF
         IeXFy81Xx4GOso/d5oY76Nm/fqtws8f88CyzVzb3cI15bukqyLYoCoqZft8uicbelGha
         emJPwFI5xwM2pmtdSaU9it5+vm5y/S6gqDUyGG1rZsNWpTf+YIJTyMtcaZaALIHPUC+P
         ZFnt4CXupWnKHn9ScLQO9WsfkipxkO+kc/WmBLkO/i+CnBkZGTJyI3zdOu+cHNrqJw0t
         34Yw==
X-Gm-Message-State: AOJu0Yy9NIjnpBRQ5ETc+idMEZKoHuGEKy93e8Np80nxPG0psldnWVLK
	z4n0Gkrt57qFr3QgfzyMxpmpEqQ3/UHzTIZuCWlH22rZ6iZxaH4vax4FkdzXpBoYShZVq1MLX3m
	3
X-Gm-Gg: ASbGnctFXbkx7qySoR35eGmv6ugdAJIAQ7JEpqaTcVNYWtB1/8ir7KPBNC5YTCmLM5B
	O8AWF1v4gypt8YjyPsF06G7arNld1vB37we6xmzoH229fZaeg3Qwld45jbck8tHaCJkS17ydNSb
	4K4ub+dkAAk65d+d2H5VRGgeFz2R18tnE5MWerFXlDUHWoYrbA/8NN0CXFbTinzvlkunhyofwby
	D9N8rHiMq6/hkTWX7Z8os7SeaF6WHVT0qQah3KlZKSrSfUBCwVWUKywLLtgdhXfpOEeTZqSVR7T
	VilASh3lT9dDG9STDynYCfeT7RF2r3Oew3M8RkK1fPWrfqO/
X-Google-Smtp-Source: AGHT+IFLd8YKgFKCb7L1uBamCMCBX0eWmWNcOnDWI+FLxNyMIgaY+v6wmWEz+tnV3jRSSNoPcBgWmA==
X-Received: by 2002:a05:6000:40e1:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-39ad1773089mr1658583f8f.31.1743053230795;
        Wed, 26 Mar 2025 22:27:10 -0700 (PDT)
Received: from localhost ([41.210.155.240])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9efc90sm19036327f8f.98.2025.03.26.22.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 22:27:10 -0700 (PDT)
Date: Thu, 27 Mar 2025 08:27:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>, Jens Axboe <axboe@kernel.dk>,
	Sven Peter <sven@svenpeter.dev>
Subject: [asahilinux:bits/030-misc 1/40] drivers/soc/apple/rtkit.c:371
 apple_rtkit_crashlog_rx() warn: passing freed memory 'bfr' (line 365)
Message-ID: <e29ace87-880c-48f6-8f72-7dfa8101ebea@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   da85ded736004f61e37a67eaac233c87e42ab459
commit: 037dde44780dec39060eed27b25a910d7b6e812b [1/40] soc: apple: rtkit: Pass the crashlog to the crashed() callback
config: sparc64-randconfig-r072-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271318.nPEG98L6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503271318.nPEG98L6-lkp@intel.com/

smatch warnings:
drivers/soc/apple/rtkit.c:371 apple_rtkit_crashlog_rx() warn: passing freed memory 'bfr' (line 365)

vim +/bfr +371 drivers/soc/apple/rtkit.c

9bd1d9a0d8bb1a Sven Peter 2022-05-01  334  static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
9bd1d9a0d8bb1a Sven Peter 2022-05-01  335  {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  336  	u8 type = FIELD_GET(APPLE_RTKIT_SYSLOG_TYPE, msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  337  	u8 *bfr;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  338  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  339  	if (type != APPLE_RTKIT_CRASHLOG_CRASH) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  340  		dev_warn(rtk->dev, "RTKit: Unknown crashlog message: %llx\n",
9bd1d9a0d8bb1a Sven Peter 2022-05-01  341  			 msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  342  		return;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  343  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  344  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  345  	if (!rtk->crashlog_buffer.size) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  346  		apple_rtkit_common_rx_get_buffer(rtk, &rtk->crashlog_buffer,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  347  						 APPLE_RTKIT_EP_CRASHLOG, msg);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  348  		return;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  349  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  350  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  351  	dev_err(rtk->dev, "RTKit: co-processor has crashed\n");
9bd1d9a0d8bb1a Sven Peter 2022-05-01  352  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  353  	/*
9bd1d9a0d8bb1a Sven Peter 2022-05-01  354  	 * create a shadow copy here to make sure the co-processor isn't able
9bd1d9a0d8bb1a Sven Peter 2022-05-01  355  	 * to change the log while we're dumping it. this also ensures
9bd1d9a0d8bb1a Sven Peter 2022-05-01  356  	 * the buffer is in normal memory and not iomem for e.g. the SMC
9bd1d9a0d8bb1a Sven Peter 2022-05-01  357  	 */
9bd1d9a0d8bb1a Sven Peter 2022-05-01  358  	bfr = kzalloc(rtk->crashlog_buffer.size, GFP_KERNEL);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  359  	if (bfr) {
9bd1d9a0d8bb1a Sven Peter 2022-05-01  360  		apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  361  				   rtk->crashlog_buffer.size);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  362  		apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
9bd1d9a0d8bb1a Sven Peter 2022-05-01  363  		kfree(bfr);
                                                              ^^^
9bd1d9a0d8bb1a Sven Peter 2022-05-01  364  	} else {
9bd1d9a0d8bb1a Sven Peter 2022-05-01 @365  		dev_err(rtk->dev,
9bd1d9a0d8bb1a Sven Peter 2022-05-01  366  			"RTKit: Couldn't allocate crashlog shadow buffer\n");
9bd1d9a0d8bb1a Sven Peter 2022-05-01  367  	}
9bd1d9a0d8bb1a Sven Peter 2022-05-01  368  
9bd1d9a0d8bb1a Sven Peter 2022-05-01  369  	rtk->crashed = true;
9bd1d9a0d8bb1a Sven Peter 2022-05-01  370  	if (rtk->ops->crashed)
037dde44780dec Asahi Lina 2025-02-02 @371  		rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
                                                                                       ^^^
bfr is either NULL or freed.

9bd1d9a0d8bb1a Sven Peter 2022-05-01  372  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

