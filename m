Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CF23B627
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765753677; cv=none; b=cLTPD7RFCfftZ/MOGmCHjQaQKApD/osSnMKMbC3+ciZwrw8mJzTN4mGZQOp47zPgZlApaqR80H8V0DvqdELqF7TAARI9uBKC8rCIQAdxgk5bF36VKYoOuLFMtBgU7trVck1MzygedeHEtJRtDskhIonz/7o5cbpxuU46mFvrrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765753677; c=relaxed/simple;
	bh=Ba/iwSMu/fCQ9i1Dy/i1IxBS/Jy+K/pOy1SWdUp+b8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HRKm2ZbO0L98qnuKT9/w/Lko4DSrSnJw5mvyug4o5C6vBIvkny56cyBTQrcuy89k7/dUfVQ3G3wws20f3v4Ff8RagKpDNBuQL36nVT9ze1X/R7oy5PVgG7Z/vJBRHSTPgAT2BgRQW5bBoNr3ksR2JozIxM9Pn3PnAnmrmDC0lxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1sb1ClT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1sb1ClT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765753674; x=1797289674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ba/iwSMu/fCQ9i1Dy/i1IxBS/Jy+K/pOy1SWdUp+b8s=;
  b=i1sb1ClTjEIbzo7/7KZKFb/H5YfdhEeba62trtGyLgkDbSt1uEqnCSrn
   gsuSRHgQ/WyDAir2lWe7CfNzcwrqa55d+LdUYiBq4W8x222nbeNWvm69S
   tDQtOPLhwz+3HpOCVVNY/x8tuySNgwYEXSCHYIKfPjM5PCTj0u3A8bq28
   tc0ljcGMcH1jMflte6P2JigQmjBlYeVlxtGwhN13LWbLHEbkPwNhJnpwe
   vCRPJOPxE5eE2r9eXhTJYtnv5qKZ+VHxkt9Fug46gXVY1/UFnMmCk8iEk
   w99mKpFL0EnmBMoLIhhmfVow3U9KqfryFgB8yJhQDiLrEX8nbiQ61nSwJ
   Q==;
X-CSE-ConnectionGUID: c9ywh9j2RZuZVuDrXAFepg==
X-CSE-MsgGUID: lFb8mJ5ETxWuOx8o1k3X6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66838477"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="66838477"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:07:52 -0800
X-CSE-ConnectionGUID: HYWX8wZ8RiuqvNXhY95jNw==
X-CSE-MsgGUID: 6jyCMPxzSOKoancaXcp7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201989828"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Dec 2025 15:07:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUvBs-000000009TR-18EG;
	Sun, 14 Dec 2025 23:07:48 +0000
Date: Mon, 15 Dec 2025 07:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/overflow_kunit.c:922 overflows_type_test() warn: value
 s32min can't fit into (-128) 'v'
Message-ID: <202512150715.fbpVfmBJ-lkp@intel.com>
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
config: i386-randconfig-141-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150715.fbpVfmBJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512150715.fbpVfmBJ-lkp@intel.com/

New smatch warnings:
lib/tests/overflow_kunit.c:922 overflows_type_test() warn: value s32min can't fit into (-128) 'v'
lib/tests/overflow_kunit.c:922 overflows_type_test() warn: value s32min can't fit into (-128) 'v'

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
lib/tests/overflow_kunit.c:925 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:925 overflows_type_test() warn: 't1 + v' 32768 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:926 overflows_type_test() warn: value (-32769) can't fit into s16min 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:927 overflows_type_test() warn: 't1 + v' 2147483647 can't fit into 32767 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'
lib/tests/overflow_kunit.c:928 overflows_type_test() warn: value s32min can't fit into s16min 'v'

vim +922 lib/tests/overflow_kunit.c

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
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24  @922  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   923  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   924  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   925  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   926  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   927  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
4b21d25bf519c9 lib/overflow_kunit.c Kees Cook 2022-10-24   928  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
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

:::::: The code at line 922 was first introduced by commit
:::::: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
