Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1C91A0712
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777608289; cv=none; b=WhfXEWT4SAGK4bs5o0IYbX3Ov8OX99A1gxIBIBU8d1vSdKEIm1pTwdIkL1RGZVTF+sxHmmuWWDmIgqenfHlw2m1iU9WzWxAksYlXDfL7o5OhbzUXtGVZB9tBl4J3UGY/d/s/+oug69Ll1HsQVPe2I5S38QSsHzcUOEV9CLizJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777608289; c=relaxed/simple;
	bh=m/SEIricZXwZAaGiPsob59kPaq7TIiG8GTo1DLqkY5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iAXDmUuGzm1pvriumAcdk1sviDvKMEpX8r3VMqEV1Oo3ZEZ6AXk2OlxkaJ2jQeLBpTxpHFm0SWK5LJsK4uxxRZV8B3a5d0bkn1d9rx7aa5zNtSMIN0+hEA8TucYB+9+F1s2pj0NCNuX0Zo75VFbMSoM3nI/vos5BDndgYseipks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbhiJmsv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbhiJmsv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777608286; x=1809144286;
  h=date:from:to:cc:subject:message-id;
  bh=m/SEIricZXwZAaGiPsob59kPaq7TIiG8GTo1DLqkY5k=;
  b=UbhiJmsvOafrM+YiYro79Z2v1YW1yzSAoMSWzSuty6cQXw21bRL06+V+
   WQZeNABr6yI5ICBnDmHxV4dpfEbfr5MDnbxWXoSLg2PCkuh3DeqBSM0Vw
   vx6BZCtaUXqUcShK1ux1bKHtEGAq0HMLjQneSE20uzcqXtxT0AUjgiYf8
   430Jl5GXu7tuFSkB8na/QWZktszcm/3hZWgA1tuVxrE3G8TYb5D73KwOH
   EQOwIIwPrvg/GRtR86UJFxXbOFcAKwC0TS2mAH+tltbg5hAKE+x+rbdJH
   QptstN1gdvodn1x8+QyJCL8IXXYn5C++8btwsArv//0klLp3PIphnKKI9
   Q==;
X-CSE-ConnectionGUID: hJivMCb9RbuUOtKG5Fr3/A==
X-CSE-MsgGUID: yVyzRNiuSn+Wy/yhJDx6XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82428776"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82428776"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 21:04:45 -0700
X-CSE-ConnectionGUID: OqeKtIbsS6SnHSGFGtfa0Q==
X-CSE-MsgGUID: vIoLbJ2eRkOtfm3y3sn5fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="238748451"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 21:04:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIf7K-000000004y9-1k6k;
	Fri, 01 May 2026 04:04:42 +0000
Date: Fri, 01 May 2026 06:04:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:mlx5st 11/18] include/arm64/processor.h:194:9:
 warning: "dma_wmb" redefined
Message-ID: <202605010606.I5idaYNP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux mlx5st
head:   10504f47dd2777f27b6ce161435b5773b47d5172
commit: 451d6ff0d1cff6767726ec1875df9cdf81d782d0 [11/18] selftests: Add additional kernel functions to tools/include/
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260501/202605010606.I5idaYNP-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605010606.I5idaYNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605010606.I5idaYNP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from dirty_log_test.c:22:
>> include/arm64/processor.h:194:9: warning: "dma_wmb" redefined
     194 | #define dma_wmb()       dmb(oshst)
         |         ^~~~~~~
   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:8,
                    from dirty_log_test.c:17:
   tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:29:9: note: this is the location of the previous definition
      29 | #define dma_wmb()       asm volatile("dmb oshst" ::: "memory")
         |         ^~~~~~~
>> include/arm64/processor.h:197:9: warning: "dma_rmb" redefined
     197 | #define dma_rmb()       dmb(oshld)
         |         ^~~~~~~
   tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:28:9: note: this is the location of the previous definition
      28 | #define dma_rmb()       asm volatile("dmb oshld" ::: "memory")
         |         ^~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:8,
                    from include/arm64/gic_v5.h:6,
                    from arm64/no-vgic.c:12:
>> tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:28:9: warning: "dma_rmb" redefined
      28 | #define dma_rmb()       asm volatile("dmb oshld" ::: "memory")
         |         ^~~~~~~
   In file included from arm64/no-vgic.c:10:
   include/arm64/processor.h:197:9: note: this is the location of the previous definition
     197 | #define dma_rmb()       dmb(oshld)
         |         ^~~~~~~
>> tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:29:9: warning: "dma_wmb" redefined
      29 | #define dma_wmb()       asm volatile("dmb oshst" ::: "memory")
         |         ^~~~~~~
   include/arm64/processor.h:194:9: note: this is the location of the previous definition
     194 | #define dma_wmb()       dmb(oshst)
         |         ^~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
