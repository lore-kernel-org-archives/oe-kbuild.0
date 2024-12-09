Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06FB189BA8
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719293; cv=none; b=Yo2Vrvxe2AsETjO/XO9tG62iRapuTsZrxzCg8ZgvdnVrEyPFbAxJdhIOCUBpfIofNUGhpu11yZODkrly9DoivVkdbnrL6eC1w7fpkae++Ybskyox5axo62edoCMbn3KKmVFK+UIWBkPJEYBOgXDiSQ5Vf+k+axgioY3/tXHrpWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719293; c=relaxed/simple;
	bh=2cKnVRfF2YRQsOfqXHnY1q3Tvo2JxwvP6n9LNVSdr+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quorkKzQ43hn/AY8/BoiFappMI3rxPhXebxMYRCWPobMi10BGfFztf3o7TQCqHKYmkcbyfPOHPg1wRENNHkn9mU5kgoEcYu3euQMbKuCYuW/bJOffOvt1YAEMydEbPTAdUAwhHCMQziwLJZ5podGmskPrVIvmy/TPtC5aIbATTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK4/E0PJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK4/E0PJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719292; x=1765255292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2cKnVRfF2YRQsOfqXHnY1q3Tvo2JxwvP6n9LNVSdr+c=;
  b=TK4/E0PJtKBYDYWZ8Syx3pua0PIRF5uPq1d/eO9W0/LdNKFbn/5wy1Qo
   8x+0ptfDtfdWherh9a3GFyvofzww6sw2mswxW4VWY8vGf8U4tEWZ3q+Mx
   LZczhltZnfZOZeTEZ1JakAoKEQapaYwJpzx9VLUA+4zGdgeWpMRP/Q7b2
   0hRI6H9rMzy8KuDJp2ECNHr2BqY7xySwWojaZJqllYqIviZFdYGyYqnE9
   lNgPMrswkt+YSJ+Hw4t9sIRsZXMAl4w+bfRfGtBM1nJkK5qkzmHNAFNLP
   G0V3QM4f6yv2nXlZUOVoriHS1s5PdsGGT3UYb3tyatiy3MI2lmu/WcPpV
   g==;
X-CSE-ConnectionGUID: 6weF8qVuTdyk9ZRwHzAWwQ==
X-CSE-MsgGUID: f2vsWIlxRna6I5NabZhq3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45381155"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45381155"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:41:30 -0800
X-CSE-ConnectionGUID: owwrfQ68S3CIUAUVSBwX3A==
X-CSE-MsgGUID: 54qIgVd/Q/GuhYpn72j4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99011306"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:41:28 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVaI-0003th-1U;
	Mon, 09 Dec 2024 04:41:26 +0000
Date: Mon, 9 Dec 2024 12:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/sysfs.c:391 engine_group_id_store() warn: potential
 spectre issue 'idxd->groups' [r] (local cap)
Message-ID: <202412081212.SbAuurSS-lkp@intel.com>
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
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: c52ca478233c172b2d322b5241d6279a8661cbba dmaengine: idxd: add configuration component of driver
date:   4 years, 11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241208/202412081212.SbAuurSS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412081212.SbAuurSS-lkp@intel.com/

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
