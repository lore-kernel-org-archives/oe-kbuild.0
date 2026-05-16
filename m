Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAE7E105
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964965; cv=none; b=shAfqK9TIHsc4G2dqzamVLXdCGhtr1fmuGxGjtsMomC5MIz1bbXcnN7qD9ddVGfCkRn/VxQBeHsGRK8fp0j041iHQYVsLPaHcBd7Gb1gwEMIMHG5XZjp8Jf7swywTmq2aC2m+IKJ5s88lJ5F3m5SYoavYkhQ0IBOy/j7I+DKhHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964965; c=relaxed/simple;
	bh=YWHFIO+cWVkSgHL7HyqorfilbwZKOdvKK5KY3+1zRZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ks3zeNu8QRRVxm66adwgQqccc11ZD+J/dE2sRKnZQxEmLw4+EHQFLeI1Z/vHLfOj2hJ3qZ0wGBjrnbzUDX9rMQMm17GrMCLLnNR4ABvHaiXAFLIIaa+gMJRS4CU79kEcRp1mBveld2UWqsqgshOjo90J7P1fGJlPhA9APbsIoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXpZdABc; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXpZdABc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778964960; x=1810500960;
  h=date:from:to:cc:subject:message-id;
  bh=YWHFIO+cWVkSgHL7HyqorfilbwZKOdvKK5KY3+1zRZ4=;
  b=VXpZdABcFMqN+ogMvf7TX+3B/brAD+H/pkeRFXC7a6hsC2/fPILSxNOn
   M7mLYYS0oaTG6Y14xaXxMHSdU/MRGJuDGOdEu6XOU3+l7YVQs3PRXDbHM
   lR82fsVV+YD8A4Ozco7Rj12LV/bSXj5dYIui/vRCkaHflOXqXb4ndMPg8
   hiozTk1ingUbBiLGrCmIhwDs77DfqQuO2hTU1Sdfid7b60vIS3pACRRn4
   FfvHVa1JYZ8sfjr+VNZuxcS/MIlbfJgjNBwfL6bBv2/njU5LBO1I6pT0T
   2snDahm52Cam+VJDRDITOYv47jV2Kd7v9CWkeK3tiAL5mRF9AQ2kDwcUE
   A==;
X-CSE-ConnectionGUID: vykpk0xfRg+EN9w7Wmxp5w==
X-CSE-MsgGUID: wdOwmI2uQJi08n9IXGqKJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="97308440"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="97308440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 13:55:59 -0700
X-CSE-ConnectionGUID: SM24nKAXRq+eAMZKiXB/Yg==
X-CSE-MsgGUID: vFU64vIoTtmc5HwzUyw7Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="243347389"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 May 2026 13:55:57 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOM38-0000000016w-30C2;
	Sat, 16 May 2026 20:55:54 +0000
Date: Sun, 17 May 2026 04:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-misc:lib-raid6 3/18]
 lib/raid/raid6/arm/recov_neon_inner.c:23:9: sparse: sparse: Trying to use
 reserved word 'return' as identifier
Message-ID: <202605170430.bqPbbzo2-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   11236a28a5cbe18d609403e76eca326111f1c69c
commit: 4abfdc520cb1ac310d4f44c653c5c9cec2bfdec1 [3/18] raid6: move to lib/raid/
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-r131-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170430.bqPbbzo2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170430.bqPbbzo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605170430.bqPbbzo2-lkp@intel.com/

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
>> lib/raid/raid6/arm/recov_neon_inner.c:50:9: sparse: sparse: Trying to use reserved word 'while' as identifier
>> lib/raid/raid6/arm/recov_neon_inner.c:50:16: sparse: sparse: missing type declaration for parameter 'bytes'
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
--
   lib/raid/raid6/arm/neon2.c: note: in included file:
   ../lib/gcc/arm-linux-gnueabi/11.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/neon2.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon2.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:30:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon2.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon2.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:41:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:50:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:60:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon2.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:63:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon2.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:64:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon2.c:65:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:65:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon2.c:71:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:71:17: sparse: sparse: got =
