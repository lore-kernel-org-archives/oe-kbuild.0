Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A19216395
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741025150; cv=none; b=gNdDKgi8Sg5GzjMXp0zd42MLFh6N0FIy1WNWpUk74gcQOaS/LHc5bhmuc+BpQTVuUu5xyrtx0ziHQ8aUpg5LWAr+kPTIOY1oiWOM0wFwMX19tORme6h2/DzZBRpNVP2qT7Aiptq0lSsCw/k1RBuYNvltKHZXS56a0XG1XQeL81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741025150; c=relaxed/simple;
	bh=P6T3h0dkRBujn50U4LDwFuUDHrnBeQrjTZmkZJ9C9EI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OC7ptQGFefcJpbd7acIKmLjFHczF0Yp73GmdjRZYMtBDb6hcZhqHlESlz+AhiRSMdbD81Aj4HN2Ju3DLLlGdKWRbQiVy7qwYyqE6QsLI7tOeRpAkBzgklft6Waj8EnemKCql7LoMxCGSWbpfuLi2cJo5be9pe96A7cBQHSuVWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V65UkssI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V65UkssI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741025149; x=1772561149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6T3h0dkRBujn50U4LDwFuUDHrnBeQrjTZmkZJ9C9EI=;
  b=V65UkssIieE2s6tvsaumado7uY3AHNNdgEWLJxsohWblvZN8e1pjXb+C
   QltgBvxivVnK0Ji/IuEUJcF9BnvZod5VqqsKiMDkWVH2EUuYDDO7oj8fO
   5J/OqDWv0Z8jUK8JcwDqLz/0dteLv3sqE3pZMDGYkXyGrZNcypD4Qh55t
   uZXHY6Yh2XOkKYyfNa5ChVdq/R7AE/obNHdAc4bcYs0LtJyJ89ko3rLDR
   Fnz1kewcy3fMx+WkURbweruOPg7miWUaDUJO0J9oge41trnuXYLBhScXn
   +jeL9WylbhSRBBKIqbR3fP5HZb00DuyD5cTsugc7jNZL0jLMRhCXKM0T8
   w==;
X-CSE-ConnectionGUID: M16VBipMS8GXdNFvmvGTDw==
X-CSE-MsgGUID: SFHYT711TlOggTiPwUAb5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59326539"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="59326539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 10:05:48 -0800
X-CSE-ConnectionGUID: EvWxhUOXRuSFr6kE8jRbbw==
X-CSE-MsgGUID: TAcFkiXgTMqtyE2Pbxzaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="141338518"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Mar 2025 10:05:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpAAi-000InO-0Z;
	Mon, 03 Mar 2025 18:05:44 +0000
Date: Tue, 4 Mar 2025 02:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7224/7423] fs/btrfs/extent_io.c:1125
 can_skip_one_ordered_range() error: 'folio' dereferencing possible ERR_PTR()
