Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB191898FB
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jul 2026 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260868; cv=none; b=CQSNn9pwHY0ANQKlGSNu3HdTcDFf0fCdDXiiHx1C+RBtfFNdXS1+6+9L1QGA1JLmQVB9085nyDGY45jIpRTXMdxgXsYaaW3iq7DYWto1H0vjuvRru1jnXBsmK8g1yweGnXHsXfXp0Z6halaMIUTxTG8tSBbF9moK8Sh7L0I2NZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260868; c=relaxed/simple;
	bh=wk5qzUDB+bM76+v37teCuoJEdFEFttAqNBh3+nPLPWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aDT8Kz3u55LdCaAKfn+3FCw9ruHPKamQ5rox3jOxRtlVZ+WK7hN6vgSP+cziC6Qp2vhGopk/oY1FX/OeZyw6uTsvb955VFfGoedT+NuXb/Q1eI/Igi/FzrAN4x5737u9QAFEde/C/bzIvh7v/WRMKS0qsrIX/2qMrhfYHvN+VjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWiMOGuq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWiMOGuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784260867; x=1815796867;
  h=date:from:to:cc:subject:message-id;
  bh=wk5qzUDB+bM76+v37teCuoJEdFEFttAqNBh3+nPLPWg=;
  b=YWiMOGuq+Yb5DnJagnRsDuV2gjQcLlX7Sof8869J5N0ezeC+PfSeccFz
   bVE/5kK2qOPK/3ZIXgzyNLXoSL54MEYXsPvmlvrDSNdkHuziSeudBV8O0
   DS+yFcK46oxUtSz0+mOciXbQDlSSIiqbQjgertGOl76gLKL247x/pnYcq
   4pgSpW8IUT8OgoEDK0afSkF69xvGB2VjNxZI+05rr8BJx+lX7EAo5lQNx
   BNDJ+aAbInfQZM8gHjaAVfuMbyi/KlxrY9Z2wghVilVAN5cfZE/X81UGD
   4ugB/qlxYRUEREIzSRZHFOXv3GWbO61ZWIc8TwbP1MpvrjATDU0Zh+qUO
   w==;
X-CSE-ConnectionGUID: OBqn9dioStm3j3W/L+EVzQ==
X-CSE-MsgGUID: y+AK/xseTcqq5mJgqyEAVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102354082"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="102354082"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 21:01:07 -0700
X-CSE-ConnectionGUID: Hs/J4NLfS3y3jxL5u+kSxA==
X-CSE-MsgGUID: fe5CUHRfSx6QNdZFbH+Ckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260968672"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Jul 2026 21:01:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkZl1-000000005Qj-0I25;
	Fri, 17 Jul 2026 04:01:03 +0000
Date: Fri, 17 Jul 2026 06:00:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/arm64/processor.h:194:9: warning: "dma_wmb"
 redefined
Message-ID: <202607170503.MCC6Fa20-lkp@intel.com>
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
CC: 0day robot <lkp@intel.com>
CC: David Matlack <dmatlack@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/net-mlx5-Add-IFC-structures-for-CQE-and-WQE/20260717-052940
head:   7fabb466403102b484426d268d4c8f880947b202
commit: e94763f311902b31b644d9934178452e76132cce selftests: Add additional kernel functions to tools/include/
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260717/202607170503.MCC6Fa20-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170503.MCC6Fa20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607170503.MCC6Fa20-lkp@intel.com/

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
