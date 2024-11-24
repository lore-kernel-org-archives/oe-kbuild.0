Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5912500A6
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Nov 2024 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732467466; cv=none; b=bLa5NS/XkM6ebjvblJzih9sVUHP8ODPAs4nrikYukhQHuNcNGf+73ngFTQfLm9zYuysUfO0Jv1sbczcJB3oBkpQs0cxSWKJFDoUmk0Tt5Z+1YpYcCSruPD+MICseb6Otwr00FvkRUPoNG9XEW52m9CTTyPoMtrIHQS8lcNsQ7JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732467466; c=relaxed/simple;
	bh=0CDPkYgzlDqrjM1HY6fHrPSUZg7o9QUj6P/tYGADe70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p2ouey0BXveB+kFjHLdfvaSTQcHJfxVLmhwF0nf8H8X+eOsOnsUlHJ0HBNc3noh6/mywuFZ2VNnAfbajhcDV9raLWsTxgC295r0HhAJ2MLYeU0MJLmiyi4AqXdH1TT8tKXo4d0As4/8kZ+oDu/m8hue1ju0ePGd36UpwQ2CCk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkLv7kXj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkLv7kXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732467465; x=1764003465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0CDPkYgzlDqrjM1HY6fHrPSUZg7o9QUj6P/tYGADe70=;
  b=jkLv7kXjsQVwtuSUQzRMGHJVzHrXeZVeYalx8pMERflkrwVxW9JVtc7f
   wXA6izYJBt+WgyyLNfkpldXUgMhZku1gZaKs9PXdOvQxcGdQkNdLAixh6
   R2INsJG6GCCdDmLPK+PH9ci1hTxltQWMznyZ5fbldK1Fyb769VSKKfRUM
   4b+NVNuSycfPneAtiH/63S18icNsZhCCsj5qZOMfXk6fEPf+uXDOdSYKM
   b9LAhkghQjcbMLA3lzCrHgPF5Orl9wGRrXkhiRX5e/CK5fURJzNPksGM/
   OLvjMwQbkn7YI3RNBsQy0ecHkSdEbVdfp/ICBaU+vS0it2ZCaPB0C5o0/
   A==;
X-CSE-ConnectionGUID: wzIYheIER5a7e5iJnondCA==
X-CSE-MsgGUID: Yvg0+yFvR6eJ6NPjefa6BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="49982937"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="49982937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 08:57:41 -0800
X-CSE-ConnectionGUID: KfzTGE1FRTGnR0b+rHvQnw==
X-CSE-MsgGUID: 83vu1abCQ7u0DvrpF9SVhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91471886"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2024 08:57:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFFvV-00056r-1g;
	Sun, 24 Nov 2024 16:57:37 +0000
Date: Mon, 25 Nov 2024 00:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the
 index variable of the iterator on line 375
Message-ID: <202411250048.B1xeP6u5-lkp@intel.com>
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
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 2b391c4ca735d0633bcdca5f83939c9791405225 pmdomain: core: Scale down parent/child performance states in reverse order
date:   9 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-051-20241114 (https://download.01.org/0day-ci/archive/20241125/202411250048.B1xeP6u5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411250048.B1xeP6u5-lkp@intel.com/

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
