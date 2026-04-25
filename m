Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837321B9F6
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Apr 2026 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777106845; cv=none; b=NGZaidGuxd8g5ugKegarHbrt1CMT7srofTycCCS59GYeS/hmPhg2REQXmQM0HZa93Os/flCSnm+/uU5E7pHcYus6GecPtrLztWjvDjakP9amuHEJHeMnqeSPUl9LnhyBjFpZbWe13MB0tL98N0PyWfC14qelqyRiOyZ2BjUA/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777106845; c=relaxed/simple;
	bh=7scQj3aEwndbr1YHXIijwFY+tohXbS8tyRgT5kf62qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fBamz6+YUQJPWTjwVX9usIulSo6wgl4tyvFYkED126JM35DvUS5a7DWDBpkW/PrLq7lAiCGOLN74USEpBVfjivTumjPxsBp11W7rS9KwXYx72HVojjHH4wAgkeaY7nNfe70ry2kzIPdTt3KtzYvhGQBA/Rirbj8Hh1MxF41U4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpFm7eSi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpFm7eSi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777106843; x=1808642843;
  h=date:from:to:cc:subject:message-id;
  bh=7scQj3aEwndbr1YHXIijwFY+tohXbS8tyRgT5kf62qk=;
  b=YpFm7eSipSUXS/4x7D0/JHMf2VEpL4hi9CrV1sor/jlVQo7BoPC32v7A
   PbWZcDFqaA1E2Tak0iin2oWqI67/6VEGy6NqBIw3QoQxKMgJa7HrPULha
   fo0lZ71oGjoqiYxf5/TbpEaOjD4+Eo8HthnzsMwUwf+d8OcVxpJUHmE65
   yhBdnyInT7yB5LpO9MO92hniAdLDfwEXaRlLIO+JrGtnrmnl1sUp8kZca
   a9RREK9hOtmy5IetFzv/82Al6uw5aVniwjS30EtY1BCHOWw3SkMIvsqh4
   GqU5IGnyGTa+RogApTCJrqSWT1/gkp4E87+WKchaZpkalW8zsru5jv3ht
   w==;
X-CSE-ConnectionGUID: KKQniCEhRBCY9M22NkarcQ==
X-CSE-MsgGUID: 1DiReBV1Q52F5XWDID/2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="78191362"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="78191362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 01:47:22 -0700
X-CSE-ConnectionGUID: z5MEBxPqQMGvI8gA5op+eA==
X-CSE-MsgGUID: T7XRdbVfRlaGiz7dTaEekA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="238234546"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Apr 2026 01:47:21 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGYfW-000000006aJ-3SRN;
	Sat, 25 Apr 2026 08:47:18 +0000
Date: Sat, 25 Apr 2026 16:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/can/j1939/tests/socket_test.c:173:13: warning: stack
 frame size (1336) exceeds limit (1280) in 'j1939_test_sock2sockaddr_local'
Message-ID: <202604251612.sw1oRjDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Oleksij-Rempel/net-can-j1939-move-j1939_xtp_abort-enum-to-header/20260423-121252, commit: 98603aafaad678823a1b3b176032fc7bc0e1a5df"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-can-j1939-move-j1939_xtp_abort-enum-to-header/20260423-121252
head:   98603aafaad678823a1b3b176032fc7bc0e1a5df
commit: 98603aafaad678823a1b3b176032fc7bc0e1a5df net: can: j1939: Add initial KUnit tests for socket and transport layers
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260425/202604251612.sw1oRjDl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604251612.sw1oRjDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604251612.sw1oRjDl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/tests/socket_test.c:173:13: warning: stack frame size (1336) exceeds limit (1280) in 'j1939_test_sock2sockaddr_local' [-Wframe-larger-than]
     173 | static void j1939_test_sock2sockaddr_local(struct kunit *test)
         |             ^
>> net/can/j1939/tests/socket_test.c:197:13: warning: stack frame size (1336) exceeds limit (1280) in 'j1939_test_sock2sockaddr_peer' [-Wframe-larger-than]
     197 | static void j1939_test_sock2sockaddr_peer(struct kunit *test)
         |             ^
