Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E431E1C04
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 10:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733221531; cv=none; b=sajRu0H1zxd3MH8VPeG1LoVrMtf0YFPkWk/byQwNeVOsyvgCp+0RaghlzVWg5gznqmUbJpCsXtonQVvlZSFmjqC7CqD5PdOK1y8PcZ7CqLarHYBfuSwpv9SOH4dobGo07ib846VyZcrbTLJWGmeO90Jz2Tz1wwd1QA/ZFtuC3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733221531; c=relaxed/simple;
	bh=qZy4XuCI+zK+mltNFi5G2ScHaChjMwRcBTRpzgvLlVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TxfOa9HBeMBtsH40A85t2KD/XZXu4e7DlAkIt5Vagl3ydY+p2r8YvcUenNGyDkzbgjRmpztpZgxkUw6LK5GbgwgkkLX1+tImwLxwYxpV4YAyxWAYYOdNNJZETpLNdqwoNQj5R1DQ1rh+ErrUFpdgyNwBPqlydrxfhp3mBzRB4xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdnxRfeJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdnxRfeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733221530; x=1764757530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZy4XuCI+zK+mltNFi5G2ScHaChjMwRcBTRpzgvLlVw=;
  b=jdnxRfeJT1/sC5SzkfWkgMjmbeIcZzhkeq+TmBcvS2JPoNsOHRHKscRl
   t8oQcZAUamUwXQz5o75TaHq7aZvx6E8tqsjw2pCnIn7KTuoUaDb5aex2s
   x8jNNFGdIMhcRNgDGpsGbiSOCthudWHk6YO0+trVAekYKtFsUTQP0VnIU
   dUPUR5aMHany8y8YTLW513ds9O1m4aOjUPuc1SegYDqnHfl63e/212LbV
   oZ7fNs4yyFCnGh98rBs9/1O1KLnqtqXourieXkVnqmb3HRe+E98BwObUP
   ztupNA6oeKpaGNRvvugS1Ap71zDsXsJ2/ZEfxw7iIkD6G+MsAHHz+Rtu6
   w==;
X-CSE-ConnectionGUID: JVhuxLXDTI26DtJP7hN5lg==
X-CSE-MsgGUID: XbbfQ9IqSl+2QGms2tBvCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33351063"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33351063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 02:25:29 -0800
X-CSE-ConnectionGUID: LKK/kds4SySElBl68xEQWA==
X-CSE-MsgGUID: lBo6r3/iSMGYGR+fnI6vWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="124326437"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Dec 2024 02:25:28 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIQ5t-0000XY-2a;
	Tue, 03 Dec 2024 10:25:25 +0000
Date: Tue, 3 Dec 2024 18:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/dma/idxd/sysfs.c:391 engine_group_id_store() warn: potential
 spectre issue 'idxd->groups' [r] (local cap)
Message-ID: <202412031841.Bd4untdR-lkp@intel.com>
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
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: c52ca478233c172b2d322b5241d6279a8661cbba dmaengine: idxd: add configuration component of driver
date:   4 years, 10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 years, 10 months ago
config: x86_64-randconfig-161-20241112 (https://download.01.org/0day-ci/archive/20241203/202412031841.Bd4untdR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412031841.Bd4untdR-lkp@intel.com/

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
