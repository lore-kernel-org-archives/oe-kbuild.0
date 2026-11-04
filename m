Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771195;
	b=xyhvDgJJYdZMnmOJrbVmEaR5U0cQq4I46ReYeW//Wbr8Ea2ya9ip6ekE+SKnjhUPIdXG
	 YK6sAl53mxLl9eRiS6IyEYxLrI7NkBZY1GrKo7MOcxYGKMxeyQ6IdJ1VdlXWqQvsqS4C0
	 nxMiwQ3v/ZehwHztQ6Vl0cCHlYI1I8sHc81Ak98f9PF4HWG3oDC8y3igYuzC5IcPVcGi4
	 KAcH1J9/+uVqoxkIZWh6PgafFvCGs5zmN28PdE/XSM/ar++wBDY3HY27ulWEzxfR1wxrf
	 oo4r/VDdmsCfup/+cszrjK/BzBdFkWhVxzoBcc3vVH2BQWVfjprJiYBIJyqtT21lNVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771195;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=tWUVNvCHokhqrsX+v76zPcuA7FmNuLIyFV25I2iuCJI=;
	b=DmauS76orXMqJ1fwXG9m48uWnE5yC+BRHeb9XTPshfa16XYulx5r1WcQ1b1WT08RSNMF
	 1eLP0Ef4bYuKG2C7lfXtnKoUb0CpeMDn/6HBO8xi0rGktEulm0d5zQ5VvLZ0QdjgbPIvs
	 HIgrIQtiHzlKdPjynqrpPtCYpbrJjZ4TlgjHCVOFN2KVVzSHWM9ltstxehPD8Ov7RYxnt
	 qBd/k7QeBr/+Rgo015/sC6QZDE/xMo9KlR+AWX9Pz6vENYVqjAV3ZDORF7Kbn8H/gn0oA
	 7EtVDZrFfLOLDuKQzcumOZaF6rFYWvp5iCk1GONwy5kL/PIpYJrdqeeDkdWNAPKSp4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hPSujMUo;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85501606EE89
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 05:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85501606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hPSujMUo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793771194; x=1825307194;
  h=date:from:to:cc:subject:message-id;
  bh=iv+B+nIXMmdu+Ufno1cu5JqpXQI6dTSAj22H0GzNOig=;
  b=hPSujMUoRvB/8KQ7GURRPEbtaE48Yrc9nHj9eqk7fzgN+mGn+G576TjM
   8H2WAxNI2nDPyF8a5AHK3ebUtq1kY4veAtXHeGrgQr4vPAsp02qKsBRnm
   q4uJGQQ+X8MCD3V4ej08QkaQam3nzF4Dv7WddoySYsTiULqBRY4Mi4fWh
   ttePGFXwJ04jp11s8W88gyCFGNP/DdeiSc5vEzSrPlQLduxDo7YVbK0/c
   YfREtT2uUH0rIPGnt94FcMqMAVErYWJpRVCU5Jw9uD/HFRM/FH4RUAxFK
   uLHu8Z4IZn80x/3qwk3MIhiepjJSBBgnpYJEfXJ2Li2sixAGXQwapDSTG
   g==;
X-CSE-ConnectionGUID: D04k29h4Ro20IqRa1eZTBw==
X-CSE-MsgGUID: K+Q/Z/MdRda9HiBWXyT3BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403412"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:46:32 -0800
X-CSE-ConnectionGUID: HbLnK2nMQFSiw56u/6r2yQ==
X-CSE-MsgGUID: XioCKBdBSW+6iMxK0m6mUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6729641"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2026 21:46:31 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTpL-00000000jpv-24gx;
	Wed, 04 Nov 2026 05:46:27 +0000
Date: Wed, 04 Nov 2026 13:46:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/intel/dmar.c:674:16: error: implicit
 declaration of function 'tboot_get_dtpr_table'; did you mean
 'tboot_get_dmar_table'?
Message-ID: <202611041348.jZNj5SWh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20261030-153214/Michal-Camacho-Romero/x86-tboot-Add-support-for-parsing-DTPR-table-and-disabling-TPRs/20260603-134459, commit: 17315109fd77d68656fb4bcdc84963f5e15022d6"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Michal Camacho Romero <michal.camacho.romero@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20261030-153214/Michal-Camacho-Romero/x86-tboot-Add-support-for-parsing-DTPR-table-and-disabling-TPRs/20260603-134459
head:   17315109fd77d68656fb4bcdc84963f5e15022d6
commit: 17315109fd77d68656fb4bcdc84963f5e15022d6 iommu/vt-d: Disable PMRs and skip force-IOMMU when TXT TPRs are active
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261104/202611041348.jZNj5SWh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041348.jZNj5SWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611041348.jZNj5SWh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/dmar.c: In function 'parse_dmar_table':
>> drivers/iommu/intel/dmar.c:674:16: error: implicit declaration of function 'tboot_get_dtpr_table'; did you mean 'tboot_get_dmar_table'? [-Wimplicit-function-declaration]
     674 |         dtpr = tboot_get_dtpr_table(&txt_heap);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                tboot_get_dmar_table
