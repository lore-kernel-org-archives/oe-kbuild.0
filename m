Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89539287261
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Jul 2025 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753157706; cv=none; b=ZVFoQDtO/4G3weIl6Gu6/rsmiG0AwAnVFCnUd7RR3iLeIm1syLPSBpFdGyr3uAfi0w1zmDPJXagVTaUNloNuZb0EPCoZ2HJvQEYm8LAqb7jtv/kP6DNKccmCPl5mIiQvTFgvVJMO8Ru8nFl0wegvqR2cbbIJWPk9au3YFHNM4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753157706; c=relaxed/simple;
	bh=CGkDLKxRnDExJ5rJZrHkkaNHkOB1moO7uXsGiInC3L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQqsTwF2nnM+hbP/s4Nx13tlxitf+3XjPwOWWV9DS2xMCebtDxCxYH9y6ll8t649Cyy2IAxrzwxLA1bE1qhlSOIp9fgeYY+F9tkNRJAOF1LuylzmUCuOwsVjFWtQDGys7xD232msqyGWpbxRu3jTKH/+/OTJa0J1+eADnmxSolc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6w9yXjp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6w9yXjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753157705; x=1784693705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGkDLKxRnDExJ5rJZrHkkaNHkOB1moO7uXsGiInC3L4=;
  b=d6w9yXjpnH2/L8ovMLWTJrNLhq+RFeoEfDFV2ezb9HU7xdbw5UzbFnAu
   m/CinbPyX70/WKFk5L+BX0FQM8Sd6GeaAqBhs2Gmp6P+uaoj11qnQ5KKm
   OP6qox4TGBTSpbph5LxozDxFctKbM9CKzoegQtgqYLj2LD7QTsnyc3nDv
   kEVVrO01/mVGaxVYDn+cGJrgsH3pU0FFdjYV3XKJwKaDnIH1nxFxG5MaA
   w82xfk98lFQxxy3GJnIqu0fz2uOv/n0neikrpxJpepDJUeqkB47aNxBob
   UmRgo8K7wJEqeDuhdmY+9LLqm1oov8zcN9tKT/x21twW3UD/iL0heyyQ3
   g==;
X-CSE-ConnectionGUID: ACHWhaD1TZCmCnP0XRGOfg==
X-CSE-MsgGUID: u1gSAmajRI6+7W7m9oYPtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55477946"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="55477946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 21:15:04 -0700
X-CSE-ConnectionGUID: X7A77VUJQBODzryh2bAaSw==
X-CSE-MsgGUID: yehpuEcRTyOZ2oz/IPldPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="182735591"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2025 21:15:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue4P6-000HQh-0d;
	Tue, 22 Jul 2025 04:15:00 +0000
Date: Tue, 22 Jul 2025 12:14:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10613/11398] fs/erofs/super.c:327
 erofs_read_superblock() warn: bitwise AND condition is false here
Message-ID: <202507221201.Ns8wkK2s-lkp@intel.com>
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
TO: Bo Liu <liubo03@inspur.com>
CC: Gao Xiang <xiang@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: e484a15cdbd35414109b8d539c142bb2b7bcd348 [10613/11398] erofs: implement metadata compression
:::::: branch date: 21 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221201.Ns8wkK2s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507221201.Ns8wkK2s-lkp@intel.com/

smatch warnings:
fs/erofs/super.c:327 erofs_read_superblock() warn: bitwise AND condition is false here

vim +327 fs/erofs/super.c