>> lib/raid/raid6/arm/neon2.c:71:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:71:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:71:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon2.c:71:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:71:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon2.c:74:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:74:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon2.c:74:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:74:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:74:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon2.c:74:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:74:44: sparse: sparse: got --
   lib/raid/raid6/arm/neon2.c:90:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:90:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:92:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:92:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:93:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:93:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:94:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:94:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:95:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:95:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:102:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:102:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon2.c:105:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:105:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon2.c:106:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:106:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon2.c:107:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:107:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon2.c:113:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:113:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon2.c:113:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:113:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:113:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon2.c:113:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:113:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon2.c:120:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:120:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon2.c:120:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:120:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:120:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon2.c:120:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:120:48: sparse: sparse: got --
   lib/raid/raid6/arm/neon2.c:136:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:136:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:138:39: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:138:39: sparse: sparse: got >=
   lib/raid/raid6/arm/neon2.c:138:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:138:48: sparse: sparse: got -=
   lib/raid/raid6/arm/neon2.c:148:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:148:17: sparse: sparse: got }
>> lib/raid/raid6/arm/neon2.c:161:25: sparse: sparse: Trying to use reserved word 'break' as identifier
>> lib/raid/raid6/arm/neon2.c:162:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon2.c:162:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:162:22: sparse: sparse: got 1
   lib/raid/raid6/arm/neon2.c:172:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid/raid6/arm/neon2.c:173:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon2.c:173:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:173:22: sparse: sparse: got 0
   lib/raid/raid6/arm/neon2.c:183:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:183:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:189:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:189:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:190:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:190:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:191:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:191:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:192:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:192:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:193:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:193:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:65:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon2.c:65:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:64:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon2.c:64:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:67:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon2.c:68:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon2.c:69:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon2.c:73:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/arm/neon2.c:73:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon2.c:76:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon2.c:77:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:78:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:79:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon2.c:80:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon2.c:81:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon2.c:82:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon2.c:84:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon2.c:84:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:79)
   lib/raid/raid6/arm/neon2.c:85:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon2.c:85:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:80)
   lib/raid/raid6/arm/neon2.c:86:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:86:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:81)
   lib/raid/raid6/arm/neon2.c:87:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:87:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:82)
   lib/raid/raid6/arm/neon2.c:88:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:89:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:89:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:73)
   lib/raid/raid6/arm/neon2.c:105:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon2.c:105:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:65:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon2.c:65:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:106:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon2.c:106:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:65:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon2.c:65:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:107:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon2.c:107:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:106:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon2.c:106:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon2.c:109:14: sparse: sparse: undefined identifier 'stop'
   lib/raid/raid6/arm/neon2.c:109:9: sparse: sparse: symbol 'z0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:67)
   lib/raid/raid6/arm/neon2.c:110:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon2.c:110:18: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon2.c:110:9: sparse: sparse: symbol 'p' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:68)
   lib/raid/raid6/arm/neon2.c:111:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon2.c:111:18: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon2.c:111:9: sparse: sparse: symbol 'q' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:69)
   lib/raid/raid6/arm/neon2.c:115:23: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon2.c:115:17: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:89)
   lib/raid/raid6/arm/neon2.c:116:23: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:116:17: sparse: sparse: symbol 'wp0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:77)
   lib/raid/raid6/arm/neon2.c:117:23: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:117:17: sparse: sparse: symbol 'wp1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:78)
   lib/raid/raid6/arm/neon2.c:122:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon2.c:122:25: sparse: sparse: symbol 'wd1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:76)
   lib/raid/raid6/arm/neon2.c:123:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:123:25: sparse: sparse: symbol 'wp0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:116)
   lib/raid/raid6/arm/neon2.c:124:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:124:25: sparse: sparse: symbol 'wp1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:117)
   lib/raid/raid6/arm/neon2.c:125:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon2.c:125:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:84)
   lib/raid/raid6/arm/neon2.c:126:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon2.c:126:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:85)
   lib/raid/raid6/arm/neon2.c:127:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon2.c:127:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:86)
   lib/raid/raid6/arm/neon2.c:128:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon2.c:128:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:87)
   lib/raid/raid6/arm/neon2.c:130:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon2.c:130:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:125)
   lib/raid/raid6/arm/neon2.c:131:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon2.c:131:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:126)
   lib/raid/raid6/arm/neon2.c:132:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:132:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:127)
   lib/raid/raid6/arm/neon2.c:133:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:133:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:128)
   lib/raid/raid6/arm/neon2.c:134:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:134:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:88)
   lib/raid/raid6/arm/neon2.c:135:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon2.c:135:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:115)
   lib/raid/raid6/arm/neon2.c:140:31: sparse: sparse: undefined identifier 'vshrq_n_u8'
   lib/raid/raid6/arm/neon2.c:140:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon2.c:131)
   lib/raid/raid6/arm/neon2.c:141:31: sparse: sparse: undefined identifier 'vshlq_n_u8'
