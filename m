Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6EB3A1E99
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034158; cv=none; b=PYf3JjnQ+OHL2RHQtydoL/ohYxQUxl9yC0UV6v1FAcTzNjLcNfW4yB/ud0/0aVxk9SnhqP0VnBJZEQObm3JCzduK26BAF+lnldG1inrOuI2qb7Y3VXP5mwHyhrdpwqaFWDStGjUmg/BLjVthFw1tmpjwesrIsPV9LI3pNunWV80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034158; c=relaxed/simple;
	bh=sU7o0cmf3GXx4n1OgwGkDyHzSg4eD4om6pOgSpO5U2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djIfiwiPKkijhtec0SfotpJBZOMNwDS+9riCG/B8xPVnA4lYX4UOWnnu30rNoNC3dtlUmtlLQTx8Ejx3E7x5zgGSFEE8Kb0bcLjIJTaaLO6KuFM7bgu/kMIvPMbGCjaSgQN2uDEgX7tZm4NM5HIWP3OvM9fWpej4lw1JPnNaYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxbXMVQW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxbXMVQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766034157; x=1797570157;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sU7o0cmf3GXx4n1OgwGkDyHzSg4eD4om6pOgSpO5U2Y=;
  b=ZxbXMVQWJI3j9mz8DE3UErHbvZTkNmbyquIeCti7VNjqZTVAz8T+7ziN
   nFiroSUaRau4+hE5R1I+rKn9BzGstk9zYB8p03k8i9h00H+2LQwwisUKY
   cgP6Yw5SxTYENUY1fvmdnPUR7lMjb8m0pCea1F0MrBPx82LpP4fA3Xwns
   492k793byR2E/iaH2JC1DTEU80Im8jGjAIi+C82B8jN5vb4xJFyE35/u9
   ti2iqqUmCCJY4sXOAoSwThthW9oLgE8EJmQ0l7imwmCL2rPeCPY9jC/D1
   69Wmm7iFGKhmsJWD5FyBxsY0TibwwJbbfC7dr4Rgwa7NYbM1gBRmG0GRY
   A==;
X-CSE-ConnectionGUID: vcyMZT0LTm+4qwBYXcIb+g==
X-CSE-MsgGUID: 6nDISXKURgyzaLNOcSA7Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71612269"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71612269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:02:36 -0800
X-CSE-ConnectionGUID: gFVIaaqYTw+k6j7Cj7bIjQ==
X-CSE-MsgGUID: PARQaoaYT+a+jdich0YOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="229543292"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2025 21:02:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW69p-000000001bh-1bcG;
	Thu, 18 Dec 2025 05:02:33 +0000
Date: Thu, 18 Dec 2025 13:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/pmc/core.c:1438
 pmc_core_pmt_get_lpm_req() error: uninitialized symbol 'ret'.
Message-ID: <202512181241.tqIwzmvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xi Pardee <xi.pardee@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 1e508af6bc4b24a7924b619800f1b138281f0e82 platform/x86:intel/pmc: Move telemetry endpoint register handling
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181241.tqIwzmvC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181241.tqIwzmvC-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/intel/pmc/core.c:1438 pmc_core_pmt_get_lpm_req() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: uninitialized symbol 'pmc'.
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: uninitialized symbol 'map'.
drivers/platform/x86/intel/pmc/core.c:502 pmc_core_send_ltr_ignore() error: we previously assumed 'pmc' could be null (see line 480)

vim +/ret +1438 drivers/platform/x86/intel/pmc/core.c

