Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918237;
	b=Ubrgc43822gFObfM6Cex+qMlisbPw0FHP3eEFIdPa4GoR9MIP7Y1TNh42DV5gjTq+dyC
	 EkxpG7ZXbAfOO1MHyRc8NenSAwneY7sSiGF7qjSeoQxGp68ah38ZXu2NELzgWzjAtHXsA
	 cN8ttfhPp0N5WVuRMq1WvClfcWwGYBIYyRC4mSuUp9djHthiZzN6U1d4oVXbH2Om97Pir
	 VZCEKhT+BoDLh6myGX1H5n+3/oZLL2Pvzg12Aa1tEZjtLipLqv42BY8nYnAohP0N/aJZZ
	 BPSuSADF3GF+oSa4XWxbP6DkOnCUKeD4bhzoCvcbLOdBmyaJQE8P4bS3RAwKW8I26Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918237;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+QCw9W359V+FOpD681v6I+eHXZ9So0fxQrly5SXFhBc=;
	b=G5qmBxRnraxWtjAU1l3LU6ZFihrTXwqrfDn0k09Y28bJQQ6XFq3F5LIlM1Znrjv6v9q/
	 lESCTn6rGCLCIJApjoqphD6hYf1mzWGgDrr06HVtzPQAc8RVbD7BZXk+zK5o3DNObua0C
	 XoyuOMoo7hUu3CGyQ2/0hb88BK0BIu4oV26AeEybs4h+1eIwZImdqruL0Z8W5oYX2UOzK
	 DgQ3/y/gaConVhtmkn/y+T4RiA0g4VbZtFlJFQb0c3Vp8DjzPcQuOXQzjX42R4Vnmt5QP
	 +llHOGx7gKTrse3YZqA8DheNw+ErCUL7hc5NaQRAX+/yUwkyzAdaEzctvfrrTDbC1Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4ZdBZjP;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41122606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 12:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41122606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k4ZdBZjP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794918236; x=1826454236;
  h=date:from:to:cc:subject:message-id;
  bh=geE/W+G1bhcCsfYLn9o1rCvbakG7UPilmVupY59JnZQ=;
  b=k4ZdBZjPJIlRMVHBOz97auknnanjyjoFqVF+lAQhUuLjzFQHbcdlunI8
   61y1yRTGsyOEmKE81fQtFCXa3QHWWabWc8Nc+68LnE6ie5xMYD+HunVBT
   HxITJfFKAnNQtCo6vhfc5EEjJqQRd2cTiTf2l/HTW3njZo/HUJVLpIVQ3
   EZvM34eownrxZkQOF3I0hDEdj3niVVBoCJmkvYmx/17OLhKipiVtpM60+
   KnUX0wZ5w0eLw39rWeCbl9gLGpTHqYXU4HOWkZxpfn0Do2QcNKardh0p3
   9txQWDzUz0rmw9mGycFnF0VD8qfUFoz7uEWRtb1JFeOYwdom3l4HOD47j
   Q==;
X-CSE-ConnectionGUID: 9Eg7bQuESE+tyuGWUok82w==
X-CSE-MsgGUID: Z4uBrXhOT+iGyzcIT/PZkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3567862"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3567862"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 04:23:56 -0800
X-CSE-ConnectionGUID: UiR09w1GSwO51ulvKjxxuw==
X-CSE-MsgGUID: NvlYNbIJThWBu8LuxOmPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9730329"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 04:23:55 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTIE4-00000001BSt-1ZPm;
	Tue, 17 Nov 2026 12:23:52 +0000
Date: Tue, 17 Nov 2026 20:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/240-isp 95/96]
 drivers/media/platform/apple/msr/msr-hw.c:151:4: error: call to undeclared
 function 'readq_relaxed'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611172027.eMvhMLjh-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Sofus Forstreuter <sofus.c@icloud.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/240-isp
head:   41eeb3a08926fbe6037568be57148a360190fbe6
commit: c967c4f5b870c69ed8f3b064e2d53f9171ec93d4 [95/96] media: apple: add msr driver
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611172027.eMvhMLjh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a69be15ed58ed48738a69ec4c7d0f3e8c7dbe4ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611172027.eMvhMLjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611172027.eMvhMLjh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/platform/apple/msr/msr-hw.c:151:4: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                         readq_relaxed(base + reg + i * 8));
         |                         ^
