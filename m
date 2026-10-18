Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7547443C27
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309969; cv=none; b=HOdFGSP90E2ZkaqoldyWLSF5Mz/6cmXHtXq3er4+gu4pwPjlxvTMVivykt72haHvoAbMhuHcBSUBB4pCH23MjaAa+DJBsmcF0chZjI7TflLhHBnITnsjilxJoRPV/EtUUhWQXO1YBx3fZL36/g+ZDwyFa2AT5n71c5WcNxmBmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309969; c=relaxed/simple;
	bh=1X0bDetDaEB+b66lUu2q+O4s+9EK/VdMotzCkNs23g8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MdC7xXM0QaOZxT5bGBc23d5ndlH8VCwwqKjDCghgXVAJR5g9ZbfFSHHKJIy8OSl7US9LUMNjel8+AteyHAkmTiNDx/tRg0mtrUFe9nuLxSgn8pqKm33F9AX3Hs5/7uS+zhkIvWZ5sP/MFY1pJhKQ1lkv8KAddTmGYNpmw5qyrwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkbAe3C6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkbAe3C6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309968; x=1823845968;
  h=date:from:to:cc:subject:message-id;
  bh=1X0bDetDaEB+b66lUu2q+O4s+9EK/VdMotzCkNs23g8=;
  b=DkbAe3C6ZlECFP+H68ZWCF/wtioLTRr42SIb7MkeJJCv80o7jq6rMUIn
   FmbbXN3ACVxurQTimDJZconL1rd7uguniRLQHP9pc6z2CMQnLRe0zxMln
   XE1TmWT2waYgc41Ws5ZkVhS0czCw/cdjJXJ8UB68jNkRVKBkHJAGXkjkR
   71r3uF3qzYTAKrPaRkIBIFVJ2H6XoOOpQ4uu5U1wpyUkHL1ya/1I2ofyx
   8k+YtjTI1LhaPdJ0EOeV+lnWJHxLU09UvvlyuMsQyz4N3aUiwHdr3slij
   v6Bnz1ZREdzU4a3VGnGpB0lLN+tMcLJw8osPWfgaNluq1rDCY2BD6PIiJ
   g==;
X-CSE-ConnectionGUID: IQpi/TXlScmDueGLdeqAHg==
X-CSE-MsgGUID: vF52sbWUQbCUkqBEm+q3DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916692"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:39 -0700
X-CSE-ConnectionGUID: /h3BnR28SCuyOfV18Ua1nw==
X-CSE-MsgGUID: 5QDgXz9lS+u4uP29tQKOGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340817"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xl-1quS;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:48:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/edac/versalnet_edac.c:785 init_one_mc() error:
 buffer overflow 'priv->adec' 152 <= s32max
Message-ID: <202610171355.FpDCX5PE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
commit: 62a9fc50e8d947601ea3484e732b1a65a0a54b96 EDAC/versalnet: Refactor memory controller initialization and cleanup
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-r2202-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171355.FpDCX5PE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610171355.FpDCX5PE-lkp@intel.com/

smatch warnings:
drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer overflow 'priv->adec' 152 <= s32max

vim +785 drivers/edac/versalnet_edac.c

62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  774  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  775  static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  776  {
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  777  	u32 num_chans, rank, dwidth, config;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  778  	struct edac_mc_layer layers[2];
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  779  	struct mem_ctl_info *mci;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  780  	struct device *dev;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  781  	enum dev_type dt;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  782  	char *name;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  783  	int rc;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  784  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08 @785  	config = priv->adec[CONF + i * ADEC_NUM];
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  786  	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  787  	rank = 1 << FIELD_GET(MC5_RANK_MASK, config);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  788  	dwidth = FIELD_GET(MC5_BUS_WIDTH_MASK, config);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  789  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  790  	switch (dwidth) {
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  791  	case XDDR5_BUS_WIDTH_16:
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  792  		dt = DEV_X16;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  793  		break;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  794  	case XDDR5_BUS_WIDTH_32:
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  795  		dt = DEV_X32;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  796  		break;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  797  	case XDDR5_BUS_WIDTH_64:
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  798  		dt = DEV_X64;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  799  		break;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  800  	default:
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  801  		dt = DEV_UNKNOWN;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  802  	}
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  803  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  804  	if (dt == DEV_UNKNOWN)
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  805  		return 0;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  806  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  807  	/* Find the first enabled device and register that one. */
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  808  	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  809  	layers[0].size = rank;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  810  	layers[0].is_virt_csrow = true;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  811  	layers[1].type = EDAC_MC_LAYER_CHANNEL;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  812  	layers[1].size = num_chans;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  813  	layers[1].is_virt_csrow = false;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  814  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  815  	rc = -ENOMEM;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  816  	name = kzalloc(MC_NAME_LEN, GFP_KERNEL);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  817  	if (!name)
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  818  		return rc;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  819  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  820  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  821  	if (!dev)
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  822  		goto err_name_free;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  823  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  824  	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  825  	if (!mci) {
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  826  		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  827  		goto err_dev_free;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  828  	}
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  829  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  830  	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  831  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  832  	dev->init_name = name;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  833  	dev->release = versal_edac_release;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  834  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  835  	rc = device_register(dev);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  836  	if (rc)
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  837  		goto err_mc_free;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  838  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  839  	mci->pdev = dev;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  840  	mc_init(mci, dev);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  841  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  842  	rc = edac_mc_add_mc(mci);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  843  	if (rc) {
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  844  		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  845  		goto err_unreg;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  846  	}
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  847  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  848  	priv->mci[i] = mci;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  849  	priv->dwidth = dt;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  850  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  851  	platform_set_drvdata(pdev, priv);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  852  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  853  	return 0;
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  854  
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  855  err_unreg:
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  856  	device_unregister(mci->pdev);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  857  err_mc_free:
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  858  	edac_mc_free(mci);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  859  err_dev_free:
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  860  	kfree(dev);
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  861  err_name_free:
62a9fc50e8d9476 Shubhrajyoti Datta 2025-11-04  862  	kfree(name);
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  863  
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  864  	return rc;
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  865  }
d5fe2fec6c40dda Shubhrajyoti Datta 2025-09-08  866  

:::::: The code at line 785 was first introduced by commit
:::::: d5fe2fec6c40dda03df8cc9b4a97de0b7e39f984 EDAC: Add a driver for the AMD Versal NET DDR controller

:::::: TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
