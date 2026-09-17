Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157D1539769
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664569; cv=none; b=eRiBEjd+QWhKfxcmoqU9KuMo9GXHFIqYcB5pu2hlnna67imlfITWb/Wjble+0kxRSvbzFy7gJYIFZeZMSDEb1BK+iLGNqSlhbp9kYWrLzl9hb3Wp4X+nGC0x1hHBU22hTxl0sVT7I0SbgjfNDFMTNaPeViJtBc/gfKZUefN8KEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664569; c=relaxed/simple;
	bh=lbdp/tO+kDl74WW5fPV5Yr7LnMApThhZej27kDIr23A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WkQJz3YlUZsw/arMD3Hte1ykJCvXBIcmE9hSB2GI/B+Kzb1W8083qD6cLb883EZ53vmai5RhncglEeTu3+mrAvhlVdXDAnA+VtcQIsy867C+I2Pj4ldaOXSLIH9Ku0k5HaBHbdqJml8dttPdRih3/WfRKtAQMP7XuurCGX6jawM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx5HOw7K; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx5HOw7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789664568; x=1821200568;
  h=date:from:to:cc:subject:message-id;
  bh=lbdp/tO+kDl74WW5fPV5Yr7LnMApThhZej27kDIr23A=;
  b=mx5HOw7KETBdhe0wItgAcaYB8fy7EoQZwgx90y9HfvEr945RcW4pFbFO
   BtcWdbWZHUUi4ILKGlFCuxSP+gAyEcPaH+K2fOGkNlZnKT2bqV2nAq0v2
   q6b4aTck+iZ+Xssb2jXFWIuZK97NaBthJ1q4O7bed30VBtFZg1wvv8OZ5
   w7/+YgSZSvHMnu1wQt9oMcoZEKUxC4e6q21uxlJpyWhYNKXeOFwkvE7vI
   lWVcZKpDDCCkKkL8FV/EngVlqPvkdIuSqKx0JKA4e7o2hcPSfYrEn74ZJ
   9je1fC9Ou1hsCtEu871rETioOTnBxtNXHIBkoFwAbj2FvqKNtpBxQ12Xs
   g==;
X-CSE-ConnectionGUID: ZWxwzj2WQwKKPw6xJGkmLA==
X-CSE-MsgGUID: lR86cYMTTI+f9TpWQiWSVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="617922"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="617922"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:02:47 -0700
X-CSE-ConnectionGUID: SZee5nbMRJCfbYOeIiiMPg==
X-CSE-MsgGUID: 1pza5IOyQlOOPYobWjmfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297400204"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2026 10:02:45 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7FVT-000000000hL-02LI;
	Thu, 17 Sep 2026 17:02:43 +0000
Date: Thu, 17 Sep 2026 19:01:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jgunthorpe:mlx5st 5/11] include/arm64/processor.h:194:9:
 warning: "dma_wmb" redefined
Message-ID: <202609171844.Jd38gQPv-lkp@intel.com>
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
CC: David Matlack <dmatlack@google.com>

tree:   https://github.com/jgunthorpe/linux mlx5st
head:   f7ab66f9ba0846c425096e6d13eafb3784c6b1c8
commit: 8cc7121f791f18e5c8c95d47d45795548243d24f [5/11] selftests: Add additional kernel functions to tools/include/
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260917/202609171844.Jd38gQPv-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171844.Jd38gQPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609171844.Jd38gQPv-lkp@intel.com/

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
