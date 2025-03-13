Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374E2E339B
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Mar 2025 02:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741832142; cv=none; b=fanwK/OiGL7yVmT436RO7aRqtIE6zrqUQCUORQ2zYvcncbsutZKuc2VgNNvNkwh5HAWUs7L5n6TIFPFwsOUgRnosckGlJOkg4MNgHB+iAjaFY2pYJHphV27qbR3SFnSXY0ILnUjrOvzsRGZGFQZAYzmXIHkvDDWzDb3fAnWBDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741832142; c=relaxed/simple;
	bh=+h+9GSx3P5U0df9L9Qv/ZajVEY593zofHZcGm3IeNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/eBRn4OMFDpOJabYTEFfjCsXwNJp+hWlbkBNKJ2r+PdXTPW5fiplbjGJrRvauVObEu5t3n2o9C/5Ka8kWQZM2eVPMn4KQghMv+ACO9D6lYeSwqVxmg+m3WKpBe4NItdXe6GCa51FyX8yERFgREuPF619Fjt/LU13MlRSTSpa44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAIP6zdH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAIP6zdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741832141; x=1773368141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+h+9GSx3P5U0df9L9Qv/ZajVEY593zofHZcGm3IeNNY=;
  b=HAIP6zdHXOd+rxtteU1iS39PsLrjjIhhYezMrAz2JK1frCgpapdKV+pR
   MqCvzKGAzsSRckiQYqxDxzh+AhAQ5wpRg2L8gpmK5iH63CIlTaUK6Npfn
   JC5NZAZzk4EYMRJmVpcTASDIDB6BmPm/RLO8JvLZR+CJFGa/5uH9Lglax
   WT9cTQWUER6gMzqWwrCIXwhXORSQV8g7yRmPUwSuJJDvI87//fAln2+V6
   cGv3G0G1cLtV3Iy0xjoPiyUhrs7hxO7+WZGWwOAChWwaJ21Ntktr4WV8K
   CM/JSHD6XFn0+iPHRnAV1AXWAjjYprysMR3j01N6g9IQUw/j02wobhtRP
   Q==;
X-CSE-ConnectionGUID: 5qsMjb4UTyidhEBrwDqISw==
X-CSE-MsgGUID: 14FHocCdTJGxknIsXaxoDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43067697"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="43067697"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 19:15:40 -0700
X-CSE-ConnectionGUID: YpACWx+GRv+ES0T7UmxioQ==
X-CSE-MsgGUID: lN2q7GFHSWOEXumzfj8Mpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="120527324"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 19:15:39 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsY6a-000938-2S;
	Thu, 13 Mar 2025 02:15:31 +0000
Date: Thu, 13 Mar 2025 10:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 280/280]
 arch/x86/kvm/vmx/pkvm/hyp/lib/retpoline.S: asm/GEN-for-each-reg.h is
 included more than once.
Message-ID: <202503131038.t6RuPe28-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   af59307e4f1c5a675cbb77839c87bfb8292094b5
commit: f7b3d7d3b1ae977163644c4836a650ce1de3a837 [280/280] ANDROID: pkvm: x86: Add pKVM retpoline.S
:::::: branch date: 5 hours ago
:::::: commit date: 14 hours ago
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503131038.t6RuPe28-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/pkvm/hyp/lib/retpoline.S: asm/GEN-for-each-reg.h is included more than once.

vim +53 arch/x86/kvm/vmx/pkvm/hyp/lib/retpoline.S

    51	
    52	#define GEN(reg) THUNK reg
  > 53	#include <asm/GEN-for-each-reg.h>
    54	#undef GEN
    55	
    56		.align RETPOLINE_THUNK_SIZE
    57	SYM_CODE_END(__x86_indirect_thunk_array)
    58	
    59	#ifdef CONFIG_MITIGATION_CALL_DEPTH_TRACKING
    60	.macro CALL_THUNK reg
    61		.align RETPOLINE_THUNK_SIZE
    62	
    63	SYM_INNER_LABEL(__x86_indirect_call_thunk_\reg, SYM_L_GLOBAL)
    64		UNWIND_HINT_UNDEFINED
    65		ANNOTATE_NOENDBR
    66	
    67		POLINE \reg
    68		ANNOTATE_UNRET_SAFE
    69		ret
    70		int3
    71	.endm
    72	
    73		.align RETPOLINE_THUNK_SIZE
    74	SYM_CODE_START(__x86_indirect_call_thunk_array)
    75	
    76	#define GEN(reg) CALL_THUNK reg
  > 77	#include <asm/GEN-for-each-reg.h>
    78	#undef GEN
    79	
    80		.align RETPOLINE_THUNK_SIZE
    81	SYM_CODE_END(__x86_indirect_call_thunk_array)
    82	
    83	.macro JUMP_THUNK reg
    84		.align RETPOLINE_THUNK_SIZE
    85	
    86	SYM_INNER_LABEL(__x86_indirect_jump_thunk_\reg, SYM_L_GLOBAL)
    87		UNWIND_HINT_UNDEFINED
    88		ANNOTATE_NOENDBR
    89		POLINE \reg
    90		ANNOTATE_UNRET_SAFE
    91		ret
    92		int3
    93	.endm
    94	
    95		.align RETPOLINE_THUNK_SIZE
    96	SYM_CODE_START(__x86_indirect_jump_thunk_array)
    97	
    98	#define GEN(reg) JUMP_THUNK reg
  > 99	#include <asm/GEN-for-each-reg.h>
   100	#undef GEN
   101	
   102		.align RETPOLINE_THUNK_SIZE
   103	SYM_CODE_END(__x86_indirect_jump_thunk_array)
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
