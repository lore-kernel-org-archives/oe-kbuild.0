Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3B3C8729
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870987; cv=none; b=IWVJdQBY+ZyKzH6mF4TMuwgrRY1FMwpXjBiHqOoioDffFA11QkeWdSi1G0YkCKOvRoUUjwUMPf/j1QS3pV0Biw7fJmLvzm8DYWoHStjVy9e4O6ujJiqLpYTTb4nAwUUGXexjSfwr0WTKghcP0xg8AZ1qEsihUff6iDDGCjwzVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870987; c=relaxed/simple;
	bh=gLmlqryt31Vulrx/Y2XizPzprR6+2jdihfhw/QTf06c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qPYq/yixcRr5pZVdGJZE9ZSoqLdyJtdAQlGoQZlfEzDFKQIrvZetnfxLOGIg48guidkU0JpGTcKTSpXTzbF83FcHcKwmCM2oNnKFlg6xnEkNc1Pn3qD4Az1lwX/iMalO6z+d4CebIkBS8BEf5qc4HH3o5dzuu5xqZi71SmRftds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfwPY8Nu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfwPY8Nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774870985; x=1806406985;
  h=date:from:to:cc:subject:message-id;
  bh=gLmlqryt31Vulrx/Y2XizPzprR6+2jdihfhw/QTf06c=;
  b=JfwPY8NuCvjVzRP/3xvq3ia8OkiNibWOzAZSDDLyv6QRyIy5GP0Zu6u8
   +GCim7U/hc7Q2xVKDo1nlcDLFYKUmcuN3bVI7vmV82KcbcFSS/o4gve5E
   Oa0ZhwaF3peCzavIZEM5It2BSwn78mn5edpgsUtfiUQxWiQ1gwimzTgq1
   ZY7O7LRLTwn4s7eWRk1mgFqyx6xIEk5K24lFHDIA8cIXKeXRzTRdlooIY
   DxGleTZPfMbnNybuh4wRGrzlaaNCZxTsrRr1lWrCGv60qa0ulrM4fa40a
   tjy5jF6cI6v1rQhFjOLG5DAS6O3P5um9p/ZQs2ZJ+Y5cjZvbi3eyq1IRj
   w==;
X-CSE-ConnectionGUID: 8K030Aq/Rq+zTi23LTRsIQ==
X-CSE-MsgGUID: l1vE2+BDScWCkF7P3IDkAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75830492"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75830492"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:43:04 -0700
X-CSE-ConnectionGUID: xeiF+y0bTvuRKEU/yL94eA==
X-CSE-MsgGUID: 6a/7SneoQuqozJOzA2eTrA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2026 04:43:02 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7B1I-00000000125-1NS6;
	Mon, 30 Mar 2026 11:43:00 +0000
Date: Mon, 30 Mar 2026 19:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/overflow_kunit.c:926 overflows_type_test() warn:
 value (-32769) can't fit into s16min 'v'
Message-ID: <202603301933.3fq0187H-lkp@intel.com>
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

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-161-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301933.3fq0187H-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301933.3fq0187H-lkp@intel.com/

New smatch warnings:
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'

Old smatch warnings:
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
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
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:937 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:937 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:939 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:939 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:948 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:948 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:949 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:949 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'

vim +926 lib/tests/overflow_kunit.c

4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   818  
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   819  	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   820  	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   821  	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   822  	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   823  	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   824  	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   825  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   826  	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   827  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   828  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   829  	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   830  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   831  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   832  	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   833  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   834  #if BITS_PER_LONG == 64
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   835  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   836  	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   837  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   838  #endif
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   839  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   840  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   841  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   842  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   843  	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   844  	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   845  	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   846  	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   847  	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   848  	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   849  	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   850  	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   851  	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   852  	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   853  	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   854  	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   855  	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   856  	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   857  	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   858  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   859  	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   860  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   861  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   862  	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   863  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   864  #if BITS_PER_LONG == 64
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   865  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   866  	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   867  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   868  #endif
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   869  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   870  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   871  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   872  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   873  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   874  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   875  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   876  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   877  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   878  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   879  	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   880  	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   881  	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   882  	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   883  	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   884  	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   885  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   886  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   887  	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   888  	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   889  	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   890  	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   891  	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   892  	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   893  	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   894  	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   895  #if BITS_PER_LONG == 64
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   896  	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   897  	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   898  #endif
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   899  	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   900  	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   901  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   902  	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   903  	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   904  	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   905  	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   906  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   907  	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   908  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   909  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   910  	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   911  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   912  #if BITS_PER_LONG == 64
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   913  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   914  	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   915  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   916  #endif
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   917  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   918  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   919  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   920  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   921  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   922  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   923  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   924  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   925  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  @926  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   927  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  @928  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   929  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   930  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   931  #if BITS_PER_LONG == 64
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   932  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   933  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   934  	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   935  	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   936  	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   937  	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   938  	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   939  	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   940  	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   941  	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   942  	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   943  	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   944  	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   945  	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   946  	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   947  	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   948  	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   949  	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   950  	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   951  	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   952  	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   953  	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   954  	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   955  	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   956  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   957  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   958  	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   959  	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   960  	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   961  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   962  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   963  	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   964  	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   965  	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   966  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   967  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   968  	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   969  	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   970  	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   971  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   972  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   973  	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   974  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   975  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   976  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   977  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   978  	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   979  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   980  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   981  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   982  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   983  	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   984  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   985  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   986  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   987  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   988  	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   989  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   990  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   991  #endif
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   992  
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   993  	/* Check for macro side-effects. */
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   994  	var = INT_MAX - 1;
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   995  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   996  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   997  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   998  	var = INT_MAX - 1;
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   999  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1000  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1001  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1002  
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1003  	kunit_info(test, "%d overflows_type() tests finished\n", count);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1004  #undef TEST_OVERFLOWS_TYPE
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1005  #undef __TEST_OVERFLOWS_TYPE
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1006  }
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  1007  

:::::: The code at line 926 was first introduced by commit
:::::: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
