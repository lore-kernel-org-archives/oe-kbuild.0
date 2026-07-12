Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0F1DED5B
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 06:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783836904; cv=none; b=XdubMR9AyWN56tJjCaqi3+KbuicFnW34orezG7jjew4C1tD9dde7fE2b/cpVo3+bkd1XdZU7QC5Ls1hWmErqqal14Vm+TGUaDZ6ucPZQnPgK9R/rBZwRlcdSSzqa/lecGeBYRrIowxnvZj27FNqb0STHGpaQ8GbTBg82EMZwmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783836904; c=relaxed/simple;
	bh=3TKMq79BEHGZu38Lawjh12LQN43W5FqkSJvHMlg4NPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AHiW3a0YbzGtMEcLACrZxD99kGrC/9h7ppiWHTXaMD7YWE0hj1KWW1ucEnG0OEYHR0wFYTADNwbtGwGHBxuOYvNGZRQX0s9oy/phK9CFKWnVYgAw41ZeE3DuliOergU0ETJu9RA/pz/1jzzW2VY3I3pbPv6zPWmzL1ZxhL1oN4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1fCtb0q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1fCtb0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783836900; x=1815372900;
  h=date:from:to:cc:subject:message-id;
  bh=3TKMq79BEHGZu38Lawjh12LQN43W5FqkSJvHMlg4NPQ=;
  b=U1fCtb0qXG5Yj6wvNcAA7G+YmHsBH7yPkCPC4nTY3xrW7wYDLwnCGPHk
   EpIW13GBNeqTSWg8ATrCV59K9kFcYJc6U3loti98Krspd+TlJGUyLjaIO
   GTRUiSQ6fJMXgCb2BLyhBoPM8ENmS+EgrlypR2S4a1ay/qPOJiIRa+N+u
   Polax9URjX01bIaGZY0Zs+9j9GBrIaYSvIv5eWW0lzkFt2X0EPmnG3RHi
   43Y032Gr3awpTn0G13fIaok2Kj3hr/QYD+TGkSXDDo0n12tiE3ADBhiHE
   6pYUUxnyna+eelSmjDAEpHRGZPyWTOT8KSpDXbwjVP57yqb74YWiAUND6
   g==;
X-CSE-ConnectionGUID: CUyDuBd4S1yonK11FPOS8Q==
X-CSE-MsgGUID: r5r9waJfSjCv1wq1e/Bisw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84599157"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84599157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 23:14:59 -0700
X-CSE-ConnectionGUID: HuM+biHJTz20S35iP75VXg==
X-CSE-MsgGUID: LE8R5XXRTnezO0hZ+5Uw8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259122808"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2026 23:14:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1winSp-00000000KkJ-3fF9;
	Sun, 12 Jul 2026 06:14:55 +0000
Date: Sun, 12 Jul 2026 14:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-nxp-xspi.c:783:25-26: WARNING opportunity
 for max()
Message-ID: <202607121428.xBcRYuef-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haibo Chen <haibo.chen@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd3210c47e8d3ac6b4e9141fc68acc03b38c0ba3
commit: 29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2 spi: add driver for NXP XSPI controller
date:   7 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 months ago
config: hexagon-randconfig-r051-20260709 (https://download.01.org/0day-ci/archive/20260712/202607121428.xBcRYuef-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 29c8c00d9f9d ("spi: add driver for NXP XSPI controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607121428.xBcRYuef-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-nxp-xspi.c:783:25-26: WARNING opportunity for max()

vim +783 drivers/spi/spi-nxp-xspi.c

29c8c00d9f9db5 Haibo Chen 2025-12-16  770  
29c8c00d9f9db5 Haibo Chen 2025-12-16  771  static int nxp_xspi_ahb_read(struct nxp_xspi *xspi, const struct spi_mem_op *op)
29c8c00d9f9db5 Haibo Chen 2025-12-16  772  {
29c8c00d9f9db5 Haibo Chen 2025-12-16  773  	u32 start = op->addr.val;
29c8c00d9f9db5 Haibo Chen 2025-12-16  774  	u32 len = op->data.nbytes;
29c8c00d9f9db5 Haibo Chen 2025-12-16  775  
29c8c00d9f9db5 Haibo Chen 2025-12-16  776  	/* If necessary, ioremap before AHB read */
29c8c00d9f9db5 Haibo Chen 2025-12-16  777  	if ((!xspi->ahb_addr) || start < xspi->memmap_start ||
29c8c00d9f9db5 Haibo Chen 2025-12-16  778  	     start + len > xspi->memmap_start + xspi->memmap_len) {
29c8c00d9f9db5 Haibo Chen 2025-12-16  779  		if (xspi->ahb_addr)
29c8c00d9f9db5 Haibo Chen 2025-12-16  780  			iounmap(xspi->ahb_addr);
29c8c00d9f9db5 Haibo Chen 2025-12-16  781  
29c8c00d9f9db5 Haibo Chen 2025-12-16  782  		xspi->memmap_start = start;
29c8c00d9f9db5 Haibo Chen 2025-12-16 @783  		xspi->memmap_len = len > NXP_XSPI_MIN_IOMAP ?
29c8c00d9f9db5 Haibo Chen 2025-12-16  784  				len : NXP_XSPI_MIN_IOMAP;
29c8c00d9f9db5 Haibo Chen 2025-12-16  785  
29c8c00d9f9db5 Haibo Chen 2025-12-16  786  		xspi->ahb_addr = ioremap(xspi->memmap_phy + xspi->memmap_start,
29c8c00d9f9db5 Haibo Chen 2025-12-16  787  					 xspi->memmap_len);
29c8c00d9f9db5 Haibo Chen 2025-12-16  788  
29c8c00d9f9db5 Haibo Chen 2025-12-16  789  		if (!xspi->ahb_addr) {
29c8c00d9f9db5 Haibo Chen 2025-12-16  790  			dev_err(xspi->dev, "failed to alloc memory\n");
29c8c00d9f9db5 Haibo Chen 2025-12-16  791  			return -ENOMEM;
29c8c00d9f9db5 Haibo Chen 2025-12-16  792  		}
29c8c00d9f9db5 Haibo Chen 2025-12-16  793  	}
29c8c00d9f9db5 Haibo Chen 2025-12-16  794  
29c8c00d9f9db5 Haibo Chen 2025-12-16  795  	/* Read out the data directly from the AHB buffer. */
29c8c00d9f9db5 Haibo Chen 2025-12-16  796  	memcpy_fromio(op->data.buf.in,
29c8c00d9f9db5 Haibo Chen 2025-12-16  797  			xspi->ahb_addr + start - xspi->memmap_start, len);
29c8c00d9f9db5 Haibo Chen 2025-12-16  798  
29c8c00d9f9db5 Haibo Chen 2025-12-16  799  	return 0;
29c8c00d9f9db5 Haibo Chen 2025-12-16  800  }
29c8c00d9f9db5 Haibo Chen 2025-12-16  801  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
