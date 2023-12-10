Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A88517CD
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1eci+0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702190194; x=1733726194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDxfHwG7glRmJACCE0GohwLqsg3bKBQUl+pQblS3Vjs=;
  b=K1eci+0nOs1zuNtGnzvOLsi2NbDSGT3kKuS+MJGCtrnuJqge4sqO7aBj
   oHuTh49v2nqKFDDC+E8Rx/pNfWPJC777doAOmS67EinQnvkHBkFOV7VOt
   /RkqzlJMSZQ5MSAPgmatU/3GeEi5+xfPZKjaYhM8KBTL5mBaTzj/1igbq
   2nK3337pZ43y+O8Xv2PHUC9OYaXXRQfWiDQIz4eUBJP53X7vymQyxtbFj
   BHP04Ob4n1rnqxf+kp7lofYjPtuUvJNef4L/438PyUWnSn3wiHGmCtHtf
   hvl+TBynZrD6Ch6xMt8ythV8xgggYMEqCkT0WDGzv5DU+PjfvGjDXfTvj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1412869"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="1412869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 22:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="748818170"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="748818170"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 09 Dec 2023 22:36:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCDQT-000GTy-03;
	Sun, 10 Dec 2023 06:36:29 +0000
Date: Sun, 10 Dec 2023 14:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/ioctl.c:542 compat_hdio_getgeo() warn: ignoring unreachable
 code.
Message-ID: <202312101405.LfwNYBlT-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: bdc1ddad3e5f385698df150a0cfaaac62b491e7e compat_ioctl: block: move blkdev_compat_ioctl() into ioctl.c
date:   3 years, 11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 years, 11 months ago
config: s390-randconfig-r071-20231115 (https://download.01.org/0day-ci/archive/20231210/202312101405.LfwNYBlT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312101405.LfwNYBlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312101405.LfwNYBlT-lkp@intel.com/

New smatch warnings:
block/ioctl.c:542 compat_hdio_getgeo() warn: ignoring unreachable code.

Old smatch warnings:
arch/s390/include/asm/uaccess.h:143 __get_user_fn() error: uninitialized symbol 'rc'.
block/ioctl.c:696 compat_blkpg_ioctl() warn: ignoring unreachable code.

vim +542 block/ioctl.c

bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  518  
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  519  static int compat_hdio_getgeo(struct gendisk *disk, struct block_device *bdev,
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  520  			struct compat_hd_geometry __user *ugeo)
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  521  {
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  522  	struct hd_geometry geo;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  523  	int ret;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  524  
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  525  	if (!ugeo)
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  526  		return -EINVAL;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  527  	if (!disk->fops->getgeo)
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  528  		return -ENOTTY;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  529  
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  530  	memset(&geo, 0, sizeof(geo));
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  531  	/*
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  532  	 * We need to set the startsect first, the driver may
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  533  	 * want to override it.
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  534  	 */
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  535  	geo.start = get_start_sect(bdev);
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  536  	ret = disk->fops->getgeo(bdev, &geo);
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  537  	if (ret)
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  538  		return ret;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  539  
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  540  	ret = copy_to_user(ugeo, &geo, 4);
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  541  	ret |= put_user(geo.start, &ugeo->start);
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29 @542  	if (ret)
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  543  		ret = -EFAULT;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  544  
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  545  	return ret;
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  546  }
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  547  #endif
bdc1ddad3e5f38 Arnd Bergmann 2019-11-29  548  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
