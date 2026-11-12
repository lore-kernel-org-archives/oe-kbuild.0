Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494514;
	b=U+5hiECylbqeYOP8Fs1Rd0kE7wB88NGr03Kng1jGLsvVmTzcG6w18kJ683IEot+s1IxO
	 +a2MqtOtS1eIZC2N1GGJZcq+MwiGoeIVEeQalz7K9diYoTs0ZaD3haOHT/lCgJw8z890D
	 oCrfcKQfBvttwRBpfjT2YPoehL+7wIvEUBTISnSFMJ18yEGb9oAp51djdHkQEbhQjpctS
	 ZgZAUs26vm1iGiOVsY2gE/1smugTHWztLS+G1pR0DBaVInfzKufYeUWToVSgaSn2y5M7N
	 fXO9TwFKgtgFvc1KaEsA17W9Y2c80Xp4LhMkIp1lVQm6XSptfZWNWl4YLKuxXvUwkfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494514;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gVqRRWGIuLXVAZ4zdD5d0YO0vKxk6wbSKvvNddXWXRI=;
	b=2JrhrazRL72yWeC8pvmuqyIt/ns3SxV1RTqyJkiXf20NJpuk3Z3SfBkR9e4A5C6GBuF1
	 5d7NZtP/RZQaNGXECZElZ21ljzJ3oOT4U7+s1HguXuP4/wqO3m83A51WbeoZfkR+6txVL
	 wOnVQnmiSpgtHpPd3GaJpfXFn9nLUqBSUY43r6z866tj+3O2Ea8xQAUBhtNkJLkVq18F8
	 vDCJ9YkvK4CnenRRPGOhhgKkuqUWM0CANJ1t2IZEaNRcvGpN266aZJH1SIH/fCiZCjij4
	 yQ38hSLl/YCV2qYMdo3AGiG4P/Bgmf3o840ssOKlaa2yJHCVy2FhpQGUukOdCWTPgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2wyketL;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6AB606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 14:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R2wyketL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794494513; x=1826030513;
  h=date:from:to:cc:subject:message-id;
  bh=tOeEEmkJu6eqrZ5z/6gZVgcWF4+/ZS2O7+ek5yxPlV4=;
  b=R2wyketLWHJImbvUxTZ17jdXngHt/zi8GDX5VoijgGwdNe5hHnAqR6wk
   bzmuXjMKJDrN77sbI2NnChw5F3Kw8+kFRatYY6QIejp2MGHILPtFu0A/k
   DNIJbjRkOVkPlyJ/H/hgzmCIkUJnpE8a9sDscpRb63AzLt45g/16AnceA
   /UQ8mc2Fmlz4oWfGp+H4h5M2THPfj4wMuO9kCLs38OOaYDHXG2lwLHCj/
   eraZLtKf5OCGK3P814ydj2Q4qc5ETczQcMRooy3b22fAsQeoE8J3ZhmUK
   +obZunD2Q6WawCsJPj4azsSpNeAQgtnqBdxhVDXdT97yaiKduZ6bLctmg
   Q==;
X-CSE-ConnectionGUID: e/M+fD6wRq6YecOUYVd5sg==
X-CSE-MsgGUID: Iv3FRP/vRjSf/iwX5X9Row==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3297965"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3297965"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 06:41:53 -0800
X-CSE-ConnectionGUID: R/dqkvTDT1mwYSY8M9vM6A==
X-CSE-MsgGUID: qfJXFihbQ5upvwgkihsz/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10443529"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 12 Nov 2026 06:41:51 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRVzo-000000000tj-2yEX;
	Thu, 12 Nov 2026 14:41:48 +0000
Date: Thu, 12 Nov 2026 15:41:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 12/50] fs/ext4/balloc-test.c:1346
 test_read_block_bitmap_validates_csum() warn: passing zero to 'PTR_ERR'
Message-ID: <202611121546.H3A7xN6R-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 55ba50484d288a857206a349339301641aa5c050 [12/50] ext4: add KUnit tests for fs/ext4/balloc.c
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611121546.H3A7xN6R-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611121546.H3A7xN6R-lkp@intel.com/

