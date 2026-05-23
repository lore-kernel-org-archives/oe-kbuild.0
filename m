Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20E24A078
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779551238; cv=none; b=CBnmLKlsUFjcPydoc+mxpaU7tZOBw/XNxZ1ng02trHGITTfua1ZiF18MwYd0H8NJe++VY+d/wdIOa2Gby8mbOxMxrJPPijKdSOuAWpII1Vp40pgKgEIowAdLI+iDp1e7nFUiH7gUDalQYjXgessk8TRoOqSGf0NyQnnCo7NPN5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779551238; c=relaxed/simple;
	bh=p6pDE+zBId/V7I4ExhGnsW9D/CojVEHje77jKJmKKYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TtrX6rubyB6qy5UO+GtBJAvNdSBdiOGaEZQfLnbhRHjn3C6WYrxX1ELgxEN+bxkvoufDKyn2QmDlHUjlYtM8iHs0qmYgXy5jbd8EhOcxmBND3Lz6inegQQIlc/qfyXy7g62WrWSSgFc6E56YjwoFpanjcYmJewtxy/Bpi7XIttE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQnh+4VR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQnh+4VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779551236; x=1811087236;
  h=date:from:to:cc:subject:message-id;
  bh=p6pDE+zBId/V7I4ExhGnsW9D/CojVEHje77jKJmKKYo=;
  b=DQnh+4VR/haaB414XDZGVQ+k1/46N94BIrveO3ATAXRjMvGlpPM1YRbi
   EjnvGzTjMmC5at9E8EOeHwmT5VRNzYrf4ntPG8EcLMFcVFJQBgsb+5J3M
   n+9t+DsapIc2ISJ0b8Fuc+wWLunWmTEVVlBPhPZuJ8x6da6DBdsFd+Cuf
   fZdnYaUEm3GBJAOi3tsm/HRDH5iX/1+3FYWoLB1bwDnVeyKJQhHHWa5qh
   vnhZjtyuTgl8KucNTsc7L5PcWZjuCsAvCLRWj+YN+pNt5sPbXlxPpU1Ud
   LyLJph0h8z6hwLqSJKSGk8h5pJ4rBL+DiWuvF/qLZOK0o9jTZGqLKMn8L
   g==;
X-CSE-ConnectionGUID: bsSBaQPEQK2je7+AVU624A==
X-CSE-MsgGUID: vmyW0ZRNSXG25kxxvPHYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103125558"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="103125558"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 08:47:16 -0700
X-CSE-ConnectionGUID: GpP3NBc7TpCHbJQz/TEkEw==
X-CSE-MsgGUID: fyho8qofTUGDDNqUsPPNlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="271515540"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 May 2026 08:47:14 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQoZD-00000000061-3HoZ;
	Sat, 23 May 2026 15:47:11 +0000
Date: Sat, 23 May 2026 23:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave:for-7.0-rc6 58/199] fs/btrfs/disk-io.c:2214
 btrfs_read_roots() warn: missing unwind goto?
Message-ID: <202605232329.tb97mJWX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Harmstone <mark@harmstone.com>
CC: David Sterba <dsterba@suse.com>
CC: Boris Burkov <boris@bur.io>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-7.0-rc6
head:   316fb1b3169efb081d2db910cbbfef445afa03b9
commit: 8620da16fb6be1fd9906374fa1c763a10c6918df [58/199] btrfs: allow mounting filesystems with remap-tree incompat flag
:::::: branch date: 8 weeks ago
:::::: commit date: 4 months ago
config: mips-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232329.tb97mJWX-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605232329.tb97mJWX-lkp@intel.com/

New smatch warnings:
fs/btrfs/disk-io.c:2214 btrfs_read_roots() warn: missing unwind goto?

Old smatch warnings:
fs/btrfs/disk-io.c:2317 validate_sys_chunk_array() warn: missing unwind goto?

vim +2214 fs/btrfs/disk-io.c

