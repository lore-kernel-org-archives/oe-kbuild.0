Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BCD7E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6kg1t8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700096164; x=1731632164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2GzDKvXZYqMAqh834mv4fOBzgyYhI6h8+SUOWN02pU=;
  b=V6kg1t8JvNVldHgP8uqTpjZUsKJLg0TSJKYyGXSquW00VLWR4kchve8Y
   yrYmfM+GB8NOTUzGsoZxeM1jTu2MY2Pnrm1kgMu8oi/3Swo9ZY0QQSDmS
   FfbSC9vjuoltYeRHK/ixOE4V1Tp5WlVYYufVLKIv5vZiCpQ3OOrUf4lE4
   NT8Q2tFSkwNoKU/P3yY2gWboUDImFSmuirCd87Oncb43NmxScrn73odS1
   wcCJsKrFHD/KY39EqE079joB79uEJiYykkAoAMiaHO8vehQZg6CtpMuSy
   Mfe0KzCNjbpS+edJm/SolVvXOB2OXKMVkLja2Vy1a+L8st44wnWpzwwqp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388152540"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388152540"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 16:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="12945700"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2023 16:56:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Qfo-00014F-0c;
	Thu, 16 Nov 2023 00:56:00 +0000
Date: Thu, 16 Nov 2023 08:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/arch/x86/include/asm/disabled-features.h
 arch/x86/include/asm/disabled-features.h
Message-ID: <202311160832.dlXNo40I-lkp@intel.com>
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
TO: Juergen Gross <jgross@suse.com>
CC: Borislav Petkov <bp@suse.de>

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 15e15d64bd8e12d835f6bb1b1ce3ffa13fa03a66 x86/cpufeatures: Add X86_FEATURE_XENPV to disabled-features.h
date:   12 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 12 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160832.dlXNo40I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160832.dlXNo40I-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h'
   diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/in.h' differs from latest version at 'include/uapi/linux/in.h'
   diff -u tools/include/uapi/linux/in.h include/uapi/linux/in.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/stat.h' differs from latest version at 'include/uapi/linux/stat.h'
   diff -u tools/include/uapi/linux/stat.h include/uapi/linux/stat.h
   Warning: Kernel ABI header at 'tools/include/uapi/sound/asound.h' differs from latest version at 'include/uapi/sound/asound.h'
   diff -u tools/include/uapi/sound/asound.h include/uapi/sound/asound.h
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/disabled-features.h' differs from latest version at 'arch/x86/include/asm/disabled-features.h'
>> diff -u tools/arch/x86/include/asm/disabled-features.h arch/x86/include/asm/disabled-features.h
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/msr-index.h' differs from latest version at 'arch/x86/include/asm/msr-index.h'
   diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
   Warning: Kernel ABI header at 'tools/arch/x86/lib/memcpy_64.S' differs from latest version at 'arch/x86/lib/memcpy_64.S'
   diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' differs from latest version at 'arch/arm64/include/asm/cputype.h'
   diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
   Warning: Kernel ABI header at 'tools/perf/arch/powerpc/entry/syscalls/syscall.tbl' differs from latest version at 'arch/powerpc/kernel/syscalls/syscall.tbl'
   diff -u tools/perf/arch/powerpc/entry/syscalls/syscall.tbl arch/powerpc/kernel/syscalls/syscall.tbl
     PERF_VERSION = 6.1.rc1.g15e15d64bd8e

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
