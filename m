Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0FC2F2
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 04:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727065955; cv=none; b=aicalQd6W3jk1FcXyVZ4RLh/2UyuRY5nS+DN1Jqy04w2ZaJ1vc/jgvDZkWWnQ/gETJhGIFozImGhDB3OGBq7kZRxInKFayMRexBFhPEnRYaVV/SC6hmhQ5Bw5Pg614BRkK/QGFS5NMcqxqfaaiH3k+l1xgJKGWMI3kYpSX+EEco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727065955; c=relaxed/simple;
	bh=SsHhncKCB5xbJo2ygY+82sPPsvsTvvs03AY2WeW1pzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srfjpShx1FoPXFbZHea0Qqqe4lfCsHG5Aed+aGEQccDREZYqV2dmB4FNgqu50oQBbesjeKXMYxRLLx1uhPH9lwVu141fEk7HzisABagBhSLdy+NKSEQ5UHB9MESWJa1qw9wxMCS89c9/49dlJ1mYz/19j8Y2MHldEhIxqV5zMOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FohnLrOw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FohnLrOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727065954; x=1758601954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsHhncKCB5xbJo2ygY+82sPPsvsTvvs03AY2WeW1pzA=;
  b=FohnLrOw2teLXT0JmfUhhM5gls6jg/fGTWoAqN7Yv1KsK+btJLCHfifK
   BdoDptWwnaGMRLafMnUNPJzc56TKUV3axZ27uqlvmRakUCge+m//ihvsz
   AaJSBcwonZN8aBluI9tfdOLqXxYXnFP2oa3gxY6GLV57ZCNqvZvPDu8eM
   vG/wGvIDKtMLrWihURAQFSutTGrgxAxXmttR6qQRMDTO3ny/OTpLtgc+6
   yGzYzDKDBrKDZiPHqsylDGj/JSzTd73PQoiYLmOJM8agZQc7M2Mk4raQE
   cszWen6Xftu61JDCbxjU1niQntpm3drr+cKGDhaTAcTa7yKweryrcfF4x
   Q==;
X-CSE-ConnectionGUID: b4mKv1mnRvKIV306urgq6w==
X-CSE-MsgGUID: n5Uof2XcR26cREOWX4hHvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26150023"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26150023"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 21:32:31 -0700
X-CSE-ConnectionGUID: lPWF8B2sRJyuohjgSSiVgw==
X-CSE-MsgGUID: LivEbeS0SoiPsfnxHzcUyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71088453"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Sep 2024 21:32:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssakN-000Gta-2N;
	Mon, 23 Sep 2024 04:32:27 +0000
Date: Mon, 23 Sep 2024 12:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kernel/ipl.c:1575 sys_dump_fcp_scp_data_store() warn:
 potential user controlled sizeof overflow '(636) + scpdata_len' '636 +
 0-u64max'
Message-ID: <202409231226.xa6ALAGk-lkp@intel.com>
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
TO: Alexander Egorenkov <egorenar@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 24bf80f78e5ad45bc3e0886cef86def712bdf3ed s390/ipl: Introduce sysfs attribute 'scp_data' for dump ipl
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240923/202409231226.xa6ALAGk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409231226.xa6ALAGk-lkp@intel.com/

New smatch warnings:
arch/s390/kernel/ipl.c:1575 sys_dump_fcp_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:1610 sys_dump_nvme_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:1645 sys_dump_eckd_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'

Old smatch warnings:
arch/s390/kernel/ipl.c:805 sys_reipl_fcp_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:929 sys_reipl_nvme_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:1028 sys_reipl_eckd_scp_data_store() warn: potential user controlled sizeof overflow '(636) + scpdata_len' '636 + 0-u64max'
arch/s390/kernel/ipl.c:1926 sys_vmcmd_on_reboot_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1927 sys_vmcmd_on_panic_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1928 sys_vmcmd_on_halt_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1929 sys_vmcmd_on_poff_store() warn: unsigned 'len' is never less than zero.
arch/s390/kernel/ipl.c:1930 sys_vmcmd_on_restart_store() warn: unsigned 'len' is never less than zero.

