Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDD18C91F
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 13:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737207799; cv=none; b=MCwwwzEw3qYQpMLdCurbSvkHynjKd6N5xwa0wKdpLOig+aAWTzvM9TyBuSKX72TQSRzMzLWPvpeWOO15VgDm+aDi2K1DElX/t1OiRXSCm5UEOWsLo22l8lTCajITucu/xPwcMVPjCnkoe5wkv+lT9eiZSXbT5QCYkK1Kq60ZQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737207799; c=relaxed/simple;
	bh=aROBIwIOZ2MKds+fFRxNw5WUPJelut+Z6hYZDgWgyMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h1IwduXCg1kln5i7vh9SGR8JHXnD3XxQ7/crqYcM1KiBNJYknQE/FIu5n7uPxaVXLsC9PTfUVzKg5K1AL6Yj7Iz3ODzDsu6+3LJllJF1jWtxTEJfPszs3hRBrGmbGLJg60YubI7Ibu/6cgSkoOCEP9jGUYmAfdtOwYbe5lcJCTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrlAPE+D; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrlAPE+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737207798; x=1768743798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aROBIwIOZ2MKds+fFRxNw5WUPJelut+Z6hYZDgWgyMs=;
  b=RrlAPE+DQYFAikB9SSN7rTdFYAS8OfJ55u1tNI/dNxB+WHU/P2BI0qO+
   n2zeYAuBvULcRETLtiF/LbqUhvl8YuEBWNSwUu01VxyB6gSjho44SLpUe
   mzZ0+Pbk/Lwj0Alvc4nunXKAG1BVaAXQ2p0b/1y101Po8bzkYU7s2kjeW
   41mjLGGceV4ncVZXVXvQKL3ExL8PdhViCQ/7atLFVGg7htURbGEe/HPb5
   J1LiCBWzdEO3IdCyDRO/OA9oywZiFXKPtbbRfVKZ8DKU5j/GJ6I+9eFre
   ljAHEVarPMfBYUio0w1pTjNZBM7D9pHq/3Ge8sDX3A/9c+haBdrrLCzI6
   A==;
X-CSE-ConnectionGUID: pf1K7hrCSrakz0TAZ+Dzaw==
X-CSE-MsgGUID: DBnBIwvIQlqYMuASG11YzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="41391943"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="41391943"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:43:16 -0800
X-CSE-ConnectionGUID: /yLgcFHFRhifz7XXsGe0TA==
X-CSE-MsgGUID: XU0DcspkRGuJl94vjtCfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143342639"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2025 05:43:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ96V-000UTl-30;
	Sat, 18 Jan 2025 13:43:11 +0000
Date: Sat, 18 Jan 2025 21:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the
 index variable of the iterator on line 375
Message-ID: <202501182101.IF3oObAv-lkp@intel.com>
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
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 2b391c4ca735d0633bcdca5f83939c9791405225 pmdomain: core: Scale down parent/child performance states in reverse order
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r051-20250118 (https://download.01.org/0day-ci/archive/20250118/202501182101.IF3oObAv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501182101.IF3oObAv-lkp@intel.com/

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
