Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74DE1DE8A0
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736233844; cv=none; b=WPsOHb5q+VsxINh+lmLrpTB1dg1HGAcjG0E3TBL64FjtYp31YsQoPJMT4tjqjEbtNR2i7+dNvpYOTtzOc+BngYK8wSAnsjmHsh9tVaYg/m50nfk6h08O5IggaiJpjTTuhZyXREe/Ym6wXClQPxplh6LVQ6VJWO9bc2+WMsaNpKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736233844; c=relaxed/simple;
	bh=knmlkzZmomk2UGvcFIon1Q9Wd0GhVKMpQAKMHPp8gtk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VT+z6lxBsq+vxqnALgUuMp2C0O/+Lgw6LOj51CfqI7vmMKK04dnyDR8iLVaecMVB3UKdCAJcjG4UPEyi6RLwsKHHZXwRdU36myjZCRkusfTGe6nEMUGtOyjCBRYrKWCAzG5y73hx5bnvfq8fROTRCj7O81Ro/C/JLtBEjWqwMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlPH96pF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlPH96pF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43624b2d453so156241065e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 23:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736233839; x=1736838639; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxC2QvRLaa9fhyMEEmnqLTIucuZnpaiOnMycBsmrjig=;
        b=vlPH96pFlVWzprGxsw7Gpknbr2VwQt581IbBghkcy4DMBVtD04VZrCjaLAvbXaMlXR
         5IGVvgvfvTHB2/C0i/+jl0EdcXS4NblJOKxXDoGNIUGUAnEYslNeaZaGAt2/Z+DfJny3
         GWIXR5UJAsjU46awSKCJH9h5TG9o6RFpEOhLLay/oeLT0b/gq/D5v9QGHeOwmQSRjTb6
         tXYU8hwyFiwFXiV2viH+t0RtCZWgiUeUtgRifkSM8wfvvlykODG2H1p/wV3NYawuzOIc
         EK0JbOVHzayyxHyoyR1/FAFUluIvS2weoJS+gwHgiVTju5b7lVBvbGQWpV+6M4YLoY7L
         HPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736233839; x=1736838639;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxC2QvRLaa9fhyMEEmnqLTIucuZnpaiOnMycBsmrjig=;
        b=RjVW1xse1TnhpWfApY2YcppA2KaHRq4Z5RhPYh0A1EZI28bfOKTVOrGQtUiRM1oZnT
         YGteZzLT1NkxrAoLnpYiotk9fIOGSFBb4z8hpQmoTFi3JLX4mFvXmjG35wHA/7KjK4eS
         Eb47jhV6N+KQDnYIpYpLrREwVM6/qsW7LVjIEdt1sqv1aSgMMjCG6Yvuj9as6jMbEH4t
         CbR5GU3zS9yydNCBGzOrOz4Gb7nJDT5fG+ZoqJP8JtvxWNoQUlxDaU1zt5xe3u+39V/w
         OtwJqMJYy3rZXA+o50d6qJOF3XvNCjYiQGx/8EsUEI5UooKhQTpTThGwVA8XeYS7QDNA
         v+2g==
X-Gm-Message-State: AOJu0Yxr3lIMJvq6GXcTFxZLVkC9Vg/LeoF5MrH4aECHECgD/nfi431H
	uWARIItTcXGp1eL4Ure50wVEHFEmpxHE62wFyTbo6nSGWRTvkI2+oUeJA7CmPp10CdzZkslhCfC
	v
X-Gm-Gg: ASbGnctTooyKsSTXz5DFME7giMuzM3Ku5xw3N5T4fmyN1cK+29WIqTA1UbKjiEYACuy
	gPogrZ+Kjf575b3cWk8BbfRpijxiXQ+RbrfCvJ5uEXhkC1/nKaEcVdeW7ejfAGpH3QrEnwvDc/7
	AKsCsBMKCQo/vU69uiRwTTrf0hNas6d9ZSitVF+05wODp2yDKpZvxVGV6GVnq3g/yloSGouWW4r
	Bxf5iskbsKAkvsXwrMejVTp07tvdubsIJTA2DFJ4r7YdZ0neGSyZHWrABCM9w==
X-Google-Smtp-Source: AGHT+IFIR4835eW6e7ZZ8gI1DpDQcwGI8R4kehDIZa6LnIgHnu7A7jNtqUCLWF6+KIJF30TnCX1P0g==
X-Received: by 2002:adf:a445:0:b0:38a:2b39:9205 with SMTP id ffacd0b85a97d-38a2b3993dfmr39812671f8f.33.1736233838547;
        Mon, 06 Jan 2025 23:10:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm48855108f8f.15.2025.01.06.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 23:10:38 -0800 (PST)
