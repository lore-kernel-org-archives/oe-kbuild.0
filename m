Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DF1CCEED
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440274; cv=none; b=rtwKZY9+tZDcKxckHrvM29Y2zKUV313qI2wtmdvy21AWAQZHSgCe3gStyu69wt54TbrYc2V4IvwJIh4nIsYun9zOg8LSsJFpaIkyjUSVmvvjII6RXPo9kSEkGJotrKjSUmwEFyWRV5yvorx8YxZIWgWMKhpeOiN920YCR0PTGDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440274; c=relaxed/simple;
	bh=zP2TgMCgZF2vfI0+93kE/aOVWL4cdWdJYdk5yKvdmik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNekp/LTz2kKwp6SCpHlGW5HuI5eebVosFZa10IvtjBE+oC/zRTE6o2gVTrEeaOn3phN2+PoaWIVOqh5xoXgaXs80amMNeEcyoVrfYYY6ZC4cpqrHCDZ/OEPJxr58w6g0jZegKZHfqRCp4n0xliglOQnOnCx8Qzg3jG2H0n1Z2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIQ5aQaD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIQ5aQaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733440272; x=1764976272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zP2TgMCgZF2vfI0+93kE/aOVWL4cdWdJYdk5yKvdmik=;
  b=aIQ5aQaDs8sGXTG9HyeaL0ecjjdqtU+IYRo1VSOhOjnpyYKuAvAjhiqB
   Dm7RN5QC6/uN3IOH260uzv1qMSbUUxGCMGhS7O+nn0XQe0MEpyZYx7VVG
   /yUJGTAX9S5T1lzWQL4AszFhXHJh3JFWQU5QAwcf1E+IOUBMXTOElPrjJ
   a6ZCVxxBPdEjQalFzZs0DjZJwG6RtCsSwCtlzN5SUSD3P4YYxts4L9t0Q
   kFFg1bQ+OfC9TlUh8MTx6b0T0WjKVSRW8j0qtfEw4WqGToCv09Q0WfDzH
   jgorUpcm9N8DdAuhodNuwLLHweQ8adtqAFyf2gAHNx1I+7luuQ6QAIdJa
   Q==;
X-CSE-ConnectionGUID: m/XH6GAkTlW0S/KuwbfL+g==
X-CSE-MsgGUID: tXtI3fLRT4qLA3yMS7xDQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34024881"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="34024881"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 15:11:11 -0800
X-CSE-ConnectionGUID: OsX36zR5Tzy4W8Yi4bhv8A==
X-CSE-MsgGUID: 7k4lcpW6R4+Cc1X4hXGLFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="99197028"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2024 15:11:10 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJKzz-0000TD-11;
	Thu, 05 Dec 2024 23:11:07 +0000
Date: Fri, 6 Dec 2024 07:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/sysfs.c:429 engine_group_id_store() warn: possible
 spectre second half.  'engine->group'
Message-ID: <202412060752.cqiewqzU-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   896d8946da97332d4dc80fa1937d8dd6b1c35ad4
commit: defe49f96012ca91e8e673cb95b5c30b4a3735e8 dmaengine: idxd: fix group conf_dev lifetime
date:   3 years, 8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 8 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241206/202412060752.cqiewqzU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412060752.cqiewqzU-lkp@intel.com/

New smatch warnings:
drivers/dma/idxd/sysfs.c:429 engine_group_id_store() warn: possible spectre second half.  'engine->group'
drivers/dma/idxd/sysfs.c:867 wq_group_id_store() warn: possible spectre second half.  'group'

Old smatch warnings:
drivers/dma/idxd/sysfs.c:428 engine_group_id_store() warn: potential spectre issue 'idxd->groups' [r] (local cap)
drivers/dma/idxd/sysfs.c:862 wq_group_id_store() warn: potential spectre issue 'idxd->groups' [r] (local cap)

vim +429 drivers/dma/idxd/sysfs.c

c52ca478233c17 Dave Jiang 2020-01-21  394  
c52ca478233c17 Dave Jiang 2020-01-21  395  static ssize_t engine_group_id_store(struct device *dev,
c52ca478233c17 Dave Jiang 2020-01-21  396  				     struct device_attribute *attr,
c52ca478233c17 Dave Jiang 2020-01-21  397  				     const char *buf, size_t count)
c52ca478233c17 Dave Jiang 2020-01-21  398  {
c52ca478233c17 Dave Jiang 2020-01-21  399  	struct idxd_engine *engine =
c52ca478233c17 Dave Jiang 2020-01-21  400  		container_of(dev, struct idxd_engine, conf_dev);
c52ca478233c17 Dave Jiang 2020-01-21  401  	struct idxd_device *idxd = engine->idxd;
c52ca478233c17 Dave Jiang 2020-01-21  402  	long id;
c52ca478233c17 Dave Jiang 2020-01-21  403  	int rc;
f7b280c6388137 YueHaibing 2020-02-11  404  	struct idxd_group *prevg;
c52ca478233c17 Dave Jiang 2020-01-21  405  
c52ca478233c17 Dave Jiang 2020-01-21  406  	rc = kstrtol(buf, 10, &id);
c52ca478233c17 Dave Jiang 2020-01-21  407  	if (rc < 0)
c52ca478233c17 Dave Jiang 2020-01-21  408  		return -EINVAL;
c52ca478233c17 Dave Jiang 2020-01-21  409  
c52ca478233c17 Dave Jiang 2020-01-21  410  	if (!test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
c52ca478233c17 Dave Jiang 2020-01-21  411  		return -EPERM;
c52ca478233c17 Dave Jiang 2020-01-21  412  
c52ca478233c17 Dave Jiang 2020-01-21  413  	if (id > idxd->max_groups - 1 || id < -1)
c52ca478233c17 Dave Jiang 2020-01-21  414  		return -EINVAL;
c52ca478233c17 Dave Jiang 2020-01-21  415  
c52ca478233c17 Dave Jiang 2020-01-21  416  	if (id == -1) {
c52ca478233c17 Dave Jiang 2020-01-21  417  		if (engine->group) {
c52ca478233c17 Dave Jiang 2020-01-21  418  			engine->group->num_engines--;
c52ca478233c17 Dave Jiang 2020-01-21  419  			engine->group = NULL;
c52ca478233c17 Dave Jiang 2020-01-21  420  		}
c52ca478233c17 Dave Jiang 2020-01-21  421  		return count;
c52ca478233c17 Dave Jiang 2020-01-21  422  	}
c52ca478233c17 Dave Jiang 2020-01-21  423  
c52ca478233c17 Dave Jiang 2020-01-21  424  	prevg = engine->group;
c52ca478233c17 Dave Jiang 2020-01-21  425  
c52ca478233c17 Dave Jiang 2020-01-21  426  	if (prevg)
c52ca478233c17 Dave Jiang 2020-01-21  427  		prevg->num_engines--;
defe49f96012ca Dave Jiang 2021-04-15  428  	engine->group = idxd->groups[id];
c52ca478233c17 Dave Jiang 2020-01-21 @429  	engine->group->num_engines++;
c52ca478233c17 Dave Jiang 2020-01-21  430  
c52ca478233c17 Dave Jiang 2020-01-21  431  	return count;
c52ca478233c17 Dave Jiang 2020-01-21  432  }
c52ca478233c17 Dave Jiang 2020-01-21  433  

:::::: The code at line 429 was first introduced by commit
:::::: c52ca478233c172b2d322b5241d6279a8661cbba dmaengine: idxd: add configuration component of driver

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
