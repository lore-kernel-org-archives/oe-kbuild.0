Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515405;
	b=wJduPTFNrRPjFf7xfXaD0o/VSFqjp9BCLmMqjNH0BbOFRTmnxvfcBPLT1OK5sMuJFmmh
	 auDB1xaKxciC+F3Xpy8dc+cb9p/Sph32mVuevFU2olMwBxDYOd+EvpYRU1B3VKuyWjyl4
	 J3NsSTg+Evn3a1Z2x+t3k4bETuEcDFjun9K0DxcKT9x1OcAdPBALaEXLFSZv5YVpOIK8s
	 8ny3mdeCwRCbIS8MmHN3bqCuc/dvLmkdqZQ3mO40DA2zTMTSGrvaT/yQ6LXnfyU6Iha7/
	 VHRF7ndMq4CTnYnY+XeRSrB6SLXh270xFDy2PUaCvFRU3iGNoO04rK4JNrz8wnigzAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515405;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eEC56TRHlc8K97q2WORBdVpQb84y5ktCOQvcJBAngpw=;
	b=JVlZ9Cl6UDm67N7W+Jd+bx+I6JCT4mgSHuj//bspRN8kKxzn/xqMomUT1r6ij5oN5BGX
	 ubUtc9OfylDSXSrz0MqEQfA40fX38DwSP9BOp5bBILj3ffvoMX0Pw/klk9TrsuEHRuWtt
	 Sym0GnBDySUHrxrobSewte612jLk3kOLZ2x5jGhklM9JYku9GFnesCF5m1wpTTocWdBAH
	 QyJqgsgs3NqyLQe2ZiIFsfyM2/zz7V9k6a3s1FvMT4/Rt4RU1o7Ucn8/u5PNiUogJfQpO
	 1VFnVTCZjldmp8hoFwtGcupY3/1wM6oc+RgVaqaf6md7IZNmAMIlUX+3zWWiRUunpwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSZs5tdc;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D85606A327
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D85606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSZs5tdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794515405; x=1826051405;
  h=date:from:to:cc:subject:message-id;
  bh=Cufhrt6Mpi98PziDx83b8ER9pSP6kVXLW2oEM7r9AP8=;
  b=gSZs5tdc2fawkgQHvl6Pzj4E9Shb8fKpeXQ3ynGrbI07ysKypg7NKifK
   LD8A8jsvRCPc8G7urSuHrk95/vGHEFm2aom4CeI/i7oSZ+LCQtKYbfReb
   riYTFwPxpSyXFE5fsw8RUzoIVtFHFz6AlHGc/bKPyOLHdX0ECcLnTwoCI
   YUazjwuiljLDXxyoJXjnjZW4UgL1xURTH5mkOjZyY0UosSIqNFPXLPKbg
   HW64sAryuAILqCGX5srY+gDfOhauMJQ7mpwSrYAinX0iluyxllrRm73+L
   xHrv6QLTE3QXmTFZ9phFs6NMk4Kjcw8lMKcTSCasSmsFonXDDn1IuFI/u
   Q==;
X-CSE-ConnectionGUID: c68ANLV2Sd+KsLUgqur+8g==
X-CSE-MsgGUID: U3fUxa6tRY+v5STJgy4Yxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3175713"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3175713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:30:04 -0800
X-CSE-ConnectionGUID: RRpRF/RfRdG4h+ORFbZmbw==
X-CSE-MsgGUID: Pe7auJB+QOSud9/ndxINmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8922259"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 12 Nov 2026 12:30:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRbQl-000000000x5-47bL;
	Thu, 12 Nov 2026 20:29:59 +0000
Date: Thu, 12 Nov 2026 21:29:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 16/50] fs/ext4/namei-test.c:898
 test_namei_read_dirblock() warn: passing zero to 'PTR_ERR'
Message-ID: <202611122133.ht0OzBhV-lkp@intel.com>
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