Date: Tue, 7 Jan 2025 10:10:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Divya Koppera <divya.koppera@microchip.com>,
	andrew@lunn.ch, arun.ramadoss@microchip.com,
	UNGLinuxDriver@microchip.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT
 feature library for RDS PTP supported phys
Message-ID: <f65330e7-825b-46ff-8e95-c046a2359705@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103090731.1355-4-divya.koppera@microchip.com>

Hi Divya,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Divya-Koppera/net-phy-microchip_rds_ptp-Header-file-library-changes-for-PEROUT/20250103-171126
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250103090731.1355-4-divya.koppera%40microchip.com
patch subject: [PATCH net-next 3/3] net: phy: microchip_rds_ptp : Add PEROUT feature library for RDS PTP supported phys
config: arm64-randconfig-r072-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071428.F9gIQY3T-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501071428.F9gIQY3T-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_rds_ptp.c:247 mchp_rds_ptp_perout_off() error: uninitialized symbol 'event'.

vim +/event +247 drivers/net/phy/microchip_rds_ptp.c

568c86a861124f Divya Koppera 2025-01-03  228  static int mchp_rds_ptp_perout_off(struct mchp_rds_ptp_clock *clock,
568c86a861124f Divya Koppera 2025-01-03  229  				   s8 gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  230  {
568c86a861124f Divya Koppera 2025-01-03  231  	u16 general_config;
568c86a861124f Divya Koppera 2025-01-03  232  	int event;
568c86a861124f Divya Koppera 2025-01-03  233  	int rc;
568c86a861124f Divya Koppera 2025-01-03  234  
568c86a861124f Divya Koppera 2025-01-03  235  	if (clock->mchp_rds_ptp_event_a == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  236  		event = MCHP_RDS_PTP_EVT_A;
568c86a861124f Divya Koppera 2025-01-03  237  	else if (clock->mchp_rds_ptp_event_b == gpio_pin)
568c86a861124f Divya Koppera 2025-01-03  238  		event = MCHP_RDS_PTP_EVT_B;

What about: else return -EINVAL;?

568c86a861124f Divya Koppera 2025-01-03  239  
568c86a861124f Divya Koppera 2025-01-03  240  	/* Set target to too far in the future, effectively disabling it */
568c86a861124f Divya Koppera 2025-01-03  241  	rc = mchp_set_clock_target(clock, gpio_pin, 0xFFFFFFFF, 0);
568c86a861124f Divya Koppera 2025-01-03  242  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  243  		return rc;
568c86a861124f Divya Koppera 2025-01-03  244  
568c86a861124f Divya Koppera 2025-01-03  245  	general_config = mchp_rds_phy_read_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  246  					       MCHP_RDS_PTP_CLOCK);
568c86a861124f Divya Koppera 2025-01-03 @247  	general_config |= MCHP_RDS_PTP_GEN_CFG_RELOAD_ADD_X_(event);
568c86a861124f Divya Koppera 2025-01-03  248  	rc = mchp_rds_phy_write_mmd(clock, MCHP_RDS_PTP_GEN_CFG,
568c86a861124f Divya Koppera 2025-01-03  249  				    MCHP_RDS_PTP_CLOCK, general_config);
568c86a861124f Divya Koppera 2025-01-03  250  	if (rc < 0)
568c86a861124f Divya Koppera 2025-01-03  251  		return rc;
568c86a861124f Divya Koppera 2025-01-03  252  
568c86a861124f Divya Koppera 2025-01-03  253  	if (event == MCHP_RDS_PTP_EVT_A)
568c86a861124f Divya Koppera 2025-01-03  254  		clock->mchp_rds_ptp_event_a = -1;
568c86a861124f Divya Koppera 2025-01-03  255  
568c86a861124f Divya Koppera 2025-01-03  256  	if (event == MCHP_RDS_PTP_EVT_B)
568c86a861124f Divya Koppera 2025-01-03  257  		clock->mchp_rds_ptp_event_b = -1;
568c86a861124f Divya Koppera 2025-01-03  258  
568c86a861124f Divya Koppera 2025-01-03  259  	return 0;
568c86a861124f Divya Koppera 2025-01-03  260  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

