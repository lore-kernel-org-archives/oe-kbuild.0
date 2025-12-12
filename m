Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF493101CD
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571311; cv=none; b=JBTcV05PjpwliMTJFpYwsEAs4ipSFYyWnlUFWzoSXeemMxzaF8DfbSXjnj+ApvNpKjhVwNm8W1+liTX6BWKsz/GCXeEnDlY/N7VandntdXdd+OSZ0bpqm04Z+2l2WAKcIYTD+tZmoXJsB1hJlHeY72vqhNkW/PQijTlqwW/oA6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571311; c=relaxed/simple;
	bh=LmhXIPZVIznPPYoPg+rHw5o4hxLnXykqAnUz1IXbxHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RYd8ekKj4nBKTJoIHtr0/a+NbvHz5F+om/q+CT0OtcuDZkHFuRk+SOQVFnDmFWiCoRghnZbeKs2ZRCpOX+gOnZr9WOvFbuTXNxPiFIaukqOg15YDhWjdYGeYAhdM55yTRImaNXi5ZDyBtpS6VEpvRyVm+zSH0Y6IAd2t3ehvgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wq+D0j7I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wq+D0j7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571310; x=1797107310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LmhXIPZVIznPPYoPg+rHw5o4hxLnXykqAnUz1IXbxHo=;
  b=Wq+D0j7Ij7sukcaQ9f4QU9dpA7Tg8MPh0EOv8U5mRJAV7phcswmy9WB/
   b8KNUXIs7dcQDFYu8SR2wYMENUkcG2W/fpy0vNRpU2jgZACXwUtNdcyf3
   RvODiVMjy+59+ir6wrAtRqSbn4zhRQW8WQ1Kg0tE7hTolwwHKDIODtuH5
   qHa39uC0Ad1mHtNsrJ9CidRd5K+VecWKtOBgKhzN5sb77ipMql5MQcR4K
   O+R2HQYAy4n3MwuhYYSU0SIP8+1x52T/hCia2VLuTlm74YuRHEIIdrnV5
   WJnolKNqOwryKxLzmZOZcgyKhU4hN9sOZFo5uxPT5UW/8RJZAexYOD+wW
   w==;
X-CSE-ConnectionGUID: pPerTJ83SWq2S1dn3RXQeg==
X-CSE-MsgGUID: 1TfFKcbUR3e1SX5xB51i+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78284897"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78284897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:28:28 -0800
X-CSE-ConnectionGUID: vQ3MHnSpSMedzHjUjQzqaw==
X-CSE-MsgGUID: n3FjtiGXTzi18DrQHgpdXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196250290"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 12:28:27 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9kW-000000006ZZ-1VRD;
	Fri, 12 Dec 2025 20:28:24 +0000
