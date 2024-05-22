Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C31E4AB
	for <oe-kbuild@lists.linux.dev>; Wed, 22 May 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716387232; cv=none; b=BqLK3Rl/WkPXywyJn7Cm3cKEG27V5fFepnmX8K8dI/rnKSUrgEGxvNv5KWw+s43oe1PemOcsLZ3dskbl/GWXnFm1Mz962UBvhCJKXdBhzvrmUh57hoQD2GhK2a6CXLp5/CwQXICkeK6AIIRlrkdh+7n4X16Xia6mnWub6LmVvZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716387232; c=relaxed/simple;
	bh=vCXb9hofL41CNFpKXh4Qt8+Ltjv79E5FKN3C3qJmufA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4FgsXzaXsYDBnQ3ukbWXxlz6gcNp4AxHojL9riu8q3zITgUc+6VhbCUddHqc6gS0W9kNdUYkOSii969HqgoMX9x58peyI0NelbbH0efR4mMwEcdM1vbCdWzeNGKKachpIDquZlNNh9HAc9wQ2Tz3h5s6ly6WXQSWinwIxMspRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcKQtWoV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcKQtWoV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716387230; x=1747923230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCXb9hofL41CNFpKXh4Qt8+Ltjv79E5FKN3C3qJmufA=;
  b=dcKQtWoVnTej1ledtrhnhSe/l263yxULv6919xvGqv8cCSa7LzWBQTmz
   wFt6CMiWNDs3dkBcKQJoK5Roex4NhfBUhot9mzBB3yzCgVreRbQUriUvn
   3LUbc49QClv1va+bPYbqwiE8DjiLSLL97cNNzRGL6+jN7ICuHJNhifVwk
   JOy3QJOQp19GrHQLiMg/rXx2CjSpNgNIrT1XeaQcaVMv32fa5hEhqvOhA
   X3Hhz0Xj2W2HAYXB7f4Vv/KsGuz9Qm0rvowxjYJOKnpmN2Xz1IGwA++mr
   p0k4cNyac80tKfhTwOobh5d72Vzcqw5Rso7LPvZNc1QWT0yAKDsKwe8xR
   g==;
X-CSE-ConnectionGUID: XusqK8WSSCyBsFatqCmGRg==
X-CSE-MsgGUID: K7qs/By7RJeguOtYclMTlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12757071"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="12757071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 07:13:50 -0700
X-CSE-ConnectionGUID: vm4MPPWITt6NfC1xfO4NmQ==
X-CSE-MsgGUID: +CsS/yJfRRuNTeRYd5Cuug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; 
   d="scan'208";a="33176449"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2024 07:13:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9miw-0001d3-1T;
	Wed, 22 May 2024 14:13:46 +0000
Date: Wed, 22 May 2024 22:13:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [crng-random:vdso-droppable 9/10] vdso_test_getrandom.c:146:40:
 warning: omitting the parameter name in a function definition is a C23
 extension
Message-ID: <202405222229.7dUI3Wc0-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso-droppable
head:   a7eca399da39972132d1fb50f4160b86b7498198
commit: 8cd2c9c9e4c91d99eeb68284c1f5d464a2925963 [9/10] random: introduce generic vDSO getrandom() implementation
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405222229.7dUI3Wc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405222229.7dUI3Wc0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:146:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     146 | static void *test_vdso_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:156:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     156 | static void *test_libc_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:166:43: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     166 | static void *test_syscall_getrandom(void *)
         |                                           ^
   3 warnings generated.
   parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      65 |                 if (g = h & 0xf0000000)
         |                     ~~^~~~~~~~~~~~~~~~
   parse_vdso.c:65:9: note: place parentheses around the assignment to silence this warning
      65 |                 if (g = h & 0xf0000000)
         |                       ^               
         |                     (                 )
   parse_vdso.c:65:9: note: use '==' to turn this assignment into an equality comparison
      65 |                 if (g = h & 0xf0000000)
         |                       ^
         |                       ==
   parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     206 |         ver_hash = elf_hash(version);
         |                             ^~~~~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     207 |         ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
         |                                                     ^~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   3 warnings generated.


vim +146 tools/testing/selftests/vDSO/vdso_test_getrandom.c

8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  145  
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18 @146  static void *test_vdso_getrandom(void *)
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  147  {
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  148  	for (size_t i = 0; i < TRIALS; ++i) {
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  149  		unsigned int val;
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  150  		ssize_t ret = vgetrandom(&val, sizeof(val), 0);
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  151  		assert(ret == sizeof(val));
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  152  	}
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  153  	return NULL;
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  154  }
8cd2c9c9e4c91d Jason A. Donenfeld 2022-11-18  155  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
