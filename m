Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08850A923
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 06:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726553934; cv=none; b=LPY+lUYbv1fSx3WV9hd+r4d8Ht5jCQItfjHnTOtzwgT5ZF92K4My8EuFAbnIhs0EWUleRcmDnJo4P1ku+1dLefIJU3dLFmon/3wpLTcP3QUuXgD2SU6yeHtUyLGLHV0O5VG3bvJ4meJjDSxorDqventO37y42v1pmGO+REerjzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726553934; c=relaxed/simple;
	bh=0U+cIwVgdzujyRescGVEebfkCPDNXKBBXOoOIrxS8rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YxpDDkpdtRuoy/f7vNU5Al3fwcgZo/yi5wEkjo6WjlvnA4FyKCJojrCkVH91Tv9HD07Eedlb5My/oGgsZguYPHnJ3S/TZuHmApPfE2MR/C53NwM2CDMEidGlPtTHOk0ZiPDMI96OLQvnfJ0LoghAT5SNbzvvkJAXAIKCT2Mrg6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LABCZz/F; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LABCZz/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726553932; x=1758089932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0U+cIwVgdzujyRescGVEebfkCPDNXKBBXOoOIrxS8rM=;
  b=LABCZz/F6AnZnxvfXB7NlZFzX+dANNIvMpCJaneTEfKakMZUsmkR+x3q
   WSHn3s2pQinc/OKTtqzXU7RydrWlXpe3xD6zKABmwIK1GKDs98xCJx49B
   mHqKN/cso8meWBEUUeWF6HphX9hoAvdLhIRpr1ci/b0YVwL6yXVGI9eed
   6/b+/p6rjfUhksGx205JplubYs6Z+zDUQ/OnODjFpB6VQUUBMMXTi+6Qr
   xFZmNeqdbbGph6mEr3+m7V0fgtT7XCB0UDq0t6sjunUXvNqe9Jymm1aMm
   67cLDogq+43FMmVs/x3R7EQ4fOWDXXQtFWndfZ0GdFV99Q8eq6bqEBL77
   g==;
X-CSE-ConnectionGUID: BnZvAmu2RvSwZXVwzU+6iQ==
X-CSE-MsgGUID: pok+0DkXQEKPpWiMuowC1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36069837"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="36069837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 23:18:51 -0700
X-CSE-ConnectionGUID: dNeIUXU0QBG0V+KW0KK1+w==
X-CSE-MsgGUID: pynRnMREQ1en/bJnmQG5XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="73674983"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Sep 2024 23:18:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqRXz-000AqY-2h;
	Tue, 17 Sep 2024 06:18:47 +0000
Date: Tue, 17 Sep 2024 14:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 1475/30000]
 drivers/platform/x86/sepdk/pax/pax.c:743 pax_Device_Control_Compat() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202409171451.n6mxGKQ8-lkp@intel.com>
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
:::::: branch date: 2 weeks ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240917/202409171451.n6mxGKQ8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409171451.n6mxGKQ8-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:743 pax_Device_Control_Compat() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/platform/x86/sepdk/pax/pax.c:721 pax_Device_Control() warn: maybe return -EFAULT instead of the bytes remaining?

vim +743 drivers/platform/x86/sepdk/pax/pax.c

fadb19e08fbf60 Jon Moeller 2018-11-13  727  
fadb19e08fbf60 Jon Moeller 2018-11-13  728  #if defined(CONFIG_COMPAT) && defined(DRV_EM64T)
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
fadb19e08fbf60 Jon Moeller 2018-11-13  762  #endif
fadb19e08fbf60 Jon Moeller 2018-11-13  763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
