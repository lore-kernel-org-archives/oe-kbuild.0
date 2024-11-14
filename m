Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7F3BBEB
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Nov 2024 06:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731652781; cv=none; b=Y4Bmt3pyehX81H++VMJ9oy9kckLnXuInhKriPubDi/gHBUj59NOA5Yt46R1otjgU+kV99J3RtL06rJUoPgZiHVdQoWhC8BuHtVVF0sr/cKKY83hQw1n8aoRLCS9ZzZAFOeeZRfGaW0CojBhIECGMcvBvX2zIrfphscmk74SAnKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731652781; c=relaxed/simple;
	bh=8W9YGovs3LD2cWF2F9SrgnhxBNlCPNqv9kH5VvtorIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OgYz6avrr/zNLOfbe4TVwCFyuJ+luPBo9XmGq4lr9HxXS6jrISUxve1QHU+ValN8tjBzoHjI8HWB8Ong2XrUVHiDYBLZ958bGniR0P39cWhl43kqqh0TOvkg6wqV37GWZ0qDb1lGrq3v/ScXf10ar8OzwzJnD/Y4Jt7w3/VgtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nc6XU7zl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nc6XU7zl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731652779; x=1763188779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8W9YGovs3LD2cWF2F9SrgnhxBNlCPNqv9kH5VvtorIY=;
  b=Nc6XU7zlh6D/4LtniNYUM/XIhLEe4WQJnBi4pKq1vKA15w8lwJg0apfI
   IYb0YYhgR7fXaL2XBmoDgMV2gyA0h2ToWsmEAAyjh78QBR2ChQS1uxUF1
   xs9j/dm+Aiu5ge/6UiYRUUjgdldHesuT/mZascM7umYfrd/xSBUkSwxsD
   02MgRrjE7onuEqpTw4n2vdUwz83Geu/V4mVUBe3HrxEfRlZ/N+3reVkhV
   ep1SymbieLxqKn0MGFtHkZeVrZByxm5H5CnNdPRcNQ+yBRvUgjFuzho6q
   vkoLwQAxq3aX0vMaY6PQwkhKHJ4AqxHwYbylnjYC4/wGwfUfXCAxXcrEv
   Q==;
X-CSE-ConnectionGUID: 6wM3RlwMSXSdJs7DLenmaQ==
X-CSE-MsgGUID: QC7jbbjARgqR6a6YNh8tfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31580585"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; 
   d="scan'208";a="31580585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 13:50:11 -0800
X-CSE-ConnectionGUID: e/soi/tiT6Clp+GB3YoyuQ==
X-CSE-MsgGUID: rDkrj6OzTymv4r6AummuQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="92768657"
Received: from lkp-server02.sh.intel.com (HELO f5eddd9a323a) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Nov 2024 13:50:10 -0800
Received: from kbuild by f5eddd9a323a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBhj5-00003Z-2n;
	Thu, 14 Nov 2024 21:50:07 +0000
Date: Fri, 15 Nov 2024 05:49:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the
 index variable of the iterator on line 375
Message-ID: <202411150508.8VM7Y6uQ-lkp@intel.com>
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
head:   cfaaa7d010d1fc58f9717fcc8591201e741d2d49
commit: 2b391c4ca735d0633bcdca5f83939c9791405225 pmdomain: core: Scale down parent/child performance states in reverse order
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-051-20241114 (https://download.01.org/0day-ci/archive/20241115/202411150508.8VM7Y6uQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411150508.8VM7Y6uQ-lkp@intel.com/

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
