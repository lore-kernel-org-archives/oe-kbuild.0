Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F99520AF8B
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743549799; cv=none; b=OUWG8eN+Q/Mb5nz3u4LSaOobz5ihnBXihvEXtcP1rrA275PKpqXXdMX1zwQeOsWJexHsxBavARqkJx/aJlk0mneq2fc7OqnWZLAKzPe2Myk4Yrz++UhK62iVbKw6bDj6GPV/+LqTh9i5oxQ+FojbK8OxUVAeYeFDMe5eH/xc5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743549799; c=relaxed/simple;
	bh=GwL6AyKKe4R9THh5cg0vb+3MQdjftXbqKvqi0NXsoJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPbUqMloK2NAPBBOAN3N6LOsqy3qjEU6aUo3X4621gClkMZYDFY/YOewFTsIhEDT+R9hQvefBruFwZ5bBSzFR8oWn4b2hyzOKiuiM4s/BktpSME+VKqIdkgUaHK5Gfa+hBZQmZjAikK8hea3ebGw7YqmmotMXvlgQ6443fxUPKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UICLZB3K; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UICLZB3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743549797; x=1775085797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwL6AyKKe4R9THh5cg0vb+3MQdjftXbqKvqi0NXsoJI=;
  b=UICLZB3KjIrKnm3qZ8eSismP+DQ7VCJFFLS1UzzPKKuSywwWinXCB6su
   UjN/QWf/xvQtKlUu+D9HSPS+fA/5abG4qHzjO8rx5/WDyYG8Z3z+vg/xj
   b21onwYXOIlC0I4NSD0NYVU1/EOCqtKsPPyHNpk8X8w9HdkuLZEIpVNDy
   4k19GI9LV4u3Mye7N7QrkMHje/2+8rOJQdo2Iac77eQmDy8SQXuMFOc9M
   3180j2++mqLGQZOgsnEDMfYsHROfwYPWdvOY3WTqbnU8O5FlrcZfzf1Rq
   jxtuBEm0mKMu9SJUbmE/Z6LFw81hwSTXxJcNxvsZEhueGl0DuQxHTMQ/w
   Q==;
X-CSE-ConnectionGUID: 3wjX9tqSSGS6C8mzH1vBow==
X-CSE-MsgGUID: d1CuqHhES52dH8pWGgVp1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45040941"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="45040941"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 16:23:15 -0700
X-CSE-ConnectionGUID: GBupwDrsQS2Wte7SZ0Wsxg==
X-CSE-MsgGUID: NZzHYBWFT9CF56O/sCkPjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="131667328"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2025 16:23:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzkwp-000AFa-1b;
	Tue, 01 Apr 2025 23:23:11 +0000
Date: Wed, 2 Apr 2025 07:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/scsi/qla2xxx/qla_nx.c:1685 qla82xx_iospace_config() warn:
 'ha->nx_pcibase' from ioremap() not released on lines: 1685.
Message-ID: <202504020708.0wmHPIzm-lkp@intel.com>
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
TO: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Arnd Bergmann <arnd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   91e5bfe317d8f8471fbaa3e70cf66cae1314a516
commit: ddd268c42871b78c75e12a5c28207fb481138f41 um: Select HAS_IOREMAP for UML_IOMEM_EMULATION
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: um-randconfig-r072-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020708.0wmHPIzm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504020708.0wmHPIzm-lkp@intel.com/

smatch warnings:
drivers/scsi/qla2xxx/qla_nx.c:1685 qla82xx_iospace_config() warn: 'ha->nx_pcibase' from ioremap() not released on lines: 1685.
drivers/scsi/qla2xxx/qla_nx.c:1685 qla82xx_iospace_config() warn: 'ha->pdev' from pci_request_regions() not released on lines: 1685.

vim +1685 drivers/scsi/qla2xxx/qla_nx.c

