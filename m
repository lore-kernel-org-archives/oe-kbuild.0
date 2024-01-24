Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987617C091
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jan 2024 20:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706129662; cv=none; b=gWGhuK9Dbt4obdi3XoBUhvoI/2XhRa8h71+CYpPKKbxZHQeZL40tPfxAFr1T/WVvO9f7Ck5VdKOJq/S0ziFSyjxgvntUFNClYpSKFEqjaLa/0rtnukbuvFyxGCW5KTX2E+XMsYXSqTU+WCPAk7m0n4cLw46kwQ6PskvVW3fuY4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706129662; c=relaxed/simple;
	bh=oAyxQGXWIRSURqqi5MeXJZOWfhJzi2RuTDs3o9syZ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAeSlf8ohpDf178EqPZp20jQm9JfQo1/CxByXEm/Q9c9pXB1s1i458AKEHdHBpBN4h0c9Axyy6KWKxYlMHcKJR0gnWpK6uMiJQnypXBv2DvTltsen4ZmLgvw/0uoQm0ftvnGcRwWrXg0mnl7sudDAuX/RISIekvXmPN31ouYFto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DX56taFC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DX56taFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706129660; x=1737665660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAyxQGXWIRSURqqi5MeXJZOWfhJzi2RuTDs3o9syZ4A=;
  b=DX56taFC9spOd2dyVKEgabgYu5FY25Krujef8866+jfg7UO5XORiR917
   wGkXOIs1NNg9IR5FaXQJWBGqUHGswxcNxOr0LNeSc6VSNmnu5c96LAbGk
   azIMcJ6bu4T0yfE+i/Ikn4KsLPVxCxVHmNa4qXPupbZhNamQsNI2gh13+
   irEcBo6p6NGpuuy7+QrIZ6HLJVDmzofSAITtvTQkVMshWSMxynAD5EJWx
   3hYxFLmE1qEGrEfjngczPI0PliTL25Xw3TVM35IdMrGf0riVOIiW2w4EZ
   kZrJwK3+lKxCDZzi58GewQxhKPIHpTLBhc3gAIUL+3uFll/Ffsedjt0EK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15315342"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15315342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 12:54:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28253675"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2024 12:54:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSkGE-0008S5-07;
	Wed, 24 Jan 2024 20:54:14 +0000
Date: Thu, 25 Jan 2024 04:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 869/1678] drivers/pmdomain/core.c:385:7-11:
 ERROR: invalid reference to the index variable of the iterator on line 375
Message-ID: <202401250404.8nnedUZs-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Stephan Gerhold <stephan@gerhold.net>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8bf1262c53f50fa91fe15d01e5ef5629db55313c
commit: 8b4e2d8976b6c93b3786ced79f1c55d5d7b38737 [869/1678] pmdomain: core: Scale down parent/child performance states in reverse order
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r063-20240124 (https://download.01.org/0day-ci/archive/20240125/202401250404.8nnedUZs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401250404.8nnedUZs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pmdomain/core.c:385:7-11: ERROR: invalid reference to the index variable of the iterator on line 375

vim +385 drivers/pmdomain/core.c

8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  363  
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  364  static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  365  					unsigned int state, int depth)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  366  {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  367  	struct gpd_link *link = NULL;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  368  	int ret;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  369  
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  370  	if (state == genpd->performance_state)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  371  		return 0;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  372  
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  373  	/* When scaling up, propagate to parents first in normal order */
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  374  	if (state > genpd->performance_state) {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03 @375  		list_for_each_entry(link, &genpd->child_links, child_node) {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  376  			ret = _genpd_set_parent_state(genpd, link, state, depth);
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  377  			if (ret)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  378  				goto rollback_parents_up;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  379  		}
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  380  	}
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  381  
079c42a0ed7350 drivers/base/power/domain.c Dmitry Osipenko 2021-01-21  382  	if (genpd->set_performance_state) {
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  383  		ret = genpd->set_performance_state(genpd, state);
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  384  		if (ret) {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03 @385  			if (link)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  386  				goto rollback_parents_up;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  387  			return ret;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  388  		}
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  389  	}
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  390  
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  391  	/* When scaling down, propagate to parents last in reverse order */
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  392  	if (state < genpd->performance_state) {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  393  		list_for_each_entry_reverse(link, &genpd->child_links, child_node) {
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  394  			ret = _genpd_set_parent_state(genpd, link, state, depth);
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  395  			if (ret)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  396  				goto rollback_parents_down;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  397  		}
079c42a0ed7350 drivers/base/power/domain.c Dmitry Osipenko 2021-01-21  398  	}
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  399  
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  400  	genpd->performance_state = state;
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  401  	return 0;
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  402  
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  403  rollback_parents_up:
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  404  	list_for_each_entry_continue_reverse(link, &genpd->child_links, child_node)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  405  		_genpd_rollback_parent_state(link, depth);
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  406  	return ret;
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  407  rollback_parents_down:
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  408  	list_for_each_entry_continue(link, &genpd->child_links, child_node)
8b4e2d8976b6c9 drivers/pmdomain/core.c     Stephan Gerhold 2024-01-03  409  		_genpd_rollback_parent_state(link, depth);
18edf49c45544c drivers/base/power/domain.c Viresh Kumar    2018-11-02  410  	return ret;
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  411  }
cd50c6d3eb91bd drivers/base/power/domain.c Viresh Kumar    2018-10-31  412  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
