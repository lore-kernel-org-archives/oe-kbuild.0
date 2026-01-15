Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFD2D839C
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768457338; cv=none; b=aQzxMHc5TTGDrm6uvQN15AHOMlwUBCfrIL5Xp5mQHAOjZNZ/HNk1IqKKvun2no/ofY0S5wbEmFHWXCkTmf2j3+yrEbcj6uogIpAUAF1VTTgDMEhE0F3RuGH38332OA1aC2pAb9p3bEPGftH7W1r/xyyDL22WbePcvjH3cuCBtbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768457338; c=relaxed/simple;
	bh=9Qv07sP1mnwM+sUxsL9eN0/PWnomEfmKMegHBB44RmQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mQJEDkAerWwDKc3ipK1Pzf7mwuE7loMoxa7tijHzSnepwwQqkXy0MXO/TyNs1oKmW0q75Wnjlui4dHovEbDSMllx8p8fsh6rNGoT8tLzzwR48RkEYaIJOzNNd4fGH5KTSrD44gm2R59LKj7u9uWzTABxjkSQqCbKr+Nigv27FZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEoxCpke; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEoxCpke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768457334; x=1799993334;
  h=date:from:to:cc:subject:message-id;
  bh=9Qv07sP1mnwM+sUxsL9eN0/PWnomEfmKMegHBB44RmQ=;
  b=bEoxCpketAJ3Lwf0WlUBFBV99BfAZpL5vdR/opADqmH+XuyXWUbiuLX/
   FJtsDilYAaSW0AH/upv6YBfKxNovfiy/GKo38NiZ6fzHVAJI29xGJe9jh
   hl/Rbst1RabD3fWgeNeg4lVWI3/lI6M9FZYJHlyn6CB3jYnwZ8WvOADU+
   iScMwkvo9NqWkV47ns/npitp7YQV4YBJS6HmkDM94UANzurMZu1onX7/5
   CxFq7uH+NP4fUYlSxC8ElPIf3sGFWEL7Mm/U/X0pqsppc4Z+Wwg0ofxYb
   GfJ0z5/iRNRczCEOwvgFjiuC/ngHkwBvsKgkd2N/TgR6WVJvrBx79Uv8w
   g==;
X-CSE-ConnectionGUID: gPv+PLeGQIqcXZ8vo8NNLg==
X-CSE-MsgGUID: 2pZHPmI1SFii3lRSDXKreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80872271"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="80872271"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 22:08:50 -0800
X-CSE-ConnectionGUID: ythlHmgQSQO8VUMqr92g7Q==
X-CSE-MsgGUID: lYmN7xfEQ+iTdcusnZqkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204012044"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Jan 2026 22:08:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgGXG-00000000Hdg-2ewE;
	Thu, 15 Jan 2026 06:08:46 +0000
Date: Thu, 15 Jan 2026 14:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 81/81]
 lib/overflow_kunit.c:770 overflows_type_test() warn: assigning (-128) to
 unsigned variable 'v'
