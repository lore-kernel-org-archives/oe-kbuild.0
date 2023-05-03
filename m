Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4323D2
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 22:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683153642; x=1714689642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0qnA3K5sY4/PDxz+gBapFyUSgX2U/ECozbz5JhYROz4=;
  b=A80i6tw+HuEVBtV05ZqpVQRF6hRjprWRzJE0MDISB8YqQX0Ok8HcV/qb
   CZdPI4QYbiR7TbPKf75+f7SL9YLOS6QPi92qTyjGoR3Kgmdzu9dF9ip8y
   faEK9rFZ1H3264p1F0S9VddIawHUuxB8jiR9wgkYLj1c5VTMa++tDh82M
   nkHZmE4VNze+yEcyDuFBA89ahO2J2wKveO8kqle1aPwA5vD/zk+7QdyrY
   Zzk/5O1eEETb9gQwJOhMoxPxs0K7VvWU5YNJCCUDcRlgIqvqOThOrMsvp
   6VwqBXlt+Wnr4SIuQrTdtxcOaCEq9DTWRCGOO+G4/BJ0tTzPRPLeCGdky
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="348826043"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="348826043"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 15:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="647092907"
X-IronPort-AV: E=Sophos;i="5.99,248,1677571200"; 
   d="scan'208";a="647092907"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 May 2023 15:40:36 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puL9H-0002KJ-2z;
	Wed, 03 May 2023 22:40:35 +0000
Date: Thu, 4 May 2023 06:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] btrfs: output affected files when relocation failed
Message-ID: <202305040651.x0jMBnBx-lkp@intel.com>
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
In-Reply-To: <ad4e1c92f8d623557458d1968d76f755264e050e.1683088762.git.wqu@suse.com>
References: <ad4e1c92f8d623557458d1968d76f755264e050e.1683088762.git.wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs@vger.kernel.org

