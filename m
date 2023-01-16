Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A790F1852;
	Mon, 16 Jan 2023 09:06:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j17so942996wms.0;
        Mon, 16 Jan 2023 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mybuF9eD3xVvis6T5JIyJaZfvocrTCm2rxCNsyVTOkU=;
        b=q7jd9wKgXH0/Zzzn5FLkNZRBf0GRiZGtRTqGPy4rIzw78L6Rdi5PIsb9C7gC7j51kN
         s4qleK3zZ6gHylMpLV2tXMx3E6ZNRhUVuRUgAOf4nLkrBjG0/TWD7GapTYAntlmerfgY
         ADJbR25GiYFOXYU8Vuaw5gOLaO8R3Oksjbt1eWMhOwEHENAx61v1DrtiGRi+mreK96kH
         cp3+FPVAf6XD2HYZjMU+zGJvoVvqmuMfwp5UgK11L11ZVqiAdNIQEdAXBKCzGwVveqGr
         vFmlrsgdinpn3mBFF6l3kpgw8cRzYiZkV5AAsU0eCuaKVF+LrrgrTCr8/50ksU3i1XLV
         t/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mybuF9eD3xVvis6T5JIyJaZfvocrTCm2rxCNsyVTOkU=;
        b=y5GQmGksQFrmcFy7LFHno/5JebI8a9zp5feoJPbVVD3JGUFZvWxp6VTQAm0hdDJh+9
         DmfTKLTWutQNMaljaMEQMdDi0JhyKKbyPLMu9QRRB7161aW2w3Pd/xaan0mqzBV7pkBg
         DDAkhBny4hu8VBCXw1PNRlV1m9DdXcMOxA2cw5x3tsBmnnCdsJRAff36rhPbwRGLclzA
         kHHnRwrottXv6A5MHzK2GTLID+M/nfOWTN7Kf4KRqw+ZIt87KwA9iRQ/JGJeOxHrboo0
         VOxb7ew/ydkCtLsly4yCLFbpqgjsYDkEX6g0GahVCJLsXqdCEtTbTksq+YsM5grCPIAJ
         LMDw==
X-Gm-Message-State: AFqh2kq/6ExuRu7Vmt3lMTG7NC2CNrEON/HK1OMH01v4UERD4jARZN/Z
	6c5mArqBpKQ0s/HLKRAQdVAuhrgMVBw=
X-Google-Smtp-Source: AMrXdXvtJW/6I7ehLolULg8ec1+nCcU6FGQKRr6kBRTyTieMEW0T071YTtx3fhJpYdkMs/CvSVv66w==
X-Received: by 2002:a05:600c:a51:b0:3d2:3376:6f38 with SMTP id c17-20020a05600c0a5100b003d233766f38mr65109079wmq.20.1673859968652;
        Mon, 16 Jan 2023 01:06:08 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm40957158wmq.30.2023.01.16.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:06:08 -0800 (PST)
Date: Mon, 16 Jan 2023 12:06:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 3/4] drivers/phy/apple/atc.c:1606
 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
Message-ID: <202301161612.kh6CzNOx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230116090605.-AjoyY0EZIWKl30rn3HYg7XgI0JLxI62gAzhOQW5vGM@z>

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   79938b462abfcb29899b2784d426565e487e2c07
commit: 14fe97d5e1f4fd24f520a539c0d497490f669d0e [3/4] WIP: phy: apple: Add Apple Type-C PHY
config: arm64-randconfig-m041-20230115
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/phy/apple/atc.c:1606 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.
drivers/phy/apple/atc.c:2153 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2153 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2154 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

vim +1606 drivers/phy/apple/atc.c

