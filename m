Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B701C6FFF
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 23:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742080153; cv=none; b=RfW2ZaK/t3QXXW08WBC5NMmDdFPxefbxIOPYgxmwZCih7cLzR+jh0bmZFNlmX28EtKbPuADtZ71PlqR0bvIt2BKp7IWGsUV26YEGkIo+73vC1O1YO/0dRw8dQyAOwgJ0/Fiz4rfCw4lrmoiHHBxXVIqTFeJtYETp2v0lcoXXTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742080153; c=relaxed/simple;
	bh=860yceRdX7AEnxBo4UcWFCRSGrYQKt2EXAeGyCcsrqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nhu/2Z1rzOlqKh3WMV4BBPmR1kuoJQiLoh97DdR2BmlrdUeYL3AS2h1pO0BlDmcrRh92Libe/IPBBax9+/IvJ3Fau7n8reEOPAmWNTJFg3Dc8gsQpEDkkSXbrfVskVBwW3lVQ7wFRIrkezQQ2PG3XTzHS3IqG/pqHF2oPISDnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mClEUtWK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mClEUtWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742080151; x=1773616151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=860yceRdX7AEnxBo4UcWFCRSGrYQKt2EXAeGyCcsrqM=;
  b=mClEUtWKHtuqZmqBaaLwxpnQwbLLqj9shNVnC94zdPy3PsAmTxqpDNcm
   h0NuBmDSXLDMgPjBUX32wQHmbkHr2eAKvNNc+v7QSU/olhvExKYSS5N5t
   28p+2nx7Fvv7U3bzYv4vaU4d4ufdOQX21J6feAHf7j4rrYD9Jg+Zue5cg
   5EJ1qtOYOGsC2G40CQq5fR06uwFyFbNw9Mf0G7Dnx/ls2e8C58LrZ0c9j
   CDOus9nsqXXR5mgpEmXmmvc5xYMupW8w9Y06yUD+Oq/VT+fieJ90u3/2Q
   KkiZ1Wy2udt9oAZHvy2eAH66ZHyd5OJpqsPm/qoeACBvsTzBLqkZFs7dt
   A==;
X-CSE-ConnectionGUID: bYu9nB3qTkWrlThEgiJ+Fw==
X-CSE-MsgGUID: NtG9pxe0SqSRSfJWT7gqag==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43418196"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43418196"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 16:09:10 -0700
X-CSE-ConnectionGUID: /JTFW5fLSqCrWxCQy15WyQ==
X-CSE-MsgGUID: gljxnGESTSOIE4faey712g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="121790194"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 15 Mar 2025 16:09:09 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttaco-000Bhf-0h;
	Sat, 15 Mar 2025 23:09:03 +0000
Date: Sun, 16 Mar 2025 07:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/opp/core.c:2516 _opp_set_required_dev() warn: passing
 positive error code '(-95)' to 'PTR_ERR'
Message-ID: <202503160619.wZwaRC05-lkp@intel.com>
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
TO: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb88e6bfbc0a975e08a18c39d1138d3e6cdc00a5
commit: 0e8158b4a82eb5bfb69df17510d210b073896f00 OPP: Rework _set_required_devs() to manage a single device per call
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503160619.wZwaRC05-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503160619.wZwaRC05-lkp@intel.com/

New smatch warnings:
drivers/opp/core.c:2516 _opp_set_required_dev() warn: passing positive error code '(-95)' to 'PTR_ERR'

Old smatch warnings:
drivers/opp/core.c:2958 _opp_set_availability() warn: passing positive error code '(-19)' to 'PTR_ERR'
drivers/opp/core.c:3034 dev_pm_opp_adjust_voltage() warn: passing positive error code '(-19)' to 'PTR_ERR'

vim +2516 drivers/opp/core.c

4f018bc0e1cfdec Viresh Kumar 2018-06-26  2475  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2476  static int _opp_set_required_dev(struct opp_table *opp_table,
e37440e7e2c2760 Viresh Kumar 2023-10-27  2477  				 struct device *dev,
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2478  				 struct device *required_dev,
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2479  				 unsigned int index)
e37440e7e2c2760 Viresh Kumar 2023-10-27  2480  {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2481  	struct opp_table *required_table, *pd_table;
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2482  	struct device *gdev;
e37440e7e2c2760 Viresh Kumar 2023-10-27  2483  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2484  	/* Genpd core takes care of propagation to parent genpd */
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2485  	if (opp_table->is_genpd) {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2486  		dev_err(dev, "%s: Operation not supported for genpds\n", __func__);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2487  		return -EOPNOTSUPP;
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2488  	}
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2489  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2490  	if (index >= opp_table->required_opp_count) {
e37440e7e2c2760 Viresh Kumar 2023-10-27  2491  		dev_err(dev, "Required OPPs not available, can't set required devs\n");
e37440e7e2c2760 Viresh Kumar 2023-10-27  2492  		return -EINVAL;
e37440e7e2c2760 Viresh Kumar 2023-10-27  2493  	}
e37440e7e2c2760 Viresh Kumar 2023-10-27  2494  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2495  	required_table = opp_table->required_opp_tables[index];
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2496  	if (IS_ERR(required_table)) {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2497  		dev_err(dev, "Missing OPP table, unable to set the required devs\n");
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2498  		return -ENODEV;
925141432fa4d83 Viresh Kumar 2023-11-16  2499  	}
925141432fa4d83 Viresh Kumar 2023-11-16  2500  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2501  	/*
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2502  	 * The required_opp_tables parsing is not perfect, as the OPP core does
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2503  	 * the parsing solely based on the DT node pointers. The core sets the
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2504  	 * required_opp_tables entry to the first OPP table in the "opp_tables"
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2505  	 * list, that matches with the node pointer.
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2506  	 *
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2507  	 * If the target DT OPP table is used by multiple devices and they all
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2508  	 * create separate instances of 'struct opp_table' from it, then it is
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2509  	 * possible that the required_opp_tables entry may be set to the
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2510  	 * incorrect sibling device.
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2511  	 *
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2512  	 * Cross check it again and fix if required.
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2513  	 */
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2514  	gdev = dev_to_genpd_dev(required_dev);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2515  	if (IS_ERR(gdev))
0e8158b4a82eb5b Ulf Hansson  2024-10-02 @2516  		return PTR_ERR(gdev);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2517  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2518  	pd_table = _find_opp_table(gdev);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2519  	if (!IS_ERR(pd_table)) {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2520  		if (pd_table != required_table) {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2521  			dev_pm_opp_put_opp_table(required_table);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2522  			opp_table->required_opp_tables[index] = pd_table;
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2523  		} else {
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2524  			dev_pm_opp_put_opp_table(pd_table);
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2525  		}
925141432fa4d83 Viresh Kumar 2023-11-16  2526  	}
e37440e7e2c2760 Viresh Kumar 2023-10-27  2527  
0e8158b4a82eb5b Ulf Hansson  2024-10-02  2528  	opp_table->required_devs[index] = required_dev;
e37440e7e2c2760 Viresh Kumar 2023-10-27  2529  	return 0;
e37440e7e2c2760 Viresh Kumar 2023-10-27  2530  }
e37440e7e2c2760 Viresh Kumar 2023-10-27  2531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
