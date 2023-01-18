Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693678C06
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 22:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674079231; x=1705615231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YI+SbRxDEPr5NISEk21wIgU63lLQ5fPR/thqrkXfVb4=;
  b=XkplB/kQILirteOjbWgHBvkP0xNsmNH5Gy60BEgJ/uFO7fv1P4MaRpfu
   67IzTjepxX80pNIgmEHVNlqjftEWBLfkhR1Jh4dge7H3JWuhRmMc9ZVw1
   tijCBmnGcDXcm052N5WcbSK11oDxcG5rGHciqS38KjjLwQmPM8BkuQtau
   kLLOoZMmXoYgDzuD7BdUIC39gJ3u9ZxLvM7W72vpurk2yD1dvQDI+cXmf
   ApDNfzCISnwWA5ncF10QcVG2k+aDgHXH55IUbuZ9cgZce6kChYgI0akSd
   4ONm0xI+22TYoElRg9dgKqIfolEwoE+C17kkbX9vvVQAhif2Kb5Vm++nw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327186243"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327186243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748650165"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="748650165"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 14:00:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIGTe-0000kY-38;
	Wed, 18 Jan 2023 22:00:14 +0000
Date: Thu, 19 Jan 2023 06:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-tdx:guest-next 7/10] arch/x86/coco/tdx/tdx.c:93:19: warning:
 unused function '_trace_tdx_hypercall'
Message-ID: <202301190512.qpqo8czQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-next
head:   a9fe7e5b76f30be16e10d52a91a7a4328bb2d085
commit: 7543a1b6098050d7cd5e8fd22fa9c1e7ad578f96 [7/10] Merge remote-tracking branch 'origin/guest-debug' into guest-next
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-a005-20230116 (https://download.01.org/0day-ci/archive/20230119/202301190512.qpqo8czQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/7543a1b6098050d7cd5e8fd22fa9c1e7ad578f96
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-next
        git checkout 7543a1b6098050d7cd5e8fd22fa9c1e7ad578f96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:93:19: warning: unused function '_trace_tdx_hypercall' [-Wunused-function]
   static inline u64 _trace_tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14,
                     ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for EFI_STUB
   Depends on [n]: EFI [=n]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]
   WARNING: unmet direct dependencies detected for UNACCEPTED_MEMORY
   Depends on [n]: EFI [=n] && EFI_STUB [=y]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]


vim +/_trace_tdx_hypercall +93 arch/x86/coco/tdx/tdx.c

e380d45bbd9d4a Kuppuswamy Sathyanarayanan 2021-04-28   91  
7543a1b6098050 Kuppuswamy Sathyanarayanan 2023-01-05   92  /* Traced version of _tdx_hypercall */
7543a1b6098050 Kuppuswamy Sathyanarayanan 2023-01-05  @93  static inline u64 _trace_tdx_hypercall(u64 fn, u64 r12, u64 r13, u64 r14,
7543a1b6098050 Kuppuswamy Sathyanarayanan 2023-01-05   94  				       u64 r15)
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06   95  {
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06   96  	struct tdx_hypercall_args args = {
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06   97  		.r10 = TDX_HYPERCALL_STANDARD,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06   98  		.r11 = fn,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06   99  		.r12 = r12,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  100  		.r13 = r13,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  101  		.r14 = r14,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  102  		.r15 = r15,
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  103  	};
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  104  
e380d45bbd9d4a Kuppuswamy Sathyanarayanan 2021-04-28  105  	return __trace_tdx_hypercall(&args, 0);
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  106  }
eb94f1b6a70a68 Kuppuswamy Sathyanarayanan 2022-04-06  107  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
