Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C3E3D01A
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 22:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fPtz3x3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697151036; x=1728687036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQjIdmvVwTZsyTIZD37E6Mv9HkRTXOGW0RpopZ3tbJo=;
  b=fPtz3x3gO2PVr4KwxCXkI0vJme9x2uejvaLIgdIf88xZEEZETniXYblL
   c+r5DwHgtP3RiK8IUneQQuBN52DyOX/Oy14SUeXvb+YXBwPcnmiiJ068u
   K6V85ZZMjKQYmIWoNgh5rzq6IZAK//WMPoOMf8Lrlz7FB7+m+W0TLI+RZ
   lDCkHQU5Ed1t5x16v2tdEDyHrmm3RBx50IyZkeyol01SET7wt0VkTaPl9
   jPY3AYN4E2UxpjDGbwSxBbHvbD65Y+Y5Ilph29qhO033nmeiQYn5bl4mQ
   AbrbVN3kh9FXdxGoyXcgBweJyeyDETYgawoI0wKHUD0dFXSl93A0hiJ2h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="364422999"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="364422999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 15:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731096638"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="731096638"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 15:50:33 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr4Vj-0003z7-0M;
	Thu, 12 Oct 2023 22:50:31 +0000
Date: Fri, 13 Oct 2023 06:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/overflow_kunit.c:865 overflows_type_test() warn: value s32min
 can't fit into (-128) 'v'
Message-ID: <202310130601.WEP9Vu5N-lkp@intel.com>
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
CC: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   401644852d0b2a278811de38081be23f74b5bb04
commit: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()
date:   11 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20230910 (https://download.01.org/0day-ci/archive/20231013/202310130601.WEP9Vu5N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130601.WEP9Vu5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310130601.WEP9Vu5N-lkp@intel.com/

New smatch warnings:
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
lib/overflow_kunit.c:770 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:770 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:773 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:773 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/overflow_kunit.c:791 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/overflow_kunit.c:791 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/overflow_kunit.c:793 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:793 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:794 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/overflow_kunit.c:794 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/overflow_kunit.c:800 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:800 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:803 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:803 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/overflow_kunit.c:815 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:815 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:816 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/overflow_kunit.c:816 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/overflow_kunit.c:817 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/overflow_kunit.c:817 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
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
lib/overflow_kunit.c:846 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/overflow_kunit.c:846 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
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
lib/overflow_kunit.c:880 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/overflow_kunit.c:880 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/overflow_kunit.c:882 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:882 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:891 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:891 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:892 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'
lib/overflow_kunit.c:892 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'
lib/overflow_kunit.c:900 overflows_type_test() warn: assigning s64min to unsigned variable 'v'
lib/overflow_kunit.c:900 overflows_type_test() warn: assigning s64min to unsigned variable 'v'
lib/overflow_kunit.c:904 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 65535 'v'
lib/overflow_kunit.c:904 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 65535 'v'
lib/overflow_kunit.c:905 overflows_type_test() warn: assigning s64min to unsigned variable 'v'
lib/overflow_kunit.c:905 overflows_type_test() warn: assigning s64min to unsigned variable 'v'
lib/overflow_kunit.c:908 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:908 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/overflow_kunit.c:920 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:920 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/overflow_kunit.c:921 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 127 'v'
lib/overflow_kunit.c:921 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 127 'v'
lib/overflow_kunit.c:924 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:924 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/overflow_kunit.c:925 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/overflow_kunit.c:925 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/overflow_kunit.c:926 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 32767 'v'
lib/overflow_kunit.c:926 overflows_type_test() warn: 't1 + v' 9223372036854775807 can't fit into 32767 'v'
lib/overflow_kunit.c:1098 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1098 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1099 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1099 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1100 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1100 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1100 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1102 castable_to_type_test() warn: unsigned '(((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1102 castable_to_type_test() warn: unsigned '(((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1102 castable_to_type_test() warn: unsigned '(((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))' is never less than zero.

vim +865 lib/overflow_kunit.c

4b21d25bf519c9 Kees Cook 2022-10-24  761  
4b21d25bf519c9 Kees Cook 2022-10-24  762  	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  763  	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  764  	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  765  	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  766  	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  767  	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  768  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  769  	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  770  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  771  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  772  	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  773  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  774  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  775  	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  776  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  777  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  778  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  779  	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  780  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  781  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  782  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  783  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  784  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  785  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  786  	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  787  	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  788  	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  789  	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  790  	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  791  	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  792  	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  793  	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  794  	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  795  	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  796  	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  797  	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  798  	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  799  	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  800  	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  801  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  802  	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  803  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  804  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  805  	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  806  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  807  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  808  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  809  	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  810  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  811  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  812  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  813  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  814  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  815  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  816  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  817  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  818  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  819  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  820  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  821  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  822  	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  823  	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  824  	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  825  	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  826  	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  827  	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  828  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  829  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  830  	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  831  	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  832  	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  833  	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  834  	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  835  	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  836  	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  837  	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  838  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  839  	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  840  	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  841  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  842  	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  843  	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  844  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  845  	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  846  	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  847  	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  848  	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  849  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  850  	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  851  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  852  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  853  	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  854  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  855  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  856  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  857  	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  858  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  859  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  860  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  861  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  862  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  863  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  864  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @865  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  866  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  867  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  868  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @869  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  870  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @871  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  872  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  873  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  874  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  875  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  876  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  877  	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  878  	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  879  	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  880  	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  881  	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  882  	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  883  	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  884  	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  885  	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  886  	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  887  	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  888  	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  889  	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  890  	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  891  	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  892  	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  893  	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  894  	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  895  	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  896  	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  897  	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  898  	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  899  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  900  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  901  	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  902  	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  903  	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  904  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  905  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  906  	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  907  	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  908  	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  909  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  910  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  911  	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  912  	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  913  	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  914  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  915  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  916  	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  917  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  918  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  919  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  920  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  921  	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  922  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  923  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  924  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  925  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  926  	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  927  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  928  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  929  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  930  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  931  	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  932  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  933  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  934  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  935  
4b21d25bf519c9 Kees Cook 2022-10-24  936  	/* Check for macro side-effects. */
4b21d25bf519c9 Kees Cook 2022-10-24  937  	var = INT_MAX - 1;
4b21d25bf519c9 Kees Cook 2022-10-24  938  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  939  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  940  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
4b21d25bf519c9 Kees Cook 2022-10-24  941  	var = INT_MAX - 1;
4b21d25bf519c9 Kees Cook 2022-10-24  942  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  943  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  944  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
4b21d25bf519c9 Kees Cook 2022-10-24  945  
4b21d25bf519c9 Kees Cook 2022-10-24  946  	kunit_info(test, "%d overflows_type() tests finished\n", count);
4b21d25bf519c9 Kees Cook 2022-10-24  947  #undef TEST_OVERFLOWS_TYPE
4b21d25bf519c9 Kees Cook 2022-10-24  948  #undef __TEST_OVERFLOWS_TYPE
4b21d25bf519c9 Kees Cook 2022-10-24  949  }
4b21d25bf519c9 Kees Cook 2022-10-24  950  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