Hi Theodore,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 5fd9232f9345a5b0a0a0e9132dc439658d2a42db [16/50] ext4: enable full feature coverage in fs/ext4/.kunitconfig
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611122133.ht0OzBhV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611122133.ht0OzBhV-lkp@intel.com/

New smatch warnings:
fs/ext4/namei-test.c:898 test_namei_read_dirblock() warn: passing zero to 'PTR_ERR'
fs/ext4/namei-test.c:943 test_namei_append_and_init_dir() warn: passing zero to 'PTR_ERR'
fs/ext4/namei-test.c:1470 test_namei_check_dx_root_and_probe() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/ext4/namei-test.c:950 test_namei_append_and_init_dir() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +898 fs/ext4/namei-test.c

171d9555beee6b Theodore Ts'o 2026-11-05  819  
171d9555beee6b Theodore Ts'o 2026-11-05  820  static void test_namei_read_dirblock(struct kunit *test)
171d9555beee6b Theodore Ts'o 2026-11-05  821  {
171d9555beee6b Theodore Ts'o 2026-11-05  822  	const struct read_dirblock_param *p = test->param_value;
171d9555beee6b Theodore Ts'o 2026-11-05  823  	struct namei_test_ctx *ctx = test->priv;
171d9555beee6b Theodore Ts'o 2026-11-05  824  	struct inode *dir = get_mock_inode(ctx, TEST_DIR_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  825  	struct buffer_head *bh, *res;
171d9555beee6b Theodore Ts'o 2026-11-05  826  	struct dx_root *root;
171d9555beee6b Theodore Ts'o 2026-11-05  827  
171d9555beee6b Theodore Ts'o 2026-11-05  828  	ctx->es.s_feature_ro_compat |=
171d9555beee6b Theodore Ts'o 2026-11-05  829  		cpu_to_le32(EXT4_FEATURE_RO_COMPAT_METADATA_CSUM);
171d9555beee6b Theodore Ts'o 2026-11-05  830  	dir->i_size = 2 * TEST_BLK_SIZE;
171d9555beee6b Theodore Ts'o 2026-11-05  831  
171d9555beee6b Theodore Ts'o 2026-11-05  832  	switch (p->id) {
171d9555beee6b Theodore Ts'o 2026-11-05  833  	case RDB_VALID_LEAF:
171d9555beee6b Theodore Ts'o 2026-11-05  834  		bh = map_and_get_dir_bh(ctx, dir, 0);
171d9555beee6b Theodore Ts'o 2026-11-05  835  		KUNIT_ASSERT_NOT_NULL(test, bh);
171d9555beee6b Theodore Ts'o 2026-11-05  836  		KUNIT_ASSERT_EQ(test,
171d9555beee6b Theodore Ts'o 2026-11-05  837  			ext4_init_dirblock(NULL, dir, bh, TEST_ROOT_INO,
171d9555beee6b Theodore Ts'o 2026-11-05  838  					   NULL, 0), 0);
171d9555beee6b Theodore Ts'o 2026-11-05  839  		clear_buffer_verified(bh);
171d9555beee6b Theodore Ts'o 2026-11-05  840  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  841  	case RDB_VALID_INDEX:
171d9555beee6b Theodore Ts'o 2026-11-05  842  	case RDB_BAD_INDEX_CSUM:
171d9555beee6b Theodore Ts'o 2026-11-05  843  		ext4_set_inode_flag(dir, EXT4_INODE_INDEX);
171d9555beee6b Theodore Ts'o 2026-11-05  844  		bh = map_and_get_dir_bh(ctx, dir, 0);
171d9555beee6b Theodore Ts'o 2026-11-05  845  		KUNIT_ASSERT_NOT_NULL(test, bh);
171d9555beee6b Theodore Ts'o 2026-11-05  846  		root = (struct dx_root *)bh->b_data;
171d9555beee6b Theodore Ts'o 2026-11-05  847  		root->dot.inode = cpu_to_le32(dir->i_ino);
171d9555beee6b Theodore Ts'o 2026-11-05  848  		root->dot.rec_len = ext4_rec_len_to_disk(12, TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  849  		root->dot.name_len = 1;
171d9555beee6b Theodore Ts'o 2026-11-05  850  		strscpy(root->dot_name, ".", sizeof(root->dot_name));
171d9555beee6b Theodore Ts'o 2026-11-05  851  		root->dotdot.inode = cpu_to_le32(TEST_ROOT_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  852  		root->dotdot.rec_len = ext4_rec_len_to_disk(TEST_BLK_SIZE - 12,
171d9555beee6b Theodore Ts'o 2026-11-05  853  							    TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  854  		root->dotdot.name_len = 2;
171d9555beee6b Theodore Ts'o 2026-11-05  855  		strscpy(root->dotdot_name, "..", sizeof(root->dotdot_name));
171d9555beee6b Theodore Ts'o 2026-11-05  856  		root->info.info_length = sizeof(struct dx_root_info);
171d9555beee6b Theodore Ts'o 2026-11-05  857  		root->info.hash_version = DX_HASH_HALF_MD4;
171d9555beee6b Theodore Ts'o 2026-11-05  858  		dx_set_limit(root->entries,
171d9555beee6b Theodore Ts'o 2026-11-05  859  			     dx_root_limit(dir, sizeof(struct dx_root_info)));
171d9555beee6b Theodore Ts'o 2026-11-05  860  		dx_set_count(root->entries, 1);
171d9555beee6b Theodore Ts'o 2026-11-05  861  		dx_set_block(root->entries, 1);
171d9555beee6b Theodore Ts'o 2026-11-05  862  		ext4_dx_csum_set_test(dir, (struct ext4_dir_entry *)bh->b_data);
171d9555beee6b Theodore Ts'o 2026-11-05  863  		if (p->id == RDB_BAD_INDEX_CSUM)
171d9555beee6b Theodore Ts'o 2026-11-05  864  			dx_set_block(root->entries, 99);
171d9555beee6b Theodore Ts'o 2026-11-05  865  		clear_buffer_verified(bh);
171d9555beee6b Theodore Ts'o 2026-11-05  866  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  867  	case RDB_HOLE_ALLOWED_EITHER:
171d9555beee6b Theodore Ts'o 2026-11-05  868  	case RDB_PAST_ISIZE:
171d9555beee6b Theodore Ts'o 2026-11-05  869  	case RDB_HOLE_AT_BLOCK0:
171d9555beee6b Theodore Ts'o 2026-11-05  870  	case RDB_HOLE_FOR_HTREE_LEAF:
171d9555beee6b Theodore Ts'o 2026-11-05  871  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  872  	case RDB_BREAD_EIO:
171d9555beee6b Theodore Ts'o 2026-11-05  873  		ctx->fail_getblk = -EIO;
171d9555beee6b Theodore Ts'o 2026-11-05  874  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  875  	case RDB_LEAF_INSTEAD_OF_INDEX:
171d9555beee6b Theodore Ts'o 2026-11-05  876  		ext4_set_inode_flag(dir, EXT4_INODE_INDEX);
171d9555beee6b Theodore Ts'o 2026-11-05  877  		bh = map_and_get_dir_bh(ctx, dir, 1);
171d9555beee6b Theodore Ts'o 2026-11-05  878  		KUNIT_ASSERT_NOT_NULL(test, bh);
171d9555beee6b Theodore Ts'o 2026-11-05  879  		KUNIT_ASSERT_EQ(test,
171d9555beee6b Theodore Ts'o 2026-11-05  880  			ext4_init_dirblock(NULL, dir, bh, TEST_ROOT_INO,
171d9555beee6b Theodore Ts'o 2026-11-05  881  					   NULL, 0), 0);
171d9555beee6b Theodore Ts'o 2026-11-05  882  		clear_buffer_verified(bh);
171d9555beee6b Theodore Ts'o 2026-11-05  883  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  884  	case RDB_BAD_LEAF_CSUM:
171d9555beee6b Theodore Ts'o 2026-11-05  885  		bh = map_and_get_dir_bh(ctx, dir, 0);
171d9555beee6b Theodore Ts'o 2026-11-05  886  		KUNIT_ASSERT_NOT_NULL(test, bh);
171d9555beee6b Theodore Ts'o 2026-11-05  887  		KUNIT_ASSERT_EQ(test,
171d9555beee6b Theodore Ts'o 2026-11-05  888  			ext4_init_dirblock(NULL, dir, bh, TEST_ROOT_INO,
171d9555beee6b Theodore Ts'o 2026-11-05  889  					   NULL, 0), 0);
171d9555beee6b Theodore Ts'o 2026-11-05  890  		bh->b_data[0] ^= 0xff;
171d9555beee6b Theodore Ts'o 2026-11-05  891  		clear_buffer_verified(bh);
171d9555beee6b Theodore Ts'o 2026-11-05  892  		break;
171d9555beee6b Theodore Ts'o 2026-11-05  893  	}
171d9555beee6b Theodore Ts'o 2026-11-05  894  
171d9555beee6b Theodore Ts'o 2026-11-05  895  	res = ext4_read_dirblock_test(dir, p->block, p->type);
171d9555beee6b Theodore Ts'o 2026-11-05  896  	if (p->expected_err) {
171d9555beee6b Theodore Ts'o 2026-11-05  897  		KUNIT_EXPECT_TRUE(test, IS_ERR(res));
171d9555beee6b Theodore Ts'o 2026-11-05 @898  		KUNIT_EXPECT_EQ(test, PTR_ERR(res), p->expected_err);
171d9555beee6b Theodore Ts'o 2026-11-05  899  	} else if (p->expect_null) {
171d9555beee6b Theodore Ts'o 2026-11-05  900  		KUNIT_EXPECT_NULL(test, res);
171d9555beee6b Theodore Ts'o 2026-11-05  901  	} else {
171d9555beee6b Theodore Ts'o 2026-11-05  902  		KUNIT_ASSERT_FALSE(test, IS_ERR_OR_NULL(res));
171d9555beee6b Theodore Ts'o 2026-11-05  903  		KUNIT_EXPECT_TRUE(test, buffer_verified(res));
171d9555beee6b Theodore Ts'o 2026-11-05  904  		brelse(res);
171d9555beee6b Theodore Ts'o 2026-11-05  905  	}
171d9555beee6b Theodore Ts'o 2026-11-05  906  }
171d9555beee6b Theodore Ts'o 2026-11-05  907  
171d9555beee6b Theodore Ts'o 2026-11-05  908  /*
171d9555beee6b Theodore Ts'o 2026-11-05  909   * Test 4: Directory initialization and block appending (ext4_init_new_dir,
171d9555beee6b Theodore Ts'o 2026-11-05  910   * ext4_append_test, s_max_dir_size_kb limit, already-allocated block check,
171d9555beee6b Theodore Ts'o 2026-11-05  911   * and ext4_init_dirblock with inline_buf conversion data).
171d9555beee6b Theodore Ts'o 2026-11-05  912   */
171d9555beee6b Theodore Ts'o 2026-11-05  913  static void test_namei_append_and_init_dir(struct kunit *test)
171d9555beee6b Theodore Ts'o 2026-11-05  914  {
171d9555beee6b Theodore Ts'o 2026-11-05  915  	struct namei_test_ctx *ctx = test->priv;
171d9555beee6b Theodore Ts'o 2026-11-05  916  	struct inode *root_dir = get_mock_inode(ctx, TEST_ROOT_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  917  	struct inode *dir = get_mock_inode(ctx, TEST_DIR_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  918  	struct buffer_head *bh;
171d9555beee6b Theodore Ts'o 2026-11-05  919  	struct ext4_dir_entry_2 *de;
171d9555beee6b Theodore Ts'o 2026-11-05  920  	char inline_entries[64];
171d9555beee6b Theodore Ts'o 2026-11-05  921  	ext4_lblk_t lblk = 0;
171d9555beee6b Theodore Ts'o 2026-11-05  922  	int err;
171d9555beee6b Theodore Ts'o 2026-11-05  923  
171d9555beee6b Theodore Ts'o 2026-11-05  924  	ctx->es.s_feature_ro_compat |=
171d9555beee6b Theodore Ts'o 2026-11-05  925  		cpu_to_le32(EXT4_FEATURE_RO_COMPAT_METADATA_CSUM);
171d9555beee6b Theodore Ts'o 2026-11-05  926  
171d9555beee6b Theodore Ts'o 2026-11-05  927  	err = ext4_init_new_dir(NULL, root_dir, dir);
171d9555beee6b Theodore Ts'o 2026-11-05  928  	KUNIT_ASSERT_EQ(test, err, 0);
171d9555beee6b Theodore Ts'o 2026-11-05  929  	KUNIT_EXPECT_EQ(test, dir->i_nlink, 2U);
171d9555beee6b Theodore Ts'o 2026-11-05  930  	KUNIT_EXPECT_EQ(test, dir->i_size, (loff_t)TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  931  
171d9555beee6b Theodore Ts'o 2026-11-05  932  	/* Append a second block (lblk 1) */
171d9555beee6b Theodore Ts'o 2026-11-05  933  	bh = ext4_append_test(NULL, dir, &lblk);
171d9555beee6b Theodore Ts'o 2026-11-05  934  	KUNIT_ASSERT_FALSE(test, IS_ERR_OR_NULL(bh));
171d9555beee6b Theodore Ts'o 2026-11-05  935  	KUNIT_EXPECT_EQ(test, lblk, 1U);
171d9555beee6b Theodore Ts'o 2026-11-05  936  	KUNIT_EXPECT_EQ(test, dir->i_size, (loff_t)(2 * TEST_BLK_SIZE));
171d9555beee6b Theodore Ts'o 2026-11-05  937  	brelse(bh);
171d9555beee6b Theodore Ts'o 2026-11-05  938  
171d9555beee6b Theodore Ts'o 2026-11-05  939  	/* Enforce s_max_dir_size_kb limit -> -ENOSPC */
171d9555beee6b Theodore Ts'o 2026-11-05  940  	ctx->sbi.s_max_dir_size_kb = 2;
171d9555beee6b Theodore Ts'o 2026-11-05  941  	bh = ext4_append_test(NULL, dir, &lblk);
171d9555beee6b Theodore Ts'o 2026-11-05  942  	KUNIT_EXPECT_TRUE(test, IS_ERR(bh));
171d9555beee6b Theodore Ts'o 2026-11-05 @943  	KUNIT_EXPECT_EQ(test, PTR_ERR(bh), -ENOSPC);
171d9555beee6b Theodore Ts'o 2026-11-05  944  	ctx->sbi.s_max_dir_size_kb = 0;
171d9555beee6b Theodore Ts'o 2026-11-05  945  
171d9555beee6b Theodore Ts'o 2026-11-05  946  	/* Pre-allocated logical block at append target -> -EFSCORRUPTED */
171d9555beee6b Theodore Ts'o 2026-11-05  947  	ctx->force_map_blocks_ret = 1;
171d9555beee6b Theodore Ts'o 2026-11-05  948  	bh = ext4_append_test(NULL, dir, &lblk);
171d9555beee6b Theodore Ts'o 2026-11-05  949  	KUNIT_EXPECT_TRUE(test, IS_ERR(bh));
171d9555beee6b Theodore Ts'o 2026-11-05  950  	KUNIT_EXPECT_EQ(test, PTR_ERR(bh), -EFSCORRUPTED);
171d9555beee6b Theodore Ts'o 2026-11-05  951  	ctx->force_map_blocks_ret = 0;
171d9555beee6b Theodore Ts'o 2026-11-05  952  
171d9555beee6b Theodore Ts'o 2026-11-05  953  	/* Test ext4_init_dirblock with non-NULL inline_buf */
171d9555beee6b Theodore Ts'o 2026-11-05  954  	memset(inline_entries, 0, sizeof(inline_entries));
171d9555beee6b Theodore Ts'o 2026-11-05  955  	de = (struct ext4_dir_entry_2 *)inline_entries;
171d9555beee6b Theodore Ts'o 2026-11-05  956  	de->inode = cpu_to_le32(TEST_FILE1_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  957  	de->name_len = 3;
171d9555beee6b Theodore Ts'o 2026-11-05  958  	de->file_type = EXT4_FT_REG_FILE;
171d9555beee6b Theodore Ts'o 2026-11-05  959  	memcpy(de->name, "foo", 3);
171d9555beee6b Theodore Ts'o 2026-11-05  960  	de->rec_len = ext4_rec_len_to_disk(sizeof(inline_entries),
171d9555beee6b Theodore Ts'o 2026-11-05  961  					   TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  962  
171d9555beee6b Theodore Ts'o 2026-11-05  963  	bh = map_and_get_dir_bh(ctx, dir, 1);
171d9555beee6b Theodore Ts'o 2026-11-05  964  	KUNIT_ASSERT_NOT_NULL(test, bh);
171d9555beee6b Theodore Ts'o 2026-11-05  965  	err = ext4_init_dirblock(NULL, dir, bh, TEST_ROOT_INO,
171d9555beee6b Theodore Ts'o 2026-11-05  966  				 inline_entries, sizeof(inline_entries));
171d9555beee6b Theodore Ts'o 2026-11-05  967  	KUNIT_ASSERT_EQ(test, err, 0);
171d9555beee6b Theodore Ts'o 2026-11-05  968  	KUNIT_EXPECT_EQ(test, ext4_dirblock_csum_verify(dir, bh), 1);
171d9555beee6b Theodore Ts'o 2026-11-05  969  
171d9555beee6b Theodore Ts'o 2026-11-05  970  	/* Verify '.', '..', and 'foo' in the initialized block */
171d9555beee6b Theodore Ts'o 2026-11-05  971  	de = (struct ext4_dir_entry_2 *)bh->b_data;
171d9555beee6b Theodore Ts'o 2026-11-05  972  	KUNIT_EXPECT_EQ(test, le32_to_cpu(de->inode), dir->i_ino);
171d9555beee6b Theodore Ts'o 2026-11-05  973  	de = ext4_next_entry(de, TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  974  	KUNIT_EXPECT_EQ(test, le32_to_cpu(de->inode), TEST_ROOT_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  975  	de = ext4_next_entry(de, TEST_BLK_SIZE);
171d9555beee6b Theodore Ts'o 2026-11-05  976  	KUNIT_EXPECT_EQ(test, le32_to_cpu(de->inode), TEST_FILE1_INO);
171d9555beee6b Theodore Ts'o 2026-11-05  977  	KUNIT_EXPECT_EQ(test, de->name_len, 3);
171d9555beee6b Theodore Ts'o 2026-11-05  978  	KUNIT_EXPECT_MEMEQ(test, de->name, "foo", 3);
171d9555beee6b Theodore Ts'o 2026-11-05  979  	KUNIT_EXPECT_EQ(test, ext4_rec_len_from_disk(de->rec_len, TEST_BLK_SIZE),
171d9555beee6b Theodore Ts'o 2026-11-05  980  			TEST_BLK_SIZE - 24 -
171d9555beee6b Theodore Ts'o 2026-11-05  981  			(int)sizeof(struct ext4_dir_entry_tail));
171d9555beee6b Theodore Ts'o 2026-11-05  982  }
171d9555beee6b Theodore Ts'o 2026-11-05  983  

:::::: The code at line 898 was first introduced by commit
:::::: 171d9555beee6b445eb465dcbe657dd99ddf24b8 ext4: add KUnit tests for fs/ext4/namei.c

:::::: TO: Theodore Ts'o <tytso@mit.edu>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
