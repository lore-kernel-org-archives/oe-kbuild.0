Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212BC156C73
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727249215; cv=none; b=e7wgVgbsg98n5ExB4gofJwGwytAeoFXZsQTfQMp4MCunnJujYOYeg904NVtY5LlNXlAXnDYCgJ4Hnbb3AMIbXqmKby9hTB/OcRFc3jmCHHQ+U/pF0c6/RgmkCE63TGqsKneccQQTCTgjzNS12uF/gZfHiUf3LsqrceZ0sFB8V1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727249215; c=relaxed/simple;
	bh=lWYpVC8L1fm/roVxbqtH8RMznXuKmJo5Tz/a3jjMkms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o374M1YToP/xzf3HoVvGHzRQrXfrqoV7gR5V4H0D9vmCfGj4NFYm+aN13+TVHyrZc+p+0MqV9ZRNE4xMQmCY8a6GPThwaCdF09o6EbIu87m/UnqHo8vGd4w6hbgUaWGciZ7lZG0Ad0NyMmVhQZMFCkEdwaIRtF08uyGCNXTQo2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdtWw5lM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdtWw5lM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so62886145e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727249210; x=1727854010; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FONF66NnygosR4OlYGhTmBCYdfaVkR6pUxeCRJkAAg=;
        b=kdtWw5lM2LVKrH3AcFJrm3gts2x14M2L2/EpWDiIyXbdxklsDPNsoYtheGaGc+mCVb
         7Vf+NA5lS+JdqV78XdcdgT/TwQqwsml8mYykhvrGF7HT2jVj/pHhMKfvio6sFnjxoDWV
         +Ehh8kjQUKafAZ+MzDRcNSPY/UQuZKMkwTndge29jVToLleIQ8Is9AGfTUdnfHg9twZq
         Dg0IeggEdb9awgPpJpa7Zvr+JF2fYp4fJkXOShgkifJEw/G6D2y9ZZ3bJ5cGqLrk7tWb
         XVgwwqUZ5x1HyI1kq+YByhHUzlZWbXSxDjisZXOVy+s0LGaJk0QLgWL6awFhzdXUc/KK
         PDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727249210; x=1727854010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4FONF66NnygosR4OlYGhTmBCYdfaVkR6pUxeCRJkAAg=;
        b=f6wDM7PpwkXuu5KJ56G2PrBWt+MZgrpFFiAms48Ho4Y8WzFJxPF0g+AVxOLdSFT0xC
         OHdcHDNt30GxIsl+W/Nr3I2v5cVdGGhcnU+4iPfF+wjQefEzTZ8UXeic5At34xRo1aHl
         qaF64J4fCm366CMEMiVCE8bsWzEgxCEqgi2mgYha6EtxS3JRR/X+sjAfVE5/zh1k46Xi
         Y8Zdx3tTfaXs/QKnUr6Wcftow0jlcEAoQ/SzLj8nAvBt99AIIVfz5ZU2QG25t50HAODD
         jSV3mci6K9ruoMPbP4A6FWhxJVzY8gL5ZZN4STu6ALaQ7htTegdtc7mMV8CXk2pVI+7/
         qKgg==
X-Gm-Message-State: AOJu0YyldTW+iCBrvesqq2ddrr7R7q9Vqens9WKf4RR1c2YTtfNhIYNd
	+nvDO4en4KGT61RLloXXYvRzDHWRuxRTUZwXsrg4AAzK3zTmvN60IrN+H7LgmntYVy1nYGgRqOA
	w
X-Google-Smtp-Source: AGHT+IE+T6J//9xGyKTAKu1cZJBM40YkJxiDawLHppAGYE5o5q7o8ajr/dtdT7jPyxzFiPZyMgKM8A==
X-Received: by 2002:a05:600c:510e:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-42e960b004bmr13651815e9.0.1727249210530;
        Wed, 25 Sep 2024 00:26:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8af4sm3230596f8f.1.2024.09.25.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:26:50 -0700 (PDT)