>> drivers/iommu/intel/dmar.c:674:14: error: assignment to 'struct acpi_table_dtpr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     674 |         dtpr = tboot_get_dtpr_table(&txt_heap);
         |              ^
>> drivers/iommu/intel/dmar.c:679:17: error: implicit declaration of function 'tboot_parse_dtpr_table'; did you mean 'tboot_get_dmar_table'? [-Wimplicit-function-declaration]
     679 |                 tboot_parse_dtpr_table(dtpr);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 tboot_get_dmar_table
--
   drivers/iommu/intel/iommu.c: In function 'tboot_force_iommu':
>> drivers/iommu/intel/iommu.c:3804:13: error: implicit declaration of function 'tboot_is_tpr_enabled'; did you mean 'tboot_enabled'? [-Wimplicit-function-declaration]
    3804 |         if (tboot_is_tpr_enabled())
         |             ^~~~~~~~~~~~~~~~~~~~
         |             tboot_enabled


vim +674 drivers/iommu/intel/dmar.c

c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  629  
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  630  /**
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  631   * parse_dmar_table - parses the DMA reporting table
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  632   */
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  633  static int __init
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  634  parse_dmar_table(void)
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  635  {
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  636  	struct acpi_table_dmar *dmar;
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  637  	struct acpi_table_dtpr *dtpr;
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  638  	void                   *txt_heap;
7cef33471a35c6 drivers/iommu/dmar.c       Li, Zhen-Hua          2013-05-20  639  	int drhd_count = 0;
3f6db6591a2dec drivers/iommu/dmar.c       Andy Shevchenko       2017-03-16  640  	int ret;
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  641  	struct dmar_res_callback cb = {
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  642  		.print_entry = true,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  643  		.ignore_unhandled = true,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  644  		.arg[ACPI_DMAR_TYPE_HARDWARE_UNIT] = &drhd_count,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  645  		.cb[ACPI_DMAR_TYPE_HARDWARE_UNIT] = &dmar_parse_one_drhd,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  646  		.cb[ACPI_DMAR_TYPE_RESERVED_MEMORY] = &dmar_parse_one_rmrr,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  647  		.cb[ACPI_DMAR_TYPE_ROOT_ATS] = &dmar_parse_one_atsr,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  648  		.cb[ACPI_DMAR_TYPE_HARDWARE_AFFINITY] = &dmar_parse_one_rhsa,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  649  		.cb[ACPI_DMAR_TYPE_NAMESPACE] = &dmar_parse_one_andd,
31a75cbbb9274c drivers/iommu/intel/dmar.c Yian Chen             2021-02-04  650  		.cb[ACPI_DMAR_TYPE_SATC] = &dmar_parse_one_satc,
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  651  	};
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  652  
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  653  	/*
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  654  	 * Do it again, earlier dmar_tbl mapping could be mapped with
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  655  	 * fixed map.
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  656  	 */
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  657  	dmar_table_detect();
f6dd5c3106fb28 drivers/pci/dmar.c         Yinghai Lu            2008-09-03  658  
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  659  	/*
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  660  	 * ACPI tables may not be DMA protected by tboot, so use DMAR copy
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  661  	 * SINIT saved in SinitMleData in TXT heap (which is DMA protected)
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  662  	 */
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  663  	dmar_tbl = tboot_get_dmar_table(dmar_tbl);
a59b50e9954659 drivers/pci/dmar.c         Joseph Cihula         2009-06-30  664  
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  665  	dmar = (struct acpi_table_dmar *)dmar_tbl;
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  666  	if (!dmar)
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  667  		return -ENODEV;
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  668  
5b6985ce8ec712 drivers/pci/dmar.c         Fenghua Yu            2008-10-16  669  	if (dmar->width < PAGE_SHIFT - 1) {
e9071b0be5e7ce drivers/iommu/dmar.c       Donald Dutile         2012-06-08  670  		pr_warn("Invalid DMAR haw\n");
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  671  		return -EINVAL;
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  672  	}
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  673  
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03 @674  	dtpr = tboot_get_dtpr_table(&txt_heap);
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  675  	if (dtpr) {
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  676  		/* TPR is enabled
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  677  		 * This will also tell not to establish IOMMU PMRs
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  678  		 */
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03 @679  		tboot_parse_dtpr_table(dtpr);
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  680  		iounmap(txt_heap);
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  681  	}
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  682  
17315109fd77d6 drivers/iommu/intel/dmar.c Michal Camacho Romero 2026-06-03  683  	txt_heap = NULL;
e9071b0be5e7ce drivers/iommu/dmar.c       Donald Dutile         2012-06-08  684  	pr_info("Host address width %d\n", dmar->width + 1);
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  685  	ret = dmar_walk_dmar_table(dmar, &cb);
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  686  	if (ret == 0 && drhd_count == 0)
7cef33471a35c6 drivers/iommu/dmar.c       Li, Zhen-Hua          2013-05-20  687  		pr_warn(FW_BUG "No DRHD structure found in DMAR table\n");
c2a0b538d2c778 drivers/iommu/dmar.c       Jiang Liu             2014-11-09  688  
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  689  	return ret;
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  690  }
10e5247f40f3bf drivers/pci/dmar.c         Keshavamurthy, Anil S 2007-10-21  691  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
