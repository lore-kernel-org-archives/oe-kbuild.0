Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5A13A41F
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 03:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742009825; cv=none; b=dsj61teBXQkSaOWDYF3/3KgoZe7vWHzXMK3go8YS3/zSL98ZleJ6hKKAmtQenENhZz3Z2AP9P8m8yKPCnb570wCHmDCe9bhQBHocOd5GIo+7j5INx3ElfDrrXN1o5MEkz++2/A3zyZ3KO0FDTEgxv8N5VCOoxMTcOOhWkkCzwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742009825; c=relaxed/simple;
	bh=texeLWgmPaQm62eGOeEg+dFweoX+i+T8nSfxEIlASnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lwr2S4LXbDrXNbE9vCUj8beFTTjZfeYdt6Moa5nxMThd9ff2istCZkhoWRvFTeoJHaDlY81nXLgiu4OlYmv/5RHYD+HQ7MtxMvGhZ41Tk2U2Im1LfNMW8p5jQmwdERoKzSITMP0O1rsIAomcPah08to0BmOpqTO0/bd7uKO0pw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/Uttwtg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/Uttwtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742009823; x=1773545823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=texeLWgmPaQm62eGOeEg+dFweoX+i+T8nSfxEIlASnc=;
  b=d/UttwtgA8C+5KoEol6nEqp1e/kOvylXu+3/jUdKxSSz0TG5a2A2bug6
   +3plhXZpCiNoBH2EbD/dyNMF6/IEjyAXrHb7w3PiO/beeF1RYahSAMBmg
   3CMkGUSbKr6Ibk4rbLecn+Mpj5qqvpRB6CCrzmIV0FVc6pobuwexXO6aF
   rQOGWBEN9Coytvm7+amlwV8P7qWb+fMQhDoCDyi0qVE9PtBI2ugMrCFNo
   oYf0hXsCdsGSZ649zAFvvYwGMyRhBpm656CxXEu0Tc1gkO1NadpyXhbd9
   RRmiSE8GwHrkzgT6rcgIWlcl55F2h7/SUagd9rxAJYYepWiDtaJiSUQvH
   g==;
X-CSE-ConnectionGUID: Ap/ibIxqT3m95EyeITTwkQ==
X-CSE-MsgGUID: LoXheN7uSJWPQvNdydq16Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54556564"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="54556564"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 20:37:00 -0700
X-CSE-ConnectionGUID: SDCrIiNXQgSfEk9IKpHeuw==
X-CSE-MsgGUID: CgQvFYtdTkG+eA40d6I+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="144646470"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Mar 2025 20:36:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttIKW-000B2N-03;
	Sat, 15 Mar 2025 03:36:56 +0000
Date: Sat, 15 Mar 2025 11:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/remoteproc/ti_k3_r5_remoteproc.c:1560 k3_r5_core_of_init()
 warn: passing positive error code '(-22)' to 'PTR_ERR'
Message-ID: <202503151126.t4vhCMJI-lkp@intel.com>
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
TO: Andrew Davis <afd@ti.com>
CC: Mathieu Poirier <mathieu.poirier@linaro.org>

