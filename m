Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3D612E4A
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Oct 2023 10:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j++Fg7Ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698661417; x=1730197417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YsPNOAJ4iteBGUEMESyJ8/fKzdyaVEQntpRFgCdK8lY=;
  b=j++Fg7KeskbOL1QbjSkjN9yERRBUWPLb8MQ77pGESHSzqNJiwW0KRFJJ
   S/8Nhy2gw0GtBx5pQ56IuAL3nlHcutB0f2Dt84F1GUJXMn1MZAMv664u6
   g0iK3B3tAxZTTwOUBsrHHJOMCmceM2mB+u/04JzmhNDhEDO1Q4tfDk1HA
   kRXciRGecuEqnP8EnaIi65gzK5VcYQOecvj09NW3+JOuOfYyr4Wi+s+pS
   frA2HuUyzX1dMJlVz6xA3SmtSg4rdS+GO3QZHaJxi9Ud9SmPk5H2EshID
   0e7njye9VQ58b0X2vnmly8osjWQqrr95e8L+pNR2iyvzHEDYNZ6WcheZ6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="452304976"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="452304976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 03:23:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1415126"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2023 03:23:36 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxPQj-000DBf-1D;
	Mon, 30 Oct 2023 10:23:33 +0000
Date: Mon, 30 Oct 2023 18:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/overflow_kunit.c:392 shift_overflow_test() warn: '(_a_full <<
 _to_shift)' 32768 can't fit into 32767 '*_d'
