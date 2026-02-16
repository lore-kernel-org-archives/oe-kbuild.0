Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899401A9F88
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771204998; cv=none; b=SQW9gwwnv2Zo60eG1NoWn4MlX/aOc98X1bSbBAyAmNhpfYrt1SenJZWCkxG2pn/s7puRkgW+WD9/+ftV97o1q8wVRpJsHGJyQ+D3KlTD38juymdii7M4Ba7HlIovuWkHyzrEZHZEYapQuXW20FFOd1yZDsEcrtuZ8+Ja6IiiMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771204998; c=relaxed/simple;
	bh=ffwexemgcH9NJWhQxgdbeNdL1x36oXE+6gecNfEdC9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N0vLH2RoT0m/66PfzNT6CDYjAFLiRqK8wTpkCzHJOPMSeDFjmyHwNbm+i89VBIz3BgZED82N2NJJt7DyqBLC8383/0hKYKjQF6H5a8fPfN+KJ+Rrh9CgYnN+T7xPAg//hmKASY+kMxbRd77lDlcl662xUjfKl3NXxCAmVRCROxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6dmXJOJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6dmXJOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771204997; x=1802740997;
  h=date:from:to:cc:subject:message-id;
  bh=ffwexemgcH9NJWhQxgdbeNdL1x36oXE+6gecNfEdC9U=;
  b=H6dmXJOJS/8CejkCcWlKb5WY6HPZAAuT3MdZjnB0NCwQOqzfW1I+R0WE
   aC1vWcUW7xUmjJtXqwGXsv9FJQWqICUkkh+nK7xbitlizodTaoYhugofp
   MEuzRUDIgZ2LcnSxFBB2VKP9S57sShJsbVzGh3HmC27PFAotTB5y4qx1o
   UjuY77T1wrq7i7ZSgE9bMcRS54LQTLvzoF7S99dprfWk8IdmkIeEQC2dM
   rKXE3VzaOCamdE3khjVPKzMMb/+9cc8hibh6NQnU15iOKBIaBT9jVmBce
   k1Kqx4bzPP+fwqQ0W+5uqbN0I29RSSI5xWCl6ZdtDzhJ0Ma+sfdCfFLfg
   A==;
X-CSE-ConnectionGUID: U2yqJNzHQfCcMal1oohGmQ==
X-CSE-MsgGUID: KQ9ZK4DKQMaewvvOAjXp5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71489783"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="71489783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 17:23:16 -0800
X-CSE-ConnectionGUID: wBpVtGyoS7m+ThTy1d0ARA==
X-CSE-MsgGUID: B00paBzQRkWyuEuxJMD77A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="213480305"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Feb 2026 17:23:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrnKQ-00000000zIQ-3HqD;
	Mon, 16 Feb 2026 01:23:10 +0000
Date: Mon, 16 Feb 2026 09:22:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn:
 '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
Message-ID: <202602160914.vawu2qUt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: um-randconfig-r071-20260215 (https://download.01.org/0day-ci/archive/20260216/202602160914.vawu2qUt-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602160914.vawu2qUt-lkp@intel.com/

New smatch warnings:
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'

Old smatch warnings:
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:860 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:860 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:873 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/tests/overflow_kunit.c:873 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:884 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 127 'v'
lib/tests/overflow_kunit.c:884 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 127 'v'
lib/tests/overflow_kunit.c:886 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:886 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:887 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:887 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:889 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:889 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:890 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:890 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:901 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:901 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:905 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:905 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:906 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:906 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:908 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:908 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:920 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:920 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:921 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 127 'v'
lib/tests/overflow_kunit.c:921 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 127 'v'
lib/tests/overflow_kunit.c:922 overflows_type_test() warn: value s32min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:922 overflows_type_test() warn: value s32min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:925 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:925 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'

vim +566 lib/tests/overflow_kunit.c

779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  558  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  559  static void shift_nonsense_test(struct kunit *test)
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  560  {
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  561  	int count = 0;
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  562  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  563  	/* Nonsense: negative initial value. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  564  	TEST_ONE_SHIFT(-1, 0, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  565  	TEST_ONE_SHIFT(-1, 0, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16 @566  	TEST_ONE_SHIFT(-5, 0, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  567  	TEST_ONE_SHIFT(-5, 0, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  568  	TEST_ONE_SHIFT(-10, 0, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  569  	TEST_ONE_SHIFT(-10, 0, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  570  	TEST_ONE_SHIFT(-100, 0, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  571  	TEST_ONE_SHIFT(-100, 0, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  572  	TEST_ONE_SHIFT(-10000, 0, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  573  	TEST_ONE_SHIFT(-10000, 0, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  574  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  575  	/* Nonsense: negative shift values. */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  576  	TEST_ONE_SHIFT(0, -5, s8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  577  	TEST_ONE_SHIFT(0, -5, u8, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  578  	TEST_ONE_SHIFT(0, -10, s16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  579  	TEST_ONE_SHIFT(0, -10, u16, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  580  	TEST_ONE_SHIFT(0, -15, int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  581  	TEST_ONE_SHIFT(0, -15, unsigned int, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  582  	TEST_ONE_SHIFT(0, -20, s32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  583  	TEST_ONE_SHIFT(0, -20, u32, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  584  	TEST_ONE_SHIFT(0, -30, s64, 0, true);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  585  	TEST_ONE_SHIFT(0, -30, u64, 0, true);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  586  
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  587  	/*
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  588  	 * Corner case: for unsigned types, we fail when we've shifted
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  589  	 * through the entire width of bits. For signed types, we might
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  590  	 * want to match this behavior, but that would mean noticing if
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  591  	 * we shift through all but the signed bit, and this is not
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  592  	 * currently detected (but we'll notice an overflow into the
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  593  	 * signed bit). So, for now, we will test this condition but
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  594  	 * mark it as not expected to overflow.
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  595  	 */
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  596  	TEST_ONE_SHIFT(0, 7, s8, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  597  	TEST_ONE_SHIFT(0, 15, s16, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  598  	TEST_ONE_SHIFT(0, 31, int, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  599  	TEST_ONE_SHIFT(0, 31, s32, 0, false);
617f55e20743fc lib/overflow_kunit.c Kees Cook 2022-02-16  600  	TEST_ONE_SHIFT(0, 63, s64, 0, false);
8e7c8ca6b98890 lib/test_overflow.c  Kees Cook 2021-09-20  601  
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  602  	kunit_info(test, "%d nonsense shift tests finished\n", count);
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  603  }
779742255cb464 lib/overflow_kunit.c Kees Cook 2022-08-31  604  #undef TEST_ONE_SHIFT
d36b6ad27c7b95 lib/test_overflow.c  Kees Cook 2018-08-01  605  

:::::: The code at line 566 was first introduced by commit
:::::: 617f55e20743fc50c989b498f9dee289eb644cfd lib: overflow: Convert to Kunit

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
