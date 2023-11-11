Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F631D6A6
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 23:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWFfRMOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699744016; x=1731280016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OIpi8Kn0xo0CmbnRDdWFfJIAhAg77KYoi4v8jLVEPeU=;
  b=HWFfRMOTtOWLPfBqlq/LWVrzaeW7Ox10Oj0fXL4D2dvIU1qyLfd7TecJ
   Wsf7AwqK6G9HoayrWHhaXv7W2s6dKRnYtts6xvxhaPulZsPg/xPHc3Xum
   geUVZyl8NJHnrDbIYhl/bwc+/1GrGfBhh+78b1euPGAlvED0TvrMAUTdE
   1xp3A7fQUh0mjn2wwILo8xtz0F1jVTutSUPFgIY2DSkAyg1fY9hMdCvxa
   69iPQsjTGPeXUP0a/uvabxHwRR+aqB4RsI8ljIW5YN5BvBvFsIPXWOWrB
   CO0Y1wb9MEirmMEK+Z9OwUz8GdOTsktwd+uRaEwXObFbjxcrPj5HZfls5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="3315616"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="3315616"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 15:06:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="887611775"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="887611775"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Nov 2023 15:06:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1x3z-000AoA-23;
	Sat, 11 Nov 2023 23:06:51 +0000
Date: Sun, 12 Nov 2023 07:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/include/asm/processor.h:396:1: sparse:    struct
 fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data
Message-ID: <202311120700.f2BpCQUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/x86/include/asm/processor.h:396:1: sparse:    struct fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Lutomirski <luto@kernel.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: e6401c13093173aad709a5c6de00cf8d692ee786 x86/irq/64: Split the IRQ stack into its own pages
date:   4 years, 7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 years, 7 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231112/202311120700.f2BpCQUD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120700.f2BpCQUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120700.f2BpCQUD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kernel/cpu/common.c:1501:1: sparse: sparse: symbol 'fixed_percpu_data' redeclared with different type (different address spaces):
   arch/x86/kernel/cpu/common.c:1501:1: sparse:    struct fixed_percpu_data [addressable] [noderef] [toplevel] <asn:3> fixed_percpu_data
   arch/x86/kernel/cpu/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:396:1: sparse: note: previously declared as:
>> arch/x86/include/asm/processor.h:396:1: sparse:    struct fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data
   arch/x86/kernel/cpu/common.c:123:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:124:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:125:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:126:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:127:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:128:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/include/asm/processor.h:400:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] <asn:3> *__vpp_verify @@     got char ( * )[40] @@
   arch/x86/include/asm/processor.h:400:31: sparse:     expected void const [noderef] <asn:3> *__vpp_verify
   arch/x86/include/asm/processor.h:400:31: sparse:     got char ( * )[40]

vim +396 arch/x86/include/asm/processor.h

947e76cdc34c78 Brian Gerst     2009-01-19  394  
e6401c13093173 Andy Lutomirski 2019-04-14  395  DECLARE_PER_CPU_FIRST(struct fixed_percpu_data, fixed_percpu_data) __visible;
e6401c13093173 Andy Lutomirski 2019-04-14 @396  DECLARE_INIT_PER_CPU(fixed_percpu_data);
2add8e235cbe0d Brian Gerst     2009-02-08  397  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