14fe97d5e1f4fd Sven Peter 2022-11-30  1564  static int atcphy_usb3_power_on(struct phy *phy)
14fe97d5e1f4fd Sven Peter 2022-11-30  1565  {
14fe97d5e1f4fd Sven Peter 2022-11-30  1566  	struct apple_atcphy *atcphy = phy_get_drvdata(phy);
14fe97d5e1f4fd Sven Peter 2022-11-30  1567  	enum atcphy_pipehandler_state state;
14fe97d5e1f4fd Sven Peter 2022-11-30  1568  	int ret = 0;
14fe97d5e1f4fd Sven Peter 2022-11-30  1569  
14fe97d5e1f4fd Sven Peter 2022-11-30  1570  	/*
14fe97d5e1f4fd Sven Peter 2022-11-30  1571  	 * Both usb role switch and mux set work will be running concurrently.
14fe97d5e1f4fd Sven Peter 2022-11-30  1572  	 * Make sure atcphy_mux_set_work is done bringing up ATCPHY before
14fe97d5e1f4fd Sven Peter 2022-11-30  1573  	 * trying to switch dwc3 to the correct PHY.
14fe97d5e1f4fd Sven Peter 2022-11-30  1574  	 */
14fe97d5e1f4fd Sven Peter 2022-11-30  1575  	mutex_lock(&atcphy->lock);
14fe97d5e1f4fd Sven Peter 2022-11-30  1576  	if (atcphy->mode != atcphy->target_mode) {
14fe97d5e1f4fd Sven Peter 2022-11-30  1577  		reinit_completion(&atcphy->atcphy_online_event);
14fe97d5e1f4fd Sven Peter 2022-11-30  1578  		mutex_unlock(&atcphy->lock);
14fe97d5e1f4fd Sven Peter 2022-11-30  1579  		wait_for_completion_timeout(&atcphy->atcphy_online_event,
14fe97d5e1f4fd Sven Peter 2022-11-30  1580  					msecs_to_jiffies(1000));
14fe97d5e1f4fd Sven Peter 2022-11-30  1581  		mutex_lock(&atcphy->lock);
14fe97d5e1f4fd Sven Peter 2022-11-30  1582  	}
14fe97d5e1f4fd Sven Peter 2022-11-30  1583  
14fe97d5e1f4fd Sven Peter 2022-11-30  1584  	if (atcphy->mode != atcphy->target_mode) {
14fe97d5e1f4fd Sven Peter 2022-11-30  1585  		dev_err(atcphy->dev, "ATCPHY did not come up; won't allow dwc3 to come up.\n");
14fe97d5e1f4fd Sven Peter 2022-11-30  1586  		return -EINVAL;

unlock before returning

14fe97d5e1f4fd Sven Peter 2022-11-30  1587  	}
14fe97d5e1f4fd Sven Peter 2022-11-30  1588  
14fe97d5e1f4fd Sven Peter 2022-11-30  1589  	atcphy->dwc3_online = true;
14fe97d5e1f4fd Sven Peter 2022-11-30  1590  	state = atcphy_modes[atcphy->mode].pipehandler_state;
14fe97d5e1f4fd Sven Peter 2022-11-30  1591  	switch (state) {
14fe97d5e1f4fd Sven Peter 2022-11-30  1592  	case ATCPHY_PIPEHANDLER_STATE_USB2:
14fe97d5e1f4fd Sven Peter 2022-11-30  1593  	case ATCPHY_PIPEHANDLER_STATE_USB3:
14fe97d5e1f4fd Sven Peter 2022-11-30  1594  		ret = atcphy_configure_pipehandler(atcphy, state);
14fe97d5e1f4fd Sven Peter 2022-11-30  1595  		break;
14fe97d5e1f4fd Sven Peter 2022-11-30  1596  
14fe97d5e1f4fd Sven Peter 2022-11-30  1597  	case ATCPHY_PIPEHANDLER_STATE_INVALID:
14fe97d5e1f4fd Sven Peter 2022-11-30  1598  	default:
14fe97d5e1f4fd Sven Peter 2022-11-30  1599  		dev_warn(atcphy->dev, "Invalid state %d in usb3_set_phy\n",
14fe97d5e1f4fd Sven Peter 2022-11-30  1600  			 state);
14fe97d5e1f4fd Sven Peter 2022-11-30  1601  		ret = -EINVAL;
14fe97d5e1f4fd Sven Peter 2022-11-30  1602  	}
14fe97d5e1f4fd Sven Peter 2022-11-30  1603  
14fe97d5e1f4fd Sven Peter 2022-11-30  1604  	mutex_unlock(&atcphy->lock);
14fe97d5e1f4fd Sven Peter 2022-11-30  1605  
14fe97d5e1f4fd Sven Peter 2022-11-30 @1606  	return 0;
14fe97d5e1f4fd Sven Peter 2022-11-30  1607  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

