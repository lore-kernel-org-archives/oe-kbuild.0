Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083835223
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Sep 2025 02:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757211484; cv=none; b=Tss7WbSOHTmHzx7U6crfEdkLnsHd1i+MfaEL8M6L9keZxShnTgjAak4Ph5Gay85FSD2javKe1uyE9IYasevy5UYuqd7oTvSf3jYjbtw23DZDl9IrGKXv0fCQORLYS0I97lF/1gr/bdvPO7hSqWUMNCqZ6ivnZUls/DaIxpRcsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757211484; c=relaxed/simple;
	bh=VB4LPsD6zhVvL+ivglGSXP6qxj5dDSGYoa6x/VvgQ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpnQ4ST+GD8necwfWDiLR895uOrMcahHF0AMJn7enXteSLJWf5Qhn6aX75d/ehLP88TdOp+sOemnwc83BrVQFK+k32RVswfBgrG38mwORXsVUAmZPQx4g1uqDOGGwt07CUmNyvVG0aW9QkiziC1RT+4UigwCZSp2C7ONIP+PR+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/EshAbY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/EshAbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757211482; x=1788747482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VB4LPsD6zhVvL+ivglGSXP6qxj5dDSGYoa6x/VvgQ0U=;
  b=A/EshAbYTSYHjjJhv4Pidz1JDRu0T8uWSdyyt5zAvHePourjiedaklnV
   LrZWm/692Te7btusFNgv5/Gcn4VxIdePQjJd/QF6bAaaoOJRfXUlTfZEB
   Q8t9fUqaShuxz5EeOcoIVXdy8EymkxYvrJNizJqHRAg+tkdpBisephM5E
   ht9n69oQcyUueH78z5KIYT2A/EmRV6E5TV3BHBrFpy80IKm73utIG3WJ7
   WF6v8WyRKRDQ4ZKSaphTfJZ62viHlUlp9aAR094WO6Ci6u3SSRaR3UxML
   w6D+ik+DU3xFY8TsTSK7x1qfuW1KVMG3kx929/C7h4XjrcnHDmgTnKzdy
   Q==;
X-CSE-ConnectionGUID: BTnRlwSESU+Oz9TsgYS02g==
X-CSE-MsgGUID: ai3M5nMeQSCiF57uOZIK1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11545"; a="70128568"
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="70128568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 19:18:01 -0700
X-CSE-ConnectionGUID: x2AaTuxSQ220WeRDkyFEZQ==
X-CSE-MsgGUID: 2jSi1RnJTf6r8O/NX4SMbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172044041"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Sep 2025 19:17:59 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv4yb-0001x5-0k;
	Sun, 07 Sep 2025 02:17:57 +0000
Date: Sun, 7 Sep 2025 10:16:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 33/33] btrfs: dump detailed info and specific messages on
 log replay failures
