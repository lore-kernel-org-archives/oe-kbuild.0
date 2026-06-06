Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FCB3B42F6
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780760800; cv=none; b=aFcFFcSXASBzW2+l5fp3F4G5vH5A2477XnjpqymHjWlXOVMBCIPTl2YnCyEdi6MV6x+H/4NHxDgi7nTY9gPzhq2z3b7Y79xP2LKQjRErir94ATT9dhn4B1h4O82YY4Uvze6PYVpwffcaK/YSfr3BVkFOzCPxDzw/e2NFkBm5MPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780760800; c=relaxed/simple;
	bh=Y0qQWGXLSAgICHGRvmRAfFF1+1PRrva4LpyUt00J1Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=owkWxJhlHPKWz1MXFVJjlHFzy0Q9KgvHbKo9UaI9JhRxru1lAph/+blgsmndyeZuJ8ZVMSKzbZG3DA7b/02iH/6BBKTt4h66ij+wGSz3EeyDm+Hf3ZRC2xpQDDQq40yguyF94fyqC7zq084sPyYvam0emxO8WMid/QoJyYNNdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZLCC68c; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZLCC68c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780760798; x=1812296798;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y0qQWGXLSAgICHGRvmRAfFF1+1PRrva4LpyUt00J1Ao=;
  b=KZLCC68cWqwUaQK5aqXBtpXXxoWp8xlqYvonu32pqkynpoqD/I9o7/DK
   Qr+GE91+lKsnBoIp5nM1ykPLf3yWov6OMDWACxSqnMtwhCKC3w/NP7iia
   JJNZMGOmFg1IrBy8KTSTQDz3emhxRDRxiGWbLqLPcx04bqz3FzmTWdHWn
   hVuAL8LBx+BoBveW6Eim0jmTPHphwO3ydA8s+PA9KdkkwU5gdYl/fkR8t
   cu+d/cw7CCSbvhF077KqrsAFvQI+KLcz1XmNst15RPbRGT7aCkGislnTe
   UNTEahD8CaZiv2/1KSCh7//srbDZszF1b1ldDw5yW30cXcdYtopWVZJL7
   Q==;
X-CSE-ConnectionGUID: zdqrxrPpRCar44ZzGuRWaA==
X-CSE-MsgGUID: myXXQr5ASFKudSXVXq+0og==
X-IronPort-AV: E=McAfee;i="6800,10657,11809"; a="81561434"
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="81561434"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2026 08:46:37 -0700
X-CSE-ConnectionGUID: PSO2z9EcR82FMukXEnyX2g==
X-CSE-MsgGUID: HVhOWztrQxm7QlMM6IXUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,191,1774335600"; 
   d="scan'208";a="242123172"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2026 08:46:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVtEH-000000002qT-33yj;
	Sat, 06 Jun 2026 15:46:33 +0000
Date: Sat, 06 Jun 2026 17:45:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 3/4]
 arch/arm64/include/asm/cpucaps.h:6:10: fatal error: asm/cpucap-defs.h: No
 such file or directory
Message-ID: <202606061754.VQ1x4Om4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-arch-clockmodes
head:   9a949a63a8b066c75c8a6efa28cda2b3e7fecb19
commit: ff6270d723df5895f0242fe7843afed8b5836bd2 [3/4] recursive
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0606/202606061754.VQ1x4Om4-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260606/202606061754.VQ1x4Om4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606061754.VQ1x4Om4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/alternative-macros.h:8,
                    from arch/arm64/include/asm/barrier.h:14,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from arch/arm64/include/asm/memory.h:217,
                    from arch/arm64/include/asm/page.h:45,
                    from arch/arm64/include/asm/proc-fns.h:14,
                    from arch/arm64/include/asm/pgtable.h:9,
                    from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:12,
                    from include/linux/libnvdimm.h:10,
                    from ../../../drivers/nvdimm/core.c:5:
>> arch/arm64/include/asm/cpucaps.h:6:10: fatal error: asm/cpucap-defs.h: N=
o such file or directory
       6 | #include <asm/cpucap-defs.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:9,
                    from include/linux/thread_info.h:14,
                    from arch/arm64/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/vmalloc.h:5,
                    from ../../../drivers/nvdimm/dimm.c:5:
>> include/linux/math.h:6:10: fatal error: asm/div64.h: No such file or dir=
ectory
       6 | #include <asm/div64.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +6 arch/arm64/include/asm/cpucaps.h

484de08518e43a Mark Rutland 2023-10-16  5 =20
484de08518e43a Mark Rutland 2023-10-16 @6  #include <asm/cpucap-defs.h>
484de08518e43a Mark Rutland 2023-10-16  7 =20

:::::: The code at line 6 was first introduced by commit
:::::: 484de08518e43aa14f0d5719a99b19625ac12228 arm64: Factor out cpucap de=
finitions

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
