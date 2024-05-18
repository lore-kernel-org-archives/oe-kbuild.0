Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCE29A2
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 04:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716006231; cv=none; b=lJG+1hVVuUWT2QxUhmOGnodPSR23lvUQiseJeGuFxORNsUPWXncpksMnMy8AC5Wpg7yY62SifPrl+tEX9gHe/aBK5VVaSJkhFYdl8Wg/GKB0FU5EzGI5tyLaPEp7GBm5xtOnHt9HCLxLjgNh2SbDvYCOky1JR8hhcDNFhbrC7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716006231; c=relaxed/simple;
	bh=VBFwxYvbJ8XQJYLZexCirXESHhhWubL5nvFSepdRH3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssGU1lECGyKr3ArIEMa6OKLciUYU9VKMB5+JgeEu9WX3pErk1Vx/Tn6V4OTpKAS67rDLd1wp8kRslXsWb+bi5z9GdclLtA7ccI5eCd+swOjSmb/CZRIhz5eK1UkJbHy9E+NCHOX3kLg6bLyWiEEbeRV+gIpxcVjWtjhVDHj8nvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7q822VC; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7q822VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716006228; x=1747542228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VBFwxYvbJ8XQJYLZexCirXESHhhWubL5nvFSepdRH3Y=;
  b=Q7q822VC3vScfKWVheg6Ju6iUuacjzuXiehJ/451KXqyqgknIR0JNu4L
   O72fABNMVwk9LwxlCqwliHwgNA71phBl4RZiN1lrbnCrI/OdA6AxiKwNA
   lsSrmfSPBjx/dqM5yR+ikQ1qqz2mEINnGNF8EkgLMkZN52hRzlrxApydB
   uZTSyYjmaA0SlJ/2+wUv7FPdz0Y81fIn+q8UqVXtT3vTRvX6YWBW0lQnC
   gfevgpDQxmOwv7V6f3XgQIdYJKf52b297jlVpgyvCneC+N5Ino3ySErBp
   mWu9NVFjK/31W6LEnYv1Bt6F1fdfc3umgncvsP/yiSk3pEUnaKTOU8cLB
   g==;
X-CSE-ConnectionGUID: hQ9hJAQlSbaztfhZJQ1kyw==
X-CSE-MsgGUID: pmD/4ixSS/mtQZBsukeC+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16031700"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="16031700"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 21:23:47 -0700
X-CSE-ConnectionGUID: sLmyecOYSzOP23RU5TSdUg==
X-CSE-MsgGUID: 7HwDAIlMTgOa0Ngvb6cA7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="62836577"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2024 21:23:45 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Bbj-0001cC-1a;
	Sat, 18 May 2024 04:23:43 +0000
Date: Sat, 18 May 2024 12:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2:
 sparse: sparse: "NEON intrinsics not available with the soft-float ABI.
 Please use -mfloat-abi=softfp or -mfloat-abi=hard"
