Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB936748F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Aug 2024 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002337; cv=none; b=PpYGyKI93aYXq+agz+WCmw1CELI7KIRybqwXsc1Ky73nRAyEw+JecFDw7lc3I6hivr6sPm8DIpIeT0IH8PbSvRD3kv8mLeSLZk/m2/QvWXTRM12mHizqW+VtzyZItRCO/rbfIg7uZX3j9oHBPOVYQnuXGQ5gc4x9XtzJMivqH5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002337; c=relaxed/simple;
	bh=F34Ue9yDBBC+hVpu5ttE73UGhq4/gjkPl4JkRKNDZgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IO/acY6Ff+05hjPUhnEiw/J4xsMCIPmaM8Rs3uH57jgOI8bCDcQzm8qEPoMkLxcpq6qx4Es42C6DeNsrqtTcWVNIPy/8jGR45ZJ/PCangLAWMGhgI7INm2a0U3LWq9XyUoRyazKz0D4b7BFWcedjSTULU+rU+k5d6ydiISOjVFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cyLT2BpN; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyLT2BpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724002335; x=1755538335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F34Ue9yDBBC+hVpu5ttE73UGhq4/gjkPl4JkRKNDZgA=;
  b=cyLT2BpNrMHbSaTCE9xckekFfRktm0+wvPk2uJ/I+uPrAnAKxDUUV2cU
   OtXj1pwJDZvMvTnQOI7rGYZeyA5foFkdVs6yeipAEsus3sxH3ru3DyXZK
   /qkkCPNE2MiBdPkE266V93ZeqzJFFAMy5adp2oImx6xiSgeRIFcsfx0L6
   NcB8DktyR0yfxivbViq4Wo6enPVUl2lgfIf75pU4aDPrK00V0cJvLVjtq
   UZ2mq4T393T1u8hjZdAM7pjs6+Bk9kKxfg58GsIf1zwYo8SYD0Ee2dxvV
   sP4/QOUyAqSDfJNx175dOvCJrzL9JclH3LhcneueAZTWjL7NthDEtCRAE
   w==;
X-CSE-ConnectionGUID: sM95MqHdRrCsltTpnYJYYw==
X-CSE-MsgGUID: Z1Nki47xSY2pWlU4e/vVMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22122288"
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="22122288"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 10:32:14 -0700
X-CSE-ConnectionGUID: ivUbCaH7T/qR2zQc7NFxsg==
X-CSE-MsgGUID: EF3wrT14RWCR/v5fJWdXBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,157,1719903600"; 
   d="scan'208";a="60141510"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Aug 2024 10:32:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfjlD-0008Mm-0B;
	Sun, 18 Aug 2024 17:32:11 +0000
Date: Mon, 19 Aug 2024 01:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [viro-vfs:work.headers.unaligned 2/2]
 util/arm-spe-decoder/arm-spe-pkt-decoder.c:14:10: fatal error:
 'linux/unaligned.h' file not found
Message-ID: <202408190146.7jadYUKv-lkp@intel.com>
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
CC: linux-fsdevel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>

Hi Al,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.headers.unaligned
head:   5adcdf60b29da8386cab7bb157927fec96a46c42
commit: 5adcdf60b29da8386cab7bb157927fec96a46c42 [2/2] move asm/unaligned.h to linux/unaligned.h
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408190146.7jadYUKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408190146.7jadYUKv-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:656: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc1.g5adcdf60b29d
>> util/arm-spe-decoder/arm-spe-pkt-decoder.c:14:10: fatal error: 'linux/unaligned.h' file not found
      14 | #include <linux/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[8]: *** [tools/build/Makefile.build:106: tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.o] Error 1
   make[8]: *** Waiting for unfinished jobs....
>> util/intel-pt-decoder/intel-pt-pkt-decoder.c:13:10: fatal error: 'linux/unaligned.h' file not found
      13 | #include <linux/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~
   In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
   util/intel-pt-decoder/../../../arch/x86/lib/insn.c:16:10: fatal error: '../include/linux/unaligned.h' file not found
      16 | #include "../include/linux/unaligned.h" /* __ignore_sync_check__ */
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[8]: *** [tools/build/Makefile.build:106: tools/perf/util/intel-pt-decoder/intel-pt-pkt-decoder.o] Error 1
   make[8]: *** Waiting for unfinished jobs....
   1 error generated.
   make[8]: *** [util/intel-pt-decoder/Build:14: tools/perf/util/intel-pt-decoder/intel-pt-insn-decoder.o] Error 1
   make[7]: *** [tools/build/Makefile.build:158: arm-spe-decoder] Error 2
   make[7]: *** Waiting for unfinished jobs....
   make[7]: *** [tools/build/Makefile.build:158: intel-pt-decoder] Error 2
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:762: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:265: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2
--
>> diff: tools/include/linux/unaligned.h: No such file or directory
     diff -u tools/include/uapi/drm/i915_drm.h include/uapi/drm/i915_drm.h
     diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
     diff -u tools/include/uapi/linux/in.h include/uapi/linux/in.h
     diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
     diff -u tools/include/uapi/linux/stat.h include/uapi/linux/stat.h
     diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
     diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
     diff -u tools/arch/x86/include/uapi/asm/kvm.h arch/x86/include/uapi/asm/kvm.h
     diff -u tools/arch/x86/include/uapi/asm/svm.h arch/x86/include/uapi/asm/svm.h
     diff -u tools/arch/powerpc/include/uapi/asm/kvm.h arch/powerpc/include/uapi/asm/kvm.h
     diff -u tools/arch/arm64/include/uapi/asm/unistd.h arch/arm64/include/uapi/asm/unistd.h
     diff -u tools/include/uapi/asm-generic/unistd.h include/uapi/asm-generic/unistd.h
     diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
     diff -u tools/include/linux/unaligned.h include/linux/unaligned.h
     diff -u tools/lib/list_sort.c lib/list_sort.c
     diff -u tools/perf/arch/x86/entry/syscalls/syscall_64.tbl arch/x86/entry/syscalls/syscall_64.tbl
     diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
     diff -u tools/perf/arch/s390/entry/syscalls/syscall.tbl arch/s390/kernel/syscalls/syscall.tbl
     diff -u tools/perf/trace/beauty/include/linux/socket.h include/linux/socket.h
     diff -u tools/perf/trace/beauty/include/uapi/linux/fs.h include/uapi/linux/fs.h
     diff -u tools/perf/trace/beauty/include/uapi/linux/mount.h include/uapi/linux/mount.h
     diff -u tools/perf/trace/beauty/include/uapi/linux/stat.h include/uapi/linux/stat.h
     diff -u tools/perf/trace/beauty/include/uapi/sound/asound.h include/uapi/sound/asound.h


vim +14 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c

5adcdf60b29da8 tools/perf/util/arm-spe-decoder/arm-spe-pkt-decoder.c Al Viro      2023-12-05 @14  #include <linux/unaligned.h>
ffd3d18c20b8df tools/perf/util/arm-spe-pkt-decoder.c                 Kim Phillips 2018-01-14  15  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
