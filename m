Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0871D55C
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Oct 2023 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvouLOq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698078606; x=1729614606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VvKA0qix9bjU/1FfNYcTvL72Y6xm9ZkCUbGWjTDP/E=;
  b=SvouLOq1gtu59/n41ON3Bd3qLUiGJEyIl7pu2e55Y4wP7tIvz5x7UhPC
   OLa1xxDnxApkdBj8rHxKIE6jvESQIfzAaw/BeYYxeAoqY5AA/EBy/nac4
   bZ436WwUu36TmckKInI7BByk5ga3qD+DKndmkhs9z128hQy56FFREIzFe
   pXxOxQWA5gD5SCTMnzo+JmomS/wRxXIbYfP8ODIbGaXmtsMGNgPsHIcIU
   r1EtVYe72wbABTqyQfNw2juhZJqVKO+5TqL8TiZztZ69XBPP09npa5XCI
   OS92CjmKVrzODDz/1sKfBmftSIiXxhKjCx/wHPyP4Y0YRvGFV/C4MT0fd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="453343348"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="453343348"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 09:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="901850688"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="901850688"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2023 09:27:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quxoV-00074D-1s;
	Mon, 23 Oct 2023 16:29:59 +0000
Date: Tue, 24 Oct 2023 00:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/null_blk/zoned.c:769 zone_cond_store() warn: potential
 spectre issue 'dev->zones' [w] (local cap)
Message-ID: <202310240043.jeM9tC6A-lkp@intel.com>
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
TO: "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
commit: d3a5738849e03990618cbb12e10db4eb82dbfda0 null_blk: support read-only and offline zone conditions
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20231022 (https://download.01.org/0day-ci/archive/20231024/202310240043.jeM9tC6A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310240043.jeM9tC6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310240043.jeM9tC6A-lkp@intel.com/

New smatch warnings:
drivers/block/null_blk/zoned.c:769 zone_cond_store() warn: potential spectre issue 'dev->zones' [w] (local cap)

Old smatch warnings:
drivers/block/null_blk/zoned.c:92 null_init_zoned_dev() warn: Please consider using kvcalloc instead of kvmalloc_array

vim +769 drivers/block/null_blk/zoned.c

d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  732  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  733  /*
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  734   * Identify a zone from the sector written to configfs file. Then set zone
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  735   * condition to the zone.
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  736   */
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  737  ssize_t zone_cond_store(struct nullb_device *dev, const char *page,
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  738  			size_t count, enum blk_zone_cond cond)
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  739  {
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  740  	unsigned long long sector;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  741  	unsigned int zone_no;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  742  	int ret;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  743  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  744  	if (!dev->zoned) {
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  745  		pr_err("null_blk device is not zoned\n");
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  746  		return -EINVAL;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  747  	}
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  748  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  749  	if (!dev->zones) {
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  750  		pr_err("null_blk device is not yet powered\n");
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  751  		return -EINVAL;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  752  	}
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  753  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  754  	ret = kstrtoull(page, 0, &sector);
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  755  	if (ret < 0)
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  756  		return ret;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  757  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  758  	zone_no = null_zone_no(dev, sector);
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  759  	if (zone_no >= dev->nr_zones) {
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  760  		pr_err("Sector out of range\n");
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  761  		return -EINVAL;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  762  	}
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  763  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  764  	if (dev->zones[zone_no].type == BLK_ZONE_TYPE_CONVENTIONAL) {
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  765  		pr_err("Can not change condition of conventional zones\n");
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  766  		return -EINVAL;
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  767  	}
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01  768  
d3a5738849e039 Shin'ichiro Kawasaki 2022-12-01 @769  	null_set_zone_cond(dev, &dev->zones[zone_no], cond);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