New smatch warnings:
fs/ext4/balloc-test.c:1346 test_read_block_bitmap_validates_csum() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/ext4/balloc-test.c:1360 test_read_block_bitmap_validates_csum() warn: passing zero to 'PTR_ERR'
fs/ext4/balloc-test.c:1373 test_read_block_bitmap_validates_csum() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1346 fs/ext4/balloc-test.c

55ba50484d288a Theodore Ts'o 2026-11-06  1316  
55ba50484d288a Theodore Ts'o 2026-11-06  1317  /* =========================================================================
55ba50484d288a Theodore Ts'o 2026-11-06  1318   * 6. Block Bitmap Validation (CSUM, Metadata Self-Checks, Padding, Flags)
55ba50484d288a Theodore Ts'o 2026-11-06  1319   * =========================================================================
55ba50484d288a Theodore Ts'o 2026-11-06  1320   */
55ba50484d288a Theodore Ts'o 2026-11-06  1321  
55ba50484d288a Theodore Ts'o 2026-11-06  1322  static void test_read_block_bitmap_validates_csum(struct kunit *test)
55ba50484d288a Theodore Ts'o 2026-11-06  1323  {
55ba50484d288a Theodore Ts'o 2026-11-06  1324  	struct balloc_test_ctx *ctx = test->priv;
55ba50484d288a Theodore Ts'o 2026-11-06  1325  	struct super_block *sb = ctx->sb;
55ba50484d288a Theodore Ts'o 2026-11-06  1326  	struct balloc_test_blk *slot;
55ba50484d288a Theodore Ts'o 2026-11-06  1327  	struct buffer_head *bh;
55ba50484d288a Theodore Ts'o 2026-11-06  1328  	s64 free_before;
55ba50484d288a Theodore Ts'o 2026-11-06  1329  
55ba50484d288a Theodore Ts'o 2026-11-06  1330  	slot = balloc_test_find_blk(ctx, balloc_test_bbitmap_blk(1));
55ba50484d288a Theodore Ts'o 2026-11-06  1331  	KUNIT_ASSERT_NOT_NULL(test, slot);
55ba50484d288a Theodore Ts'o 2026-11-06  1332  
55ba50484d288a Theodore Ts'o 2026-11-06  1333  	/* 1. Unverified buffer with valid CRC32C verifies and sets BH_Verified */
55ba50484d288a Theodore Ts'o 2026-11-06  1334  	clear_buffer_verified(&slot->bh);
55ba50484d288a Theodore Ts'o 2026-11-06  1335  	bh = ext4_read_block_bitmap(sb, 1);
55ba50484d288a Theodore Ts'o 2026-11-06  1336  	KUNIT_ASSERT_FALSE(test, IS_ERR(bh));
55ba50484d288a Theodore Ts'o 2026-11-06  1337  	KUNIT_EXPECT_TRUE(test, buffer_verified(bh));
55ba50484d288a Theodore Ts'o 2026-11-06  1338  	KUNIT_EXPECT_FALSE(test, EXT4_MB_GRP_BBITMAP_CORRUPT(&ctx->grp_infos[1]));
55ba50484d288a Theodore Ts'o 2026-11-06  1339  	put_bh(bh);
55ba50484d288a Theodore Ts'o 2026-11-06  1340  
55ba50484d288a Theodore Ts'o 2026-11-06  1341  #ifdef CONFIG_EXT4_DEBUG
55ba50484d288a Theodore Ts'o 2026-11-06  1342  	/* Simulated CRC failure triggers -EFSBADCRC and resets s_simulate_fail */
55ba50484d288a Theodore Ts'o 2026-11-06  1343  	clear_buffer_verified(&slot->bh);
55ba50484d288a Theodore Ts'o 2026-11-06  1344  	ctx->sbi.s_simulate_fail = EXT4_SIM_BBITMAP_CRC;
55ba50484d288a Theodore Ts'o 2026-11-06  1345  	bh = ext4_read_block_bitmap(sb, 1);
55ba50484d288a Theodore Ts'o 2026-11-06 @1346  	KUNIT_EXPECT_EQ(test, PTR_ERR(bh), -EFSBADCRC);
55ba50484d288a Theodore Ts'o 2026-11-06  1347  	KUNIT_EXPECT_EQ(test, ctx->sbi.s_simulate_fail, 0UL);
55ba50484d288a Theodore Ts'o 2026-11-06  1348  	ctx->grp_infos[1].bb_state = 0;
55ba50484d288a Theodore Ts'o 2026-11-06  1349  	percpu_counter_add(&ctx->sbi.s_freeclusters_counter,
55ba50484d288a Theodore Ts'o 2026-11-06  1350  			   ctx->grp_infos[1].bb_free);
55ba50484d288a Theodore Ts'o 2026-11-06  1351  #endif
55ba50484d288a Theodore Ts'o 2026-11-06  1352  
55ba50484d288a Theodore Ts'o 2026-11-06  1353  	/* 2. Corrupting free-space bit without updating csum -> -EFSBADCRC */
55ba50484d288a Theodore Ts'o 2026-11-06  1354  	free_before = percpu_counter_sum(&ctx->sbi.s_freeclusters_counter);
55ba50484d288a Theodore Ts'o 2026-11-06  1355  	clear_buffer_verified(&slot->bh);
55ba50484d288a Theodore Ts'o 2026-11-06  1356  	slot->cache_buf[40] ^= 0x01;
55ba50484d288a Theodore Ts'o 2026-11-06  1357  
55ba50484d288a Theodore Ts'o 2026-11-06  1358  	bh = ext4_read_block_bitmap(sb, 1);
55ba50484d288a Theodore Ts'o 2026-11-06  1359  	KUNIT_EXPECT_TRUE(test, IS_ERR(bh));
55ba50484d288a Theodore Ts'o 2026-11-06  1360  	KUNIT_EXPECT_EQ(test, PTR_ERR(bh), -EFSBADCRC);
55ba50484d288a Theodore Ts'o 2026-11-06  1361  	KUNIT_EXPECT_TRUE(test, EXT4_MB_GRP_BBITMAP_CORRUPT(&ctx->grp_infos[1]));
55ba50484d288a Theodore Ts'o 2026-11-06  1362  	KUNIT_EXPECT_EQ(test,
55ba50484d288a Theodore Ts'o 2026-11-06  1363  			percpu_counter_sum(&ctx->sbi.s_freeclusters_counter),
55ba50484d288a Theodore Ts'o 2026-11-06  1364  			free_before - ctx->grp_infos[1].bb_free);
55ba50484d288a Theodore Ts'o 2026-11-06  1365  
55ba50484d288a Theodore Ts'o 2026-11-06  1366  	/*
55ba50484d288a Theodore Ts'o 2026-11-06  1367  	 * 3. Subsequent read on already-corrupt group returns -EFSCORRUPTED
55ba50484d288a Theodore Ts'o 2026-11-06  1368  	 *    immediately without subtracting bb_free a second time.
55ba50484d288a Theodore Ts'o 2026-11-06  1369  	 */
55ba50484d288a Theodore Ts'o 2026-11-06  1370  	slot->cache_buf[40] ^= 0x01;
55ba50484d288a Theodore Ts'o 2026-11-06  1371  	bh = ext4_read_block_bitmap(sb, 1);
55ba50484d288a Theodore Ts'o 2026-11-06  1372  	KUNIT_EXPECT_TRUE(test, IS_ERR(bh));
55ba50484d288a Theodore Ts'o 2026-11-06  1373  	KUNIT_EXPECT_EQ(test, PTR_ERR(bh), -EFSCORRUPTED);
55ba50484d288a Theodore Ts'o 2026-11-06  1374  	KUNIT_EXPECT_EQ(test,
55ba50484d288a Theodore Ts'o 2026-11-06  1375  			percpu_counter_sum(&ctx->sbi.s_freeclusters_counter),
55ba50484d288a Theodore Ts'o 2026-11-06  1376  			free_before - ctx->grp_infos[1].bb_free);
55ba50484d288a Theodore Ts'o 2026-11-06  1377  }
55ba50484d288a Theodore Ts'o 2026-11-06  1378  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
