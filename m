Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821C92848A8
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660660; cv=none; b=BGrLPyxhFWBObh1yPCmv1pqKBvU4IlNCpet50I+QFS16VXygpQQmWjHBsyYLy0+9yGinhcRHHRyc+BASilOArAqAn9fHTUGMyXGKuRmP2l0QVoQ3TYeL3Bn2rYlwOsLlaz8Sljuy5kihLMCWpAl0VAX/byowKllY19wqhuD7l7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660660; c=relaxed/simple;
	bh=p2OglhVH/tbYVSwY1DXzxQxrAL1k8nhTpVnz5h5fUO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hJq33wEyhoN8WPWs4mG1v+mMhzFInrR8sBmAwgZ8juLyOl7PHZ1zniYv/QACQJ195xCGxsUGIEWIgeDb8HmKY1Ky25cIcHMmV7qfigNC0ROiEwxRUUgeFhCmDiGa0g25cYuKAgKUx+YeAVbSqZyrQfu94jdzhudVGm0coh7eNzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahSXHMj6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahSXHMj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773660658; x=1805196658;
  h=date:from:to:cc:subject:message-id;
  bh=p2OglhVH/tbYVSwY1DXzxQxrAL1k8nhTpVnz5h5fUO0=;
  b=ahSXHMj6eAGx/FFh9em/GeD4Y21UR9Qmh4CrYV6zAiAcwzNDnux/MdFy
   QGpmST2PvtotsVo3dheKvo8R+TCrBjRkNcY6AZqSNXxqR1fnW4OewpXA6
   rQ8W7TtEP1+OaXjTKFAAIaST2l1+b7RvkQpdFwcQvx+2w1jFyqGft61lf
   BqVIbFhijW6cejkTABCmVb1r/5s/nInslHBteBYo0ihytgSXc0Qz5ePeh
   +tiaczjh8Ti7jm++2JHqons5nEuI8rkbMnd4BGbuYnn5/YUbTreQSwMJx
   OV3/1GfVJzU4q5Ggg47KQP9O4V/SE0ICk7BRbq7gN9GdYbgALIslWFEFM
   Q==;
X-CSE-ConnectionGUID: LMdzyi9yS/yw4Euq07T28w==
X-CSE-MsgGUID: nG1cYbYGQ/2HXCXSRyUzXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74645760"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74645760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 04:30:58 -0700
X-CSE-ConnectionGUID: Il4f6bfMSjSaCjuFGg2D7g==
X-CSE-MsgGUID: Y5vtdytBQni0JGGqQOjOjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="244920917"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Mar 2026 04:30:56 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w269u-000000000ac-1FyX;
	Mon, 16 Mar 2026 11:30:54 +0000
Date: Mon, 16 Mar 2026 19:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/namespace.c:5654 do_statmount() error: we previously
 assumed 'ns' could be null (see line 5576)
Message-ID: <202603161917.uicNBDWG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bhavik Sachdev <b.sachdev1904@gmail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
commit: 0e5032237ee5530147fbdf33134297e1490d5ec3 statmount: accept fd as a parameter
date:   3 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 months ago
config: openrisc-randconfig-r073-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161917.uicNBDWG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603161917.uicNBDWG-lkp@intel.com/

New smatch warnings:
fs/namespace.c:5654 do_statmount() error: we previously assumed 'ns' could be null (see line 5576)

Old smatch warnings:
fs/namespace.c:1412 mntput_no_expire() warn: inconsistent returns 'rcu_read'.
fs/namespace.c:2824 may_change_propagation() warn: inconsistent indenting

vim +/ns +5654 fs/namespace.c