vim +1575 arch/s390/kernel/ipl.c

99ca4e582d4a40 Michael Holzheu     2008-01-26  1563  
eda4ddf7e3a224 Michael Holzheu     2013-06-21  1564  DEFINE_IPL_ATTR_RW(dump_fcp, wwpn, "0x%016llx\n", "%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  1565  		   dump_block_fcp->fcp.wwpn);
eda4ddf7e3a224 Michael Holzheu     2013-06-21  1566  DEFINE_IPL_ATTR_RW(dump_fcp, lun, "0x%016llx\n", "%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  1567  		   dump_block_fcp->fcp.lun);
99ca4e582d4a40 Michael Holzheu     2008-01-26  1568  DEFINE_IPL_ATTR_RW(dump_fcp, bootprog, "%lld\n", "%lld\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  1569  		   dump_block_fcp->fcp.bootprog);
99ca4e582d4a40 Michael Holzheu     2008-01-26  1570  DEFINE_IPL_ATTR_RW(dump_fcp, br_lba, "%lld\n", "%lld\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  1571  		   dump_block_fcp->fcp.br_lba);
99ca4e582d4a40 Michael Holzheu     2008-01-26  1572  DEFINE_IPL_ATTR_RW(dump_fcp, device, "0.0.%04llx\n", "0.0.%llx\n",
86c74d869d321b Martin Schwidefsky  2019-02-20  1573  		   dump_block_fcp->fcp.devno);
99ca4e582d4a40 Michael Holzheu     2008-01-26  1574  
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10 @1575  DEFINE_IPL_ATTR_SCP_DATA_RW(dump_fcp, dump_block_fcp->hdr,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1576  			    dump_block_fcp->fcp,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1577  			    IPL_BP_FCP_LEN, IPL_BP0_FCP_LEN,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1578  			    DIAG308_SCPDATA_SIZE);
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1579  
99ca4e582d4a40 Michael Holzheu     2008-01-26  1580  static struct attribute *dump_fcp_attrs[] = {
99ca4e582d4a40 Michael Holzheu     2008-01-26  1581  	&sys_dump_fcp_device_attr.attr,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1582  	&sys_dump_fcp_wwpn_attr.attr,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1583  	&sys_dump_fcp_lun_attr.attr,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1584  	&sys_dump_fcp_bootprog_attr.attr,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1585  	&sys_dump_fcp_br_lba_attr.attr,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1586  	NULL,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1587  };
99ca4e582d4a40 Michael Holzheu     2008-01-26  1588  
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1589  static struct bin_attribute *dump_fcp_bin_attrs[] = {
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1590  	&sys_dump_fcp_scp_data_attr,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1591  	NULL,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1592  };
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1593  
99ca4e582d4a40 Michael Holzheu     2008-01-26  1594  static struct attribute_group dump_fcp_attr_group = {
99ca4e582d4a40 Michael Holzheu     2008-01-26  1595  	.name  = IPL_FCP_STR,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1596  	.attrs = dump_fcp_attrs,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1597  	.bin_attrs = dump_fcp_bin_attrs,
99ca4e582d4a40 Michael Holzheu     2008-01-26  1598  };
99ca4e582d4a40 Michael Holzheu     2008-01-26  1599  
d70e38cb1deef3 Jason J. Herne      2020-03-17  1600  /* NVME dump device attributes */
d70e38cb1deef3 Jason J. Herne      2020-03-17  1601  DEFINE_IPL_ATTR_RW(dump_nvme, fid, "0x%08llx\n", "%llx\n",
d70e38cb1deef3 Jason J. Herne      2020-03-17  1602  		   dump_block_nvme->nvme.fid);
d70e38cb1deef3 Jason J. Herne      2020-03-17  1603  DEFINE_IPL_ATTR_RW(dump_nvme, nsid, "0x%08llx\n", "%llx\n",
d70e38cb1deef3 Jason J. Herne      2020-03-17  1604  		   dump_block_nvme->nvme.nsid);
d70e38cb1deef3 Jason J. Herne      2020-03-17  1605  DEFINE_IPL_ATTR_RW(dump_nvme, bootprog, "%lld\n", "%llx\n",
d70e38cb1deef3 Jason J. Herne      2020-03-17  1606  		   dump_block_nvme->nvme.bootprog);
d70e38cb1deef3 Jason J. Herne      2020-03-17  1607  DEFINE_IPL_ATTR_RW(dump_nvme, br_lba, "%lld\n", "%llx\n",
d70e38cb1deef3 Jason J. Herne      2020-03-17  1608  		   dump_block_nvme->nvme.br_lba);
d70e38cb1deef3 Jason J. Herne      2020-03-17  1609  
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10 @1610  DEFINE_IPL_ATTR_SCP_DATA_RW(dump_nvme, dump_block_nvme->hdr,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1611  			    dump_block_nvme->nvme,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1612  			    IPL_BP_NVME_LEN, IPL_BP0_NVME_LEN,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1613  			    DIAG308_SCPDATA_SIZE);
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1614  
d70e38cb1deef3 Jason J. Herne      2020-03-17  1615  static struct attribute *dump_nvme_attrs[] = {
d70e38cb1deef3 Jason J. Herne      2020-03-17  1616  	&sys_dump_nvme_fid_attr.attr,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1617  	&sys_dump_nvme_nsid_attr.attr,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1618  	&sys_dump_nvme_bootprog_attr.attr,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1619  	&sys_dump_nvme_br_lba_attr.attr,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1620  	NULL,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1621  };
d70e38cb1deef3 Jason J. Herne      2020-03-17  1622  
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1623  static struct bin_attribute *dump_nvme_bin_attrs[] = {
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1624  	&sys_dump_nvme_scp_data_attr,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1625  	NULL,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1626  };
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1627  
d70e38cb1deef3 Jason J. Herne      2020-03-17  1628  static struct attribute_group dump_nvme_attr_group = {
d70e38cb1deef3 Jason J. Herne      2020-03-17  1629  	.name  = IPL_NVME_STR,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1630  	.attrs = dump_nvme_attrs,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1631  	.bin_attrs = dump_nvme_bin_attrs,
d70e38cb1deef3 Jason J. Herne      2020-03-17  1632  };
d70e38cb1deef3 Jason J. Herne      2020-03-17  1633  
e2d2a2968f2abe Sven Schnelle       2022-10-05  1634  /* ECKD dump device attributes */
e2d2a2968f2abe Sven Schnelle       2022-10-05  1635  DEFINE_IPL_CCW_ATTR_RW(dump_eckd, device, dump_block_eckd->eckd);
e2d2a2968f2abe Sven Schnelle       2022-10-05  1636  DEFINE_IPL_ATTR_RW(dump_eckd, bootprog, "%lld\n", "%llx\n",
e2d2a2968f2abe Sven Schnelle       2022-10-05  1637  		   dump_block_eckd->eckd.bootprog);
e2d2a2968f2abe Sven Schnelle       2022-10-05  1638  
e2d2a2968f2abe Sven Schnelle       2022-10-05  1639  IPL_ATTR_BR_CHR_SHOW_FN(dump, dump_block_eckd->eckd);
e2d2a2968f2abe Sven Schnelle       2022-10-05  1640  IPL_ATTR_BR_CHR_STORE_FN(dump, dump_block_eckd->eckd);
e2d2a2968f2abe Sven Schnelle       2022-10-05  1641  
e2d2a2968f2abe Sven Schnelle       2022-10-05  1642  static struct kobj_attribute sys_dump_eckd_br_chr_attr =
a70f72767fa17d Sven Schnelle       2022-12-01  1643  	__ATTR(br_chr, 0644, eckd_dump_br_chr_show, eckd_dump_br_chr_store);
e2d2a2968f2abe Sven Schnelle       2022-10-05  1644  
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10 @1645  DEFINE_IPL_ATTR_SCP_DATA_RW(dump_eckd, dump_block_eckd->hdr,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1646  			    dump_block_eckd->eckd,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1647  			    IPL_BP_ECKD_LEN, IPL_BP0_ECKD_LEN,
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1648  			    DIAG308_SCPDATA_SIZE);
24bf80f78e5ad4 Alexander Egorenkov 2024-05-10  1649  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