Date: Wed, 25 Sep 2024 10:26:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jon Moeller <jon.moeller@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 1475/30000]
 drivers/platform/x86/sepdk/pax/pax.c:743 pax_Device_Control_Compat() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <792250f3-50ef-4c89-b0c8-68ae2a762b95@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [1475/30000] platform/x86: add sep and socwatch drivers without socperf.
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240917/202409171451.n6mxGKQ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409171451.n6mxGKQ8-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:743 pax_Device_Control_Compat() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe return -EFAULT instead of the bytes remaining?

vim +743 drivers/platform/x86/sepdk/pax/pax.c

fadb19e08fbf60 Jon Moeller 2018-11-13  729  static IOCTL_OP_TYPE pax_Device_Control_Compat(struct file *filp,
fadb19e08fbf60 Jon Moeller 2018-11-13  730  					       unsigned int cmd,
fadb19e08fbf60 Jon Moeller 2018-11-13  731  					       unsigned long arg)
fadb19e08fbf60 Jon Moeller 2018-11-13  732  {
fadb19e08fbf60 Jon Moeller 2018-11-13  733  	int status = OS_SUCCESS;
fadb19e08fbf60 Jon Moeller 2018-11-13  734  	IOCTL_COMPAT_ARGS_NODE local_args_compat;
fadb19e08fbf60 Jon Moeller 2018-11-13  735  	IOCTL_ARGS_NODE local_args;
fadb19e08fbf60 Jon Moeller 2018-11-13  736  
fadb19e08fbf60 Jon Moeller 2018-11-13  737  	memset(&local_args_compat, 0, sizeof(IOCTL_COMPAT_ARGS_NODE));
fadb19e08fbf60 Jon Moeller 2018-11-13  738  	if (arg) {
fadb19e08fbf60 Jon Moeller 2018-11-13  739  		status = copy_from_user(&local_args_compat,
fadb19e08fbf60 Jon Moeller 2018-11-13  740  					(void __user *)arg,
fadb19e08fbf60 Jon Moeller 2018-11-13  741  					sizeof(IOCTL_COMPAT_ARGS_NODE));
fadb19e08fbf60 Jon Moeller 2018-11-13  742  		if (status != OS_SUCCESS)
fadb19e08fbf60 Jon Moeller 2018-11-13 @743  			return status;


This should be:

	if (copy_from_user(&local_args_compat, (void __user *)arg,
			   sizeof(local_args_compat)))
		return -EFAULT;

fadb19e08fbf60 Jon Moeller 2018-11-13  744  	}
fadb19e08fbf60 Jon Moeller 2018-11-13  745  
fadb19e08fbf60 Jon Moeller 2018-11-13  746  	local_args.len_drv_to_usr = local_args_compat.len_drv_to_usr;
fadb19e08fbf60 Jon Moeller 2018-11-13  747  	local_args.len_usr_to_drv = local_args_compat.len_usr_to_drv;
fadb19e08fbf60 Jon Moeller 2018-11-13  748  	local_args.buf_drv_to_usr =
fadb19e08fbf60 Jon Moeller 2018-11-13  749  		(char *)compat_ptr(local_args_compat.buf_drv_to_usr);
fadb19e08fbf60 Jon Moeller 2018-11-13  750  	local_args.buf_usr_to_drv =
fadb19e08fbf60 Jon Moeller 2018-11-13  751  		(char *)compat_ptr(local_args_compat.buf_usr_to_drv);
fadb19e08fbf60 Jon Moeller 2018-11-13  752  
fadb19e08fbf60 Jon Moeller 2018-11-13  753  	if (cmd == PAX_IOCTL_COMPAT_INFO) {
fadb19e08fbf60 Jon Moeller 2018-11-13  754  		cmd = PAX_IOCTL_INFO;
fadb19e08fbf60 Jon Moeller 2018-11-13  755  	}
fadb19e08fbf60 Jon Moeller 2018-11-13  756  	local_args.command = cmd;
fadb19e08fbf60 Jon Moeller 2018-11-13  757  
fadb19e08fbf60 Jon Moeller 2018-11-13  758  	status = pax_Service_IOCTL(filp, cmd, local_args);
fadb19e08fbf60 Jon Moeller 2018-11-13  759  
fadb19e08fbf60 Jon Moeller 2018-11-13  760  	return status;
fadb19e08fbf60 Jon Moeller 2018-11-13  761  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

