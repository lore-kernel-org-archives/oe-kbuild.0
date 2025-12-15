Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5F288CA3
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 03:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765769952; cv=none; b=IjWSwo2AMPie7rnD8vMbWcIwrCi+hjvonrNgKXOT0M2PaHX7w48nS25f5vZKPdYkfXxq3BlNGcIEL/kDw2T/sacFajA47Op44+vwIl8q+WOf+Y9vGfAuHES4yr9aD1eN8DPZJgYMHnfvHibBYCV21dyGqAG7cfdm5mwFNjPJqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765769952; c=relaxed/simple;
	bh=1u0aZwhPcDPcBVYYgxAiZPqFbVVXKSm8bE4TYHk46Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2iYy0lsKULrA34ydXKcuNyiMrI/H6TkVedC+dYpw8KYQN4QiFkZuL6+iK1RHr9NLCWrk5GLCO2xd7O1txGEgHMs9Wk1W0YMcnZ35p+PdDDxzv7TdRGyjKIVbvhO7kNvLbUsipk7h49BDGqJYkOJk02GIBjCg5Se9J98DZuE1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYqNZlLR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYqNZlLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765769950; x=1797305950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1u0aZwhPcDPcBVYYgxAiZPqFbVVXKSm8bE4TYHk46Wo=;
  b=nYqNZlLRdfGNoWgcnIe3PsLSK8QgSKBDcqf5eIE0uDk8YvCJH1zFgaEi
   0mFdjlP9hp4AvjkbI0ogByCr0ayJrn/kIEbnWP3JI9H604Wj/t87oi31H
   mPZuZckQCy22A4BYkNYJ5e9H7cF7hMuUDB5WFxLgEqrgSz0+ZULtNCnJs
   dHy4vWi8i8LVbHaTHWzM0a+VZB+71PQUec0vux/HEJQxtGTLk6ANHp6FV
   y3GVLIQWI6Nyfse8zFaeXRxHt56V8eZMN10ykrzpqtgWm9/6gF7blkwIX
   wnSTnyNCgkoo0lYIpHWnnIX4iDMw+Tsq/ef7Kpd3Xgs9lFfOHT1AHdx8Y
   w==;
X-CSE-ConnectionGUID: Tl30ak5zRT+mi3hhuFpYHg==
X-CSE-MsgGUID: 5tiIiFeDQaaDAypPvIyU9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="70248205"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="70248205"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 19:39:09 -0800
X-CSE-ConnectionGUID: QUetnYGdTP6x8bxcTrUM4A==
X-CSE-MsgGUID: FZLaE1XfTPqEVMwJFrx+Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="201798248"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2025 19:39:09 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUzQP-000000009kX-2H8r;
	Mon, 15 Dec 2025 03:39:05 +0000
Date: Mon, 15 Dec 2025 11:38:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing
 freed memory 'p' (line 98)
Message-ID: <202512151106.DcMT9dFE-lkp@intel.com>
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
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151106.DcMT9dFE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512151106.DcMT9dFE-lkp@intel.com/

New smatch warnings:
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p' (line 98)
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:827 overflows_type_test() warn: assigning (-128) to unsigned variable 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:874 overflows_type_test() warn: value s16min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:903 overflows_type_test() warn: assigning s32min to unsigned variable 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'

Old smatch warnings:
lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing freed memory 'p' (line 55)
lib/tests/slub_kunit.c:114 test_clobber_50th_byte() error: dereferencing freed memory 'p' (line 113)
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)
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
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'

vim +/p +99 lib/tests/slub_kunit.c

1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   91  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   92  static void test_first_word(struct kunit *test)
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   93  {
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   94  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_1th_word_free",
4d9dd4b0ce8807 lib/slub_kunit.c Feng Tang     2022-11-30   95  							64, SLAB_POISON);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   96  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28   97  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  @98  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  @99  	*p = 0x78;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  100  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  101  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  102  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  103  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  104  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  105  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  106  

:::::: The code at line 99 was first introduced by commit
:::::: 1f9f78b1b376f82cdd8ed73cc0abdb74d0453d43 mm/slub, kunit: add a KUnit test for SLUB debugging functionality

:::::: TO: Oliver Glitta <glittao@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
