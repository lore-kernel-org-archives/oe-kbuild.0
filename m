Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792838DD9
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705878275; cv=none; b=NBrqa5jMuHdnXST9eF2Vw++34TqedQaLT5MHsVyFf4fyLdXiiLMRnkS81dEefInaBVKwv1GcThY9Gh+k1bJBrvCiTaIuEbj5hvJksnS+xpqQJXf7MuqVbxxCnrDBy/TtPFY2FBETJx0wcZQ92PybyGGAAX3Y7GxGVj1B+309miI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705878275; c=relaxed/simple;
	bh=vNbLM6pcXZct1sw0bPQkDLG03umQdzGsB51+ImzcnlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DRqcqueMIkQHVy2YJa7a8rLj6H4GBjOzfC9glB/fi3KSZj09JGXkaElz1o5GwbPJ4wOdckd5x/kx5MDiUs55DdUpJstwUMt0lDcqFxV+SbDWlMmrpi8YDxqjUwXv20R2BXPYPY6dLERijddjr55YfmsPkYi0R95gF9HxBvUys9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7kUUfc5; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7kUUfc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705878274; x=1737414274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNbLM6pcXZct1sw0bPQkDLG03umQdzGsB51+ImzcnlM=;
  b=N7kUUfc5dEWQnUOfbyp09vqQjab4UcT07J7Pzrb24tNQvBulJGQNy8P0
   SkKF/t2gt5aOyc7pIg2u0SW9xp109KKr8MXsDvihmVvh3PNrLYhJ0/hJw
   TPPdTxQVisZnNbp26uLARUTH+iy41LC3l0xBvok3ezL4BTaCjJ10mUDz9
   iXJtMLmfggqmASYYjBTGwGAZAVN+pyyL4zb4KopApMTYnRs3VdF/MR8Vw
   PjFeAejCHyUQ7S7fhnS2W2KlHq+0qgRzkOqYm2FPll2Rcpiu5Nj4zVtfe
   KL0WqMrQi6s/eY0qU0frnUYBxCiKM/EvqSlcqDHP57m9la4A6K5lLqCbw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="399947077"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="399947077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 15:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="908783701"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="908783701"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Jan 2024 15:04:28 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRgra-0006Ei-2G;
	Sun, 21 Jan 2024 23:04:26 +0000
Date: Mon, 22 Jan 2024 07:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] ata: ahci_ceva: fix error handling for Xilinx GT PHY
 support
