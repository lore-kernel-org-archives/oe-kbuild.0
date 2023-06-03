Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844481FB4
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685835664; x=1717371664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SePPyC2ks02pR3cEg7AD+eXjZbWlQ6ffeeULgkF2iQg=;
  b=oHuvwHSRb0JCo0nqWMd2B7BjpEnMthFsD/rldDVhsTrHWfwHTkZ0zSMr
   bYIjgK0V8DWYxXXw9+DGMxLBg9Ji7Gh8X5m27Ggw2QRS2KuJiNLGUNCcp
   VDYtQVcpBPXnJxmwki1y2dJ8p8JA0crdlJNR+lY/bzdyl4A/3RxYYjGP3
   eC/JqAOIBQWqNMG5VCxHhBhmJzJ7w5qFIf7rTbCqS35u/N+5UT5Pd2qe1
   7CcexPuLmklUZ6ZxBwNRJrCHAxSCt72IAmHqwWDx60HEL14cwnx/mSPuG
   YPOdV34jOeJ6PxxOOZHRUkjJCMiZmAmyxYPjc2hvtFgN5yo3XJ+0t2PBt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="359438116"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="359438116"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 16:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="1038343781"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="1038343781"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jun 2023 16:41:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ark-00026z-0r;
	Sat, 03 Jun 2023 23:41:00 +0000
Date: Sun, 4 Jun 2023 07:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] btrfs: insert tree mod log move in push_node_left
Message-ID: <202306040704.9cbCpyUP-lkp@intel.com>
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
In-Reply-To: <cbcc2be3a79a2af9885a0e23251788562f8bf2e9.1685645613.git.boris@bur.io>
References: <cbcc2be3a79a2af9885a0e23251788562f8bf2e9.1685645613.git.boris@bur.io>
TO: Boris Burkov <boris@bur.io>