Message-ID: <202503040153.la3WrwKZ-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 343a7c425f5ffba8fa977602f33d5a90a771e099 [7224/7423] Merge branch 'vfs.all' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250303 (https://download.01.org/0day-ci/archive/20250304/202503040153.la3WrwKZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503040153.la3WrwKZ-lkp@intel.com/

smatch warnings:
fs/btrfs/extent_io.c:1125 can_skip_one_ordered_range() error: 'folio' dereferencing possible ERR_PTR()

vim +/folio +1125 fs/btrfs/extent_io.c

d1310b2e0cd98e Chris Mason 2008-01-24  1074  
f47168d051203f Qu Wenruo   2025-02-12  1075  /*
f47168d051203f Qu Wenruo   2025-02-12  1076   * Check if we can skip waiting the @ordered extent covering the block
f47168d051203f Qu Wenruo   2025-02-12  1077   * at file pos @cur.
f47168d051203f Qu Wenruo   2025-02-12  1078   *
f47168d051203f Qu Wenruo   2025-02-12  1079   * Return true if we can skip to @next_ret. The caller needs to check
f47168d051203f Qu Wenruo   2025-02-12  1080   * the @next_ret value to make sure if covers the full range, before
f47168d051203f Qu Wenruo   2025-02-12  1081   * skipping the OE.
f47168d051203f Qu Wenruo   2025-02-12  1082   *
f47168d051203f Qu Wenruo   2025-02-12  1083   * Return false if we must wait for the ordered extent.
f47168d051203f Qu Wenruo   2025-02-12  1084   *
f47168d051203f Qu Wenruo   2025-02-12  1085   * @cur:	The start file offset that we have locked folio for read.
f47168d051203f Qu Wenruo   2025-02-12  1086   * @next_ret:	If we return true, this indiciates the next check start
f47168d051203f Qu Wenruo   2025-02-12  1087   *		range.
f47168d051203f Qu Wenruo   2025-02-12  1088   */
f47168d051203f Qu Wenruo   2025-02-12  1089  static bool can_skip_one_ordered_range(struct btrfs_inode *binode,
f47168d051203f Qu Wenruo   2025-02-12  1090  				       struct btrfs_ordered_extent *ordered,
f47168d051203f Qu Wenruo   2025-02-12  1091  				       u64 cur, u64 *next_ret)
f47168d051203f Qu Wenruo   2025-02-12  1092  {
f47168d051203f Qu Wenruo   2025-02-12  1093  	const struct btrfs_fs_info *fs_info = binode->root->fs_info;
f47168d051203f Qu Wenruo   2025-02-12  1094  	struct folio *folio;
f47168d051203f Qu Wenruo   2025-02-12  1095  	const u32 blocksize = fs_info->sectorsize;
f47168d051203f Qu Wenruo   2025-02-12  1096  	u64 range_len;
f47168d051203f Qu Wenruo   2025-02-12  1097  	bool ret;
f47168d051203f Qu Wenruo   2025-02-12  1098  
f47168d051203f Qu Wenruo   2025-02-12  1099  	folio = filemap_get_folio(binode->vfs_inode.i_mapping,
f47168d051203f Qu Wenruo   2025-02-12  1100  				  cur >> PAGE_SHIFT);
f47168d051203f Qu Wenruo   2025-02-12  1101  
f47168d051203f Qu Wenruo   2025-02-12  1102  	/*
f47168d051203f Qu Wenruo   2025-02-12  1103  	 * We should have locked the folio(s) for range [start, end], thus
f47168d051203f Qu Wenruo   2025-02-12  1104  	 * there must be a folio and it must be locked.
f47168d051203f Qu Wenruo   2025-02-12  1105  	 */
f47168d051203f Qu Wenruo   2025-02-12  1106  	ASSERT(!IS_ERR(folio));
f47168d051203f Qu Wenruo   2025-02-12  1107  	ASSERT(folio_test_locked(folio));
f47168d051203f Qu Wenruo   2025-02-12  1108  
f47168d051203f Qu Wenruo   2025-02-12  1109  	/*
f47168d051203f Qu Wenruo   2025-02-12  1110  	 * We several cases for the folio and OE combination:
f47168d051203f Qu Wenruo   2025-02-12  1111  	 *
f47168d051203f Qu Wenruo   2025-02-12  1112  	 * 0) Folio has no private flag
f47168d051203f Qu Wenruo   2025-02-12  1113  	 *    The OE has all its IO done but not yet finished, and folio got
f47168d051203f Qu Wenruo   2025-02-12  1114  	 *    invalidated. Or direct IO.
f47168d051203f Qu Wenruo   2025-02-12  1115  	 *
f47168d051203f Qu Wenruo   2025-02-12  1116  	 * Have to wait for the OE to finish, as it may contain the
f47168d051203f Qu Wenruo   2025-02-12  1117  	 * to-be-inserted data checksum.
f47168d051203f Qu Wenruo   2025-02-12  1118  	 * Without the data checksum inserted into csum tree, read
f47168d051203f Qu Wenruo   2025-02-12  1119  	 * will just fail with missing csum.
f47168d051203f Qu Wenruo   2025-02-12  1120  	 */
f47168d051203f Qu Wenruo   2025-02-12  1121  	if (!folio_test_private(folio)) {
f47168d051203f Qu Wenruo   2025-02-12  1122  		ret = false;
f47168d051203f Qu Wenruo   2025-02-12  1123  		goto out;
f47168d051203f Qu Wenruo   2025-02-12  1124  	}
f47168d051203f Qu Wenruo   2025-02-12 @1125  	range_len = min(folio_pos(folio) + folio_size(folio),
f47168d051203f Qu Wenruo   2025-02-12  1126  			ordered->file_offset + ordered->num_bytes) - cur;
f47168d051203f Qu Wenruo   2025-02-12  1127  
f47168d051203f Qu Wenruo   2025-02-12  1128  	/*
f47168d051203f Qu Wenruo   2025-02-12  1129  	 * 1) The first block is DIRTY.
f47168d051203f Qu Wenruo   2025-02-12  1130  	 *
f47168d051203f Qu Wenruo   2025-02-12  1131  	 * This means the OE is created by some folio before us, but writeback
f47168d051203f Qu Wenruo   2025-02-12  1132  	 * has not started.
f47168d051203f Qu Wenruo   2025-02-12  1133  	 * We can and must skip the whole OE, because it will never start until
f47168d051203f Qu Wenruo   2025-02-12  1134  	 * we finished our folio read and unlocked the folio.
f47168d051203f Qu Wenruo   2025-02-12  1135  	 */
f47168d051203f Qu Wenruo   2025-02-12  1136  	if (btrfs_folio_test_dirty(fs_info, folio, cur, blocksize)) {
f47168d051203f Qu Wenruo   2025-02-12  1137  		ret = true;
f47168d051203f Qu Wenruo   2025-02-12  1138  		/*
f47168d051203f Qu Wenruo   2025-02-12  1139  		 * At least inside the folio, all the remaining blocks should
f47168d051203f Qu Wenruo   2025-02-12  1140  		 * also be dirty.
f47168d051203f Qu Wenruo   2025-02-12  1141  		 */
f47168d051203f Qu Wenruo   2025-02-12  1142  		ASSERT(btrfs_folio_test_dirty(fs_info, folio, cur, range_len));
f47168d051203f Qu Wenruo   2025-02-12  1143  		*next_ret = ordered->file_offset + ordered->num_bytes;
f47168d051203f Qu Wenruo   2025-02-12  1144  		goto out;
f47168d051203f Qu Wenruo   2025-02-12  1145  	}
f47168d051203f Qu Wenruo   2025-02-12  1146  
f47168d051203f Qu Wenruo   2025-02-12  1147  	/*
f47168d051203f Qu Wenruo   2025-02-12  1148  	 * 2) The first block is uptodate.
f47168d051203f Qu Wenruo   2025-02-12  1149  	 *
f47168d051203f Qu Wenruo   2025-02-12  1150  	 * At least the first block can be skipped, but we are still
f47168d051203f Qu Wenruo   2025-02-12  1151  	 * not full sure. E.g. if the OE has some other folios in
f47168d051203f Qu Wenruo   2025-02-12  1152  	 * the range that can not be skipped.
f47168d051203f Qu Wenruo   2025-02-12  1153  	 * So we return true and update @next_ret to the OE/folio boundary.
f47168d051203f Qu Wenruo   2025-02-12  1154  	 */
f47168d051203f Qu Wenruo   2025-02-12  1155  	if (btrfs_folio_test_uptodate(fs_info, folio, cur, blocksize)) {
f47168d051203f Qu Wenruo   2025-02-12  1156  		u64 range_len = min(folio_pos(folio) + folio_size(folio),
f47168d051203f Qu Wenruo   2025-02-12  1157  				    ordered->file_offset + ordered->num_bytes) - cur;
f47168d051203f Qu Wenruo   2025-02-12  1158  
f47168d051203f Qu Wenruo   2025-02-12  1159  		/*
f47168d051203f Qu Wenruo   2025-02-12  1160  		 * The whole range to the OE end or folio boundary should also
f47168d051203f Qu Wenruo   2025-02-12  1161  		 * be uptodate.
f47168d051203f Qu Wenruo   2025-02-12  1162  		 */
f47168d051203f Qu Wenruo   2025-02-12  1163  		ASSERT(btrfs_folio_test_uptodate(fs_info, folio, cur, range_len));
f47168d051203f Qu Wenruo   2025-02-12  1164  		ret = true;
f47168d051203f Qu Wenruo   2025-02-12  1165  		*next_ret = cur + range_len;
f47168d051203f Qu Wenruo   2025-02-12  1166  		goto out;
f47168d051203f Qu Wenruo   2025-02-12  1167  	}
f47168d051203f Qu Wenruo   2025-02-12  1168  
f47168d051203f Qu Wenruo   2025-02-12  1169  	/*
f47168d051203f Qu Wenruo   2025-02-12  1170  	 * 3) The first block is not uptodate.
f47168d051203f Qu Wenruo   2025-02-12  1171  	 *
f47168d051203f Qu Wenruo   2025-02-12  1172  	 * This means the folio is invalidated after the OE finished, or direct IO.
f47168d051203f Qu Wenruo   2025-02-12  1173  	 * Very much the same as case 1), just with private flag set.
f47168d051203f Qu Wenruo   2025-02-12  1174  	 */
f47168d051203f Qu Wenruo   2025-02-12  1175  	ret = false;
f47168d051203f Qu Wenruo   2025-02-12  1176  out:
f47168d051203f Qu Wenruo   2025-02-12  1177  	folio_put(folio);
f47168d051203f Qu Wenruo   2025-02-12  1178  	return ret;
f47168d051203f Qu Wenruo   2025-02-12  1179  }
f47168d051203f Qu Wenruo   2025-02-12  1180  

:::::: The code at line 1125 was first introduced by commit
:::::: f47168d051203f5f9020ee51ef8c90db89008fe0 btrfs: introduce a read path dedicated extent lock helper

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