a9083016a5314b3 Giridhar Malavali 2010-04-12  1615  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1616  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1617  int
a9083016a5314b3 Giridhar Malavali 2010-04-12  1618  qla82xx_iospace_config(struct qla_hw_data *ha)
a9083016a5314b3 Giridhar Malavali 2010-04-12  1619  {
a9083016a5314b3 Giridhar Malavali 2010-04-12  1620  	uint32_t len = 0;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1621  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1622  	if (pci_request_regions(ha->pdev, QLA2XXX_DRIVER_NAME)) {
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1623  		ql_log_pci(ql_log_fatal, ha->pdev, 0x000c,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1624  		    "Failed to reserver selected regions.\n");
a9083016a5314b3 Giridhar Malavali 2010-04-12  1625  		goto iospace_error_exit;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1626  	}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1627  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1628  	/* Use MMIO operations for all accesses. */
a9083016a5314b3 Giridhar Malavali 2010-04-12  1629  	if (!(pci_resource_flags(ha->pdev, 0) & IORESOURCE_MEM)) {
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1630  		ql_log_pci(ql_log_fatal, ha->pdev, 0x000d,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1631  		    "Region #0 not an MMIO resource, aborting.\n");
a9083016a5314b3 Giridhar Malavali 2010-04-12  1632  		goto iospace_error_exit;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1633  	}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1634  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1635  	len = pci_resource_len(ha->pdev, 0);
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1636  	ha->nx_pcibase = ioremap(pci_resource_start(ha->pdev, 0), len);
a9083016a5314b3 Giridhar Malavali 2010-04-12  1637  	if (!ha->nx_pcibase) {
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1638  		ql_log_pci(ql_log_fatal, ha->pdev, 0x000e,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1639  		    "Cannot remap pcibase MMIO, aborting.\n");
a9083016a5314b3 Giridhar Malavali 2010-04-12  1640  		goto iospace_error_exit;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1641  	}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1642  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1643  	/* Mapping of IO base pointer */
7ec0effd30bb4b1 Atul Deshmukh     2013-08-27  1644  	if (IS_QLA8044(ha)) {
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1645  		ha->iobase = ha->nx_pcibase;
7ec0effd30bb4b1 Atul Deshmukh     2013-08-27  1646  	} else if (IS_QLA82XX(ha)) {
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1647  		ha->iobase = ha->nx_pcibase + 0xbc000 + (ha->pdev->devfn << 11);
7ec0effd30bb4b1 Atul Deshmukh     2013-08-27  1648  	}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1649  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1650  	if (!ql2xdbwr) {
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1651  		ha->nxdb_wr_ptr = ioremap((pci_resource_start(ha->pdev, 4) +
a9083016a5314b3 Giridhar Malavali 2010-04-12  1652  		    (ha->pdev->devfn << 12)), 4);
a9083016a5314b3 Giridhar Malavali 2010-04-12  1653  		if (!ha->nxdb_wr_ptr) {
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1654  			ql_log_pci(ql_log_fatal, ha->pdev, 0x000f,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1655  			    "Cannot remap MMIO, aborting.\n");
a9083016a5314b3 Giridhar Malavali 2010-04-12  1656  			goto iospace_error_exit;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1657  		}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1658  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1659  		/* Mapping of IO base pointer,
a9083016a5314b3 Giridhar Malavali 2010-04-12  1660  		 * door bell read and write pointer
a9083016a5314b3 Giridhar Malavali 2010-04-12  1661  		 */
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1662  		ha->nxdb_rd_ptr = ha->nx_pcibase + (512 * 1024) +
a9083016a5314b3 Giridhar Malavali 2010-04-12  1663  		    (ha->pdev->devfn * 8);
a9083016a5314b3 Giridhar Malavali 2010-04-12  1664  	} else {
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1665  		ha->nxdb_wr_ptr = (void __iomem *)(ha->pdev->devfn == 6 ?
a9083016a5314b3 Giridhar Malavali 2010-04-12  1666  			QLA82XX_CAMRAM_DB1 :
a9083016a5314b3 Giridhar Malavali 2010-04-12  1667  			QLA82XX_CAMRAM_DB2);
a9083016a5314b3 Giridhar Malavali 2010-04-12  1668  	}
a9083016a5314b3 Giridhar Malavali 2010-04-12  1669  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1670  	ha->max_req_queues = ha->max_rsp_queues = 1;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1671  	ha->msix_count = ha->max_rsp_queues + 1;
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1672  	ql_dbg_pci(ql_dbg_multiq, ha->pdev, 0xc006,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1673  	    "nx_pci_base=%p iobase=%p "
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1674  	    "max_req_queues=%d msix_count=%d.\n",
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1675  	    ha->nx_pcibase, ha->iobase,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1676  	    ha->max_req_queues, ha->msix_count);
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1677  	ql_dbg_pci(ql_dbg_init, ha->pdev, 0x0010,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1678  	    "nx_pci_base=%p iobase=%p "
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1679  	    "max_req_queues=%d msix_count=%d.\n",
8dfa4b5a9b44714 Bart Van Assche   2015-07-09  1680  	    ha->nx_pcibase, ha->iobase,
7c3df1320e5e875 Saurav Kashyap    2011-07-14  1681  	    ha->max_req_queues, ha->msix_count);
a9083016a5314b3 Giridhar Malavali 2010-04-12  1682  	return 0;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1683  
a9083016a5314b3 Giridhar Malavali 2010-04-12  1684  iospace_error_exit:
a9083016a5314b3 Giridhar Malavali 2010-04-12 @1685  	return -ENOMEM;
a9083016a5314b3 Giridhar Malavali 2010-04-12  1686  }
a9083016a5314b3 Giridhar Malavali 2010-04-12  1687  

:::::: The code at line 1685 was first introduced by commit
:::::: a9083016a5314b3aeba6e0d2e814872e72168c08 [SCSI] qla2xxx: Add ISP82XX support.

:::::: TO: Giridhar Malavali <giridhar.malavali@qlogic.com>
:::::: CC: James Bottomley <James.Bottomley@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
