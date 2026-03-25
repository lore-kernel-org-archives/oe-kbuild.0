Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2E2EDD62
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 04:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774413616; cv=none; b=uTvYWkNjmd5nD7omEPSuS/Yp+6LcTqNZK+VgNaBE8LRMejJlKt8C76hBzzqDWhldu9oMg/LbAqHd+BuR16dzgWATiuhBVyFhfobbX/OZHjqVqbozgCX1sZWF/XzmG5HouxPbbb4LOzKiYxhYpBtSNNfF015K/jHvdnUbs+PvNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774413616; c=relaxed/simple;
	bh=sZ2GcDKpYmEdWhvQg9QSLzU5/cvAU2oKMuuJml2Z0wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YfHTvQ3PkC8JKqvbuT35S7XcJCzG12Bp0XaNKsnsusntYKmeAK8TgfDS9Qv2RaCHBhAometzNpd9Q/34K2HMXDs/rYkwJIZaNHUzHcmkwT4d91IHireyZMXdAOci+YZ/1h79FHaFICfG6G2FJulNQWGaTPTStH/5Qp0gjXQgiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffiykdFf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffiykdFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774413615; x=1805949615;
  h=date:from:to:cc:subject:message-id;
  bh=sZ2GcDKpYmEdWhvQg9QSLzU5/cvAU2oKMuuJml2Z0wg=;
  b=ffiykdFf6ovGfwDXwG5gaZtaotBCx5ZPZ7iNV5lu5j8It02WpMkdM//k
   HyOw2YhKHURHyX5xUxtaK6s70svzUeRvdKyTHKay+PmGU3hNlXJAzhEzj
   OiIxhy5dawDfqKBNKFq8RkimiwrqNVyNu7jRJaoZdB8HyURXH8pD3GSVn
   YcKWSqd5n4mEciPwa/xsKoZJCOSxEwdp+aYbLWpCTb+L+eVXNvacPef1l
   W91Z5wsLkgBruE2FLwhhwPB9Ije2D8KznE8JbYGHqMnn93gsiZBLlCSGY
   VFTknLRNwgWwqbucLbUGpRmcHJaGnRHDkSnGv85D3vS4VZt2EXXlFGVyf
   Q==;
X-CSE-ConnectionGUID: 4tllForsSgKzbSZzskkcNA==
X-CSE-MsgGUID: VCiHEYEcRhaaDztAikIOVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75512675"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75512675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 21:40:12 -0700
X-CSE-ConnectionGUID: /ltYEGnjQ62X3GuZN6pvxA==
X-CSE-MsgGUID: q5rW2fMVTquc5Wd66e+d9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229486421"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 21:40:11 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5G2K-0000000064x-0ymp;
	Wed, 25 Mar 2026 04:40:08 +0000
Date: Wed, 25 Mar 2026 12:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 450/8611] fs/ntfs/mft.c:1417
 ntfs_mft_bitmap_extend_allocation_nolock() warn: inconsistent returns
 '&mftbmp_ni->size_lock'.
Message-ID: <202603251229.dyjK0AWy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b [450/8611] ntfs: add Kconfig and Makefile
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: s390-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251229.dyjK0AWy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251229.dyjK0AWy-lkp@intel.com/

New smatch warnings:
fs/ntfs/mft.c:1417 ntfs_mft_bitmap_extend_allocation_nolock() warn: inconsistent returns '&mftbmp_ni->size_lock'.
fs/ntfs/mft.c:1849 ntfs_mft_data_extend_allocation_nolock() warn: inconsistent returns '&mft_ni->size_lock'.

Old smatch warnings:
fs/ntfs/mft.c:1034 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn: mask and shift to zero: expr='bit >> 3'
fs/ntfs/mft.c:2465 ntfs_mft_record_alloc() warn: inconsistent indenting
fs/ntfs/mft.c:2532 ntfs_mft_record_alloc() error: we previously assumed '*ni' could be null (see line 2112)

vim +1417 fs/ntfs/mft.c

