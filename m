Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A004C79
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 04:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746074211; cv=none; b=pn1TohOcf+IwRZIXso8R+feMoazcHYuLcGXm+vwRuIIwszsm9VzpimYZ6F4ATBqZrAsSd59kqjWRPgAJTY5SYz9zb7FQ04MUU/NyN5Khg/eUfyET4mSFdgEHWAc4Lp49F74kesyNPMCKtoqzNx0gxRT0vShZ4/6GHX/9Yw3F8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746074211; c=relaxed/simple;
	bh=y+tlGc+ZDyE3LnpXUDHngSioXfo508nVhMGoJ2WD/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hb/4bsCK2ug65vxE4KomN5GSsYcQp8RHVYuJDZBGBGplucPvrAvL06Z7DDGxxV3N11FfEjFLXSbFjdasmrEhJGB/0MlunbxatISklBCMep+8OiYrjJ4Ndchft56zYKljNLVpmoAyjqWBdUHiUq6PAuP6TxO4yJLujjP5Fux5S54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWUCdGjP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWUCdGjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746074208; x=1777610208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+tlGc+ZDyE3LnpXUDHngSioXfo508nVhMGoJ2WD/Rg=;
  b=LWUCdGjPlXNimGQ6WqLEdyQQNEXHyXiKfjmAgRsGh66YAp4+Tt/yMCEI
   RilxqzL32Dh/XzM8sTh9qlr5HbmDNnBleNy5fhmCiqPhnXGYK9ErJ67Ft
   CpKS/v/vdJeU5g3PMTbgwMzBJbOOT/kheJR6NmNZ/SR/pFevjkCkWiuWM
   ccEeKhGmqPLz5pxtJVv+zzvr0fEXKVm2CNbKhC74AhWAsV4g/ektixIuw
   nfy7LBm2nBDxkKOkJh9dtkMntJkxGY+uo7Pa/kkCt9vF/JK4NdcMy0fCs
   vcleHtFadTonNTFhmLEc123nMOdJs6dPZaeRwTsnmHB/4vuUbKXYibWxT
   Q==;
X-CSE-ConnectionGUID: YnauDsn6QRWpUUNPIYi+eQ==
X-CSE-MsgGUID: uydGrrRjSiqR+Ik4lWpq4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51569956"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="51569956"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 21:36:48 -0700
X-CSE-ConnectionGUID: ah9ANU0KS+6aBeWn62WIKw==
X-CSE-MsgGUID: YrytSv0HQ8Gb+UZwV19tSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="165367302"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Apr 2025 21:36:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uALfA-0003xp-0Q;
	Thu, 01 May 2025 04:36:44 +0000
Date: Thu, 1 May 2025 12:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing
 freed memory 'p' (line 55)
Message-ID: <202505011225.nbEC7MPq-lkp@intel.com>
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
head:   7a13c14ee59d4f6c5f4277a86516cbc73a1383a8
commit: db6fe4d61ece24193eb4d94a82d967501d53358c lib: Move KUnit tests into tests/ subdirectory
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20250501 (https://download.01.org/0day-ci/archive/20250501/202505011225.nbEC7MPq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505011225.nbEC7MPq-lkp@intel.com/

New smatch warnings:
lib/tests/slub_kunit.c:59 test_next_pointer() error: dereferencing freed memory 'p' (line 55)
lib/tests/slub_kunit.c:114 test_clobber_50th_byte() error: dereferencing freed memory 'p' (line 113)

Old smatch warnings:
lib/tests/slub_kunit.c:99 test_first_word() error: dereferencing freed memory 'p' (line 98)
lib/tests/slub_kunit.c:131 test_clobber_redzone_free() error: dereferencing freed memory 'p' (line 130)

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
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @113  	kmem_cache_free(s, p);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28 @114  	p[50] = 0x9a;
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  115  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  116  	validate_slab_cache(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  117  	KUNIT_EXPECT_EQ(test, 2, slab_errors);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  118  
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  119  	kmem_cache_destroy(s);
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  120  }
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  121  #endif
1f9f78b1b376f8 lib/slub_kunit.c Oliver Glitta 2021-06-28  122  

:::::: The code at line 59 was first introduced by commit
:::::: b1080c667b3b2c8c38a7fa83ca5567124887abae mm/slub, kunit: Use inverted data to corrupt kmem cache

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
