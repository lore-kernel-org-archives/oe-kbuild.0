Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474100;
	b=RgjuH7apmLzrvL0wu81dqVtqSuUDUukwZb1AjJJaCrFX2I1djDs2BWkUOUBIJRjy8GgY
	 Sw9pdSnDPqOYMk0XU2xK34ccogqD8vJaG/iygsYq9upM2AXsnp2enN3brrG4wYQ+wktAX
	 1VXf1/GH3JOtmUOSllADBWBt0FaorGypS8T3ODIyrl5tZoVTQrsrgIFc1sKRxZSjidDBS
	 2S4uxKG/FpNbexNSgJAJhijrzKGy2G8TSrs2uoxcno8JyJBZWZIoWWfgSakP6nybBlRWz
	 qDkArvYRCUHAGBApzLpv0Utjr/Uee4o2K7N+PAv0CwgJTaCf9/uvjCOQ5SU7ClK7qzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474100;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+PuOyqZyT+8vmn3JAEkDCb2xc9NNnHYEYNoHGV5kt9s=;
	b=mSCLMWg0uWnRmmXfAyIXTV5tN6cKTElrwFzY/2w/IIH84gTLiaQ0i0xgCgec4NQCaNEv
	 673kD8HSMOcQ+bhlg098iQ7uX7IuFtYdYQo67nREjDyMW8Ev/rYiseQ0gM1EJSMq9Wd+j
	 4KYJw1GO3W3CjfKb6xWXiD4egJgsICqSFRZQ4gQPGVAbfVO/lvqwQIsmFf0+PWfeXTHv7
	 A9ajm0iYuykCHzf9xjjBTvTK6dE8/QhLhft7BpL0gqW+fsrVfE2qPMtJ44jucCfB6zv+2
	 kqACE0cM1wULN0Mnzlg9ofeCWP4tA+1/2idyd7TMFF9R1rpduk66c+Nws3Lb6FF/b7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h0U6fHc1;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE8606A335
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 09:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AE8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h0U6fHc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794474100; x=1826010100;
  h=date:from:to:cc:subject:message-id;
  bh=E3T5cD7HqLw4awWmVquvOVaPJTYf+TJl/1eqzYm+BGo=;
  b=h0U6fHc1IP7zNU5zusuMhXdGSUZGb8902qEEbz40VEapVXhhf1B43UGR
   IbjZ133+S1xCtUjgBn1TwDS/hzh1ufMha3r8OvEX67c5J5NUsXYkYDppl
   yJSOtbpEZwkapV8VIGaYzUJpmu4Fun/TpEp/3DZgqhJwbfQn1WCn0qb0k
   BjymsESKulII8V81Vg/1oXMj0WxF0XxrlS6WOYtMghmN9oBO/oxVg/D6Y
   tvS6jU2jiDuy0ZSrIHsAuD46h2awhDMS2BzwOmFj7oxQy9FMib+GzHwmo
   +/bs3B8yqCoJ6N80S+iVoMayLEWxC3AX7awiR3VCQ3qyQGZEaVL6bYUa5
   A==;
X-CSE-ConnectionGUID: DrnAdcmVRi2PTbe5kqiicA==
X-CSE-MsgGUID: KzwBHVI5SZqPSZ7kjQTijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3254537"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3254537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 01:01:39 -0800
X-CSE-ConnectionGUID: S3D6eYy6SWezU+4SCfVmRg==
X-CSE-MsgGUID: N/wl42TiRPy5Ghg+hW3zpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8496157"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2026 01:01:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRQgZ-000000000qT-0Its;
	Thu, 12 Nov 2026 09:01:35 +0000
Date: Thu, 12 Nov 2026 10:00:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 7/50] fs/ext4/inline-test.c:1020
 test_readpage_inline_link_and_iomap() warn: passing zero to 'PTR_ERR'
Message-ID: <202611120950.nMRMGeTV-lkp@intel.com>
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
commit: dd235149d6326ab5c8f8b7622f4ade2671b36cb4 [7/50] ext4: add KUnit tests for fs/ext4/inline.c
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261112/202611120950.nMRMGeTV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611120950.nMRMGeTV-lkp@intel.com/

