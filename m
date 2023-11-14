Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11152FC2D
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 23:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi1yX4MI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700004916; x=1731540916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CZxpUbNZTeBYKpUbC5hc7PAwXukO/4LMsXTrnanCh5k=;
  b=Bi1yX4MIQrkyjNQ70p0mLnT3SJFgxSwjrqsIp2Y5sib9sO1QYCFKlO07
   92z8ebhYUIHEk6cX+mz5oIlulAEP9jLm2rlYyA2vHjSKB8nvNQx79qkA0
   HEBFIJ1cH01i6IGVntkxS+Ry1CSTYGd5Pmw1MbH8CukiV4/VNscPdH94Z
   VPUkIbzUwxI3FLdc6/hMcJE5SC14Tq1ft/fU/fPVkWOamO5DceYNWRJ/K
   3kNK5jExi8OCW7l8zmTNDHSX3/2wLA+HRwbl2xSktzJBswN8kpYSEhwos
   wYlCD1PDDZX4UfC1L+frf1afd2VvJTRW8Cp8j562SG+mUBbLX1Q4iY5fU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457265964"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="457265964"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 15:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888403044"
X-IronPort-AV: E=Sophos;i="6.03,303,1694761200"; 
   d="scan'208";a="888403044"
Received: from lkp-server02.sh.intel.com (HELO 83346ef18697) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Nov 2023 15:35:15 -0800
Received: from kbuild by 83346ef18697 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r32w5-0000nE-19;
	Tue, 14 Nov 2023 23:35:13 +0000
Date: Wed, 15 Nov 2023 07:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202311150710.PphxDBhJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "has kconfig file changed"
:::::: Manual check reason: "has Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sui Jingfeng <suijingfeng@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: f39db26c54281da6a785259498ca74b5e470476f drm: Add kms driver for loongson display controller
date:   4 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231115/202311150710.PphxDBhJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311150710.PphxDBhJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311150710.PphxDBhJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *d @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     expected void volatile [noderef] __iomem *d
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     got void *kptr
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *s @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     expected void const volatile [noderef] __iomem *s
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     got void *kptr

vim +27 drivers/gpu/drm/loongson/lsdc_benchmark.c

f39db26c54281d Sui Jingfeng 2023-06-15  12  
f39db26c54281d Sui Jingfeng 2023-06-15  13  typedef void (*lsdc_copy_proc_t)(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  14  				 struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  15  				 unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  16  				 int n);
f39db26c54281d Sui Jingfeng 2023-06-15  17  
f39db26c54281d Sui Jingfeng 2023-06-15  18  static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  19  				      struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  20  				      unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  21  				      int n)
f39db26c54281d Sui Jingfeng 2023-06-15  22  {
f39db26c54281d Sui Jingfeng 2023-06-15  23  	lsdc_bo_kmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  24  	lsdc_bo_kmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  25  
f39db26c54281d Sui Jingfeng 2023-06-15  26  	while (n--)
f39db26c54281d Sui Jingfeng 2023-06-15 @27  		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
f39db26c54281d Sui Jingfeng 2023-06-15  28  
f39db26c54281d Sui Jingfeng 2023-06-15  29  	lsdc_bo_kunmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  30  	lsdc_bo_kunmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  31  }
f39db26c54281d Sui Jingfeng 2023-06-15  32  
f39db26c54281d Sui Jingfeng 2023-06-15  33  static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  34  				      struct lsdc_bo *dst_bo,
f39db26c54281d Sui Jingfeng 2023-06-15  35  				      unsigned int size,
f39db26c54281d Sui Jingfeng 2023-06-15  36  				      int n)
f39db26c54281d Sui Jingfeng 2023-06-15  37  {
f39db26c54281d Sui Jingfeng 2023-06-15  38  	lsdc_bo_kmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  39  	lsdc_bo_kmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  40  
f39db26c54281d Sui Jingfeng 2023-06-15  41  	while (n--)
f39db26c54281d Sui Jingfeng 2023-06-15 @42  		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
f39db26c54281d Sui Jingfeng 2023-06-15  43  
f39db26c54281d Sui Jingfeng 2023-06-15  44  	lsdc_bo_kunmap(src_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  45  	lsdc_bo_kunmap(dst_bo);
f39db26c54281d Sui Jingfeng 2023-06-15  46  }
f39db26c54281d Sui Jingfeng 2023-06-15  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
