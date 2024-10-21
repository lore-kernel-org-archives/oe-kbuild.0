Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BD78C76
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511122; cv=none; b=L5j0L95iLENTUDRitcoXhdHsXUqqAUi2JghHMJ6W1XHa7R+xZFSXk4KL9PqtjyxYrhxIQVVw7iayD8Ft3u1E8tDHH5P2eNo9teKgCPub0UrqA5/xr1gauqniRVqNZcGtKe+AY74s3dk1/lk1T7NDoOGf6sH7uOy+N1zjCrHsN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511122; c=relaxed/simple;
	bh=8/D9BZIBjnRHyMz8KShhrvGMif8aJF7ry2q7s9OJ5Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tur2+pRQAcn7WiXONpAk/5X7/5ZMm4itOYiD60PjEmAI1azH6HV2ue2SfiPAvNT/iXqG6kP955jJI+CHaQWyPXYAWxraSGyMEXP96JgZXwCZxDfseD2mNThVOZ8ObJgMp3kzPmSuv+W+eVOHbD+ttSobn5NDW6o1Bdg9khZhbqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOrfORJY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOrfORJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729511120; x=1761047120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/D9BZIBjnRHyMz8KShhrvGMif8aJF7ry2q7s9OJ5Cs=;
  b=GOrfORJYpd3LcMp5EyaPmF8rM/NrA9oNLBCgY0NJOIncaz7MlQnDznVJ
   jnGFxWUa1ws/cswWJMZ5AVsDkum4AgJkLynk2xSkvLKcZr4AeStybanbS
   PnZhW4YeJLTuoeXkVsSnNu5rIFvLkSAGrWZcTnfiJX6Nxv5Jei7ZsKe3N
   wscL4/c4s2iMAxYfkzH+zoxYi38beIPscqJT4tE4Rk3d/TWx3g8r35/5K
   LEw7M/dAaHnYyTwCngyNeZayhqKPBWPVFRRS9m1sHJzhvLaBPtIuCOckV
   btqhFl38YVij2vQwaavukgSNaQaFWFtTz1yW38VqI/joYa9J07a1MrfcO
   w==;
X-CSE-ConnectionGUID: guw2XoOUS4itXHmLNEJQDQ==
X-CSE-MsgGUID: sVPxit9BRgCulV7r7GdS9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46481765"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="46481765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 04:45:13 -0700
X-CSE-ConnectionGUID: aWfDsOtMRwmrn/ndc3hY4Q==
X-CSE-MsgGUID: Xgf4sEJjRvWzdtkASG7nEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79445876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 04:45:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2qqT-000S57-1a;
	Mon, 21 Oct 2024 11:45:09 +0000
Date: Mon, 21 Oct 2024 19:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the
 index variable of the iterator on line 375
Message-ID: <202410211904.YUfoJSKr-lkp@intel.com>
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
TO: Stephan Gerhold <stephan@gerhold.net>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: 2b391c4ca735d0633bcdca5f83939c9791405225 pmdomain: core: Scale down parent/child performance states in reverse order
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-051-20241021 (https://download.01.org/0day-ci/archive/20241021/202410211904.YUfoJSKr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410211904.YUfoJSKr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the index variable of the iterator on line 375

vim +385 drivers/pmdomain/core.c

2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  363  
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  364  static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  365  					unsigned int state, int depth)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  366  {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  367  	struct gpd_link *link = NULL;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  368  	int ret;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  369  
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  370  	if (state == genpd->performance_state)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  371  		return 0;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  372  
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  373  	/* When scaling up, propagate to parents first in normal order */
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  374  	if (state > genpd->performance_state) {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03 @375  		list_for_each_entry(link, &genpd->child_links, child_node) {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  376  			ret = _genpd_set_parent_state(genpd, link, state, depth);
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  377  			if (ret)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  378  				goto rollback_parents_up;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  379  		}
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  380  	}
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  381  
079c42a0ed7350 drivers/base/power/domain.c Dmitry Osipenko 2021-01-21  382  	if (genpd->set_performance_state) {
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  383  		ret = genpd->set_performance_state(genpd, state);
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  384  		if (ret) {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03 @385  			if (link)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  386  				goto rollback_parents_up;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  387  			return ret;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  388  		}
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  389  	}
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  390  
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  391  	/* When scaling down, propagate to parents last in reverse order */
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  392  	if (state < genpd->performance_state) {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  393  		list_for_each_entry_reverse(link, &genpd->child_links, child_node) {
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  394  			ret = _genpd_set_parent_state(genpd, link, state, depth);
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  395  			if (ret)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  396  				goto rollback_parents_down;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  397  		}
079c42a0ed7350 drivers/base/power/domain.c Dmitry Osipenko 2021-01-21  398  	}
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  399  
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  400  	genpd->performance_state = state;
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  401  	return 0;
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  402  
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  403  rollback_parents_up:
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  404  	list_for_each_entry_continue_reverse(link, &genpd->child_links, child_node)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  405  		_genpd_rollback_parent_state(link, depth);
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  406  	return ret;
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  407  rollback_parents_down:
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  408  	list_for_each_entry_continue(link, &genpd->child_links, child_node)
2b391c4ca735d0 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  409  		_genpd_rollback_parent_state(link, depth);
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  410  	return ret;
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  411  }
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
