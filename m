Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDC31CF7B8
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 20:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592595; cv=none; b=cbCmylCp0NGVc5MvS80m6Vbw/KRptVjwwjocJbhpntp9xKw4Ay9b/FIP85OKXT372Zct9CulPUS41emSXp5YSIaPXOm3uQNINTGRuPlwIvBtMX3ItsArz13nldgcA8KCnLD1vo+FXwXjP5kV9/NHpU6zbw/Ni8E4fW57LT0+dsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592595; c=relaxed/simple;
	bh=Z4XKlYg4ATa8+8wr/yYK29tcHsgTwM79uJwKwxaoK/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDdSbsw6dPzqm4+lPFr5ZCjQ1hIkl79X5l7x7eycMMEbEYuQ3TzrozD7cgKXPsEaSNuukmi/4NZO3ylsGazCGWiI93KOOSqNt07jOCE83i+WrvkO8MPv7ZcJPTmv2sbI4At5Yd6OKIiBRRfZ1wLOn5m882kY1ekGP+BWF/p+a8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3GF245z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3GF245z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728592594; x=1760128594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4XKlYg4ATa8+8wr/yYK29tcHsgTwM79uJwKwxaoK/s=;
  b=g3GF245z6LGWk3Sc8Azqu1NK5vY0+D9FZpE1tyLqrmKIMnfmQSh+1hF1
   K1jN7Cf55aVfEKnKry5zOVEbfg4jqYpjkQtWEc8TZh6eDr0PaZMsx2uIX
   +jMgfWckrE+YYtgQiCaCijLqdKL66Y/kDXVOhWzSiuBUEu+YBpjTT1GNs
   s4HikfqqRq9s/twnnkfrGLrQbmIp/P4Br+JOUOTKcVxWt6+4fl8Uh8Of5
   tJmnrJhtZuktz6pmn1g+akOkTHh4vL4gqwhBgWpC35KEvmHfB2qYRAfVS
   EtKl1bIbXF5WWdg2RTOOgK8kQ9kCdrveSaKL1rg232KYX1L5PxeUEt6Kj
   Q==;
X-CSE-ConnectionGUID: ukNyRH4JTG+yqecaww5sSw==
X-CSE-MsgGUID: 8hJP/Ej6T2Kw38+3Xv0zCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39373341"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39373341"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 13:36:34 -0700
X-CSE-ConnectionGUID: s0Bj63YfS8iGczZ9a8KiYQ==
X-CSE-MsgGUID: vd49aUXCQh2caDXFWWzBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81508577"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2024 13:36:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syztd-000BEo-1r;
	Thu, 10 Oct 2024 20:36:29 +0000
Date: Fri, 11 Oct 2024 04:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2845/3639]
 drivers/gpu/drm/xe/xe_guc_capture.c:1585 snapshot_print_by_list_order()
 error: uninitialized symbol 'last_value'.