Message-ID: <202601151333.Uh5g3VSl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a62fd0551c62a282d1d60a0eb31e539cd533fa04
commit: 467d3baa5d70bb17784aae9e88ccc623cf2c88f9 [81/81] BACKPORT: overflow: Introduce overflows_type() and castable_to_type()
:::::: branch date: 27 hours ago
:::::: commit date: 2 years, 8 months ago
config: arm-randconfig-r071-20260114 (https://download.01.org/0day-ci/archive/20260115/202601151333.Uh5g3VSl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601151333.Uh5g3VSl-lkp@intel.com/

New smatch warnings:
lib/overflow_kunit.c:770 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:770 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:791 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/overflow_kunit.c:791 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/overflow_kunit.c:800 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:800 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:815 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:815 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:817 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/overflow_kunit.c:817 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/overflow_kunit.c:846 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/overflow_kunit.c:846 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/overflow_kunit.c:865 overflows_type_test() warn: value s32min can't fit into (-128) 'v'
lib/overflow_kunit.c:865 overflows_type_test() warn: value s32min can't fit into (-128) 'v'
lib/overflow_kunit.c:869 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/overflow_kunit.c:869 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/overflow_kunit.c:871 overflows_type_test() warn: value s32min can't fit into s16min 'v'
lib/overflow_kunit.c:871 overflows_type_test() warn: value s32min can't fit into s16min 'v'

Old smatch warnings:
lib/overflow_kunit.c:420 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/overflow_kunit.c:429 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/overflow_kunit.c:440 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/overflow_kunit.c:449 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/overflow_kunit.c:451 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/overflow_kunit.c:468 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/overflow_kunit.c:469 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/overflow_kunit.c:506 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/overflow_kunit.c:507 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/overflow_kunit.c:507 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/overflow_kunit.c:773 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:773 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:793 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:793 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:794 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/overflow_kunit.c:794 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/overflow_kunit.c:803 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:803 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:816 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/overflow_kunit.c:816 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/overflow_kunit.c:827 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 127 'v'
lib/overflow_kunit.c:827 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 127 'v'
lib/overflow_kunit.c:829 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:829 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:830 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 65535 'v'
lib/overflow_kunit.c:830 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 65535 'v'
lib/overflow_kunit.c:832 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:832 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:833 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 32767 'v'
lib/overflow_kunit.c:833 overflows_type_test() warn: 't1 + v' 4294967295 can't fit into 32767 'v'
lib/overflow_kunit.c:844 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/overflow_kunit.c:844 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:849 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/overflow_kunit.c:849 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 65535 'v'
lib/overflow_kunit.c:851 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/overflow_kunit.c:851 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/overflow_kunit.c:863 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:863 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:864 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 127 'v'
lib/overflow_kunit.c:864 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 127 'v'
lib/overflow_kunit.c:868 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:868 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:870 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/overflow_kunit.c:870 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'

vim +/v +770 lib/overflow_kunit.c

467d3baa5d70bb1 Kees Cook 2022-10-24  761  
467d3baa5d70bb1 Kees Cook 2022-10-24  762  	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  763  	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  764  	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  765  	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  766  	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  767  	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  768  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  769  	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @770  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  771  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  772  	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  773  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  774  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  775  	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  776  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  777  #if BITS_PER_LONG == 64
467d3baa5d70bb1 Kees Cook 2022-10-24  778  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  779  	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  780  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  781  #endif
467d3baa5d70bb1 Kees Cook 2022-10-24  782  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  783  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  784  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  785  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  786  	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  787  	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  788  	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  789  	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  790  	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @791  	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  792  	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  793  	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  794  	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  795  	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  796  	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  797  	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  798  	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  799  	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @800  	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  801  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  802  	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  803  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  804  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  805  	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  806  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  807  #if BITS_PER_LONG == 64
467d3baa5d70bb1 Kees Cook 2022-10-24  808  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  809  	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  810  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  811  #endif
467d3baa5d70bb1 Kees Cook 2022-10-24  812  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  813  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  814  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @815  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  816  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @817  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  818  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  819  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  820  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  821  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  822  	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  823  	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  824  	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  825  	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  826  	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  827  	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  828  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  829  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  830  	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  831  	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  832  	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  833  	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  834  	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  835  	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  836  	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  837  	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  838  #if BITS_PER_LONG == 64
467d3baa5d70bb1 Kees Cook 2022-10-24  839  	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  840  	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  841  #endif
467d3baa5d70bb1 Kees Cook 2022-10-24  842  	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  843  	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  844  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  845  	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @846  	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  847  	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  848  	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  849  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  850  	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  851  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  852  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  853  	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  854  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  855  #if BITS_PER_LONG == 64
467d3baa5d70bb1 Kees Cook 2022-10-24  856  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  857  	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  858  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  859  #endif
467d3baa5d70bb1 Kees Cook 2022-10-24  860  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  861  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  862  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  863  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  864  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @865  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  866  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  867  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  868  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @869  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  870  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24 @871  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  872  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  873  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  874  #if BITS_PER_LONG == 64
467d3baa5d70bb1 Kees Cook 2022-10-24  875  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  876  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  877  	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  878  	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  879  	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  880  	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  881  	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  882  	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  883  	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  884  	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  885  	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  886  	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  887  	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  888  	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  889  	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  890  	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  891  	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  892  	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  893  	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  894  	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  895  	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  896  	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  897  	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  898  	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  899  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  900  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  901  	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  902  	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  903  	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  904  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  905  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  906  	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  907  	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  908  	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  909  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  910  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  911  	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  912  	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  913  	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  914  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  915  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  916  	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  917  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  918  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  919  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  920  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  921  	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  922  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  923  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  924  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  925  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  926  	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  927  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  928  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  929  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  930  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  931  	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  932  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  933  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  934  #endif
467d3baa5d70bb1 Kees Cook 2022-10-24  935  
467d3baa5d70bb1 Kees Cook 2022-10-24  936  	/* Check for macro side-effects. */
467d3baa5d70bb1 Kees Cook 2022-10-24  937  	var = INT_MAX - 1;
467d3baa5d70bb1 Kees Cook 2022-10-24  938  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  939  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  940  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  941  	var = INT_MAX - 1;
467d3baa5d70bb1 Kees Cook 2022-10-24  942  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  943  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
467d3baa5d70bb1 Kees Cook 2022-10-24  944  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
467d3baa5d70bb1 Kees Cook 2022-10-24  945  
467d3baa5d70bb1 Kees Cook 2022-10-24  946  	kunit_info(test, "%d overflows_type() tests finished\n", count);
467d3baa5d70bb1 Kees Cook 2022-10-24  947  #undef TEST_OVERFLOWS_TYPE
467d3baa5d70bb1 Kees Cook 2022-10-24  948  #undef __TEST_OVERFLOWS_TYPE
467d3baa5d70bb1 Kees Cook 2022-10-24  949  }
467d3baa5d70bb1 Kees Cook 2022-10-24  950  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
