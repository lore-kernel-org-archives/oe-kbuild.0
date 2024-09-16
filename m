Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A443912B8B
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 04:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726461655; cv=none; b=qFl7AtsN6K1nvr2jAAzo+iwGA8kctLC9Bbn34Pzr5f/3RvkC3RaTkh4rU4yc/6s0DUhQDxr5cYO9mo1UhlUPy0pnDUXj60Q5lQsx1o/a5rzJGQ01nSbfoIaFJdC5Z7LUYlmOQYqk5ItIMl85D+8ZsxFvdFwM9i3DNwDgX8BR3gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726461655; c=relaxed/simple;
	bh=MOPtgK6MBwmoXmxxlUS/Jrl4lC98MVTF68vHkH0AqGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P+865d3A5iJMltsJy8Z0IBnFgq4pIlW3fv4rPVAVoRamZhh0t53fm6DLhZ9IVGwG7L7d+GSRfauyO2WDtb/8cxfGrphxHvw/H6+MT4Y9Jm3Z+cixFzyyS8sjFAg3ip5CO8J5qFKr3D4gvWDrI2BGNy4UsLSvGPhT0KL58MNNdp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iE8Nlq4f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iE8Nlq4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726461654; x=1757997654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOPtgK6MBwmoXmxxlUS/Jrl4lC98MVTF68vHkH0AqGA=;
  b=iE8Nlq4fngQBRspu+4nFl9VWk4rGeegs+6H5h0wJm0LRkpUKPkvUzhTK
   WDt/NzZ1z5qgjJ1g1RK9Oyqtds7E54Yy2wDwaFLi8qGOazc5uLsRT8vNV
   Z3SIu0BJndBHNow6I7pPA3PxwH+LXg6tg6mfK08KvlJxW6WDVhrvItjQX
   ZbQgK8Zy+uTP20Gnm8nHsiaFMLShDbhFVUvZc0jpixZzk9se4VHKGG89E
   qH0W4GoM4rMu1NyKobuWFuxZxoKcmTM1A9z4lGxvl9IA6EEWu3nGWj4rn
   d76oTKlTQZN12hbnTyBOz5HiHfdY7Bo8CL+KqebEx5oWZBA0qJci7DARd
   A==;
X-CSE-ConnectionGUID: m4UyiG9bS6WXU7ibu8xiiA==
X-CSE-MsgGUID: 7IqwupJWSjKokKxx9IxrlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25216110"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25216110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 21:40:53 -0700
X-CSE-ConnectionGUID: 3Sdo+8KAT4e/b+HFD2mMrA==
X-CSE-MsgGUID: 1o7XqY4LQNauWZMvgSVp3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73754340"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Sep 2024 21:40:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq3Xd-0009Ok-30;
	Mon, 16 Sep 2024 04:40:49 +0000
Date: Mon, 16 Sep 2024 12:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 677/30000]
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing()
 warn: check for integer overflow 'num_routes'
Message-ID: <202409161236.pnGXSCjw-lkp@intel.com>
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
TO: Meng Wei <wei.meng@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>
CC: Chang Ying <ying.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: dcdab0d72b69b6291d08483c0baf62cf92e2a1bc [677/30000] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
:::::: branch date: 13 days ago
:::::: commit date: 5 years ago
config: x86_64-randconfig-161-20240914 (https://download.01.org/0day-ci/archive/20240916/202409161236.pnGXSCjw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409161236.pnGXSCjw-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1098 put_v4l2_subdev_routing() warn: check for integer overflow 'num_routes'

vim +/num_routes +1098 drivers/media/v4l2-core/v4l2-compat-ioctl32.c

dcdab0d72b69b6 Meng Wei 2018-10-26  1081  
dcdab0d72b69b6 Meng Wei 2018-10-26  1082  static int put_v4l2_subdev_routing(struct v4l2_subdev_routing __user *kp,
dcdab0d72b69b6 Meng Wei 2018-10-26  1083  				   struct v4l2_subdev_routing32 __user *up)
dcdab0d72b69b6 Meng Wei 2018-10-26  1084  {
dcdab0d72b69b6 Meng Wei 2018-10-26  1085  	struct v4l2_subdev_route __user *uroutes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1086  	compat_caddr_t p;
dcdab0d72b69b6 Meng Wei 2018-10-26  1087  	u32 num_routes;
dcdab0d72b69b6 Meng Wei 2018-10-26  1088  
dcdab0d72b69b6 Meng Wei 2018-10-26  1089  	if (!access_ok(VERIFY_WRITE, up, sizeof(*up)) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1090  	    get_user(p, &up->routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1091  	    get_user(num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1092  	    assign_in_user(&up->num_routes, &kp->num_routes) ||
dcdab0d72b69b6 Meng Wei 2018-10-26  1093  	    !access_ok(VERIFY_WRITE, up->reserved, sizeof(*up->reserved)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1094  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1095  
dcdab0d72b69b6 Meng Wei 2018-10-26  1096  	uroutes = compat_ptr(p);
dcdab0d72b69b6 Meng Wei 2018-10-26  1097  
dcdab0d72b69b6 Meng Wei 2018-10-26 @1098  	if (!access_ok(VERIFY_WRITE, uroutes,
dcdab0d72b69b6 Meng Wei 2018-10-26  1099  		       num_routes * sizeof(*kp->routes)))
dcdab0d72b69b6 Meng Wei 2018-10-26  1100  		return -EFAULT;
dcdab0d72b69b6 Meng Wei 2018-10-26  1101  
dcdab0d72b69b6 Meng Wei 2018-10-26  1102  	return 0;
dcdab0d72b69b6 Meng Wei 2018-10-26  1103  }
dcdab0d72b69b6 Meng Wei 2018-10-26  1104  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
