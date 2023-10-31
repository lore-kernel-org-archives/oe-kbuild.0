Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E113AF0
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Oct 2023 12:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNADTyjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698753947; x=1730289947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zg8L/tRAyD5aYNz5hJtXaQlNG6cZWGIyPzgeVtiIWMA=;
  b=gNADTyjyDuv6N5h/7eCEnV2NzLT/isMqh1dSfvDaIGCR5o0DVluH5wpF
   R7cPSS32CqfeYsTS3RGimXlmc3noDQJzsvSDYm4c3HToN9qABdgQQMOJ+
   09T4kvaYOMYv6lMrgGghc6N1zKOoYz846q1TksSzTwq8/IyxvQ188G9dd
   whrPo8xscl9XaAWu+09J5gCRFuL51vyeyxv4FUOVSFl3MPbjXQ5fzQ35W
   UPKlDhz8D5SqzfxlQGkhZg3Mw96I35ki5iMaMtzbs5NBmdwCyB1g5hE+/
   qRk6h4iuHorVdbBALYDa3a7kb6fbI9cni2XVAQqeyTZCw0vbbqZvamrTi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="452547290"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="452547290"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 05:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="877493812"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="877493812"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2023 05:05:44 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxnV8-000090-2e;
	Tue, 31 Oct 2023 12:05:42 +0000
Date: Tue, 31 Oct 2023 20:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/sed-opal.c:2702 sed_ioctl() error: uninitialized symbol 'p'.
Message-ID: <202310311910.7Dtl4Sba-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: dougmill <dougmill@linux.vnet.ibm.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Scott Bauer <sbauer@plzdonthack.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5a6a09e97199d6600d31383055f9d43fbbcbe86f
commit: c6ea70604249bc357ce09e9f8e16c29df0fb2fa2 block: sed-opal: Add ioctl to return device status
date:   1 year, 2 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-123-20230922 (https://download.01.org/0day-ci/archive/20231031/202310311910.7Dtl4Sba-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231031/202310311910.7Dtl4Sba-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310311910.7Dtl4Sba-lkp@intel.com/

New smatch warnings:
block/sed-opal.c:2702 sed_ioctl() error: uninitialized symbol 'p'.

Old smatch warnings:
block/sed-opal.c:2705 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2708 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2711 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2714 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2717 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2720 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2723 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2726 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2729 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2732 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2735 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2738 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2741 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2744 sed_ioctl() error: uninitialized symbol 'p'.
block/sed-opal.c:2747 sed_ioctl() error: uninitialized symbol 'p'.

vim +/p +2702 block/sed-opal.c

c6ea70604249bc dougmill@linux.vnet.ibm.com 2022-08-16  2681  
e225c20eb0fd0b Scott Bauer                 2017-02-14  2682  int sed_ioctl(struct opal_dev *dev, unsigned int cmd, void __user *arg)
455a7b238cd6bc Scott Bauer                 2017-02-03  2683  {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2684  	void *p;
e225c20eb0fd0b Scott Bauer                 2017-02-14  2685  	int ret = -ENOTTY;
455a7b238cd6bc Scott Bauer                 2017-02-03  2686  
455a7b238cd6bc Scott Bauer                 2017-02-03  2687  	if (!capable(CAP_SYS_ADMIN))
455a7b238cd6bc Scott Bauer                 2017-02-03  2688  		return -EACCES;
4f1244c8298606 Christoph Hellwig           2017-02-17  2689  	if (!dev)
4f1244c8298606 Christoph Hellwig           2017-02-17  2690  		return -ENOTSUPP;
c6ea70604249bc dougmill@linux.vnet.ibm.com 2022-08-16  2691  	if (!(dev->flags & OPAL_FL_SUPPORTED))
455a7b238cd6bc Scott Bauer                 2017-02-03  2692  		return -ENOTSUPP;
455a7b238cd6bc Scott Bauer                 2017-02-03  2693  
c6ea70604249bc dougmill@linux.vnet.ibm.com 2022-08-16  2694  	if (cmd & IOC_IN) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2695  		p = memdup_user(arg, _IOC_SIZE(cmd));
e225c20eb0fd0b Scott Bauer                 2017-02-14  2696  		if (IS_ERR(p))
e225c20eb0fd0b Scott Bauer                 2017-02-14  2697  			return PTR_ERR(p);
c6ea70604249bc dougmill@linux.vnet.ibm.com 2022-08-16  2698  	}
455a7b238cd6bc Scott Bauer                 2017-02-03  2699  
e225c20eb0fd0b Scott Bauer                 2017-02-14  2700  	switch (cmd) {
e225c20eb0fd0b Scott Bauer                 2017-02-14  2701  	case IOC_OPAL_SAVE:
e225c20eb0fd0b Scott Bauer                 2017-02-14 @2702  		ret = opal_save(dev, p);

:::::: The code at line 2702 was first introduced by commit
:::::: e225c20eb0fd0b6657e640408f11ee392dc82b5b Move stack parameters for sed_ioctl to prevent oversized stack with CONFIG_KASAN

:::::: TO: Scott Bauer <scott.bauer@intel.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
