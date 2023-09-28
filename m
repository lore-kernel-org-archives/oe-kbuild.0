Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0381773E
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Sep 2023 21:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695937414; x=1727473414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Xp8zgcCP6FrduhclIV7Lntj35t9EWJEvw7aGjGqo1s=;
  b=YCYEPinxDWbQiSkTp1nJKyzh0zF5wJYLreT61h3Vk1gPOSiaK+lqjHuj
   yYdeXF8w0LwfPIfrKoT7PbYlwQjy2hEIaChFlFnAwxF77mMLhKRfLEw5c
   J2S63KIB9siGblamdCP7zZWgIeuR/b1pZYUN9PKgc5XQ5Vb3D8aVWzCus
   xBpXmAhQdzx82KODIwqCusfd2TaimTzesosEO2w1eWt8XG1ThKmw4H0mb
   QyQGRQ3maVdyHbpMH3t5/W4Pa+/yrbVYqJR0aVNZ22J+q+uqn/NIbCz4I
   VczgkcYRGJ26HY26jLOvZ5tATfAb4ChalyC5WatK1TsDZdSmijxqZ5zYv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="789503"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="789503"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 14:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996720992"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="996720992"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2023 14:43:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlynB-0001zj-1f;
	Thu, 28 Sep 2023 21:43:29 +0000
Date: Fri, 29 Sep 2023 05:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jirislaby:devel 59/60] arch/x86/kernel/cpu/common.c: asm/ia32.h is
 included more than once.
Message-ID: <202309290535.d6LqYcCu-lkp@intel.com>
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
TO: Nikolay Borisov <nik.borisov@suse.com>
CC: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f0b9af5cd227a9275843be23ecfed63be10a7abb
commit: 708eb744b1edaa9c5fca8f9a2d59293b8959e9dd [59/60] x86/entry: Make IA32 syscalls' availability depend on ia32_enabled()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309290535.d6LqYcCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309290535.d6LqYcCu-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c: asm/ia32.h is included more than once.

vim +65 arch/x86/kernel/cpu/common.c

    29	
    30	#include <asm/alternative.h>
    31	#include <asm/cmdline.h>
    32	#include <asm/perf_event.h>
    33	#include <asm/mmu_context.h>
    34	#include <asm/doublefault.h>
    35	#include <asm/archrandom.h>
    36	#include <asm/hypervisor.h>
    37	#include <asm/processor.h>
    38	#include <asm/tlbflush.h>
    39	#include <asm/debugreg.h>
    40	#include <asm/sections.h>
    41	#include <asm/vsyscall.h>
    42	#include <linux/topology.h>
    43	#include <linux/cpumask.h>
    44	#include <linux/atomic.h>
    45	#include <asm/proto.h>
    46	#include <asm/setup.h>
    47	#include <asm/apic.h>
    48	#include <asm/desc.h>
    49	#include <asm/fpu/api.h>
    50	#include <asm/mtrr.h>
    51	#include <asm/hwcap2.h>
    52	#include <linux/numa.h>
    53	#include <asm/numa.h>
    54	#include <asm/asm.h>
    55	#include <asm/bugs.h>
    56	#include <asm/cpu.h>
    57	#include <asm/mce.h>
    58	#include <asm/msr.h>
    59	#include <asm/cacheinfo.h>
    60	#include <asm/memtype.h>
    61	#include <asm/microcode.h>
    62	#include <asm/intel-family.h>
    63	#include <asm/cpu_device_id.h>
    64	#include <asm/uv/uv.h>
  > 65	#include <asm/ia32.h>
    66	#include <asm/set_memory.h>
  > 67	#include <asm/ia32.h>
    68	#include <asm/traps.h>
    69	#include <asm/sev.h>
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
