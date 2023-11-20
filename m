Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAADC15B3
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBykB6cO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700442601; x=1731978601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PwLRkoPu9e0IcryzfUASyDxhK2EAaFya2IVemdWRvBY=;
  b=cBykB6cOcCfFySfY2S3WiwMfXT/no3erQQzgiW2nMALYE/aOrAza0qeu
   HFkzEV5YVq00F6ceEoCDME1j12JBFr855Ct73Int0zgbeYDdaPYJjdIyX
   CpVpUpWt86AtKHvN+iZBXl4xBJBEASDDGxj3wnECx6Vtc9Hn+s6EteJ/A
   y8K+Le1QmAMG6Cc0XWf+LIHLuoqwDDjzy+2B+rkFTS3MO2yCZS2NvX3yk
   EMYnO+FaEmq3Wzk6GlTtWsOc4WInb8+a1maEh5qygcd/rxIUx/koRJCs9
   4PlfrxK04dGJRkBGweY5XTrjMO3uuJb9FFDOyupDhEWLHzq7QO6+4qZxG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381920464"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="381920464"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 17:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="795320413"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="795320413"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 19 Nov 2023 17:09:56 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4snR-0005mT-1h;
	Mon, 20 Nov 2023 01:09:53 +0000
Date: Mon, 20 Nov 2023 09:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-4a5ac14ee9/lib/clang/17/include/arm_neon.h:28:2:
 sparse: sparse: "NEON intrinsics not available with the soft-float ABI.
 Please use -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202311200830.1Jh5sjpe-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-4a5ac14ee9/lib/clang/17/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb3479bc23fafbc408558cd8450b35f07fad2a63
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r132-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200830.1Jh5sjpe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311200830.1Jh5sjpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311200830.1Jh5sjpe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/lib/xor-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
>> /opt/cross/clang-4a5ac14ee9/lib/clang/17/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   arch/arm64/lib/xor-neon.c:19:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:19:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:48:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:48:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:86:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:86:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:133:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:133:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:184:26: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:184:26: sparse: sparse: got eor3
>> arch/arm64/lib/xor-neon.c:191:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   arch/arm64/lib/xor-neon.c:191:16: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:191:16: sparse: sparse: got res
   arch/arm64/lib/xor-neon.c:192:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:192:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:203:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:203:29: sparse: sparse: got v0
>> arch/arm64/lib/xor-neon.c:206:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:206:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:206:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:218:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:218:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:219:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:219:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:220:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:220:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:221:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:221:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:223:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:223:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:224:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:224:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:225:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:225:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:226:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:226:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:227:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:227:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:240:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:240:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:243:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:243:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:243:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:261:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:261:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:262:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:262:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:263:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:263:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:264:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:264:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:266:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:266:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:267:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:267:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:268:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:268:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:269:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:269:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:270:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:270:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:271:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:271:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:286:29: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:286:29: sparse: sparse: got v0
   arch/arm64/lib/xor-neon.c:289:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   arch/arm64/lib/xor-neon.c:289:12: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:289:12: sparse: sparse: got {
   arch/arm64/lib/xor-neon.c:307:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:307:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:308:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:308:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:309:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:309:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:310:31: sparse: sparse: Expected ) in function declarator
   arch/arm64/lib/xor-neon.c:310:31: sparse: sparse: got +
   arch/arm64/lib/xor-neon.c:312:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:312:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:313:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:313:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:314:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:314:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:315:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:315:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:316:21: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:316:21: sparse: sparse: got +=
   arch/arm64/lib/xor-neon.c:317:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:317:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:318:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:318:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:324:37: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:324:37: sparse: sparse: got .
   arch/arm64/lib/xor-neon.c:325:37: sparse: sparse: Expected ; at end of declaration
   arch/arm64/lib/xor-neon.c:325:37: sparse: sparse: got .
   arch/arm64/lib/xor-neon.c:326:9: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:326:9: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:328:1: sparse: sparse: Expected ; at the end of type declaration
   arch/arm64/lib/xor-neon.c:328:1: sparse: sparse: got }
   arch/arm64/lib/xor-neon.c:329:1: sparse: sparse: undefined identifier 'xor_neon_init'
>> arch/arm64/lib/xor-neon.c:329:1: sparse: sparse: static assertion failed: "__same_type(initcall_t, &xor_neon_init)"
   arch/arm64/lib/xor-neon.c:24:17: sparse: sparse: too many errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
