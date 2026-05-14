Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50C2D876B
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 03:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728230; cv=none; b=rGzIdAqRPD83Zsih/a0K0Iy1Uku9DGZj2M8gC72lpXDmXXFKYbYPpWor4oXDHifrPMskkT3xQ7aU6E0MFI2BbLjIJlMgEa5S7XLPNFrJFdfGNydqQldhzQ35ExxpZSTKjCrBZTH6TkoPKZJuQu+bfSx7Kc7YEefpfM5G1ZxEehU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728230; c=relaxed/simple;
	bh=s8Weg0dBPXlU23le28EbScb9bBSn+4izS0BMf4l702o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Awm33Zk0vGYBTQTd0lCuoUYmzLLK8gyptLZGAs3aXIfS3q6cakZ7C9ezAOblAFAKQTSfUhHrn5h7Rz85WVEMcmVVvvZd8cEKlsEjcn96zmwdEquyLVVJBmW+MO/qy9nRHSQijpv9PEtA+uKXDrxVdTFcW15607imD9qswzzlEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HnHw2fmt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HnHw2fmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778728227; x=1810264227;
  h=date:from:to:cc:subject:message-id;
  bh=s8Weg0dBPXlU23le28EbScb9bBSn+4izS0BMf4l702o=;
  b=HnHw2fmtO3gH+bKZ4i490dzISi3OeMNPPtyCrmF28bvV5TeT8NiKJ1Wk
   bn0NmKX9ofPix2frEd2Shg/HaMJnfpXtQq7d8HXZnrLBwT7BuIP3JGyZv
   vAltcyTr8vHz6oCWONxItNg/ZLg1AW0cJgsl1/vNsjMRKPTXJMtWx6p6m
   xWT4yxfD8z+PZdETWHbau15D+bGnbZEP0HzlWbpng6sY31mCJa/t0NYeB
   E1NKDTP9NWSaPflXFb4YlawxRvixpU7tI6/HdBIMMyNucokNh7vImkhrc
   lKjfe4BISXDdexZI30gEYFzFV+hGsrWY4mf+SH0JDWGKdvdfdxQnSmaNq
   w==;
X-CSE-ConnectionGUID: kuuDrBrER/2djCl+6Hwrsw==
X-CSE-MsgGUID: dHTCQ9ZKSVKCqM2gEkkGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79647049"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79647049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:10:27 -0700
X-CSE-ConnectionGUID: tHdfi7WyTZGyDLhA5rVkhw==
X-CSE-MsgGUID: OJb8c5ckShSw0Bb2mc2xNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235199578"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 May 2026 20:10:25 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMSs-000000005jH-3m9u;
	Thu, 14 May 2026 03:10:22 +0000
Date: Thu, 14 May 2026 11:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 11/43]
 fs/btrfs/fscrypt.c:94 btrfs_fscrypt_set_context() warn: missing error code
 'ret'
Message-ID: <202605141051.5L8RE7r0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Omar Sandoval <osandov@osandov.com>
CC: David Sterba <dsterba@suse.com>
CC: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Daniel Vacek <neelx@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: 4656a0f641c3d3c287316323b2bbdd023c8de0b2 [11/43] btrfs: add inode encryption contexts
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141051.5L8RE7r0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605141051.5L8RE7r0-lkp@intel.com/

smatch warnings:
fs/btrfs/fscrypt.c:94 btrfs_fscrypt_set_context() warn: missing error code 'ret'

vim +/ret +94 fs/btrfs/fscrypt.c

