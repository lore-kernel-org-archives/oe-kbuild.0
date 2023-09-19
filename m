Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07B180
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Sep 2023 00:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695082517; x=1726618517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vzIvXuU6Lx7N2Xuuq+9eqbDRt1wwqdSJ2i6tR/5RL2M=;
  b=JDc9pk/aV/WM9m6twGvsjTdDOmcUoeKWo7hjfjoxKP5aKVX7z4OMzCKG
   JiDyagvWF778t1CeWRVgUZz75YwPyqfhVddCL85sKiXF5LX0CXrWf06Fy
   yXXDWKzWT+7r6ry/EOMZ4PmTZKxZ+Z6GQZ614Q/OROuodR1QS2Rhof6zz
   2L8xjF+iwXsx/cahwW822JDGMbFwbs47QiT2GKSOIM2YWPeTdLG5Gx7jd
   bOrM/yh6VPinbQtTpDydrDZ+Ujm8CQSB0oXh0MrVh6cg4+/6QzfNDPIs5
   pcpJjoF7igHwEIpGUwQm+bdHYAzrTREzGd4GNGXw1e/yj9lQ2GVS+jj5/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378710791"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="378710791"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 17:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869766742"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="869766742"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 17:15:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiOOW-0006fR-1E;
	Tue, 19 Sep 2023 00:15:12 +0000
Date: Tue, 19 Sep 2023 08:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 19/25] KVM: VMX: Emulate read and write to CET MSRs
Message-ID: <202309190838.32kXx2Zr-lkp@intel.com>
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
In-Reply-To: <20230914063325.85503-20-weijiang.yang@intel.com>
References: <20230914063325.85503-20-weijiang.yang@intel.com>
TO: Yang Weijiang <weijiang.yang@intel.com>

Hi Yang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ff6e6ded54725cd01623b9a1a86b74a523198733]

url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Weijiang/x86-fpu-xstate-Manually-check-and-add-XFEATURE_CET_USER-xstate-bit/20230914-174056
base:   ff6e6ded54725cd01623b9a1a86b74a523198733
patch link:    https://lore.kernel.org/r/20230914063325.85503-20-weijiang.yang%40intel.com
patch subject: [PATCH v6 19/25] KVM: VMX: Emulate read and write to CET MSRs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-121-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190838.32kXx2Zr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190838.32kXx2Zr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309190838.32kXx2Zr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/vmx/vmx.c: note: in included file:
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110011 becomes 11)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100190 becomes 190)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100210 becomes 210)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100110 becomes 110)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a018a becomes 18a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (b008b becomes 8b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a020a becomes 20a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (b010b becomes 10b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100310 becomes 310)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100510 becomes 510)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100410 becomes 410)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (30203 becomes 203)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (30283 becomes 283)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1b019b becomes 19b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1b021b becomes 21b)
   arch/x86/kvm/vmx/vmx.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:399:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got char ( * )[40] @@
   arch/x86/include/asm/processor.h:399:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:399:31: sparse:     got char ( * )[40]
   arch/x86/kvm/vmx/vmx.c: note: in included file:
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1b029b becomes 29b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1b031b becomes 31b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1b041b becomes 41b)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120912 becomes 912)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (110311 becomes 311)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120992 becomes 992)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100610 becomes 610)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100690 becomes 690)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100590 becomes 590)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (80408 becomes 408)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (80c88 becomes c88)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a039a becomes 39a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a041a becomes 41a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120a92 becomes a92)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a099a becomes 99a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a091a becomes 91a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a008a becomes 8a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a048a becomes 48a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a010a becomes 10a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (80b88 becomes b88)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a050a becomes 50a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0a1a becomes a1a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0a9a becomes a9a)
>> arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a0b1a becomes b1a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a071a becomes 71a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a079a becomes 79a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a001a becomes 1a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a009a becomes 9a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (180198 becomes 198)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a051a becomes 51a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120392 becomes 392)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a081a becomes 81a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (1a011a becomes 11a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (100490 becomes 490)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (120892 becomes 892)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a038a becomes 38a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a040a becomes 40a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a028a becomes 28a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: cast truncates bits from constant value (a030a becomes 30a)
   arch/x86/kvm/vmx/hyperv.h:34:30: sparse: sparse: too many warnings

vim +34 arch/x86/kvm/vmx/hyperv.h

75edce8a45486f arch/x86/kvm/vmx/evmcs.h Sean Christopherson 2018-12-03  30  
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  31  static __always_inline int evmcs_field_offset(unsigned long field,
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  32  					      u16 *clean_field)
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  33  {
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20 @34  	unsigned int index = ROL16(field, 6);
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  35  	const struct evmcs_field *evmcs_field;
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  36  
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  37  	if (unlikely(index >= nr_evmcs_1_fields))
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  38  		return -ENOENT;
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  39  
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  40  	evmcs_field = &vmcs_field_to_evmcs_1[index];
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  41  
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  42  	/*
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  43  	 * Use offset=0 to detect holes in eVMCS. This offset belongs to
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  44  	 * 'revision_id' but this field has no encoding and is supposed to
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  45  	 * be accessed directly.
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  46  	 */
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  47  	if (unlikely(!evmcs_field->offset))
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  48  		return -ENOENT;
892a42c10ddb94 arch/x86/kvm/vmx/evmcs.h Vitaly Kuznetsov    2022-01-12  49  
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  50  	if (clean_field)
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  51  		*clean_field = evmcs_field->clean_field;
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  52  
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  53  	return evmcs_field->offset;
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  54  }
773e8a0425c923 arch/x86/kvm/vmx_evmcs.h Vitaly Kuznetsov    2018-03-20  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
