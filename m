Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADAB130E4A
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728968732; cv=none; b=LsC08/33yaVHzUmOE6s8RotiZ3980YTNip5n1Jy0Fh1Vyn2X0VWHG5mGnC+urZhtrt3vo4HvEZzdYJEGqx0mvzuC80U8odUSidB/I0A6ketZ96GPb0VlkvZALiJN9eR1YlOC+xs5MCh39o/ECHtOHLYh5u7hzbWPZUwLlfg3yH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728968732; c=relaxed/simple;
	bh=p5vuEkKAd/YtDT8b2rXODLWGElwQw5Wx/gWLr8w2wTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aj0K3AdY5H+R8Zf0onSQdRkBbrduqAIYaryqS/CmKsLV0yB5zeJjqZbHY/iY6vVwiuOkzNVCUGaJ5GLZIu/tQyzBI3vKlXGCV1ZB2vaSSlRMjf0rEiqFt3E2elcUI82ZxohKOsWSLxtxcjOoUznD124DcmBgPqIGwU4Y79lyYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cf+5s+Mv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cf+5s+Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728968730; x=1760504730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5vuEkKAd/YtDT8b2rXODLWGElwQw5Wx/gWLr8w2wTk=;
  b=cf+5s+MvOXsCajkHc+raIlEWfsixDKUxghIbFpRJXNn012Q5c+C4ZfeH
   Sffb73uGjuwWEeW6SolT+LQe1QcF0QC8UnOssL60e66TId8TKXTeZED/U
   EL71VFYHwJPSkpda5nTCZEZUm2hZVF5mLGiHvZ4YwOQ+AyzviM2v5Uygw
   MQjKRABPpZ26MN+xYCah6pnhm+DNEphhz1PvoXQsK1cv0yczjIN0+6yAR
   I72m4+OfksK1HXIOeRIw94WIJ6Ml70HdprHu1YxL4NpIDjuRvS94UCjKk
   LDUDryTJHk4ncDen08tpUa7VgxmUnJjirYJAsM+jSk8f7NhC7lA5nNKqp
   g==;
X-CSE-ConnectionGUID: 6dJlXHgwRN2ot7LUK8zQHg==
X-CSE-MsgGUID: 0L7Sqn2FT6qmsiinWU+xJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28221469"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="28221469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 22:05:30 -0700
X-CSE-ConnectionGUID: psRU8EEpT3Wbesbjd5htng==
X-CSE-MsgGUID: aQ6IRZcaTHeL9F2dKzAHcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77785844"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Oct 2024 22:05:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0ZkM-000He7-1e;
	Tue, 15 Oct 2024 05:05:26 +0000
Date: Tue, 15 Oct 2024 13:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/6] lib: Move KUnit tests into tests/ subdirectory
Message-ID: <202410151246.ymPWVzSF-lkp@intel.com>
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
In-Reply-To: <20241011072509.3068328-5-davidgow@google.com>
References: <20241011072509.3068328-5-davidgow@google.com>
TO: David Gow <davidgow@google.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[cannot apply to geert-m68k/for-next geert-m68k/for-linus brauner-vfs/vfs.all linus/master v6.12-rc3 next-20241014]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Gow/lib-math-Move-kunit-tests-into-tests-subdir/20241011-153344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20241011072509.3068328-5-davidgow%40google.com
patch subject: [PATCH 3/6] lib: Move KUnit tests into tests/ subdirectory
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r072-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151246.ymPWVzSF-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151246.ymPWVzSF-lkp@intel.com/

New smatch warnings:
lib/tests/memcpy_kunit.c:320 init_large() warn: calling memset(x, y, ARRAY_SIZE());
lib/tests/fortify_kunit.c:479 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p'
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:857 overflows_type_test() warn: assigning s16min to unsigned variable 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:872 overflows_type_test() warn: value (-129) can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:1155 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/tests/overflow_kunit.c:1155 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
lib/tests/fortify_kunit.c:490 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
lib/tests/fortify_kunit.c:503 fortify_test_strcpy() error: strcpy() 'src' too large for 'pad.buf' (33 vs 32)
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:830 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:850 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:851 overflows_type_test() warn: 't1 + v' 65535 can't fit into 32767 'v'
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
lib/tests/overflow_kunit.c:1156 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/tests/overflow_kunit.c:1156 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/tests/overflow_kunit.c:1157 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/tests/overflow_kunit.c:1157 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/tests/overflow_kunit.c:1157 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