--
   lib/raid/raid6/arm/neon4.c: note: in included file:
   ../lib/gcc/arm-linux-gnueabi/11.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/neon4.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon4.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:30:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon4.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon4.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:41:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:50:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:60:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon4.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:63:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon4.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:64:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon4.c:65:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:65:28: sparse: sparse: got wd2
   lib/raid/raid6/arm/neon4.c:66:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:66:28: sparse: sparse: got wd3
   lib/raid/raid6/arm/neon4.c:67:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:67:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon4.c:73:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:73:17: sparse: sparse: got =
>> lib/raid/raid6/arm/neon4.c:73:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:73:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:73:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon4.c:73:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:73:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon4.c:78:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:78:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon4.c:78:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:78:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:78:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon4.c:78:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:78:44: sparse: sparse: got --
   lib/raid/raid6/arm/neon4.c:108:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:108:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:110:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:110:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:111:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:111:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:112:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:112:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:113:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:113:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:114:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:114:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:115:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:115:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:116:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:116:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:117:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:117:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:124:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:124:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon4.c:127:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:127:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon4.c:128:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:128:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon4.c:129:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:129:28: sparse: sparse: got wd2
   lib/raid/raid6/arm/neon4.c:130:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:130:28: sparse: sparse: got wd3
   lib/raid/raid6/arm/neon4.c:131:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:131:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon4.c:137:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:137:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon4.c:137:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:137:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:137:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon4.c:137:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:137:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon4.c:148:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:148:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon4.c:148:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:148:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:148:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon4.c:148:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:148:48: sparse: sparse: got --
   lib/raid/raid6/arm/neon4.c:178:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:178:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:180:39: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:180:39: sparse: sparse: got >=
   lib/raid/raid6/arm/neon4.c:180:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:180:48: sparse: sparse: got -=
   lib/raid/raid6/arm/neon4.c:198:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:198:17: sparse: sparse: got }
>> lib/raid/raid6/arm/neon4.c:219:25: sparse: sparse: Trying to use reserved word 'break' as identifier
>> lib/raid/raid6/arm/neon4.c:220:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon4.c:220:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:220:22: sparse: sparse: got 1
   lib/raid/raid6/arm/neon4.c:238:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid/raid6/arm/neon4.c:239:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon4.c:239:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:239:22: sparse: sparse: got 0
   lib/raid/raid6/arm/neon4.c:257:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:257:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:267:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:267:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:268:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:268:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:269:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:269:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:270:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:270:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:271:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:271:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:272:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:272:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:273:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:273:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:274:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:274:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:275:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:275:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:67:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:67:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:66:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:66:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:69:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon4.c:70:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon4.c:71:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon4.c:75:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/arm/neon4.c:75:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:76:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/arm/neon4.c:76:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:77:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/arm/neon4.c:77:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:80:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:81:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:82:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon4.c:83:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:84:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:85:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:86:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:87:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon4.c:88:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon4.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon4.c:90:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon4.c:91:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon4.c:92:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon4.c:93:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon4.c:94:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon4.c:96:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon4.c:96:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:87)
   lib/raid/raid6/arm/neon4.c:97:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon4.c:97:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:88)
   lib/raid/raid6/arm/neon4.c:98:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon4.c:98:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:89)
   lib/raid/raid6/arm/neon4.c:99:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon4.c:99:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:90)
   lib/raid/raid6/arm/neon4.c:100:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:100:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:91)
   lib/raid/raid6/arm/neon4.c:101:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:101:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:92)
   lib/raid/raid6/arm/neon4.c:102:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:102:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:93)
   lib/raid/raid6/arm/neon4.c:103:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:103:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:94)
   lib/raid/raid6/arm/neon4.c:104:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:105:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:105:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:75)
   lib/raid/raid6/arm/neon4.c:106:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:106:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:76)
   lib/raid/raid6/arm/neon4.c:107:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon4.c:107:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:77)
   lib/raid/raid6/arm/neon4.c:127:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:127:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:67:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:67:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:128:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:128:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:67:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:67:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:129:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:129:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:67:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:67:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:130:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:130:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:67:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:67:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:131:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon4.c:131:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:130:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon4.c:130:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon4.c:133:14: sparse: sparse: undefined identifier 'stop'
   lib/raid/raid6/arm/neon4.c:133:9: sparse: sparse: symbol 'z0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon4.c:69)
   lib/raid/raid6/arm/neon4.c:134:13: sparse: sparse: undefined identifier 'dptr'
