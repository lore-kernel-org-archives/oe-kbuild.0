Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DB469840
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620319; cv=none; b=Z0Nk+SVBKGf/+OwSqDYKcjx1Oelfc9J88nd/fDm3uiubOFaLAbx2dgFmrR5mEHLF1SgZaPAlHgNXfLbmtHkJr6Mxsppo1p9fgPeD+td72bz2rRSfJFmd7xPlOfwUhUDmoSaC8Um0POUaZdpRWZUzi3D3Ep4gZHHmmmija54bxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620319; c=relaxed/simple;
	bh=c2zAGTJHcsmvKKErnJtTE9Qtp6C+xl96WUFoXEcI7Mk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TIMdH5s0cNYkfyTmxVi2pRbsVu/MH2jQupaJtJolIlmq+lkJAH04HUi4Lq+RqyWIRVwlsKgRCcoDr29Gdt+R9k//j/eUPXT26pkyoaUpD/Z6wwIqXLIY7wpcE+OnH30/NkhmlEBA4Fr/R1djTKqkV9QR7iiqDkCSf2fy1M1ivfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZTFfbkE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZTFfbkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786620317; x=1818156317;
  h=date:from:to:cc:subject:message-id;
  bh=c2zAGTJHcsmvKKErnJtTE9Qtp6C+xl96WUFoXEcI7Mk=;
  b=NZTFfbkEKGsMDzlHiVNcj2lo9sdwunyrtEn4ZmtG+zfIi6+oL/8HaKew
   AurrrP2Um9MHrTIZuZ6odKXEkyVcJNBQhvOg+vhfy5jfUM4wKSeGjtFwu
   MAJ514t6pGLLBHTo0ActRvYYCmEvWzoaASvp13Yg5SU6Nkf9CGfgZfIil
   dQICV4G0SOtAJrHUf8xXHG1HeVswv93Z2oxEODd2Ct9iLA1lxwTQDSQXT
   QCRlFjecEGS/45LncwhFI1Q4Ltqn5k2zHdZFxz+hOVkyReG/xCJkdxzGn
   ZHALk1q9k3nbDsnevkzx2PIj540vKf8jz2iczUrBtUTIEgtlLeTXjbFjA
   Q==;
X-CSE-ConnectionGUID: jtEbIbKlScy79RjqRxoYKA==
X-CSE-MsgGUID: EXo7ob6WScuq2lxrM3XHJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="91066499"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="91066499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:25:15 -0700
X-CSE-ConnectionGUID: ClmVSVQrRY6ypwwCALwFoA==
X-CSE-MsgGUID: KcJ+ATcCSnWpG0GSVZz55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260101879"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 04:25:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTYd-00000000TqK-1fPr;
	Thu, 13 Aug 2026 11:25:11 +0000
Date: Thu, 13 Aug 2026 19:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-sp 22/22]
 mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing freed
 memory 'ptr2' (line 470)
Message-ID: <202608131940.bMl0Pqy8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   eedd9dd895fd15e0a64de9347be03f33012ece51
commit: a2f11547052001bd448ccec81dd1e68409078fbb [22/22] kasan: rust: Add KASAN smoke test via UAF
:::::: branch date: 6 days ago
:::::: commit date: 1 year, 11 months ago
config: x86_64-randconfig-161-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131940.bMl0Pqy8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608131940.bMl0Pqy8-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:472 kmalloc_uaf_16() error: dereferencing freed memory 'ptr2' (line 470)

vim +/ptr2 +472 mm/kasan/kasan_test_c.c

3f15801cdc2379 lib/test_kasan.c      Andrey Ryabinin  2015-02-13  456  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  457  static void kmalloc_uaf_16(struct kunit *test)
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  458  {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  459  	struct {
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  460  		u64 words[2];
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  461  	} *ptr1, *ptr2;
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  462  
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  463  	KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test);
85f195b12d8b76 mm/kasan/kasan_test.c Marco Elver      2023-02-24  464  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  465  	ptr1 = kmalloc(sizeof(*ptr1), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  466  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  467  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  468  	ptr2 = kmalloc(sizeof(*ptr2), GFP_KERNEL);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  469  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01 @470  	kfree(ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  471  
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01 @472  	KUNIT_EXPECT_KASAN_FAIL(test, *ptr1 = *ptr2);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  473  	kfree(ptr1);
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  474  }
58b999d7a22c59 lib/test_kasan.c      Andrey Konovalov 2020-11-01  475  

:::::: The code at line 472 was first introduced by commit
:::::: 58b999d7a22c59313e1e84832607c7a61640f4e7 kasan: adopt KUNIT tests to SW_TAGS mode

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
