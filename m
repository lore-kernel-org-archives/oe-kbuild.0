Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E10DE4C5
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679234170; x=1710770170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SS1Blruy02m9sKT2xWDhTPUdJ4VPMJoe5YALSJ8Xjek=;
  b=P9oZIypxSJc8S5UaP3ci6c2dla9haIpfgohfMZV5IzxNHkujGlggpJWI
   jKYbF/xAW/Za3PWKy9ENRKepHqhZupuoig5SEjsx2u97keK/K2g2hI9NF
   crXnz9NQxQMS6T5ms6oRYoYGzarvKlTVVtPsq93PFTkennCzQTStYoLU4
   ZMWwM7dnRZwdB/4mJiP0r+0ns+Rql1iL7675aDoaB69rFJw66KQ0e6Pn6
   ZfZYcuR8hNMTwzc7XcQ5yu9NsKAfp0VSfNphln67uy6bt4iblHIr9NfiY
   489s+mr9rnxTq2zge5pIPrbLyPOpRph8KvYdElSsUR08H0CvbcU1QOter
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326877744"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="326877744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 06:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="658088830"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="658088830"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Mar 2023 06:56:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdtW3-000AXK-2S;
	Sun, 19 Mar 2023 13:56:07 +0000
Date: Sun, 19 Mar 2023 21:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/send.c:8344 btrfs_ioctl_send() warn: Function too hairy.
  No more merges.
Message-ID: <202303192151.4STwHGD6-lkp@intel.com>
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
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 66d04209e5a8d3fc47900de6bd0c319790a52b3e btrfs: send: cache leaf to roots mapping during backref walking
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230319/202303192151.4STwHGD6-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303192151.4STwHGD6-lkp@intel.com/

smatch warnings:
fs/btrfs/send.c:8344 btrfs_ioctl_send() warn: Function too hairy.  No more merges.