Message-ID: <202410110412.tBV1pg0m-lkp@intel.com>
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
TO: Zhanjun Dong <zhanjun.dong@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: ecb6336463911d6eb684998754f8701d0f437f18 [2845/3639] drm/xe/guc: Plumb GuC-capture into dev coredump
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241010 (https://download.01.org/0day-ci/archive/20241011/202410110412.tBV1pg0m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410110412.tBV1pg0m-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_capture.c:1585 snapshot_print_by_list_order() error: uninitialized symbol 'last_value'.

vim +/last_value +1585 drivers/gpu/drm/xe/xe_guc_capture.c

ecb6336463911d Zhanjun Dong 2024-10-04  1543  
ecb6336463911d Zhanjun Dong 2024-10-04  1544  static void
ecb6336463911d Zhanjun Dong 2024-10-04  1545  snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
ecb6336463911d Zhanjun Dong 2024-10-04  1546  			     u32 type, const struct __guc_mmio_reg_descr_group *list)
ecb6336463911d Zhanjun Dong 2024-10-04  1547  {
ecb6336463911d Zhanjun Dong 2024-10-04  1548  	struct xe_gt *gt = snapshot->hwe->gt;
ecb6336463911d Zhanjun Dong 2024-10-04  1549  	struct xe_device *xe = gt_to_xe(gt);
ecb6336463911d Zhanjun Dong 2024-10-04  1550  	struct xe_guc *guc = &gt->uc.guc;
ecb6336463911d Zhanjun Dong 2024-10-04  1551  	struct xe_devcoredump *devcoredump = &xe->devcoredump;
ecb6336463911d Zhanjun Dong 2024-10-04  1552  	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
ecb6336463911d Zhanjun Dong 2024-10-04  1553  	struct gcap_reg_list_info *reginfo = NULL;
ecb6336463911d Zhanjun Dong 2024-10-04  1554  	u32 last_value, i;
ecb6336463911d Zhanjun Dong 2024-10-04  1555  	bool is_ext;
ecb6336463911d Zhanjun Dong 2024-10-04  1556  
ecb6336463911d Zhanjun Dong 2024-10-04  1557  	if (!list || list->num_regs == 0)
ecb6336463911d Zhanjun Dong 2024-10-04  1558  		return;
ecb6336463911d Zhanjun Dong 2024-10-04  1559  	XE_WARN_ON(!devcore_snapshot->matched_node);
ecb6336463911d Zhanjun Dong 2024-10-04  1560  
ecb6336463911d Zhanjun Dong 2024-10-04  1561  	is_ext = list == guc->capture->extlists;
ecb6336463911d Zhanjun Dong 2024-10-04  1562  	reginfo = &devcore_snapshot->matched_node->reginfo[type];
ecb6336463911d Zhanjun Dong 2024-10-04  1563  
ecb6336463911d Zhanjun Dong 2024-10-04  1564  	/*
ecb6336463911d Zhanjun Dong 2024-10-04  1565  	 * loop through descriptor first and find the register in the node
ecb6336463911d Zhanjun Dong 2024-10-04  1566  	 * this is more scalable for developer maintenance as it will ensure
ecb6336463911d Zhanjun Dong 2024-10-04  1567  	 * the printout matched the ordering of the static descriptor
ecb6336463911d Zhanjun Dong 2024-10-04  1568  	 * table-of-lists
ecb6336463911d Zhanjun Dong 2024-10-04  1569  	 */
ecb6336463911d Zhanjun Dong 2024-10-04  1570  	for (i = 0; i < list->num_regs; i++) {
ecb6336463911d Zhanjun Dong 2024-10-04  1571  		const struct __guc_mmio_reg_descr *reg_desc = &list->list[i];
ecb6336463911d Zhanjun Dong 2024-10-04  1572  		struct guc_mmio_reg *reg;
ecb6336463911d Zhanjun Dong 2024-10-04  1573  		u32 value;
ecb6336463911d Zhanjun Dong 2024-10-04  1574  
ecb6336463911d Zhanjun Dong 2024-10-04  1575  		reg = guc_capture_find_reg(reginfo, reg_desc->reg.addr, reg_desc->flags);
ecb6336463911d Zhanjun Dong 2024-10-04  1576  		if (!reg)
ecb6336463911d Zhanjun Dong 2024-10-04  1577  			continue;
ecb6336463911d Zhanjun Dong 2024-10-04  1578  
ecb6336463911d Zhanjun Dong 2024-10-04  1579  		value = reg->value;
ecb6336463911d Zhanjun Dong 2024-10-04  1580  		if (reg_desc->data_type == REG_64BIT_LOW_DW) {
ecb6336463911d Zhanjun Dong 2024-10-04  1581  			last_value = value;
ecb6336463911d Zhanjun Dong 2024-10-04  1582  			/* Low 32 bit dword saved, continue for high 32 bit */
ecb6336463911d Zhanjun Dong 2024-10-04  1583  			continue;
ecb6336463911d Zhanjun Dong 2024-10-04  1584  		} else if (reg_desc->data_type == REG_64BIT_HI_DW) {
ecb6336463911d Zhanjun Dong 2024-10-04 @1585  			u64 value_qw = ((u64)value << 32) | last_value;
ecb6336463911d Zhanjun Dong 2024-10-04  1586  
ecb6336463911d Zhanjun Dong 2024-10-04  1587  			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
ecb6336463911d Zhanjun Dong 2024-10-04  1588  			continue;
ecb6336463911d Zhanjun Dong 2024-10-04  1589  		}
ecb6336463911d Zhanjun Dong 2024-10-04  1590  
ecb6336463911d Zhanjun Dong 2024-10-04  1591  		if (is_ext) {
ecb6336463911d Zhanjun Dong 2024-10-04  1592  			int dss, group, instance;
ecb6336463911d Zhanjun Dong 2024-10-04  1593  
ecb6336463911d Zhanjun Dong 2024-10-04  1594  			group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
ecb6336463911d Zhanjun Dong 2024-10-04  1595  			instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
ecb6336463911d Zhanjun Dong 2024-10-04  1596  			dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
ecb6336463911d Zhanjun Dong 2024-10-04  1597  
ecb6336463911d Zhanjun Dong 2024-10-04  1598  			drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
ecb6336463911d Zhanjun Dong 2024-10-04  1599  		} else {
ecb6336463911d Zhanjun Dong 2024-10-04  1600  			drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
ecb6336463911d Zhanjun Dong 2024-10-04  1601  		}
ecb6336463911d Zhanjun Dong 2024-10-04  1602  	}
ecb6336463911d Zhanjun Dong 2024-10-04  1603  }
ecb6336463911d Zhanjun Dong 2024-10-04  1604  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