115380f9a2f9675 Namjae Jeon 2026-02-13  1116  
115380f9a2f9675 Namjae Jeon 2026-02-13  1117  /*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1118   * ntfs_mft_bitmap_extend_allocation_nolock - extend mft bitmap by a cluster
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1119   * @vol:	volume on which to extend the mft bitmap attribute
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1120   *
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1121   * Extend the mft bitmap attribute on the ntfs volume @vol by one cluster.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1122   *
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1123   * Note: Only changes allocated_size, i.e. does not touch initialized_size or
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1124   * data_size.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1125   *
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1126   * Return 0 on success and -errno on error.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1127   *
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1128   * Locking: - Caller must hold vol->mftbmp_lock for writing.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1129   *	    - This function takes NTFS_I(vol->mftbmp_ino)->runlist.lock for
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1130   *	      writing and releases it before returning.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1131   *	    - This function takes vol->lcnbmp_lock for writing and releases it
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1132   *	      before returning.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1133   */
115380f9a2f9675 Namjae Jeon 2026-02-13  1134  static int ntfs_mft_bitmap_extend_allocation_nolock(struct ntfs_volume *vol)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1135  {
115380f9a2f9675 Namjae Jeon 2026-02-13  1136  	s64 lcn;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1137  	s64 ll;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1138  	unsigned long flags;
115380f9a2f9675 Namjae Jeon 2026-02-13  1139  	struct folio *folio;
115380f9a2f9675 Namjae Jeon 2026-02-13  1140  	struct ntfs_inode *mft_ni, *mftbmp_ni;
115380f9a2f9675 Namjae Jeon 2026-02-13  1141  	struct runlist_element *rl, *rl2 = NULL;
115380f9a2f9675 Namjae Jeon 2026-02-13  1142  	struct ntfs_attr_search_ctx *ctx = NULL;
115380f9a2f9675 Namjae Jeon 2026-02-13  1143  	struct mft_record *mrec;
115380f9a2f9675 Namjae Jeon 2026-02-13  1144  	struct attr_record *a = NULL;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1145  	int ret, mp_size;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1146  	u32 old_alen = 0;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1147  	u8 *b, tb;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1148  	struct {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1149  		u8 added_cluster:1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1150  		u8 added_run:1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1151  		u8 mp_rebuilt:1;
115380f9a2f9675 Namjae Jeon 2026-02-13  1152  		u8 mp_extended:1;
115380f9a2f9675 Namjae Jeon 2026-02-13  1153  	} status = { 0, 0, 0, 0 };
115380f9a2f9675 Namjae Jeon 2026-02-13  1154  	size_t new_rl_count;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1155  
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1156  	ntfs_debug("Extending mft bitmap allocation.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1157  	mft_ni = NTFS_I(vol->mft_ino);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1158  	mftbmp_ni = NTFS_I(vol->mftbmp_ino);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1159  	/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1160  	 * Determine the last lcn of the mft bitmap.  The allocated size of the
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1161  	 * mft bitmap cannot be zero so we are ok to do this.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1162  	 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1163  	down_write(&mftbmp_ni->runlist.lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1164  	read_lock_irqsave(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1165  	ll = mftbmp_ni->allocated_size;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1166  	read_unlock_irqrestore(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1167  	rl = ntfs_attr_find_vcn_nolock(mftbmp_ni,
115380f9a2f9675 Namjae Jeon 2026-02-13  1168  			NTFS_B_TO_CLU(vol, ll - 1), NULL);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1169  	if (IS_ERR(rl) || unlikely(!rl->length || rl->lcn < 0)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1170  		up_write(&mftbmp_ni->runlist.lock);
115380f9a2f9675 Namjae Jeon 2026-02-13  1171  		ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1172  			"Failed to determine last allocated cluster of mft bitmap attribute.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1173  		if (!IS_ERR(rl))
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1174  			ret = -EIO;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1175  		else
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1176  			ret = PTR_ERR(rl);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1177  		return ret;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1178  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1179  	lcn = rl->lcn + rl->length;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1180  	ntfs_debug("Last lcn of mft bitmap attribute is 0x%llx.",
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1181  			(long long)lcn);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1182  	/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1183  	 * Attempt to get the cluster following the last allocated cluster by
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1184  	 * hand as it may be in the MFT zone so the allocator would not give it
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1185  	 * to us.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1186  	 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1187  	ll = lcn >> 3;
115380f9a2f9675 Namjae Jeon 2026-02-13  1188  	folio = read_mapping_folio(vol->lcnbmp_ino->i_mapping,
115380f9a2f9675 Namjae Jeon 2026-02-13  1189  			ll >> PAGE_SHIFT, NULL);
115380f9a2f9675 Namjae Jeon 2026-02-13  1190  	if (IS_ERR(folio)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1191  		up_write(&mftbmp_ni->runlist.lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1192  		ntfs_error(vol->sb, "Failed to read from lcn bitmap.");
115380f9a2f9675 Namjae Jeon 2026-02-13  1193  		return PTR_ERR(folio);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1194  	}
115380f9a2f9675 Namjae Jeon 2026-02-13  1195  
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1196  	down_write(&vol->lcnbmp_lock);
115380f9a2f9675 Namjae Jeon 2026-02-13  1197  	folio_lock(folio);
115380f9a2f9675 Namjae Jeon 2026-02-13  1198  	b = (u8 *)kmap_local_folio(folio, 0) + (ll & ~PAGE_MASK);
115380f9a2f9675 Namjae Jeon 2026-02-13  1199  	tb = 1 << (lcn & 7ull);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1200  	if (*b != 0xff && !(*b & tb)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1201  		/* Next cluster is free, allocate it. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1202  		*b |= tb;
115380f9a2f9675 Namjae Jeon 2026-02-13  1203  		folio_mark_dirty(folio);
115380f9a2f9675 Namjae Jeon 2026-02-13  1204  		folio_unlock(folio);
115380f9a2f9675 Namjae Jeon 2026-02-13  1205  		kunmap_local(b);
115380f9a2f9675 Namjae Jeon 2026-02-13  1206  		folio_put(folio);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1207  		up_write(&vol->lcnbmp_lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1208  		/* Update the mft bitmap runlist. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1209  		rl->length++;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1210  		rl[1].vcn++;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1211  		status.added_cluster = 1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1212  		ntfs_debug("Appending one cluster to mft bitmap.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1213  	} else {
115380f9a2f9675 Namjae Jeon 2026-02-13  1214  		folio_unlock(folio);
115380f9a2f9675 Namjae Jeon 2026-02-13  1215  		kunmap_local(b);
115380f9a2f9675 Namjae Jeon 2026-02-13  1216  		folio_put(folio);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1217  		up_write(&vol->lcnbmp_lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1218  		/* Allocate a cluster from the DATA_ZONE. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1219  		rl2 = ntfs_cluster_alloc(vol, rl[1].vcn, 1, lcn, DATA_ZONE,
115380f9a2f9675 Namjae Jeon 2026-02-13  1220  				true, false, false);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1221  		if (IS_ERR(rl2)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1222  			up_write(&mftbmp_ni->runlist.lock);
115380f9a2f9675 Namjae Jeon 2026-02-13  1223  			ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1224  					"Failed to allocate a cluster for the mft bitmap.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1225  			return PTR_ERR(rl2);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1226  		}
115380f9a2f9675 Namjae Jeon 2026-02-13  1227  		rl = ntfs_runlists_merge(&mftbmp_ni->runlist, rl2, 0, &new_rl_count);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1228  		if (IS_ERR(rl)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1229  			up_write(&mftbmp_ni->runlist.lock);
115380f9a2f9675 Namjae Jeon 2026-02-13  1230  			ntfs_error(vol->sb, "Failed to merge runlists for mft bitmap.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1231  			if (ntfs_cluster_free_from_rl(vol, rl2)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1232  				ntfs_error(vol->sb, "Failed to deallocate allocated cluster.%s",
115380f9a2f9675 Namjae Jeon 2026-02-13  1233  						es);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1234  				NVolSetErrors(vol);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1235  			}
115380f9a2f9675 Namjae Jeon 2026-02-13  1236  			kvfree(rl2);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1237  			return PTR_ERR(rl);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1238  		}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1239  		mftbmp_ni->runlist.rl = rl;
115380f9a2f9675 Namjae Jeon 2026-02-13  1240  		mftbmp_ni->runlist.count = new_rl_count;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1241  		status.added_run = 1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1242  		ntfs_debug("Adding one run to mft bitmap.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1243  		/* Find the last run in the new runlist. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1244  		for (; rl[1].length; rl++)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1245  			;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1246  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1247  	/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1248  	 * Update the attribute record as well.  Note: @rl is the last
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1249  	 * (non-terminator) runlist element of mft bitmap.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1250  	 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1251  	mrec = map_mft_record(mft_ni);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1252  	if (IS_ERR(mrec)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1253  		ntfs_error(vol->sb, "Failed to map mft record.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1254  		ret = PTR_ERR(mrec);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1255  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1256  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1257  	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1258  	if (unlikely(!ctx)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1259  		ntfs_error(vol->sb, "Failed to get search context.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1260  		ret = -ENOMEM;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1261  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1262  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1263  	ret = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1264  			mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn, NULL,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1265  			0, ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1266  	if (unlikely(ret)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1267  		ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1268  			"Failed to find last attribute extent of mft bitmap attribute.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1269  		if (ret == -ENOENT)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1270  			ret = -EIO;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1271  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1272  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1273  	a = ctx->attr;
115380f9a2f9675 Namjae Jeon 2026-02-13  1274  	ll = le64_to_cpu(a->data.non_resident.lowest_vcn);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1275  	/* Search back for the previous last allocated cluster of mft bitmap. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1276  	for (rl2 = rl; rl2 > mftbmp_ni->runlist.rl; rl2--) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1277  		if (ll >= rl2->vcn)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1278  			break;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1279  	}
115380f9a2f9675 Namjae Jeon 2026-02-13  1280  	WARN_ON(ll < rl2->vcn);
115380f9a2f9675 Namjae Jeon 2026-02-13  1281  	WARN_ON(ll >= rl2->vcn + rl2->length);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1282  	/* Get the size for the new mapping pairs array for this extent. */
115380f9a2f9675 Namjae Jeon 2026-02-13  1283  	mp_size = ntfs_get_size_for_mapping_pairs(vol, rl2, ll, -1, -1);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1284  	if (unlikely(mp_size <= 0)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1285  		ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1286  			"Get size for mapping pairs failed for mft bitmap attribute extent.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1287  		ret = mp_size;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1288  		if (!ret)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1289  			ret = -EIO;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1290  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1291  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1292  	/* Expand the attribute record if necessary. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1293  	old_alen = le32_to_cpu(a->length);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1294  	ret = ntfs_attr_record_resize(ctx->mrec, a, mp_size +
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1295  			le16_to_cpu(a->data.non_resident.mapping_pairs_offset));
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1296  	if (unlikely(ret)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1297  		ret = ntfs_mft_attr_extend(mftbmp_ni);
115380f9a2f9675 Namjae Jeon 2026-02-13  1298  		if (!ret)
115380f9a2f9675 Namjae Jeon 2026-02-13  1299  			goto extended_ok;
115380f9a2f9675 Namjae Jeon 2026-02-13  1300  		if (ret != -EAGAIN)
115380f9a2f9675 Namjae Jeon 2026-02-13  1301  			status.mp_extended = 1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1302  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1303  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1304  	status.mp_rebuilt = 1;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1305  	/* Generate the mapping pairs array directly into the attr record. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1306  	ret = ntfs_mapping_pairs_build(vol, (u8 *)a +
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1307  			le16_to_cpu(a->data.non_resident.mapping_pairs_offset),
115380f9a2f9675 Namjae Jeon 2026-02-13  1308  			mp_size, rl2, ll, -1, NULL, NULL, NULL);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1309  	if (unlikely(ret)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1310  		ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1311  			"Failed to build mapping pairs array for mft bitmap attribute.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1312  		goto undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1313  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1314  	/* Update the highest_vcn. */
115380f9a2f9675 Namjae Jeon 2026-02-13  1315  	a->data.non_resident.highest_vcn = cpu_to_le64(rl[1].vcn - 1);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1316  	/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1317  	 * We now have extended the mft bitmap allocated_size by one cluster.
115380f9a2f9675 Namjae Jeon 2026-02-13  1318  	 * Reflect this in the struct ntfs_inode structure and the attribute record.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1319  	 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1320  	if (a->data.non_resident.lowest_vcn) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1321  		/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1322  		 * We are not in the first attribute extent, switch to it, but
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1323  		 * first ensure the changes will make it to disk later.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1324  		 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1325  		mark_mft_record_dirty(ctx->ntfs_ino);
115380f9a2f9675 Namjae Jeon 2026-02-13  1326  extended_ok:
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1327  		ntfs_attr_reinit_search_ctx(ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1328  		ret = ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1329  				mftbmp_ni->name_len, CASE_SENSITIVE, 0, NULL,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1330  				0, ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1331  		if (unlikely(ret)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1332  			ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1333  				"Failed to find first attribute extent of mft bitmap attribute.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1334  			goto restore_undo_alloc;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1335  		}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1336  		a = ctx->attr;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1337  	}
115380f9a2f9675 Namjae Jeon 2026-02-13  1338  
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1339  	write_lock_irqsave(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1340  	mftbmp_ni->allocated_size += vol->cluster_size;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1341  	a->data.non_resident.allocated_size =
115380f9a2f9675 Namjae Jeon 2026-02-13  1342  			cpu_to_le64(mftbmp_ni->allocated_size);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1343  	write_unlock_irqrestore(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1344  	/* Ensure the changes make it to disk. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1345  	mark_mft_record_dirty(ctx->ntfs_ino);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1346  	ntfs_attr_put_search_ctx(ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1347  	unmap_mft_record(mft_ni);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1348  	up_write(&mftbmp_ni->runlist.lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1349  	ntfs_debug("Done.");
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1350  	return 0;
115380f9a2f9675 Namjae Jeon 2026-02-13  1351  
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1352  restore_undo_alloc:
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1353  	ntfs_attr_reinit_search_ctx(ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1354  	if (ntfs_attr_lookup(mftbmp_ni->type, mftbmp_ni->name,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1355  			mftbmp_ni->name_len, CASE_SENSITIVE, rl[1].vcn, NULL,
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1356  			0, ctx)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1357  		ntfs_error(vol->sb,
115380f9a2f9675 Namjae Jeon 2026-02-13  1358  			"Failed to find last attribute extent of mft bitmap attribute.%s", es);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1359  		write_lock_irqsave(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1360  		mftbmp_ni->allocated_size += vol->cluster_size;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1361  		write_unlock_irqrestore(&mftbmp_ni->size_lock, flags);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1362  		ntfs_attr_put_search_ctx(ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1363  		unmap_mft_record(mft_ni);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1364  		up_write(&mftbmp_ni->runlist.lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1365  		/*
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1366  		 * The only thing that is now wrong is ->allocated_size of the
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1367  		 * base attribute extent which chkdsk should be able to fix.
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1368  		 */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1369  		NVolSetErrors(vol);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1370  		return ret;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1371  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1372  	a = ctx->attr;
115380f9a2f9675 Namjae Jeon 2026-02-13  1373  	a->data.non_resident.highest_vcn = cpu_to_le64(rl[1].vcn - 2);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1374  undo_alloc:
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1375  	if (status.added_cluster) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1376  		/* Truncate the last run in the runlist by one cluster. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1377  		rl->length--;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1378  		rl[1].vcn--;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1379  	} else if (status.added_run) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1380  		lcn = rl->lcn;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1381  		/* Remove the last run from the runlist. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1382  		rl->lcn = rl[1].lcn;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1383  		rl->length = 0;
115380f9a2f9675 Namjae Jeon 2026-02-13  1384  		mftbmp_ni->runlist.count--;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1385  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1386  	/* Deallocate the cluster. */
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1387  	down_write(&vol->lcnbmp_lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1388  	if (ntfs_bitmap_clear_bit(vol->lcnbmp_ino, lcn)) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1389  		ntfs_error(vol->sb, "Failed to free allocated cluster.%s", es);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1390  		NVolSetErrors(vol);
115380f9a2f9675 Namjae Jeon 2026-02-13  1391  	} else
115380f9a2f9675 Namjae Jeon 2026-02-13  1392  		ntfs_inc_free_clusters(vol, 1);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1393  	up_write(&vol->lcnbmp_lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1394  	if (status.mp_rebuilt) {
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1395  		if (ntfs_mapping_pairs_build(vol, (u8 *)a + le16_to_cpu(
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1396  				a->data.non_resident.mapping_pairs_offset),
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1397  				old_alen - le16_to_cpu(
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1398  				a->data.non_resident.mapping_pairs_offset),
115380f9a2f9675 Namjae Jeon 2026-02-13  1399  				rl2, ll, -1, NULL, NULL, NULL)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1400  			ntfs_error(vol->sb, "Failed to restore mapping pairs array.%s", es);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1401  			NVolSetErrors(vol);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1402  		}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1403  		if (ntfs_attr_record_resize(ctx->mrec, a, old_alen)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1404  			ntfs_error(vol->sb, "Failed to restore attribute record.%s", es);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1405  			NVolSetErrors(vol);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1406  		}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1407  		mark_mft_record_dirty(ctx->ntfs_ino);
115380f9a2f9675 Namjae Jeon 2026-02-13  1408  	} else if (status.mp_extended && ntfs_attr_update_mapping_pairs(mftbmp_ni, 0)) {
115380f9a2f9675 Namjae Jeon 2026-02-13  1409  		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s", es);
115380f9a2f9675 Namjae Jeon 2026-02-13  1410  		NVolSetErrors(vol);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1411  	}
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1412  	if (ctx)
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1413  		ntfs_attr_put_search_ctx(ctx);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1414  	if (!IS_ERR(mrec))
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1415  		unmap_mft_record(mft_ni);
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1416  	up_write(&mftbmp_ni->runlist.lock);
1e9ea7e04472d4e Namjae Jeon 2025-12-30 @1417  	return ret;
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1418  }
1e9ea7e04472d4e Namjae Jeon 2025-12-30  1419  

:::::: The code at line 1417 was first introduced by commit
:::::: 1e9ea7e04472d4e5e12e58c881eaacfb3e49b669 Revert "fs: Remove NTFS classic"

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
