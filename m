Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3146BEAC6
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 04:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713329548; cv=none; b=DbcwK59wpr8YNxFSgaPWXcmDVp4JRicKVmCOfILy2v2uvLBYD+hHdh224VkPNYBiNRLalRAxR75dvGEr4ccTtY1K9BmXCoXskCZL/ogLSJJ7TUv046HA1zmkJnsfM+infcH+5Pz0SdBMH7Df51ONKd0bJ5DyC85lS824WUAT9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713329548; c=relaxed/simple;
	bh=BmNUWWtlXS3o1swlekEPzcSYYVxnxYQcK2F5LaNuiDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A5dTwLlQIAOIK/EKe7NC02YMatCFPt1hjYzZqivm4mYpBS9WykkknBhnD1lkF79SMBbXkHJ3IaY698CHzezSlvwEcFq9MP253lnxZ+lS2dc62eiptAHe8Zf3dOqMxi6Ae2hIl4spPdMmCbTOFGguqiIXUG/IjjOotTCEVsKfxVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LctF5EC8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LctF5EC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713329545; x=1744865545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BmNUWWtlXS3o1swlekEPzcSYYVxnxYQcK2F5LaNuiDA=;
  b=LctF5EC8YTK0Hl5YaRiU8yEv0H26bFVsbNz76Ba2+740Oo9/igZRS2gd
   U/iP+Q8ZuuJAlx3Br0p4I2XiovMr2u3TD3llGOQcJPN4bt5uGU1o+3qU9
   yQ2XQ2K5ttp5IBEB8+YkLDngna11RbTAFLXe7ANfKlZTElTFjf6mneV5K
   IIGx5sCFEW+EQbcv8hhHBgpcwn6WJDVex7OPbSJdO1MF0QkRMlX3LunL2
   xYSnhDxEj0TFPnIdEO1WH86xT4Tq3CMFTaBH2BFpWTZcMSDuXm9aK1J3R
   JWnpSxu0bH0bFifc9K4TO5cmb3UDQB16kmCDgyqJs1GzgfGTID9uLagiU
   Q==;
X-CSE-ConnectionGUID: yJkJugpwTVuPeG/H0buxJg==
X-CSE-MsgGUID: LOSVQJ6GQeWozxdAxuR1Kg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8662346"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8662346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 21:52:24 -0700
X-CSE-ConnectionGUID: AUuobbbJRhiMyudK6WWgiw==
X-CSE-MsgGUID: gkzq2q9VR5CK/xO2uhDqIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27292862"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Apr 2024 21:52:23 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwxHQ-00068O-1W;
	Wed, 17 Apr 2024 04:52:20 +0000
Date: Wed, 17 Apr 2024 12:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:vectorized-scrub 129/166]
 fs/xfs/libxfs/xfs_ondisk.h:160:9: sparse: sparse: static assertion failed:
 "XFS: sizeof(struct xfs_getparents_rec) is wrong, expected 32"
Message-ID: <202404171202.OIlbjXWH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/libxfs/xfs_ondisk.h:160:9: sparse: sparse: static assertion failed: "XFS: sizeof(struct xfs_getparents_rec) is wrong, expected 32""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   a159a21af843928afe8939fac8d4b1b39c7175fe
commit: 089563f47fb3f09f9be77031a856cd502108dca7 [129/166] xfs: add parent pointer ioctls
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-randconfig-r112-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171202.OIlbjXWH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404171202.OIlbjXWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404171202.OIlbjXWH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/xfs/xfs_super.c: note: in included file:
>> fs/xfs/libxfs/xfs_ondisk.h:160:9: sparse: sparse: static assertion failed: "XFS: sizeof(struct xfs_getparents_rec) is wrong, expected 32"

vim +160 fs/xfs/libxfs/xfs_ondisk.h

