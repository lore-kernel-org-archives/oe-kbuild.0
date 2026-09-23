Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7545A29E
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 07:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149830; cv=none; b=NYG9efFGcidKx2kWEV8FKZY/734unk2mOTMV840CrFoxP4+1CmKUERjoX9Mj5APOEYRYxpvFC99mCAT6vHdB5WPNfZ6cnXw1qnLDNNRb89KvTz+W/4wry1ZZAHk6NQP4+VJQzJtJ8ZT50JEInXzvkkKWmxbOjyqVk1UPxS/y6qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149830; c=relaxed/simple;
	bh=07aAva4tvOpEFAT1uhpgmAWehN4ZOj1HI6KGunjQJOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c2r/DRg7FBiJ9BAeq4jMYvYMKiQh69bww2JH3zfcCNBEACMLlPa+lKKZzNSTz87Omh8gSSmVy+tIQpmLW4ckRTcS+hj06FWdcLmuCWsiHKG1MWMoPbFfplPZShAV8xXDNizCnI/jC1NuMy1JOQJfbbcmDDb9IZox0BW2Lmv8cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIQbp9mN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIQbp9mN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790149825; x=1821685825;
  h=date:from:to:cc:subject:message-id;
  bh=07aAva4tvOpEFAT1uhpgmAWehN4ZOj1HI6KGunjQJOg=;
  b=VIQbp9mNjhvCBgIf9bbG0ISnedTR0EYtV51Tq26JcZIQH42lYV0FXY7N
   oeqoj0lviW3jDOMPFus6UenVj3nl2KnzANVFhj6a1GA+H7oK/m3euOlHQ
   Ji87hJ9i98eY4mvhFcy/yrO7jMLKwy+8k7ff6I1t+i6NRuWuy6pSTpLAs
   H4khvvusAhbPOcq5jzGUx5vWwgePq7GCAFOUJTBafSan7IiGQc4iYeEfl
   VdRaOAQ01jgPaVuwJNyj2E+MnhihGaTLo0MZklwciczWW2q1SjxmJXzVc
   b54lcLAlw5AkOSsIVmxyC/9lUFLYBJbC/hAe34fkljUH52BjibRL6BKrd
   Q==;
X-CSE-ConnectionGUID: SBuYiSt8R8eLCdDPOD4GQg==
X-CSE-MsgGUID: rqVx8bzNTg+Qw+0VLVnITQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102175856"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="102175856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:50:24 -0700
X-CSE-ConnectionGUID: emAKTPOdSlai0B6bt3RaIA==
X-CSE-MsgGUID: OZyk6QJ6SmibdcZ7XDUAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272703400"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 00:50:23 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9HkD-000000000ZX-0UFd;
	Wed, 23 Sep 2026 07:50:21 +0000
Date: Wed, 23 Sep 2026 09:49:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 425/627] fs/btrfs/extent_io.c:1262
 can_skip_one_ordered_range() error: 'folio' dereferencing possible ERR_PTR()
Message-ID: <202609230931.jQfYVMCZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Zi Yan <ziy@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   fff9c87241bb46aa09ed3a91d6002cba966d7776
commit: bdc31ca0397d6bcfb19301b8a8ca56f822165bde [425/627] mm/page-flags: check page/folio->private instead of PG_private
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sparc64-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230931.jQfYVMCZ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 4b99afb361a8cfd45fc17aebc637688661e9e472)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230931.jQfYVMCZ-lkp@intel.com/

New smatch warnings:
fs/btrfs/extent_io.c:1262 can_skip_one_ordered_range() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/btrfs/extent_io.c:906 submit_extent_folio() error: we previously assumed 'bio_ctrl->bbio' could be null (see line 837)

vim +/folio +1262 fs/btrfs/extent_io.c