Message-ID: <202509070931.zy8HHIta-lkp@intel.com>
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
In-Reply-To: <f0623e4f3a69cd61238551c1e5b44fc31077db16.1757075118.git.fdmanana@suse.com>
References: <f0623e4f3a69cd61238551c1e5b44fc31077db16.1757075118.git.fdmanana@suse.com>
TO: fdmanana@kernel.org
TO: linux-btrfs@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on next-20250905]
[cannot apply to linus/master v6.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-fix-invalid-extref-key-setup-when-replaying-dentry/20250906-001715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/f0623e4f3a69cd61238551c1e5b44fc31077db16.1757075118.git.fdmanana%40suse.com
patch subject: [PATCH 33/33] btrfs: dump detailed info and specific messages on log replay failures
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20250906 (https://download.01.org/0day-ci/archive/20250907/202509070931.zy8HHIta-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509070931.zy8HHIta-lkp@intel.com/

New smatch warnings:
fs/btrfs/tree-log.c:2591 replay_xattr_deletes() warn: passing freed memory 'name' (line 2588)

Old smatch warnings:
fs/btrfs/tree-log.c:2601 replay_xattr_deletes() warn: passing freed memory 'name' (line 2588)
fs/btrfs/tree-log.c:2614 replay_xattr_deletes() warn: passing freed memory 'name' (line 2611)
fs/btrfs/tree-log.c:3548 btrfs_sync_log() error: we previously assumed 'log_root_tree->node' could be null (see line 3443)

vim +/name +2591 fs/btrfs/tree-log.c

e02119d5a7b439 Chris Mason   2008-09-05  2516  
51abc774a9b1d4 Filipe Manana 2025-09-05  2517  static int replay_xattr_deletes(struct walk_control *wc)
4f764e5153616f Filipe Manana 2015-02-23  2518  {
b75ff3e7b377e8 Filipe Manana 2025-09-05  2519  	struct btrfs_trans_handle *trans = wc->trans;
b75ff3e7b377e8 Filipe Manana 2025-09-05  2520  	struct btrfs_root *root = wc->root;
b75ff3e7b377e8 Filipe Manana 2025-09-05  2521  	struct btrfs_root *log = wc->log;
4f764e5153616f Filipe Manana 2015-02-23  2522  	struct btrfs_key search_key;
4f764e5153616f Filipe Manana 2015-02-23  2523  	struct btrfs_path *log_path;
b048ef711534b2 Filipe Manana 2025-09-05  2524  	const u64 ino = wc->log_key.objectid;
4f764e5153616f Filipe Manana 2015-02-23  2525  	int nritems;
4f764e5153616f Filipe Manana 2015-02-23  2526  	int ret;
4f764e5153616f Filipe Manana 2015-02-23  2527  
4f764e5153616f Filipe Manana 2015-02-23  2528  	log_path = btrfs_alloc_path();
fa7c5927bfe412 Filipe Manana 2025-07-18  2529  	if (!log_path) {
c2bd309cef030f Filipe Manana 2025-09-05  2530  		btrfs_abort_log_replay(wc, -ENOMEM, "failed to allocate path");
4f764e5153616f Filipe Manana 2015-02-23  2531  		return -ENOMEM;
fa7c5927bfe412 Filipe Manana 2025-07-18  2532  	}
4f764e5153616f Filipe Manana 2015-02-23  2533  
4f764e5153616f Filipe Manana 2015-02-23  2534  	search_key.objectid = ino;
4f764e5153616f Filipe Manana 2015-02-23  2535  	search_key.type = BTRFS_XATTR_ITEM_KEY;
4f764e5153616f Filipe Manana 2015-02-23  2536  	search_key.offset = 0;
4f764e5153616f Filipe Manana 2015-02-23  2537  again:
51abc774a9b1d4 Filipe Manana 2025-09-05  2538  	ret = btrfs_search_slot(NULL, root, &search_key, wc->subvol_path, 0, 0);
fa7c5927bfe412 Filipe Manana 2025-07-18  2539  	if (ret < 0) {
c2bd309cef030f Filipe Manana 2025-09-05  2540  		btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2541  			       "failed to search xattrs for inode %llu root %llu",
c2bd309cef030f Filipe Manana 2025-09-05  2542  				       ino, btrfs_root_id(root));
4f764e5153616f Filipe Manana 2015-02-23  2543  		goto out;
fa7c5927bfe412 Filipe Manana 2025-07-18  2544  	}
4f764e5153616f Filipe Manana 2015-02-23  2545  process_leaf:
51abc774a9b1d4 Filipe Manana 2025-09-05  2546  	nritems = btrfs_header_nritems(wc->subvol_path->nodes[0]);
51abc774a9b1d4 Filipe Manana 2025-09-05  2547  	for (int i = wc->subvol_path->slots[0]; i < nritems; i++) {
4f764e5153616f Filipe Manana 2015-02-23  2548  		struct btrfs_key key;
4f764e5153616f Filipe Manana 2015-02-23  2549  		struct btrfs_dir_item *di;
4f764e5153616f Filipe Manana 2015-02-23  2550  		struct btrfs_dir_item *log_di;
4f764e5153616f Filipe Manana 2015-02-23  2551  		u32 total_size;
4f764e5153616f Filipe Manana 2015-02-23  2552  		u32 cur;
4f764e5153616f Filipe Manana 2015-02-23  2553  
51abc774a9b1d4 Filipe Manana 2025-09-05  2554  		btrfs_item_key_to_cpu(wc->subvol_path->nodes[0], &key, i);
4f764e5153616f Filipe Manana 2015-02-23  2555  		if (key.objectid != ino || key.type != BTRFS_XATTR_ITEM_KEY) {
4f764e5153616f Filipe Manana 2015-02-23  2556  			ret = 0;
4f764e5153616f Filipe Manana 2015-02-23  2557  			goto out;
4f764e5153616f Filipe Manana 2015-02-23  2558  		}
4f764e5153616f Filipe Manana 2015-02-23  2559  
51abc774a9b1d4 Filipe Manana 2025-09-05  2560  		di = btrfs_item_ptr(wc->subvol_path->nodes[0], i, struct btrfs_dir_item);
51abc774a9b1d4 Filipe Manana 2025-09-05  2561  		total_size = btrfs_item_size(wc->subvol_path->nodes[0], i);
4f764e5153616f Filipe Manana 2015-02-23  2562  		cur = 0;
4f764e5153616f Filipe Manana 2015-02-23  2563  		while (cur < total_size) {
51abc774a9b1d4 Filipe Manana 2025-09-05  2564  			u16 name_len = btrfs_dir_name_len(wc->subvol_path->nodes[0], di);
51abc774a9b1d4 Filipe Manana 2025-09-05  2565  			u16 data_len = btrfs_dir_data_len(wc->subvol_path->nodes[0], di);
4f764e5153616f Filipe Manana 2015-02-23  2566  			u32 this_len = sizeof(*di) + name_len + data_len;
4f764e5153616f Filipe Manana 2015-02-23  2567  			char *name;
4f764e5153616f Filipe Manana 2015-02-23  2568  
4f764e5153616f Filipe Manana 2015-02-23  2569  			name = kmalloc(name_len, GFP_NOFS);
4f764e5153616f Filipe Manana 2015-02-23  2570  			if (!name) {
4f764e5153616f Filipe Manana 2015-02-23  2571  				ret = -ENOMEM;
c2bd309cef030f Filipe Manana 2025-09-05  2572  				btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2573  				       "failed to allocate memory for name of length %u",
c2bd309cef030f Filipe Manana 2025-09-05  2574  						       name_len);
4f764e5153616f Filipe Manana 2015-02-23  2575  				goto out;
4f764e5153616f Filipe Manana 2015-02-23  2576  			}
51abc774a9b1d4 Filipe Manana 2025-09-05  2577  			read_extent_buffer(wc->subvol_path->nodes[0], name,
4f764e5153616f Filipe Manana 2015-02-23  2578  					   (unsigned long)(di + 1), name_len);
4f764e5153616f Filipe Manana 2015-02-23  2579  
4f764e5153616f Filipe Manana 2015-02-23  2580  			log_di = btrfs_lookup_xattr(NULL, log, log_path, ino,
4f764e5153616f Filipe Manana 2015-02-23  2581  						    name, name_len, 0);
4f764e5153616f Filipe Manana 2015-02-23  2582  			btrfs_release_path(log_path);
4f764e5153616f Filipe Manana 2015-02-23  2583  			if (!log_di) {
4f764e5153616f Filipe Manana 2015-02-23  2584  				/* Doesn't exist in log tree, so delete it. */
51abc774a9b1d4 Filipe Manana 2025-09-05  2585  				btrfs_release_path(wc->subvol_path);
51abc774a9b1d4 Filipe Manana 2025-09-05  2586  				di = btrfs_lookup_xattr(trans, root, wc->subvol_path, ino,
4f764e5153616f Filipe Manana 2015-02-23  2587  							name, name_len, -1);
4f764e5153616f Filipe Manana 2015-02-23 @2588  				kfree(name);
4f764e5153616f Filipe Manana 2015-02-23  2589  				if (IS_ERR(di)) {
4f764e5153616f Filipe Manana 2015-02-23  2590  					ret = PTR_ERR(di);
c2bd309cef030f Filipe Manana 2025-09-05 @2591  					btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2592  		       "failed to lookup xattr with name %.*s for inode %llu root %llu",
c2bd309cef030f Filipe Manana 2025-09-05  2593  							       name_len, name, ino,
c2bd309cef030f Filipe Manana 2025-09-05  2594  							       btrfs_root_id(root));
4f764e5153616f Filipe Manana 2015-02-23  2595  					goto out;
4f764e5153616f Filipe Manana 2015-02-23  2596  				}
4f764e5153616f Filipe Manana 2015-02-23  2597  				ASSERT(di);
4f764e5153616f Filipe Manana 2015-02-23  2598  				ret = btrfs_delete_one_dir_name(trans, root,
51abc774a9b1d4 Filipe Manana 2025-09-05  2599  								wc->subvol_path, di);
fa7c5927bfe412 Filipe Manana 2025-07-18  2600  				if (ret) {
c2bd309cef030f Filipe Manana 2025-09-05  2601  					btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2602  		       "failed to delete xattr with name %.*s for inode %llu root %llu",
c2bd309cef030f Filipe Manana 2025-09-05  2603  							       name_len, name, ino,
c2bd309cef030f Filipe Manana 2025-09-05  2604  							       btrfs_root_id(root));
4f764e5153616f Filipe Manana 2015-02-23  2605  					goto out;
fa7c5927bfe412 Filipe Manana 2025-07-18  2606  				}
51abc774a9b1d4 Filipe Manana 2025-09-05  2607  				btrfs_release_path(wc->subvol_path);
4f764e5153616f Filipe Manana 2015-02-23  2608  				search_key = key;
4f764e5153616f Filipe Manana 2015-02-23  2609  				goto again;
4f764e5153616f Filipe Manana 2015-02-23  2610  			}
4f764e5153616f Filipe Manana 2015-02-23  2611  			kfree(name);
4f764e5153616f Filipe Manana 2015-02-23  2612  			if (IS_ERR(log_di)) {
4f764e5153616f Filipe Manana 2015-02-23  2613  				ret = PTR_ERR(log_di);
c2bd309cef030f Filipe Manana 2025-09-05  2614  				btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2615  	"failed to lookup xattr in log tree with name %.*s for inode %llu root %llu",
c2bd309cef030f Filipe Manana 2025-09-05  2616  						       name_len, name, ino,
c2bd309cef030f Filipe Manana 2025-09-05  2617  						       btrfs_root_id(root));
4f764e5153616f Filipe Manana 2015-02-23  2618  				goto out;
4f764e5153616f Filipe Manana 2015-02-23  2619  			}
4f764e5153616f Filipe Manana 2015-02-23  2620  			cur += this_len;
4f764e5153616f Filipe Manana 2015-02-23  2621  			di = (struct btrfs_dir_item *)((char *)di + this_len);
4f764e5153616f Filipe Manana 2015-02-23  2622  		}
4f764e5153616f Filipe Manana 2015-02-23  2623  	}
51abc774a9b1d4 Filipe Manana 2025-09-05  2624  	ret = btrfs_next_leaf(root, wc->subvol_path);
4f764e5153616f Filipe Manana 2015-02-23  2625  	if (ret > 0)
4f764e5153616f Filipe Manana 2015-02-23  2626  		ret = 0;
4f764e5153616f Filipe Manana 2015-02-23  2627  	else if (ret == 0)
4f764e5153616f Filipe Manana 2015-02-23  2628  		goto process_leaf;
fa7c5927bfe412 Filipe Manana 2025-07-18  2629  	else
c2bd309cef030f Filipe Manana 2025-09-05  2630  		btrfs_abort_log_replay(wc, ret,
c2bd309cef030f Filipe Manana 2025-09-05  2631  			       "failed to get next leaf in subvolume root %llu",
c2bd309cef030f Filipe Manana 2025-09-05  2632  				       btrfs_root_id(root));
4f764e5153616f Filipe Manana 2015-02-23  2633  out:
4f764e5153616f Filipe Manana 2015-02-23  2634  	btrfs_free_path(log_path);
51abc774a9b1d4 Filipe Manana 2025-09-05  2635  	btrfs_release_path(wc->subvol_path);
4f764e5153616f Filipe Manana 2015-02-23  2636  	return ret;
4f764e5153616f Filipe Manana 2015-02-23  2637  }
4f764e5153616f Filipe Manana 2015-02-23  2638  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