dfeab2e95a75a4 fs/erofs/super.c              Gao Xiang     2021-10-14  252  
99634bf388db04 fs/erofs/super.c              Gao Xiang     2019-09-04  253  static int erofs_read_superblock(struct super_block *sb)
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  254  {
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  255  	struct erofs_sb_info *sbi = EROFS_SB(sb);
ed6e0401e68bdf fs/erofs/super.c              Jeffle Xu     2022-02-09  256  	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
0259f209487c83 fs/erofs/super.c              Gao Xiang     2019-09-04  257  	struct erofs_super_block *dsb;
fe7c2423570dca fs/erofs/super.c              Gao Xiang     2019-09-04  258  	void *data;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  259  	int ret;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  260  
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  261  	data = erofs_read_metabuf(&buf, sb, 0, false);
ed6e0401e68bdf fs/erofs/super.c              Jeffle Xu     2022-02-09  262  	if (IS_ERR(data)) {
4f761fa253b49f fs/erofs/super.c              Gao Xiang     2019-09-04  263  		erofs_err(sb, "cannot read erofs superblock");
ed6e0401e68bdf fs/erofs/super.c              Jeffle Xu     2022-02-09  264  		return PTR_ERR(data);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  265  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  266  
fe7c2423570dca fs/erofs/super.c              Gao Xiang     2019-09-04  267  	dsb = (struct erofs_super_block *)(data + EROFS_SUPER_OFFSET);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  268  	ret = -EINVAL;
0259f209487c83 fs/erofs/super.c              Gao Xiang     2019-09-04  269  	if (le32_to_cpu(dsb->magic) != EROFS_SUPER_MAGIC_V1) {
4f761fa253b49f fs/erofs/super.c              Gao Xiang     2019-09-04  270  		erofs_err(sb, "cannot find valid erofs superblock");
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  271  		goto out;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  272  	}
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  273  
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  274  	sbi->blkszbits = dsb->blkszbits;
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  275  	if (sbi->blkszbits < 9 || sbi->blkszbits > PAGE_SHIFT) {
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  276  		erofs_err(sb, "blkszbits %u isn't supported", sbi->blkszbits);
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  277  		goto out;
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  278  	}
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  279  	if (dsb->dirblkbits) {
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  280  		erofs_err(sb, "dirblkbits %u isn't supported", dsb->dirblkbits);
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  281  		goto out;
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  282  	}
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  283  
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  284  	sbi->feature_compat = le32_to_cpu(dsb->feature_compat);
de06a6a375414b fs/erofs/super.c              Gao Xiang     2021-03-29  285  	if (erofs_sb_has_sb_chksum(sbi)) {
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  286  		ret = erofs_superblock_csum_verify(sb, data);
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  287  		if (ret)
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  288  			goto out;
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  289  	}
b858a4844cfba3 fs/erofs/super.c              Pratik Shinde 2019-11-04  290  
0508c1ad0f264a fs/erofs/super.c              Wei Yongjun   2021-05-19  291  	ret = -EINVAL;
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  292  	sbi->feature_incompat = le32_to_cpu(dsb->feature_incompat);
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  293  	if (sbi->feature_incompat & ~EROFS_ALL_FEATURE_INCOMPAT) {
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  294  		erofs_err(sb, "unidentified incompatible feature %x, please upgrade kernel",
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  295  			  sbi->feature_incompat & ~EROFS_ALL_FEATURE_INCOMPAT);
5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang     2019-06-13  296  		goto out;
2c534624ae7010 fs/erofs/super.c              Hongzhen Luo  2024-08-06  297  	}
5efe5137f05bbb drivers/staging/erofs/super.c Gao Xiang     2019-06-13  298  
14373711dd54be fs/erofs/super.c              Gao Xiang     2021-03-29  299  	sbi->sb_size = 128 + dsb->sb_extslots * EROFS_SB_EXTSLOT_SIZE;
d3c4bdcc756e60 fs/erofs/super.c              Jingbo Xu     2023-03-13  300  	if (sbi->sb_size > PAGE_SIZE - EROFS_SUPER_OFFSET) {
14373711dd54be fs/erofs/super.c              Gao Xiang     2021-03-29  301  		erofs_err(sb, "invalid sb_extslots %u (more than a fs block)",
14373711dd54be fs/erofs/super.c              Gao Xiang     2021-03-29  302  			  sbi->sb_size);
14373711dd54be fs/erofs/super.c              Gao Xiang     2021-03-29  303  		goto out;
14373711dd54be fs/erofs/super.c              Gao Xiang     2021-03-29  304  	}
61ba89b5790557 fs/erofs/super.c              Gao Xiang     2025-03-10  305  	sbi->dif0.blocks = le32_to_cpu(dsb->blocks_lo);
0259f209487c83 fs/erofs/super.c              Gao Xiang     2019-09-04  306  	sbi->meta_blkaddr = le32_to_cpu(dsb->meta_blkaddr);
b17500a0fdbae1 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  307  #ifdef CONFIG_EROFS_FS_XATTR
0259f209487c83 fs/erofs/super.c              Gao Xiang     2019-09-04  308  	sbi->xattr_blkaddr = le32_to_cpu(dsb->xattr_blkaddr);
6a318ccd7e0837 fs/erofs/super.c              Jingbo Xu     2023-04-08  309  	sbi->xattr_prefix_start = le32_to_cpu(dsb->xattr_prefix_start);
6a318ccd7e0837 fs/erofs/super.c              Jingbo Xu     2023-04-08  310  	sbi->xattr_prefix_count = dsb->xattr_prefix_count;
fd73a4395d477a fs/erofs/super.c              Jingbo Xu     2023-07-22  311  	sbi->xattr_filter_reserved = dsb->xattr_filter_reserved;
b17500a0fdbae1 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  312  #endif
8a76568225deae fs/erofs/super.c              Gao Xiang     2019-09-04  313  	sbi->islotbits = ilog2(sizeof(struct erofs_inode_compact));
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  314  	if (erofs_sb_has_48bit(sbi) && dsb->rootnid_8b) {
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  315  		sbi->root_nid = le64_to_cpu(dsb->rootnid_8b);
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  316  		sbi->dif0.blocks = (sbi->dif0.blocks << 32) |
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  317  				le16_to_cpu(dsb->rb.blocks_hi);
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  318  	} else {
61ba89b5790557 fs/erofs/super.c              Gao Xiang     2025-03-10  319  		sbi->root_nid = le16_to_cpu(dsb->rb.rootnid_2b);
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  320  	}
cb9bce79514392 fs/erofs/super.c              Jingbo Xu     2023-04-07  321  	sbi->packed_nid = le64_to_cpu(dsb->packed_nid);
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  322  	if (erofs_sb_has_metabox(sbi)) {
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  323  		if (sbi->sb_size <= offsetof(struct erofs_super_block,
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  324  					     metabox_nid))
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  325  			return -EFSCORRUPTED;
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  326  		sbi->metabox_nid = le64_to_cpu(dsb->metabox_nid);
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18 @327  		if (sbi->metabox_nid & BIT(EROFS_DIRENT_NID_METABOX_BIT))
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  328  			return -EFSCORRUPTED;	/* self-loop detection */
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  329  	}
0259f209487c83 fs/erofs/super.c              Gao Xiang     2019-09-04  330  	sbi->inos = le64_to_cpu(dsb->inos);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  331  
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  332  	sbi->epoch = (s64)le64_to_cpu(dsb->epoch);
2e1473d5195f9c fs/erofs/super.c              Gao Xiang     2025-03-10  333  	sbi->fixed_nsec = le32_to_cpu(dsb->fixed_nsec);
cc69a681b2573e fs/erofs/super.c              Huang Xiaojia 2024-06-24  334  	super_set_uuid(sb, (void *)dsb->uuid, sizeof(dsb->uuid));
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  335  
5d50538fc567c6 fs/erofs/super.c              Huang Jianan  2021-03-29  336  	/* parse on-disk compression configurations */
efb4fb02cef3ab fs/erofs/super.c              Gao Xiang     2023-10-22  337  	ret = z_erofs_parse_cfgs(sb, dsb);
dfeab2e95a75a4 fs/erofs/super.c              Gao Xiang     2021-10-14  338  	if (ret < 0)
dfeab2e95a75a4 fs/erofs/super.c              Gao Xiang     2021-10-14  339  		goto out;
dfeab2e95a75a4 fs/erofs/super.c              Gao Xiang     2021-10-14  340  
dfeab2e95a75a4 fs/erofs/super.c              Gao Xiang     2021-10-14  341  	/* handle multiple devices */
ba73eadd23d1c2 fs/erofs/super.c              Jeffle Xu     2022-05-12  342  	ret = erofs_scan_devices(sb, dsb);
ab92184ff8f129 fs/erofs/super.c              Yue Hu        2021-12-28  343  
0f24e3c05afeac fs/erofs/super.c              Gao Xiang     2025-03-10  344  	if (erofs_sb_has_48bit(sbi))
0f24e3c05afeac fs/erofs/super.c              Gao Xiang     2025-03-10  345  		erofs_info(sb, "EXPERIMENTAL 48-bit layout support in use. Use at your own risk!");
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  346  	if (erofs_sb_has_metabox(sbi))
e484a15cdbd354 fs/erofs/super.c              Bo Liu        2025-07-18  347  		erofs_info(sb, "EXPERIMENTAL metadata compression support in use. Use at your own risk!");
9c0cc9c7296574 fs/erofs/super.c              Jeffle Xu     2022-04-25  348  	if (erofs_is_fscache_mode(sb))
0d442ce0b3027e fs/erofs/super.c              Gao Xiang     2024-08-30  349  		erofs_info(sb, "[deprecated] fscache-based on-demand read feature in use. Use at your own risk!");
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  350  out:
ed6e0401e68bdf fs/erofs/super.c              Jeffle Xu     2022-02-09  351  	erofs_put_metabuf(&buf);
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  352  	return ret;
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  353  }
ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang     2018-07-26  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