smatch warnings:
fs/ext4/inline-test.c:1020 test_readpage_inline_link_and_iomap() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1020 fs/ext4/inline-test.c

dd235149d6326a Theodore Ts'o 2026-11-05   871  
dd235149d6326a Theodore Ts'o 2026-11-05   872  /* =========================================================================
dd235149d6326a Theodore Ts'o 2026-11-05   873   * 3. Reading Inline Data, Symlinks, and iomap Tests
dd235149d6326a Theodore Ts'o 2026-11-05   874   * =========================================================================
dd235149d6326a Theodore Ts'o 2026-11-05   875   */
dd235149d6326a Theodore Ts'o 2026-11-05   876  
dd235149d6326a Theodore Ts'o 2026-11-05   877  static void test_readpage_inline_link_and_iomap(struct kunit *test)
dd235149d6326a Theodore Ts'o 2026-11-05   878  {
dd235149d6326a Theodore Ts'o 2026-11-05   879  	struct inline_test_ctx *ctx = test->priv;
dd235149d6326a Theodore Ts'o 2026-11-05   880  	struct inode *inode = &ctx->ei.vfs_inode;
dd235149d6326a Theodore Ts'o 2026-11-05   881  	struct folio *folio;
dd235149d6326a Theodore Ts'o 2026-11-05   882  	struct iomap iomap = { 0 };
dd235149d6326a Theodore Ts'o 2026-11-05   883  	char content[85];
dd235149d6326a Theodore Ts'o 2026-11-05   884  	const char *short_link = "/usr/bin/python3";
dd235149d6326a Theodore Ts'o 2026-11-05   885  	char long_link[85];
dd235149d6326a Theodore Ts'o 2026-11-05   886  	char *target;
dd235149d6326a Theodore Ts'o 2026-11-05   887  	void *kaddr;
dd235149d6326a Theodore Ts'o 2026-11-05   888  	int i, ret;
dd235149d6326a Theodore Ts'o 2026-11-05   889  
dd235149d6326a Theodore Ts'o 2026-11-05   890  	for (i = 0; i < sizeof(content); i++)
dd235149d6326a Theodore Ts'o 2026-11-05   891  		content[i] = (char)('0' + (i % 10));
dd235149d6326a Theodore Ts'o 2026-11-05   892  
dd235149d6326a Theodore Ts'o 2026-11-05   893  	/* 1. ext4_readpage_inline and ext4_inline_data_iomap on non-inline inode -> -EAGAIN */
dd235149d6326a Theodore Ts'o 2026-11-05   894  	folio = __filemap_get_folio(&inode->i_data, 0,
dd235149d6326a Theodore Ts'o 2026-11-05   895  				    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
dd235149d6326a Theodore Ts'o 2026-11-05   896  				    GFP_KERNEL);
dd235149d6326a Theodore Ts'o 2026-11-05   897  	KUNIT_ASSERT_FALSE(test, IS_ERR(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   898  	ret = ext4_readpage_inline(inode, folio);
dd235149d6326a Theodore Ts'o 2026-11-05   899  	KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
dd235149d6326a Theodore Ts'o 2026-11-05   900  	folio_unlock(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   901  	folio_put(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   902  
dd235149d6326a Theodore Ts'o 2026-11-05   903  	ret = ext4_inline_data_iomap(inode, &iomap);
dd235149d6326a Theodore Ts'o 2026-11-05   904  	KUNIT_EXPECT_EQ(test, ret, -EAGAIN);
dd235149d6326a Theodore Ts'o 2026-11-05   905  
dd235149d6326a Theodore Ts'o 2026-11-05   906  	/* 2. Create 85-byte inline file and test ext4_readpage_inline on index 0 */
dd235149d6326a Theodore Ts'o 2026-11-05   907  	truncate_inode_pages(&inode->i_data, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   908  	ret = create_inline_file(inode, content, sizeof(content));
dd235149d6326a Theodore Ts'o 2026-11-05   909  	KUNIT_ASSERT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   910  	truncate_inode_pages(&inode->i_data, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   911  
dd235149d6326a Theodore Ts'o 2026-11-05   912  	folio = __filemap_get_folio(&inode->i_data, 0,
dd235149d6326a Theodore Ts'o 2026-11-05   913  				    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
dd235149d6326a Theodore Ts'o 2026-11-05   914  				    GFP_KERNEL);
dd235149d6326a Theodore Ts'o 2026-11-05   915  	KUNIT_ASSERT_FALSE(test, IS_ERR(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   916  	ret = ext4_readpage_inline(inode, folio);
dd235149d6326a Theodore Ts'o 2026-11-05   917  	KUNIT_EXPECT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   918  	KUNIT_EXPECT_TRUE(test, folio_test_uptodate(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   919  	KUNIT_EXPECT_FALSE(test, folio_test_locked(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   920  
dd235149d6326a Theodore Ts'o 2026-11-05   921  	kaddr = kmap_local_folio(folio, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   922  	KUNIT_EXPECT_MEMEQ(test, kaddr, content, sizeof(content));
dd235149d6326a Theodore Ts'o 2026-11-05   923  	/* Verify zero-padding past inline_size */
dd235149d6326a Theodore Ts'o 2026-11-05   924  	KUNIT_EXPECT_EQ(test, ((char *)kaddr)[sizeof(content)], 0);
dd235149d6326a Theodore Ts'o 2026-11-05   925  	KUNIT_EXPECT_EQ(test, ((char *)kaddr)[PAGE_SIZE - 1], 0);
dd235149d6326a Theodore Ts'o 2026-11-05   926  	kunmap_local(kaddr);
dd235149d6326a Theodore Ts'o 2026-11-05   927  	folio_put(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   928  
dd235149d6326a Theodore Ts'o 2026-11-05   929  	/* 3. ext4_readpage_inline on folio->index > 0 zeros the folio and marks uptodate */
dd235149d6326a Theodore Ts'o 2026-11-05   930  	folio = __filemap_get_folio(&inode->i_data, 1,
dd235149d6326a Theodore Ts'o 2026-11-05   931  				    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
dd235149d6326a Theodore Ts'o 2026-11-05   932  				    GFP_KERNEL);
dd235149d6326a Theodore Ts'o 2026-11-05   933  	KUNIT_ASSERT_FALSE(test, IS_ERR(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   934  	kaddr = kmap_local_folio(folio, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   935  	memset(kaddr, 0xff, PAGE_SIZE);
dd235149d6326a Theodore Ts'o 2026-11-05   936  	kunmap_local(kaddr);
dd235149d6326a Theodore Ts'o 2026-11-05   937  
dd235149d6326a Theodore Ts'o 2026-11-05   938  	ret = ext4_readpage_inline(inode, folio);
dd235149d6326a Theodore Ts'o 2026-11-05   939  	KUNIT_EXPECT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   940  	KUNIT_EXPECT_TRUE(test, folio_test_uptodate(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   941  	kaddr = kmap_local_folio(folio, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   942  	KUNIT_EXPECT_EQ(test, ((unsigned char *)kaddr)[0], 0);
dd235149d6326a Theodore Ts'o 2026-11-05   943  	kunmap_local(kaddr);
dd235149d6326a Theodore Ts'o 2026-11-05   944  	folio_put(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   945  
dd235149d6326a Theodore Ts'o 2026-11-05   946  	/* 4. ext4_readpage_inline when ext4_get_inode_loc fails -> propagates error */
dd235149d6326a Theodore Ts'o 2026-11-05   947  	truncate_inode_pages(&inode->i_data, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   948  	ctx->get_inode_loc_err = -EIO;
dd235149d6326a Theodore Ts'o 2026-11-05   949  	folio = __filemap_get_folio(&inode->i_data, 0,
dd235149d6326a Theodore Ts'o 2026-11-05   950  				    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
dd235149d6326a Theodore Ts'o 2026-11-05   951  				    GFP_KERNEL);
dd235149d6326a Theodore Ts'o 2026-11-05   952  	KUNIT_ASSERT_FALSE(test, IS_ERR(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   953  	ret = ext4_readpage_inline(inode, folio);
dd235149d6326a Theodore Ts'o 2026-11-05   954  	KUNIT_EXPECT_EQ(test, ret, -EIO);
dd235149d6326a Theodore Ts'o 2026-11-05   955  	folio_put(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   956  	ctx->get_inode_loc_err = 0;
dd235149d6326a Theodore Ts'o 2026-11-05   957  
dd235149d6326a Theodore Ts'o 2026-11-05   958  	/*
dd235149d6326a Theodore Ts'o 2026-11-05   959  	 * 5. ext4_readpage_inline when i_inline_size > PAGE_SIZE -> -EFSCORRUPTED.
dd235149d6326a Theodore Ts'o 2026-11-05   960  	 * i_inline_size is a u16, so it can only exceed PAGE_SIZE when
dd235149d6326a Theodore Ts'o 2026-11-05   961  	 * PAGE_SIZE < U16_MAX (e.g. 4KB, 8KB, 16KB, or 32KB base pages).
dd235149d6326a Theodore Ts'o 2026-11-05   962  	 */
dd235149d6326a Theodore Ts'o 2026-11-05   963  	if (PAGE_SIZE < U16_MAX) {
dd235149d6326a Theodore Ts'o 2026-11-05   964  		truncate_inode_pages(&inode->i_data, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   965  		ctx->ei.i_inline_size = U16_MAX;
dd235149d6326a Theodore Ts'o 2026-11-05   966  		i_size_write(inode, U16_MAX);
dd235149d6326a Theodore Ts'o 2026-11-05   967  		folio = __filemap_get_folio(&inode->i_data, 0,
dd235149d6326a Theodore Ts'o 2026-11-05   968  					    FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
dd235149d6326a Theodore Ts'o 2026-11-05   969  					    GFP_KERNEL);
dd235149d6326a Theodore Ts'o 2026-11-05   970  		KUNIT_ASSERT_FALSE(test, IS_ERR(folio));
dd235149d6326a Theodore Ts'o 2026-11-05   971  		ret = ext4_readpage_inline(inode, folio);
dd235149d6326a Theodore Ts'o 2026-11-05   972  		KUNIT_EXPECT_EQ(test, ret, -EFSCORRUPTED);
dd235149d6326a Theodore Ts'o 2026-11-05   973  		folio_put(folio);
dd235149d6326a Theodore Ts'o 2026-11-05   974  		ctx->ei.i_inline_size = sizeof(content);
dd235149d6326a Theodore Ts'o 2026-11-05   975  		i_size_write(inode, sizeof(content));
dd235149d6326a Theodore Ts'o 2026-11-05   976  	}
dd235149d6326a Theodore Ts'o 2026-11-05   977  
dd235149d6326a Theodore Ts'o 2026-11-05   978  	/* 6. ext4_inline_data_iomap populates IOMAP_INLINE with inline address/len */
dd235149d6326a Theodore Ts'o 2026-11-05   979  	memset(&iomap, 0, sizeof(iomap));
dd235149d6326a Theodore Ts'o 2026-11-05   980  	ret = ext4_inline_data_iomap(inode, &iomap);
dd235149d6326a Theodore Ts'o 2026-11-05   981  	KUNIT_EXPECT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   982  	KUNIT_EXPECT_EQ(test, iomap.type, (u16)IOMAP_INLINE);
dd235149d6326a Theodore Ts'o 2026-11-05   983  	KUNIT_EXPECT_EQ(test, iomap.offset, 0ULL);
dd235149d6326a Theodore Ts'o 2026-11-05   984  	KUNIT_EXPECT_EQ(test, iomap.length, (u64)sizeof(content));
dd235149d6326a Theodore Ts'o 2026-11-05   985  	KUNIT_EXPECT_EQ(test, iomap.addr,
dd235149d6326a Theodore Ts'o 2026-11-05   986  			((u64)ctx->iloc_bh.b_blocknr << TEST_BLOCK_BITS) +
dd235149d6326a Theodore Ts'o 2026-11-05   987  			offsetof(struct ext4_inode, i_block));
dd235149d6326a Theodore Ts'o 2026-11-05   988  
dd235149d6326a Theodore Ts'o 2026-11-05   989  	/* 7. ext4_inline_data_iomap error when ext4_get_inode_loc fails */
dd235149d6326a Theodore Ts'o 2026-11-05   990  	ctx->get_inode_loc_err = -EIO;
dd235149d6326a Theodore Ts'o 2026-11-05   991  	ret = ext4_inline_data_iomap(inode, &iomap);
dd235149d6326a Theodore Ts'o 2026-11-05   992  	KUNIT_EXPECT_EQ(test, ret, -EIO);
dd235149d6326a Theodore Ts'o 2026-11-05   993  	ctx->get_inode_loc_err = 0;
dd235149d6326a Theodore Ts'o 2026-11-05   994  
dd235149d6326a Theodore Ts'o 2026-11-05   995  	/* 8. ext4_read_inline_link: short symlink (in i_block) and long symlink (in xattr) */
dd235149d6326a Theodore Ts'o 2026-11-05   996  	reset_inode_state(ctx, S_IFLNK | 0777);
dd235149d6326a Theodore Ts'o 2026-11-05   997  	ret = create_inline_file(inode, short_link, strlen(short_link));
dd235149d6326a Theodore Ts'o 2026-11-05   998  	KUNIT_ASSERT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05   999  
dd235149d6326a Theodore Ts'o 2026-11-05  1000  	target = ext4_read_inline_link(inode);
dd235149d6326a Theodore Ts'o 2026-11-05  1001  	KUNIT_ASSERT_FALSE(test, IS_ERR(target));
dd235149d6326a Theodore Ts'o 2026-11-05  1002  	KUNIT_EXPECT_STREQ(test, target, short_link);
dd235149d6326a Theodore Ts'o 2026-11-05  1003  	kfree(target);
dd235149d6326a Theodore Ts'o 2026-11-05  1004  
dd235149d6326a Theodore Ts'o 2026-11-05  1005  	reset_inode_state(ctx, S_IFLNK | 0777);
dd235149d6326a Theodore Ts'o 2026-11-05  1006  	memset(long_link, 'a', sizeof(long_link) - 1);
dd235149d6326a Theodore Ts'o 2026-11-05  1007  	long_link[sizeof(long_link) - 1] = '\0';
dd235149d6326a Theodore Ts'o 2026-11-05  1008  	ret = create_inline_file(inode, long_link, strlen(long_link));
dd235149d6326a Theodore Ts'o 2026-11-05  1009  	KUNIT_ASSERT_EQ(test, ret, 0);
dd235149d6326a Theodore Ts'o 2026-11-05  1010  
dd235149d6326a Theodore Ts'o 2026-11-05  1011  	target = ext4_read_inline_link(inode);
dd235149d6326a Theodore Ts'o 2026-11-05  1012  	KUNIT_ASSERT_FALSE(test, IS_ERR(target));
dd235149d6326a Theodore Ts'o 2026-11-05  1013  	KUNIT_EXPECT_STREQ(test, target, long_link);
dd235149d6326a Theodore Ts'o 2026-11-05  1014  	kfree(target);
dd235149d6326a Theodore Ts'o 2026-11-05  1015  
dd235149d6326a Theodore Ts'o 2026-11-05  1016  	/* ext4_read_inline_link error when ext4_get_inode_loc fails */
dd235149d6326a Theodore Ts'o 2026-11-05  1017  	ctx->get_inode_loc_err = -EIO;
dd235149d6326a Theodore Ts'o 2026-11-05  1018  	target = ext4_read_inline_link(inode);
dd235149d6326a Theodore Ts'o 2026-11-05  1019  	KUNIT_EXPECT_TRUE(test, IS_ERR(target));
dd235149d6326a Theodore Ts'o 2026-11-05 @1020  	KUNIT_EXPECT_EQ(test, PTR_ERR(target), -EIO);
dd235149d6326a Theodore Ts'o 2026-11-05  1021  	ctx->get_inode_loc_err = 0;
dd235149d6326a Theodore Ts'o 2026-11-05  1022  }
dd235149d6326a Theodore Ts'o 2026-11-05  1023  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
