Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D15495E2
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1u1JM3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701464464; x=1733000464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLY1r7fht2sVnVrMxiYPnGfhxm7ZAMEAENvn0jImTTQ=;
  b=R1u1JM3bh0/A0N9QlmlKDgm84oGzqpmKW+5YPlQ25eM7mlDtWRY2pxHq
   DAZr7U2F1DGZgH+OaqM43RVKRgE6NPg9piO+6msFU8V4ZZCDauFkVfRxA
   mC9BEcD7yU5QhoOEab+8OY2/ihWAHgq9e0oMuT1NSK8KdS2f2O2t3LDar
   cELHMscUwb5bC3WFDHvPvd7CG2jWl9xP7IDu3Jw5GlaHb7ZxK67541OUW
   ACbRZfFvpj3fDLPQO1ca4Q7/7lSlBrSo6ovZC8iUjID73EGqlL4oF4LY0
   hL97pMb6bbD21X/gwE0BuFEyg94SpsUpr/kZJmrlbG3J4Oa2pLvAS7dTj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="460043763"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="460043763"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 13:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="719651436"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="719651436"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 01 Dec 2023 13:01:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9AdA-0004Hq-0p;
	Fri, 01 Dec 2023 21:01:00 +0000
Date: Sat, 2 Dec 2023 05:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-4a5ac14ee9/lib/clang/17/include/arm_neon.h:28:2:
 sparse: sparse: "NEON intrinsics not available with the soft-float ABI.
 Please use -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202312020404.WDf4wem3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-4a5ac14ee9/lib/clang/17/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-r132-20231119 (https://download.01.org/0day-ci/archive/20231202/202312020404.WDf4wem3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020404.WDf4wem3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020404.WDf4wem3-lkp@intel.com/

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
   arch/arm64/lib/xor-neon.c:24:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:24:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:25:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:25:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:26:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:26:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:27:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:27:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:30:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:31:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:32:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:33:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:53:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:53:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:54:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:54:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:55:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:55:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:56:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:56:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:59:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:59:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:60:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:60:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:61:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:61:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:62:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:62:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:65:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:66:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:67:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:68:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:91:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:91:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:92:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:92:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:93:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:93:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:94:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:94:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:97:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:97:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:98:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:98:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:99:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:99:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:100:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:100:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:103:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:103:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:104:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:104:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:105:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:105:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:106:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:106:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:109:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:110:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:111:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:112:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:138:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:138:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:139:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:139:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:140:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:140:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:141:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:141:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:144:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:144:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:145:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:145:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:146:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:146:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:147:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:147:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:150:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:150:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:151:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:151:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:152:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:152:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:153:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:153:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:156:17: sparse: sparse: undefined identifier 'v0'
   arch/arm64/lib/xor-neon.c:156:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:157:17: sparse: sparse: undefined identifier 'v1'
   arch/arm64/lib/xor-neon.c:157:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:158:17: sparse: sparse: undefined identifier 'v2'
   arch/arm64/lib/xor-neon.c:158:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:159:17: sparse: sparse: undefined identifier 'v3'
   arch/arm64/lib/xor-neon.c:159:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:162:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:163:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:164:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:165:17: sparse: sparse: undefined identifier 'vst1q_u64'
   arch/arm64/lib/xor-neon.c:200:37: sparse: sparse: undefined identifier 'p2'
   arch/arm64/lib/xor-neon.c:201:37: sparse: sparse: undefined identifier 'p3'
   arch/arm64/lib/xor-neon.c:204:22: sparse: sparse: undefined identifier 'bytes'
   arch/arm64/lib/xor-neon.c:210:22: sparse: sparse: undefined identifier 'eor3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