abed4aaae4f71a Josef Bacik        2021-11-05  2151  
abed4aaae4f71a Josef Bacik        2021-11-05  2152  static int btrfs_read_roots(struct btrfs_fs_info *fs_info)
abed4aaae4f71a Josef Bacik        2021-11-05  2153  {
abed4aaae4f71a Josef Bacik        2021-11-05  2154  	struct btrfs_root *tree_root = fs_info->tree_root;
abed4aaae4f71a Josef Bacik        2021-11-05  2155  	struct btrfs_root *root;
abed4aaae4f71a Josef Bacik        2021-11-05  2156  	struct btrfs_key location;
abed4aaae4f71a Josef Bacik        2021-11-05  2157  	int ret;
abed4aaae4f71a Josef Bacik        2021-11-05  2158  
2467d0fead7718 David Sterba       2024-01-24  2159  	ASSERT(fs_info->tree_root);
abed4aaae4f71a Josef Bacik        2021-11-05  2160  
abed4aaae4f71a Josef Bacik        2021-11-05  2161  	ret = load_global_roots(tree_root);
abed4aaae4f71a Josef Bacik        2021-11-05  2162  	if (ret)
abed4aaae4f71a Josef Bacik        2021-11-05  2163  		return ret;
abed4aaae4f71a Josef Bacik        2021-11-05  2164  
abed4aaae4f71a Josef Bacik        2021-11-05  2165  	location.type = BTRFS_ROOT_ITEM_KEY;
abed4aaae4f71a Josef Bacik        2021-11-05  2166  	location.offset = 0;
abed4aaae4f71a Josef Bacik        2021-11-05  2167  
1c56ab991903dc Qu Wenruo          2022-08-09  2168  	if (btrfs_fs_compat_ro(fs_info, BLOCK_GROUP_TREE)) {
14033b08a02916 Qu Wenruo          2022-08-09  2169  		location.objectid = BTRFS_BLOCK_GROUP_TREE_OBJECTID;
14033b08a02916 Qu Wenruo          2022-08-09  2170  		root = btrfs_read_tree_root(tree_root, &location);
14033b08a02916 Qu Wenruo          2022-08-09  2171  		if (IS_ERR(root)) {
14033b08a02916 Qu Wenruo          2022-08-09  2172  			if (!btrfs_test_opt(fs_info, IGNOREBADROOTS)) {
14033b08a02916 Qu Wenruo          2022-08-09  2173  				ret = PTR_ERR(root);
14033b08a02916 Qu Wenruo          2022-08-09  2174  				goto out;
14033b08a02916 Qu Wenruo          2022-08-09  2175  			}
14033b08a02916 Qu Wenruo          2022-08-09  2176  		} else {
14033b08a02916 Qu Wenruo          2022-08-09  2177  			set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
14033b08a02916 Qu Wenruo          2022-08-09  2178  			fs_info->block_group_root = root;
14033b08a02916 Qu Wenruo          2022-08-09  2179  		}
14033b08a02916 Qu Wenruo          2022-08-09  2180  	}
14033b08a02916 Qu Wenruo          2022-08-09  2181  
14033b08a02916 Qu Wenruo          2022-08-09  2182  	location.objectid = BTRFS_DEV_TREE_OBJECTID;
a4f3d2c4efe262 David Sterba       2015-02-16  2183  	root = btrfs_read_tree_root(tree_root, &location);
f50f43539070c6 Liu Bo             2018-03-29  2184  	if (IS_ERR(root)) {
42437a6386ffea Josef Bacik        2020-10-16  2185  		if (!btrfs_test_opt(fs_info, IGNOREBADROOTS)) {
f50f43539070c6 Liu Bo             2018-03-29  2186  			ret = PTR_ERR(root);
f50f43539070c6 Liu Bo             2018-03-29  2187  			goto out;
f50f43539070c6 Liu Bo             2018-03-29  2188  		}
42437a6386ffea Josef Bacik        2020-10-16  2189  	} else {
a4f3d2c4efe262 David Sterba       2015-02-16  2190  		set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
a4f3d2c4efe262 David Sterba       2015-02-16  2191  		fs_info->dev_root = root;
42437a6386ffea Josef Bacik        2020-10-16  2192  	}
820a49dafc3304 Josef Bacik        2021-03-11  2193  	/* Initialize fs_info for all devices in any case */
a8d1b1647bf824 Johannes Thumshirn 2022-11-04  2194  	ret = btrfs_init_devices_late(fs_info);
a8d1b1647bf824 Johannes Thumshirn 2022-11-04  2195  	if (ret)
a8d1b1647bf824 Johannes Thumshirn 2022-11-04  2196  		goto out;
4bbcaa648d2347 Eric Sandeen       2014-08-01  2197  
8620da16fb6be1 Mark Harmstone     2026-01-07  2198  	if (btrfs_fs_incompat(fs_info, REMAP_TREE)) {
8620da16fb6be1 Mark Harmstone     2026-01-07  2199  		/* The remap_root has already been loaded in load_important_roots(). */
8620da16fb6be1 Mark Harmstone     2026-01-07  2200  		root = fs_info->remap_root;
8620da16fb6be1 Mark Harmstone     2026-01-07  2201  
8620da16fb6be1 Mark Harmstone     2026-01-07  2202  		set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
8620da16fb6be1 Mark Harmstone     2026-01-07  2203  
8620da16fb6be1 Mark Harmstone     2026-01-07  2204  		root->root_key.objectid = BTRFS_REMAP_TREE_OBJECTID;
8620da16fb6be1 Mark Harmstone     2026-01-07  2205  		root->root_key.type = BTRFS_ROOT_ITEM_KEY;
8620da16fb6be1 Mark Harmstone     2026-01-07  2206  		root->root_key.offset = 0;
8620da16fb6be1 Mark Harmstone     2026-01-07  2207  
8620da16fb6be1 Mark Harmstone     2026-01-07  2208  		/* Check that data reloc tree doesn't also exist. */
8620da16fb6be1 Mark Harmstone     2026-01-07  2209  		location.objectid = BTRFS_DATA_RELOC_TREE_OBJECTID;
8620da16fb6be1 Mark Harmstone     2026-01-07  2210  		root = btrfs_read_tree_root(fs_info->tree_root, &location);
8620da16fb6be1 Mark Harmstone     2026-01-07  2211  		if (!IS_ERR(root)) {
8620da16fb6be1 Mark Harmstone     2026-01-07  2212  			btrfs_err(fs_info, "data reloc tree exists when remap-tree enabled");
8620da16fb6be1 Mark Harmstone     2026-01-07  2213  			btrfs_put_root(root);
8620da16fb6be1 Mark Harmstone     2026-01-07 @2214  			return -EIO;
8620da16fb6be1 Mark Harmstone     2026-01-07  2215  		} else if (PTR_ERR(root) != -ENOENT) {
8620da16fb6be1 Mark Harmstone     2026-01-07  2216  			btrfs_warn(fs_info, "error %ld when checking for data reloc tree",
8620da16fb6be1 Mark Harmstone     2026-01-07  2217  				   PTR_ERR(root));
8620da16fb6be1 Mark Harmstone     2026-01-07  2218  		}
8620da16fb6be1 Mark Harmstone     2026-01-07  2219  	} else {
aeb935a455812e Qu Wenruo          2020-05-15  2220  		/*
8620da16fb6be1 Mark Harmstone     2026-01-07  2221  		 * This tree can share blocks with some other fs tree during
8620da16fb6be1 Mark Harmstone     2026-01-07  2222  		 * relocation and we need a proper setup by btrfs_get_fs_root().
aeb935a455812e Qu Wenruo          2020-05-15  2223  		 */
56e9357a1e8167 David Sterba       2020-05-15  2224  		root = btrfs_get_fs_root(tree_root->fs_info,
56e9357a1e8167 David Sterba       2020-05-15  2225  					 BTRFS_DATA_RELOC_TREE_OBJECTID, true);
aeb935a455812e Qu Wenruo          2020-05-15  2226  		if (IS_ERR(root)) {
42437a6386ffea Josef Bacik        2020-10-16  2227  			if (!btrfs_test_opt(fs_info, IGNOREBADROOTS)) {
2bb83bc42be628 Mark Harmstone     2025-12-19  2228  				location.objectid = BTRFS_DATA_RELOC_TREE_OBJECTID;
aeb935a455812e Qu Wenruo          2020-05-15  2229  				ret = PTR_ERR(root);
aeb935a455812e Qu Wenruo          2020-05-15  2230  				goto out;
aeb935a455812e Qu Wenruo          2020-05-15  2231  			}
42437a6386ffea Josef Bacik        2020-10-16  2232  		} else {
aeb935a455812e Qu Wenruo          2020-05-15  2233  			set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
aeb935a455812e Qu Wenruo          2020-05-15  2234  			fs_info->data_reloc_root = root;
42437a6386ffea Josef Bacik        2020-10-16  2235  		}
8620da16fb6be1 Mark Harmstone     2026-01-07  2236  	}
aeb935a455812e Qu Wenruo          2020-05-15  2237  
4bbcaa648d2347 Eric Sandeen       2014-08-01  2238  	location.objectid = BTRFS_QUOTA_TREE_OBJECTID;
a4f3d2c4efe262 David Sterba       2015-02-16  2239  	root = btrfs_read_tree_root(tree_root, &location);
a4f3d2c4efe262 David Sterba       2015-02-16  2240  	if (!IS_ERR(root)) {
a4f3d2c4efe262 David Sterba       2015-02-16  2241  		set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
a4f3d2c4efe262 David Sterba       2015-02-16  2242  		fs_info->quota_root = root;
4bbcaa648d2347 Eric Sandeen       2014-08-01  2243  	}
4bbcaa648d2347 Eric Sandeen       2014-08-01  2244  
4bbcaa648d2347 Eric Sandeen       2014-08-01  2245  	location.objectid = BTRFS_UUID_TREE_OBJECTID;
a4f3d2c4efe262 David Sterba       2015-02-16  2246  	root = btrfs_read_tree_root(tree_root, &location);
a4f3d2c4efe262 David Sterba       2015-02-16  2247  	if (IS_ERR(root)) {
42437a6386ffea Josef Bacik        2020-10-16  2248  		if (!btrfs_test_opt(fs_info, IGNOREBADROOTS)) {
a4f3d2c4efe262 David Sterba       2015-02-16  2249  			ret = PTR_ERR(root);
4bbcaa648d2347 Eric Sandeen       2014-08-01  2250  			if (ret != -ENOENT)
f50f43539070c6 Liu Bo             2018-03-29  2251  				goto out;
42437a6386ffea Josef Bacik        2020-10-16  2252  		}
4bbcaa648d2347 Eric Sandeen       2014-08-01  2253  	} else {
a4f3d2c4efe262 David Sterba       2015-02-16  2254  		set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
a4f3d2c4efe262 David Sterba       2015-02-16  2255  		fs_info->uuid_root = root;
4bbcaa648d2347 Eric Sandeen       2014-08-01  2256  	}
4bbcaa648d2347 Eric Sandeen       2014-08-01  2257  
515020900d4477 Johannes Thumshirn 2023-09-14  2258  	if (btrfs_fs_incompat(fs_info, RAID_STRIPE_TREE)) {
515020900d4477 Johannes Thumshirn 2023-09-14  2259  		location.objectid = BTRFS_RAID_STRIPE_TREE_OBJECTID;
515020900d4477 Johannes Thumshirn 2023-09-14  2260  		root = btrfs_read_tree_root(tree_root, &location);
515020900d4477 Johannes Thumshirn 2023-09-14  2261  		if (IS_ERR(root)) {
515020900d4477 Johannes Thumshirn 2023-09-14  2262  			if (!btrfs_test_opt(fs_info, IGNOREBADROOTS)) {
515020900d4477 Johannes Thumshirn 2023-09-14  2263  				ret = PTR_ERR(root);
515020900d4477 Johannes Thumshirn 2023-09-14  2264  				goto out;
515020900d4477 Johannes Thumshirn 2023-09-14  2265  			}
515020900d4477 Johannes Thumshirn 2023-09-14  2266  		} else {
515020900d4477 Johannes Thumshirn 2023-09-14  2267  			set_bit(BTRFS_ROOT_TRACK_DIRTY, &root->state);
515020900d4477 Johannes Thumshirn 2023-09-14  2268  			fs_info->stripe_root = root;
515020900d4477 Johannes Thumshirn 2023-09-14  2269  		}
515020900d4477 Johannes Thumshirn 2023-09-14  2270  	}
515020900d4477 Johannes Thumshirn 2023-09-14  2271  
4bbcaa648d2347 Eric Sandeen       2014-08-01  2272  	return 0;
f50f43539070c6 Liu Bo             2018-03-29  2273  out:
f50f43539070c6 Liu Bo             2018-03-29  2274  	btrfs_warn(fs_info, "failed to read root (objectid=%llu): %d",
f50f43539070c6 Liu Bo             2018-03-29  2275  		   location.objectid, ret);
f50f43539070c6 Liu Bo             2018-03-29  2276  	return ret;
4bbcaa648d2347 Eric Sandeen       2014-08-01  2277  }
4bbcaa648d2347 Eric Sandeen       2014-08-01  2278  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
