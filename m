Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2808C424646
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267701; cv=none; b=J8aEoczfBFm8u7odZso9Mv47pNZ/ak4L82QrqVnS3eVVnH2CYpNAgVqovEif5ZrUn1D30IHya0LdS5jbERLafOp5pS0glNKA5Y+KfjjIN6aGfOUSLWVrLAdiCorRGoUEFoCBSfqpJo//wAqdp/RSXTo3Rz/yWNEzeRHJR+L1+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267701; c=relaxed/simple;
	bh=zd5ndBaeODOFPOVuM9o63T682HVbMXiT/jxXfEZGAY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZXfDlSgRzuOfOHVic/QrAtkyDpfb/Yvr3C8H8zENkQZCfg2jqRFcSeM22QsO0jTmPHCU3c+56UTaki6SrLNpYavrNB1d4DzTsr+ubX/TohmpPDR2pJV+QJHtaRw1bikYTg7hqIkakPG4MECJWpFo5xRctl0ZovXHE+8a8eqgFNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FX3nj4fj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FX3nj4fj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790267699; x=1821803699;
  h=date:from:to:cc:subject:message-id;
  bh=zd5ndBaeODOFPOVuM9o63T682HVbMXiT/jxXfEZGAY4=;
  b=FX3nj4fjLKjQwnB2QIQtBiKDYtYAeb9aoWjwAfq/fB5TPRzg5wfL9VrF
   f11Q8v18QvgLYG5U1MpeOO0SteX1nxMNB0B8/wsuCbaLpM/Ihv+IfzO7r
   3G5YrU9sTp9kZdGREch/sXqTi6nZltUTX11jvQ6nJBGXBvgSSwRnxc6JC
   cq+qoSKsmGU48AmTMH2iPBvC9d7VX5DfPhx1L1sUpsFKG8Kta6ojhlxoz
   wiFecNkBAzWm4FnXzVO9A38a2zUeaf+VTl7lxpvBOpsLAPBb+tvVPxhie
   e0UPCmfnhOHpET8dOumdKVx0fJu01vq0l+IJJEiiOCgMCBfsIZ3zWyxyi
   A==;
X-CSE-ConnectionGUID: Xn5VvuZ9Qxm9bWO12fzZhg==
X-CSE-MsgGUID: knyChIPCSmuyiBNda2/Whg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108540256"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="108540256"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 09:34:46 -0700
X-CSE-ConnectionGUID: TbjkqP/xSSyZ8irXUaVcfg==
X-CSE-MsgGUID: n67DDYUEQd6xfg8I/Nm3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273293666"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2026 09:34:45 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mPC-000000000N6-3jjd;
	Thu, 24 Sep 2026 16:34:42 +0000
Date: Thu, 24 Sep 2026 18:34:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and
 shift to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202609241805.VsLzGPLn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-r2200-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241805.VsLzGPLn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241805.VsLzGPLn-lkp@intel.com/

smatch warnings:
drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
drivers/xen/privcmd.c:488 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * 8' '0-u32max * 8'
drivers/xen/privcmd.c:495 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * (4)' '0-u32max * 4'

vim +817 drivers/xen/gntdev.c

bdc612dc6903c4 Daniel De Graaf  2011-02-03  802  
a4cdb556cae05c David Vrabel     2014-12-02  803  static int gntdev_get_page(struct gntdev_copy_batch *batch, void __user *virt,
779055842da5b2 Souptick Joarder 2020-09-06  804  				unsigned long *gfn)
a4cdb556cae05c David Vrabel     2014-12-02  805  {
a4cdb556cae05c David Vrabel     2014-12-02  806  	unsigned long addr = (unsigned long)virt;
a4cdb556cae05c David Vrabel     2014-12-02  807  	struct page *page;
a4cdb556cae05c David Vrabel     2014-12-02  808  	unsigned long xen_pfn;
a4cdb556cae05c David Vrabel     2014-12-02  809  	int ret;
a4cdb556cae05c David Vrabel     2014-12-02  810  
d6bbc2ff68fd22 Souptick Joarder 2020-09-06  811  	ret = pin_user_pages_fast(addr, 1, batch->writeable ? FOLL_WRITE : 0, &page);
a4cdb556cae05c David Vrabel     2014-12-02  812  	if (ret < 0)
a4cdb556cae05c David Vrabel     2014-12-02  813  		return ret;
a4cdb556cae05c David Vrabel     2014-12-02  814  
a4cdb556cae05c David Vrabel     2014-12-02  815  	batch->pages[batch->nr_pages++] = page;
a4cdb556cae05c David Vrabel     2014-12-02  816  
a4cdb556cae05c David Vrabel     2014-12-02 @817  	xen_pfn = page_to_xen_pfn(page) + XEN_PFN_DOWN(addr & ~PAGE_MASK);
a4cdb556cae05c David Vrabel     2014-12-02  818  	*gfn = pfn_to_gfn(xen_pfn);
a4cdb556cae05c David Vrabel     2014-12-02  819  
a4cdb556cae05c David Vrabel     2014-12-02  820  	return 0;
a4cdb556cae05c David Vrabel     2014-12-02  821  }
a4cdb556cae05c David Vrabel     2014-12-02  822  

:::::: The code at line 817 was first introduced by commit
:::::: a4cdb556cae05cd3e7b602b3a44c01420c4e2258 xen/gntdev: add ioctl for grant copy

:::::: TO: David Vrabel <david.vrabel@citrix.com>
:::::: CC: David Vrabel <david.vrabel@citrix.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
