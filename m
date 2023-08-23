Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315BC12A
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Aug 2023 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692798083; x=1724334083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQnoKT/fP1tQUT7neioaL9MecEKqcnWuKbgI9LVKUTs=;
  b=KlVxBb6T251dnLrBSkVh2hqs0ypL44fteyA9rAq5nUpOqpj03kF8omTy
   zvIdYQTXJSXNgyf8XHhmo7oKLV+eDOhkEIhl7ngHYhtVMsgL2y5SlIMtT
   A27fGtKymTQpySiXKY0gCDXDazRef/mKzmzmtSvmv8LYOS8GVJZfPnZz/
   fa2aT0ZtHy2AvIyOblo9e5/NvnM+79NkAxO9wh0hqp9NsVcxiLbkWTTpK
   0rALoTgorOWiyeSJisE9FUdO8ypu+2oBmziaHrS3d4g5kRhOQOXr2h5G5
   jd3WrtfxqDd85xhkzOJlOQdZJ4b20sur3qHwhykWK3WHuoll2PdyUV7O0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374135523"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374135523"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 06:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="739782082"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="739782082"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 06:41:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYo6k-0001F6-1e;
	Wed, 23 Aug 2023 13:41:14 +0000
Date: Wed, 23 Aug 2023 21:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:rmap-intent-cleanups 311/407]
 fs/xfs/xfs_imeta_utils.c:167 xfs_imeta_start_dir_update() warn: missing
 error code 'error'
Message-ID: <202308232139.Lh5BLLmW-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   55b33d3f7a00cf89ee5c47dba0a8c0ffe7f1f8bb
commit: ea9de6f697b65f02e13e509091b4f5191ebfa981 [311/407] xfs: read and write metadata inode directory
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r081-20230823 (https://download.01.org/0day-ci/archive/20230823/202308232139.Lh5BLLmW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308232139.Lh5BLLmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308232139.Lh5BLLmW-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_imeta_utils.c:167 xfs_imeta_start_dir_update() warn: missing error code 'error'

vim +/error +167 fs/xfs/xfs_imeta_utils.c

94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  131  
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  132  /*
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  133   * Begin the process of linking a metadata file by allocating transactions
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  134   * and locking whatever resources we're going to need.
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  135   */
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  136  static inline int
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  137  xfs_imeta_start_dir_update(
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  138  	struct xfs_mount		*mp,
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  139  	const struct xfs_imeta_path	*path,
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  140  	struct xfs_inode		*ip,
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  141  	struct xfs_trans_res		*tr_resv,
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  142  	unsigned int			resblks,
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  143  	struct xfs_imeta_update		*upd)
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  144  {
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  145  	int				error;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  146  
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  147  	error = xfs_imeta_init(mp, path, upd);
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  148  	if (error)
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  149  		return error;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  150  
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  151  	upd->ip = ip;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  152  
ea9de6f697b65f Darrick J. Wong 2023-03-06  153  	if (upd->dp) {
ea9de6f697b65f Darrick J. Wong 2023-03-06  154  		int			nospace_error = 0;
ea9de6f697b65f Darrick J. Wong 2023-03-06  155  
ea9de6f697b65f Darrick J. Wong 2023-03-06  156  		error = xfs_trans_alloc_dir(upd->dp, tr_resv, upd->ip,
ea9de6f697b65f Darrick J. Wong 2023-03-06  157  				&resblks, &upd->tp, &nospace_error);
ea9de6f697b65f Darrick J. Wong 2023-03-06  158  		if (error)
ea9de6f697b65f Darrick J. Wong 2023-03-06  159  			goto out_teardown;
ea9de6f697b65f Darrick J. Wong 2023-03-06  160  		if (!resblks) {
ea9de6f697b65f Darrick J. Wong 2023-03-06  161  			/* We don't allow reservationless updates. */
ea9de6f697b65f Darrick J. Wong 2023-03-06  162  			xfs_trans_cancel(upd->tp);
ea9de6f697b65f Darrick J. Wong 2023-03-06  163  			upd->tp = NULL;
ea9de6f697b65f Darrick J. Wong 2023-03-06  164  			xfs_iunlock(upd->dp, XFS_ILOCK_EXCL);
ea9de6f697b65f Darrick J. Wong 2023-03-06  165  			xfs_iunlock(upd->ip, XFS_ILOCK_EXCL);
ea9de6f697b65f Darrick J. Wong 2023-03-06  166  			error = nospace_error;
ea9de6f697b65f Darrick J. Wong 2023-03-06 @167  			goto out_teardown;
ea9de6f697b65f Darrick J. Wong 2023-03-06  168  		}
ea9de6f697b65f Darrick J. Wong 2023-03-06  169  
ea9de6f697b65f Darrick J. Wong 2023-03-06  170  		upd->dp_locked = true;
ea9de6f697b65f Darrick J. Wong 2023-03-06  171  	} else {
ea9de6f697b65f Darrick J. Wong 2023-03-06  172  		error = xfs_trans_alloc_inode(upd->ip, tr_resv, resblks, 0,
ea9de6f697b65f Darrick J. Wong 2023-03-06  173  				false, &upd->tp);
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  174  		if (error)
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  175  			goto out_teardown;
ea9de6f697b65f Darrick J. Wong 2023-03-06  176  	}
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  177  
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  178  	upd->ip_locked = true;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  179  	return 0;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  180  out_teardown:
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  181  	xfs_imeta_teardown(upd, error);
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  182  	return error;
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  183  }
94d1dbc5f4d8ff Darrick J. Wong 2023-03-06  184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