Message-ID: <202401220603.dgjTZ08O-lkp@intel.com>
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
In-Reply-To: <1705604904-471889-2-git-send-email-radhey.shyam.pandey@amd.com>
References: <1705604904-471889-2-git-send-email-radhey.shyam.pandey@amd.com>
TO: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
TO: dlemoal@kernel.org
TO: cassel@kernel.org
TO: richardcochran@gmail.com
TO: piyush.mehta@xilinx.com
TO: axboe@kernel.dk
TO: michal.simek@amd.com
CC: linux-ide@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: git@amd.com
CC: Piyush Mehta <piyush.mehta@amd.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Hi Radhey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Radhey-Shyam-Pandey/ata-ahci_ceva-fix-error-handling-for-Xilinx-GT-PHY-support/20240119-031129
base:   linus/master
patch link:    https://lore.kernel.org/r/1705604904-471889-2-git-send-email-radhey.shyam.pandey%40amd.com
patch subject: [PATCH 1/2] ata: ahci_ceva: fix error handling for Xilinx GT PHY support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240120 (https://download.01.org/0day-ci/archive/20240122/202401220603.dgjTZ08O-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401220603.dgjTZ08O-lkp@intel.com/

smatch warnings:
drivers/ata/ahci_ceva.c:335 ceva_ahci_probe() error: uninitialized symbol 'i'.

vim +/i +335 drivers/ata/ahci_ceva.c

a73ed35052ca85 Suneel Garapati      2015-06-09  191  
a73ed35052ca85 Suneel Garapati      2015-06-09  192  static int ceva_ahci_probe(struct platform_device *pdev)
a73ed35052ca85 Suneel Garapati      2015-06-09  193  {
a73ed35052ca85 Suneel Garapati      2015-06-09  194  	struct device_node *np = pdev->dev.of_node;
a73ed35052ca85 Suneel Garapati      2015-06-09  195  	struct device *dev = &pdev->dev;
a73ed35052ca85 Suneel Garapati      2015-06-09  196  	struct ahci_host_priv *hpriv;
a73ed35052ca85 Suneel Garapati      2015-06-09  197  	struct ceva_ahci_priv *cevapriv;
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  198  	enum dev_dma_attr attr;
b1600f5880a13f Piyush Mehta         2024-01-19  199  	int rc, i;
a73ed35052ca85 Suneel Garapati      2015-06-09  200  
a73ed35052ca85 Suneel Garapati      2015-06-09  201  	cevapriv = devm_kzalloc(dev, sizeof(*cevapriv), GFP_KERNEL);
a73ed35052ca85 Suneel Garapati      2015-06-09  202  	if (!cevapriv)
a73ed35052ca85 Suneel Garapati      2015-06-09  203  		return -ENOMEM;
a73ed35052ca85 Suneel Garapati      2015-06-09  204  
a73ed35052ca85 Suneel Garapati      2015-06-09  205  	cevapriv->ahci_pdev = pdev;
a73ed35052ca85 Suneel Garapati      2015-06-09  206  
9a9d3abe24bb6b Piyush Mehta         2021-02-08  207  	cevapriv->rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
9a9d3abe24bb6b Piyush Mehta         2021-02-08  208  								  NULL);
fa4b42b2a968dc Piyush Mehta         2021-03-05  209  	if (IS_ERR(cevapriv->rst))
fa4b42b2a968dc Piyush Mehta         2021-03-05  210  		dev_err_probe(&pdev->dev, PTR_ERR(cevapriv->rst),
fa4b42b2a968dc Piyush Mehta         2021-03-05  211  			      "failed to get reset\n");
9a9d3abe24bb6b Piyush Mehta         2021-02-08  212  
16af2d65842d34 Kunihiko Hayashi     2018-08-22  213  	hpriv = ahci_platform_get_resources(pdev, 0);
a73ed35052ca85 Suneel Garapati      2015-06-09  214  	if (IS_ERR(hpriv))
a73ed35052ca85 Suneel Garapati      2015-06-09  215  		return PTR_ERR(hpriv);
a73ed35052ca85 Suneel Garapati      2015-06-09  216  
9a9d3abe24bb6b Piyush Mehta         2021-02-08  217  	if (!cevapriv->rst) {
a73ed35052ca85 Suneel Garapati      2015-06-09  218  		rc = ahci_platform_enable_resources(hpriv);
a73ed35052ca85 Suneel Garapati      2015-06-09  219  		if (rc)
a73ed35052ca85 Suneel Garapati      2015-06-09  220  			return rc;
9a9d3abe24bb6b Piyush Mehta         2021-02-08  221  	} else {
9a9d3abe24bb6b Piyush Mehta         2021-02-08  222  		rc = ahci_platform_enable_clks(hpriv);
9a9d3abe24bb6b Piyush Mehta         2021-02-08  223  		if (rc)
9a9d3abe24bb6b Piyush Mehta         2021-02-08  224  			return rc;
9a9d3abe24bb6b Piyush Mehta         2021-02-08  225  		/* Assert the controller reset */
9a9d3abe24bb6b Piyush Mehta         2021-02-08  226  		reset_control_assert(cevapriv->rst);
9a9d3abe24bb6b Piyush Mehta         2021-02-08  227  
9a9d3abe24bb6b Piyush Mehta         2021-02-08  228  		for (i = 0; i < hpriv->nports; i++) {
9a9d3abe24bb6b Piyush Mehta         2021-02-08  229  			rc = phy_init(hpriv->phys[i]);
b1600f5880a13f Piyush Mehta         2024-01-19  230  			if (rc) {
b1600f5880a13f Piyush Mehta         2024-01-19  231  				while (--i >= 0)
b1600f5880a13f Piyush Mehta         2024-01-19  232  					phy_exit(hpriv->phys[i]);
b1600f5880a13f Piyush Mehta         2024-01-19  233  				goto disable_clks;
b1600f5880a13f Piyush Mehta         2024-01-19  234  			}
9a9d3abe24bb6b Piyush Mehta         2021-02-08  235  		}
9a9d3abe24bb6b Piyush Mehta         2021-02-08  236  
9a9d3abe24bb6b Piyush Mehta         2021-02-08  237  		/* De-assert the controller reset */
9a9d3abe24bb6b Piyush Mehta         2021-02-08  238  		reset_control_deassert(cevapriv->rst);
9a9d3abe24bb6b Piyush Mehta         2021-02-08  239  
9a9d3abe24bb6b Piyush Mehta         2021-02-08  240  		for (i = 0; i < hpriv->nports; i++) {
9a9d3abe24bb6b Piyush Mehta         2021-02-08  241  			rc = phy_power_on(hpriv->phys[i]);
9a9d3abe24bb6b Piyush Mehta         2021-02-08  242  			if (rc) {
9a9d3abe24bb6b Piyush Mehta         2021-02-08  243  				phy_exit(hpriv->phys[i]);
b1600f5880a13f Piyush Mehta         2024-01-19  244  				goto disable_phys;
9a9d3abe24bb6b Piyush Mehta         2021-02-08  245  			}
9a9d3abe24bb6b Piyush Mehta         2021-02-08  246  		}
9a9d3abe24bb6b Piyush Mehta         2021-02-08  247  	}
a73ed35052ca85 Suneel Garapati      2015-06-09  248  
a73ed35052ca85 Suneel Garapati      2015-06-09  249  	if (of_property_read_bool(np, "ceva,broken-gen2"))
a73ed35052ca85 Suneel Garapati      2015-06-09  250  		cevapriv->flags = CEVA_FLAG_BROKEN_GEN2;
a73ed35052ca85 Suneel Garapati      2015-06-09  251  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  252  	/* Read OOB timing value for COMINIT from device-tree */
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  253  	if (of_property_read_u8_array(np, "ceva,p0-cominit-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  254  					(u8 *)&cevapriv->pp2c[0], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  255  		dev_warn(dev, "ceva,p0-cominit-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  256  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  257  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  258  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  259  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  260  	if (of_property_read_u8_array(np, "ceva,p1-cominit-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  261  					(u8 *)&cevapriv->pp2c[1], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  262  		dev_warn(dev, "ceva,p1-cominit-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  263  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  264  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  265  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  266  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  267  	/* Read OOB timing value for COMWAKE from device-tree*/
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  268  	if (of_property_read_u8_array(np, "ceva,p0-comwake-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  269  					(u8 *)&cevapriv->pp3c[0], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  270  		dev_warn(dev, "ceva,p0-comwake-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  271  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  272  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  273  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  274  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  275  	if (of_property_read_u8_array(np, "ceva,p1-comwake-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  276  					(u8 *)&cevapriv->pp3c[1], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  277  		dev_warn(dev, "ceva,p1-comwake-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  278  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  279  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  280  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  281  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  282  	/* Read phy BURST timing value from device-tree */
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  283  	if (of_property_read_u8_array(np, "ceva,p0-burst-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  284  					(u8 *)&cevapriv->pp4c[0], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  285  		dev_warn(dev, "ceva,p0-burst-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  286  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  287  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  288  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  289  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  290  	if (of_property_read_u8_array(np, "ceva,p1-burst-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  291  					(u8 *)&cevapriv->pp4c[1], 4) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  292  		dev_warn(dev, "ceva,p1-burst-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  293  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  294  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  295  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  296  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  297  	/* Read phy RETRY interval timing value from device-tree */
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  298  	if (of_property_read_u16_array(np, "ceva,p0-retry-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  299  					(u16 *)&cevapriv->pp5c[0], 2) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  300  		dev_warn(dev, "ceva,p0-retry-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  301  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  302  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  303  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  304  
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  305  	if (of_property_read_u16_array(np, "ceva,p1-retry-params",
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  306  					(u16 *)&cevapriv->pp5c[1], 2) < 0) {
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  307  		dev_warn(dev, "ceva,p1-retry-params property not defined\n");
b1600f5880a13f Piyush Mehta         2024-01-19  308  		rc = -EINVAL;
b1600f5880a13f Piyush Mehta         2024-01-19  309  		goto disable_phys;
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  310  	}
fe8365bbf8ac58 Anurag Kumar Vulisha 2017-08-21  311  
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  312  	/*
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  313  	 * Check if CCI is enabled for SATA. The DEV_DMA_COHERENT is returned
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  314  	 * if CCI is enabled, so check for DEV_DMA_COHERENT.
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  315  	 */
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  316  	attr = device_get_dma_attr(dev);
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  317  	cevapriv->is_cci_enabled = (attr == DEV_DMA_COHERENT);
3bc867de85b5bf Anurag Kumar Vulisha 2017-08-21  318  
a73ed35052ca85 Suneel Garapati      2015-06-09  319  	hpriv->plat_data = cevapriv;
a73ed35052ca85 Suneel Garapati      2015-06-09  320  
a73ed35052ca85 Suneel Garapati      2015-06-09  321  	/* CEVA specific initialization */
a73ed35052ca85 Suneel Garapati      2015-06-09  322  	ahci_ceva_setup(hpriv);
a73ed35052ca85 Suneel Garapati      2015-06-09  323  
a73ed35052ca85 Suneel Garapati      2015-06-09  324  	rc = ahci_platform_init_host(pdev, hpriv, &ahci_ceva_port_info,
a73ed35052ca85 Suneel Garapati      2015-06-09  325  					&ahci_platform_sht);
a73ed35052ca85 Suneel Garapati      2015-06-09  326  	if (rc)
a73ed35052ca85 Suneel Garapati      2015-06-09  327  		goto disable_resources;
a73ed35052ca85 Suneel Garapati      2015-06-09  328  
a73ed35052ca85 Suneel Garapati      2015-06-09  329  	return 0;
a73ed35052ca85 Suneel Garapati      2015-06-09  330  
a73ed35052ca85 Suneel Garapati      2015-06-09  331  disable_resources:
a73ed35052ca85 Suneel Garapati      2015-06-09  332  	ahci_platform_disable_resources(hpriv);
b1600f5880a13f Piyush Mehta         2024-01-19  333  
b1600f5880a13f Piyush Mehta         2024-01-19  334  disable_phys:
b1600f5880a13f Piyush Mehta         2024-01-19 @335  	while (--i >= 0) {
b1600f5880a13f Piyush Mehta         2024-01-19  336  		phy_power_off(hpriv->phys[i]);
b1600f5880a13f Piyush Mehta         2024-01-19  337  		phy_exit(hpriv->phys[i]);
b1600f5880a13f Piyush Mehta         2024-01-19  338  	}
b1600f5880a13f Piyush Mehta         2024-01-19  339  
b1600f5880a13f Piyush Mehta         2024-01-19  340  disable_clks:
b1600f5880a13f Piyush Mehta         2024-01-19  341  	ahci_platform_disable_clks(hpriv);
b1600f5880a13f Piyush Mehta         2024-01-19  342  
a73ed35052ca85 Suneel Garapati      2015-06-09  343  	return rc;
a73ed35052ca85 Suneel Garapati      2015-06-09  344  }
a73ed35052ca85 Suneel Garapati      2015-06-09  345  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