78a7491d5cba8b Xi Pardee 2025-04-09  1357  
78a7491d5cba8b Xi Pardee 2025-04-09  1358  /*
a59211ee461022 Xi Pardee 2025-04-25  1359   * This function retrieves low power mode requirement data from PMC Low
a59211ee461022 Xi Pardee 2025-04-25  1360   * Power Mode (LPM) table.
78a7491d5cba8b Xi Pardee 2025-04-09  1361   *
78a7491d5cba8b Xi Pardee 2025-04-09  1362   * In telemetry space, the LPM table contains a 4 byte header followed
78a7491d5cba8b Xi Pardee 2025-04-09  1363   * by 8 consecutive mode blocks (one for each LPM mode). Each block
78a7491d5cba8b Xi Pardee 2025-04-09  1364   * has a 4 byte header followed by a set of registers that describe the
78a7491d5cba8b Xi Pardee 2025-04-09  1365   * IP state requirements for the given mode. The IP mapping is platform
78a7491d5cba8b Xi Pardee 2025-04-09  1366   * specific but the same for each block, making for easy analysis.
78a7491d5cba8b Xi Pardee 2025-04-09  1367   * Platforms only use a subset of the space to track the requirements
78a7491d5cba8b Xi Pardee 2025-04-09  1368   * for their IPs. Callers provide the requirement registers they use as
78a7491d5cba8b Xi Pardee 2025-04-09  1369   * a list of indices. Each requirement register is associated with an
78a7491d5cba8b Xi Pardee 2025-04-09  1370   * IP map that's maintained by the caller.
78a7491d5cba8b Xi Pardee 2025-04-09  1371   *
78a7491d5cba8b Xi Pardee 2025-04-09  1372   * Header
78a7491d5cba8b Xi Pardee 2025-04-09  1373   * +----+----------------------------+----------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1374   * |  0 |      REVISION              |      ENABLED MODES         |
78a7491d5cba8b Xi Pardee 2025-04-09  1375   * +----+--------------+-------------+-------------+--------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1376   *
78a7491d5cba8b Xi Pardee 2025-04-09  1377   * Low Power Mode 0 Block
78a7491d5cba8b Xi Pardee 2025-04-09  1378   * +----+--------------+-------------+-------------+--------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1379   * |  1 |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
78a7491d5cba8b Xi Pardee 2025-04-09  1380   * +----+--------------+-------------+-------------+--------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1381   * |  2 |           LPM0 Requirements 0                           |
78a7491d5cba8b Xi Pardee 2025-04-09  1382   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1383   * |    |                  ...                                    |
78a7491d5cba8b Xi Pardee 2025-04-09  1384   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1385   * | 29 |           LPM0 Requirements 27                          |
78a7491d5cba8b Xi Pardee 2025-04-09  1386   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1387   *
78a7491d5cba8b Xi Pardee 2025-04-09  1388   * ...
78a7491d5cba8b Xi Pardee 2025-04-09  1389   *
78a7491d5cba8b Xi Pardee 2025-04-09  1390   * Low Power Mode 7 Block
78a7491d5cba8b Xi Pardee 2025-04-09  1391   * +----+--------------+-------------+-------------+--------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1392   * |    |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
78a7491d5cba8b Xi Pardee 2025-04-09  1393   * +----+--------------+-------------+-------------+--------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1394   * | 60 |           LPM7 Requirements 0                           |
78a7491d5cba8b Xi Pardee 2025-04-09  1395   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1396   * |    |                  ...                                    |
78a7491d5cba8b Xi Pardee 2025-04-09  1397   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1398   * | 87 |           LPM7 Requirements 27                          |
78a7491d5cba8b Xi Pardee 2025-04-09  1399   * +----+---------------------------------------------------------+
78a7491d5cba8b Xi Pardee 2025-04-09  1400   *
78a7491d5cba8b Xi Pardee 2025-04-09  1401   */
1e508af6bc4b24 Xi Pardee 2025-09-10  1402  static int pmc_core_pmt_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc,
1e508af6bc4b24 Xi Pardee 2025-09-10  1403  				    struct telem_endpoint *ep)
a59211ee461022 Xi Pardee 2025-04-25  1404  {
a59211ee461022 Xi Pardee 2025-04-25  1405  	const u8 *lpm_indices;
a59211ee461022 Xi Pardee 2025-04-25  1406  	int num_maps, mode_offset = 0;
a59211ee461022 Xi Pardee 2025-04-25  1407  	int ret, mode;
a59211ee461022 Xi Pardee 2025-04-25  1408  	int lpm_size;
a59211ee461022 Xi Pardee 2025-04-25  1409  
a59211ee461022 Xi Pardee 2025-04-25  1410  	lpm_indices = pmc->map->lpm_reg_index;
a59211ee461022 Xi Pardee 2025-04-25  1411  	num_maps = pmc->map->lpm_num_maps;
a59211ee461022 Xi Pardee 2025-04-25  1412  	lpm_size = LPM_MAX_NUM_MODES * num_maps;
a59211ee461022 Xi Pardee 2025-04-25  1413  
a59211ee461022 Xi Pardee 2025-04-25  1414  	pmc->lpm_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
a59211ee461022 Xi Pardee 2025-04-25  1415  					 lpm_size * sizeof(u32),
a59211ee461022 Xi Pardee 2025-04-25  1416  					 GFP_KERNEL);
1e508af6bc4b24 Xi Pardee 2025-09-10  1417  	if (!pmc->lpm_req_regs)
1e508af6bc4b24 Xi Pardee 2025-09-10  1418  		return -ENOMEM;
a59211ee461022 Xi Pardee 2025-04-25  1419  
78a7491d5cba8b Xi Pardee 2025-04-09  1420  	mode_offset = LPM_HEADER_OFFSET + LPM_MODE_OFFSET;
78a7491d5cba8b Xi Pardee 2025-04-09  1421  	pmc_for_each_mode(mode, pmcdev) {
78a7491d5cba8b Xi Pardee 2025-04-09  1422  		u32 *req_offset = pmc->lpm_req_regs + (mode * num_maps);
78a7491d5cba8b Xi Pardee 2025-04-09  1423  		int m;
78a7491d5cba8b Xi Pardee 2025-04-09  1424  
78a7491d5cba8b Xi Pardee 2025-04-09  1425  		for (m = 0; m < num_maps; m++) {
78a7491d5cba8b Xi Pardee 2025-04-09  1426  			u8 sample_id = lpm_indices[m] + mode_offset;
78a7491d5cba8b Xi Pardee 2025-04-09  1427  
78a7491d5cba8b Xi Pardee 2025-04-09  1428  			ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
78a7491d5cba8b Xi Pardee 2025-04-09  1429  			if (ret) {
78a7491d5cba8b Xi Pardee 2025-04-09  1430  				dev_err(&pmcdev->pdev->dev,
78a7491d5cba8b Xi Pardee 2025-04-09  1431  					"couldn't read Low Power Mode requirements: %d\n", ret);
1e508af6bc4b24 Xi Pardee 2025-09-10  1432  				return ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1433  			}
78a7491d5cba8b Xi Pardee 2025-04-09  1434  			++req_offset;
78a7491d5cba8b Xi Pardee 2025-04-09  1435  		}
78a7491d5cba8b Xi Pardee 2025-04-09  1436  		mode_offset += LPM_REG_COUNT + LPM_MODE_OFFSET;
78a7491d5cba8b Xi Pardee 2025-04-09  1437  	}
78a7491d5cba8b Xi Pardee 2025-04-09 @1438  	return ret;
78a7491d5cba8b Xi Pardee 2025-04-09  1439  }
78a7491d5cba8b Xi Pardee 2025-04-09  1440  

:::::: The code at line 1438 was first introduced by commit
:::::: 78a7491d5cba8b63c8dbaafc15cc92a2e3f049ca platform/x86:intel/pmc: Move PMC Core related functions

:::::: TO: Xi Pardee <xi.pardee@linux.intel.com>
:::::: CC: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