vim +8344 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  8008  
9ad1230533efb6 Sahil Kang                2022-01-15  8009  long btrfs_ioctl_send(struct inode *inode, struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  8010  {
31db9f7c23fbf7 Alexander Block           2012-07-25  8011  	int ret = 0;
9ad1230533efb6 Sahil Kang                2022-01-15  8012  	struct btrfs_root *send_root = BTRFS_I(inode)->root;
0b246afa62b0cf Jeff Mahoney              2016-06-22  8013  	struct btrfs_fs_info *fs_info = send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  8014  	struct btrfs_root *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  8015  	struct send_ctx *sctx = NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  8016  	u32 i;
31db9f7c23fbf7 Alexander Block           2012-07-25  8017  	u64 *clone_sources_tmp = NULL;
2c68653787f91c David Sterba              2013-12-16  8018  	int clone_sources_to_rollback = 0;
bae12df966f0e1 Denis Efremov             2020-09-21  8019  	size_t alloc_size;
896c14f97f700a Wang Shilong              2014-01-07  8020  	int sort_clone_roots = 0;
31db9f7c23fbf7 Alexander Block           2012-07-25  8021  
31db9f7c23fbf7 Alexander Block           2012-07-25  8022  	if (!capable(CAP_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  8023  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8024  
2c68653787f91c David Sterba              2013-12-16  8025  	/*
2c68653787f91c David Sterba              2013-12-16  8026  	 * The subvolume must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  8027  	 * making it RW. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  8028  	 */
2c68653787f91c David Sterba              2013-12-16  8029  	spin_lock(&send_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  8030  	if (btrfs_root_readonly(send_root) && send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8031  		dedupe_in_progress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8032  		spin_unlock(&send_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  8033  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8034  	}
2c68653787f91c David Sterba              2013-12-16  8035  	send_root->send_in_progress++;
2c68653787f91c David Sterba              2013-12-16  8036  	spin_unlock(&send_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8037  
2c68653787f91c David Sterba              2013-12-16  8038  	/*
2c68653787f91c David Sterba              2013-12-16  8039  	 * Userspace tools do the checks and warn the user if it's
2c68653787f91c David Sterba              2013-12-16  8040  	 * not RO.
2c68653787f91c David Sterba              2013-12-16  8041  	 */
2c68653787f91c David Sterba              2013-12-16  8042  	if (!btrfs_root_readonly(send_root)) {
2c68653787f91c David Sterba              2013-12-16  8043  		ret = -EPERM;
2c68653787f91c David Sterba              2013-12-16  8044  		goto out;
2c68653787f91c David Sterba              2013-12-16  8045  	}
2c68653787f91c David Sterba              2013-12-16  8046  
457ae7268b29c3 Dan Carpenter             2017-03-17  8047  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  8048  	 * Check that we don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  8049  	 * clone_sources_count + 1 items, and compare to unsigned long inside
457ae7268b29c3 Dan Carpenter             2017-03-17  8050  	 * access_ok.
457ae7268b29c3 Dan Carpenter             2017-03-17  8051  	 */
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8052  	if (arg->clone_sources_count >
457ae7268b29c3 Dan Carpenter             2017-03-17  8053  	    ULONG_MAX / sizeof(struct clone_root) - 1) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8054  		ret = -EINVAL;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8055  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8056  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8057  
c2c71324ecb471 Stefan Behrens            2013-04-10  8058  	if (arg->flags & ~BTRFS_SEND_FLAG_MASK) {
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8059  		ret = -EINVAL;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8060  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8061  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8062  
e780b0d1c1523e David Sterba              2016-01-18  8063  	sctx = kzalloc(sizeof(struct send_ctx), GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  8064  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8065  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8066  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8067  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8068  
31db9f7c23fbf7 Alexander Block           2012-07-25  8069  	INIT_LIST_HEAD(&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  8070  	INIT_LIST_HEAD(&sctx->deleted_refs);
5b8418b84303d9 David Sterba              2022-07-15  8071  	INIT_RADIX_TREE(&sctx->name_cache, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  8072  	INIT_LIST_HEAD(&sctx->name_cache_list);
31db9f7c23fbf7 Alexander Block           2012-07-25  8073  
66d04209e5a8d3 Filipe Manana             2022-11-01  8074  	INIT_LIST_HEAD(&sctx->backref_cache.lru_list);
66d04209e5a8d3 Filipe Manana             2022-11-01  8075  	mt_init(&sctx->backref_cache.entries);
66d04209e5a8d3 Filipe Manana             2022-11-01  8076  
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8077  	sctx->flags = arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8078  
e77fbf990316d4 David Sterba              2021-10-22  8079  	if (arg->flags & BTRFS_SEND_FLAG_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  8080  		if (arg->version > BTRFS_SEND_STREAM_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  8081  			ret = -EPROTO;
e77fbf990316d4 David Sterba              2021-10-22  8082  			goto out;
e77fbf990316d4 David Sterba              2021-10-22  8083  		}
e77fbf990316d4 David Sterba              2021-10-22  8084  		/* Zero means "use the highest version" */
e77fbf990316d4 David Sterba              2021-10-22  8085  		sctx->proto = arg->version ?: BTRFS_SEND_STREAM_VERSION;
e77fbf990316d4 David Sterba              2021-10-22  8086  	} else {
e77fbf990316d4 David Sterba              2021-10-22  8087  		sctx->proto = 1;
e77fbf990316d4 David Sterba              2021-10-22  8088  	}
d6815592806f48 Omar Sandoval             2022-03-17  8089  	if ((arg->flags & BTRFS_SEND_FLAG_COMPRESSED) && sctx->proto < 2) {
d6815592806f48 Omar Sandoval             2022-03-17  8090  		ret = -EINVAL;
d6815592806f48 Omar Sandoval             2022-03-17  8091  		goto out;
d6815592806f48 Omar Sandoval             2022-03-17  8092  	}
e77fbf990316d4 David Sterba              2021-10-22  8093  
31db9f7c23fbf7 Alexander Block           2012-07-25  8094  	sctx->send_filp = fget(arg->send_fd);
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  8095  	if (!sctx->send_filp) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  8096  		ret = -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  8097  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8098  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8099  
31db9f7c23fbf7 Alexander Block           2012-07-25  8100  	sctx->send_root = send_root;
521e0546c970c3 David Sterba              2014-04-15  8101  	/*
521e0546c970c3 David Sterba              2014-04-15  8102  	 * Unlikely but possible, if the subvolume is marked for deletion but
521e0546c970c3 David Sterba              2014-04-15  8103  	 * is slow to remove the directory entry, send can still be started
521e0546c970c3 David Sterba              2014-04-15  8104  	 */
521e0546c970c3 David Sterba              2014-04-15  8105  	if (btrfs_root_dead(sctx->send_root)) {
521e0546c970c3 David Sterba              2014-04-15  8106  		ret = -EPERM;
521e0546c970c3 David Sterba              2014-04-15  8107  		goto out;
521e0546c970c3 David Sterba              2014-04-15  8108  	}
521e0546c970c3 David Sterba              2014-04-15  8109  
31db9f7c23fbf7 Alexander Block           2012-07-25  8110  	sctx->clone_roots_cnt = arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  8111  
a4b333f2277b13 Omar Sandoval             2022-04-04  8112  	if (sctx->proto >= 2) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8113  		u32 send_buf_num_pages;
a4b333f2277b13 Omar Sandoval             2022-04-04  8114  
875c627c5f2045 Wang Yugui                2022-10-19  8115  		sctx->send_max_size = BTRFS_SEND_BUF_SIZE_V2;
a4b333f2277b13 Omar Sandoval             2022-04-04  8116  		sctx->send_buf = vmalloc(sctx->send_max_size);
a4b333f2277b13 Omar Sandoval             2022-04-04  8117  		if (!sctx->send_buf) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8118  			ret = -ENOMEM;
a4b333f2277b13 Omar Sandoval             2022-04-04  8119  			goto out;
a4b333f2277b13 Omar Sandoval             2022-04-04  8120  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8121  		send_buf_num_pages = sctx->send_max_size >> PAGE_SHIFT;
a4b333f2277b13 Omar Sandoval             2022-04-04  8122  		sctx->send_buf_pages = kcalloc(send_buf_num_pages,
a4b333f2277b13 Omar Sandoval             2022-04-04  8123  					       sizeof(*sctx->send_buf_pages),
a4b333f2277b13 Omar Sandoval             2022-04-04  8124  					       GFP_KERNEL);
a4b333f2277b13 Omar Sandoval             2022-04-04  8125  		if (!sctx->send_buf_pages) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8126  			ret = -ENOMEM;
a4b333f2277b13 Omar Sandoval             2022-04-04  8127  			goto out;
a4b333f2277b13 Omar Sandoval             2022-04-04  8128  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8129  		for (i = 0; i < send_buf_num_pages; i++) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8130  			sctx->send_buf_pages[i] =
a4b333f2277b13 Omar Sandoval             2022-04-04  8131  				vmalloc_to_page(sctx->send_buf + (i << PAGE_SHIFT));
a4b333f2277b13 Omar Sandoval             2022-04-04  8132  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8133  	} else {
b7c14f23fb604f Omar Sandoval             2022-03-17  8134  		sctx->send_max_size = BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  8135  		sctx->send_buf = kvmalloc(sctx->send_max_size, GFP_KERNEL);
a4b333f2277b13 Omar Sandoval             2022-04-04  8136  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8137  	if (!sctx->send_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8138  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8139  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8140  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8141  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8142  	sctx->pending_dir_moves = RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8143  	sctx->waiting_dir_moves = RB_ROOT;
9dc442143b9874 Filipe Manana             2014-02-19  8144  	sctx->orphan_dirs = RB_ROOT;
3aa5bd367fa5a3 BingJing Chang            2022-07-12  8145  	sctx->rbtree_new_refs = RB_ROOT;
3aa5bd367fa5a3 BingJing Chang            2022-07-12  8146  	sctx->rbtree_deleted_refs = RB_ROOT;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8147  
bae12df966f0e1 Denis Efremov             2020-09-21  8148  	sctx->clone_roots = kvcalloc(sizeof(*sctx->clone_roots),
bae12df966f0e1 Denis Efremov             2020-09-21  8149  				     arg->clone_sources_count + 1,
bae12df966f0e1 Denis Efremov             2020-09-21  8150  				     GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  8151  	if (!sctx->clone_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8152  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8153  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8154  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8155  
bae12df966f0e1 Denis Efremov             2020-09-21  8156  	alloc_size = array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  8157  				arg->clone_sources_count);
e55d1153dbf484 David Sterba              2016-04-11  8158  
31db9f7c23fbf7 Alexander Block           2012-07-25  8159  	if (arg->clone_sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  8160  		clone_sources_tmp = kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  8161  		if (!clone_sources_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8162  			ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8163  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8164  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  8165  
31db9f7c23fbf7 Alexander Block           2012-07-25  8166  		ret = copy_from_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  8167  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  8168  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8169  			ret = -EFAULT;
31db9f7c23fbf7 Alexander Block           2012-07-25  8170  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8171  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  8172  
31db9f7c23fbf7 Alexander Block           2012-07-25  8173  		for (i = 0; i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  8174  			clone_root = btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  8175  						clone_sources_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  8176  			if (IS_ERR(clone_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8177  				ret = PTR_ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8178  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8179  			}
2c68653787f91c David Sterba              2013-12-16  8180  			spin_lock(&clone_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  8181  			if (!btrfs_root_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  8182  			    btrfs_root_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  8183  				spin_unlock(&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  8184  				btrfs_put_root(clone_root);
2c68653787f91c David Sterba              2013-12-16  8185  				ret = -EPERM;
2c68653787f91c David Sterba              2013-12-16  8186  				goto out;
2c68653787f91c David Sterba              2013-12-16  8187  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  8188  			if (clone_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8189  				dedupe_in_progress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8190  				spin_unlock(&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  8191  				btrfs_put_root(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8192  				ret = -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8193  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  8194  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  8195  			clone_root->send_in_progress++;
2c68653787f91c David Sterba              2013-12-16  8196  			spin_unlock(&clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  8197  
31db9f7c23fbf7 Alexander Block           2012-07-25  8198  			sctx->clone_roots[i].root = clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  8199  			clone_sources_to_rollback = i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  8200  		}
2f91306a378099 David Sterba              2016-04-11  8201  		kvfree(clone_sources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  8202  		clone_sources_tmp = NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  8203  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8204  
31db9f7c23fbf7 Alexander Block           2012-07-25  8205  	if (arg->parent_root) {
56e9357a1e8167 David Sterba              2020-05-15  8206  		sctx->parent_root = btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  8207  						      true);
b1b195969fe6d9 Stefan Behrens            2013-05-13  8208  		if (IS_ERR(sctx->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  8209  			ret = PTR_ERR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8210  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8211  		}
18f687d5384493 Wang Shilong              2014-01-07  8212  
2c68653787f91c David Sterba              2013-12-16  8213  		spin_lock(&sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8214  		sctx->parent_root->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  8215  		if (!btrfs_root_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  8216  				btrfs_root_dead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  8217  			spin_unlock(&sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8218  			ret = -EPERM;
2c68653787f91c David Sterba              2013-12-16  8219  			goto out;
2c68653787f91c David Sterba              2013-12-16  8220  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  8221  		if (sctx->parent_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8222  			dedupe_in_progress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8223  			spin_unlock(&sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  8224  			ret = -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8225  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  8226  		}
2c68653787f91c David Sterba              2013-12-16  8227  		spin_unlock(&sctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  8228  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8229  
31db9f7c23fbf7 Alexander Block           2012-07-25  8230  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  8231  	 * Clones from send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  8232  	 * is behind the current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  8233  	 * for possible clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  8234  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  8235  	sctx->clone_roots[sctx->clone_roots_cnt++].root =
0024652895e347 Josef Bacik               2020-01-24  8236  		btrfs_grab_root(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8237  
31db9f7c23fbf7 Alexander Block           2012-07-25  8238  	/* We do a bsearch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  8239  	sort(sctx->clone_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  8240  			sizeof(*sctx->clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  8241  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  8242  	sort_clone_roots = 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  8243  
9f89d5de8631c7 Filipe Manana             2019-04-15  8244  	ret = flush_delalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  8245  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  8246  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  8247  
e5fa8f865b3324 Filipe Manana             2014-10-21  8248  	ret = ensure_commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  8249  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  8250  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  8251  
31db9f7c23fbf7 Alexander Block           2012-07-25  8252  	ret = send_subvol(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8253  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8254  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8255  
c2c71324ecb471 Stefan Behrens            2013-04-10  8256  	if (!(sctx->flags & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8257  		ret = begin_cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  8258  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8259  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8260  		ret = send_cmd(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8261  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8262  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  8263  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8264  
31db9f7c23fbf7 Alexander Block           2012-07-25  8265  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8266  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8267  	while (sctx && !RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8268  		struct rb_node *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8269  		struct pending_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8270  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8271  		n = rb_first(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8272  		pm = rb_entry(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8273  		while (!list_empty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8274  			struct pending_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8275  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8276  			pm2 = list_first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8277  					       struct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8278  			free_pending_move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8279  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8280  		free_pending_move(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8281  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8282  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8283  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8284  	while (sctx && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8285  		struct rb_node *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8286  		struct waiting_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8287  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8288  		n = rb_first(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8289  		dm = rb_entry(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8290  		rb_erase(&dm->node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8291  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8292  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8293  
9dc442143b9874 Filipe Manana             2014-02-19  8294  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19  8295  	while (sctx && !RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  8296  		struct rb_node *n;
9dc442143b9874 Filipe Manana             2014-02-19  8297  		struct orphan_dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  8298  
9dc442143b9874 Filipe Manana             2014-02-19  8299  		n = rb_first(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  8300  		odi = rb_entry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  8301  		free_orphan_dir_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  8302  	}
9dc442143b9874 Filipe Manana             2014-02-19  8303  
896c14f97f700a Wang Shilong              2014-01-07  8304  	if (sort_clone_roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24  8305  		for (i = 0; i < sctx->clone_roots_cnt; i++) {
896c14f97f700a Wang Shilong              2014-01-07  8306  			btrfs_root_dec_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  8307  					sctx->clone_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  8308  			btrfs_put_root(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  8309  		}
896c14f97f700a Wang Shilong              2014-01-07  8310  	} else {
6f9a3da5da9e7e Josef Bacik               2020-01-24  8311  		for (i = 0; sctx && i < clone_sources_to_rollback; i++) {
896c14f97f700a Wang Shilong              2014-01-07  8312  			btrfs_root_dec_send_in_progress(
896c14f97f700a Wang Shilong              2014-01-07  8313  					sctx->clone_roots[i].root);
0024652895e347 Josef Bacik               2020-01-24  8314  			btrfs_put_root(sctx->clone_roots[i].root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  8315  		}
896c14f97f700a Wang Shilong              2014-01-07  8316  
896c14f97f700a Wang Shilong              2014-01-07  8317  		btrfs_root_dec_send_in_progress(send_root);
896c14f97f700a Wang Shilong              2014-01-07  8318  	}
6f9a3da5da9e7e Josef Bacik               2020-01-24  8319  	if (sctx && !IS_ERR_OR_NULL(sctx->parent_root)) {
66ef7d65c3fc6e David Sterba              2013-12-17  8320  		btrfs_root_dec_send_in_progress(sctx->parent_root);
0024652895e347 Josef Bacik               2020-01-24  8321  		btrfs_put_root(sctx->parent_root);
6f9a3da5da9e7e Josef Bacik               2020-01-24  8322  	}
2c68653787f91c David Sterba              2013-12-16  8323  
2f91306a378099 David Sterba              2016-04-11  8324  	kvfree(clone_sources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  8325  
31db9f7c23fbf7 Alexander Block           2012-07-25  8326  	if (sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8327  		if (sctx->send_filp)
31db9f7c23fbf7 Alexander Block           2012-07-25  8328  			fput(sctx->send_filp);
31db9f7c23fbf7 Alexander Block           2012-07-25  8329  
c03d01f3404282 David Sterba              2016-04-11  8330  		kvfree(sctx->clone_roots);
a4b333f2277b13 Omar Sandoval             2022-04-04  8331  		kfree(sctx->send_buf_pages);
6ff48ce06b0725 David Sterba              2016-04-11  8332  		kvfree(sctx->send_buf);
38622010a6de3a Boris Burkov              2022-08-15  8333  		kvfree(sctx->verity_descriptor);
31db9f7c23fbf7 Alexander Block           2012-07-25  8334  
31db9f7c23fbf7 Alexander Block           2012-07-25  8335  		name_cache_free(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8336  
152555b39cebda Filipe Manana             2022-05-17  8337  		close_current_inode(sctx);
521b6803f22e7f Filipe Manana             2022-05-05  8338  
66d04209e5a8d3 Filipe Manana             2022-11-01  8339  		empty_backref_cache(sctx);
66d04209e5a8d3 Filipe Manana             2022-11-01  8340  
31db9f7c23fbf7 Alexander Block           2012-07-25  8341  		kfree(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8342  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8343  
31db9f7c23fbf7 Alexander Block           2012-07-25 @8344  	return ret;

:::::: The code at line 8344 was first introduced by commit
:::::: 31db9f7c23fbf7e95026143f79645de6507b583b Btrfs: introduce BTRFS_IOC_SEND for btrfs send/receive

:::::: TO: Alexander Block <ablock84@googlemail.com>
:::::: CC: Alexander Block <ablock84@googlemail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