--
   lib/raid/raid6/arm/neon1.c: note: in included file:
   ../lib/gcc/arm-linux-gnueabi/11.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/neon1.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon1.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:30:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon1.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon1.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:41:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:50:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:60:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon1.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:63:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon1.c:64:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:64:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon1.c:70:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:70:17: sparse: sparse: got =
>> lib/raid/raid6/arm/neon1.c:70:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:70:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:70:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon1.c:70:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:70:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon1.c:72:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:72:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon1.c:72:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:72:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:72:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon1.c:72:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:72:44: sparse: sparse: got --
   lib/raid/raid6/arm/neon1.c:81:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:81:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:83:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:83:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:84:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:84:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:91:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:91:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon1.c:94:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:94:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon1.c:95:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:95:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon1.c:101:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:101:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon1.c:101:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:101:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:101:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon1.c:101:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:101:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon1.c:106:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:106:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon1.c:106:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:106:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:106:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon1.c:106:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:106:48: sparse: sparse: got --
   lib/raid/raid6/arm/neon1.c:115:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:115:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:117:39: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:117:39: sparse: sparse: got >=
   lib/raid/raid6/arm/neon1.c:117:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:117:48: sparse: sparse: got -=
   lib/raid/raid6/arm/neon1.c:123:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:123:17: sparse: sparse: got }