Message-ID: <202405181255.qMUhAboE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4b377b4868ef17b040065bd468668c707d2477a5
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r111-20240517 (https://download.01.org/0day-ci/archive/20240518/202405181255.qMUhAboE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce: (https://download.01.org/0day-ci/archive/20240518/202405181255.qMUhAboE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405181255.qMUhAboE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid6/neon2.c: note: in included file:
>> /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/neon2.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/neon2.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:30:20: sparse: sparse: got unative_t
   lib/raid6/neon2.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid6/neon2.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:41:1: sparse: sparse: got }
   lib/raid6/neon2.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:50:1: sparse: sparse: got }
   lib/raid6/neon2.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:55:1: sparse: sparse: got }
   lib/raid6/neon2.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:60:17: sparse: sparse: got *
   lib/raid6/neon2.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:63:28: sparse: sparse: got wd0
   lib/raid6/neon2.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:64:28: sparse: sparse: got wd1
   lib/raid6/neon2.c:65:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:65:25: sparse: sparse: got x1d
   lib/raid6/neon2.c:71:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:71:17: sparse: sparse: got =
   lib/raid6/neon2.c:71:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon2.c:71:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:71:25: sparse: sparse: got <
   lib/raid6/neon2.c:71:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:71:37: sparse: sparse: got +=
   lib/raid6/neon2.c:74:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:74:25: sparse: sparse: got =
   lib/raid6/neon2.c:74:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon2.c:74:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:74:36: sparse: sparse: got >=
   lib/raid6/neon2.c:74:44: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:74:44: sparse: sparse: got --
   lib/raid6/neon2.c:90:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:90:17: sparse: sparse: got }
   lib/raid6/neon2.c:92:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:92:26: sparse: sparse: got &
   lib/raid6/neon2.c:93:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:93:26: sparse: sparse: got &
   lib/raid6/neon2.c:94:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:94:26: sparse: sparse: got &
   lib/raid6/neon2.c:95:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:95:9: sparse: sparse: got }
   lib/raid6/neon2.c:102:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:102:17: sparse: sparse: got *
   lib/raid6/neon2.c:105:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:105:28: sparse: sparse: got wd0
   lib/raid6/neon2.c:106:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:106:28: sparse: sparse: got wd1
   lib/raid6/neon2.c:107:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:107:25: sparse: sparse: got x1d
   lib/raid6/neon2.c:113:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:113:17: sparse: sparse: got =
   lib/raid6/neon2.c:113:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon2.c:113:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:113:25: sparse: sparse: got <
   lib/raid6/neon2.c:113:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:113:37: sparse: sparse: got +=
   lib/raid6/neon2.c:120:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:120:25: sparse: sparse: got =
   lib/raid6/neon2.c:120:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon2.c:120:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:120:36: sparse: sparse: got >=
   lib/raid6/neon2.c:120:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:120:48: sparse: sparse: got --
   lib/raid6/neon2.c:136:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:136:17: sparse: sparse: got }
   lib/raid6/neon2.c:138:39: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:138:39: sparse: sparse: got >=
   lib/raid6/neon2.c:138:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:138:48: sparse: sparse: got -=
   lib/raid6/neon2.c:148:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:148:17: sparse: sparse: got }
   lib/raid6/neon2.c:161:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon2.c:162:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon2.c:162:22: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:162:22: sparse: sparse: got 1
   lib/raid6/neon2.c:172:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon2.c:173:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon2.c:173:22: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon2.c:173:22: sparse: sparse: got 0
   lib/raid6/neon2.c:183:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:183:17: sparse: sparse: got }
   lib/raid6/neon2.c:189:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:189:26: sparse: sparse: got &
   lib/raid6/neon2.c:190:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:190:26: sparse: sparse: got &
   lib/raid6/neon2.c:191:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:191:26: sparse: sparse: got &
   lib/raid6/neon2.c:192:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon2.c:192:26: sparse: sparse: got &
   lib/raid6/neon2.c:193:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon2.c:193:9: sparse: sparse: got }
   lib/raid6/neon2.c:65:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid6/neon2.c:65:15: sparse:    int static const [toplevel] unative_t
   lib/raid6/neon2.c:64:18: sparse: note: previously declared as:
--
   lib/raid6/recov_neon_inner.c: note: in included file:
>> /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/recov_neon_inner.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/recov_neon_inner.c:28:50: sparse: sparse: got *
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
--
   lib/raid6/neon4.c: note: in included file:
>> /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/neon4.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/neon4.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:30:20: sparse: sparse: got unative_t
   lib/raid6/neon4.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid6/neon4.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:41:1: sparse: sparse: got }
   lib/raid6/neon4.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:50:1: sparse: sparse: got }
   lib/raid6/neon4.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:55:1: sparse: sparse: got }
   lib/raid6/neon4.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:60:17: sparse: sparse: got *
   lib/raid6/neon4.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:63:28: sparse: sparse: got wd0
   lib/raid6/neon4.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:64:28: sparse: sparse: got wd1
   lib/raid6/neon4.c:65:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:65:28: sparse: sparse: got wd2
   lib/raid6/neon4.c:66:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:66:28: sparse: sparse: got wd3
   lib/raid6/neon4.c:67:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:67:25: sparse: sparse: got x1d
   lib/raid6/neon4.c:73:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:73:17: sparse: sparse: got =
   lib/raid6/neon4.c:73:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon4.c:73:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:73:25: sparse: sparse: got <
   lib/raid6/neon4.c:73:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:73:37: sparse: sparse: got +=
   lib/raid6/neon4.c:78:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:78:25: sparse: sparse: got =
   lib/raid6/neon4.c:78:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon4.c:78:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:78:36: sparse: sparse: got >=
   lib/raid6/neon4.c:78:44: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:78:44: sparse: sparse: got --
   lib/raid6/neon4.c:108:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:108:17: sparse: sparse: got }
   lib/raid6/neon4.c:110:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:110:26: sparse: sparse: got &
   lib/raid6/neon4.c:111:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:111:26: sparse: sparse: got &
   lib/raid6/neon4.c:112:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:112:26: sparse: sparse: got &
   lib/raid6/neon4.c:113:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:113:26: sparse: sparse: got &
   lib/raid6/neon4.c:114:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:114:26: sparse: sparse: got &
   lib/raid6/neon4.c:115:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:115:26: sparse: sparse: got &
   lib/raid6/neon4.c:116:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:116:26: sparse: sparse: got &
   lib/raid6/neon4.c:117:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:117:9: sparse: sparse: got }
   lib/raid6/neon4.c:124:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:124:17: sparse: sparse: got *
   lib/raid6/neon4.c:127:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:127:28: sparse: sparse: got wd0
   lib/raid6/neon4.c:128:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:128:28: sparse: sparse: got wd1
   lib/raid6/neon4.c:129:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:129:28: sparse: sparse: got wd2
   lib/raid6/neon4.c:130:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:130:28: sparse: sparse: got wd3
   lib/raid6/neon4.c:131:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:131:25: sparse: sparse: got x1d
   lib/raid6/neon4.c:137:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:137:17: sparse: sparse: got =
   lib/raid6/neon4.c:137:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon4.c:137:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:137:25: sparse: sparse: got <
   lib/raid6/neon4.c:137:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:137:37: sparse: sparse: got +=
   lib/raid6/neon4.c:148:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon4.c:148:25: sparse: sparse: got =
   lib/raid6/neon4.c:148:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon4.c:148:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:148:36: sparse: sparse: got >=
   lib/raid6/neon4.c:148:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:148:48: sparse: sparse: got --
   lib/raid6/neon4.c:178:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:178:17: sparse: sparse: got }
   lib/raid6/neon4.c:180:39: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:180:39: sparse: sparse: got >=
   lib/raid6/neon4.c:180:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:180:48: sparse: sparse: got -=
   lib/raid6/neon4.c:198:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon4.c:198:17: sparse: sparse: got }
   lib/raid6/neon4.c:219:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon4.c:220:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon4.c:220:22: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon4.c:220:22: sparse: sparse: got 1
   lib/raid6/neon4.c:238:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon4.c:239:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon4.c:239:22: sparse: sparse: Expected ; at end of declaration
--
   lib/raid6/neon8.c: note: in included file:
>> /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/neon8.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/neon8.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:30:20: sparse: sparse: got unative_t
   lib/raid6/neon8.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid6/neon8.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon8.c:41:1: sparse: sparse: got }
   lib/raid6/neon8.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon8.c:50:1: sparse: sparse: got }
   lib/raid6/neon8.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon8.c:55:1: sparse: sparse: got }
   lib/raid6/neon8.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:60:17: sparse: sparse: got *
   lib/raid6/neon8.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:63:28: sparse: sparse: got wd0
   lib/raid6/neon8.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:64:28: sparse: sparse: got wd1
   lib/raid6/neon8.c:65:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:65:28: sparse: sparse: got wd2
   lib/raid6/neon8.c:66:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:66:28: sparse: sparse: got wd3
   lib/raid6/neon8.c:67:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:67:28: sparse: sparse: got wd4
   lib/raid6/neon8.c:68:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:68:28: sparse: sparse: got wd5
   lib/raid6/neon8.c:69:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:69:28: sparse: sparse: got wd6
   lib/raid6/neon8.c:70:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:70:28: sparse: sparse: got wd7
   lib/raid6/neon8.c:71:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:71:25: sparse: sparse: got x1d
   lib/raid6/neon8.c:77:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:77:17: sparse: sparse: got =
   lib/raid6/neon8.c:77:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon8.c:77:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:77:25: sparse: sparse: got <
   lib/raid6/neon8.c:77:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:77:37: sparse: sparse: got +=
   lib/raid6/neon8.c:86:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:86:25: sparse: sparse: got =
   lib/raid6/neon8.c:86:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon8.c:86:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:86:36: sparse: sparse: got >=
   lib/raid6/neon8.c:86:44: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:86:44: sparse: sparse: got --
   lib/raid6/neon8.c:144:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon8.c:144:17: sparse: sparse: got }
   lib/raid6/neon8.c:146:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:146:26: sparse: sparse: got &
   lib/raid6/neon8.c:147:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:147:26: sparse: sparse: got &
   lib/raid6/neon8.c:148:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:148:26: sparse: sparse: got &
   lib/raid6/neon8.c:149:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:149:26: sparse: sparse: got &
   lib/raid6/neon8.c:150:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:150:26: sparse: sparse: got &
   lib/raid6/neon8.c:151:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:151:26: sparse: sparse: got &
   lib/raid6/neon8.c:152:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:152:26: sparse: sparse: got &
   lib/raid6/neon8.c:153:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:153:26: sparse: sparse: got &
   lib/raid6/neon8.c:154:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:154:26: sparse: sparse: got &
   lib/raid6/neon8.c:155:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:155:26: sparse: sparse: got &
   lib/raid6/neon8.c:156:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:156:26: sparse: sparse: got &
   lib/raid6/neon8.c:157:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:157:26: sparse: sparse: got &
   lib/raid6/neon8.c:158:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:158:26: sparse: sparse: got &
   lib/raid6/neon8.c:159:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:159:26: sparse: sparse: got &
   lib/raid6/neon8.c:160:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon8.c:160:26: sparse: sparse: got &
   lib/raid6/neon8.c:161:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon8.c:161:9: sparse: sparse: got }
   lib/raid6/neon8.c:168:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:168:17: sparse: sparse: got *
   lib/raid6/neon8.c:171:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:171:28: sparse: sparse: got wd0
   lib/raid6/neon8.c:172:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:172:28: sparse: sparse: got wd1
   lib/raid6/neon8.c:173:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:173:28: sparse: sparse: got wd2
   lib/raid6/neon8.c:174:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:174:28: sparse: sparse: got wd3
   lib/raid6/neon8.c:175:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:175:28: sparse: sparse: got wd4
   lib/raid6/neon8.c:176:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:176:28: sparse: sparse: got wd5
   lib/raid6/neon8.c:177:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon8.c:177:28: sparse: sparse: got wd6
   lib/raid6/neon8.c:178:28: sparse: sparse: Expected ; at end of declaration
--
   lib/raid6/neon1.c: note: in included file:
