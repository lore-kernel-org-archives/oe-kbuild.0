Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810072;
	b=r+5QYsTKv0rb0bt3eUYNDe+5nNKj4u2MF14vCd+3J6T0wfasjMDWEn+nl/7xDUNSRzS5
	 vIgED15hIzP7yxwegc+h6b4sWZiePPG5PanNkV0oHcJm4fPNO7Hdt/PkVN0VOG2sanNNb
	 KoH//jJ7vOb0mmGunxLMbXPz8eZGIfpDg90sGyXx4o8Cdlkp9WfA17cfrk24LlZ9rdJnl
	 /mqV5wAuVBFwSzwiUjkQdUes1ffjctjJBtTF906C60/8WMqf6FzimFpYu5v7zjsVRjdFU
	 HGYXZvJVt0JNFgJNxrIhhsXBdm920feQqneMzQD3U8AUrNl6oiKBr4AfytMy3Sg+thQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810072;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kfrUUqREloCqn2Z6dKQ01sLhiJNt5AHkaSqbpai3Dgg=;
	b=1hB8/SRh5rj+A9ZAsakzdtFBJPt+uWjuSqG1rP1sLUMLJwiy2dSX+WGlqPMSmXrmFIvO
	 aDP66ZEf1E9JaCqVy1n2Pq9mTJrN552Nt4JqIUdSpF0WoOFgvu1Z6lKZvDJK7L6awlCVw
	 Egiv3fK2Z9IK9EX0QSuvKM8+QVItDsTT1sXbr56fLTdUymu+dry5mVQJxy4xw391s1o/t
	 1tErjMgo37jnKA6572HbdOqQEHM4R+2HnnKQJlXetfZQ6vFVxtDJZ3nIn/7sFhI/yZB75
	 1zCrngqxxrRpUurAbLFOBBtb28XsH7O3FISvlitXPuOhoJW1B2xz8gBVnWUu54QfAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEsOSp+F;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C5606A32A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 06:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591C5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FEsOSp+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794810072; x=1826346072;
  h=date:from:to:cc:subject:message-id;
  bh=q5ZDLDR5cyRSoN1ErY7G+VvBnWFm+lrNa/TAIdsOTM8=;
  b=FEsOSp+Fjkp1Akvn5oH9ufNO+rwIc9PDt2dx24179HTGEuqYH0ToNeHS
   FiygBG8POkgeqK7Q5ReQak9BqYzKG6oUY1sXmhlA/M9JgrUzKcSqHYvSk
   xaAmvvCn1yKMfpt9sWOXrbbI07EIDi8Hb2dcDNqbxVR7fMDFvriHlfTSi
   2rUvAxDKpLHqR8Nusr6Y7XviLfD9eADFFQVMV/rlOIS/8U3VBjA6+ga1F
   mGT+kqZNdKuuopkOLiFioF3trWUegET1gIJ9OYh+o9HrydvGbxJhRY783
   hPTSTh7rZlSbMfLcpq7hevVGOQV8/svoKfgkoZKSTD3DXOZi57zmNy0G3
   A==;
X-CSE-ConnectionGUID: HOWb+vGOTvW9DKWg0fU54A==
X-CSE-MsgGUID: 5c6cLtdqQg+gOB89TdviXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3613325"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3613325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 22:21:11 -0800
X-CSE-ConnectionGUID: LzpynqPmSNmtyqpFyxUO4w==
X-CSE-MsgGUID: gB/7/lKYSiO7Vude1DUXAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9296776"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 22:21:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSq5R-000000002bz-3KP6;
	Mon, 16 Nov 2026 06:21:05 +0000
Date: Mon, 16 Nov 2026 07:20:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse:
 Trying to use reserved word 'return' as identifier
Message-ID: <202611160740.w0ZA9otD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Christoph,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-r2308-20261116 (https://download.01.org/0day-ci/archive/20261116/202611160740.w0ZA9otD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project cbfac21cd384f6c7c480c2d0026ecedfe2d619e7)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160740.w0ZA9otD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611160740.w0ZA9otD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/raid6/arm/recov_neon_inner.c: note: in included file:
   /opt/cross/clang-cbfac21cd3/lib/clang/24/include/arm_neon.h:30:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/recov_neon_inner.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/recov_neon_inner.c:16:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:16:19: sparse: sparse: got vqtbl1q_u8
   lib/raid/raid6/arm/recov_neon_inner.c:20:33: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:20:33: sparse: sparse: got pair
   lib/raid/raid6/arm/recov_neon_inner.c:21:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:21:9: sparse: sparse: got }
>> lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/recov_neon_inner.c:23:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:23:16: sparse: sparse: got vcombine_u8
   lib/raid/raid6/arm/recov_neon_inner.c:25:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:25:1: sparse: sparse: got }
   lib/raid/raid6/arm/recov_neon_inner.c:33:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:33:20: sparse: sparse: got pm1
   lib/raid/raid6/arm/recov_neon_inner.c:34:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:34:20: sparse: sparse: got qm0
   lib/raid/raid6/arm/recov_neon_inner.c:35:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:35:20: sparse: sparse: got qm1
   lib/raid/raid6/arm/recov_neon_inner.c:36:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:36:20: sparse: sparse: got x0f
   lib/raid/raid6/arm/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/raid6/arm/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid/raid6/arm/recov_neon_inner.c:51:28: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/arm/recov_neon_inner.c:51:28: sparse: sparse: got vx
   lib/raid/raid6/arm/recov_neon_inner.c:76:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:76:1: sparse: sparse: got }
   lib/raid/raid6/arm/recov_neon_inner.c:82:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:82:20: sparse: sparse: got qm1
   lib/raid/raid6/arm/recov_neon_inner.c:83:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/recov_neon_inner.c:83:20: sparse: sparse: got x0f
   lib/raid/raid6/arm/recov_neon_inner.c:92:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/raid6/arm/recov_neon_inner.c:92:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid/raid6/arm/recov_neon_inner.c:93:28: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/arm/recov_neon_inner.c:93:28: sparse: sparse: got vx
   lib/raid/raid6/arm/recov_neon_inner.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/recov_neon_inner.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/recov_neon_inner.c:53:17: sparse: sparse: undefined identifier 'px'
   lib/raid/raid6/arm/recov_neon_inner.c:53:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:54:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:54:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:56:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:56:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:57:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:57:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:58:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:58:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:59:17: sparse: sparse: undefined identifier 'qx'
   lib/raid/raid6/arm/recov_neon_inner.c:59:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:61:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:61:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:62:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:62:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:63:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:63:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:64:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:64:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:65:17: sparse: sparse: undefined identifier 'db'
   lib/raid/raid6/arm/recov_neon_inner.c:65:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:67:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:68:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:71:17: sparse: sparse: undefined identifier 'p'
   lib/raid/raid6/arm/recov_neon_inner.c:72:17: sparse: sparse: undefined identifier 'q'
   lib/raid/raid6/arm/recov_neon_inner.c:73:17: sparse: sparse: undefined identifier 'dp'
   lib/raid/raid6/arm/recov_neon_inner.c:74:17: sparse: sparse: undefined identifier 'dq'
   lib/raid/raid6/arm/recov_neon_inner.c:95:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:95:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:97:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:97:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:98:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:98:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:99:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:99:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:100:17: sparse: sparse: undefined identifier 'vx'
   lib/raid/raid6/arm/recov_neon_inner.c:100:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:101:17: sparse: sparse: undefined identifier 'vy'
   lib/raid/raid6/arm/recov_neon_inner.c:101:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:103:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:104:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid/raid6/arm/recov_neon_inner.c:107:17: sparse: sparse: undefined identifier 'p'
   lib/raid/raid6/arm/recov_neon_inner.c:108:17: sparse: sparse: undefined identifier 'q'
   lib/raid/raid6/arm/recov_neon_inner.c:109:17: sparse: sparse: undefined identifier 'dq'

vim +/return +23 lib/raid/raid6/arm/recov_neon_inner.c

6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13   9  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  10  #ifdef CONFIG_ARM
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  11  /*
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  12   * AArch32 does not provide this intrinsic natively because it does not
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  13   * implement the underlying instruction. AArch32 only provides a 64-bit
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  14   * wide vtbl.8 instruction, so use that instead.
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  15   */
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  16  static uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  17  {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  18  	union {
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  19  		uint8x16_t	val;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  20  		uint8x8x2_t	pair;
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  21  	} __a = { a };
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  22  
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13 @23  	return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  24  			   vtbl2_u8(__a.pair, vget_high_u8(b)));
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  25  }
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  26  #endif
6ec4e2514decd6 lib/raid6/recov_neon_inner.c Ard Biesheuvel 2017-07-13  27  

:::::: The code at line 23 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
