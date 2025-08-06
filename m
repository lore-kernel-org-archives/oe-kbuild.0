Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541867261C
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480393; cv=none; b=d9wItb6qBxrenvvqvUBFfZqho9QIluy0I3BwwZXA8m5KymPbC8vJcqV0FGd79Kl5nm7yaZimDUTIVMoW3PtNDDqj91OYYmKvuQDHkKD8t0sU5Cv0BB36E1Dws7CziFcQN2ECELzAaqGOdPCePBJDtQmAN4Ge6kuCKHAR6lZ+ExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480393; c=relaxed/simple;
	bh=+cwMayzzpGPuOeToUBa0027Ir1Q+o3zDIgxtyMFDJOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0q2glTT+TLtva/xajh74F4xzeu4fW0dYEPIvtETVC1iA/EwquQa2XEjyYmDb9HUF/KNuoTEIp6vxUFpSLe63a1tMRlIWOQvtT3wKgnFU/ycIqXM9RVdwil8j0ZRHqMFlsw3JZb5su8QPSKnb6B9tKkMpd6bgs5FZ3oypWa8tDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpu1S5yF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpu1S5yF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754480391; x=1786016391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+cwMayzzpGPuOeToUBa0027Ir1Q+o3zDIgxtyMFDJOA=;
  b=Xpu1S5yF0BjvzI+GA/9bCrMyibkx/QI62lVHTQfMWoyUo400SKSOUnHE
   jqjebIzBZPorB4b5cauSWV+1AbMAf6YdF22oNJlBijySLFZVjfq07GicG
   eIw9c6NfvkGRjucxqLiOmlxNXJxRPPbc1P7wtPd1VxxiunWjd/QeUwOoO
   41jONfupBvkg4fiE47xjjnixq7sOFz9fwOhDbnDahoI9+KySOQ7sct2dr
   K7XcSxsTTpqQG6Eqs0fMKyjSK70JDaflRAsRPeU0DDC+ByKK3cnKD46Iy
   x+uytOBQddEaPrBk/Zvr/D/2/33LZNdATY6Ik4vY05DYwseUUNxCguSvl
   A==;
X-CSE-ConnectionGUID: Rr+L8WTHQSCEsmYhCZ2t/g==
X-CSE-MsgGUID: YKYkPXiaQnaSvyY4n25Kdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55831534"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="55831534"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 04:39:51 -0700
X-CSE-ConnectionGUID: vnLtItLzR8a90eeOOBsDkA==
X-CSE-MsgGUID: +ygtitfcSfuXNFILQI99Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168928952"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Aug 2025 04:39:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujcUl-0001be-13;
	Wed, 06 Aug 2025 11:39:47 +0000
Date: Wed, 6 Aug 2025 19:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed
 memory 'ptr1' (line 425)
Message-ID: <202508061901.hOh0y2Zh-lkp@intel.com>
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
TO: Matthew Maurer <mmaurer@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   479058002c32b77acac43e883b92174e22c4be2d
commit: a2f11547052001bd448ccec81dd1e68409078fbb kasan: rust: Add KASAN smoke test via UAF
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r071-20250806 (https://download.01.org/0day-ci/archive/20250806/202508061901.hOh0y2Zh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508061901.hOh0y2Zh-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:427 krealloc_uaf() warn: passing freed memory 'ptr1' (line 425)
mm/kasan/kasan_test_c.c:857 rcu_uaf_reclaim() error: dereferencing freed memory 'fp' (line 856)
mm/kasan/kasan_test_c.c:966 kmem_cache_double_free() error: double free of 'p' (line 965)
mm/kasan/kasan_test_c.c:1201 mempool_uaf_helper() warn: passing freed memory 'elem' (line 1199)
mm/kasan/kasan_test_c.c:1270 mempool_double_free_helper() error: double free of 'elem' (line 1268)
mm/kasan/kasan_test_c.c:1378 kasan_global_oob_right() error: buffer overflow 'array' 10 <= 13

vim +/ptr1 +427 mm/kasan/kasan_test_c.c

b87c28b9a7ef64 lib/test_kasan.c Andrey Konovalov 2021-02-25  412  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  413  /*
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  414   * Check that krealloc() detects a use-after-free, returns NULL,
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  415   * and doesn't unpoison the freed object.
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  416   */
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  417  static void krealloc_uaf(struct kunit *test)
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  418  {
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  419  	char *ptr1, *ptr2;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  420  	int size1 = 201;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  421  	int size2 = 235;
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  422  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  423  	ptr1 = kmalloc(size1, GFP_KERNEL);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  424  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25 @425  	kfree(ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  426  
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25 @427  	KUNIT_EXPECT_KASAN_FAIL(test, ptr2 = krealloc(ptr1, size2, GFP_KERNEL));
ccad78f17f9f2a lib/test_kasan.c Ricardo Ribalda  2022-02-11  428  	KUNIT_ASSERT_NULL(test, ptr2);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  429  	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)ptr1);
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  430  }
26a5ca7a73be31 lib/test_kasan.c Andrey Konovalov 2021-02-25  431  

:::::: The code at line 427 was first introduced by commit
:::::: 26a5ca7a73be31f76c291465680517cde37051ca kasan, mm: fail krealloc on freed objects

:::::: TO: Andrey Konovalov <andreyknvl@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
