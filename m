Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6E91BDF6
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmMuqQuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699881672; x=1731417672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hgH8E0bahk8fL1PN2WOrWVg22iQMeZIOYk5Q+KcJzAM=;
  b=DmMuqQuv3yME9ku8RJrCCD9A7kvxS86mFbHZJ7jxMtNr4Mi2s3HcCXkw
   xb92PQDTg2oL35w9p3Cz9D54+ZNOig5k6i6aDqY+yHRJBD9P2j0AzYTbO
   0K35y0ZlaLm/v0bJ8621zbob9+kld9Z8kE0i7avrnIjstFPMAyj5ZVGON
   nHy76QVAkAJTpRgNUfLeLItC0LlnXkzunAp6S2GfuLm9Dgjsyo0iVIBfU
   nNB4e+u2P54sUVbwgCPvIXiyVm3j3Ig/I/sOfxpxeCFjf7M0Jkd2rdPIk
   DuSBqKrPQ0tV6/o2fWm0/o32Nk/GND15iSxqerxenBrfx3g24/pXY2ukW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387597582"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="387597582"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="714225251"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="714225251"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Nov 2023 05:21:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2WsF-000C7W-2i;
	Mon, 13 Nov 2023 13:21:07 +0000
Date: Mon, 13 Nov 2023 21:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/arch/arm64/include/uapi/asm/kvm.h
 arch/arm64/include/uapi/asm/kvm.h
Message-ID: <202311132125.nX4bnXdQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jing Zhang <jingzhangos@google.com>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b85ea95d086471afb4ad062012a4d73cd328fa86
commit: 3f9cd0ca848413fd368278310d2cdd6c2bef48b2 KVM: arm64: Allow userspace to get the writable masks for feature ID registers
date:   6 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311132125.nX4bnXdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311132125.nX4bnXdQ-lkp@intel.com/

All errors (new ones prefixed by >>):

     diff -u tools/include/uapi/drm/drm.h include/uapi/drm/drm.h
     diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
     diff -u tools/include/uapi/linux/mount.h include/uapi/linux/mount.h
     diff -u tools/arch/x86/include/asm/disabled-features.h arch/x86/include/asm/disabled-features.h
     diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
     diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
     diff -u tools/arch/x86/include/uapi/asm/prctl.h arch/x86/include/uapi/asm/prctl.h
     diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
     diff -u tools/arch/s390/include/uapi/asm/kvm.h arch/s390/include/uapi/asm/kvm.h
>>   diff -u tools/arch/arm64/include/uapi/asm/kvm.h arch/arm64/include/uapi/asm/kvm.h
     diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
     diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
     diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S
     diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
     diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
     diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
     diff -u tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl arch/mips/kernel/syscalls/syscall_n64.tbl
     diff -u tools/perf/util/hashmap.h tools/lib/bpf/hashmap.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
