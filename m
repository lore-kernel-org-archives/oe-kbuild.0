Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AA1DA2E0
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jan 2025 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738081685; cv=none; b=gVBj6L4rhfx6dpTQpaS2WbSq10ux9TZVxLo0ljnbYe3T+TDE0wJOXj9IiV0+gR5bjRrilvt4RMa/ueSy5k74bbrHAbtEF5hcE8CtTZ8gY+OrqfqLPHKlK+Ybeyf7ag9AUjWrBFXJWWAXcQiYk3VhilLMlhYmK/LLutUo4pDzZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738081685; c=relaxed/simple;
	bh=Hugdoy9Ffpx4LYvWeL2KxAB2sCSOPz0sdc5KwMagPbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUEmmFpXpq9KEPOMBvkQbj7DdoKzitz3kgOMnMx9xb/tHNwBq7gA2DVyabsS/CkTnSeNpnmDZkczb6hoVN3KYQtsNiSM4IM0LMeu7TmzEd80dLbpH4l+haH3gHzzZTZuiQTKWEFsnXYcyUC05bNxwsDL0PsHIkJHMNbRKJ2h7qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ztis3uRq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ztis3uRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738081683; x=1769617683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hugdoy9Ffpx4LYvWeL2KxAB2sCSOPz0sdc5KwMagPbk=;
  b=Ztis3uRqE7VQf6w1NKl2qpvxtI/BiCB9uJAS47rbXSUy7iA3u1uw85JN
   kJ30oAck2lP7tw7mPammKrzWsIh3hvh8ZSSUoY+PwEtoNwnyyxT+VVaCn
   cjdjwFPqy/i3+v6/dd4WY+3NbOm7flq9AhiWC5vb0ZEiVPkV6vfAzgh5b
   PnBYPsySkzWfCzkR87SVXaMwimtOe0Ee005pN5zBBrqd2nXclDgMugjN/
   b3Q5s8DcZTF+8mo8TyIgSw8NMo49jvP7T2ON4FzLuwuSXlRWY/OdBrEJw
   wcQ0E3S7OKWhdmy19l0gLgq25m2KyJ2hqzVJFjd54HmvvETjde2rQ5mZP
   A==;
X-CSE-ConnectionGUID: YyBNOCDGSRm2zQ/PJINukQ==
X-CSE-MsgGUID: hC3CGgCtQVGEtjbDih+NLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37772378"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="37772378"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 08:28:02 -0800
X-CSE-ConnectionGUID: twyfTmPWSEGNFVKxEDFaEA==
X-CSE-MsgGUID: txs7EzYARF2L7xbfGNCR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="113779627"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2025 08:28:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcoRS-000hzT-22;
	Tue, 28 Jan 2025 16:27:58 +0000
Date: Wed, 29 Jan 2025 00:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/1] drm/xe/guc/capture: Maintenence of devcoredump
 <-> GuC-Err-Capture plumbing
