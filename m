Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549C279DC9
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jul 2026 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783196243; cv=none; b=Yeu68HG8X0lK3M4pe2esWc2TSH7748egYK/O6ye3DMa0xAEeFd1svCpccOuOhqxGaH/K95n2jLahHv5zMTd2nQQAuAjeEJsYaVrdcfGnAQX+tEuPpparkTnfonUiF/hro63X3r9gdp47sgVgXvp0jhxjyXWYfxnxTwsZAiuVuhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783196243; c=relaxed/simple;
	bh=tgt1wqHfV7npGDCSR6j6DOYK/2OPJFCX14uFnncA1oI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jg7U5IELVVs93OSwc7xDH1PXx6htf8RfRWBHQOXG+X/xbXoUoT7DhU0cEGCbDWp3C0adldlfQHur4QjETHAPi/buevDh41oRbt8plav0Vc7gVSzaCS1+DRmoqn+T7UANxSOaMAZ+B1ldz5AZiC8uu2hUWhnxwlju7BzOSL9gRgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKfrGTa0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKfrGTa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783196239; x=1814732239;
  h=date:from:to:cc:subject:message-id;
  bh=tgt1wqHfV7npGDCSR6j6DOYK/2OPJFCX14uFnncA1oI=;
  b=BKfrGTa0lmgx3AqRqigWhiAV6Zs6IjyfPuWpUaD22rlsc/SgTthh3O9g
   PCvVpOA8kQ6KAFCw1tLqgHsLi4OEL3/8z9v2OSGUwMWvD6NLx/sbZfGnP
   Qr5k2GUdO6iPnk714qDoDmTxBmaj53WUz6VvqGfeM2M9OEOt5Nt1WtS1V
   U7Dp9PNScn7zTdaCd1b4KKa1uRQS4CendJPCHZEGq/JYhSY56iW1EPCxw
   Rj1BB2D2F2fU9vTWlP4XFLxoQiz77iOkbt3EUR3jcEOwm1dLYJq32n9iZ
   MoxLjaxIsBkchE/lw9W/SbiuquFOVI6SFnjS/n5yxobsyi42VXYg02ZHT
   g==;
X-CSE-ConnectionGUID: JhizWMvIQYaDX6V3v8CJsw==
X-CSE-MsgGUID: TAgaNe1VR0qoq3PCRsrFjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="87713738"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="87713738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 13:17:18 -0700
X-CSE-ConnectionGUID: RmH/csCUSJmej0srIvjhdw==
X-CSE-MsgGUID: GW77Tu2sT42HesTrb7xuEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="277687927"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jul 2026 13:17:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wg6na-00000000DFv-2nkl;
	Sat, 04 Jul 2026 20:17:14 +0000
Date: Sun, 05 Jul 2026 04:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/send.c:8282 btrfs_ioctl_send() error: we previously
 assumed 'sctx' could be null (see line 8272)