Hi Boris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Boris-Burkov/btrfs-warn-on-invalid-slot-in-tree-mod-log-rewind/20230602-025629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/cbcc2be3a79a2af9885a0e23251788562f8bf2e9.1685645613.git.boris%40bur.io
patch subject: [PATCH v4 2/2] btrfs: insert tree mod log move in push_node_left
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m041-20230531 (https://download.01.org/0day-ci/archive/20230604/202306040704.9cbCpyUP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306040704.9cbCpyUP-lkp@intel.com/

New smatch warnings:
fs/btrfs/tree-mod-log.c:290 btrfs_tree_mod_log_insert_move() warn: passing a valid pointer to 'PTR_ERR'
fs/btrfs/tree-mod-log.c:527 btrfs_tree_mod_log_eb_copy() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
fs/btrfs/tree-mod-log.c:305 btrfs_tree_mod_log_insert_move() warn: missing error code 'ret'
fs/btrfs/tree-mod-log.c:537 btrfs_tree_mod_log_eb_copy() warn: passing a valid pointer to 'PTR_ERR'
fs/btrfs/tree-mod-log.c:562 btrfs_tree_mod_log_eb_copy() warn: missing error code 'ret'
fs/btrfs/tree-mod-log.c:633 btrfs_tree_mod_log_free_eb() warn: missing error code 'ret'

vim +/PTR_ERR +290 fs/btrfs/tree-mod-log.c

5ed7d21303c76e Boris Burkov  2023-06-01  270  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  271  int btrfs_tree_mod_log_insert_move(struct extent_buffer *eb,
f3a84ccd28d0b0 Filipe Manana 2021-03-11  272  				   int dst_slot, int src_slot,
f3a84ccd28d0b0 Filipe Manana 2021-03-11  273  				   int nr_items)
f3a84ccd28d0b0 Filipe Manana 2021-03-11  274  {
f3a84ccd28d0b0 Filipe Manana 2021-03-11  275  	struct tree_mod_elem *tm = NULL;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  276  	struct tree_mod_elem **tm_list = NULL;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  277  	int ret = 0;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  278  	int i;
406808ab2f0ba3 Filipe Manana 2021-03-11  279  	bool locked = false;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  280  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  281  	if (!tree_mod_need_log(eb->fs_info, eb))
f3a84ccd28d0b0 Filipe Manana 2021-03-11  282  		return 0;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  283  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  284  	tm_list = kcalloc(nr_items, sizeof(struct tree_mod_elem *), GFP_NOFS);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  285  	if (!tm_list)
f3a84ccd28d0b0 Filipe Manana 2021-03-11  286  		return -ENOMEM;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  287  
5ed7d21303c76e Boris Burkov  2023-06-01  288  	tm = tree_mod_log_alloc_move(eb, dst_slot, src_slot, nr_items);
5ed7d21303c76e Boris Burkov  2023-06-01  289  	if (IS_ERR(tm)) {
5ed7d21303c76e Boris Burkov  2023-06-01 @290  		ret = PTR_ERR(tm);
5ed7d21303c76e Boris Burkov  2023-06-01  291  		tm = NULL;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  292  		goto free_tms;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  293  	}
f3a84ccd28d0b0 Filipe Manana 2021-03-11  294  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  295  	for (i = 0; i + dst_slot < src_slot && i < nr_items; i++) {
f3a84ccd28d0b0 Filipe Manana 2021-03-11  296  		tm_list[i] = alloc_tree_mod_elem(eb, i + dst_slot,
33cff222faffef Filipe Manana 2022-10-14  297  				BTRFS_MOD_LOG_KEY_REMOVE_WHILE_MOVING);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  298  		if (!tm_list[i]) {
f3a84ccd28d0b0 Filipe Manana 2021-03-11  299  			ret = -ENOMEM;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  300  			goto free_tms;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  301  		}
f3a84ccd28d0b0 Filipe Manana 2021-03-11  302  	}
f3a84ccd28d0b0 Filipe Manana 2021-03-11  303  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  304  	if (tree_mod_dont_log(eb->fs_info, eb))
f3a84ccd28d0b0 Filipe Manana 2021-03-11  305  		goto free_tms;
406808ab2f0ba3 Filipe Manana 2021-03-11  306  	locked = true;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  307  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  308  	/*
f3a84ccd28d0b0 Filipe Manana 2021-03-11  309  	 * When we override something during the move, we log these removals.
f3a84ccd28d0b0 Filipe Manana 2021-03-11  310  	 * This can only happen when we move towards the beginning of the
f3a84ccd28d0b0 Filipe Manana 2021-03-11  311  	 * buffer, i.e. dst_slot < src_slot.
f3a84ccd28d0b0 Filipe Manana 2021-03-11  312  	 */
f3a84ccd28d0b0 Filipe Manana 2021-03-11  313  	for (i = 0; i + dst_slot < src_slot && i < nr_items; i++) {
f3a84ccd28d0b0 Filipe Manana 2021-03-11  314  		ret = tree_mod_log_insert(eb->fs_info, tm_list[i]);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  315  		if (ret)
f3a84ccd28d0b0 Filipe Manana 2021-03-11  316  			goto free_tms;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  317  	}
f3a84ccd28d0b0 Filipe Manana 2021-03-11  318  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  319  	ret = tree_mod_log_insert(eb->fs_info, tm);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  320  	if (ret)
f3a84ccd28d0b0 Filipe Manana 2021-03-11  321  		goto free_tms;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  322  	write_unlock(&eb->fs_info->tree_mod_log_lock);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  323  	kfree(tm_list);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  324  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  325  	return 0;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  326  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  327  free_tms:
f3a84ccd28d0b0 Filipe Manana 2021-03-11  328  	for (i = 0; i < nr_items; i++) {
f3a84ccd28d0b0 Filipe Manana 2021-03-11  329  		if (tm_list[i] && !RB_EMPTY_NODE(&tm_list[i]->node))
f3a84ccd28d0b0 Filipe Manana 2021-03-11  330  			rb_erase(&tm_list[i]->node, &eb->fs_info->tree_mod_log);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  331  		kfree(tm_list[i]);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  332  	}
f3a84ccd28d0b0 Filipe Manana 2021-03-11  333  	if (locked)
f3a84ccd28d0b0 Filipe Manana 2021-03-11  334  		write_unlock(&eb->fs_info->tree_mod_log_lock);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  335  	kfree(tm_list);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  336  	kfree(tm);
f3a84ccd28d0b0 Filipe Manana 2021-03-11  337  
f3a84ccd28d0b0 Filipe Manana 2021-03-11  338  	return ret;
f3a84ccd28d0b0 Filipe Manana 2021-03-11  339  }
f3a84ccd28d0b0 Filipe Manana 2021-03-11  340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
