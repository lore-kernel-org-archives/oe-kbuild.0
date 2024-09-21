Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F28E555
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Sep 2024 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726950189; cv=none; b=lihu8TiwPkzpljBxa8DmB6CqOmC0CoarJue4pBp7Ta8jYdkbQMIwULWtkCQ/nop7Cd62udhnlRdM/C95bopnVXNkqzLRGtqv/p1FYGLLN9UO9tWTnstSPHlcP7gfC8uhmT4chXW+2Twzxu3NG5FMmMG+Dzc4P7ZuJJ5+cF4De6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726950189; c=relaxed/simple;
	bh=empbHUbWkZ77BZzw9/cWgKXbMKmUZrdnDfoUBzVqp1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ez29ckObDnZY8Mg/qvOrxCgIP1CtbkoZg4SbkWWSx89w/4e6zosBiUPaN+9BqCyRNFRWoq9O6xp3NCz0pF1+xkUY4W10rf5Bu+Elwkaxb7PNsIHhrRMygfki4yLFrn6/Eri6ZLLwxsR/f9+p/jD8SW2ArliSx/us5yfrbb8vU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNZCShbo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNZCShbo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726950188; x=1758486188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=empbHUbWkZ77BZzw9/cWgKXbMKmUZrdnDfoUBzVqp1M=;
  b=bNZCShbo9Ml7ky0+SO7S755ZZxt+Vc02A7jqJqWRX0rp4ZZKsbiWuqXr
   YfWnhA6Y4jbXJC7PC/KkNpLGv/a9tEqg32voPssHP1z8M1kVxiahRKQ40
   peH0eesnMP/UvREMeVyg7VBp411mDb+eYdz3IahbiYVMTGMYgKEeAqNMZ
   XynjUc6hvtV1UNGkvgDx+tqP3RtR7gxambG5yjIRs5PPkEYwKaOF44/Y7
   yNz3mc20eNIP655i97WxQ5tPsL3fwzmAD9WiNKsQ7t4S41Jkmpc4lzj32
   faVmhmAVdPtx9QemO3wlBuuG5mbbQZcKDHju/My3x2a97pHu5ogqVSLSq
   A==;
X-CSE-ConnectionGUID: yh8s7sd6RiCQnL5I4MrfXw==
X-CSE-MsgGUID: dnxIWLFMT4qmZaRPDnxvmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25811545"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="25811545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 13:23:07 -0700
X-CSE-ConnectionGUID: 7G2awn9FQUuaV4xf2mHYww==
X-CSE-MsgGUID: HQkzUy1tQgyv2wEcU+Kt6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="70531198"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Sep 2024 13:23:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss6dD-000Fmt-2c;
	Sat, 21 Sep 2024 20:23:03 +0000
Date: Sun, 22 Sep 2024 04:23:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:4.19/android_s 658/30000] drivers/nvme/host/rpmb.c:77
 nvme_rpmb_add() error: 'rdev' dereferencing possible ERR_PTR()
Message-ID: <202409220410.hO6UmQew-lkp@intel.com>
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
TO: Tomas Winkler <tomas.winkler@intel.com>
CC: "Pan, Kris" <kris.pan@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 62aa2255c310ca50d66cd739fb513d8717038ecb [658/30000] nvme: connect to rpmb layer
:::::: branch date: 3 weeks ago
:::::: commit date: 5 years ago
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409220410.hO6UmQew-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409220410.hO6UmQew-lkp@intel.com/

smatch warnings:
drivers/nvme/host/rpmb.c:77 nvme_rpmb_add() error: 'rdev' dereferencing possible ERR_PTR()

vim +/rdev +77 drivers/nvme/host/rpmb.c

62aa2255c310ca Tomas Winkler 2018-04-25  61  
62aa2255c310ca Tomas Winkler 2018-04-25  62  static void nvme_rpmb_add(struct nvme_ctrl *ctrl)
62aa2255c310ca Tomas Winkler 2018-04-25  63  {
62aa2255c310ca Tomas Winkler 2018-04-25  64  	struct rpmb_dev *rdev;
62aa2255c310ca Tomas Winkler 2018-04-25  65  	int ndevs = ctrl->rpmbs & 0x7;
62aa2255c310ca Tomas Winkler 2018-04-25  66  	int i;
62aa2255c310ca Tomas Winkler 2018-04-25  67  
62aa2255c310ca Tomas Winkler 2018-04-25  68  	nvme_rpmb_set_cap(ctrl, &nvme_rpmb_dev_ops);
62aa2255c310ca Tomas Winkler 2018-04-25  69  
62aa2255c310ca Tomas Winkler 2018-04-25  70  	/* Add RPMB partitions */
62aa2255c310ca Tomas Winkler 2018-04-25  71  	for (i = 0; i < ndevs; i++) {
62aa2255c310ca Tomas Winkler 2018-04-25  72  		rdev = rpmb_dev_register(ctrl->device, i, &nvme_rpmb_dev_ops);
62aa2255c310ca Tomas Winkler 2018-04-25  73  		if (IS_ERR(rdev)) {
62aa2255c310ca Tomas Winkler 2018-04-25  74  			dev_warn(ctrl->device, "%s: cannot register to rpmb %ld\n",
62aa2255c310ca Tomas Winkler 2018-04-25  75  				 dev_name(ctrl->device), PTR_ERR(rdev));
62aa2255c310ca Tomas Winkler 2018-04-25  76  		}
62aa2255c310ca Tomas Winkler 2018-04-25 @77  		dev_set_drvdata(&rdev->dev, ctrl);
62aa2255c310ca Tomas Winkler 2018-04-25  78  	}
62aa2255c310ca Tomas Winkler 2018-04-25  79  }
62aa2255c310ca Tomas Winkler 2018-04-25  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
