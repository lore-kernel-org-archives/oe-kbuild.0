Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8CF257D
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 04:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733976576; cv=none; b=t8nObn+CObTpH2wCU5uIMzMAIz1RvSMxBzR15homsqF9mXPZdFU58TghVunKsPdNF/bwc6aTR/BgKjs+5hrIqJwVj2uFSzI408qiwZ5QJgLBIozToopbeKc5W6GfibaGcbCQDL+poPoCeNc3k+hIASj0mJFVquXBrkyLgWbodpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733976576; c=relaxed/simple;
	bh=JUlx6SEpN49zJcW/NyDWHkwohkdofOcVhk9e+Oh59H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZa2wJx9Z/0rHRC+4ISG+/6eBHTxylGrUQx0NF1n8ND6GILlxLJII6igXtSgjH7QSs1YMopcEDa4WNTXbxiS8T/OR0aPGzw+oXzF0glqSyy9oj035H3msk/XCWcAj9eCRJFLDTnNww7JmTyU1QJedj5bDIBgxmpzic0wjh8e+98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWEgf28U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWEgf28U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733976575; x=1765512575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUlx6SEpN49zJcW/NyDWHkwohkdofOcVhk9e+Oh59H0=;
  b=jWEgf28U7ToAzEByXy3+3eLjlvimGy20oHS16cAMju8f4V4r0tTYwh9i
   JebFzOfYLl5v6HWYnADcBOlRAt87Plcbmh45EIhbnO3sohZCiKSRwiux1
   Ws4JsX238Tnh4hevldekTMx6sPnMVLMuLDDQ3djjmsnfCkDmS8Zu3wmo5
   4qYUp7+JqUhCru/ijuQMQtvzVMA1SsJILVGqY+gHhGjRcVLf5xuBiuHaX
   F3fUoFGkaKX3EUuti399nIUX0CfvgrizeXVNJrAkP/qYxD9WFikpgL8ed
   e5e78H8a97YBwm/M5lPg2Nu0lqMTosOZt+ONmkI2ZRQ7UnLpisuGerRnY
   A==;
X-CSE-ConnectionGUID: PiSaAT7VQw2siWf0whJRtw==
X-CSE-MsgGUID: GwhfI0nARQqAj6m8gN9eFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34104665"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34104665"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:09:34 -0800
X-CSE-ConnectionGUID: oHGm8/YURDODOMd29ad5Cg==
X-CSE-MsgGUID: 3zvjxHewQJGv3fMrZOcLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96892227"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 20:09:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLaW2-0007Q7-1V;
	Thu, 12 Dec 2024 04:09:30 +0000
Date: Thu, 12 Dec 2024 12:08:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/sysfs.c:391 engine_group_id_store() warn: potential
 spectre issue 'idxd->groups' [r] (local cap)
Message-ID: <202412121245.nQWWI1H7-lkp@intel.com>
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
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: c52ca478233c172b2d322b5241d6279a8661cbba dmaengine: idxd: add configuration component of driver
date:   4 years, 11 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241212/202412121245.nQWWI1H7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121245.nQWWI1H7-lkp@intel.com/

smatch warnings:
drivers/dma/idxd/sysfs.c:391 engine_group_id_store() warn: potential spectre issue 'idxd->groups' [r] (local cap)
drivers/dma/idxd/sysfs.c:800 wq_group_id_store() warn: potential spectre issue 'idxd->groups' [r] (local cap)

vim +391 drivers/dma/idxd/sysfs.c

c52ca478233c17 Dave Jiang 2020-01-21  361  
c52ca478233c17 Dave Jiang 2020-01-21  362  static ssize_t engine_group_id_store(struct device *dev,
c52ca478233c17 Dave Jiang 2020-01-21  363  				     struct device_attribute *attr,
c52ca478233c17 Dave Jiang 2020-01-21  364  				     const char *buf, size_t count)
c52ca478233c17 Dave Jiang 2020-01-21  365  {
c52ca478233c17 Dave Jiang 2020-01-21  366  	struct idxd_engine *engine =
c52ca478233c17 Dave Jiang 2020-01-21  367  		container_of(dev, struct idxd_engine, conf_dev);
c52ca478233c17 Dave Jiang 2020-01-21  368  	struct idxd_device *idxd = engine->idxd;
c52ca478233c17 Dave Jiang 2020-01-21  369  	long id;
c52ca478233c17 Dave Jiang 2020-01-21  370  	int rc;
c52ca478233c17 Dave Jiang 2020-01-21  371  	struct idxd_group *prevg, *group;
c52ca478233c17 Dave Jiang 2020-01-21  372  
c52ca478233c17 Dave Jiang 2020-01-21  373  	rc = kstrtol(buf, 10, &id);
c52ca478233c17 Dave Jiang 2020-01-21  374  	if (rc < 0)
c52ca478233c17 Dave Jiang 2020-01-21  375  		return -EINVAL;
c52ca478233c17 Dave Jiang 2020-01-21  376  
c52ca478233c17 Dave Jiang 2020-01-21  377  	if (!test_bit(IDXD_FLAG_CONFIGURABLE, &idxd->flags))
c52ca478233c17 Dave Jiang 2020-01-21  378  		return -EPERM;
c52ca478233c17 Dave Jiang 2020-01-21  379  
c52ca478233c17 Dave Jiang 2020-01-21  380  	if (id > idxd->max_groups - 1 || id < -1)
c52ca478233c17 Dave Jiang 2020-01-21  381  		return -EINVAL;
c52ca478233c17 Dave Jiang 2020-01-21  382  
c52ca478233c17 Dave Jiang 2020-01-21  383  	if (id == -1) {
c52ca478233c17 Dave Jiang 2020-01-21  384  		if (engine->group) {
c52ca478233c17 Dave Jiang 2020-01-21  385  			engine->group->num_engines--;
c52ca478233c17 Dave Jiang 2020-01-21  386  			engine->group = NULL;
c52ca478233c17 Dave Jiang 2020-01-21  387  		}
c52ca478233c17 Dave Jiang 2020-01-21  388  		return count;
c52ca478233c17 Dave Jiang 2020-01-21  389  	}
c52ca478233c17 Dave Jiang 2020-01-21  390  
c52ca478233c17 Dave Jiang 2020-01-21 @391  	group = &idxd->groups[id];
c52ca478233c17 Dave Jiang 2020-01-21  392  	prevg = engine->group;
c52ca478233c17 Dave Jiang 2020-01-21  393  
c52ca478233c17 Dave Jiang 2020-01-21  394  	if (prevg)
c52ca478233c17 Dave Jiang 2020-01-21  395  		prevg->num_engines--;
c52ca478233c17 Dave Jiang 2020-01-21  396  	engine->group = &idxd->groups[id];
c52ca478233c17 Dave Jiang 2020-01-21  397  	engine->group->num_engines++;
c52ca478233c17 Dave Jiang 2020-01-21  398  
c52ca478233c17 Dave Jiang 2020-01-21  399  	return count;
c52ca478233c17 Dave Jiang 2020-01-21  400  }
c52ca478233c17 Dave Jiang 2020-01-21  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
