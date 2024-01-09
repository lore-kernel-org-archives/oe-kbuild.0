Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F65DAD35
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jan 2024 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqvMcYad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704783210; x=1736319210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PIs9atQcvLv2poNESPKq69Qu/860Vs1u/uFZd70YR/Q=;
  b=PqvMcYadFVbZnBd7PZx3PIuyF6OO8L88s2BLhB0aeRx8MZisweh2fo5U
   QAN9nU/eJKjV+uhSlD2RDjoVpnx3iLdX8LXdZswV26J/3HMqnp48LyjNR
   F8ZK+gRnei9N5WaMOq6G2rZKjXGzszroIh8SfCsVjWww0YYi1W1YRzw4T
   yKhqbFBL8t5xKNC3tRF3Ka0HhNBr4uVtGKV/r1Da86myDGKrlvVWtIgkT
   TKdaDgDiUKZnnbTCsAaIpUObeQ/lvdC9nWSo1I5pwrmD6VYjNoA55ewDj
   8zKlbB96Spa9DNX/NSw7c1/7t0mVUVq+xBPiORrNMf9RdPd8LTRotD3ny
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="395265350"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="395265350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="872142840"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="872142840"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jan 2024 22:53:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN5zK-0005Y6-0p;
	Tue, 09 Jan 2024 06:53:26 +0000
Date: Tue, 9 Jan 2024 14:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs3/fsntfs.c:2661 ntfs_set_label() error: __builtin_memcpy()
 'uni->name' too small (20 vs 256)
Message-ID: <202401091421.3RJ24Mn3-lkp@intel.com>
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
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f8413c4a66f2fb776d3dc3c9ed20bf435eb305e
commit: 7832e123490ac39f85ab5befc2ceee7b25b03acb fs/ntfs3: Add support /proc/fs/ntfs3/<dev>/volinfo and /proc/fs/ntfs3/<dev>/label
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20240107 (https://download.01.org/0day-ci/archive/20240109/202401091421.3RJ24Mn3-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401091421.3RJ24Mn3-lkp@intel.com/

New smatch warnings:
fs/ntfs3/fsntfs.c:2661 ntfs_set_label() error: __builtin_memcpy() 'uni->name' too small (20 vs 256)

Old smatch warnings:
fs/ntfs3/fsntfs.c:1257 ntfs_read_run_nb() error: uninitialized symbol 'clen'.
fs/ntfs3/fsntfs.c:1258 ntfs_read_run_nb() error: uninitialized symbol 'idx'.

vim +2661 fs/ntfs3/fsntfs.c

7832e123490ac3 Konstantin Komarov 2023-05-08  2623  
7832e123490ac3 Konstantin Komarov 2023-05-08  2624  /*
7832e123490ac3 Konstantin Komarov 2023-05-08  2625   * ntfs_set_label - updates current ntfs label.
7832e123490ac3 Konstantin Komarov 2023-05-08  2626   */
7832e123490ac3 Konstantin Komarov 2023-05-08  2627  int ntfs_set_label(struct ntfs_sb_info *sbi, u8 *label, int len)
7832e123490ac3 Konstantin Komarov 2023-05-08  2628  {
7832e123490ac3 Konstantin Komarov 2023-05-08  2629  	int err;
7832e123490ac3 Konstantin Komarov 2023-05-08  2630  	struct ATTRIB *attr;
7832e123490ac3 Konstantin Komarov 2023-05-08  2631  	struct ntfs_inode *ni = sbi->volume.ni;
7832e123490ac3 Konstantin Komarov 2023-05-08  2632  	const u8 max_ulen = 0x80; /* TODO: use attrdef to get maximum length */
7832e123490ac3 Konstantin Komarov 2023-05-08  2633  	/* Allocate PATH_MAX bytes. */
7832e123490ac3 Konstantin Komarov 2023-05-08  2634  	struct cpu_str *uni = __getname();
7832e123490ac3 Konstantin Komarov 2023-05-08  2635  
7832e123490ac3 Konstantin Komarov 2023-05-08  2636  	if (!uni)
7832e123490ac3 Konstantin Komarov 2023-05-08  2637  		return -ENOMEM;
7832e123490ac3 Konstantin Komarov 2023-05-08  2638  
7832e123490ac3 Konstantin Komarov 2023-05-08  2639  	err = ntfs_nls_to_utf16(sbi, label, len, uni, (PATH_MAX - 2) / 2,
7832e123490ac3 Konstantin Komarov 2023-05-08  2640  				UTF16_LITTLE_ENDIAN);
7832e123490ac3 Konstantin Komarov 2023-05-08  2641  	if (err < 0)
7832e123490ac3 Konstantin Komarov 2023-05-08  2642  		goto out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2643  
7832e123490ac3 Konstantin Komarov 2023-05-08  2644  	if (uni->len > max_ulen) {
7832e123490ac3 Konstantin Komarov 2023-05-08  2645  		ntfs_warn(sbi->sb, "new label is too long");
7832e123490ac3 Konstantin Komarov 2023-05-08  2646  		err = -EFBIG;
7832e123490ac3 Konstantin Komarov 2023-05-08  2647  		goto out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2648  	}
7832e123490ac3 Konstantin Komarov 2023-05-08  2649  
7832e123490ac3 Konstantin Komarov 2023-05-08  2650  	ni_lock(ni);
7832e123490ac3 Konstantin Komarov 2023-05-08  2651  
7832e123490ac3 Konstantin Komarov 2023-05-08  2652  	/* Ignore any errors. */
7832e123490ac3 Konstantin Komarov 2023-05-08  2653  	ni_remove_attr(ni, ATTR_LABEL, NULL, 0, false, NULL);
7832e123490ac3 Konstantin Komarov 2023-05-08  2654  
7832e123490ac3 Konstantin Komarov 2023-05-08  2655  	err = ni_insert_resident(ni, uni->len * sizeof(u16), ATTR_LABEL, NULL,
7832e123490ac3 Konstantin Komarov 2023-05-08  2656  				 0, &attr, NULL, NULL);
7832e123490ac3 Konstantin Komarov 2023-05-08  2657  	if (err < 0)
7832e123490ac3 Konstantin Komarov 2023-05-08  2658  		goto unlock_out;
7832e123490ac3 Konstantin Komarov 2023-05-08  2659  
7832e123490ac3 Konstantin Komarov 2023-05-08  2660  	/* write new label in on-disk struct. */
7832e123490ac3 Konstantin Komarov 2023-05-08 @2661  	memcpy(resident_data(attr), uni->name, uni->len * sizeof(u16));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