>> lib/raid/raid6/arm/neon1.c:132:25: sparse: sparse: Trying to use reserved word 'break' as identifier
>> lib/raid/raid6/arm/neon1.c:133:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon1.c:133:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:133:22: sparse: sparse: got 1
   lib/raid/raid6/arm/neon1.c:139:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid/raid6/arm/neon1.c:140:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon1.c:140:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:140:22: sparse: sparse: got 0
   lib/raid/raid6/arm/neon1.c:146:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:146:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:150:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:150:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:151:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:151:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:152:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:152:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:64:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon1.c:64:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:63:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon1.c:63:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:66:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon1.c:67:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon1.c:68:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon1.c:74:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:75:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon1.c:76:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon1.c:78:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon1.c:78:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:75)
   lib/raid/raid6/arm/neon1.c:79:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:79:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:76)
   lib/raid/raid6/arm/neon1.c:80:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:94:18: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon1.c:94:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:64:15: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon1.c:64:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:95:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon1.c:95:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:94:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon1.c:94:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon1.c:97:14: sparse: sparse: undefined identifier 'stop'
   lib/raid/raid6/arm/neon1.c:97:9: sparse: sparse: symbol 'z0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:66)
   lib/raid/raid6/arm/neon1.c:98:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon1.c:98:18: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon1.c:98:9: sparse: sparse: symbol 'p' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:67)
   lib/raid/raid6/arm/neon1.c:99:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon1.c:99:18: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon1.c:99:9: sparse: sparse: symbol 'q' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:68)
   lib/raid/raid6/arm/neon1.c:103:23: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:103:17: sparse: sparse: symbol 'wp0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:74)
   lib/raid/raid6/arm/neon1.c:108:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:108:25: sparse: sparse: symbol 'wp0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:103)
   lib/raid/raid6/arm/neon1.c:109:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon1.c:109:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:78)
   lib/raid/raid6/arm/neon1.c:110:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon1.c:110:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:79)
   lib/raid/raid6/arm/neon1.c:112:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon1.c:112:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:109)
   lib/raid/raid6/arm/neon1.c:113:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:113:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:110)
   lib/raid/raid6/arm/neon1.c:114:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:114:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:80)
   lib/raid/raid6/arm/neon1.c:119:31: sparse: sparse: undefined identifier 'vshlq_n_u8'
   lib/raid/raid6/arm/neon1.c:119:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:113)
   lib/raid/raid6/arm/neon1.c:121:31: sparse: sparse: undefined identifier 'PMUL'
   lib/raid/raid6/arm/neon1.c:121:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:112)
   lib/raid/raid6/arm/neon1.c:122:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:122:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:114)
   lib/raid/raid6/arm/neon1.c:128:31: sparse: sparse: undefined identifier 'vshlq_n_u8'
   lib/raid/raid6/arm/neon1.c:128:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:119)
   lib/raid/raid6/arm/neon1.c:130:31: sparse: sparse: undefined identifier 'PMUL'
   lib/raid/raid6/arm/neon1.c:130:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:121)
   lib/raid/raid6/arm/neon1.c:131:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:131:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:122)
   lib/raid/raid6/arm/neon1.c:135:31: sparse: sparse: undefined identifier 'vshlq_n_u8'
   lib/raid/raid6/arm/neon1.c:135:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:128)
   lib/raid/raid6/arm/neon1.c:137:31: sparse: sparse: undefined identifier 'PMUL'
   lib/raid/raid6/arm/neon1.c:137:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:130)
   lib/raid/raid6/arm/neon1.c:138:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:138:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:131)
   lib/raid/raid6/arm/neon1.c:142:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon1.c:142:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:135)
   lib/raid/raid6/arm/neon1.c:144:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon1.c:144:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:137)
   lib/raid/raid6/arm/neon1.c:145:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:145:25: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:138)
   lib/raid/raid6/arm/neon1.c:148:23: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon1.c:148:17: sparse: sparse: symbol 'wq0' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon1.c:145)
--
   lib/raid/raid6/arm/neon8.c: note: in included file:
   ../lib/gcc/arm-linux-gnueabi/11.5.0/include/arm_neon.h:31:2: sparse: sparse: "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
   lib/raid/raid6/arm/neon8.c: note: in included file:
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:15:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon.h:19:50: sparse: sparse: got *
   lib/raid/raid6/arm/neon8.c:30:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:30:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon8.c:38:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:38:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon8.c:41:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:41:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:50:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:50:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:60:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:60:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon8.c:63:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:63:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon8.c:64:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:64:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon8.c:65:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:65:28: sparse: sparse: got wd2
   lib/raid/raid6/arm/neon8.c:66:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:66:28: sparse: sparse: got wd3
   lib/raid/raid6/arm/neon8.c:67:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:67:28: sparse: sparse: got wd4
   lib/raid/raid6/arm/neon8.c:68:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:68:28: sparse: sparse: got wd5
   lib/raid/raid6/arm/neon8.c:69:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:69:28: sparse: sparse: got wd6
   lib/raid/raid6/arm/neon8.c:70:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:70:28: sparse: sparse: got wd7
   lib/raid/raid6/arm/neon8.c:71:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:71:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon8.c:77:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:77:17: sparse: sparse: got =
