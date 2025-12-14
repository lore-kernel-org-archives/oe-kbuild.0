Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057024CEEA
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765755656; cv=none; b=XEZb373PRPAR737QFho1GANFaEQ7ol8VyKiXsyh77nGQ72kxZj+C/qIF4Mr8OzN1AfQUf1eJ9s9ACWGJ2EJgYcUcJxdr7agppzRSRreir5hfunwzu30z41q/6/fCwow/JVivR1oy98lpdRNIRz/GLrwjigJckIE7XHhrKyA4WBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765755656; c=relaxed/simple;
	bh=qlc/Xva7GSnELdYVWWpU8Ov2L3bv1aWI63/GXlxM3S0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bYZm+kSeW35SSXFchv+sGCAUWdYN63f+ecMwN7UHLPobga6gp3bdSSnrpGFSCX43EVYHJwv65CjDBUOUn70p/sYErrn6vzX+7Zxg9JXVCNhoqNbYStXymTpVWnHLG7U5oxRmmAx0/jyN5/DGCYOcP9Jb4cc9jjP0e99sN460Dmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTsz5CvL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTsz5CvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765755654; x=1797291654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlc/Xva7GSnELdYVWWpU8Ov2L3bv1aWI63/GXlxM3S0=;
  b=mTsz5CvLtNUyGc3E0Uh2E1/SxjHPCxkydnGFvSnBNeoXqnbLVk0v5WcG
   5pWzv5R7NVc+ScN0zOvF+8qU15xuReP/hYTFCbfvaGhA7xx20flxCpjVv
   AlemZdIunAdSasrgs2BTnFN3aMzoQDqN7hn3RNfn+Rbj7Xrw/db9gRBAc
   PHgsH9/wg/HlrN1ZQDEjz11YdVATVUbm033A6am77HUappvs649MghBVn
   pzoseqqvlwMZ3B8gH16QbQiG6ZOCDnMVFad+8z1Zn5vKVnWCkA3jUjmy3
   gl8b3fBWQQdYf27FYyYlOI78XIPKll+6gkS15kqslEzZZFMy5oXGc4VVY
   g==;
X-CSE-ConnectionGUID: 6sfv6qBcQlm9s40GaUX/VA==
X-CSE-MsgGUID: PUFGOOZlRkC5XhQ58gQrqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67621402"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67621402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:40:53 -0800
X-CSE-ConnectionGUID: uQwYdV9OQ/ymprLRRHDqyA==
X-CSE-MsgGUID: CP2YrERgSLemku81cWZ8Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="234973964"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2025 15:40:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvhp-000000009Ut-2uhM;
	Sun, 14 Dec 2025 23:40:49 +0000
Date: Mon, 15 Dec 2025 07:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing
 freed memory 'p' (line 55)
Message-ID: <202512150719.K7415waJ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150719.K7415waJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150719.K7415waJ-lkp@intel.com/

New smatch warnings:
lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing freed memory 'p' (line 55)
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)
lib/tests/overflow_kunit.c:528 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'
lib/tests/overflow_kunit.c:848 overflows_type_test() warn: 't1 + v' 65535 can't fit into 127 'v'

Old smatch warnings:
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p' (line 98)
lib/tests/slub_kunit.c:114 test_clobber_50th_byte() error: dereferencing freed memory 'p' (line 113)
lib/tests/overflow_kunit.c:480 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:509 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/tests/overflow_kunit.c:511 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:529 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:566 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/tests/overflow_kunit.c:567 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
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

vim +/p +59 lib/tests/slub_kunit.c

1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   45  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   46  #ifndef CONFIG_KASAN
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   47  static void test_next_pointer(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   48  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   49  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_next_ptr_free",
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   50  							64, SLAB_POISON);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   51  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   52  	unsigned long tmp;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   53  	unsigned long *ptr_addr;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   54  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  @55  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   56  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   57  	ptr_addr = (unsigned long *)(p + s->offset);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   58  	tmp = *ptr_addr;
b1080c667b3b2c lib/slub_kunit.c Guenter Roeck 2024-04-02  @59  	p[s->offset] = ~p[s->offset];
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   60  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   61  	/*
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   62  	 * Expecting three errors.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   63  	 * One for the corrupted freechain and the other one for the wrong
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   64  	 * count of objects in use. The third error is fixing broken cache.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   65  	 */
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   66  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   67  	KUNIT_EXPECT_EQ(test, 3, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   68  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   69  	/*
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   70  	 * Try to repair corrupted freepointer.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   71  	 * Still expecting two errors. The first for the wrong count
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   72  	 * of objects in use.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   73  	 * The second error is for fixing broken cache.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   74  	 */
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   75  	*ptr_addr = tmp;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   76  	slab_errors = 0;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   77  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   78  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   79  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   80  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   81  	/*
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   82  	 * Previous validation repaired the count of objects in use.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   83  	 * Now expecting no error.
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   84  	 */
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   85  	slab_errors = 0;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   86  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   87  	KUNIT_EXPECT_EQ(test, 0, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   88  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   89  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   90  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   91  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   92  static void test_first_word(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   93  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   94  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_1th_word_free",
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   95  							64, SLAB_POISON);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   96  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   97  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   98  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   99  	*p = 0x78;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  100  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  101  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  102  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  103  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  104  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  105  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  106  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  107  static void test_clobber_50th_byte(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  108  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  109  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_50th_word_free",
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  110  							64, SLAB_POISON);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  111  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  112  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  113  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  114  	p[50] = 0x9a;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  115  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  116  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  117  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  118  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  119  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  120  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  121  #endif
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  122  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  123  static void test_clobber_redzone_free(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  124  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  125  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_free", 64,
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30  126  							SLAB_RED_ZONE);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  127  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  128  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  129  	kasan_disable_current();
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @130  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @131  	p[64] = 0xab;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  132  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  133  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  134  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  135  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  136  	kasan_enable_current();
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  137  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  138  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  139  

:::::: The code at line 59 was first introduced by commit
:::::: b1080c667b3b2c8c38a7fa83ca5567124887abae mm/slub, kunit: Use inverted data to corrupt kmem cache

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