>> /opt/cross/clang-fa9b1be450/lib/clang/19/include/arm_neon.h:28:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI. Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid6/neon1.c: note: in included file:
   lib/raid6/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:15:50: sparse: sparse: got *
   lib/raid6/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon.h:19:50: sparse: sparse: got *
   lib/raid6/neon1.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:30:20: sparse: sparse: got unative_t
   lib/raid6/neon1.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid6/neon1.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:41:1: sparse: sparse: got }
   lib/raid6/neon1.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:50:1: sparse: sparse: got }
   lib/raid6/neon1.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:55:1: sparse: sparse: got }
   lib/raid6/neon1.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:60:17: sparse: sparse: got *
   lib/raid6/neon1.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:63:28: sparse: sparse: got wd0
   lib/raid6/neon1.c:64:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:64:25: sparse: sparse: got x1d
   lib/raid6/neon1.c:70:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:70:17: sparse: sparse: got =
   lib/raid6/neon1.c:70:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon1.c:70:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:70:25: sparse: sparse: got <
   lib/raid6/neon1.c:70:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:70:37: sparse: sparse: got +=
   lib/raid6/neon1.c:72:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:72:25: sparse: sparse: got =
   lib/raid6/neon1.c:72:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon1.c:72:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:72:36: sparse: sparse: got >=
   lib/raid6/neon1.c:72:44: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:72:44: sparse: sparse: got --
   lib/raid6/neon1.c:81:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:81:17: sparse: sparse: got }
   lib/raid6/neon1.c:83:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:83:26: sparse: sparse: got &
   lib/raid6/neon1.c:84:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:84:9: sparse: sparse: got }
   lib/raid6/neon1.c:91:17: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:91:17: sparse: sparse: got *
   lib/raid6/neon1.c:94:28: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:94:28: sparse: sparse: got wd0
   lib/raid6/neon1.c:95:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:95:25: sparse: sparse: got x1d
   lib/raid6/neon1.c:101:17: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:101:17: sparse: sparse: got =
   lib/raid6/neon1.c:101:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon1.c:101:25: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:101:25: sparse: sparse: got <
   lib/raid6/neon1.c:101:37: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:101:37: sparse: sparse: got +=
   lib/raid6/neon1.c:106:25: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:106:25: sparse: sparse: got =
   lib/raid6/neon1.c:106:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid6/neon1.c:106:36: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:106:36: sparse: sparse: got >=
   lib/raid6/neon1.c:106:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:106:48: sparse: sparse: got --
   lib/raid6/neon1.c:115:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:115:17: sparse: sparse: got }
   lib/raid6/neon1.c:117:39: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:117:39: sparse: sparse: got >=
   lib/raid6/neon1.c:117:48: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:117:48: sparse: sparse: got -=
   lib/raid6/neon1.c:123:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:123:17: sparse: sparse: got }
   lib/raid6/neon1.c:132:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon1.c:133:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon1.c:133:22: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:133:22: sparse: sparse: got 1
   lib/raid6/neon1.c:139:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid6/neon1.c:140:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid6/neon1.c:140:22: sparse: sparse: Expected ; at end of declaration
   lib/raid6/neon1.c:140:22: sparse: sparse: got 0
   lib/raid6/neon1.c:146:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:146:17: sparse: sparse: got }
   lib/raid6/neon1.c:150:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:150:26: sparse: sparse: got &
   lib/raid6/neon1.c:151:26: sparse: sparse: Expected ) in function declarator
   lib/raid6/neon1.c:151:26: sparse: sparse: got &
   lib/raid6/neon1.c:152:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/neon1.c:152:9: sparse: sparse: got }
   lib/raid6/neon1.c:64:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid6/neon1.c:64:15: sparse:    int static const [toplevel] unative_t
   lib/raid6/neon1.c:63:18: sparse: note: previously declared as:
   lib/raid6/neon1.c:63:18: sparse:    int register static [toplevel] unative_t
   lib/raid6/neon1.c:66:14: sparse: sparse: undefined identifier 'disks'
   lib/raid6/neon1.c:67:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/neon1.c:68:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/neon1.c:74:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/neon1.c:75:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/neon1.c:76:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/neon1.c:78:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid6/neon1.c:78:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid6/neon1.c:75)
   lib/raid6/neon1.c:79:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid6/neon1.c:79:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid6/neon1.c:76)
   lib/raid6/neon1.c:80:31: sparse: sparse: undefined identifier 'veorq_u8'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