>> lib/raid/raid6/arm/neon8.c:77:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon8.c:77:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:77:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon8.c:77:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:77:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon8.c:86:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:86:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon8.c:86:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon8.c:86:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:86:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon8.c:86:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:86:44: sparse: sparse: got --
   lib/raid/raid6/arm/neon8.c:144:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:144:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:146:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:146:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:147:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:147:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:148:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:148:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:149:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:149:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:150:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:150:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:151:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:151:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:152:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:152:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:153:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:153:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:154:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:154:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:155:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:155:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:156:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:156:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:157:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:157:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:158:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:158:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:159:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:159:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:160:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:160:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:161:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:161:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:168:17: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:168:17: sparse: sparse: got *
   lib/raid/raid6/arm/neon8.c:171:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:171:28: sparse: sparse: got wd0
   lib/raid/raid6/arm/neon8.c:172:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:172:28: sparse: sparse: got wd1
   lib/raid/raid6/arm/neon8.c:173:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:173:28: sparse: sparse: got wd2
   lib/raid/raid6/arm/neon8.c:174:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:174:28: sparse: sparse: got wd3
   lib/raid/raid6/arm/neon8.c:175:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:175:28: sparse: sparse: got wd4
   lib/raid/raid6/arm/neon8.c:176:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:176:28: sparse: sparse: got wd5
   lib/raid/raid6/arm/neon8.c:177:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:177:28: sparse: sparse: got wd6
   lib/raid/raid6/arm/neon8.c:178:28: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:178:28: sparse: sparse: got wd7
   lib/raid/raid6/arm/neon8.c:179:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:179:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon8.c:185:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:185:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon8.c:185:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon8.c:185:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:185:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon8.c:185:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:185:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon8.c:204:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:204:25: sparse: sparse: got =
   lib/raid/raid6/arm/neon8.c:204:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon8.c:204:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:204:36: sparse: sparse: got >=
   lib/raid/raid6/arm/neon8.c:204:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:204:48: sparse: sparse: got --
   lib/raid/raid6/arm/neon8.c:262:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:262:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:264:39: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:264:39: sparse: sparse: got >=
   lib/raid/raid6/arm/neon8.c:264:48: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:264:48: sparse: sparse: got -=
   lib/raid/raid6/arm/neon8.c:298:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:298:17: sparse: sparse: got }
>> lib/raid/raid6/arm/neon8.c:335:25: sparse: sparse: Trying to use reserved word 'break' as identifier
>> lib/raid/raid6/arm/neon8.c:336:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon8.c:336:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:336:22: sparse: sparse: got 1
   lib/raid/raid6/arm/neon8.c:370:25: sparse: sparse: Trying to use reserved word 'break' as identifier
   lib/raid/raid6/arm/neon8.c:371:17: sparse: sparse: Trying to use reserved word 'case' as identifier
   lib/raid/raid6/arm/neon8.c:371:22: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:371:22: sparse: sparse: got 0
   lib/raid/raid6/arm/neon8.c:405:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:405:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:423:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:423:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:424:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:424:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:425:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:425:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:426:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:426:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:427:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:427:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:428:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:428:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:429:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:429:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:430:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:430:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:431:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:431:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:432:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:432:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:433:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:433:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:434:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:434:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:435:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:435:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:436:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:436:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:437:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:437:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:438:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:438:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:439:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:439:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:71:15: sparse: sparse: symbol 'unative_t' redeclared with different type (different modifiers):
   lib/raid/raid6/arm/neon8.c:71:15: sparse:    int static const [toplevel] unative_t
   lib/raid/raid6/arm/neon8.c:70:18: sparse: note: previously declared as:
   lib/raid/raid6/arm/neon8.c:70:18: sparse:    int register static [toplevel] unative_t
   lib/raid/raid6/arm/neon8.c:73:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/arm/neon8.c:74:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon8.c:75:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/arm/neon8.c:79:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid/raid6/arm/neon8.c:79:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:80:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/arm/neon8.c:80:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:81:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/arm/neon8.c:81:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:82:23: sparse: sparse: undefined identifier 'wp4'
   lib/raid/raid6/arm/neon8.c:82:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:83:23: sparse: sparse: undefined identifier 'wp5'
   lib/raid/raid6/arm/neon8.c:83:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:84:23: sparse: sparse: undefined identifier 'wp6'
   lib/raid/raid6/arm/neon8.c:84:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:85:23: sparse: sparse: undefined identifier 'wp7'
   lib/raid/raid6/arm/neon8.c:85:29: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:88:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:89:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:90:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:91:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:92:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:93:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:94:31: sparse: sparse: undefined identifier 'vld1q_u8'
   lib/raid/raid6/arm/neon8.c:95:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:96:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:97:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:98:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:99:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:100:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:101:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:102:31: sparse: sparse: undefined identifier 'veorq_u8'
   lib/raid/raid6/arm/neon8.c:103:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:104:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:105:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:106:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:107:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:108:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:109:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:110:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/arm/neon8.c:111:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:112:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:113:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:114:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:115:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:116:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:117:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:118:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/arm/neon8.c:120:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon8.c:120:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon8.c:103)
   lib/raid/raid6/arm/neon8.c:121:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon8.c:121:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon8.c:104)
   lib/raid/raid6/arm/neon8.c:122:31: sparse: sparse: undefined identifier 'vandq_u8'
   lib/raid/raid6/arm/neon8.c:122:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/arm/neon8.c:105)