d1310b2e0cd98eb Chris Mason             2008-01-24  1216  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1217  /*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1218   * Check if we can skip waiting the @ordered extent covering the block at @fileoff.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1219   *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1220   * @fileoff:	Both input and output.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1221   *		Input as the file offset where the check should start at.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1222   *		Output as where the next check should start at,
d2da21a6e06c40b Qu Wenruo               2025-02-10  1223   *		if the function returns true.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1224   *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1225   * Return true if we can skip to @fileoff. The caller needs to check the new
d2da21a6e06c40b Qu Wenruo               2025-02-10  1226   * @fileoff value to make sure it covers the full range, before skipping the
d2da21a6e06c40b Qu Wenruo               2025-02-10  1227   * full OE.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1228   *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1229   * Return false if we must wait for the ordered extent.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1230   */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1231  static bool can_skip_one_ordered_range(struct btrfs_inode *inode,
d2da21a6e06c40b Qu Wenruo               2025-02-10  1232  				       struct btrfs_ordered_extent *ordered,
d2da21a6e06c40b Qu Wenruo               2025-02-10  1233  				       u64 *fileoff)
d2da21a6e06c40b Qu Wenruo               2025-02-10  1234  {
d2da21a6e06c40b Qu Wenruo               2025-02-10  1235  	const struct btrfs_fs_info *fs_info = inode->root->fs_info;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1236  	struct folio *folio;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1237  	const u32 blocksize = fs_info->sectorsize;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1238  	u64 cur = *fileoff;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1239  	bool ret;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1240  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1241  	folio = filemap_get_folio(inode->vfs_inode.i_mapping, cur >> PAGE_SHIFT);
d2da21a6e06c40b Qu Wenruo               2025-02-10  1242  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1243  	/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1244  	 * We should have locked the folio(s) for range [start, end], thus
d2da21a6e06c40b Qu Wenruo               2025-02-10  1245  	 * there must be a folio and it must be locked.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1246  	 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1247  	ASSERT(!IS_ERR(folio));
d2da21a6e06c40b Qu Wenruo               2025-02-10  1248  	ASSERT(folio_test_locked(folio));
d2da21a6e06c40b Qu Wenruo               2025-02-10  1249  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1250  	/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1251  	 * There are several cases for the folio and OE combination:
d2da21a6e06c40b Qu Wenruo               2025-02-10  1252  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1253  	 * 1) Folio has no private flag
d2da21a6e06c40b Qu Wenruo               2025-02-10  1254  	 *    The OE has all its IO done but not yet finished, and folio got
d2da21a6e06c40b Qu Wenruo               2025-02-10  1255  	 *    invalidated.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1256  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1257  	 * Have we have to wait for the OE to finish, as it may contain the
d2da21a6e06c40b Qu Wenruo               2025-02-10  1258  	 * to-be-inserted data checksum.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1259  	 * Without the data checksum inserted into the csum tree, read will
d2da21a6e06c40b Qu Wenruo               2025-02-10  1260  	 * just fail with missing csum.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1261  	 */
d2da21a6e06c40b Qu Wenruo               2025-02-10 @1262  	if (!folio_test_private(folio)) {
d2da21a6e06c40b Qu Wenruo               2025-02-10  1263  		ret = false;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1264  		goto out;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1265  	}
d2da21a6e06c40b Qu Wenruo               2025-02-10  1266  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1267  	/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1268  	 * 2) The first block is DIRTY.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1269  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1270  	 * This means the OE is created by some other folios whose file pos is
d2da21a6e06c40b Qu Wenruo               2025-02-10  1271  	 * before this one. And since we are holding the folio lock, the writeback
d2da21a6e06c40b Qu Wenruo               2025-02-10  1272  	 * of this folio cannot start.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1273  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1274  	 * We must skip the whole OE, because it will never start until we
d2da21a6e06c40b Qu Wenruo               2025-02-10  1275  	 * finished our folio read and unlocked the folio.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1276  	 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1277  	if (btrfs_folio_test_dirty(fs_info, folio, cur, blocksize)) {
48f3784b17d9145 Matthew Wilcox (Oracle  2025-10-24  1278) 		u64 range_len = umin(folio_next_pos(folio),
d2da21a6e06c40b Qu Wenruo               2025-02-10  1279  				    ordered->file_offset + ordered->num_bytes) - cur;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1280  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1281  		ret = true;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1282  		/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1283  		 * At least inside the folio, all the remaining blocks should
d2da21a6e06c40b Qu Wenruo               2025-02-10  1284  		 * also be dirty.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1285  		 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1286  		ASSERT(btrfs_folio_test_dirty(fs_info, folio, cur, range_len));
d2da21a6e06c40b Qu Wenruo               2025-02-10  1287  		*fileoff = ordered->file_offset + ordered->num_bytes;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1288  		goto out;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1289  	}
d2da21a6e06c40b Qu Wenruo               2025-02-10  1290  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1291  	/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1292  	 * 3) The first block is uptodate.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1293  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1294  	 * At least the first block can be skipped, but we are still not fully
d2da21a6e06c40b Qu Wenruo               2025-02-10  1295  	 * sure. E.g. if the OE has some other folios in the range that cannot
d2da21a6e06c40b Qu Wenruo               2025-02-10  1296  	 * be skipped.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1297  	 * So we return true and update @next_ret to the OE/folio boundary.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1298  	 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1299  	if (btrfs_folio_test_uptodate(fs_info, folio, cur, blocksize)) {
48f3784b17d9145 Matthew Wilcox (Oracle  2025-10-24  1300) 		u64 range_len = umin(folio_next_pos(folio),
d2da21a6e06c40b Qu Wenruo               2025-02-10  1301  				    ordered->file_offset + ordered->num_bytes) - cur;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1302  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1303  		/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1304  		 * The whole range to the OE end or folio boundary should also
d2da21a6e06c40b Qu Wenruo               2025-02-10  1305  		 * be uptodate.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1306  		 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1307  		ASSERT(btrfs_folio_test_uptodate(fs_info, folio, cur, range_len));
d2da21a6e06c40b Qu Wenruo               2025-02-10  1308  		ret = true;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1309  		*fileoff = cur + range_len;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1310  		goto out;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1311  	}
d2da21a6e06c40b Qu Wenruo               2025-02-10  1312  
d2da21a6e06c40b Qu Wenruo               2025-02-10  1313  	/*
d2da21a6e06c40b Qu Wenruo               2025-02-10  1314  	 * 4) The first block is not uptodate.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1315  	 *
d2da21a6e06c40b Qu Wenruo               2025-02-10  1316  	 * This means the folio is invalidated after the writeback was finished,
d2da21a6e06c40b Qu Wenruo               2025-02-10  1317  	 * but by some other operations (e.g. block aligned buffered write) the
d2da21a6e06c40b Qu Wenruo               2025-02-10  1318  	 * folio is inserted into filemap.
d2da21a6e06c40b Qu Wenruo               2025-02-10  1319  	 * Very much the same as case 1).
d2da21a6e06c40b Qu Wenruo               2025-02-10  1320  	 */
d2da21a6e06c40b Qu Wenruo               2025-02-10  1321  	ret = false;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1322  out:
d2da21a6e06c40b Qu Wenruo               2025-02-10  1323  	folio_put(folio);
d2da21a6e06c40b Qu Wenruo               2025-02-10  1324  	return ret;
d2da21a6e06c40b Qu Wenruo               2025-02-10  1325  }
d2da21a6e06c40b Qu Wenruo               2025-02-10  1326  

:::::: The code at line 1262 was first introduced by commit
:::::: d2da21a6e06c40b9fd380ada93f1b48279e48b16 btrfs: introduce a read path dedicated extent lock helper

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