d842379313a2c2 Christian Brauner 2024-06-25  5530  
8f6116b5b77b05 Jeff Layton       2025-02-06  5531  /* This must be updated whenever a new flag is added */
8f6116b5b77b05 Jeff Layton       2025-02-06  5532  #define STATMOUNT_SUPPORTED (STATMOUNT_SB_BASIC | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5533  			     STATMOUNT_MNT_BASIC | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5534  			     STATMOUNT_PROPAGATE_FROM | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5535  			     STATMOUNT_MNT_ROOT | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5536  			     STATMOUNT_MNT_POINT | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5537  			     STATMOUNT_FS_TYPE | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5538  			     STATMOUNT_MNT_NS_ID | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5539  			     STATMOUNT_MNT_OPTS | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5540  			     STATMOUNT_FS_SUBTYPE | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5541  			     STATMOUNT_SB_SOURCE | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5542  			     STATMOUNT_OPT_ARRAY | \
8f6116b5b77b05 Jeff Layton       2025-02-06  5543  			     STATMOUNT_OPT_SEC_ARRAY | \
2b3c61b87519ff Dmitry V. Levin   2025-05-12  5544  			     STATMOUNT_SUPPORTED_MASK | \
2b3c61b87519ff Dmitry V. Levin   2025-05-12  5545  			     STATMOUNT_MNT_UIDMAP | \
2b3c61b87519ff Dmitry V. Levin   2025-05-12  5546  			     STATMOUNT_MNT_GIDMAP)
8f6116b5b77b05 Jeff Layton       2025-02-06  5547  
2aec880c1cdf1c Al Viro           2025-08-21  5548  /* locks: namespace_shared */
d842379313a2c2 Christian Brauner 2024-06-25  5549  static int do_statmount(struct kstatmount *s, u64 mnt_id, u64 mnt_ns_id,
0e5032237ee553 Bhavik Sachdev    2025-11-29  5550                          struct file *mnt_file, struct mnt_namespace *ns)
d842379313a2c2 Christian Brauner 2024-06-25  5551  {
46eae99ef73302 Miklos Szeredi    2023-10-25  5552  	int err;
46eae99ef73302 Miklos Szeredi    2023-10-25  5553  
0e5032237ee553 Bhavik Sachdev    2025-11-29  5554  	if (mnt_file) {
0e5032237ee553 Bhavik Sachdev    2025-11-29  5555  		WARN_ON_ONCE(ns != NULL);
0e5032237ee553 Bhavik Sachdev    2025-11-29  5556  
0e5032237ee553 Bhavik Sachdev    2025-11-29  5557  		s->mnt = mnt_file->f_path.mnt;
0e5032237ee553 Bhavik Sachdev    2025-11-29  5558  		ns = real_mount(s->mnt)->mnt_ns;
0e5032237ee553 Bhavik Sachdev    2025-11-29  5559  		if (!ns)
0e5032237ee553 Bhavik Sachdev    2025-11-29  5560  			/*
0e5032237ee553 Bhavik Sachdev    2025-11-29  5561  			 * We can't set mount point and mnt_ns_id since we don't have a
0e5032237ee553 Bhavik Sachdev    2025-11-29  5562  			 * ns for the mount. This can happen if the mount is unmounted
0e5032237ee553 Bhavik Sachdev    2025-11-29  5563  			 * with MNT_DETACH.
0e5032237ee553 Bhavik Sachdev    2025-11-29  5564  			 */
0e5032237ee553 Bhavik Sachdev    2025-11-29  5565  			s->mask &= ~(STATMOUNT_MNT_POINT | STATMOUNT_MNT_NS_ID);
0e5032237ee553 Bhavik Sachdev    2025-11-29  5566  	} else {
d842379313a2c2 Christian Brauner 2024-06-25  5567  		/* Has the namespace already been emptied? */
2f576220cd8129 Christian Brauner 2025-02-21  5568  		if (mnt_ns_id && mnt_ns_empty(ns))
d842379313a2c2 Christian Brauner 2024-06-25  5569  			return -ENOENT;
d842379313a2c2 Christian Brauner 2024-06-25  5570  
d842379313a2c2 Christian Brauner 2024-06-25  5571  		s->mnt = lookup_mnt_in_ns(mnt_id, ns);
d842379313a2c2 Christian Brauner 2024-06-25  5572  		if (!s->mnt)
d842379313a2c2 Christian Brauner 2024-06-25  5573  			return -ENOENT;
0e5032237ee553 Bhavik Sachdev    2025-11-29  5574  	}
d842379313a2c2 Christian Brauner 2024-06-25  5575  
0e5032237ee553 Bhavik Sachdev    2025-11-29 @5576  	if (ns) {
e8c84e2082e693 Christian Brauner 2025-09-19  5577  		err = grab_requested_root(ns, &s->root);
d842379313a2c2 Christian Brauner 2024-06-25  5578  		if (err)
d842379313a2c2 Christian Brauner 2024-06-25  5579  			return err;
d842379313a2c2 Christian Brauner 2024-06-25  5580  
0e5032237ee553 Bhavik Sachdev    2025-11-29  5581  		if (!mnt_file) {
0e5032237ee553 Bhavik Sachdev    2025-11-29  5582  			struct mount *m;
46eae99ef73302 Miklos Szeredi    2023-10-25  5583  			/*
46eae99ef73302 Miklos Szeredi    2023-10-25  5584  			 * Don't trigger audit denials. We just want to determine what
46eae99ef73302 Miklos Szeredi    2023-10-25  5585  			 * mounts to show users.
46eae99ef73302 Miklos Szeredi    2023-10-25  5586  			 */
d842379313a2c2 Christian Brauner 2024-06-25  5587  			m = real_mount(s->mnt);
e8c84e2082e693 Christian Brauner 2025-09-19  5588  			if (!is_path_reachable(m, m->mnt.mnt_root, &s->root) &&
f3107df39df123 Christian Brauner 2024-06-24  5589  			    !ns_capable_noaudit(ns->user_ns, CAP_SYS_ADMIN))
46eae99ef73302 Miklos Szeredi    2023-10-25  5590  				return -EPERM;
0e5032237ee553 Bhavik Sachdev    2025-11-29  5591  		}
0e5032237ee553 Bhavik Sachdev    2025-11-29  5592  	}
46eae99ef73302 Miklos Szeredi    2023-10-25  5593  
46eae99ef73302 Miklos Szeredi    2023-10-25  5594  	err = security_sb_statfs(s->mnt->mnt_root);
46eae99ef73302 Miklos Szeredi    2023-10-25  5595  	if (err)
46eae99ef73302 Miklos Szeredi    2023-10-25  5596  		return err;
46eae99ef73302 Miklos Szeredi    2023-10-25  5597  
a68cb18624503a Christian Brauner 2025-04-16  5598  	/*
a68cb18624503a Christian Brauner 2025-04-16  5599  	 * Note that mount properties in mnt->mnt_flags, mnt->mnt_idmap
a68cb18624503a Christian Brauner 2025-04-16  5600  	 * can change concurrently as we only hold the read-side of the
a68cb18624503a Christian Brauner 2025-04-16  5601  	 * namespace semaphore and mount properties may change with only
a68cb18624503a Christian Brauner 2025-04-16  5602  	 * the mount lock held.
a68cb18624503a Christian Brauner 2025-04-16  5603  	 *
a68cb18624503a Christian Brauner 2025-04-16  5604  	 * We could sample the mount lock sequence counter to detect
a68cb18624503a Christian Brauner 2025-04-16  5605  	 * those changes and retry. But it's not worth it. Worst that
a68cb18624503a Christian Brauner 2025-04-16  5606  	 * happens is that the mnt->mnt_idmap pointer is already changed
a68cb18624503a Christian Brauner 2025-04-16  5607  	 * while mnt->mnt_flags isn't or vica versa. So what.
a68cb18624503a Christian Brauner 2025-04-16  5608  	 *
a68cb18624503a Christian Brauner 2025-04-16  5609  	 * Both mnt->mnt_flags and mnt->mnt_idmap are set and retrieved
a68cb18624503a Christian Brauner 2025-04-16  5610  	 * via READ_ONCE()/WRITE_ONCE() and guard against theoretical
a68cb18624503a Christian Brauner 2025-04-16  5611  	 * torn read/write. That's all we care about right now.
a68cb18624503a Christian Brauner 2025-04-16  5612  	 */
a68cb18624503a Christian Brauner 2025-04-16  5613  	s->idmap = mnt_idmap(s->mnt);
6971beb4ec52ad Christian Brauner 2023-11-19  5614  	if (s->mask & STATMOUNT_MNT_BASIC)
6971beb4ec52ad Christian Brauner 2023-11-19  5615  		statmount_mnt_basic(s);
6971beb4ec52ad Christian Brauner 2023-11-19  5616  
a68cb18624503a Christian Brauner 2025-04-16  5617  	if (s->mask & STATMOUNT_SB_BASIC)
a68cb18624503a Christian Brauner 2025-04-16  5618  		statmount_sb_basic(s);
a68cb18624503a Christian Brauner 2025-04-16  5619  
6971beb4ec52ad Christian Brauner 2023-11-19  5620  	if (s->mask & STATMOUNT_PROPAGATE_FROM)
6971beb4ec52ad Christian Brauner 2023-11-19  5621  		statmount_propagate_from(s);
6971beb4ec52ad Christian Brauner 2023-11-19  5622  
68385d77c05b40 Christian Brauner 2023-11-19  5623  	if (s->mask & STATMOUNT_FS_TYPE)
68385d77c05b40 Christian Brauner 2023-11-19  5624  		err = statmount_string(s, STATMOUNT_FS_TYPE);
46eae99ef73302 Miklos Szeredi    2023-10-25  5625  
68385d77c05b40 Christian Brauner 2023-11-19  5626  	if (!err && s->mask & STATMOUNT_MNT_ROOT)
68385d77c05b40 Christian Brauner 2023-11-19  5627  		err = statmount_string(s, STATMOUNT_MNT_ROOT);
46eae99ef73302 Miklos Szeredi    2023-10-25  5628  
68385d77c05b40 Christian Brauner 2023-11-19  5629  	if (!err && s->mask & STATMOUNT_MNT_POINT)
68385d77c05b40 Christian Brauner 2023-11-19  5630  		err = statmount_string(s, STATMOUNT_MNT_POINT);
46eae99ef73302 Miklos Szeredi    2023-10-25  5631  
f9af549d1fd314 Josef Bacik       2024-06-24  5632  	if (!err && s->mask & STATMOUNT_MNT_OPTS)
f9af549d1fd314 Josef Bacik       2024-06-24  5633  		err = statmount_string(s, STATMOUNT_MNT_OPTS);
f9af549d1fd314 Josef Bacik       2024-06-24  5634  
2f4d4503e9e5ab Miklos Szeredi    2024-11-12  5635  	if (!err && s->mask & STATMOUNT_OPT_ARRAY)
2f4d4503e9e5ab Miklos Szeredi    2024-11-12  5636  		err = statmount_string(s, STATMOUNT_OPT_ARRAY);
2f4d4503e9e5ab Miklos Szeredi    2024-11-12  5637  
aefff51e1c2986 Christian Brauner 2024-11-14  5638  	if (!err && s->mask & STATMOUNT_OPT_SEC_ARRAY)
aefff51e1c2986 Christian Brauner 2024-11-14  5639  		err = statmount_string(s, STATMOUNT_OPT_SEC_ARRAY);
aefff51e1c2986 Christian Brauner 2024-11-14  5640  
ed9d95f691c297 Jeff Layton       2024-11-11  5641  	if (!err && s->mask & STATMOUNT_FS_SUBTYPE)
ed9d95f691c297 Jeff Layton       2024-11-11  5642  		err = statmount_string(s, STATMOUNT_FS_SUBTYPE);
ed9d95f691c297 Jeff Layton       2024-11-11  5643  
44010543fc8bed Jeff Layton       2024-11-11  5644  	if (!err && s->mask & STATMOUNT_SB_SOURCE)
44010543fc8bed Jeff Layton       2024-11-11  5645  		err = statmount_string(s, STATMOUNT_SB_SOURCE);
44010543fc8bed Jeff Layton       2024-11-11  5646  
37c4a9590e1efc Christian Brauner 2025-02-04  5647  	if (!err && s->mask & STATMOUNT_MNT_UIDMAP)
37c4a9590e1efc Christian Brauner 2025-02-04  5648  		err = statmount_string(s, STATMOUNT_MNT_UIDMAP);
37c4a9590e1efc Christian Brauner 2025-02-04  5649  
37c4a9590e1efc Christian Brauner 2025-02-04  5650  	if (!err && s->mask & STATMOUNT_MNT_GIDMAP)
37c4a9590e1efc Christian Brauner 2025-02-04  5651  		err = statmount_string(s, STATMOUNT_MNT_GIDMAP);
37c4a9590e1efc Christian Brauner 2025-02-04  5652  
09b31295f83303 Josef Bacik       2024-06-24  5653  	if (!err && s->mask & STATMOUNT_MNT_NS_ID)
71aacb4c8c3d19 Christian Brauner 2024-06-24 @5654  		statmount_mnt_ns_id(s, ns);
09b31295f83303 Josef Bacik       2024-06-24  5655  
8f6116b5b77b05 Jeff Layton       2025-02-06  5656  	if (!err && s->mask & STATMOUNT_SUPPORTED_MASK) {
8f6116b5b77b05 Jeff Layton       2025-02-06  5657  		s->sm.mask |= STATMOUNT_SUPPORTED_MASK;
8f6116b5b77b05 Jeff Layton       2025-02-06  5658  		s->sm.supported_mask = STATMOUNT_SUPPORTED;
8f6116b5b77b05 Jeff Layton       2025-02-06  5659  	}
8f6116b5b77b05 Jeff Layton       2025-02-06  5660  
68385d77c05b40 Christian Brauner 2023-11-19  5661  	if (err)
68385d77c05b40 Christian Brauner 2023-11-19  5662  		return err;
68385d77c05b40 Christian Brauner 2023-11-19  5663  
8f6116b5b77b05 Jeff Layton       2025-02-06  5664  	/* Are there bits in the return mask not present in STATMOUNT_SUPPORTED? */
8f6116b5b77b05 Jeff Layton       2025-02-06  5665  	WARN_ON_ONCE(~STATMOUNT_SUPPORTED & s->sm.mask);
8f6116b5b77b05 Jeff Layton       2025-02-06  5666  
68385d77c05b40 Christian Brauner 2023-11-19  5667  	return 0;
68385d77c05b40 Christian Brauner 2023-11-19  5668  }
68385d77c05b40 Christian Brauner 2023-11-19  5669  

:::::: The code at line 5654 was first introduced by commit
:::::: 71aacb4c8c3d19da053363a5fe7538a8af082d56 fs: Allow statmount() in foreign mount namespace

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