Hi Qu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-output-affected-files-when-relocation-failed/20230503-124141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/ad4e1c92f8d623557458d1968d76f755264e050e.1683088762.git.wqu%40suse.com
patch subject: [PATCH v2] btrfs: output affected files when relocation failed
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: m68k-randconfig-m041-20230430 (https://download.01.org/0day-ci/archive/20230504/202305040651.x0jMBnBx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305040651.x0jMBnBx-lkp@intel.com/

New smatch warnings:
fs/btrfs/inode.c:190 data_reloc_print_warning_inode() warn: missing unwind goto?

Old smatch warnings:
fs/btrfs/inode.c:547 insert_inline_extent() error: we previously assumed 'compressed_pages' could be null (see line 516)

vim +190 fs/btrfs/inode.c

39279cc3d2704c Chris Mason     2007-06-12  124  
3972f2603d8570 Eric Sandeen    2013-01-12  125  static int btrfs_setsize(struct inode *inode, struct iattr *attr);
d9dcae67b7fe1f David Sterba    2022-10-27  126  static int btrfs_truncate(struct btrfs_inode *inode, bool skip_writeback);
6e26c442233b9e Nikolay Borisov 2020-06-03  127  static noinline int cow_file_range(struct btrfs_inode *inode,
771ed689d2cd53 Chris Mason     2008-11-06  128  				   struct page *locked_page,
74e9194afb2c5c Nikolay Borisov 2019-07-17  129  				   u64 start, u64 end, int *page_started,
898793d992c23d Naohiro Aota    2022-07-09  130  				   unsigned long *nr_written, int unlock,
898793d992c23d Naohiro Aota    2022-07-09  131  				   u64 *done_offset);
4b67c11dd19cd6 Nikolay Borisov 2020-06-03  132  static struct extent_map *create_io_em(struct btrfs_inode *inode, u64 start,
4b67c11dd19cd6 Nikolay Borisov 2020-06-03  133  				       u64 len, u64 orig_start, u64 block_start,
6f9994dbabe575 Liu Bo          2017-01-31  134  				       u64 block_len, u64 orig_block_len,
6f9994dbabe575 Liu Bo          2017-01-31  135  				       u64 ram_bytes, int compress_type,
cc95bef635a649 Josef Bacik     2013-04-04  136  				       int type);
7b1287662304c3 Josef Bacik     2008-07-24  137  
552d0b12d2176c Qu Wenruo       2023-05-03  138  static int data_reloc_print_warning_inode(u64 inum, u64 offset, u64 num_bytes,
552d0b12d2176c Qu Wenruo       2023-05-03  139  					  u64 root, void *warn_ctx)
552d0b12d2176c Qu Wenruo       2023-05-03  140  {
552d0b12d2176c Qu Wenruo       2023-05-03  141  	struct data_reloc_warn *warn = warn_ctx;
552d0b12d2176c Qu Wenruo       2023-05-03  142  	struct btrfs_fs_info *fs_info = warn->fs_info;
552d0b12d2176c Qu Wenruo       2023-05-03  143  	struct extent_buffer *eb;
552d0b12d2176c Qu Wenruo       2023-05-03  144  	struct btrfs_inode_item *inode_item;
552d0b12d2176c Qu Wenruo       2023-05-03  145  	struct inode_fs_paths *ipath = NULL;
552d0b12d2176c Qu Wenruo       2023-05-03  146  	struct btrfs_root *local_root;
552d0b12d2176c Qu Wenruo       2023-05-03  147  	struct btrfs_key key;
552d0b12d2176c Qu Wenruo       2023-05-03  148  	unsigned int nofs_flag;
552d0b12d2176c Qu Wenruo       2023-05-03  149  	u32 nlink;
552d0b12d2176c Qu Wenruo       2023-05-03  150  	int ret;
552d0b12d2176c Qu Wenruo       2023-05-03  151  
552d0b12d2176c Qu Wenruo       2023-05-03  152  	local_root = btrfs_get_fs_root(fs_info, root, true);
552d0b12d2176c Qu Wenruo       2023-05-03  153  	if (IS_ERR(local_root)) {
552d0b12d2176c Qu Wenruo       2023-05-03  154  		ret = PTR_ERR(local_root);
552d0b12d2176c Qu Wenruo       2023-05-03  155  		goto err;
552d0b12d2176c Qu Wenruo       2023-05-03  156  	}
552d0b12d2176c Qu Wenruo       2023-05-03  157  
552d0b12d2176c Qu Wenruo       2023-05-03  158  	/* This makes the path point to (inum INODE_ITEM ioff). */
552d0b12d2176c Qu Wenruo       2023-05-03  159  	key.objectid = inum;
552d0b12d2176c Qu Wenruo       2023-05-03  160  	key.type = BTRFS_INODE_ITEM_KEY;
552d0b12d2176c Qu Wenruo       2023-05-03  161  	key.offset = 0;
552d0b12d2176c Qu Wenruo       2023-05-03  162  
552d0b12d2176c Qu Wenruo       2023-05-03  163  	ret = btrfs_search_slot(NULL, local_root, &key, &warn->path, 0, 0);
552d0b12d2176c Qu Wenruo       2023-05-03  164  	if (ret) {
552d0b12d2176c Qu Wenruo       2023-05-03  165  		btrfs_put_root(local_root);
552d0b12d2176c Qu Wenruo       2023-05-03  166  		btrfs_release_path(&warn->path);
552d0b12d2176c Qu Wenruo       2023-05-03  167  		goto err;
552d0b12d2176c Qu Wenruo       2023-05-03  168  	}
552d0b12d2176c Qu Wenruo       2023-05-03  169  
552d0b12d2176c Qu Wenruo       2023-05-03  170  	eb = warn->path.nodes[0];
552d0b12d2176c Qu Wenruo       2023-05-03  171  	inode_item = btrfs_item_ptr(eb, warn->path.slots[0],
552d0b12d2176c Qu Wenruo       2023-05-03  172  				    struct btrfs_inode_item);
552d0b12d2176c Qu Wenruo       2023-05-03  173  	nlink = btrfs_inode_nlink(eb, inode_item);
552d0b12d2176c Qu Wenruo       2023-05-03  174  	btrfs_release_path(&warn->path);
552d0b12d2176c Qu Wenruo       2023-05-03  175  
552d0b12d2176c Qu Wenruo       2023-05-03  176  	nofs_flag = memalloc_nofs_save();
552d0b12d2176c Qu Wenruo       2023-05-03  177  	ipath = init_ipath(4096, local_root, &warn->path);
552d0b12d2176c Qu Wenruo       2023-05-03  178  	memalloc_nofs_restore(nofs_flag);
552d0b12d2176c Qu Wenruo       2023-05-03  179  	if (IS_ERR(ipath)) {
552d0b12d2176c Qu Wenruo       2023-05-03  180  		btrfs_put_root(local_root);
552d0b12d2176c Qu Wenruo       2023-05-03  181  		ret = PTR_ERR(ipath);
552d0b12d2176c Qu Wenruo       2023-05-03  182  		ipath = NULL;
552d0b12d2176c Qu Wenruo       2023-05-03  183  		/*
552d0b12d2176c Qu Wenruo       2023-05-03  184  		 * -ENOMEM, not a critical error, just output an generic error
552d0b12d2176c Qu Wenruo       2023-05-03  185  		 * without filename.
552d0b12d2176c Qu Wenruo       2023-05-03  186  		 */
552d0b12d2176c Qu Wenruo       2023-05-03  187  		btrfs_warn(fs_info,
552d0b12d2176c Qu Wenruo       2023-05-03  188  "checksum error at logical %llu mirror %u root %llu, inode %llu offset %llu",
552d0b12d2176c Qu Wenruo       2023-05-03  189  			   warn->logical, warn->mirror_num, root, inum, offset);
552d0b12d2176c Qu Wenruo       2023-05-03 @190  		return ret;
552d0b12d2176c Qu Wenruo       2023-05-03  191  	}
552d0b12d2176c Qu Wenruo       2023-05-03  192  	ret = paths_from_inode(inum, ipath);
552d0b12d2176c Qu Wenruo       2023-05-03  193  	if (ret < 0)
552d0b12d2176c Qu Wenruo       2023-05-03  194  		goto err;
552d0b12d2176c Qu Wenruo       2023-05-03  195  
552d0b12d2176c Qu Wenruo       2023-05-03  196  	/*
552d0b12d2176c Qu Wenruo       2023-05-03  197  	 * We deliberately ignore the bit ipath might have been too small to
552d0b12d2176c Qu Wenruo       2023-05-03  198  	 * hold all of the paths here
552d0b12d2176c Qu Wenruo       2023-05-03  199  	 */
552d0b12d2176c Qu Wenruo       2023-05-03  200  	for (int i = 0; i < ipath->fspath->elem_cnt; i++)
552d0b12d2176c Qu Wenruo       2023-05-03  201  		btrfs_warn(fs_info,
552d0b12d2176c Qu Wenruo       2023-05-03  202  "checksum error at logical %llu mirror %u root %llu inode %llu offset %llu length %u links %u (path: %s)",
552d0b12d2176c Qu Wenruo       2023-05-03  203  			   warn->logical, warn->mirror_num, root, inum, offset,
552d0b12d2176c Qu Wenruo       2023-05-03  204  			   fs_info->sectorsize, nlink,
552d0b12d2176c Qu Wenruo       2023-05-03  205  			   (char *)(unsigned long)ipath->fspath->val[i]);
552d0b12d2176c Qu Wenruo       2023-05-03  206  
552d0b12d2176c Qu Wenruo       2023-05-03  207  	btrfs_put_root(local_root);
552d0b12d2176c Qu Wenruo       2023-05-03  208  	free_ipath(ipath);
552d0b12d2176c Qu Wenruo       2023-05-03  209  	return 0;
552d0b12d2176c Qu Wenruo       2023-05-03  210  
552d0b12d2176c Qu Wenruo       2023-05-03  211  err:
552d0b12d2176c Qu Wenruo       2023-05-03  212  	btrfs_warn(fs_info,
552d0b12d2176c Qu Wenruo       2023-05-03  213  "checksum error at logical %llu mirror %u root %llu inode %llu offset %llu, path resolving failed with ret=%d",
552d0b12d2176c Qu Wenruo       2023-05-03  214  		   warn->logical, warn->mirror_num, root, inum, offset, ret);
552d0b12d2176c Qu Wenruo       2023-05-03  215  
552d0b12d2176c Qu Wenruo       2023-05-03  216  	free_ipath(ipath);
552d0b12d2176c Qu Wenruo       2023-05-03  217  	return ret;
552d0b12d2176c Qu Wenruo       2023-05-03  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
