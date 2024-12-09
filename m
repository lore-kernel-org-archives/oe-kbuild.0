Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A82F16C451
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720085; cv=none; b=BOoqn27mrIsRT7tVe+Pwll2/aR2EdA2g7a3N4mDq9lI5ALqAiLlkiQLhDQo+hMNt12FhAFTBYg/8Y10XVtyLm8bcXJHpiyxOwUjh3DovnpLSrHuNO3Mew4StGzaCLueDHj0vFkbdig+L7c2pKE2C1fpMnoTUmwFtf088TE2FY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720085; c=relaxed/simple;
	bh=B4QCO7t9c2xBtOnA3VitDK5lnPoMucWyF9dHr6XpmTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CdrtOR3b2GNq3agkT0cfqIhuhLPEdvh4h8YGA1l6p9kskLD9X3zt8R0SDOW3eB8ZE/Q6lCPEPh0B49vR8ldK3gry7frffBswOc/C9iXNqFTP9PqNx2XjA6BNftuOdVuCoFJBPT+fN7naLx/OuVY2cqb8hLnfmA2Lnh/qINSG0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSJkHw9M; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSJkHw9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720083; x=1765256083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B4QCO7t9c2xBtOnA3VitDK5lnPoMucWyF9dHr6XpmTM=;
  b=RSJkHw9MEmhUD72YLZuRNvzHZAavx9yW8tu5TVcx6c1YU2JEttuH9vtv
   IWGAehVUrLvuM8liaIpHEuFGn00uaD8ABnHkffLXca1kRWT6Z6V+wsAi3
   FAdOK1kKdsLXw5P+fES9qxvkHtwgaYKJQRNnew6g8tLXhgxeeGFF46kk+
   aF5zwhR/niDOHJ/4Xosr1qG58Kf1gC+Z614eAIQTSoywdcAn9BNOP2S0g
   z6y7a7Y1PliEXrszlw4rpa1G8QdNvtLhZKzT8LV7Tz6et3zRWC68BCnuA
   VIljX5mCqubsdrG7y22XHqG3Hdjre/CB3B3op1ZGF9sqF31+29gIhlPnu
   g==;
X-CSE-ConnectionGUID: M7R40PbCQyCBlSvc2/o47A==
X-CSE-MsgGUID: xqHPgBW9S5CcYe9ZTx4oGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416636"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416636"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:54:41 -0800
X-CSE-ConnectionGUID: ikcPW0AqTjyJFXe6n2j/Xg==
X-CSE-MsgGUID: fDYKEf3hRMGy9Zdah4EvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94802488"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2024 20:54:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVn4-0003wK-08;
	Mon, 09 Dec 2024 04:54:38 +0000
Date: Mon, 9 Dec 2024 12:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/soc/fsl/qbman/qman_portal.c:224 qman_portal_probe() warn:
 missing unwind goto?
Message-ID: <202412090456.aE4lc2pG-lkp@intel.com>
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
TO: Breno Leitao <leitao@debian.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>

Hi Breno,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 782fe08e9861d00ce8aca370453dd9ceb9a23d50 soc: fsl: qbman: FSL_DPAA depends on COMPILE_TEST
date:   5 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r071-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090456.aE4lc2pG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412090456.aE4lc2pG-lkp@intel.com/

smatch warnings:
drivers/soc/fsl/qbman/qman_portal.c:224 qman_portal_probe() warn: missing unwind goto?

vim +224 drivers/soc/fsl/qbman/qman_portal.c