Date: Sat, 13 Dec 2025 04:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/9] bitfield: Update sanity checks
Message-ID: <202512130436.cX0B0hF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/iommu/riscv/iommu.c:1596:13: sparse: sparse: trying to concatenate 15816-character string (8191 bytes max)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251209100313.2867-7-david.laight.linux@gmail.com>
References: <20251209100313.2867-7-david.laight.linux@gmail.com>
TO: david.laight.linux@gmail.com
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: linux-kernel@vger.kernel.org
TO: linux-usb@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
TO: Crt Mori <cmo@melexis.com>
TO: Richard Genoud <richard.genoud@bootlin.com>
TO: Andy Shevchenko <andriy.shevchenko@intel.com>
TO: Luo Jie <quic_luoj@quicinc.com>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Jakub Kicinski <kuba@kernel.org>
TO: netdev@vger.kernel.org
TO: "David S . Miller" <davem@davemloft.net>
TO: Simon Horman <simon.horman@netronome.com>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
TO: Andreas Noever <andreas.noever@gmail.com>
TO: Yehezkel Bernat <YehezkelShB@gmail.com>
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: David Laight <david.laight.linux@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20251212]
[cannot apply to westeri-thunderbolt/next v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251209-181248
base:   linus/master
patch link:    https://lore.kernel.org/r/20251209100313.2867-7-david.laight.linux%40gmail.com
patch subject: [PATCH 6/9] bitfield: Update sanity checks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-r113-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130436.cX0B0hF7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130436.cX0B0hF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512130436.cX0B0hF7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> drivers/iommu/riscv/iommu.c:1596:13: sparse: sparse: trying to concatenate 15816-character string (8191 bytes max)
   drivers/iommu/riscv/iommu.c:163:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/iommu/riscv/iommu.c:163:29: sparse:     expected void *base
   drivers/iommu/riscv/iommu.c:163:29: sparse:     got void [noderef] __iomem *
>> drivers/iommu/riscv/iommu.c:697:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long [usertype] *ddt_root @@     got void [noderef] __iomem * @@
   drivers/iommu/riscv/iommu.c:697:41: sparse:     expected unsigned long long [usertype] *ddt_root
   drivers/iommu/riscv/iommu.c:697:41: sparse:     got void [noderef] __iomem *

vim +1596 drivers/iommu/riscv/iommu.c

822e8bc68505820 Tomasz Jeznach 2024-10-15  1550  
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1551  static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1552  {
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1553  	u64 ddtp;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1554  
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1555  	/*
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1556  	 * Make sure the IOMMU is switched off or in pass-through mode during
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1557  	 * regular boot flow and disable translation when we boot into a kexec
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1558  	 * kernel and the previous kernel left them enabled.
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1559  	 */
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1560  	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1561  	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1562  		return -EBUSY;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1563  
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1564  	if (FIELD_GET(RISCV_IOMMU_DDTP_IOMMU_MODE, ddtp) >
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1565  	     RISCV_IOMMU_DDTP_IOMMU_MODE_BARE) {
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1566  		if (!is_kdump_kernel())
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1567  			return -EBUSY;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1568  		riscv_iommu_disable(iommu);
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1569  	}
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1570  
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1571  	/* Configure accesses to in-memory data structures for CPU-native byte order. */
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1572  	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) !=
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1573  	    !!(iommu->fctl & RISCV_IOMMU_FCTL_BE)) {
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1574  		if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_END))
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1575  			return -EINVAL;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1576  		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL,
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1577  				   iommu->fctl ^ RISCV_IOMMU_FCTL_BE);
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1578  		iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1579  		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) !=
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1580  		    !!(iommu->fctl & RISCV_IOMMU_FCTL_BE))
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1581  			return -EINVAL;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1582  	}
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1583  
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1584  	/*
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1585  	 * Distribute interrupt vectors, always use first vector for CIV.
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1586  	 * At least one interrupt is required. Read back and verify.
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1587  	 */
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1588  	if (!iommu->irqs_count)
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1589  		return -EINVAL;
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1590  
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1591  	iommu->icvec = FIELD_PREP(RISCV_IOMMU_ICVEC_FIV, 1 % iommu->irqs_count) |
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1592  		       FIELD_PREP(RISCV_IOMMU_ICVEC_PIV, 2 % iommu->irqs_count) |
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1593  		       FIELD_PREP(RISCV_IOMMU_ICVEC_PMIV, 3 % iommu->irqs_count);
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1594  	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_ICVEC, iommu->icvec);
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1595  	iommu->icvec = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_ICVEC);
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15 @1596  	if (max(max(FIELD_GET(RISCV_IOMMU_ICVEC_CIV, iommu->icvec),
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1597  		    FIELD_GET(RISCV_IOMMU_ICVEC_FIV, iommu->icvec)),
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1598  		max(FIELD_GET(RISCV_IOMMU_ICVEC_PIV, iommu->icvec),
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1599  		    FIELD_GET(RISCV_IOMMU_ICVEC_PMIV, iommu->icvec))) >= iommu->irqs_count)
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1600  		return -EINVAL;
856c0cfe5c5f6a2 Tomasz Jeznach 2024-10-15  1601  
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1602  	return 0;
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1603  }
5c0ebbd3c6c6e00 Tomasz Jeznach 2024-10-15  1604  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