4656a0f641c3d3c Omar Sandoval 2026-05-13   48  
4656a0f641c3d3c Omar Sandoval 2026-05-13   49  static int btrfs_fscrypt_set_context(struct inode *inode, const void *ctx,
4656a0f641c3d3c Omar Sandoval 2026-05-13   50  				     size_t len, void *fs_data)
4656a0f641c3d3c Omar Sandoval 2026-05-13   51  {
4656a0f641c3d3c Omar Sandoval 2026-05-13   52  	struct btrfs_trans_handle *trans = fs_data;
4656a0f641c3d3c Omar Sandoval 2026-05-13   53  	struct btrfs_key key = {
4656a0f641c3d3c Omar Sandoval 2026-05-13   54  		.objectid = btrfs_ino(BTRFS_I(inode)),
4656a0f641c3d3c Omar Sandoval 2026-05-13   55  		.type = BTRFS_FSCRYPT_INODE_CTX_KEY,
4656a0f641c3d3c Omar Sandoval 2026-05-13   56  		.offset = 0,
4656a0f641c3d3c Omar Sandoval 2026-05-13   57  	};
4656a0f641c3d3c Omar Sandoval 2026-05-13   58  	struct btrfs_path *path = NULL;
4656a0f641c3d3c Omar Sandoval 2026-05-13   59  	struct extent_buffer *leaf;
4656a0f641c3d3c Omar Sandoval 2026-05-13   60  	unsigned long ptr;
4656a0f641c3d3c Omar Sandoval 2026-05-13   61  	int ret;
4656a0f641c3d3c Omar Sandoval 2026-05-13   62  
4656a0f641c3d3c Omar Sandoval 2026-05-13   63  	if (!trans)
4656a0f641c3d3c Omar Sandoval 2026-05-13   64  		trans = btrfs_start_transaction(BTRFS_I(inode)->root, 2);
4656a0f641c3d3c Omar Sandoval 2026-05-13   65  	if (IS_ERR(trans))
4656a0f641c3d3c Omar Sandoval 2026-05-13   66  		return PTR_ERR(trans);
4656a0f641c3d3c Omar Sandoval 2026-05-13   67  
4656a0f641c3d3c Omar Sandoval 2026-05-13   68  	path = btrfs_alloc_path();
4656a0f641c3d3c Omar Sandoval 2026-05-13   69  	if (!path) {
4656a0f641c3d3c Omar Sandoval 2026-05-13   70  		ret = -ENOMEM;
4656a0f641c3d3c Omar Sandoval 2026-05-13   71  		goto out_err;
4656a0f641c3d3c Omar Sandoval 2026-05-13   72  	}
4656a0f641c3d3c Omar Sandoval 2026-05-13   73  
4656a0f641c3d3c Omar Sandoval 2026-05-13   74  	ret = btrfs_search_slot(trans, BTRFS_I(inode)->root, &key, path, 0, 1);
4656a0f641c3d3c Omar Sandoval 2026-05-13   75  	if (ret < 0)
4656a0f641c3d3c Omar Sandoval 2026-05-13   76  		goto out_err;
4656a0f641c3d3c Omar Sandoval 2026-05-13   77  
4656a0f641c3d3c Omar Sandoval 2026-05-13   78  	if (ret > 0) {
4656a0f641c3d3c Omar Sandoval 2026-05-13   79  		btrfs_release_path(path);
4656a0f641c3d3c Omar Sandoval 2026-05-13   80  		ret = btrfs_insert_empty_item(trans, BTRFS_I(inode)->root, path, &key, len);
4656a0f641c3d3c Omar Sandoval 2026-05-13   81  		if (ret)
4656a0f641c3d3c Omar Sandoval 2026-05-13   82  			goto out_err;
4656a0f641c3d3c Omar Sandoval 2026-05-13   83  	}
4656a0f641c3d3c Omar Sandoval 2026-05-13   84  
4656a0f641c3d3c Omar Sandoval 2026-05-13   85  	leaf = path->nodes[0];
4656a0f641c3d3c Omar Sandoval 2026-05-13   86  	ptr = btrfs_item_ptr_offset(leaf, path->slots[0]);
4656a0f641c3d3c Omar Sandoval 2026-05-13   87  
4656a0f641c3d3c Omar Sandoval 2026-05-13   88  	len = min_t(size_t, len, btrfs_item_size(leaf, path->slots[0]));
4656a0f641c3d3c Omar Sandoval 2026-05-13   89  	write_extent_buffer(leaf, ctx, ptr, len);
4656a0f641c3d3c Omar Sandoval 2026-05-13   90  	btrfs_mark_buffer_dirty(trans, leaf);
4656a0f641c3d3c Omar Sandoval 2026-05-13   91  	btrfs_release_path(path);
4656a0f641c3d3c Omar Sandoval 2026-05-13   92  
4656a0f641c3d3c Omar Sandoval 2026-05-13   93  	if (fs_data)
4656a0f641c3d3c Omar Sandoval 2026-05-13  @94  		goto out_err;
4656a0f641c3d3c Omar Sandoval 2026-05-13   95  
4656a0f641c3d3c Omar Sandoval 2026-05-13   96  	BTRFS_I(inode)->flags |= BTRFS_INODE_ENCRYPT;
4656a0f641c3d3c Omar Sandoval 2026-05-13   97  	btrfs_sync_inode_flags_to_i_flags(BTRFS_I(inode));
4656a0f641c3d3c Omar Sandoval 2026-05-13   98  	inode_inc_iversion(inode);
4656a0f641c3d3c Omar Sandoval 2026-05-13   99  	inode_set_ctime_current(inode);
4656a0f641c3d3c Omar Sandoval 2026-05-13  100  	ret = btrfs_update_inode(trans, BTRFS_I(inode));
4656a0f641c3d3c Omar Sandoval 2026-05-13  101  	if (ret)
4656a0f641c3d3c Omar Sandoval 2026-05-13  102  		goto out_abort;
4656a0f641c3d3c Omar Sandoval 2026-05-13  103  	btrfs_free_path(path);
4656a0f641c3d3c Omar Sandoval 2026-05-13  104  	btrfs_end_transaction(trans);
4656a0f641c3d3c Omar Sandoval 2026-05-13  105  	return 0;
4656a0f641c3d3c Omar Sandoval 2026-05-13  106  out_abort:
4656a0f641c3d3c Omar Sandoval 2026-05-13  107  	btrfs_abort_transaction(trans, ret);
4656a0f641c3d3c Omar Sandoval 2026-05-13  108  out_err:
4656a0f641c3d3c Omar Sandoval 2026-05-13  109  	if (!fs_data)
4656a0f641c3d3c Omar Sandoval 2026-05-13  110  		btrfs_end_transaction(trans);
4656a0f641c3d3c Omar Sandoval 2026-05-13  111  	btrfs_free_path(path);
4656a0f641c3d3c Omar Sandoval 2026-05-13  112  	return ret;
4656a0f641c3d3c Omar Sandoval 2026-05-13  113  }
4656a0f641c3d3c Omar Sandoval 2026-05-13  114  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