30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09    8  
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09    9  #define XFS_CHECK_STRUCT_SIZE(structname, size) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h        Christoph Hellwig 2023-12-04   10  	static_assert(sizeof(structname) == (size), \
c12c50393c1f6f fs/xfs/xfs_ondisk.h        Christoph Hellwig 2023-12-04   11  		"XFS: sizeof(" #structname ") is wrong, expected " #size)
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   12  
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   13  #define XFS_CHECK_OFFSET(structname, member, off) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h        Christoph Hellwig 2023-12-04   14  	static_assert(offsetof(structname, member) == (off), \
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   15  		"XFS: offsetof(" #structname ", " #member ") is wrong, " \
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   16  		"expected " #off)
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   17  
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17   18  #define XFS_CHECK_VALUE(value, expected) \
c12c50393c1f6f fs/xfs/xfs_ondisk.h        Christoph Hellwig 2023-12-04   19  	static_assert((value) == (expected), \
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17   20  		"XFS: value of " #value " is wrong, expected " #expected)
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17   21  
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   22  static inline void __init
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   23  xfs_check_ondisk_structs(void)
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   24  {
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   25  	/* ag/file structures */
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   26  	XFS_CHECK_STRUCT_SIZE(struct xfs_acl,			4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   27  	XFS_CHECK_STRUCT_SIZE(struct xfs_acl_entry,		12);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   28  	XFS_CHECK_STRUCT_SIZE(struct xfs_agf,			224);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   29  	XFS_CHECK_STRUCT_SIZE(struct xfs_agfl,			36);
2a39946c984464 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17   30  	XFS_CHECK_STRUCT_SIZE(struct xfs_agi,			344);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   31  	XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_key,		8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   32  	XFS_CHECK_STRUCT_SIZE(struct xfs_bmbt_rec,		16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   33  	XFS_CHECK_STRUCT_SIZE(struct xfs_bmdr_block,		4);
ad70328a503fae fs/xfs/xfs_ondisk.h        Hou Tao           2016-07-20   34  	XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_shdr,	48);
ad70328a503fae fs/xfs/xfs_ondisk.h        Hou Tao           2016-07-20   35  	XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block_lhdr,	64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   36  	XFS_CHECK_STRUCT_SIZE(struct xfs_btree_block,		72);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   37  	XFS_CHECK_STRUCT_SIZE(struct xfs_dinode,		176);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   38  	XFS_CHECK_STRUCT_SIZE(struct xfs_disk_dquot,		104);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   39  	XFS_CHECK_STRUCT_SIZE(struct xfs_dqblk,			136);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   40  	XFS_CHECK_STRUCT_SIZE(struct xfs_dsb,			264);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   41  	XFS_CHECK_STRUCT_SIZE(struct xfs_dsymlink_hdr,		56);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   42  	XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_key,		4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   43  	XFS_CHECK_STRUCT_SIZE(struct xfs_inobt_rec,		16);
1946b91cee4fc8 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-10-03   44  	XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_key,		4);
1946b91cee4fc8 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-10-03   45  	XFS_CHECK_STRUCT_SIZE(struct xfs_refcount_rec,		12);
035e00acb5c719 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-08-03   46  	XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_key,		20);
035e00acb5c719 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-08-03   47  	XFS_CHECK_STRUCT_SIZE(struct xfs_rmap_rec,		24);
5a0bb066f60fa0 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-24   48  	XFS_CHECK_STRUCT_SIZE(xfs_timestamp_t,			8);
5a0bb066f60fa0 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-24   49  	XFS_CHECK_STRUCT_SIZE(struct xfs_legacy_timestamp,	8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   50  	XFS_CHECK_STRUCT_SIZE(xfs_alloc_key_t,			8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   51  	XFS_CHECK_STRUCT_SIZE(xfs_alloc_ptr_t,			4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   52  	XFS_CHECK_STRUCT_SIZE(xfs_alloc_rec_t,			8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   53  	XFS_CHECK_STRUCT_SIZE(xfs_inobt_ptr_t,			4);
1946b91cee4fc8 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-10-03   54  	XFS_CHECK_STRUCT_SIZE(xfs_refcount_ptr_t,		4);
035e00acb5c719 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-08-03   55  	XFS_CHECK_STRUCT_SIZE(xfs_rmap_ptr_t,			4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   56  
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   57  	/* dir/attr trees */
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   58  	XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leaf_hdr,	80);
a49bbce58ea90b fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-07-10   59  	XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_leafblock,	80);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   60  	XFS_CHECK_STRUCT_SIZE(struct xfs_attr3_rmt_hdr,		56);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   61  	XFS_CHECK_STRUCT_SIZE(struct xfs_da3_blkinfo,		56);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   62  	XFS_CHECK_STRUCT_SIZE(struct xfs_da3_intnode,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   63  	XFS_CHECK_STRUCT_SIZE(struct xfs_da3_node_hdr,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   64  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_blk_hdr,		48);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   65  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_data_hdr,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   66  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   67  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_free_hdr,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   68  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   69  	XFS_CHECK_STRUCT_SIZE(struct xfs_dir3_leaf_hdr,		64);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   70  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_entry_t,		8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   71  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_hdr_t,		32);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   72  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_map_t,		4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   73  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_local_t,	4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   74  
97e993830a1cdd fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-10-16   75  	/* realtime structures */
97e993830a1cdd fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-10-16   76  	XFS_CHECK_STRUCT_SIZE(union xfs_rtword_raw,		4);
663b8db7b0256b fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-10-16   77  	XFS_CHECK_STRUCT_SIZE(union xfs_suminfo_raw,		4);
97e993830a1cdd fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-10-16   78  
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   79  	/*
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   80  	 * m68k has problems with xfs_attr_leaf_name_remote_t, but we pad it to
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   81  	 * 4 bytes anyway so it's not obviously a problem.  Hence for the moment
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   82  	 * we don't check this structure. This can be re-instated when the attr
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   83  	 * definitions are updated to use c99 VLA definitions.
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   84  	 *
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   85  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leaf_name_remote_t,	12);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   86  	 */
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09   87  
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   88  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, valuelen,	0);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   89  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, namelen,	2);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   90  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_local_t, nameval,	3);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   91  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valueblk,	0);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   92  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, valuelen,	4);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   93  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, namelen,	8);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21   94  	XFS_CHECK_OFFSET(xfs_attr_leaf_name_remote_t, name,	9);
a49bbce58ea90b fs/xfs/xfs_ondisk.h        Darrick J. Wong   2023-07-10   95  	XFS_CHECK_STRUCT_SIZE(xfs_attr_leafblock_t,		32);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20   96  	XFS_CHECK_STRUCT_SIZE(struct xfs_attr_sf_hdr,		4);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20   97  	XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, totsize,	0);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20   98  	XFS_CHECK_OFFSET(struct xfs_attr_sf_hdr, count,		2);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20   99  	XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, namelen,	0);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20  100  	XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, valuelen,	1);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20  101  	XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, flags,	2);
414147225400a0 fs/xfs/libxfs/xfs_ondisk.h Christoph Hellwig 2023-12-20  102  	XFS_CHECK_OFFSET(struct xfs_attr_sf_entry, nameval,	3);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  103  	XFS_CHECK_STRUCT_SIZE(xfs_da_blkinfo_t,			12);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  104  	XFS_CHECK_STRUCT_SIZE(xfs_da_intnode_t,			16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  105  	XFS_CHECK_STRUCT_SIZE(xfs_da_node_entry_t,		8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  106  	XFS_CHECK_STRUCT_SIZE(xfs_da_node_hdr_t,		16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  107  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_free_t,		4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  108  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_data_hdr_t,		16);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21  109  	XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, freetag,	0);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21  110  	XFS_CHECK_OFFSET(xfs_dir2_data_unused_t, length,	2);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  111  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_hdr_t,		16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  112  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_free_t,			16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  113  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_entry_t,		8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  114  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_hdr_t,		16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  115  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_t,			16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  116  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_leaf_tail_t,		4);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  117  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_entry_t,		3);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21  118  	XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, namelen,		0);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21  119  	XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, offset,		1);
3f94c441e2c3de fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-06-21  120  	XFS_CHECK_OFFSET(xfs_dir2_sf_entry_t, name,		3);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  121  	XFS_CHECK_STRUCT_SIZE(xfs_dir2_sf_hdr_t,		10);
24da4cb4db6cd0 fs/xfs/libxfs/xfs_ondisk.h Allison Henderson 2024-01-09  122  	XFS_CHECK_STRUCT_SIZE(struct xfs_parent_rec,		12);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  123  
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  124  	/* log structures */
b7df5e92055c69 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-01-07  125  	XFS_CHECK_STRUCT_SIZE(struct xfs_buf_log_format,	88);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  126  	XFS_CHECK_STRUCT_SIZE(struct xfs_dq_logformat,		24);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  127  	XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_32,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  128  	XFS_CHECK_STRUCT_SIZE(struct xfs_efd_log_format_64,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  129  	XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_32,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  130  	XFS_CHECK_STRUCT_SIZE(struct xfs_efi_log_format_64,	16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  131  	XFS_CHECK_STRUCT_SIZE(struct xfs_extent_32,		12);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  132  	XFS_CHECK_STRUCT_SIZE(struct xfs_extent_64,		16);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  133  	XFS_CHECK_STRUCT_SIZE(struct xfs_log_dinode,		176);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  134  	XFS_CHECK_STRUCT_SIZE(struct xfs_icreate_log,		28);
6fc277c7c935c7 fs/xfs/xfs_ondisk.h        Christoph Hellwig 2021-04-21  135  	XFS_CHECK_STRUCT_SIZE(xfs_log_timestamp_t,		8);
732de7dbdbd30d fs/xfs/xfs_ondisk.h        Christoph Hellwig 2021-04-21  136  	XFS_CHECK_STRUCT_SIZE(struct xfs_log_legacy_timestamp,	8);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  137  	XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format_32,	52);
20413e37d71bef fs/xfs/xfs_ondisk.h        Dave Chinner      2017-10-09  138  	XFS_CHECK_STRUCT_SIZE(struct xfs_inode_log_format,	56);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  139  	XFS_CHECK_STRUCT_SIZE(struct xfs_qoff_logformat,	20);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  140  	XFS_CHECK_STRUCT_SIZE(struct xfs_trans_header,		16);
fd920008784ead fs/xfs/xfs_ondisk.h        Allison Henderson 2022-05-04  141  	XFS_CHECK_STRUCT_SIZE(struct xfs_attri_log_format,	40);
fd920008784ead fs/xfs/xfs_ondisk.h        Allison Henderson 2022-05-04  142  	XFS_CHECK_STRUCT_SIZE(struct xfs_attrd_log_format,	16);
a38ebce1da271f fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  143  	XFS_CHECK_STRUCT_SIZE(struct xfs_bui_log_format,	16);
a38ebce1da271f fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  144  	XFS_CHECK_STRUCT_SIZE(struct xfs_bud_log_format,	16);
a38935c03c7914 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  145  	XFS_CHECK_STRUCT_SIZE(struct xfs_cui_log_format,	16);
a38935c03c7914 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  146  	XFS_CHECK_STRUCT_SIZE(struct xfs_cud_log_format,	16);
b45ca961e94673 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  147  	XFS_CHECK_STRUCT_SIZE(struct xfs_rui_log_format,	16);
b45ca961e94673 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  148  	XFS_CHECK_STRUCT_SIZE(struct xfs_rud_log_format,	16);
a38ebce1da271f fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  149  	XFS_CHECK_STRUCT_SIZE(struct xfs_map_extent,		32);
a38935c03c7914 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  150  	XFS_CHECK_STRUCT_SIZE(struct xfs_phys_extent,		16);
a38ebce1da271f fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  151  
a38ebce1da271f fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  152  	XFS_CHECK_OFFSET(struct xfs_bui_log_format, bui_extents,	16);
a38935c03c7914 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  153  	XFS_CHECK_OFFSET(struct xfs_cui_log_format, cui_extents,	16);
b45ca961e94673 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  154  	XFS_CHECK_OFFSET(struct xfs_rui_log_format, rui_extents,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  155  	XFS_CHECK_OFFSET(struct xfs_efi_log_format, efi_extents,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  156  	XFS_CHECK_OFFSET(struct xfs_efi_log_format_32, efi_extents,	16);
03a7485cd701e1 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2022-10-20  157  	XFS_CHECK_OFFSET(struct xfs_efi_log_format_64, efi_extents,	16);
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  158  
089563f47fb3f0 fs/xfs/libxfs/xfs_ondisk.h Darrick J. Wong   2024-04-04  159  	/* parent pointer ioctls */
089563f47fb3f0 fs/xfs/libxfs/xfs_ondisk.h Darrick J. Wong   2024-04-04 @160  	XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_rec,	32);
089563f47fb3f0 fs/xfs/libxfs/xfs_ondisk.h Darrick J. Wong   2024-04-04  161  	XFS_CHECK_STRUCT_SIZE(struct xfs_getparents,		40);
089563f47fb3f0 fs/xfs/libxfs/xfs_ondisk.h Darrick J. Wong   2024-04-04  162  	XFS_CHECK_STRUCT_SIZE(struct xfs_getparents_by_handle,	64);
089563f47fb3f0 fs/xfs/libxfs/xfs_ondisk.h Darrick J. Wong   2024-04-04  163  
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  164  	/*
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  165  	 * The v5 superblock format extended several v4 header structures with
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  166  	 * additional data. While new fields are only accessible on v5
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  167  	 * superblocks, it's important that the v5 structures place original v4
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  168  	 * fields/headers in the correct location on-disk. For example, we must
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  169  	 * be able to find magic values at the same location in certain blocks
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  170  	 * regardless of superblock version.
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  171  	 *
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  172  	 * The following checks ensure that various v5 data structures place the
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  173  	 * subset of v4 metadata associated with the same type of block at the
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  174  	 * start of the on-disk block. If there is no data structure definition
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  175  	 * for certain types of v4 blocks, traverse down to the first field of
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  176  	 * common metadata (e.g., magic value) and make sure it is at offset
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  177  	 * zero.
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  178  	 */
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  179  	XFS_CHECK_OFFSET(struct xfs_dir3_leaf, hdr.info.hdr,	0);
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  180  	XFS_CHECK_OFFSET(struct xfs_da3_intnode, hdr.info.hdr,	0);
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  181  	XFS_CHECK_OFFSET(struct xfs_dir3_data_hdr, hdr.magic,	0);
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  182  	XFS_CHECK_OFFSET(struct xfs_dir3_free, hdr.hdr.magic,	0);
670105de15cd98 fs/xfs/xfs_ondisk.h        Brian Foster      2019-02-08  183  	XFS_CHECK_OFFSET(struct xfs_attr3_leafblock, hdr.info.hdr, 0);
7035f9724f8497 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2019-07-03  184  
7035f9724f8497 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2019-07-03  185  	XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat,		192);
5f19c7fc687335 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2019-07-03  186  	XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers,		24);
0448b6f488fa66 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2019-07-03  187  	XFS_CHECK_STRUCT_SIZE(struct xfs_bulkstat_req,		64);
fba9760a433634 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2019-07-03  188  	XFS_CHECK_STRUCT_SIZE(struct xfs_inumbers_req,		64);
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  189  
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  190  	/*
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  191  	 * Make sure the incore inode timestamp range corresponds to hand
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  192  	 * converted values based on the ondisk format specification.
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  193  	 */
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  194  	XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MIN - XFS_BIGTIME_EPOCH_OFFSET,
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  195  			XFS_LEGACY_TIME_MIN);
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  196  	XFS_CHECK_VALUE(XFS_BIGTIME_TIME_MAX - XFS_BIGTIME_EPOCH_OFFSET,
f93e5436f0ee5a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  197  			16299260424LL);
4ea1ff3b49681a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  198  
4ea1ff3b49681a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  199  	/* Do the same with the incore quota expiration range. */
4ea1ff3b49681a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  200  	XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MIN << XFS_DQ_BIGTIME_SHIFT, 4);
4ea1ff3b49681a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  201  	XFS_CHECK_VALUE(XFS_DQ_BIGTIME_EXPIRY_MAX << XFS_DQ_BIGTIME_SHIFT,
4ea1ff3b49681a fs/xfs/xfs_ondisk.h        Darrick J. Wong   2020-08-17  202  			16299260424LL);
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  203  }
30cbc591c34e68 fs/xfs/xfs_ondisk.h        Darrick J. Wong   2016-03-09  204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
