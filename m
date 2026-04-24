Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A53E3162
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Apr 2026 19:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777058864; cv=none; b=YSh3WsfqAzRQ3aqdESnyfLqQ98AQ6DkjYGZEJLYrzRknDNz298Kh9yZRzwopbX5s55YXGGZrV/YMP7N5YBSOzMOSV61aY+vowUM0MZgsTQ1HCjbNIVK2R5ZsvLE+c8fsyYCoVLsHK0yKfN7gY23M8Xalx2/Li+5XhSeG17CUkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777058864; c=relaxed/simple;
	bh=L5PmfLE9vU1R6FoPaozp7AZeoCDZ66RS5KD/M+uGvHk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cT0qeyfQMUItEZSA9hCeUeU/pGmZpspF0OunujeQtgxIcTEaTTsoXKhZfiBCBS7RonX1jtyCWvLE5NlhecZXIwaVVbcaVmtUSUw/mW/RDmX08SqNSDzty5ci/Jt12Gmm413U3B+oMZozoEiCe/tIE6dQdp7xCpOKOoGgPwmP0zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N43f4DHe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N43f4DHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777058862; x=1808594862;
  h=date:from:to:cc:subject:message-id;
  bh=L5PmfLE9vU1R6FoPaozp7AZeoCDZ66RS5KD/M+uGvHk=;
  b=N43f4DHeY1vqqHvgur3yddPx5hujjYDPTinQOLrwN8dSm3rbTjv9kYVR
   tCkmDtqbvZMAxBQu0FImaqYcfiDHfJmks37F2IlxHzR8a/ZXxkvYiKcWs
   dRNOg9KOqMfxiz/kugHA7lpU7WXIGfciIoyc3qQ/UuHwLvaomRO77VpYv
   hVi1zCvuB/iUhll8LD5LjQ82W3s2jwTzVQ3tqcizKAj4o1TxXtCyLGJBY
   1YWLPsSFw3rOsoX1AbkCOsIXREvKGVW2uHe1Px+bCS1OLAUbNTE465P3m
   hxNDeeZzMgIQF8P/xCXU4P1K8F5ON/vJkJtEZEr1JuZFGogAqjdYO/N1z
   A==;
X-CSE-ConnectionGUID: FJ19sAtWQqCmlfS9qGLr/g==
X-CSE-MsgGUID: tI1c9jhLQZ+P3rEKnOTUYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="95607610"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="95607610"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 12:27:41 -0700
X-CSE-ConnectionGUID: tauaG2L4QXOIsd0l6M2PSw==
X-CSE-MsgGUID: HjRgMIyJTpW2LTCendcJRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="228701802"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2026 12:27:40 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGMBe-0000000062d-1LjA;
	Fri, 24 Apr 2026 19:27:38 +0000
Date: Sat, 25 Apr 2026 03:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/can/j1939/tests/socket_test.c:242:1: warning: the frame
 size of 1284 bytes is larger than 1280 bytes
Message-ID: <202604250331.ZZy0Y3MS-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-can-j1939-move-j1939_xtp_abort-enum-to-header/20260423-121252
head:   98603aafaad678823a1b3b176032fc7bc0e1a5df
commit: 98603aafaad678823a1b3b176032fc7bc0e1a5df net: can: j1939: Add initial KUnit tests for socket and transport layers
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260425/202604250331.ZZy0Y3MS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604250331.ZZy0Y3MS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604250331.ZZy0Y3MS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/can/j1939/tests/socket_test.c: In function 'j1939_test_sock2sockaddr_zeroes_padding':
>> net/can/j1939/tests/socket_test.c:242:1: warning: the frame size of 1284 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     242 | }
         | ^
   net/can/j1939/tests/socket_test.c: In function 'j1939_test_sock2sockaddr_peer':
   net/can/j1939/tests/socket_test.c:219:1: warning: the frame size of 1284 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     219 | }
         | ^
   net/can/j1939/tests/socket_test.c: In function 'j1939_test_sock2sockaddr_local':
   net/can/j1939/tests/socket_test.c:195:1: warning: the frame size of 1284 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     195 | }
         | ^


vim +242 net/can/j1939/tests/socket_test.c

98603aafaad678 Oleksij Rempel 2026-04-20  220  
98603aafaad678 Oleksij Rempel 2026-04-20  221  /* Verify padding is zeroed to prevent kernel info leak */
98603aafaad678 Oleksij Rempel 2026-04-20  222  static void j1939_test_sock2sockaddr_zeroes_padding(struct kunit *test)
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
98603aafaad678 Oleksij Rempel 2026-04-20 @242  }
98603aafaad678 Oleksij Rempel 2026-04-20  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
