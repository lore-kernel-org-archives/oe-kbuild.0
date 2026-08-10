Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989D12FF675
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786394807; cv=none; b=KQTE7y5OPhs0LUAiyKP18ZFRdjyIKaFwqtOo71lFcpBmiYbDslUydNcSBqUKiFUNlgSD/YQAtimDJZdwqfDZuf6BAuuHJOVCn6Maki7zhaq2kTZcIAgcfoXZhzi6ze+zPHicJQfjEuCW5lhYkppOGUJlmdQcHaE0l6dAGycslqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786394807; c=relaxed/simple;
	bh=ugZ24QpBDefJm8jqbQpvJdcrH/RxWwq2WYxeuyFbOFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FgzqsViVDgmGTVtXck6hmBKAG/VEuPfUAzAdLPdTyLQ2pkwHReLjTRYdnNMFMlPz1UVpp/TJ/UFjXlcJ7t/UEF/FSYJOGnorl4k2F/DSY812yJ0cIWAy68Tf54H5z+AYAWgYreRUDV2zZpPQ/wHR1hwx90u+rxIRrckFCdn1D98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDtB0mSd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDtB0mSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786394806; x=1817930806;
  h=date:from:to:cc:subject:message-id;
  bh=ugZ24QpBDefJm8jqbQpvJdcrH/RxWwq2WYxeuyFbOFs=;
  b=LDtB0mSdUB7m73ZOrUyoFIlCmjaSScP00KpPT0GNfI0stTa7ex6I5EPx
   XFVLAZfh7Wc+Txc2zwn9D+jeOFsgOeHNtfnBC5AoVqui01WTwMYCQ001q
   39c+pKKP+1TMM0wdlDbJYoCVa1Hl1O+QesG/7TLMCkMdrSTLSfgDYnTLC
   kEqG6QEqiYhBlVTBWgJqQZ2wEI70LitQA5TIDiM0vlvWe8MCu0GrCcIS+
   P8JGXbNVEDyS2tohGMEMqbiQsKPDUPDvFXGfjsHHox0tUM7Ao2ROTSK9+
   yzO0HuXK3QKpao7nDBXcW3gADR0Pwc0IsFun68AKtNuJVzyuuUQMV79Gw
   A==;
X-CSE-ConnectionGUID: yqn6ODPyT0+7tJ1oAOo9Ew==
X-CSE-MsgGUID: PgJ6FZUkQ82mwDBx3+pfVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90598691"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="90598691"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 13:46:46 -0700
X-CSE-ConnectionGUID: Ur9xECf6SKS/3+Xd6xM9qQ==
X-CSE-MsgGUID: JrS1aQmcR52gO8o9wgzW7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="261841355"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Aug 2026 13:46:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtWtO-00000000Nik-0jNL;
	Mon, 10 Aug 2026 20:46:42 +0000
Date: Tue, 11 Aug 2026 04:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12839/13846]
 drivers/gpu/tests/gpu_buddy_test.c:1462 gpu_test_buddy_addr_to_block() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202608110455.efwe8UOH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 3de014f7debc7162ae26db2f6151af1ba5456dc0 [12839/13846] gpu/tests/gpu_buddy: Add KUnit test for gpu_buddy_allocated_addr_to_block
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-r071-20260810 (https://download.01.org/0day-ci/archive/20260811/202608110455.efwe8UOH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608110455.efwe8UOH-lkp@intel.com/

smatch warnings:
drivers/gpu/tests/gpu_buddy_test.c:1462 gpu_test_buddy_addr_to_block() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1462 drivers/gpu/tests/gpu_buddy_test.c

dc0e3aa54eaa4f drivers/gpu/drm/tests/drm_buddy_test.c Sanjay Yadav   2026-01-08  1424  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1425  static void gpu_test_buddy_addr_to_block(struct kunit *test)
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1426  {
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1427  	struct gpu_buddy_block *allocated_block, *found_block;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1428  	LIST_HEAD(allocated_list);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1429  	const u64 test_size = SZ_4M + SZ_2M;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1430  	const u64 alloc_start = SZ_4M;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1431  	const u64 alloc_size = SZ_4K;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1432  	const u64 chunk_size = SZ_4K;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1433  	struct gpu_buddy mm;
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1434  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1435  	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_init(&mm, test_size, chunk_size),
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1436  			       "buddy_init failed\n");
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1437  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1438  	KUNIT_ASSERT_FALSE_MSG(test, gpu_buddy_alloc_blocks(&mm, alloc_start,
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1439  							    alloc_start + alloc_size,
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1440  							    alloc_size, chunk_size,
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1441  							    &allocated_list, 0),
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1442  			       "buddy_alloc failed\n");
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1443  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1444  	allocated_block = list_first_entry(&allocated_list, struct gpu_buddy_block, link);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1445  	KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(allocated_block), alloc_start);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1446  	KUNIT_EXPECT_EQ(test, gpu_buddy_block_size(&mm, allocated_block), alloc_size);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1447  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1448  	found_block = gpu_buddy_allocated_addr_to_block(&mm, alloc_start);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1449  	KUNIT_EXPECT_PTR_EQ(test, found_block, allocated_block);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1450  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1451  	/* Unaligned address inside the allocated block (should resolve to the same block) */
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1452  	found_block = gpu_buddy_allocated_addr_to_block(&mm, alloc_start + 16);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1453  	KUNIT_EXPECT_PTR_EQ(test, found_block, allocated_block);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1454  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1455  	/* An unallocated address inside the manager should return NULL. */
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1456  	found_block = gpu_buddy_allocated_addr_to_block(&mm,
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1457  							alloc_start - chunk_size);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1458  	KUNIT_EXPECT_NULL(test, found_block);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1459  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1460  	/* An address outside the manager should return -ENXIO. */
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1461  	found_block = gpu_buddy_allocated_addr_to_block(&mm, test_size);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06 @1462  	KUNIT_EXPECT_EQ(test, PTR_ERR(found_block), -ENXIO);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1463  
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1464  	/* 3. Standard inline cleanup flow */
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1465  	gpu_buddy_free_list(&mm, &allocated_list, 0);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1466  	gpu_buddy_fini(&mm);
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1467  }
3de014f7debc71 drivers/gpu/tests/gpu_buddy_test.c     Tejas Upadhyay 2026-08-06  1468  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
