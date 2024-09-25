Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328815575D
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251972; cv=none; b=bbsuMADxHT/iUrulX6mH3krnKdxeYhtVBLS8WVOhc7nTO1wqsq4sUn0V0yjyCmwUFy3z+e3kXemd+7E4cdYdujB0HhIDuWmRyJq7Iwmc+kemX+YfZHNpaj3mKRyQ3IGb3UZKyvpl/ko914W8UttvfC3BrkVffd5DZxxVTYxQ7hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251972; c=relaxed/simple;
	bh=aI0X1XVwxIFXzZrDFD8Gd0UnbgkarzAQ7Zg6Gz1tBxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMOMTuPNOr8EG3b1v6LLyanRgK2+fBDBz52gLB5rNSFzgLdbAjjHq1pVnUsPtVdRXtHPO31a0Vz+IbpL4exNDYxcStALNkmtyfF+Jyj0GekoUJkSTIctTK671PVbVPZ2NTPIBP1Cl8tYjxkRqVf0Yes2YPI9x6fz+XlEED49YjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzOKKmOm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzOKKmOm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so63787355e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251969; x=1727856769; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaKREgr9ETPcnfO9Vhe2EDp1+mKEDGarvV6F5RlJ8XU=;
        b=FzOKKmOmkjRJsu707Ajnv/z4l/Yqfth9i027sKAyZBZGWEzVTW9EOvxr2Dp5D2/6hH
         ffsQdx9VdBvb7oOJyD1TKGACK64CZ5HBpeU1e8nDgWxLRl6pWiHqIVKjupVvXzazOxUF
         PDaApT3DA90mTDDjqMFBn/gw5NEntTkGNrjkzhQERxiTOKeiunxBRybQiNIBiwdaexRV
         cLlaMkjA50+n4Medmevn5InPLuac9SE+LmOVLMR+YrvNcS+mOPbDNFpbUusJITZfkslA
         MEf1OiskQ30BZ8/nnMSIg/UlqKqrv8ru/riHOrM9h4aAT6KFvffTBo3xnVURLFhXPPCQ
         0puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251969; x=1727856769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaKREgr9ETPcnfO9Vhe2EDp1+mKEDGarvV6F5RlJ8XU=;
        b=F2GPGx5HSrVhG+gXer2IdzjwDpnLH7P0t6VIdBssXEzccO5qwpNzYf4KVGffNUnYd3
         HOZQpH8HV0/LsLof7wdTSsKvobOcn7LZuXK4Qye5wEc+7aKnQGRx4vS1qQJVQEwvPLoF
         urdQ7FqVAGeDYsF5RwASvFLg6l1FlC3VCP3kqrCM62u8Qu5SPu3QYR6/Z9qv5WlsF89d
         fDTk3ASdevSY8pBiEFeiiFbllZZDT+JCGPef4jD+A22GE+WyA3mztmTNqqFEAqZt6QJQ
         xxA/Q4/bOT+Xl/Mm3m5qqpsn1/cQTRWxcFBchJN0YJzXpp9Vtsa8a1Mcv/RKqo3s0XIy
         gfig==
X-Gm-Message-State: AOJu0YwpOSz5EEAdVvc6PkXR6RpMz9Yn1cTp+PIBWiaX+fbbzxcnRP/0
	mUwnoESWGP3ABtwxGB4HK2F4FMJRGBz/zOdNQUw76rCrda5iGlptlRIK2kE5t9IWHwcoeP15i7T
	s
X-Google-Smtp-Source: AGHT+IENqaVpG7DHWgskC+XD7IKxh5q7yuzancOgci1smGpVt4PVuknZD6UoRbFMWp/cRM8q0rwETQ==
X-Received: by 2002:a05:600c:3b18:b0:426:5fe1:ec7a with SMTP id 5b1f17b1804b1-42e96242e81mr10555265e9.31.1727251969089;
        Wed, 25 Sep 2024 01:12:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a1697dsm10560815e9.38.2024.09.25.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:12:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:12:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jon Moeller <jon.moeller@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 1475/30000]
 drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <a372d6c7-9843-4084-96cc-30b40e1872f3@stanley.mountain>
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
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409220948.jLjSj76m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409220948.jLjSj76m-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3127 lwpmudrv_Read_Counters_And_Switch_Group() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/apic.c:121 apic_Get_APIC_ID() warn: inconsistent indenting

Old smatch warnings:
drivers/platform/x86/sepdk/sep/lwpmudrv.c:941 lwpmudrv_Initialize_Driver() warn: potential user controlled sizeof overflow '(driver_state.num_cpus) * (drv_cfg->num_events) * 8' '0-u32max * 8'
drivers/platform/x86/sepdk/sep/lwpmudrv.c:2204 lwpmudrv_Trigger_Read() error: we previously assumed 'drv_cfg' could be null (see line 2196)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3283 lwpmudrv_Read_And_Reset_Counters() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5158 lwpmudrv_Get_Platform_Info() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5190 lwpmudrv_Get_Platform_Info() warn: maybe return -EFAULT instead of the bytes remaining?

vim +721 drivers/platform/x86/sepdk/pax/pax.c

fadb19e08fbf60 Jon Moeller 2018-11-13  710  static long pax_Device_Control(IOCTL_USE_INODE struct file *filp,
fadb19e08fbf60 Jon Moeller 2018-11-13  711  			       unsigned int cmd, unsigned long arg)
fadb19e08fbf60 Jon Moeller 2018-11-13  712  {
fadb19e08fbf60 Jon Moeller 2018-11-13  713  	int status = OS_SUCCESS;
fadb19e08fbf60 Jon Moeller 2018-11-13  714  	IOCTL_ARGS_NODE local_args;
fadb19e08fbf60 Jon Moeller 2018-11-13  715  
fadb19e08fbf60 Jon Moeller 2018-11-13  716  	memset(&local_args, 0, sizeof(IOCTL_ARGS_NODE));
fadb19e08fbf60 Jon Moeller 2018-11-13  717  	if (arg) {
fadb19e08fbf60 Jon Moeller 2018-11-13  718  		status = copy_from_user(&local_args, (void __user *)arg,
fadb19e08fbf60 Jon Moeller 2018-11-13  719  					sizeof(IOCTL_ARGS_NODE));
fadb19e08fbf60 Jon Moeller 2018-11-13  720  		if (status != OS_SUCCESS)
fadb19e08fbf60 Jon Moeller 2018-11-13 @721  			return status;

if (copy_from_user())
	return -EFAULT;

fadb19e08fbf60 Jon Moeller 2018-11-13  722  	}
fadb19e08fbf60 Jon Moeller 2018-11-13  723  
fadb19e08fbf60 Jon Moeller 2018-11-13  724  	status = pax_Service_IOCTL(IOCTL_USE_INODE filp, cmd, local_args);
fadb19e08fbf60 Jon Moeller 2018-11-13  725  	return status;
fadb19e08fbf60 Jon Moeller 2018-11-13  726  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