>> net/can/j1939/tests/socket_test.c:222:13: warning: stack frame size (1328) exceeds limit (1280) in 'j1939_test_sock2sockaddr_zeroes_padding' [-Wframe-larger-than]
     222 | static void j1939_test_sock2sockaddr_zeroes_padding(struct kunit *test)
         |             ^
   3 warnings generated.


vim +/j1939_test_sock2sockaddr_local +173 net/can/j1939/tests/socket_test.c

98603aafaad678 Oleksij Rempel 2026-04-20  171  
98603aafaad678 Oleksij Rempel 2026-04-20  172  /* Socket-to-sockaddr conversion for getname(): peer=0 (local), peer=1 (remote) */
98603aafaad678 Oleksij Rempel 2026-04-20 @173  static void j1939_test_sock2sockaddr_local(struct kunit *test)
98603aafaad678 Oleksij Rempel 2026-04-20  174  {
98603aafaad678 Oleksij Rempel 2026-04-20  175  	struct sockaddr_can addr;
98603aafaad678 Oleksij Rempel 2026-04-20  176  	struct j1939_sock jsk = {
98603aafaad678 Oleksij Rempel 2026-04-20  177  		.ifindex = 5,
98603aafaad678 Oleksij Rempel 2026-04-20  178  		.addr = {
98603aafaad678 Oleksij Rempel 2026-04-20  179  			.src_name = 0x1234567890ABCDEF,
98603aafaad678 Oleksij Rempel 2026-04-20  180  			.dst_name = 0xFEDCBA0987654321,
98603aafaad678 Oleksij Rempel 2026-04-20  181  			.pgn = 0xFECA,
98603aafaad678 Oleksij Rempel 2026-04-20  182  			.sa = 0x25,
98603aafaad678 Oleksij Rempel 2026-04-20  183  			.da = 0x30,
98603aafaad678 Oleksij Rempel 2026-04-20  184  		},
98603aafaad678 Oleksij Rempel 2026-04-20  185  	};
98603aafaad678 Oleksij Rempel 2026-04-20  186  
98603aafaad678 Oleksij Rempel 2026-04-20  187  	memset(&addr, 0xFF, sizeof(addr));
98603aafaad678 Oleksij Rempel 2026-04-20  188  	j1939_sk_sock2sockaddr_can(&addr, &jsk, 0);
98603aafaad678 Oleksij Rempel 2026-04-20  189  
98603aafaad678 Oleksij Rempel 2026-04-20  190  	KUNIT_EXPECT_EQ(test, addr.can_family, AF_CAN);
98603aafaad678 Oleksij Rempel 2026-04-20  191  	KUNIT_EXPECT_EQ(test, addr.can_ifindex, 5);
98603aafaad678 Oleksij Rempel 2026-04-20  192  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.name, 0x1234567890ABCDEF);
98603aafaad678 Oleksij Rempel 2026-04-20  193  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.addr, 0x25);
98603aafaad678 Oleksij Rempel 2026-04-20  194  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.pgn, 0xFECA);
98603aafaad678 Oleksij Rempel 2026-04-20  195  }
98603aafaad678 Oleksij Rempel 2026-04-20  196  
98603aafaad678 Oleksij Rempel 2026-04-20 @197  static void j1939_test_sock2sockaddr_peer(struct kunit *test)
98603aafaad678 Oleksij Rempel 2026-04-20  198  {
98603aafaad678 Oleksij Rempel 2026-04-20  199  	struct sockaddr_can addr;
98603aafaad678 Oleksij Rempel 2026-04-20  200  	struct j1939_sock jsk = {
98603aafaad678 Oleksij Rempel 2026-04-20  201  		.ifindex = 5,
98603aafaad678 Oleksij Rempel 2026-04-20  202  		.addr = {
98603aafaad678 Oleksij Rempel 2026-04-20  203  			.src_name = 0x1234567890ABCDEF,
98603aafaad678 Oleksij Rempel 2026-04-20  204  			.dst_name = 0xFEDCBA0987654321,
98603aafaad678 Oleksij Rempel 2026-04-20  205  			.pgn = 0xFECA,
98603aafaad678 Oleksij Rempel 2026-04-20  206  			.sa = 0x25,
98603aafaad678 Oleksij Rempel 2026-04-20  207  			.da = 0x30,
98603aafaad678 Oleksij Rempel 2026-04-20  208  		},
98603aafaad678 Oleksij Rempel 2026-04-20  209  	};
98603aafaad678 Oleksij Rempel 2026-04-20  210  
98603aafaad678 Oleksij Rempel 2026-04-20  211  	memset(&addr, 0xFF, sizeof(addr));
98603aafaad678 Oleksij Rempel 2026-04-20  212  	j1939_sk_sock2sockaddr_can(&addr, &jsk, 1);
98603aafaad678 Oleksij Rempel 2026-04-20  213  
98603aafaad678 Oleksij Rempel 2026-04-20  214  	KUNIT_EXPECT_EQ(test, addr.can_family, AF_CAN);
98603aafaad678 Oleksij Rempel 2026-04-20  215  	KUNIT_EXPECT_EQ(test, addr.can_ifindex, 5);
98603aafaad678 Oleksij Rempel 2026-04-20  216  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.name, 0xFEDCBA0987654321);
98603aafaad678 Oleksij Rempel 2026-04-20  217  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.addr, 0x30);
98603aafaad678 Oleksij Rempel 2026-04-20  218  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.pgn, 0xFECA);
98603aafaad678 Oleksij Rempel 2026-04-20  219  }
98603aafaad678 Oleksij Rempel 2026-04-20  220  
98603aafaad678 Oleksij Rempel 2026-04-20  221  /* Verify padding is zeroed to prevent kernel info leak */
98603aafaad678 Oleksij Rempel 2026-04-20 @222  static void j1939_test_sock2sockaddr_zeroes_padding(struct kunit *test)
98603aafaad678 Oleksij Rempel 2026-04-20  223  {
98603aafaad678 Oleksij Rempel 2026-04-20  224  	struct sockaddr_can addr;
98603aafaad678 Oleksij Rempel 2026-04-20  225  	struct j1939_sock jsk = {
98603aafaad678 Oleksij Rempel 2026-04-20  226  		.ifindex = 1,
98603aafaad678 Oleksij Rempel 2026-04-20  227  		.addr = {
98603aafaad678 Oleksij Rempel 2026-04-20  228  			.src_name = 0,
98603aafaad678 Oleksij Rempel 2026-04-20  229  			.dst_name = 0,
98603aafaad678 Oleksij Rempel 2026-04-20  230  			.pgn = 0,
98603aafaad678 Oleksij Rempel 2026-04-20  231  			.sa = 0,
98603aafaad678 Oleksij Rempel 2026-04-20  232  			.da = 0,
98603aafaad678 Oleksij Rempel 2026-04-20  233  		},
98603aafaad678 Oleksij Rempel 2026-04-20  234  	};
98603aafaad678 Oleksij Rempel 2026-04-20  235  
98603aafaad678 Oleksij Rempel 2026-04-20  236  	memset(&addr, 0xAA, sizeof(addr));
98603aafaad678 Oleksij Rempel 2026-04-20  237  	j1939_sk_sock2sockaddr_can(&addr, &jsk, 0);
98603aafaad678 Oleksij Rempel 2026-04-20  238  
98603aafaad678 Oleksij Rempel 2026-04-20  239  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.name, 0ULL);
98603aafaad678 Oleksij Rempel 2026-04-20  240  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.addr, 0);
98603aafaad678 Oleksij Rempel 2026-04-20  241  	KUNIT_EXPECT_EQ(test, addr.can_addr.j1939.pgn, 0U);
98603aafaad678 Oleksij Rempel 2026-04-20  242  }
98603aafaad678 Oleksij Rempel 2026-04-20  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