Message-ID: <202310301834.vyF5JS9C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
commit: 779742255cb464e9e833fed2a8d352eb12936dae overflow: Split up kunit tests for smaller stack frames
date:   1 year, 2 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-r024-20230822 (https://download.01.org/0day-ci/archive/20231030/202310301834.vyF5JS9C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231030/202310301834.vyF5JS9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310301834.vyF5JS9C-lkp@intel.com/

New smatch warnings:
lib/overflow_kunit.c:392 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/overflow_kunit.c:440 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/overflow_kunit.c:478 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/overflow_kunit.c:479 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'

Old smatch warnings:
lib/overflow_kunit.c:401 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/overflow_kunit.c:412 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/overflow_kunit.c:421 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/overflow_kunit.c:423 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/overflow_kunit.c:441 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/overflow_kunit.c:479 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'

vim +392 lib/overflow_kunit.c

779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  378  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  379  static void shift_overflow_test(struct kunit *test)
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  380  {
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  381  	int count = 0;
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  382  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  383  	/* Overflow: shifted the bit off the end. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  384  	TEST_ONE_SHIFT(1, 8, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  385  	TEST_ONE_SHIFT(1, 16, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  386  	TEST_ONE_SHIFT(1, 32, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  387  	TEST_ONE_SHIFT(1, 32, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  388  	TEST_ONE_SHIFT(1, 64, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  389  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  390  	/* Overflow: shifted into the signed bit. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  391  	TEST_ONE_SHIFT(1, 7, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @392  	TEST_ONE_SHIFT(1, 15, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  393  	TEST_ONE_SHIFT(1, 31, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  394  	TEST_ONE_SHIFT(1, 31, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  395  	TEST_ONE_SHIFT(1, 63, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  396  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  397  	/* Overflow: high bit falls off unsigned types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  398  	/* 10010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  399  	TEST_ONE_SHIFT(150, 1, u8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  400  	/* 1000100010010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  401  	TEST_ONE_SHIFT(34966, 1, u16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  402  	/* 10000100000010001000100010010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  403  	TEST_ONE_SHIFT(2215151766U, 1, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  404  	TEST_ONE_SHIFT(2215151766U, 1, unsigned int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  405  	/* 1000001000010000010000000100000010000100000010001000100010010110 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  406  	TEST_ONE_SHIFT(9372061470395238550ULL, 1, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  407  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  408  	/* Overflow: bit shifted into signed bit on signed types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  409  	/* 01001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  410  	TEST_ONE_SHIFT(75, 1, s8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  411  	/* 0100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  412  	TEST_ONE_SHIFT(17483, 1, s16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  413  	/* 01000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  414  	TEST_ONE_SHIFT(1107575883, 1, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  415  	TEST_ONE_SHIFT(1107575883, 1, int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  416  	/* 0100000100001000001000000010000001000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  417  	TEST_ONE_SHIFT(4686030735197619275LL, 1, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  418  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  419  	/* Overflow: bit shifted past signed bit on signed types. */
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  420  	/* 01001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  421  	TEST_ONE_SHIFT(75, 2, s8, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  422  	/* 0100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  423  	TEST_ONE_SHIFT(17483, 2, s16, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  424  	/* 01000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  425  	TEST_ONE_SHIFT(1107575883, 2, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  426  	TEST_ONE_SHIFT(1107575883, 2, int, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  427  	/* 0100000100001000001000000010000001000010000001000100010001001011 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  428  	TEST_ONE_SHIFT(4686030735197619275LL, 2, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  429  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  430  	kunit_info(test, "%d overflow shift tests finished\n", count);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  431  }
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  432  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  433  static void shift_truncate_test(struct kunit *test)
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  434  {
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  435  	int count = 0;
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  436  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  437  	/* Overflow: values larger than destination type. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  438  	TEST_ONE_SHIFT(0x100, 0, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  439  	TEST_ONE_SHIFT(0xFF, 0, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @440  	TEST_ONE_SHIFT(0x10000U, 0, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  441  	TEST_ONE_SHIFT(0xFFFFU, 0, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  442  	TEST_ONE_SHIFT(0x100000000ULL, 0, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  443  	TEST_ONE_SHIFT(0x100000000ULL, 0, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  444  	TEST_ONE_SHIFT(0xFFFFFFFFUL, 0, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  445  	TEST_ONE_SHIFT(0xFFFFFFFFUL, 0, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  446  	TEST_ONE_SHIFT(0xFFFFFFFFFFFFFFFFULL, 0, s64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  447  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  448  	/* Overflow: shifted at or beyond entire type's bit width. */
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  449  	TEST_ONE_SHIFT(0, 8, u8, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  450  	TEST_ONE_SHIFT(0, 9, u8, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  451  	TEST_ONE_SHIFT(0, 8, s8, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  452  	TEST_ONE_SHIFT(0, 9, s8, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  453  	TEST_ONE_SHIFT(0, 16, u16, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  454  	TEST_ONE_SHIFT(0, 17, u16, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  455  	TEST_ONE_SHIFT(0, 16, s16, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  456  	TEST_ONE_SHIFT(0, 17, s16, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  457  	TEST_ONE_SHIFT(0, 32, u32, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  458  	TEST_ONE_SHIFT(0, 33, u32, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  459  	TEST_ONE_SHIFT(0, 32, int, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  460  	TEST_ONE_SHIFT(0, 33, int, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  461  	TEST_ONE_SHIFT(0, 32, s32, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  462  	TEST_ONE_SHIFT(0, 33, s32, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  463  	TEST_ONE_SHIFT(0, 64, u64, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  464  	TEST_ONE_SHIFT(0, 65, u64, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  465  	TEST_ONE_SHIFT(0, 64, s64, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  466  	TEST_ONE_SHIFT(0, 65, s64, 0, true);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  467  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  468  	kunit_info(test, "%d truncate shift tests finished\n", count);
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  469  }
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  470  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  471  static void shift_nonsense_test(struct kunit *test)
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  472  {
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  473  	int count = 0;
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  474  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  475  	/* Nonsense: negative initial value. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  476  	TEST_ONE_SHIFT(-1, 0, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  477  	TEST_ONE_SHIFT(-1, 0, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @478  	TEST_ONE_SHIFT(-5, 0, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @479  	TEST_ONE_SHIFT(-5, 0, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  480  	TEST_ONE_SHIFT(-10, 0, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  481  	TEST_ONE_SHIFT(-10, 0, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  482  	TEST_ONE_SHIFT(-100, 0, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  483  	TEST_ONE_SHIFT(-100, 0, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  484  	TEST_ONE_SHIFT(-10000, 0, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  485  	TEST_ONE_SHIFT(-10000, 0, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  486  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  487  	/* Nonsense: negative shift values. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  488  	TEST_ONE_SHIFT(0, -5, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  489  	TEST_ONE_SHIFT(0, -5, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  490  	TEST_ONE_SHIFT(0, -10, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  491  	TEST_ONE_SHIFT(0, -10, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  492  	TEST_ONE_SHIFT(0, -15, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  493  	TEST_ONE_SHIFT(0, -15, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  494  	TEST_ONE_SHIFT(0, -20, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  495  	TEST_ONE_SHIFT(0, -20, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  496  	TEST_ONE_SHIFT(0, -30, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  497  	TEST_ONE_SHIFT(0, -30, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  498  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  499  	/*
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  500  	 * Corner case: for unsigned types, we fail when we've shifted
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  501  	 * through the entire width of bits. For signed types, we might
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  502  	 * want to match this behavior, but that would mean noticing if
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  503  	 * we shift through all but the signed bit, and this is not
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  504  	 * currently detected (but we'll notice an overflow into the
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  505  	 * signed bit). So, for now, we will test this condition but
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  506  	 * mark it as not expected to overflow.
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  507  	 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  508  	TEST_ONE_SHIFT(0, 7, s8, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  509  	TEST_ONE_SHIFT(0, 15, s16, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  510  	TEST_ONE_SHIFT(0, 31, int, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  511  	TEST_ONE_SHIFT(0, 31, s32, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  512  	TEST_ONE_SHIFT(0, 63, s64, 0, false);
8e7c8ca6b98890 lib/test_overflow.c  Kees Cook 2021-09-20  513  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  514  	kunit_info(test, "%d nonsense shift tests finished\n", count);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  515  }
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  516  #undef TEST_ONE_SHIFT
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  517  

:::::: The code at line 392 was first introduced by commit
:::::: 617f55e20743fc50c989b498f9dee289eb644cfd lib: overflow: Convert to Kunit

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