>> drivers/media/platform/apple/msr/msr-hw.c:151:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     150 |                 msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
         |                                                    ~~~~~~
         |                                                    %12x
     151 |                         readq_relaxed(base + reg + i * 8));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:50: note: expanded from macro 'msr_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |                                                  ~~~    ^~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                                      ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |                             ~~~                   ^~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   drivers/media/platform/apple/msr/msr-hw.c:158:4: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     158 |                         readq_relaxed(base + reg + i * 8));
         |                         ^
   drivers/media/platform/apple/msr/msr-hw.c:158:4: warning: format specifies type 'unsigned long long' but the argument has type 'int' [-Wformat]
     157 |                 msr_dbg(2, ctx->msr, "%s[%d] meta: %12llx\n", FRM_STR(frm), i,
         |                                                    ~~~~~~
         |                                                    %12x
     158 |                         readq_relaxed(base + reg + i * 8));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/msr/msr.h:116:50: note: expanded from macro 'msr_dbg'
     116 |         v4l2_dbg(level, debug, &(msr)->v4l2_dev, fmt, ##args)
         |                                                  ~~~    ^~~~
   include/media/v4l2-common.h:74:42: note: expanded from macro 'v4l2_dbg'
      74 |                         v4l2_printk(KERN_DEBUG, dev, fmt , ## arg);     \
         |                                                      ~~~      ^~~
   include/media/v4l2-common.h:58:44: note: expanded from macro 'v4l2_printk'
      58 |         printk(level "%s: " fmt, (dev)->name , ## arg)
         |                             ~~~                   ^~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +/readq_relaxed +151 drivers/media/platform/apple/msr/msr-hw.c

c967c4f5b870c69 Sofus Forstreuter 2026-10-11  124  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  125  static void configure_fmt(struct msr_ctx *ctx, struct msr_vb_buffer *vb,
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  126  			  struct msr_frame *frm)
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  127  {
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  128  	const struct msr_fmt *fmt = frm->fmt;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  129  	void __iomem *base = ctx->msr->base;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  130  	size_t reg = 0;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  131  	int i;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  132  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  133  	reg = IS_SRC(frm) ? 0x180 : 0x280;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  134  	msr_writel(ctx, MSR_DMA_ALPHA(fmt->alpha) |
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  135  		   MSR_DMA_SUBSAMPLING(fmt->subsampling), reg);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  136  	msr_dbg(2, ctx->msr, "%s: %x\n", FRM_STR(frm),
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  137  		readl_relaxed(base + reg));
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  138  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  139  	for (i = 0; i < MSR_MAX_PLANES; i++) {
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  140  		msr_writel(ctx, MSR_DMA_STORAGE(fmt->storage[i]),
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  141  			   reg + 4 + (i * 4));
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  142  		msr_dbg(2, ctx->msr, "%s[%d]: %05x\n", FRM_STR(frm), i,
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  143  			readl_relaxed(base + reg + 4 + (i * 4)));
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  144  	}
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  145  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  146  	/* XXX: can src have 4 planes? */
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  147  	reg = IS_SRC(frm) ? 0x198 : 0x290;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  148  	for (i = 0; i < MSR_MAX_PLANES; i++) {
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  149  		msr_writeq(ctx, vb->dma_addrs[i], reg + i * 8);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  150  		msr_dbg(2, ctx->msr, "%s[%d] dma:  %12llx\n", FRM_STR(frm), i,
c967c4f5b870c69 Sofus Forstreuter 2026-10-11 @151  			readq_relaxed(base + reg + i * 8));
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  152  	}
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  153  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  154  	reg = IS_SRC(frm) ? 0x1b8 : 0x2a8;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  155  	for (i = 0; i < MSR_MAX_PLANES; i++) {
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  156  		msr_writeq(ctx, vb->dma_meta_addrs[i], reg + i * 8);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  157  		msr_dbg(2, ctx->msr, "%s[%d] meta: %12llx\n", FRM_STR(frm), i,
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  158  			readq_relaxed(base + reg + i * 8));
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  159  	}
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  160  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  161  	reg = IS_SRC(frm) ? 0x1d8 : 0x2c0;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  162  	for (i = 0; i < MSR_MAX_PLANES; i++)
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  163  		msr_writel(ctx, vb->stride[i], reg + i * 4);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  164  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  165  	/* offsets? */
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  166  	reg = IS_SRC(frm) ? 0x1e8 : 0x2cc;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  167  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  168  	/* component order, so hw can normalize */
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  169  	reg = IS_SRC(frm) ? 0x1f8 : 0x2d8;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  170  	msr_writel(ctx, MSR_FMT_COMP0(fmt->comp_order[0]) |
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  171  			MSR_FMT_COMP1(fmt->comp_order[1]) |
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  172  			MSR_FMT_COMP2(fmt->comp_order[2]) |
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  173  			MSR_FMT_COMP3(fmt->comp_order[3]), reg);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  174  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  175  	msr_writel(ctx, frm->pix.width, reg + 4);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  176  	msr_writel(ctx, frm->pix.height, reg + 8);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  177  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  178  	/* plane sizes */
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  179  	reg = IS_SRC(frm) ? 0x234 : 0x308;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  180  	msr_writel(ctx, frm->pix.width, reg);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  181  	msr_writel(ctx, frm->pix.width / frm->info->hdiv, reg + 4);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  182  	msr_writel(ctx, frm->pix.width, reg + 8);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  183  
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  184  	reg = IS_SRC(frm) ? 0x244 : 0x314;
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  185  	msr_writel(ctx, frm->pix.height, reg);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  186  	msr_writel(ctx, frm->pix.height / frm->info->vdiv, reg + 4);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  187  	msr_writel(ctx, frm->pix.height, reg + 8);
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  188  }
c967c4f5b870c69 Sofus Forstreuter 2026-10-11  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
