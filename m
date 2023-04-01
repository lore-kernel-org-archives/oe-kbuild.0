Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1362CA4
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680369937; x=1711905937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=03sITOYqBI+J211NQEMwaNzKpZ0I9FW4k2YevBHMM5k=;
  b=a2NdnUOTQWQ5YLyXDqhTsGqCtQwNggmn4Pa2l+fpcX0COMePYZMlHRI6
   c7kyqh0cpKnUdu9te9h36bTqPx17PTrpxqgnLNveR1dNTAW8dwVcOj9KD
   3JZGwaWjL6J10QXQtEegX+xdV6xUAY6214dGGN+4bPcC9Xdqo/d0fEx3g
   WkgyQ8XYlaqn/+jxhde75mSxO4IYzQNdQqLenQLNsDO1Cr/ZGrLn89eSq
   Lot8VuZ/AACeFqzTon/PaiY+CH7wdEtN4yEUzwKzdZE3fgt9AjA9y0S7W
   l4xwihCj6Y5n8+rlyObJFFKs7U9IPwLVKD1eEaBoA7m/DUkFBK2HQ4IXS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="427953442"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="427953442"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 10:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="688047726"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="688047726"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Apr 2023 10:25:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pieys-000MwP-2J;
	Sat, 01 Apr 2023 17:25:34 +0000
Date: Sun, 2 Apr 2023 01:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/atm/he.c:1523 he_start() warn: 'he_dev->membase' from
 ioremap() not released on lines: 1064.
Message-ID: <202304020120.Yr0LkMbH-lkp@intel.com>
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
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: f23eab0bfaefb3319c7de90c9c632bebf53a03bc arm64: mm: Convert to GENERIC_IOREMAP
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304020120.Yr0LkMbH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304020120.Yr0LkMbH-lkp@intel.com/

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
