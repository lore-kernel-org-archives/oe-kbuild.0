Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561747470
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Apr 2023 16:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680713552; x=1712249552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5oorQQUqGn37dFbppVGiv/Lp45L+nbZd0/0yM3yWFZg=;
  b=nc4k7qSFK24AGUdGzlQ0cNy4okEx5a8W8o0mtl5ncffGIC6votolFOgL
   81dlP4793VCnAACo07/UntfHF6EnEJSdD8yd2lHbnXLnPKyJxJ/H7zgwT
   6/A7+aMTgIMUz7YTJPMgT85lahOGvREGTf55ICrM1GCOSSHnOxDNZ093l
   sw8bVHClPQMkOy8HckNn84m/Ax4uMg17DQ3AfxY2CszmsjAc+wy3XvQC9
   lX/y/FtGFY/hO9VprlBRPt/0Km9h7BpPkosswrCldy1gG4n871Z9imYml
   QGBF/tVxtynOTogvOt41ZxmxRdllLxMk9E6Ei+yv+PXw2Fz81k8PmPYoc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344233799"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="344233799"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 09:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861040514"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="861040514"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 09:52:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk6Ms-000Qeo-2U;
	Wed, 05 Apr 2023 16:52:18 +0000
Date: Thu, 6 Apr 2023 00:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/atm/he.c:1523 he_start() warn: 'he_dev->membase' from
 ioremap() not released on lines: 1064.
Message-ID: <202304060008.asvpyddw-lkp@intel.com>
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
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: Will Deacon <will@kernel.org>
CC: Anshuman Khandual <anshuman.khandual@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   76f598ba7d8e2bfb4855b5298caedd5af0c374a8
commit: f23eab0bfaefb3319c7de90c9c632bebf53a03bc arm64: mm: Convert to GENERIC_IOREMAP
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230406/202304060008.asvpyddw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304060008.asvpyddw-lkp@intel.com/

New smatch warnings:
drivers/atm/he.c:1523 he_start() warn: 'he_dev->membase' from ioremap() not released on lines: 1064.
drivers/scsi/qla2xxx/qla_os.c:2088 qla2x00_iospace_config() warn: 'ha->iobase' from ioremap() not released on lines: 2088.
drivers/scsi/qla2xxx/qla_os.c:2181 qla83xx_iospace_config() warn: 'ha->iobase' from ioremap() not released on lines: 2181.
drivers/scsi/qla2xxx/qla_mr.c:805 qlafx00_iospace_config() warn: 'ha->cregbase' from ioremap() not released on lines: 805.
drivers/scsi/qla2xxx/qla_mr.c:805 qlafx00_iospace_config() warn: 'ha->iobase' from ioremap() not released on lines: 805.
drivers/scsi/qla4xxx/ql4_os.c:5563 qla4_8xxx_iospace_config() warn: 'ha->nx_pcibase' from ioremap() not released on lines: 5563.
drivers/scsi/qla4xxx/ql4_os.c:5630 qla4xxx_iospace_config() warn: 'ha->reg' from ioremap() not released on lines: 5630.

Old smatch warnings:
drivers/scsi/qla2xxx/qla_os.c:4164 qla2x00_mem_alloc() warn: missing unwind goto?
drivers/scsi/qla2xxx/qla_mr.c:1191 qlafx00_find_all_targets() warn: missing error code? 'rval'
drivers/scsi/qla4xxx/ql4_os.c:5630 qla4xxx_iospace_config() warn: 'ha->pdev' from pci_request_regions() not released on lines: 5630.
drivers/scsi/qla4xxx/ql4_os.c:6818 qla4xxx_build_st_list() warn: 'flash_index' 4294967295 can't fit into 65535 'st_ddb_idx->flash_ddb_idx'

vim +1523 drivers/atm/he.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  1483  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1484  	if (sdh) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  1485  		/* this really should be in suni.c but for now... */
^1da177e4c3f415 Linus Torvalds 2005-04-16  1486  		int val;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1487  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1488  		val = he_phy_get(he_dev->atm_dev, SUNI_TPOP_APM);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1489  		val = (val & ~SUNI_TPOP_APM_S) | (SUNI_TPOP_S_SDH << SUNI_TPOP_APM_S_SHIFT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1490  		he_phy_put(he_dev->atm_dev, val, SUNI_TPOP_APM);
65c3e4715b1b934 Chas Williams  2008-06-16  1491  		he_phy_put(he_dev->atm_dev, SUNI_TACP_IUCHP_CLP, SUNI_TACP_IUCHP);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1492  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  1493  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1494  	/* 5.1.12 enable transmit and receive */
^1da177e4c3f415 Linus Torvalds 2005-04-16  1495  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1496  	reg = he_readl_mbox(he_dev, CS_ERCTL0);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1497  	reg |= TX_ENABLE|ER_ENABLE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1498  	he_writel_mbox(he_dev, reg, CS_ERCTL0);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1499  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1500  	reg = he_readl(he_dev, RC_CONFIG);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1501  	reg |= RX_ENABLE;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1502  	he_writel(he_dev, reg, RC_CONFIG);
^1da177e4c3f415 Linus Torvalds 2005-04-16  1503  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1504  	for (i = 0; i < HE_NUM_CS_STPER; ++i) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  1505  		he_dev->cs_stper[i].inuse = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1506  		he_dev->cs_stper[i].pcr = -1;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1507  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  1508  	he_dev->total_bw = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1509  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1510  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1511  	/* atm linux initialization */
^1da177e4c3f415 Linus Torvalds 2005-04-16  1512  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1513  	he_dev->atm_dev->ci_range.vpi_bits = he_dev->vpibits;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1514  	he_dev->atm_dev->ci_range.vci_bits = he_dev->vcibits;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1515  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1516  	he_dev->irq_peak = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1517  	he_dev->rbrq_peak = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1518  	he_dev->rbpl_peak = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1519  	he_dev->tbrq_peak = 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1520  
^1da177e4c3f415 Linus Torvalds 2005-04-16  1521  	HPRINTK("hell bent for leather!\n");
^1da177e4c3f415 Linus Torvalds 2005-04-16  1522  
^1da177e4c3f415 Linus Torvalds 2005-04-16 @1523  	return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  1524  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  1525  

:::::: The code at line 1523 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
