Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E39328D8DB
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927199; cv=none; b=pdbF86Ymn7NSVjl6Sr9j4xaOI0VwhFi1amChoPQfg0+UKJnQF9DxKRYkOVZvUyAjSmfh2nMhUHts9fHv0weG1ZD1xxbLKb4nHtuKoykb7FaJ9IIKJnaOnjcvoS+oJdeIL1lMW0Q2/UgNO1vSjP7uO6gHQnzGM5iQTw/7tXeURfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927199; c=relaxed/simple;
	bh=FuGGI7b0b7vBpp38d5fnVP1VLwEoRUxsTbMKYjM5oK8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DAOjbbvPtQpz4AVRtvjB42qAObuKr/2LNt/MuXrFXFjKtHktDIQUsRKMy9HJJ6dQJP0fWqzWxo3zww+Upa1N/Mn4TxNIOnh2jsmq/mEVEHaTVXIkviXMvzqtcyarqBk+fhsa+WgER1gxtsx6F8/nSIvudy3JtT0vQ6VmgsM7PxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYrihe6R; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYrihe6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774927197; x=1806463197;
  h=date:from:to:cc:subject:message-id;
  bh=FuGGI7b0b7vBpp38d5fnVP1VLwEoRUxsTbMKYjM5oK8=;
  b=WYrihe6R0v6XRLBO1JbOk5ZmvGtScRwwnjUxaythOKyW8CDpYgLqF5qx
   wxLbdjY0wGIqevei6BCCDxJMZ4jM26XQCrPoM3jcnRvUFUyS4sT0mHo2k
   LO9HM5GPeTbWp2K01L6fITVSNsmoljac4Fv4dycC2QjVATmpv4UMsHcsP
   5DbZzzn/DShxtQBLTYcedvKtVmeoGXnPPRDAFq/vnut66BhcIwp4cDUfU
   50pX2Kh2VRwrQcURmOjj6Y0X3jtm4cHsnW8O/MutlaHwtfZBQtDpTayKw
   toVU0EBq8HovoPItcks/dCdgMhoG1DGiN8oe9f6wfl6wZvs7KR2YmRZ9r
   Q==;
X-CSE-ConnectionGUID: zCqCULWmS5aPiId9tbteLw==
X-CSE-MsgGUID: sxXPqNunQN2c/yirX6NbzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101387809"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101387809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 20:19:57 -0700
X-CSE-ConnectionGUID: dzxHyqpVSMSi5J5218/3Tw==
X-CSE-MsgGUID: b2m4ja28R5ePVwXJh08gwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249283223"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 20:19:56 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Pdx-0000000026N-22o0;
	Tue, 31 Mar 2026 03:19:53 +0000
Date: Tue, 31 Mar 2026 11:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/slub_kunit.c:131 test_clobber_redzone_free()
 error: dereferencing freed memory 'p' (line 130)
Message-ID: <202603311109.J1xOzi1d-lkp@intel.com>
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
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   1 year, 2 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-r071-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311109.J1xOzi1d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603311109.J1xOzi1d-lkp@intel.com/

smatch warnings:
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)

vim +/p +131 lib/tests/slub_kunit.c

1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  122  
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  123  static void test_clobber_redzone_free(struct kunit *test)
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  124  {
4d9dd4b0ce88072 lib/slub_kunit.c Feng Tang     2022-11-30  125  	struct kmem_cache *s = test_kmem_cache_create("TestSlub_RZ_free", 64,
4d9dd4b0ce88072 lib/slub_kunit.c Feng Tang     2022-11-30  126  							SLAB_RED_ZONE);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  127  	u8 *p = kmem_cache_alloc(s, GFP_KERNEL);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  128  
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  129  	kasan_disable_current();
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28 @130  	kmem_cache_free(s, p);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28 @131  	p[64] = 0xab;
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  132  
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  133  	validate_slab_cache(s);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  134  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  135  
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  136  	kasan_enable_current();
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  137  	kmem_cache_destroy(s);
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  138  }
1f9f78b1b376f82 lib/slub_kunit.c Oliver Glitta 2021-06-28  139  

:::::: The code at line 131 was first introduced by commit
:::::: 1f9f78b1b376f82cdd8ed73cc0abdb74d0453d43 mm/slub, kunit: add a KUnit test for SLUB debugging functionality

:::::: TO: Oliver Glitta <glittao@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
