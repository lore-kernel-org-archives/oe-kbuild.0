Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145972;
	b=PFwTkEt1gk3fpAn+7304GcoyYAmOPhtNLhJsmhyCpLBkfjrANN17JpYNC2+3huWYebxG
	 EihIS8ICFVbtNYo7DWPN5NkSEevh6EuZdwHYnYL0ptr8XjeQ6VEsSUf4N9zzROmfr5oQh
	 pIdOcPLLMyZXNtOUUTDZMyHAsC1h/Hd3Sg5S5hHggp9L/39dlqrTMgLwnPCdFMAB4qCa6
	 QbUyz184jakk4kqBcmdtWo8RMstd0wDrHtau8kvHwt+9DpcQdjzNtAfSqkgKUlMpVFV8R
	 4rP0x0c1dPMDjjvUwmmHwqxUxMZps4Dw/YyLsbDFxxdtR5vsOHW+JS5muQBmXcDDDmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145972;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3xA64slNT6dCoEJa3bEHcSO6mNUj7aHEpa7x+HBtWG8=;
	b=mRJRmgOR05FVsv9fyYNLzU3JLPteBaP/nUpFe8VxWO9oy8RiXNDG7fOdlTC4uNfoZiqg
	 sM5DJzSluWeN+L98VNWjpolxm7aSK4SaAYS9i6V2ie3HP8iM1FAoeEG7pbG5vBXiVew2K
	 3K88JkLZk66AigifHIaqOxI55Re3WP0Ghxi3S2lp92YaYVt0ZXw2dxPC1Rk6eqtgi2zgP
	 66bCqMtK4NjYAzVb2x0Z140r99FoAlYqauyV8FjnDqRBft10KZ7u31mMXWvXqvzt4t7cW
	 LYyd39nsdR/1pAvI5qLwlX/fAu1EMDOKq/N4hEriWhBCxBAzlTdc6Y3Ey2GnvafLTuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juR48qxe;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC42606A321
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 13:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC42606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=juR48qxe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794145970; x=1825681970;
  h=date:from:to:cc:subject:message-id;
  bh=1anrTNnucNHmmPyLZOEQ/d4ftbB6nV+/xMrssveuUYw=;
  b=juR48qxepe9qshm2sgPj58IeDIhOPychfwu86HtSZpnWHBmyysz5/y3U
   rptvWoYbMhJJBU19O5iDCVljVaoyS7qsQa7WO5daBIGpM17jfICMviown
   Wzs168INDJqNMFS8tKO+PyArRCFc6PeHsV4FnUqXZhXG6xzJTNOaiMd4l
   sm+t30SueXjIqvDwTXC01zgx2cpA9RPeFemnv1y07FtZRij7bxGUSjVJs
   50VAoUKRQ4jDc/SKof6pk9R9QRbmvm1ohaJjTXp5DvSLM8OwR32bl+Hr4
   3CDEZXBb8gKd87+falCa59BapK2dXQc2x3WwVwNOxarPNE89Kw03CPeD7
   Q==;
X-CSE-ConnectionGUID: ttwo0TaERue4SZCMUGiEmA==
X-CSE-MsgGUID: ENbaD/yETl6eIEHlimtpSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2894489"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2894489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 05:52:50 -0800
X-CSE-ConnectionGUID: nkU5mStjTly2M4SFGNqqNA==
X-CSE-MsgGUID: w4ZTUB2BQnyY8tEzhpZqBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="8232053"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2026 05:52:49 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ3K9-00000000BWj-3gDt;
	Sun, 08 Nov 2026 13:52:45 +0000
Date: Sun, 08 Nov 2026 14:52:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-nxp-xspi.c:783:25-26: WARNING opportunity
 for max()
Message-ID: <202611081449.rW2Hmcy5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haibo Chen <haibo.chen@nxp.com>
CC: Mark Brown <broonie@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fa4ad798f6f681031775266044ba1b0cf3c670bd
commit: 29c8c00d9f9db5fb659b6f05f9e8964afc13f3e2 spi: add driver for NXP XSPI controller
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: sh-randconfig-r2101-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081449.rW2Hmcy5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 29c8c00d9f9d ("spi: add driver for NXP XSPI controller")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611081449.rW2Hmcy5-lkp@intel.com/

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
