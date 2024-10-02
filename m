Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5417996
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727857868; cv=none; b=m2Pn6HjmW7LQIgq0fKVaF9398U42i/ScMJKXSpZ1uyqAGS6q86A0hLH54ZKt0/l4TvpCd4bzR2Ybzv7Od73B21//T4G8XJbEH0xhpR2RA4aVZov9Bpv6stwvSe8pdLdSwnFnntnbBakY4/kaICoosivdUr7Nsmf2LDbpymyXVc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727857868; c=relaxed/simple;
	bh=HEIPBP5FmsapIAEyPlEz09Xb4PV58ATxA2j7g7pN6K4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGl1MGrsYqHeoZsyvoum1R14DLr4iIF7PAvgp+OAkZ8cPB2QWcZjNCpfZYRB0TGh7ZNN0f3774yRhUCpWqQosMIE88ggzZ78w7nKdO5vtZZ4Wa8caMBaxbwAfbu6wytrOqe+cSyIsXdostpQTbbb1tuU1s7RMZ9UuBByPgqgRmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eo6snPDY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eo6snPDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727857866; x=1759393866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HEIPBP5FmsapIAEyPlEz09Xb4PV58ATxA2j7g7pN6K4=;
  b=Eo6snPDYMxIkAJIqkCQUlWbkUBlU6d7vRXLFQlsq55+OPJOgSP1pfbpE
   CmM22f1JurxKFAuNXoiEUyp4e1MBfyvtgx0C+DkCTT6zx2FxwFE6sk/9H
   uaI4UiiiLFl0EukCSY/9HOxojnqn4nyk0VOak2ChfCOGtxazJGMbV7Nh9
   +FXI7vx5kOrTDJh+5oxZXGXisxATQHhKwm5CEIIBSbwVa4JGvqUQOd9e3
   hZEhnQNt0b7xxprLyMw8FzmRxpbRid1CFLJzsoiBRS5HdcVpDVAIBKnRr
   plcB/8u5mz9+pkLrAfuE7KLv7vrWcY2aBEez3MnXAJbIgPEqDJqcAyBZh
   w==;
X-CSE-ConnectionGUID: INKJFR4ZSD+J+zkYX4zObw==
X-CSE-MsgGUID: qHbtEUSiQ7+eyo6paQrjkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26522388"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26522388"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 01:31:06 -0700
X-CSE-ConnectionGUID: wVHojARvS4Wp47iE5nctaA==
X-CSE-MsgGUID: HokuvYGiRG6FAJRGUL6y0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="73603559"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 01:31:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svulC-000Ro3-2o;
	Wed, 02 Oct 2024 08:31:02 +0000
Date: Wed, 2 Oct 2024 16:31:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the
 index variable of the iterator on line 375
Message-ID: <202410021630.rUC7P0GI-lkp@intel.com>
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
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: 2b391c4ca735d0633bcdca5f83939c9791405225 pmdomain: core: Scale down parent/child performance states in reverse order
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: arc-randconfig-r052-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021630.rUC7P0GI-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021630.rUC7P0GI-lkp@intel.com/

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