Message-ID: <202607050402.pML6Hy8Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Will Deacon <will@kernel.org>
CC: David Laight <david.laight.linux@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1e9cdc2ea15adf4a821eefedabf6c0c8cf0b6a55
commit: 773b24bcedc16a4a29e8579d66ec67ca7aa0014f arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r073-20260704 (https://download.01.org/0day-ci/archive/20260705/202607050402.pML6Hy8Q-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 773b24bcedc1 ("arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607050402.pML6Hy8Q-lkp@intel.com/

smatch warnings:
fs/btrfs/send.c:8282 btrfs_ioctl_send() error: we previously assumed 'sctx' could be null (see line 8272)

vim +/sctx +8282 fs/btrfs/send.c

62d54f3a7fa27e Filipe Manana             2019-04-22  7978  
4e043cd196c85b David Sterba              2025-03-03  7979  long btrfs_ioctl_send(struct btrfs_root *send_root, const struct btrfs_ioctl_send_args *arg)
31db9f7c23fbf7 Alexander Block           2012-07-25  7980  {
31db9f7c23fbf7 Alexander Block           2012-07-25  7981  	int ret = 0;
0b246afa62b0cf Jeff Mahoney              2016-06-22  7982  	struct btrfs_fs_info *fs_info = send_root->fs_info;
31db9f7c23fbf7 Alexander Block           2012-07-25  7983  	struct btrfs_root *clone_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  7984  	struct send_ctx *sctx = NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  7985  	u32 i;
31db9f7c23fbf7 Alexander Block           2012-07-25  7986  	u64 *clone_sources_tmp = NULL;
2c68653787f91c David Sterba              2013-12-16  7987  	int clone_sources_to_rollback = 0;
bae12df966f0e1 Denis Efremov             2020-09-21  7988  	size_t alloc_size;
896c14f97f700a Wang Shilong              2014-01-07  7989  	int sort_clone_roots = 0;
3e49363be6330f Filipe Manana             2023-01-11  7990  	struct btrfs_lru_cache_entry *entry;
3e49363be6330f Filipe Manana             2023-01-11  7991  	struct btrfs_lru_cache_entry *tmp;
31db9f7c23fbf7 Alexander Block           2012-07-25  7992  
31db9f7c23fbf7 Alexander Block           2012-07-25  7993  	if (!capable(CAP_SYS_ADMIN))
31db9f7c23fbf7 Alexander Block           2012-07-25  7994  		return -EPERM;
31db9f7c23fbf7 Alexander Block           2012-07-25  7995  
2c68653787f91c David Sterba              2013-12-16  7996  	/*
2c68653787f91c David Sterba              2013-12-16  7997  	 * The subvolume must remain read-only during send, protect against
521e0546c970c3 David Sterba              2014-04-15  7998  	 * making it RW. This also protects against deletion.
2c68653787f91c David Sterba              2013-12-16  7999  	 */
2c68653787f91c David Sterba              2013-12-16  8000  	spin_lock(&send_root->root_item_lock);
dc058f5fda091a Filipe Manana             2024-11-06  8001  	/*
dc058f5fda091a Filipe Manana             2024-11-06  8002  	 * Unlikely but possible, if the subvolume is marked for deletion but
dc058f5fda091a Filipe Manana             2024-11-06  8003  	 * is slow to remove the directory entry, send can still be started.
dc058f5fda091a Filipe Manana             2024-11-06  8004  	 */
dc058f5fda091a Filipe Manana             2024-11-06  8005  	if (btrfs_root_dead(send_root)) {
dc058f5fda091a Filipe Manana             2024-11-06  8006  		spin_unlock(&send_root->root_item_lock);
dc058f5fda091a Filipe Manana             2024-11-06  8007  		return -EPERM;
dc058f5fda091a Filipe Manana             2024-11-06  8008  	}
e82c936293aafb Filipe Manana             2024-11-06  8009  	/* Userspace tools do the checks and warn the user if it's not RO. */
e82c936293aafb Filipe Manana             2024-11-06  8010  	if (!btrfs_root_readonly(send_root)) {
e82c936293aafb Filipe Manana             2024-11-06  8011  		spin_unlock(&send_root->root_item_lock);
e82c936293aafb Filipe Manana             2024-11-06  8012  		return -EPERM;
e82c936293aafb Filipe Manana             2024-11-06  8013  	}
e82c936293aafb Filipe Manana             2024-11-06  8014  	if (send_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8015  		dedupe_in_progress_warn(send_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8016  		spin_unlock(&send_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  8017  		return -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8018  	}
2c68653787f91c David Sterba              2013-12-16  8019  	send_root->send_in_progress++;
2c68653787f91c David Sterba              2013-12-16  8020  	spin_unlock(&send_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8021  
457ae7268b29c3 Dan Carpenter             2017-03-17  8022  	/*
457ae7268b29c3 Dan Carpenter             2017-03-17  8023  	 * Check that we don't overflow at later allocations, we request
457ae7268b29c3 Dan Carpenter             2017-03-17  8024  	 * clone_sources_count + 1 items, and compare to unsigned long inside
33e17b3f5ab74a David Sterba              2023-01-24  8025  	 * access_ok. Also set an upper limit for allocation size so this can't
33e17b3f5ab74a David Sterba              2023-01-24  8026  	 * easily exhaust memory. Max number of clone sources is about 200K.
457ae7268b29c3 Dan Carpenter             2017-03-17  8027  	 */
33e17b3f5ab74a David Sterba              2023-01-24  8028  	if (arg->clone_sources_count > SZ_8M / sizeof(struct clone_root)) {
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8029  		ret = -EINVAL;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8030  		goto out;
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8031  	}
f5ecec3ce21f70 Dan Carpenter             2016-04-13  8032  
c2c71324ecb471 Stefan Behrens            2013-04-10  8033  	if (arg->flags & ~BTRFS_SEND_FLAG_MASK) {
f884a9f9e59206 David Sterba              2024-01-10  8034  		ret = -EOPNOTSUPP;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8035  		goto out;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8036  	}
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8037  
bf4afc53b77aea Linus Torvalds            2026-02-21  8038  	sctx = kzalloc_obj(struct send_ctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8039  	if (!sctx) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8040  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8041  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8042  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8043  
fc746acb7aa9ae Filipe Manana             2025-02-13  8044  	init_path(&sctx->cur_inode_path);
31db9f7c23fbf7 Alexander Block           2012-07-25  8045  	INIT_LIST_HEAD(&sctx->new_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  8046  	INIT_LIST_HEAD(&sctx->deleted_refs);
31db9f7c23fbf7 Alexander Block           2012-07-25  8047  
c48545debfff56 Filipe Manana             2023-01-11  8048  	btrfs_lru_cache_init(&sctx->name_cache, SEND_MAX_NAME_CACHE_SIZE);
90b90d4ac03cba Filipe Manana             2023-01-11  8049  	btrfs_lru_cache_init(&sctx->backref_cache, SEND_MAX_BACKREF_CACHE_SIZE);
e8a7f49d9bfce2 Filipe Manana             2023-01-11  8050  	btrfs_lru_cache_init(&sctx->dir_created_cache,
e8a7f49d9bfce2 Filipe Manana             2023-01-11  8051  			     SEND_MAX_DIR_CREATED_CACHE_SIZE);
3e49363be6330f Filipe Manana             2023-01-11  8052  	/*
3e49363be6330f Filipe Manana             2023-01-11  8053  	 * This cache is periodically trimmed to a fixed size elsewhere, see
3e49363be6330f Filipe Manana             2023-01-11  8054  	 * cache_dir_utimes() and trim_dir_utimes_cache().
3e49363be6330f Filipe Manana             2023-01-11  8055  	 */
3e49363be6330f Filipe Manana             2023-01-11  8056  	btrfs_lru_cache_init(&sctx->dir_utimes_cache, 0);
66d04209e5a8d3 Filipe Manana             2022-11-01  8057  
d307d2f35ca5c5 Filipe Manana             2023-01-11  8058  	sctx->pending_dir_moves = RB_ROOT;
d307d2f35ca5c5 Filipe Manana             2023-01-11  8059  	sctx->waiting_dir_moves = RB_ROOT;
d307d2f35ca5c5 Filipe Manana             2023-01-11  8060  	sctx->orphan_dirs = RB_ROOT;
d307d2f35ca5c5 Filipe Manana             2023-01-11  8061  	sctx->rbtree_new_refs = RB_ROOT;
d307d2f35ca5c5 Filipe Manana             2023-01-11  8062  	sctx->rbtree_deleted_refs = RB_ROOT;
d307d2f35ca5c5 Filipe Manana             2023-01-11  8063  
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8064  	sctx->flags = arg->flags;
cb95e7bf7ba481 Mark Fasheh               2013-02-04  8065  
e77fbf990316d4 David Sterba              2021-10-22  8066  	if (arg->flags & BTRFS_SEND_FLAG_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  8067  		if (arg->version > BTRFS_SEND_STREAM_VERSION) {
e77fbf990316d4 David Sterba              2021-10-22  8068  			ret = -EPROTO;
e77fbf990316d4 David Sterba              2021-10-22  8069  			goto out;
e77fbf990316d4 David Sterba              2021-10-22  8070  		}
e77fbf990316d4 David Sterba              2021-10-22  8071  		/* Zero means "use the highest version" */
e77fbf990316d4 David Sterba              2021-10-22  8072  		sctx->proto = arg->version ?: BTRFS_SEND_STREAM_VERSION;
e77fbf990316d4 David Sterba              2021-10-22  8073  	} else {
e77fbf990316d4 David Sterba              2021-10-22  8074  		sctx->proto = 1;
e77fbf990316d4 David Sterba              2021-10-22  8075  	}
d6815592806f48 Omar Sandoval             2022-03-17  8076  	if ((arg->flags & BTRFS_SEND_FLAG_COMPRESSED) && sctx->proto < 2) {
d6815592806f48 Omar Sandoval             2022-03-17  8077  		ret = -EINVAL;
d6815592806f48 Omar Sandoval             2022-03-17  8078  		goto out;
d6815592806f48 Omar Sandoval             2022-03-17  8079  	}
e77fbf990316d4 David Sterba              2021-10-22  8080  
31db9f7c23fbf7 Alexander Block           2012-07-25  8081  	sctx->send_filp = fget(arg->send_fd);
0ac1d13a55eb37 Jann Horn                 2023-11-24  8082  	if (!sctx->send_filp || !(sctx->send_filp->f_mode & FMODE_WRITE)) {
ecc7ada77b5cd1 Tsutomu Itoh              2013-04-19  8083  		ret = -EBADF;
31db9f7c23fbf7 Alexander Block           2012-07-25  8084  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8085  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8086  
31db9f7c23fbf7 Alexander Block           2012-07-25  8087  	sctx->send_root = send_root;
31db9f7c23fbf7 Alexander Block           2012-07-25  8088  	sctx->clone_roots_cnt = arg->clone_sources_count;
31db9f7c23fbf7 Alexander Block           2012-07-25  8089  
a4b333f2277b13 Omar Sandoval             2022-04-04  8090  	if (sctx->proto >= 2) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8091  		u32 send_buf_num_pages;
a4b333f2277b13 Omar Sandoval             2022-04-04  8092  
875c627c5f2045 Wang Yugui                2022-10-19  8093  		sctx->send_max_size = BTRFS_SEND_BUF_SIZE_V2;
a4b333f2277b13 Omar Sandoval             2022-04-04  8094  		sctx->send_buf = vmalloc(sctx->send_max_size);
a4b333f2277b13 Omar Sandoval             2022-04-04  8095  		if (!sctx->send_buf) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8096  			ret = -ENOMEM;
a4b333f2277b13 Omar Sandoval             2022-04-04  8097  			goto out;
a4b333f2277b13 Omar Sandoval             2022-04-04  8098  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8099  		send_buf_num_pages = sctx->send_max_size >> PAGE_SHIFT;
69050f8d6d075d Kees Cook                 2026-02-20  8100  		sctx->send_buf_pages = kzalloc_objs(*sctx->send_buf_pages,
189f164e573e18 Kees Cook                 2026-02-21  8101  						    send_buf_num_pages);
a4b333f2277b13 Omar Sandoval             2022-04-04  8102  		if (!sctx->send_buf_pages) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8103  			ret = -ENOMEM;
a4b333f2277b13 Omar Sandoval             2022-04-04  8104  			goto out;
a4b333f2277b13 Omar Sandoval             2022-04-04  8105  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8106  		for (i = 0; i < send_buf_num_pages; i++) {
a4b333f2277b13 Omar Sandoval             2022-04-04  8107  			sctx->send_buf_pages[i] =
a4b333f2277b13 Omar Sandoval             2022-04-04  8108  				vmalloc_to_page(sctx->send_buf + (i << PAGE_SHIFT));
a4b333f2277b13 Omar Sandoval             2022-04-04  8109  		}
a4b333f2277b13 Omar Sandoval             2022-04-04  8110  	} else {
b7c14f23fb604f Omar Sandoval             2022-03-17  8111  		sctx->send_max_size = BTRFS_SEND_BUF_SIZE_V1;
752ade68cbd81d Michal Hocko              2017-05-08  8112  		sctx->send_buf = kvmalloc(sctx->send_max_size, GFP_KERNEL);
a4b333f2277b13 Omar Sandoval             2022-04-04  8113  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8114  	if (!sctx->send_buf) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8115  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8116  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8117  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8118  
69050f8d6d075d Kees Cook                 2026-02-20  8119  	sctx->clone_roots = kvzalloc_objs(*sctx->clone_roots,
189f164e573e18 Kees Cook                 2026-02-21  8120  					  arg->clone_sources_count + 1);
31db9f7c23fbf7 Alexander Block           2012-07-25  8121  	if (!sctx->clone_roots) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8122  		ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8123  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8124  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8125  
bae12df966f0e1 Denis Efremov             2020-09-21  8126  	alloc_size = array_size(sizeof(*arg->clone_sources),
bae12df966f0e1 Denis Efremov             2020-09-21  8127  				arg->clone_sources_count);
e55d1153dbf484 David Sterba              2016-04-11  8128  
31db9f7c23fbf7 Alexander Block           2012-07-25  8129  	if (arg->clone_sources_count) {
752ade68cbd81d Michal Hocko              2017-05-08  8130  		clone_sources_tmp = kvmalloc(alloc_size, GFP_KERNEL);
31db9f7c23fbf7 Alexander Block           2012-07-25  8131  		if (!clone_sources_tmp) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8132  			ret = -ENOMEM;
31db9f7c23fbf7 Alexander Block           2012-07-25  8133  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8134  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  8135  
31db9f7c23fbf7 Alexander Block           2012-07-25  8136  		ret = copy_from_user(clone_sources_tmp, arg->clone_sources,
e55d1153dbf484 David Sterba              2016-04-11  8137  				alloc_size);
31db9f7c23fbf7 Alexander Block           2012-07-25  8138  		if (ret) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8139  			ret = -EFAULT;
31db9f7c23fbf7 Alexander Block           2012-07-25  8140  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8141  		}
31db9f7c23fbf7 Alexander Block           2012-07-25  8142  
31db9f7c23fbf7 Alexander Block           2012-07-25  8143  		for (i = 0; i < arg->clone_sources_count; i++) {
56e9357a1e8167 David Sterba              2020-05-15  8144  			clone_root = btrfs_get_fs_root(fs_info,
56e9357a1e8167 David Sterba              2020-05-15  8145  						clone_sources_tmp[i], true);
31db9f7c23fbf7 Alexander Block           2012-07-25  8146  			if (IS_ERR(clone_root)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8147  				ret = PTR_ERR(clone_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8148  				goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8149  			}
2c68653787f91c David Sterba              2013-12-16  8150  			spin_lock(&clone_root->root_item_lock);
5cc2b17e80cf57 Filipe Manana             2015-03-02  8151  			if (!btrfs_root_readonly(clone_root) ||
5cc2b17e80cf57 Filipe Manana             2015-03-02  8152  			    btrfs_root_dead(clone_root)) {
2c68653787f91c David Sterba              2013-12-16  8153  				spin_unlock(&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  8154  				btrfs_put_root(clone_root);
2c68653787f91c David Sterba              2013-12-16  8155  				ret = -EPERM;
2c68653787f91c David Sterba              2013-12-16  8156  				goto out;
2c68653787f91c David Sterba              2013-12-16  8157  			}
62d54f3a7fa27e Filipe Manana             2019-04-22  8158  			if (clone_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8159  				dedupe_in_progress_warn(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8160  				spin_unlock(&clone_root->root_item_lock);
0024652895e347 Josef Bacik               2020-01-24  8161  				btrfs_put_root(clone_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8162  				ret = -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8163  				goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  8164  			}
2f1f465ae6da24 Filipe Manana             2015-03-02  8165  			clone_root->send_in_progress++;
2c68653787f91c David Sterba              2013-12-16  8166  			spin_unlock(&clone_root->root_item_lock);
18f687d5384493 Wang Shilong              2014-01-07  8167  
31db9f7c23fbf7 Alexander Block           2012-07-25  8168  			sctx->clone_roots[i].root = clone_root;
2f1f465ae6da24 Filipe Manana             2015-03-02  8169  			clone_sources_to_rollback = i + 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  8170  		}
2f91306a378099 David Sterba              2016-04-11  8171  		kvfree(clone_sources_tmp);
31db9f7c23fbf7 Alexander Block           2012-07-25  8172  		clone_sources_tmp = NULL;
31db9f7c23fbf7 Alexander Block           2012-07-25  8173  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8174  
31db9f7c23fbf7 Alexander Block           2012-07-25  8175  	if (arg->parent_root) {
56e9357a1e8167 David Sterba              2020-05-15  8176  		sctx->parent_root = btrfs_get_fs_root(fs_info, arg->parent_root,
56e9357a1e8167 David Sterba              2020-05-15  8177  						      true);
b1b195969fe6d9 Stefan Behrens            2013-05-13  8178  		if (IS_ERR(sctx->parent_root)) {
b1b195969fe6d9 Stefan Behrens            2013-05-13  8179  			ret = PTR_ERR(sctx->parent_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8180  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8181  		}
18f687d5384493 Wang Shilong              2014-01-07  8182  
2c68653787f91c David Sterba              2013-12-16  8183  		spin_lock(&sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8184  		sctx->parent_root->send_in_progress++;
521e0546c970c3 David Sterba              2014-04-15  8185  		if (!btrfs_root_readonly(sctx->parent_root) ||
521e0546c970c3 David Sterba              2014-04-15  8186  				btrfs_root_dead(sctx->parent_root)) {
2c68653787f91c David Sterba              2013-12-16  8187  			spin_unlock(&sctx->parent_root->root_item_lock);
2c68653787f91c David Sterba              2013-12-16  8188  			ret = -EPERM;
2c68653787f91c David Sterba              2013-12-16  8189  			goto out;
2c68653787f91c David Sterba              2013-12-16  8190  		}
62d54f3a7fa27e Filipe Manana             2019-04-22  8191  		if (sctx->parent_root->dedupe_in_progress) {
62d54f3a7fa27e Filipe Manana             2019-04-22  8192  			dedupe_in_progress_warn(sctx->parent_root);
62d54f3a7fa27e Filipe Manana             2019-04-22  8193  			spin_unlock(&sctx->parent_root->root_item_lock);
62d54f3a7fa27e Filipe Manana             2019-04-22  8194  			ret = -EAGAIN;
62d54f3a7fa27e Filipe Manana             2019-04-22  8195  			goto out;
62d54f3a7fa27e Filipe Manana             2019-04-22  8196  		}
2c68653787f91c David Sterba              2013-12-16  8197  		spin_unlock(&sctx->parent_root->root_item_lock);
31db9f7c23fbf7 Alexander Block           2012-07-25  8198  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8199  
31db9f7c23fbf7 Alexander Block           2012-07-25  8200  	/*
31db9f7c23fbf7 Alexander Block           2012-07-25  8201  	 * Clones from send_root are allowed, but only if the clone source
31db9f7c23fbf7 Alexander Block           2012-07-25  8202  	 * is behind the current send position. This is checked while searching
31db9f7c23fbf7 Alexander Block           2012-07-25  8203  	 * for possible clone sources.
31db9f7c23fbf7 Alexander Block           2012-07-25  8204  	 */
6f9a3da5da9e7e Josef Bacik               2020-01-24  8205  	sctx->clone_roots[sctx->clone_roots_cnt++].root =
0024652895e347 Josef Bacik               2020-01-24  8206  		btrfs_grab_root(sctx->send_root);
31db9f7c23fbf7 Alexander Block           2012-07-25  8207  
31db9f7c23fbf7 Alexander Block           2012-07-25  8208  	/* We do a bsearch later */
31db9f7c23fbf7 Alexander Block           2012-07-25  8209  	sort(sctx->clone_roots, sctx->clone_roots_cnt,
31db9f7c23fbf7 Alexander Block           2012-07-25  8210  			sizeof(*sctx->clone_roots), __clone_root_cmp_sort,
31db9f7c23fbf7 Alexander Block           2012-07-25  8211  			NULL);
896c14f97f700a Wang Shilong              2014-01-07  8212  	sort_clone_roots = 1;
31db9f7c23fbf7 Alexander Block           2012-07-25  8213  
9f89d5de8631c7 Filipe Manana             2019-04-15  8214  	ret = flush_delalloc_roots(sctx);
9f89d5de8631c7 Filipe Manana             2019-04-15  8215  	if (ret)
9f89d5de8631c7 Filipe Manana             2019-04-15  8216  		goto out;
9f89d5de8631c7 Filipe Manana             2019-04-15  8217  
e5fa8f865b3324 Filipe Manana             2014-10-21  8218  	ret = ensure_commit_roots_uptodate(sctx);
e5fa8f865b3324 Filipe Manana             2014-10-21  8219  	if (ret)
e5fa8f865b3324 Filipe Manana             2014-10-21  8220  		goto out;
e5fa8f865b3324 Filipe Manana             2014-10-21  8221  
31db9f7c23fbf7 Alexander Block           2012-07-25  8222  	ret = send_subvol(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8223  	if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8224  		goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8225  
3e49363be6330f Filipe Manana             2023-01-11  8226  	btrfs_lru_cache_for_each_entry_safe(&sctx->dir_utimes_cache, entry, tmp) {
3e49363be6330f Filipe Manana             2023-01-11  8227  		ret = send_utimes(sctx, entry->key, entry->gen);
3e49363be6330f Filipe Manana             2023-01-11  8228  		if (ret < 0)
3e49363be6330f Filipe Manana             2023-01-11  8229  			goto out;
3e49363be6330f Filipe Manana             2023-01-11  8230  		btrfs_lru_cache_remove(&sctx->dir_utimes_cache, entry);
3e49363be6330f Filipe Manana             2023-01-11  8231  	}
3e49363be6330f Filipe Manana             2023-01-11  8232  
c2c71324ecb471 Stefan Behrens            2013-04-10  8233  	if (!(sctx->flags & BTRFS_SEND_FLAG_OMIT_END_CMD)) {
31db9f7c23fbf7 Alexander Block           2012-07-25  8234  		ret = begin_cmd(sctx, BTRFS_SEND_C_END);
31db9f7c23fbf7 Alexander Block           2012-07-25  8235  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8236  			goto out;
31db9f7c23fbf7 Alexander Block           2012-07-25  8237  		ret = send_cmd(sctx);
31db9f7c23fbf7 Alexander Block           2012-07-25  8238  		if (ret < 0)
31db9f7c23fbf7 Alexander Block           2012-07-25  8239  			goto out;
c2c71324ecb471 Stefan Behrens            2013-04-10  8240  	}
31db9f7c23fbf7 Alexander Block           2012-07-25  8241  
31db9f7c23fbf7 Alexander Block           2012-07-25  8242  out:
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8243  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->pending_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8244  	while (sctx && !RB_EMPTY_ROOT(&sctx->pending_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8245  		struct rb_node *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8246  		struct pending_dir_move *pm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8247  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8248  		n = rb_first(&sctx->pending_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8249  		pm = rb_entry(n, struct pending_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8250  		while (!list_empty(&pm->list)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8251  			struct pending_dir_move *pm2;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8252  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8253  			pm2 = list_first_entry(&pm->list,
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8254  					       struct pending_dir_move, list);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8255  			free_pending_move(sctx, pm2);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8256  		}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8257  		free_pending_move(sctx, pm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8258  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8259  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8260  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves));
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8261  	while (sctx && !RB_EMPTY_ROOT(&sctx->waiting_dir_moves)) {
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8262  		struct rb_node *n;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8263  		struct waiting_dir_move *dm;
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8264  
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8265  		n = rb_first(&sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8266  		dm = rb_entry(n, struct waiting_dir_move, node);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8267  		rb_erase(&dm->node, &sctx->waiting_dir_moves);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8268  		kfree(dm);
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8269  	}
9f03740a956d7a Filipe David Borba Manana 2014-01-22  8270  
9dc442143b9874 Filipe Manana             2014-02-19  8271  	WARN_ON(sctx && !ret && !RB_EMPTY_ROOT(&sctx->orphan_dirs));
9dc442143b9874 Filipe Manana             2014-02-19 @8272  	while (sctx && !RB_EMPTY_ROOT(&sctx->orphan_dirs)) {
9dc442143b9874 Filipe Manana             2014-02-19  8273  		struct rb_node *n;
9dc442143b9874 Filipe Manana             2014-02-19  8274  		struct orphan_dir_info *odi;
9dc442143b9874 Filipe Manana             2014-02-19  8275  
9dc442143b9874 Filipe Manana             2014-02-19  8276  		n = rb_first(&sctx->orphan_dirs);
9dc442143b9874 Filipe Manana             2014-02-19  8277  		odi = rb_entry(n, struct orphan_dir_info, node);
9dc442143b9874 Filipe Manana             2014-02-19  8278  		free_orphan_dir_info(sctx, odi);
9dc442143b9874 Filipe Manana             2014-02-19  8279  	}
9dc442143b9874 Filipe Manana             2014-02-19  8280  
896c14f97f700a Wang Shilong              2014-01-07  8281  	if (sort_clone_roots) {
6f9a3da5da9e7e Josef Bacik               2020-01-24 @8282  		for (i = 0; i < sctx->clone_roots_cnt; i++) {

:::::: The code at line 8282 was first introduced by commit
:::::: 6f9a3da5da9e7e59f3a5a5909aab5f680fe919c9 btrfs: hold a ref on the root in btrfs_ioctl_send

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
