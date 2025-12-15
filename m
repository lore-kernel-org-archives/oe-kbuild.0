Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BC31B830
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765773855; cv=none; b=ovU1nzdl+oXvpNLlDzmM5aiBGGW+mHIsfjSH5iYMdQPDW2NIodKi4uSx2hPFXkncvFsOFy05zZfLrhVz58x42/NzOPlr4N9FGdT6wj6TgFBl4n4co9aunyHeTAVPk1Xn5hLgeaf6tNAVi2/hChysNYsC49oh+BcSFw2kFAkTnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765773855; c=relaxed/simple;
	bh=dqv9efj5+I1c1JB06hJ3kjbejPu7xdPHq0jZkeHP1NE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J4W8lNz+Dg7c9Dzk4XqqVBjNlMuFEGgSYCXG0fw0kw3X4dBk/YJyte2bU54r5ezwjXQuRSdTUiiUPBQHY0pNx/ek5mvq/8vtrZh21BHejnkDc0FFFHIC9bXyub0bLEBuTviW5+QmbGvvsHfuXP8+j0vLZBwh7DdgpUTKK49haqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6jwhztK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6jwhztK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765773853; x=1797309853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dqv9efj5+I1c1JB06hJ3kjbejPu7xdPHq0jZkeHP1NE=;
  b=A6jwhztKF3uF0coT37wm/uRryPehUG6h5OUtUBBvfj3/Y8U/a41R0YJ6
   VZdFmQ850oP9SMy9KX1C2jU9uNMYt1RludIvzbQY/Hau0FN40SNbiSsG6
   eu+ceEutc/v2ooH5vXSJBZHGQJA5MkzjTcQU+jmt+c5yACoTwv9uq8VNU
   Ut8PYnXzuGtIKEREXnKa39hDfMUDXcs0gvhgxSjtZtd8gjOvL6wXqtLgh
   L+gIrZ/aX/dmRUjw+Q2KbvdXNVc9GGg+prGUbYez8OUzlBuKissTlV3Af
   ALk0AIs6juUg5g9uGS1d8EvGELMa+AkavU/q+dnWmsQf4mwsnGpVmdq1N
   g==;
X-CSE-ConnectionGUID: OKLg5TMoR1KRZOoSaQVwqQ==
X-CSE-MsgGUID: zoC8Mk4JT1+O1sIb342pIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67709255"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67709255"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 20:44:12 -0800
X-CSE-ConnectionGUID: +U5FS5W9RiWgPZcHndCo0Q==
X-CSE-MsgGUID: Gbc5G9mNSu26w84f4LonPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198469177"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2025 20:44:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV0RM-000000009nc-2xYB;
	Mon, 15 Dec 2025 04:44:08 +0000
Date: Mon, 15 Dec 2025 12:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/memcpy_kunit.c:320 init_large() warn: calling memset(x, y,
 ARRAY_SIZE());
Message-ID: <202512151254.Yc0Ruod3-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   10 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 10 months ago
config: arc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151254.Yc0Ruod3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512151254.Yc0Ruod3-lkp@intel.com/

New smatch warnings:
lib/tests/memcpy_kunit.c:320 init_large() warn: calling memset(x, y, ARRAY_SIZE());
lib/tests/slub_kunit.c:114 test_clobber_50th_byte() error: dereferencing freed memory 'p' (line 113)
lib/tests/fortify_kunit.c:479 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'

Old smatch warnings:
lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing freed memory 'p' (line 55)
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p' (line 98)
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
lib/tests/fortify_kunit.c:490 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/fortify_kunit.c:503 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
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

vim +320 lib/tests/memcpy_kunit.c

96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  309  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  310  static void init_large(struct kunit *test)
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  311  {
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  312  	/* Get many bit patterns. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  313  	get_random_bytes(large_src, ARRAY_SIZE(large_src));
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  314  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  315  	/* Make sure we have non-zero edges. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  316  	set_random_nonzero(test, &large_src[0]);
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  317  	set_random_nonzero(test, &large_src[ARRAY_SIZE(large_src) - 1]);
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  318  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  319  	/* Explicitly zero the entire destination. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28 @320  	memset(large_dst, 0, ARRAY_SIZE(large_dst));
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  321  }
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  322  

:::::: The code at line 320 was first introduced by commit
:::::: 96fce387d58fa8eae6e8d9b1ecdfbc18292d7a68 kunit/memcpy: Add dynamic size and window tests

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
