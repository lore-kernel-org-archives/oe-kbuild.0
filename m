Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB23F1E7C26
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731068892; cv=none; b=lLrTjcqr+PAjf59IXV+BkzwxWARj+rR+6ARvXa4NCZwvM1c4yp51VxsuD90gg0GiZHyj9iXWFPyCWAU/pOZhjNrUmHfCL0CqzhilwjqTC57GvZrf3KGopP6hxSRiopaeuWtFU5AOO0uyVDRs6JLCu9xoP8qdfazm2nqbmwo2JPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731068892; c=relaxed/simple;
	bh=NGY4B+iIFrN5c6HxZksLpGnvP9XJCGtGSUAv1z+kEOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E4Z8HUqit5QtFJvYyN5tK4PvCuukDev4FrrDzcBgEIYsT7Mnub5LntmEEyFCI9737TJWa4/rUySQMLF59qLufDRUGtSU/+OvZwYh9Gsvj721t1IjAYE9/raFZyA3xXImMzmpR9amVmLsE8fw20ukUBn1ujYjCotMxcPENkX7qx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1WGkHbg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1WGkHbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731068891; x=1762604891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGY4B+iIFrN5c6HxZksLpGnvP9XJCGtGSUAv1z+kEOI=;
  b=F1WGkHbg7bzUHY5t5wmEest2XPYY0yE510X5GxOi5qMh7r0gEtO/ZOLw
   ggTZIWrlVAI+/9IVfXWEkbWOwaY+MRHBrrroUcQuuCvCBdWIHGDJupUGF
   NfxofvIieYBy5rmI6FuhznyOOL0siwHhNBw/y+LX/CGDsDJ7SrTa/3AbR
   quebjT2+ZYfe5P11fLhom/cQ+AKmgzlD0oMccnS5EsBy70WNfQOCZDzvu
   a1KhL7gXHb8Vi2Kq9L1RCAh7TtMVEqI8nFUGxQ6NnaoXdIs6pLYSyt7Dz
   qmNgC+vaRwREgLkAKWuCVyoWP/vj02Q7IpkaNmnHtOTKTh2eUgFtQ+B85
   A==;
X-CSE-ConnectionGUID: IRpQniiHTESOisvRWFIuww==
X-CSE-MsgGUID: er8Vgx3yTgS2pwDehtsWTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41509126"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41509126"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:28:09 -0800
X-CSE-ConnectionGUID: mEis2mbpS5qnI7pbYyUpTg==
X-CSE-MsgGUID: PTglKhhgQHyyHIZm5XQwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90083788"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 04:28:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9O5q-000rPu-0K;
	Fri, 08 Nov 2024 12:28:02 +0000
Date: Fri, 8 Nov 2024 20:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile
 this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
Message-ID: <202411082053.cxHgnubU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   906bd684e4b1e517dd424a354744c5b0aebef8af
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   1 year, 1 month ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm-randconfig-r131-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082053.cxHgnubU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241108/202411082053.cxHgnubU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411082053.cxHgnubU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm/lib/xor-neon.c:14:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
--
   lib/raid6/recov_neon_inner.c: note: in included file:
   /opt/cross/clang-592c0fe55f/lib/clang/20/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/recov_neon_inner.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:16:19: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:16:19: sparse: sparse: got vqtbl1q_u8
   lib/raid6/recov_neon_inner.c:20:33: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:20:33: sparse: sparse: got pair
   lib/raid6/recov_neon_inner.c:21:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:21:9: sparse: sparse: got }
>> lib/raid6/recov_neon_inner.c:23:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid6/recov_neon_inner.c:23:16: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:23:16: sparse: sparse: got vcombine_u8
   lib/raid6/recov_neon_inner.c:25:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:25:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:33:20: sparse: sparse: got pm1
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:34:20: sparse: sparse: got qm0
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:35:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:36:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:51:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:76:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:82:20: sparse: sparse: got qm1
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/recov_neon_inner.c:83:20: sparse: sparse: got x0f
   lib/raid6/recov_neon_inner.c:92:9: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid6/recov_neon_inner.c:92:16: sparse: sparse: missing type declaration for parameter 'bytes'
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: Expected ; at end of statement
   lib/raid6/recov_neon_inner.c:93:28: sparse: sparse: got vx
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/recov_neon_inner.c:111:1: sparse: sparse: got }
   lib/raid6/recov_neon_inner.c:53:17: sparse: sparse: undefined identifier 'px'
   lib/raid6/recov_neon_inner.c:53:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:54:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:54:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:56:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:56:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:57:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:57:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:58:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:58:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:59:17: sparse: sparse: undefined identifier 'qx'
   lib/raid6/recov_neon_inner.c:59:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:61:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:61:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:62:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:62:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:63:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:63:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:64:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:64:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:65:17: sparse: sparse: undefined identifier 'db'
   lib/raid6/recov_neon_inner.c:65:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:67:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:68:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:71:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:72:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:73:17: sparse: sparse: undefined identifier 'dp'
   lib/raid6/recov_neon_inner.c:74:17: sparse: sparse: undefined identifier 'dq'
   lib/raid6/recov_neon_inner.c:95:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:95:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:97:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:97:22: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid6/recov_neon_inner.c:98:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:98:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:99:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:99:22: sparse: sparse: undefined identifier 'vqtbl1q_u8'
   lib/raid6/recov_neon_inner.c:100:17: sparse: sparse: undefined identifier 'vx'
   lib/raid6/recov_neon_inner.c:100:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:101:17: sparse: sparse: undefined identifier 'vy'
   lib/raid6/recov_neon_inner.c:101:22: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/recov_neon_inner.c:103:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:104:17: sparse: sparse: undefined identifier 'vst1q_u8'
   lib/raid6/recov_neon_inner.c:107:17: sparse: sparse: undefined identifier 'p'
   lib/raid6/recov_neon_inner.c:108:17: sparse: sparse: undefined identifier 'q'
   lib/raid6/recov_neon_inner.c:109:17: sparse: sparse: undefined identifier 'dq'

vim +14 arch/arm/lib/xor-neon.c

01956597cbc46d Ard Biesheuvel    2013-05-17  12  
01956597cbc46d Ard Biesheuvel    2013-05-17  13  #ifndef __ARM_NEON__
de9c0d49d85dc5 Nathan Chancellor 2019-02-02 @14  #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
01956597cbc46d Ard Biesheuvel    2013-05-17  15  #endif
01956597cbc46d Ard Biesheuvel    2013-05-17  16  

:::::: The code at line 14 was first introduced by commit
:::::: de9c0d49d85dc563549972edc5589d195cd5e859 ARM: 8833/1: Ensure that NEON code always compiles with Clang

:::::: TO: Nathan Chancellor <natechancellor@gmail.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