vim +/return +23 lib/raid/raid6/arm/recov_neon_inner.c

6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13   9  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  10  #ifdef CONFIG_ARM
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  11  /*
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  12   * AArch32 does not provide this intrinsic natively because it does not
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  13   * implement the underlying instruction. AArch32 only provides a 64-bit
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  14   * wide vtbl.8 instruction, so use that instead.
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  15   */
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  16  static uint8x16_t vqtbl1q_u8(uint8x16_t a, uint8x16_t b)
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  17  {
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  18  	union {
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  19  		uint8x16_t	val;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  20  		uint8x8x2_t	pair;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  21  	} __a = { a };
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  22  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @23  	return vcombine_u8(vtbl2_u8(__a.pair, vget_low_u8(b)),
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  24  			   vtbl2_u8(__a.pair, vget_high_u8(b)));
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  25  }
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  26  #endif
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  27  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  28  void __raid6_2data_recov_neon(int bytes, uint8_t *p, uint8_t *q, uint8_t *dp,
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  29  			      uint8_t *dq, const uint8_t *pbmul,
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  30  			      const uint8_t *qmul)
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  31  {
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  32  	uint8x16_t pm0 = vld1q_u8(pbmul);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  33  	uint8x16_t pm1 = vld1q_u8(pbmul + 16);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  34  	uint8x16_t qm0 = vld1q_u8(qmul);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  35  	uint8x16_t qm1 = vld1q_u8(qmul + 16);
1ad3935b39da78a lib/raid6/recov_neon_inner.c Nick Desaulniers 2019-02-25  36  	uint8x16_t x0f = vdupq_n_u8(0x0f);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  37  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  38  	/*
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  39  	 * while ( bytes-- ) {
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  40  	 *	uint8_t px, qx, db;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  41  	 *
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  42  	 *	px    = *p ^ *dp;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  43  	 *	qx    = qmul[*q ^ *dq];
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  44  	 *	*dq++ = db = pbmul[px] ^ qx;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  45  	 *	*dp++ = db ^ px;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  46  	 *	p++; q++;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  47  	 * }
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  48  	 */
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  49  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13 @50  	while (bytes) {
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  51  		uint8x16_t vx, vy, px, qx, db;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  52  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  53  		px = veorq_u8(vld1q_u8(p), vld1q_u8(dp));
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  54  		vx = veorq_u8(vld1q_u8(q), vld1q_u8(dq));
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  55  
335ebe3035b6fcb lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  56  		vy = vshrq_n_u8(vx, 4);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  57  		vx = vqtbl1q_u8(qm0, vandq_u8(vx, x0f));
335ebe3035b6fcb lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  58  		vy = vqtbl1q_u8(qm1, vy);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  59  		qx = veorq_u8(vx, vy);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  60  
335ebe3035b6fcb lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  61  		vy = vshrq_n_u8(px, 4);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  62  		vx = vqtbl1q_u8(pm0, vandq_u8(px, x0f));
335ebe3035b6fcb lib/raid6/recov_neon_inner.c Ard Biesheuvel   2019-02-26  63  		vy = vqtbl1q_u8(pm1, vy);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  64  		vx = veorq_u8(vx, vy);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  65  		db = veorq_u8(vx, qx);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  66  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  67  		vst1q_u8(dq, db);
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  68  		vst1q_u8(dp, veorq_u8(db, px));
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  69  
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  70  		bytes -= 16;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  71  		p += 16;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  72  		q += 16;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  73  		dp += 16;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  74  		dq += 16;
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  75  	}
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  76  }
6ec4e2514decd6f lib/raid6/recov_neon_inner.c Ard Biesheuvel   2017-07-13  77  

:::::: The code at line 23 was first introduced by commit
:::::: 6ec4e2514decd6fb4782a9364fa71d6244d05af4 md/raid6: implement recovery using ARM NEON intrinsics

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