Hi Andrew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a29967be967eebf049e89edb14c4edf9991bc929
commit: be3e6529a8b90b1284a55117a4e23095ccbeaeaf remoteproc: k3-r5: Add compile testing support
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: openrisc-randconfig-r072-20250314 (https://download.01.org/0day-ci/archive/20250315/202503151126.t4vhCMJI-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503151126.t4vhCMJI-lkp@intel.com/

smatch warnings:
drivers/remoteproc/ti_k3_r5_remoteproc.c:1560 k3_r5_core_of_init() warn: passing positive error code '(-22)' to 'PTR_ERR'

vim +1560 drivers/remoteproc/ti_k3_r5_remoteproc.c

ea47c6887b6d99e Suman Anna          2020-10-02  1512  
6dedbd1d544389d Suman Anna          2020-10-02  1513  static int k3_r5_core_of_init(struct platform_device *pdev)
6dedbd1d544389d Suman Anna          2020-10-02  1514  {
6dedbd1d544389d Suman Anna          2020-10-02  1515  	struct device *dev = &pdev->dev;
6dedbd1d544389d Suman Anna          2020-10-02  1516  	struct device_node *np = dev_of_node(dev);
6dedbd1d544389d Suman Anna          2020-10-02  1517  	struct k3_r5_core *core;
6dedbd1d544389d Suman Anna          2020-10-02  1518  	int ret;
6dedbd1d544389d Suman Anna          2020-10-02  1519  
6dedbd1d544389d Suman Anna          2020-10-02  1520  	if (!devres_open_group(dev, k3_r5_core_of_init, GFP_KERNEL))
6dedbd1d544389d Suman Anna          2020-10-02  1521  		return -ENOMEM;
6dedbd1d544389d Suman Anna          2020-10-02  1522  
6dedbd1d544389d Suman Anna          2020-10-02  1523  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
6dedbd1d544389d Suman Anna          2020-10-02  1524  	if (!core) {
6dedbd1d544389d Suman Anna          2020-10-02  1525  		ret = -ENOMEM;
6dedbd1d544389d Suman Anna          2020-10-02  1526  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1527  	}
6dedbd1d544389d Suman Anna          2020-10-02  1528  
6dedbd1d544389d Suman Anna          2020-10-02  1529  	core->dev = dev;
6dedbd1d544389d Suman Anna          2020-10-02  1530  	/*
6dedbd1d544389d Suman Anna          2020-10-02  1531  	 * Use SoC Power-on-Reset values as default if no DT properties are
6dedbd1d544389d Suman Anna          2020-10-02  1532  	 * used to dictate the TCM configurations
6dedbd1d544389d Suman Anna          2020-10-02  1533  	 */
6dedbd1d544389d Suman Anna          2020-10-02  1534  	core->atcm_enable = 0;
6dedbd1d544389d Suman Anna          2020-10-02  1535  	core->btcm_enable = 1;
6dedbd1d544389d Suman Anna          2020-10-02  1536  	core->loczrama = 1;
6dedbd1d544389d Suman Anna          2020-10-02  1537  
6dedbd1d544389d Suman Anna          2020-10-02  1538  	ret = of_property_read_u32(np, "ti,atcm-enable", &core->atcm_enable);
6dedbd1d544389d Suman Anna          2020-10-02  1539  	if (ret < 0 && ret != -EINVAL) {
6dedbd1d544389d Suman Anna          2020-10-02  1540  		dev_err(dev, "invalid format for ti,atcm-enable, ret = %d\n",
6dedbd1d544389d Suman Anna          2020-10-02  1541  			ret);
6dedbd1d544389d Suman Anna          2020-10-02  1542  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1543  	}
6dedbd1d544389d Suman Anna          2020-10-02  1544  
6dedbd1d544389d Suman Anna          2020-10-02  1545  	ret = of_property_read_u32(np, "ti,btcm-enable", &core->btcm_enable);
6dedbd1d544389d Suman Anna          2020-10-02  1546  	if (ret < 0 && ret != -EINVAL) {
6dedbd1d544389d Suman Anna          2020-10-02  1547  		dev_err(dev, "invalid format for ti,btcm-enable, ret = %d\n",
6dedbd1d544389d Suman Anna          2020-10-02  1548  			ret);
6dedbd1d544389d Suman Anna          2020-10-02  1549  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1550  	}
6dedbd1d544389d Suman Anna          2020-10-02  1551  
6dedbd1d544389d Suman Anna          2020-10-02  1552  	ret = of_property_read_u32(np, "ti,loczrama", &core->loczrama);
6dedbd1d544389d Suman Anna          2020-10-02  1553  	if (ret < 0 && ret != -EINVAL) {
6dedbd1d544389d Suman Anna          2020-10-02  1554  		dev_err(dev, "invalid format for ti,loczrama, ret = %d\n", ret);
6dedbd1d544389d Suman Anna          2020-10-02  1555  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1556  	}
6dedbd1d544389d Suman Anna          2020-10-02  1557  
6dedbd1d544389d Suman Anna          2020-10-02  1558  	core->ti_sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");
6dedbd1d544389d Suman Anna          2020-10-02  1559  	if (IS_ERR(core->ti_sci)) {
fa9f7efe9ea9f6c Krzysztof Kozlowski 2024-10-11 @1560  		ret = dev_err_probe(dev, PTR_ERR(core->ti_sci), "failed to get ti-sci handle\n");
6dedbd1d544389d Suman Anna          2020-10-02  1561  		core->ti_sci = NULL;
6dedbd1d544389d Suman Anna          2020-10-02  1562  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1563  	}
6dedbd1d544389d Suman Anna          2020-10-02  1564  
6dedbd1d544389d Suman Anna          2020-10-02  1565  	ret = of_property_read_u32(np, "ti,sci-dev-id", &core->ti_sci_id);
6dedbd1d544389d Suman Anna          2020-10-02  1566  	if (ret) {
6dedbd1d544389d Suman Anna          2020-10-02  1567  		dev_err(dev, "missing 'ti,sci-dev-id' property\n");
6dedbd1d544389d Suman Anna          2020-10-02  1568  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1569  	}
6dedbd1d544389d Suman Anna          2020-10-02  1570  
6dedbd1d544389d Suman Anna          2020-10-02  1571  	core->reset = devm_reset_control_get_exclusive(dev, NULL);
6dedbd1d544389d Suman Anna          2020-10-02  1572  	if (IS_ERR_OR_NULL(core->reset)) {
6dedbd1d544389d Suman Anna          2020-10-02  1573  		ret = PTR_ERR_OR_ZERO(core->reset);
6dedbd1d544389d Suman Anna          2020-10-02  1574  		if (!ret)
6dedbd1d544389d Suman Anna          2020-10-02  1575  			ret = -ENODEV;
fa9f7efe9ea9f6c Krzysztof Kozlowski 2024-10-11  1576  		dev_err_probe(dev, ret, "failed to get reset handle\n");
6dedbd1d544389d Suman Anna          2020-10-02  1577  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1578  	}
6dedbd1d544389d Suman Anna          2020-10-02  1579  
ce6acb2240f40f2 Andrew Davis        2024-08-02  1580  	core->tsp = ti_sci_proc_of_get_tsp(dev, core->ti_sci);
6dedbd1d544389d Suman Anna          2020-10-02  1581  	if (IS_ERR(core->tsp)) {
fa9f7efe9ea9f6c Krzysztof Kozlowski 2024-10-11  1582  		ret = dev_err_probe(dev, PTR_ERR(core->tsp),
fa9f7efe9ea9f6c Krzysztof Kozlowski 2024-10-11  1583  				    "failed to construct ti-sci proc control\n");
6dedbd1d544389d Suman Anna          2020-10-02  1584  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1585  	}
6dedbd1d544389d Suman Anna          2020-10-02  1586  
6dedbd1d544389d Suman Anna          2020-10-02  1587  	ret = k3_r5_core_of_get_internal_memories(pdev, core);
6dedbd1d544389d Suman Anna          2020-10-02  1588  	if (ret) {
6dedbd1d544389d Suman Anna          2020-10-02  1589  		dev_err(dev, "failed to get internal memories, ret = %d\n",
6dedbd1d544389d Suman Anna          2020-10-02  1590  			ret);
6dedbd1d544389d Suman Anna          2020-10-02  1591  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1592  	}
6dedbd1d544389d Suman Anna          2020-10-02  1593  
ea47c6887b6d99e Suman Anna          2020-10-02  1594  	ret = k3_r5_core_of_get_sram_memories(pdev, core);
ea47c6887b6d99e Suman Anna          2020-10-02  1595  	if (ret) {
ea47c6887b6d99e Suman Anna          2020-10-02  1596  		dev_err(dev, "failed to get sram memories, ret = %d\n", ret);
ea47c6887b6d99e Suman Anna          2020-10-02  1597  		goto err;
ea47c6887b6d99e Suman Anna          2020-10-02  1598  	}
ea47c6887b6d99e Suman Anna          2020-10-02  1599  
6dedbd1d544389d Suman Anna          2020-10-02  1600  	ret = ti_sci_proc_request(core->tsp);
6dedbd1d544389d Suman Anna          2020-10-02  1601  	if (ret < 0) {
6dedbd1d544389d Suman Anna          2020-10-02  1602  		dev_err(dev, "ti_sci_proc_request failed, ret = %d\n", ret);
6dedbd1d544389d Suman Anna          2020-10-02  1603  		goto err;
6dedbd1d544389d Suman Anna          2020-10-02  1604  	}
6dedbd1d544389d Suman Anna          2020-10-02  1605  
6dedbd1d544389d Suman Anna          2020-10-02  1606  	platform_set_drvdata(pdev, core);
6dedbd1d544389d Suman Anna          2020-10-02  1607  	devres_close_group(dev, k3_r5_core_of_init);
6dedbd1d544389d Suman Anna          2020-10-02  1608  
6dedbd1d544389d Suman Anna          2020-10-02  1609  	return 0;
6dedbd1d544389d Suman Anna          2020-10-02  1610  
6dedbd1d544389d Suman Anna          2020-10-02  1611  err:
6dedbd1d544389d Suman Anna          2020-10-02  1612  	devres_release_group(dev, k3_r5_core_of_init);
6dedbd1d544389d Suman Anna          2020-10-02  1613  	return ret;
6dedbd1d544389d Suman Anna          2020-10-02  1614  }
6dedbd1d544389d Suman Anna          2020-10-02  1615  

:::::: The code at line 1560 was first introduced by commit
:::::: fa9f7efe9ea9f6cb226fce315f241dd0ff670c92 remoteproc: ti_k3_r5: Simplify with dev_err_probe()

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Mathieu Poirier <mathieu.poirier@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
