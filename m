Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339113B893B
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865395; cv=none; b=tpvsQ/l6jIS3Czm+ptJ/JDxZA/tyF55BiS1o84BQ4wGGpxr/sRwv/dtIvTQVC9/9pT+Q0wQ1f3472qHrcxy8HK0zuW7Um5oyTUXajSZdSgpPtDswdbkYvTaCQGC8BMUIEf6Eh2+7fertZF8XvgYEgU2mkCk88txJh10YufocE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865395; c=relaxed/simple;
	bh=dyVgP6G3Ks3YDzPRha1whswa9YDmBiY31EoQNZhPmMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BScGFwTLONB9Bs/WLrEsq+JXdqgTU66PAZbY/gO/ZRXpmHIKnFp4ChV2zykfk1AvMxglmaYazMJ285Cz+iLTuqv07QLgLvfzz/u8tFOKl0TNjaj4oeB7s68Zd9BxDEu+tjVnUWuUKTnNUIdxlU5FtAmzjw2Dulk9WQP4VYUjL4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuoewgfH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuoewgfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774865394; x=1806401394;
  h=date:from:to:cc:subject:message-id;
  bh=dyVgP6G3Ks3YDzPRha1whswa9YDmBiY31EoQNZhPmMY=;
  b=QuoewgfHJJPLHgNNIDxJL56qwxDVkWSI+98Sjy41hDuCmg/ta57x9Lgn
   MQ3NckTPvlbZtnYBfAMJ//s0DDiK63Tcqvi/d0CBBPR7Yqt8P9szCU2wR
   nemTLQzNlmouL2bGe28i0IE2QcMh4XFpgThrZ8AFWP5hmb2BEmyj2192X
   lmW/m+rQaVPm60wdcEYeaHvznjarmqa8iKkUU0KPSyxJu07JOcSNKsBY3
   W9SAD6/3c6x6vml9EqZG7iRda4kOxRTfwQ92jhwUwnM3NciJhnqhOkWmx
   1dItneJTt2lnoUFYccPR1sQqZ+dG8CGnPz+4urOe2ONw27wQCGDLwxIDE
   A==;
X-CSE-ConnectionGUID: 49ehyUv3Rv+9ngA1ROTCSQ==
X-CSE-MsgGUID: 7EZeeVNqQDGjezGzHo84lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79755869"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="79755869"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 03:09:53 -0700
X-CSE-ConnectionGUID: Q0HAGCEIRwqh1QmVd7cUnA==
X-CSE-MsgGUID: 5qCYtj3yTye6DGnKMCg8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="223144603"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2026 03:09:52 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79Z8-000000000wt-02ok;
	Mon, 30 Mar 2026 10:09:50 +0000
Date: Mon, 30 Mar 2026 18:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/fortify_kunit.c:479 fortify_test_strcpy() error:
 strcpy() 'src' too large for 'pad.buf' (33 vs 32)
Message-ID: <202603301838.h8K7mNWK-lkp@intel.com>
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
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-161-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301838.h8K7mNWK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301838.h8K7mNWK-lkp@intel.com/

New smatch warnings:
lib/tests/fortify_kunit.c:479 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'

Old smatch warnings:
lib/tests/fortify_kunit.c:490 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/fortify_kunit.c:503 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:860 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:860 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:873 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
lib/tests/overflow_kunit.c:873 overflows_type_test() warn: 't1 + v' 32767 can't fit into 127 'v'
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
lib/tests/overflow_kunit.c:937 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:937 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:939 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:939 overflows_type_test() warn: 't1 + v' 65536 can't fit into 65535 'v'
lib/tests/overflow_kunit.c:948 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:948 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:949 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:949 overflows_type_test() warn: 't1 + v' 18446744073709551615 can't fit into 32767 'v'

vim +479 lib/tests/fortify_kunit.c

fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  460  
a0d6677ec3f1da lib/fortify_kunit.c Kees Cook 2024-04-29  461  static void fortify_test_strcpy(struct kunit *test)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  462  {
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  463  	struct fortify_padding pad = { };
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  464  	char src[sizeof(pad.buf) + 1] = { };
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  465  	int i;
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  466  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  467  	/* Fill 31 bytes with valid characters. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  468  	for (i = 0; i < sizeof(src) - 2; i++)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  469  		src[i] = i + '0';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  470  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  471  	/* Destination is %NUL-filled to start with. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  472  	KUNIT_EXPECT_EQ(test, pad.bytes_before, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  473  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  474  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  475  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  476  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  477  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  478  	/* Legitimate strcpy() 1 less than of max size. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07 @479  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  480  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  481  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  482  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  483  	/* Only last byte should be %NUL */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  484  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  485  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  486  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 3], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  487  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  488  	src[sizeof(src) - 2] = 'A';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  489  	/* But now we trip the overflow checking. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  490  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  491  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  492  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  493  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 1);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  494  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  495  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  496  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  497  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  498  	/* And we will not have gone beyond. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  499  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  500  
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  501  	src[sizeof(src) - 1] = 'A';
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  502  	/* And for sure now, two bytes past. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  503  	KUNIT_ASSERT_TRUE(test, strcpy(pad.buf, src)
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  504  				== pad.buf);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  505  	/*
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  506  	 * Which trips both the strlen() on the unterminated src,
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  507  	 * and the resulting copy attempt.
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  508  	 */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  509  	KUNIT_EXPECT_EQ(test, fortify_read_overflows, 1);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  510  	KUNIT_EXPECT_EQ(test, fortify_write_overflows, 2);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  511  	/* Trailing %NUL -- thanks to FORTIFY. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  512  	KUNIT_EXPECT_EQ(test, pad.buf[sizeof(pad.buf) - 1], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  513  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  514  	KUNIT_EXPECT_NE(test, pad.buf[sizeof(pad.buf) - 2], '\0');
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  515  	/* And we will not have gone beyond. */
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  516  	KUNIT_EXPECT_EQ(test, pad.bytes_after, 0);
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  517  }
fa4a3f86d4982b lib/fortify_kunit.c Kees Cook 2023-04-07  518  

:::::: The code at line 479 was first introduced by commit
:::::: fa4a3f86d4982b603865ccb97dde82f0ae1e3302 fortify: Add KUnit tests for runtime overflows

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