5d1d046e2868fc Laurentiu Tudor 2019-04-27  180  
c535e923bb97a4 Claudiu Manoil  2016-09-22  181  static int qman_portal_probe(struct platform_device *pdev)
c535e923bb97a4 Claudiu Manoil  2016-09-22  182  {
c535e923bb97a4 Claudiu Manoil  2016-09-22  183  	struct device *dev = &pdev->dev;
c535e923bb97a4 Claudiu Manoil  2016-09-22  184  	struct device_node *node = dev->of_node;
c535e923bb97a4 Claudiu Manoil  2016-09-22  185  	struct qm_portal_config *pcfg;
c535e923bb97a4 Claudiu Manoil  2016-09-22  186  	struct resource *addr_phys[2];
c5501aa92a881e Roy Pledge      2019-08-01  187  	int irq, cpu, err, i;
2f28d218d4b82e Madalin Bucur   2016-11-16  188  	u32 val;
c535e923bb97a4 Claudiu Manoil  2016-09-22  189  
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  190  	err = qman_is_probed();
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  191  	if (!err)
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  192  		return -EPROBE_DEFER;
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  193  	if (err < 0) {
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  194  		dev_err(&pdev->dev, "failing probe due to qman probe error\n");
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  195  		return -ENODEV;
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  196  	}
5a1eb8b9542884 Laurentiu Tudor 2018-09-26  197  
c535e923bb97a4 Claudiu Manoil  2016-09-22  198  	pcfg = devm_kmalloc(dev, sizeof(*pcfg), GFP_KERNEL);
5d1d046e2868fc Laurentiu Tudor 2019-04-27  199  	if (!pcfg) {
5d1d046e2868fc Laurentiu Tudor 2019-04-27  200  		__qman_portals_probed = -1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  201  		return -ENOMEM;
5d1d046e2868fc Laurentiu Tudor 2019-04-27  202  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  203  
c535e923bb97a4 Claudiu Manoil  2016-09-22  204  	pcfg->dev = dev;
c535e923bb97a4 Claudiu Manoil  2016-09-22  205  
c535e923bb97a4 Claudiu Manoil  2016-09-22  206  	addr_phys[0] = platform_get_resource(pdev, IORESOURCE_MEM,
c535e923bb97a4 Claudiu Manoil  2016-09-22  207  					     DPAA_PORTAL_CE);
c535e923bb97a4 Claudiu Manoil  2016-09-22  208  	if (!addr_phys[0]) {
37c342cba5ef1c Rob Herring     2017-07-18  209  		dev_err(dev, "Can't get %pOF property 'reg::CE'\n", node);
5d1d046e2868fc Laurentiu Tudor 2019-04-27  210  		goto err_ioremap1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  211  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  212  
c535e923bb97a4 Claudiu Manoil  2016-09-22  213  	addr_phys[1] = platform_get_resource(pdev, IORESOURCE_MEM,
c535e923bb97a4 Claudiu Manoil  2016-09-22  214  					     DPAA_PORTAL_CI);
c535e923bb97a4 Claudiu Manoil  2016-09-22  215  	if (!addr_phys[1]) {
37c342cba5ef1c Rob Herring     2017-07-18  216  		dev_err(dev, "Can't get %pOF property 'reg::CI'\n", node);
5d1d046e2868fc Laurentiu Tudor 2019-04-27  217  		goto err_ioremap1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  218  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  219  
2f28d218d4b82e Madalin Bucur   2016-11-16  220  	err = of_property_read_u32(node, "cell-index", &val);
2f28d218d4b82e Madalin Bucur   2016-11-16  221  	if (err) {
37c342cba5ef1c Rob Herring     2017-07-18  222  		dev_err(dev, "Can't get %pOF property 'cell-index'\n", node);
5d1d046e2868fc Laurentiu Tudor 2019-04-27  223  		__qman_portals_probed = -1;
2f28d218d4b82e Madalin Bucur   2016-11-16 @224  		return err;
c535e923bb97a4 Claudiu Manoil  2016-09-22  225  	}
2f28d218d4b82e Madalin Bucur   2016-11-16  226  	pcfg->channel = val;
c535e923bb97a4 Claudiu Manoil  2016-09-22  227  	pcfg->cpu = -1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  228  	irq = platform_get_irq(pdev, 0);
031bca078e7554 Stephen Boyd    2019-07-30  229  	if (irq <= 0)
5d1d046e2868fc Laurentiu Tudor 2019-04-27  230  		goto err_ioremap1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  231  	pcfg->irq = irq;
c535e923bb97a4 Claudiu Manoil  2016-09-22  232  
e6e2df69c8321f Roy Pledge      2017-09-18  233  	pcfg->addr_virt_ce = memremap(addr_phys[0]->start,
e6e2df69c8321f Roy Pledge      2017-09-18  234  					resource_size(addr_phys[0]),
e6e2df69c8321f Roy Pledge      2017-09-18  235  					QBMAN_MEMREMAP_ATTR);
e6e2df69c8321f Roy Pledge      2017-09-18  236  	if (!pcfg->addr_virt_ce) {
e6e2df69c8321f Roy Pledge      2017-09-18  237  		dev_err(dev, "memremap::CE failed\n");
c535e923bb97a4 Claudiu Manoil  2016-09-22  238  		goto err_ioremap1;
333e72cf475065 Claudiu Manoil  2016-11-16  239  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  240  
e6e2df69c8321f Roy Pledge      2017-09-18  241  	pcfg->addr_virt_ci = ioremap(addr_phys[1]->start,
e6e2df69c8321f Roy Pledge      2017-09-18  242  				resource_size(addr_phys[1]));
e6e2df69c8321f Roy Pledge      2017-09-18  243  	if (!pcfg->addr_virt_ci) {
333e72cf475065 Claudiu Manoil  2016-11-16  244  		dev_err(dev, "ioremap::CI failed\n");
c535e923bb97a4 Claudiu Manoil  2016-09-22  245  		goto err_ioremap2;
333e72cf475065 Claudiu Manoil  2016-11-16  246  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  247  
c535e923bb97a4 Claudiu Manoil  2016-09-22  248  	pcfg->pools = qm_get_pools_sdqcr();
c535e923bb97a4 Claudiu Manoil  2016-09-22  249  
c535e923bb97a4 Claudiu Manoil  2016-09-22  250  	spin_lock(&qman_lock);
9b51d9d866482a Yury Norov      2021-08-14  251  	cpu = cpumask_first_zero(&portal_cpus);
c535e923bb97a4 Claudiu Manoil  2016-09-22  252  	if (cpu >= nr_cpu_ids) {
5d1d046e2868fc Laurentiu Tudor 2019-04-27  253  		__qman_portals_probed = 1;
c535e923bb97a4 Claudiu Manoil  2016-09-22  254  		/* unassigned portal, skip init */
c535e923bb97a4 Claudiu Manoil  2016-09-22  255  		spin_unlock(&qman_lock);
c4e38b2a27a852 Roy Pledge      2020-11-03  256  		goto check_cleanup;
c535e923bb97a4 Claudiu Manoil  2016-09-22  257  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  258  
c535e923bb97a4 Claudiu Manoil  2016-09-22  259  	cpumask_set_cpu(cpu, &portal_cpus);
c535e923bb97a4 Claudiu Manoil  2016-09-22  260  	spin_unlock(&qman_lock);
c535e923bb97a4 Claudiu Manoil  2016-09-22  261  	pcfg->cpu = cpu;
c535e923bb97a4 Claudiu Manoil  2016-09-22  262  
0fbeac3b0f67a5 Claudiu Manoil  2016-11-16  263  	if (dma_set_mask(dev, DMA_BIT_MASK(40))) {
0fbeac3b0f67a5 Claudiu Manoil  2016-11-16  264  		dev_err(dev, "dma_set_mask() failed\n");
0fbeac3b0f67a5 Claudiu Manoil  2016-11-16  265  		goto err_portal_init;
0fbeac3b0f67a5 Claudiu Manoil  2016-11-16  266  	}
0fbeac3b0f67a5 Claudiu Manoil  2016-11-16  267  
333e72cf475065 Claudiu Manoil  2016-11-16  268  	if (!init_pcfg(pcfg)) {
333e72cf475065 Claudiu Manoil  2016-11-16  269  		dev_err(dev, "portal init failed\n");
333e72cf475065 Claudiu Manoil  2016-11-16  270  		goto err_portal_init;
333e72cf475065 Claudiu Manoil  2016-11-16  271  	}
c535e923bb97a4 Claudiu Manoil  2016-09-22  272  
c535e923bb97a4 Claudiu Manoil  2016-09-22  273  	/* clear irq affinity if assigned cpu is offline */
c535e923bb97a4 Claudiu Manoil  2016-09-22  274  	if (!cpu_online(cpu))
c535e923bb97a4 Claudiu Manoil  2016-09-22  275  		qman_offline_cpu(cpu);
c535e923bb97a4 Claudiu Manoil  2016-09-22  276  
c4e38b2a27a852 Roy Pledge      2020-11-03  277  check_cleanup:
c5501aa92a881e Roy Pledge      2019-08-01  278  	if (__qman_portals_probed == 1 && qman_requires_cleanup()) {
c5501aa92a881e Roy Pledge      2019-08-01  279  		/*
c5501aa92a881e Roy Pledge      2019-08-01  280  		 * QMan wasn't reset prior to boot (Kexec for example)
c5501aa92a881e Roy Pledge      2019-08-01  281  		 * Empty all the frame queues so they are in reset state
c5501aa92a881e Roy Pledge      2019-08-01  282  		 */
c5501aa92a881e Roy Pledge      2019-08-01  283  		for (i = 0; i < qm_get_fqid_maxcnt(); i++) {
c5501aa92a881e Roy Pledge      2019-08-01  284  			err =  qman_shutdown_fq(i);
c5501aa92a881e Roy Pledge      2019-08-01  285  			if (err) {
c5501aa92a881e Roy Pledge      2019-08-01  286  				dev_err(dev, "Failed to shutdown frame queue %d\n",
c5501aa92a881e Roy Pledge      2019-08-01  287  					i);
c5501aa92a881e Roy Pledge      2019-08-01  288  				goto err_portal_init;
c5501aa92a881e Roy Pledge      2019-08-01  289  			}
c5501aa92a881e Roy Pledge      2019-08-01  290  		}
c5501aa92a881e Roy Pledge      2019-08-01  291  		qman_done_cleanup();
c5501aa92a881e Roy Pledge      2019-08-01  292  	}
c5501aa92a881e Roy Pledge      2019-08-01  293  
c535e923bb97a4 Claudiu Manoil  2016-09-22  294  	return 0;
c535e923bb97a4 Claudiu Manoil  2016-09-22  295  
333e72cf475065 Claudiu Manoil  2016-11-16  296  err_portal_init:
e6e2df69c8321f Roy Pledge      2017-09-18  297  	iounmap(pcfg->addr_virt_ci);
c535e923bb97a4 Claudiu Manoil  2016-09-22  298  err_ioremap2:
e6e2df69c8321f Roy Pledge      2017-09-18  299  	memunmap(pcfg->addr_virt_ce);
c535e923bb97a4 Claudiu Manoil  2016-09-22  300  err_ioremap1:
5d1d046e2868fc Laurentiu Tudor 2019-04-27  301  	__qman_portals_probed = -1;
5d1d046e2868fc Laurentiu Tudor 2019-04-27  302  
c535e923bb97a4 Claudiu Manoil  2016-09-22  303  	return -ENXIO;
c535e923bb97a4 Claudiu Manoil  2016-09-22  304  }
c535e923bb97a4 Claudiu Manoil  2016-09-22  305  

:::::: The code at line 224 was first introduced by commit
:::::: 2f28d218d4b82e0eb5c437f25004a4d36e32ab35 soc/qman: Replace of_get_property() with portable equivalent

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: Scott Wood <oss@buserror.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
