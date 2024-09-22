Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94A1E529
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 02:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726970718; cv=none; b=TgArvArPrvpQipDcm0NweSlqmPK/FDNjCiRGveg2viGISQb3fG+MYP1YV04mtZNuqKp3E9DMJ0H3VOZ1W7ykJVAOvYEk4mLsOVotemhHLgpWsebYbTvYJJeJBlA3mbDqdGZtEBwZIoDvKg4DP9gIpvOZNQNQ0uryvyJr/h8zeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726970718; c=relaxed/simple;
	bh=wWgABVY+YZ+53+DW9uwquH14/61ILWgrjF0MyMiIynk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dG00nT3hEvf6GPD9F4Gd9Je1g4NHxYmd44SS9EyH2LnKgFuRhR+ImB+YkjSOp0eEny5FfRF02mcdbxaIx1XQoldAgF9HaKxTH4lU8FKdJXBEVV+Z8a55Q6ITNwMpdTaQxSsmZ1czMOowphbWL3H4s+6wuOq62jQ01TJFI7m3sVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIGFxuvy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIGFxuvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726970717; x=1758506717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWgABVY+YZ+53+DW9uwquH14/61ILWgrjF0MyMiIynk=;
  b=WIGFxuvyRvtuMvM+Y94QlJUvjJiiZQuApW2+6iK12CmcMDYj+olP7Qe6
   sPpIXn5hyO7weZZiKaGqtdwHdelkYbF8cbwo26U8J98kkiRDH0CoRY0XZ
   QLydY4qVBIpeeoeANvwnU1uqPe5CoNx61W1bIfrI6imMb0najUrSkag1m
   Kby/md/11PbPbO5otYyBfO2zh7x360bSapad0h1PQloMUwO1FUbsKIKcZ
   weet+oWEqcWlUbjl2O9mrnD5iCntTw8lSmL6LAldo1FmPHlCnhwVlgRBC
   pmg8acnB8aN5WAu36DzSad+16r0CTjh3skVg8HYTzwfhOpu3vqcT9RsNJ
   A==;
X-CSE-ConnectionGUID: iaqXyhOPQ6ytJXaRviRcCg==
X-CSE-MsgGUID: X/im4AgSRumTV695iibeLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26094403"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="26094403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 19:05:14 -0700
X-CSE-ConnectionGUID: U5gGqOZeQqe0NH2YwtLQOA==
X-CSE-MsgGUID: AsvWqba8TuyuEothjXmiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="70583301"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Sep 2024 19:05:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssByI-000Fxa-02;
	Sun, 22 Sep 2024 02:05:10 +0000
Date: Sun, 22 Sep 2024 10:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 1475/30000]
 drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <202409220948.jLjSj76m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jon Moeller <jon.moeller@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: fadb19e08fbf603c6b11d9c45dbf33accdd58016 [1475/30000] platform/x86: add sep and socwatch drivers without socperf.
:::::: branch date: 3 weeks ago
:::::: commit date: 5 years ago
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409220948.jLjSj76m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409220948.jLjSj76m-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3127 lwpmudrv_Read_Counters_And_Switch_Group() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/apic.c:121 apic_Get_APIC_ID() warn: inconsistent indenting

Old smatch warnings:
drivers/platform/x86/sepdk/sep/lwpmudrv.c:941 lwpmudrv_Initialize_Driver() warn: potential user controlled sizeof overflow '(driver_state.num_cpus) * (drv_cfg->num_events) * 8' '0-u32max * 8'
drivers/platform/x86/sepdk/sep/lwpmudrv.c:2204 lwpmudrv_Trigger_Read() error: we previously assumed 'drv_cfg' could be null (see line 2196)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3283 lwpmudrv_Read_And_Reset_Counters() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3535 lwpmudrv_Configure_Events() warn: potential spectre issue '(&devices[cur_device])->PMU_register_data' [w] (local cap)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3617 lwpmudrv_Configure_Events_UNC() warn: potential spectre issue 'PMU_register_data_unc' [w] (local cap)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3621 lwpmudrv_Configure_Events_UNC() warn: possible spectre second half.  'ecb'
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5158 lwpmudrv_Get_Platform_Info() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5190 lwpmudrv_Get_Platform_Info() warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5246 lwpmudrv_Setup_Cpu_Topology() warn: potential spectre issue 'pcb' [w]

vim +721 drivers/platform/x86/sepdk/pax/pax.c

fadb19e08fbf60 Jon Moeller 2018-11-13  709  
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
fadb19e08fbf60 Jon Moeller 2018-11-13  722  	}
fadb19e08fbf60 Jon Moeller 2018-11-13  723  
fadb19e08fbf60 Jon Moeller 2018-11-13  724  	status = pax_Service_IOCTL(IOCTL_USE_INODE filp, cmd, local_args);
fadb19e08fbf60 Jon Moeller 2018-11-13  725  	return status;
fadb19e08fbf60 Jon Moeller 2018-11-13  726  }
fadb19e08fbf60 Jon Moeller 2018-11-13  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
