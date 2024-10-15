Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563371EBFE0
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995145; cv=none; b=OVbYewO3JBmzdZOmZpOXaWl8CiAtIla+bGlBSTWuH/hn6mbgpaotITjDuKEb13qm9ndA6e/x07jiEhw7De7u5fLuIricC2GMZtHso/1iKzyEEQ+Iei+jDR23cFejdTYGK6S6k9xxQ6On3BAFbejybvJR+wWfZx5a5wiQGAdXYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995145; c=relaxed/simple;
	bh=/fihH2TP5jAc4kFfA/Zru4vSRQ/icfSmfcSO7Hdf1kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qY7VeGK9RAB8yJL7YUEWWTSvHTYaRol9ntetY7i3a7fYVdvpTEK2N5vd7+Z1HMZk63ijAN8eBjwuT/pNuzMBdUVbP367IAw2qDOe2FTtkvvZrxAZs3sKpNqEn8Rm/urKcGoXBs6mDtcAgRzRUMixJt/guFY4Ytkgp21rUIDlt4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VfBxYhjx; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfBxYhjx"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so7113834a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728995141; x=1729599941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/d3qVqqk22QfcnD/K6lapI27GTkLDUZ0y+Zs6+bSDI=;
        b=VfBxYhjxJSlYBJcEuV4+SN3F62zfGarzBdqjB+TE7n88TKrQNDien1DYkEMqg6MXY4
         z0Kf+/IA4/rOB29QoOnFI7d2K5FcIPXa3UqPMpXR24e+bTHxh4HJ8LGY1bHb0pU5xTHh
         4PU4S0eNavqNmc7halS3SGb2Lp1M5c+OlbeCso2FjLuTAZ1/HtdXa7oL+SUAR12fb4Hz
         LeY3NpjG1zTi7kDcIRB2OsyDjf0MJp+2N8+j49C4gGKa2CHKUnMEcqI3j+wdOjox1PJQ
         Pe6mWhOorMVHFwzHiteIet3iJ1FgU4/z7x+v+uuhfw8XdOeaPaHF/Ht5Jv2PPL1R4tR8
         CDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995141; x=1729599941;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/d3qVqqk22QfcnD/K6lapI27GTkLDUZ0y+Zs6+bSDI=;
        b=bqWh0WGAf+SBajJ7b5pjvKJAGgwsSBIEZdTeMXeOT85hxdDvV+tCbotdNUag/RUkIn
         Luynp4hvB79uLpwiLtLuXiPKkE7m8QwJ2YCQvWdEK7FxCZ0FhO5GZP2UjlZEeA8Wpc7H
         Tx2mUOq6ATZO/AuzzuxomPLkOatyyL8QEBfItUdYqCzeYj7C9SGA/eJ0j7T+kPBItWHf
         +ksVZbm3+StD4lXpt63M1vE1Xz+YTM+6wSmA0ojCm6ZtSNeyXeyhAOkApj9jn2N2nmKX
         sx5UtAKak3nx0N/A3XL37fvHuO8j6MDmpNSOKfAlsIoa+OFRfp0ztUcHWsvnIHTEIJi7
         sRvw==
X-Gm-Message-State: AOJu0YzY90cqpt2LscRq7PiGZdZz9f8YdvtHBnEVFFQ/UT+xXsCvzt38
	UOJGOsdELU6ToWGoJwj9k69nWtvk7PbkGaVuZLKeyH/Yi+hFV+LvM9ZCmMtyJ7Zw1CMcF0K8q8A
	T
X-Google-Smtp-Source: AGHT+IFXsBXCPILt7Y0b3y7N/JjP2t9J+Xd9na8ZFgF5el4RyVXEbaQnHtmkPRUWU6ByjHFpcRCbhA==
X-Received: by 2002:a05:6402:1e8e:b0:5c9:6fc1:6177 with SMTP id 4fb4d7f45d1cf-5c96fc162e5mr6655232a12.11.1728995141215;
        Tue, 15 Oct 2024 05:25:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d7b4a63sm649034a12.79.2024.10.15.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:25:40 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:25:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Markus Schneider-Pargmann <msp@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/9] can: m_can: Map WoL to device_set_wakeup_enable
Message-ID: <e410f909-3932-4a8d-9225-d3c49f949443@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-topic-mcan-wakeup-source-v6-12-v3-3-9752c714ad12@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241011-212232
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241011-topic-mcan-wakeup-source-v6-12-v3-3-9752c714ad12%40baylibre.com
patch subject: [PATCH v3 3/9] can: m_can: Map WoL to device_set_wakeup_enable
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151950.6UahbF47-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410151950.6UahbF47-lkp@intel.com/

smatch warnings:
drivers/net/can/m_can/m_can.c:2199 m_can_set_wol() warn: add some parenthesis here?

vim +2199 drivers/net/can/m_can/m_can.c

0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2196  static int m_can_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2197  {
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2198  	struct m_can_classdev *cdev = netdev_priv(dev);
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11 @2199  	bool wol_enable = !!wol->wolopts & WAKE_PHY;

!! has higher precedence than &.  This should be bool wol_enable = !!(wol->wolopts & WAKE_PHY);

0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2200  	int ret;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2201  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2202  	if ((wol->wolopts & WAKE_PHY) != wol->wolopts)
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2203  		return -EINVAL;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2204  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2205  	if (wol_enable == device_may_wakeup(cdev->dev))
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2206  		return 0;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2207  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2208  	ret = device_set_wakeup_enable(cdev->dev, wol_enable);
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2209  	if (ret) {
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2210  		netdev_err(cdev->net, "Failed to set wakeup enable %pE\n",
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2211  			   ERR_PTR(ret));
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2212  		return ret;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2213  	}
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2214  
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2215  	return 0;
0bd6199a58d117 Markus Schneider-Pargmann 2024-10-11  2216  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