Message-ID: <202501290007.5lUNHryZ-lkp@intel.com>
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
In-Reply-To: <20250121190935.1984508-2-alan.previn.teres.alexis@intel.com>
References: <20250121190935.1984508-2-alan.previn.teres.alexis@intel.com>
TO: Alan Previn <alan.previn.teres.alexis@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: dri-devel@lists.freedesktop.org
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: John Harrison <john.c.harrison@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Zhanjun Dong <zhanjun.dong@intel.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cfa9d40db8c30d894171010fe765d96e9bc6a47e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Previn/drm-xe-guc-capture-Maintenence-of-devcoredump-GuC-Err-Capture-plumbing/20250122-031221
base:   cfa9d40db8c30d894171010fe765d96e9bc6a47e
patch link:    https://lore.kernel.org/r/20250121190935.1984508-2-alan.previn.teres.alexis%40intel.com
patch subject: [PATCH v4 1/1] drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture plumbing
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-r071-20250126 (https://download.01.org/0day-ci/archive/20250129/202501290007.5lUNHryZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501290007.5lUNHryZ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_capture.c:1738 print_noderegs_by_list_order() error: uninitialized symbol 'last_value'.
drivers/gpu/drm/xe/xe_guc_capture.c:1877 xe_guc_capture_snapshot_get() error: we previously assumed 'q' could be null (see line 1866)

vim +/last_value +1738 drivers/gpu/drm/xe/xe_guc_capture.c

ecb6336463911d Zhanjun Dong  2024-10-04  1686  
ecb6336463911d Zhanjun Dong  2024-10-04  1687  static void
ce32e69d638af8 Alan Previn   2025-01-21  1688  print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
ce32e69d638af8 Alan Previn   2025-01-21  1689  			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
ecb6336463911d Zhanjun Dong  2024-10-04  1690  {
ce32e69d638af8 Alan Previn   2025-01-21  1691  	u32 last_value, i;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1692  	bool is_ext, low32_ready = false;
ecb6336463911d Zhanjun Dong  2024-10-04  1693  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1694  	if (!list || !list->list || list->num_regs == 0)
ecb6336463911d Zhanjun Dong  2024-10-04  1695  		return;
ecb6336463911d Zhanjun Dong  2024-10-04  1696  
ecb6336463911d Zhanjun Dong  2024-10-04  1697  	is_ext = list == guc->capture->extlists;
ecb6336463911d Zhanjun Dong  2024-10-04  1698  
ecb6336463911d Zhanjun Dong  2024-10-04  1699  	/*
ecb6336463911d Zhanjun Dong  2024-10-04  1700  	 * loop through descriptor first and find the register in the node
ecb6336463911d Zhanjun Dong  2024-10-04  1701  	 * this is more scalable for developer maintenance as it will ensure
ecb6336463911d Zhanjun Dong  2024-10-04  1702  	 * the printout matched the ordering of the static descriptor
ecb6336463911d Zhanjun Dong  2024-10-04  1703  	 * table-of-lists
ecb6336463911d Zhanjun Dong  2024-10-04  1704  	 */
ecb6336463911d Zhanjun Dong  2024-10-04  1705  	for (i = 0; i < list->num_regs; i++) {
ecb6336463911d Zhanjun Dong  2024-10-04  1706  		const struct __guc_mmio_reg_descr *reg_desc = &list->list[i];
ecb6336463911d Zhanjun Dong  2024-10-04  1707  		struct guc_mmio_reg *reg;
ecb6336463911d Zhanjun Dong  2024-10-04  1708  		u32 value;
ecb6336463911d Zhanjun Dong  2024-10-04  1709  
ecb6336463911d Zhanjun Dong  2024-10-04  1710  		reg = guc_capture_find_reg(reginfo, reg_desc->reg.addr, reg_desc->flags);
ecb6336463911d Zhanjun Dong  2024-10-04  1711  		if (!reg)
ecb6336463911d Zhanjun Dong  2024-10-04  1712  			continue;
ecb6336463911d Zhanjun Dong  2024-10-04  1713  
ecb6336463911d Zhanjun Dong  2024-10-04  1714  		value = reg->value;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1715  		switch (reg_desc->data_type) {
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1716  		case REG_64BIT_LOW_DW:
ecb6336463911d Zhanjun Dong  2024-10-04  1717  			last_value = value;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1718  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1719  			/*
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1720  			 * A 64 bit register define requires 2 consecutive
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1721  			 * entries in register list, with low dword first
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1722  			 * and hi dword the second, like:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1723  			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1724  			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW,  0, 0, "XXX_REG"},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1725  			 *
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1726  			 * Incorrect order will trigger XE_WARN.
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1727  			 *
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1728  			 * Possible double low here, for example:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1729  			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1730  			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1731  			 */
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1732  			XE_WARN_ON(low32_ready);
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1733  			low32_ready = true;
ecb6336463911d Zhanjun Dong  2024-10-04  1734  			/* Low 32 bit dword saved, continue for high 32 bit */
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1735  			break;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1736  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1737  		case REG_64BIT_HI_DW: {
ecb6336463911d Zhanjun Dong  2024-10-04 @1738  			u64 value_qw = ((u64)value << 32) | last_value;
ecb6336463911d Zhanjun Dong  2024-10-04  1739  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1740  			/*
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1741  			 * Incorrect 64bit register order. Possible missing low.
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1742  			 * for example:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1743  			 *  { XXX_REG(0), REG_32BIT, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1744  			 *  { XXX_REG_HI(0), REG_64BIT_HI_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1745  			 */
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1746  			XE_WARN_ON(!low32_ready);
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1747  			low32_ready = false;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1748  
ecb6336463911d Zhanjun Dong  2024-10-04  1749  			drm_printf(p, "\t%s: 0x%016llx\n", reg_desc->regname, value_qw);
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1750  			break;
ecb6336463911d Zhanjun Dong  2024-10-04  1751  		}
ecb6336463911d Zhanjun Dong  2024-10-04  1752  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1753  		case REG_32BIT:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1754  			/*
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1755  			 * Incorrect 64bit register order. Possible missing high.
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1756  			 * for example:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1757  			 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1758  			 *  { XXX_REG(0), REG_32BIT, 0, 0, "XXX_REG"},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1759  			 */
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1760  			XE_WARN_ON(low32_ready);
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1761  
ecb6336463911d Zhanjun Dong  2024-10-04  1762  			if (is_ext) {
ecb6336463911d Zhanjun Dong  2024-10-04  1763  				int dss, group, instance;
ecb6336463911d Zhanjun Dong  2024-10-04  1764  				group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
ecb6336463911d Zhanjun Dong  2024-10-04  1765  				instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
ce32e69d638af8 Alan Previn   2025-01-21  1766  				dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group,
ce32e69d638af8 Alan Previn   2025-01-21  1767  									instance);
ecb6336463911d Zhanjun Dong  2024-10-04  1768  				drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
ecb6336463911d Zhanjun Dong  2024-10-04  1769  			} else {
ecb6336463911d Zhanjun Dong  2024-10-04  1770  				drm_printf(p, "\t%s: 0x%08x\n", reg_desc->regname, value);
ecb6336463911d Zhanjun Dong  2024-10-04  1771  			}
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1772  			break;
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1773  		}
ecb6336463911d Zhanjun Dong  2024-10-04  1774  	}
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1775  
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1776  	/*
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1777  	 * Incorrect 64bit register order. Possible missing high.
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1778  	 * for example:
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1779  	 *  { XXX_REG_LO(0), REG_64BIT_LOW_DW, 0, 0, NULL},
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1780  	 *  } // <- Register list end
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1781  	 */
6f59fbcfa041e7 Zhanjun Dong  2024-11-26  1782  	XE_WARN_ON(low32_ready);
ecb6336463911d Zhanjun Dong  2024-10-04  1783  }
ecb6336463911d Zhanjun Dong  2024-10-04  1784  
ecb6336463911d Zhanjun Dong  2024-10-04  1785  /**
ce32e69d638af8 Alan Previn   2025-01-21  1786   * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
ce32e69d638af8 Alan Previn   2025-01-21  1787   * @guc : Target GuC for operation.
ce32e69d638af8 Alan Previn   2025-01-21  1788   * @node: GuC Error Capture register dump node.
ecb6336463911d Zhanjun Dong  2024-10-04  1789   * @p: drm_printer where it will be printed out.
ecb6336463911d Zhanjun Dong  2024-10-04  1790   *
ce32e69d638af8 Alan Previn   2025-01-21  1791   * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
ce32e69d638af8 Alan Previn   2025-01-21  1792   * earlier either by GuC-FW reporting or by manual capture depending on how the
ce32e69d638af8 Alan Previn   2025-01-21  1793   * caller (typically xe_hw_engine_snapshot) was invoked and used.
ecb6336463911d Zhanjun Dong  2024-10-04  1794   */
ce32e69d638af8 Alan Previn   2025-01-21  1795  
ce32e69d638af8 Alan Previn   2025-01-21  1796  void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
ce32e69d638af8 Alan Previn   2025-01-21  1797  				   struct drm_printer *p)
ecb6336463911d Zhanjun Dong  2024-10-04  1798  {
ecb6336463911d Zhanjun Dong  2024-10-04  1799  	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
ecb6336463911d Zhanjun Dong  2024-10-04  1800  		"full-capture",
ecb6336463911d Zhanjun Dong  2024-10-04  1801  		"partial-capture"
ecb6336463911d Zhanjun Dong  2024-10-04  1802  	};
ecb6336463911d Zhanjun Dong  2024-10-04  1803  	const struct __guc_mmio_reg_descr_group *list;
ecb6336463911d Zhanjun Dong  2024-10-04  1804  	struct xe_gt *gt;
ce32e69d638af8 Alan Previn   2025-01-21  1805  	int type;
ecb6336463911d Zhanjun Dong  2024-10-04  1806  
ce32e69d638af8 Alan Previn   2025-01-21  1807  	if (!guc)
ecb6336463911d Zhanjun Dong  2024-10-04  1808  		return;
ce32e69d638af8 Alan Previn   2025-01-21  1809  	gt = guc_to_gt(guc);
ce32e69d638af8 Alan Previn   2025-01-21  1810  	if (!node) {
ce32e69d638af8 Alan Previn   2025-01-21  1811  		xe_gt_warn(gt, "GuC Capture printing without node!\n");
ecb6336463911d Zhanjun Dong  2024-10-04  1812  		return;
ce32e69d638af8 Alan Previn   2025-01-21  1813  	}
ce32e69d638af8 Alan Previn   2025-01-21  1814  	if (!p) {
ce32e69d638af8 Alan Previn   2025-01-21  1815  		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
ce32e69d638af8 Alan Previn   2025-01-21  1816  		return;
ce32e69d638af8 Alan Previn   2025-01-21  1817  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1818  
ecb6336463911d Zhanjun Dong  2024-10-04  1819  	drm_printf(p, "\tCapture_source: %s\n",
ce32e69d638af8 Alan Previn   2025-01-21  1820  		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
223217b800c250 Zhanjun Dong  2024-11-07  1821  		   "GuC" : "Manual");
ce32e69d638af8 Alan Previn   2025-01-21  1822  	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
ecb6336463911d Zhanjun Dong  2024-10-04  1823  
ecb6336463911d Zhanjun Dong  2024-10-04  1824  	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
ecb6336463911d Zhanjun Dong  2024-10-04  1825  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
ce32e69d638af8 Alan Previn   2025-01-21  1826  							node->eng_class, false);
ce32e69d638af8 Alan Previn   2025-01-21  1827  		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
ecb6336463911d Zhanjun Dong  2024-10-04  1828  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1829  
ce32e69d638af8 Alan Previn   2025-01-21  1830  	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
ce32e69d638af8 Alan Previn   2025-01-21  1831  		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
ecb6336463911d Zhanjun Dong  2024-10-04  1832  		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
ce32e69d638af8 Alan Previn   2025-01-21  1833  							type, node->eng_class, true);
ce32e69d638af8 Alan Previn   2025-01-21  1834  		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
ecb6336463911d Zhanjun Dong  2024-10-04  1835  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1836  	drm_puts(p, "\n");
ecb6336463911d Zhanjun Dong  2024-10-04  1837  }
ecb6336463911d Zhanjun Dong  2024-10-04  1838  
ecb6336463911d Zhanjun Dong  2024-10-04  1839  /**
ce32e69d638af8 Alan Previn   2025-01-21  1840   * xe_guc_capture_snapshot_get - Matching GuC capture for the queue.
ce32e69d638af8 Alan Previn   2025-01-21  1841   *
ce32e69d638af8 Alan Previn   2025-01-21  1842   * @guc: The GuC being searched for a matching guc-error-capture snapshot.
ce32e69d638af8 Alan Previn   2025-01-21  1843   * @q: The exec queue object that provides engine, guc-id and lrca to match (can be NULL!)
ce32e69d638af8 Alan Previn   2025-01-21  1844   * @src: The source of the GuC-error-Capture snapshot to retrieve;
ecb6336463911d Zhanjun Dong  2024-10-04  1845   *
a54b0de7ed72ca Matthew Brost 2024-11-13  1846   * Search within the capture outlist for the queue, could be used for check if
a54b0de7ed72ca Matthew Brost 2024-11-13  1847   * GuC capture is ready for the queue.
ecb6336463911d Zhanjun Dong  2024-10-04  1848   * If found, the locked boolean of the node will be flagged.
ecb6336463911d Zhanjun Dong  2024-10-04  1849   *
ecb6336463911d Zhanjun Dong  2024-10-04  1850   * Returns: found guc-capture node ptr else NULL
ecb6336463911d Zhanjun Dong  2024-10-04  1851   */
ce32e69d638af8 Alan Previn   2025-01-21  1852  struct xe_guc_capture_snapshot *
ce32e69d638af8 Alan Previn   2025-01-21  1853  xe_guc_capture_snapshot_get(struct xe_guc *guc, struct xe_exec_queue *q,
ce32e69d638af8 Alan Previn   2025-01-21  1854  			    enum xe_guc_capture_snapshot_source src)
ecb6336463911d Zhanjun Dong  2024-10-04  1855  {
ecb6336463911d Zhanjun Dong  2024-10-04  1856  	struct xe_hw_engine *hwe;
ecb6336463911d Zhanjun Dong  2024-10-04  1857  	enum xe_hw_engine_id id;
ce32e69d638af8 Alan Previn   2025-01-21  1858  	struct xe_gt *gt;
ecb6336463911d Zhanjun Dong  2024-10-04  1859  	struct xe_device *xe;
ecb6336463911d Zhanjun Dong  2024-10-04  1860  	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
ecb6336463911d Zhanjun Dong  2024-10-04  1861  
ce32e69d638af8 Alan Previn   2025-01-21  1862  	if (!guc)
ecb6336463911d Zhanjun Dong  2024-10-04  1863  		return NULL;
ecb6336463911d Zhanjun Dong  2024-10-04  1864  
ce32e69d638af8 Alan Previn   2025-01-21  1865  	gt = guc_to_gt(guc);
ce32e69d638af8 Alan Previn   2025-01-21 @1866  	if (q && q->gt != gt) {
ce32e69d638af8 Alan Previn   2025-01-21  1867  		xe_gt_warn(gt, "Guc-Err-Capture being querried with incorrect queue's GT!");
ecb6336463911d Zhanjun Dong  2024-10-04  1868  		return NULL;
ce32e69d638af8 Alan Previn   2025-01-21  1869  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1870  
ce32e69d638af8 Alan Previn   2025-01-21  1871  	xe = gt_to_xe(gt);
ce32e69d638af8 Alan Previn   2025-01-21  1872  	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
ce32e69d638af8 Alan Previn   2025-01-21  1873  		return NULL;
ecb6336463911d Zhanjun Dong  2024-10-04  1874  
a54b0de7ed72ca Matthew Brost 2024-11-13  1875  	/* Find hwe for the queue */
ce32e69d638af8 Alan Previn   2025-01-21  1876  	for_each_hw_engine(hwe, gt, id) {
ecb6336463911d Zhanjun Dong  2024-10-04 @1877  		if (hwe != q->hwe)
ecb6336463911d Zhanjun Dong  2024-10-04  1878  			continue;
ecb6336463911d Zhanjun Dong  2024-10-04  1879  		guc_class = xe_engine_class_to_guc_class(hwe->class);
ecb6336463911d Zhanjun Dong  2024-10-04  1880  		break;
ecb6336463911d Zhanjun Dong  2024-10-04  1881  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1882  
ecb6336463911d Zhanjun Dong  2024-10-04  1883  	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
ce32e69d638af8 Alan Previn   2025-01-21  1884  		struct xe_guc_capture_snapshot *n, *ntmp;
ecb6336463911d Zhanjun Dong  2024-10-04  1885  		u16 guc_id = q->guc->id;
ecb6336463911d Zhanjun Dong  2024-10-04  1886  		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
ecb6336463911d Zhanjun Dong  2024-10-04  1887  
ecb6336463911d Zhanjun Dong  2024-10-04  1888  		/*
ecb6336463911d Zhanjun Dong  2024-10-04  1889  		 * Look for a matching GuC reported error capture node from
ecb6336463911d Zhanjun Dong  2024-10-04  1890  		 * the internal output link-list based on engine, guc id and
ecb6336463911d Zhanjun Dong  2024-10-04  1891  		 * lrca info.
ecb6336463911d Zhanjun Dong  2024-10-04  1892  		 */
ecb6336463911d Zhanjun Dong  2024-10-04  1893  		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
ecb6336463911d Zhanjun Dong  2024-10-04  1894  			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
ecb6336463911d Zhanjun Dong  2024-10-04  1895  			    n->guc_id == guc_id && n->lrca == lrca &&
ce32e69d638af8 Alan Previn   2025-01-21  1896  			    n->source == src) {
ce32e69d638af8 Alan Previn   2025-01-21  1897  				n->locked = true;
ecb6336463911d Zhanjun Dong  2024-10-04  1898  				return n;
ecb6336463911d Zhanjun Dong  2024-10-04  1899  			}
ecb6336463911d Zhanjun Dong  2024-10-04  1900  		}
ecb6336463911d Zhanjun Dong  2024-10-04  1901  	}
ecb6336463911d Zhanjun Dong  2024-10-04  1902  	return NULL;
ecb6336463911d Zhanjun Dong  2024-10-04  1903  }
ecb6336463911d Zhanjun Dong  2024-10-04  1904  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
