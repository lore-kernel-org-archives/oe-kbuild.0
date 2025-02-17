Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B88BE8
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 11:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739790387; cv=none; b=ODJyrS1UUpBvjHLHexmb4Dq7pYDpf4YeU8n0aXx/IYV9wmivYsCQx3dP/ExvVbHdHJ9Q2CdJ5+C+ADZFlFtAnLhPHezqoVP2x33nTZ0EjtTqhaH8ansPoUYg31NqlkBQsjq7QJc4WsVhTDHr/1eiEOROVIVRgOb056uiY19sEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739790387; c=relaxed/simple;
	bh=DpML8Hl1kMUHHK+HQ0P0i2OPrmybeGceaU1cifxAbD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mfkt/5ftW8ibALTyC+0FDA+iKrzZfwG3X6Zv9mmzx2Bt3oIUG007qNeBAyLPS/t7uGFsL7SWPvuGhnKyXeRInlytYZ6l4FrKULahj6HaN8Rs2MxpNgCsdpV9A9N85HEaSmulhtXZvIUu7fEbQpH3KstkMXt+HX/J36Du80mZ7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2lwf9/W; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2lwf9/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739790386; x=1771326386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DpML8Hl1kMUHHK+HQ0P0i2OPrmybeGceaU1cifxAbD4=;
  b=U2lwf9/Wz2jL2jIFQS74N9jUJ72A0z5iXhwfldmcSE0OIBIZ2TNlKfjq
   hTo1LlfrIrci82G9WjR7SBXJ6w+VEfXJWhWcBEWZz7wvrsSPKjIhOzwUJ
   FcIPc6YCfqrwUEaFIRjEVMR+/De+iHXgkP0ysmSWBp4Hsm8L1+ag1KgSv
   76myNWTlRFHwzadbCQ61eHbtdCIcA67vhNMcoUk72P0Ar+ELbKklWehi1
   DSDuRWS5JedsItroSHfyNozMXFpRfWDYWX+55Nje7OkBfdCxqvInReIdZ
   Wu012dVvlqbsfwfzo2KtYenv95cchljPr/IpkUiL4dE3PTjXwCWO1carS
   g==;
X-CSE-ConnectionGUID: pb7ZyInPQbmcrhBd0KCpbw==
X-CSE-MsgGUID: O+0XRoqITDKVl4rPIszPVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51449427"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="51449427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 03:06:25 -0800
X-CSE-ConnectionGUID: 2g9aeTUBSdu6gSaKA9rBXw==
X-CSE-MsgGUID: xKKwOuzWRDisehnaVdlaBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="114294001"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 03:06:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjyxC-001D1L-08;
	Mon, 17 Feb 2025 11:06:22 +0000
Date: Mon, 17 Feb 2025 19:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2486/4577] lib/tests/slub_kunit.c:99
 test_first_word() error: dereferencing freed memory 'p' (line 98)
Message-ID: <202502171848.zP5cSaBu-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   253c82b3a2cec22bf9db65645f934fbe095899a3
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [2486/4577] lib: Move KUnit tests into tests/ subdirectory
:::::: branch date: 4 hours ago
:::::: commit date: 6 days ago
config: sparc64-randconfig-r071-20250216 (https://download.01.org/0day-ci/archive/20250217/202502171848.zP5cSaBu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502171848.zP5cSaBu-lkp@intel.com/

smatch warnings:
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p' (line 98)

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
