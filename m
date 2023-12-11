Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4167620B19
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 08:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xX09QnTs"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a1e35c2807fso547537566b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 00:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702282217; x=1702887017; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xi45JTzQiulIXlnGkIaxF8gVg0QbWWgrQaZHWcPYRzI=;
        b=xX09QnTsRcYIsYtS5GFvxp9bb/EVH4jiJU05M4mUvbTfbX09bmz1gLoHvJhBnW0Eqm
         eUiVvgt1QC4+xz7emYFLC0X2fBWHjSsNb0KFpJSbVCfY+JEGHtST6bNcGL0NqarL6HyS
         Hf68EAGCLplEyrsaDRUg+gBUK5OD3SZUg84zy84XBlFKMGDepoIp8sL8iTbxqky5kLvj
         cBIZlw2HeeiFJz21B7udC2K4j2jeF6silMHy9nAP0smDYKx4O1KPj86WN2geREEWjiaP
         MfXDhyvnFbq4tTks0PUfbOU9TJwvxt0AiciQrWOislkAmTSyXmhiDU8GSJsecpIG1t4x
         j2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702282217; x=1702887017;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi45JTzQiulIXlnGkIaxF8gVg0QbWWgrQaZHWcPYRzI=;
        b=fD0B0mL+L3+lobuTNr0opOrcKSdFmp1vqGSvG7jMMryuqYkvh9+EieWswzTlDmO2B7
         sSK2mOfhP51v41eh6DpcgnWwd9m4WdDkXq5/xN5/Rbth2z/ex4Fp7mYx4qOd+PXcAIvm
         9TijPSKOugSqE4FlOZHdsN2xWgg8pByFcnLZbrBBdyPjjxpxYWChOiDs80OISCTnL8NK
         B5hNWXg1Xha6cZN08T/8x7Y8InP/wxQYsAXhT3oqnn7fGpMb/v2koVr5DA/p3ZcbaOVj
         G0FgmWe6jQtslHHyK5OPp1NO/j6ISvv3WiDphXrI2u87uPBjsAsfytwyzYPhysLo28va
         NVhA==
X-Gm-Message-State: AOJu0YzxMKBPt6GShmU56uyUpSOsILp9OkpZ7qHq/bjQILybO4UZ+949
	L5uJfwkRHtCWx1qx7BWKtvksGKlBhcbuJ7XfBic=
X-Google-Smtp-Source: AGHT+IHIjJcU6nJQlzbJOU/5lxh5ZB5oremY7q44w6+sziripj2KODC/+IrHQi8hAIyI72q8fPFQIw==
X-Received: by 2002:a17:907:7251:b0:a02:54fa:4f2f with SMTP id ds17-20020a170907725100b00a0254fa4f2fmr2331370ejc.53.1702282216802;
        Mon, 11 Dec 2023 00:10:16 -0800 (PST)
Received: from localhost (hf89.n1.ips.mtn.co.ug. [41.210.143.137])
        by smtp.gmail.com with ESMTPSA id b42-20020a509f2d000000b0054cc6be8b0bsm3525295edf.32.2023.12.11.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 00:10:16 -0800 (PST)
Date: Mon, 11 Dec 2023 11:10:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/11] drivers/phy/apple/atc.c:1609
 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
Message-ID: <3b615383-5149-4fee-9c5f-51d236d8ddf5@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3b2571b8e8064a73eca2cec23cf86cfe7f7050f5 [3/11] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231211/202312110624.SVpwzkJ6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312110624.SVpwzkJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312110624.SVpwzkJ6-lkp@intel.com/

smatch warnings:
drivers/phy/apple/atc.c:1609 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2157 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

vim +1609 drivers/phy/apple/atc.c

3b2571b8e8064a Sven Peter 2022-11-30  1567  static int atcphy_usb3_power_on(struct phy *phy)
3b2571b8e8064a Sven Peter 2022-11-30  1568  {
3b2571b8e8064a Sven Peter 2022-11-30  1569  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
3b2571b8e8064a Sven Peter 2022-11-30  1570  	enum atcphy_pipehandler_state state;
3b2571b8e8064a Sven Peter 2022-11-30  1571  	int ret = 0;
3b2571b8e8064a Sven Peter 2022-11-30  1572  
3b2571b8e8064a Sven Peter 2022-11-30  1573  	/*
3b2571b8e8064a Sven Peter 2022-11-30  1574  	 * Both usb role switch and mux set work will be running concurrently.
3b2571b8e8064a Sven Peter 2022-11-30  1575  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
3b2571b8e8064a Sven Peter 2022-11-30  1576  	 * trying to switch dwc3 to the correct PHY.
3b2571b8e8064a Sven Peter 2022-11-30  1577  	 */
3b2571b8e8064a Sven Peter 2022-11-30  1578  	mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1579  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1580  		reinit_completion(&atcphy->atcphy_online_event);
3b2571b8e8064a Sven Peter 2022-11-30  1581  		mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1582  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
3b2571b8e8064a Sven Peter 2022-11-30  1583  					msecs_to_jiffies(1000));
3b2571b8e8064a Sven Peter 2022-11-30  1584  		mutex_lock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1585  	}
3b2571b8e8064a Sven Peter 2022-11-30  1586  
3b2571b8e8064a Sven Peter 2022-11-30  1587  	if (atcphy->mode != atcphy->target_mode) {
3b2571b8e8064a Sven Peter 2022-11-30  1588  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
3b2571b8e8064a Sven Peter 2022-11-30  1589  		return -EINVAL;

mutex_unlock(&atcphy->lock); before returning.

3b2571b8e8064a Sven Peter 2022-11-30  1590  	}
3b2571b8e8064a Sven Peter 2022-11-30  1591  
3b2571b8e8064a Sven Peter 2022-11-30  1592  	atcphy->dwc3_online = true;
3b2571b8e8064a Sven Peter 2022-11-30  1593  	state = atcphy_modes[atcphy->mode].pipehandler_state;
3b2571b8e8064a Sven Peter 2022-11-30  1594  	switch (state) {
3b2571b8e8064a Sven Peter 2022-11-30  1595  	case ATCPHY_PIPEHANDLER_STATE_USB2:
3b2571b8e8064a Sven Peter 2022-11-30  1596  	case ATCPHY_PIPEHANDLER_STATE_USB3:
3b2571b8e8064a Sven Peter 2022-11-30  1597  		ret = atcphy_configure_pipehandler(atcphy, state);
3b2571b8e8064a Sven Peter 2022-11-30  1598  		break;
3b2571b8e8064a Sven Peter 2022-11-30  1599  
3b2571b8e8064a Sven Peter 2022-11-30  1600  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
3b2571b8e8064a Sven Peter 2022-11-30  1601  	default:
3b2571b8e8064a Sven Peter 2022-11-30  1602  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
3b2571b8e8064a Sven Peter 2022-11-30  1603  			 state);
3b2571b8e8064a Sven Peter 2022-11-30  1604  		ret = -EINVAL;
3b2571b8e8064a Sven Peter 2022-11-30  1605  	}
3b2571b8e8064a Sven Peter 2022-11-30  1606  
3b2571b8e8064a Sven Peter 2022-11-30  1607  	mutex_unlock(&atcphy->lock);
3b2571b8e8064a Sven Peter 2022-11-30  1608  
3b2571b8e8064a Sven Peter 2022-11-30 @1609  	return 0;
3b2571b8e8064a Sven Peter 2022-11-30  1610  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

