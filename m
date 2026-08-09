Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99113221FB6
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 07:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786262023; cv=none; b=GKnr92hQDldv6X1pUDmgmqvDtsh6opqq45l3NYmn/8wTwjgAUL9bWfseEolf0RMAftrwHBLjOLDM+74U2rwMNVO0mIVaIXHXSAxKMbbfwTYFAU0s2659P+TSOJf3LGqhpNsW/wUpn8dNaUPD5mB84WS/2iPVsT+a1kGKUvHYrKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786262023; c=relaxed/simple;
	bh=BMW5b/rLYrclEBlNUMr7jIYRuzTZw6jzwb33t9FMrNU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C5eTSOHdoLNo1kntZhPIpZtVdK/Yn77xU6va4+x0nOVVW9gJuliVMX7xRIC25tjTcuM4+bMY8WQNEHwv3kC8jdn4OE8JrcBhhWwe9ARp8S9kbtF+P+UH0By7nWKVM4cb8nQTP9EK8hRHlX6SJvkJxwoxMoXB1NcNibrb9pwRrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUbYtF8n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUbYtF8n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786262020; x=1817798020;
  h=date:from:to:cc:subject:message-id;
  bh=BMW5b/rLYrclEBlNUMr7jIYRuzTZw6jzwb33t9FMrNU=;
  b=hUbYtF8nKf1EuYl8c6LgBX8pLWJq1MwSMcSG5zch/bDZSFj41/EWKIMM
   /TG6sTCg6uF9mA1aL0+T3rpzXXHtbKCyneLHGuxfaKMtpvUW/55N++4rV
   cnOYFYfCJ3gPpWNkpkmBdCgufEyOklebUA+Mh1exXsTeP6TZRW1huWhVm
   +lrk2N/3sczXNOORgFt/5oc8OwBGC+do5WaSV6ZsUeMYb3Vbf8aXWFXYY
   JkQfqMioZafJjvyHALcKENNV2trV4A1DK61Q1pqVwVa+jPGH/7+s4bXGi
   A7L6nmeWbIH7uk6klUITF0iZ/8IdNl1mcDl/OyFUF+DN7ZcPDMHgugp7p
   g==;
X-CSE-ConnectionGUID: f+7xnrFnSFWK3CjAmci4fQ==
X-CSE-MsgGUID: 19hFg6DMSdmakm65VzuWhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86568085"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86568085"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 00:53:40 -0700
X-CSE-ConnectionGUID: HoVdzVybSzOFIeeK2u0sgA==
X-CSE-MsgGUID: fhpiNo+cQyS/n+rldnRyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="287463358"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Aug 2026 00:53:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsyLg-00000000Lcf-2kfO;
	Sun, 09 Aug 2026 07:53:36 +0000
Date: Sun, 09 Aug 2026 15:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse:
 Trying to use reserved word 'return' as identifier
Message-ID: <202608091548.TqLCkHZl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 2 months ago
config: arm-randconfig-r122-20260809 (https://download.01.org/0day-ci/archive/20260809/202608091548.TqLCkHZl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091548.TqLCkHZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608091548.TqLCkHZl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/raid6/arm/recov_neon_inner.c: note: in included file:
   ../lib/gcc/arm-linux-gnueabi/11.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
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
