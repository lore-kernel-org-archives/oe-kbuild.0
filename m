Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347811198
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jofW7G3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701244224; x=1732780224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cYRs5AeBDDKH0aNL+SvloXWNJa3l5BWn3Tw1ju58qMU=;
  b=jofW7G3WDsVkFgv8bqKQJ2YV7XTbX89kd17W0enkxE8IeXuwCdRoatQH
   QOIIjVh9VvyUv85HgbaJc/i3NZno2Rs/YiuIayqzihy4yIwYE2D99LM+h
   K6Mz6zyCwYyLp8HnJXFapsdhCht+QByD7g/Ii7wFIq7e1ZWn3XFLm/Tgl
   rcYj2n+lVXL3zgU+HxFB3ZvnZcRR/ZKMYD8pevZLUMB45Ynacpbo34Zyc
   ZF49lzjWW0ohcDrWUCnDpJlK2fQfEfpRcF+AZWjabxo4qWHGMMcYulZPp
   ykLcSkZY/tWWL0ROg47fWWrJvEoK1tmO/LGy5RsFRzs4T8LvxK90DUdNS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6385868"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="6385868"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 23:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772596907"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772596907"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Nov 2023 23:50:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8FKt-0008kb-04;
	Wed, 29 Nov 2023 07:50:19 +0000
Date: Wed, 29 Nov 2023 15:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [djwong-xfs:reconstruct-defer-work-6.7 5/7]
 fs/xfs/xfs_attr_item.c:585:17: sparse: sparse: typename in expression
Message-ID: <202311291248.jV8lJyud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/xfs/xfs_attr_item.c:585:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git reconstruct-defer-work-6.7
head:   6b40cbdb0348d7c82b1729fba6d5352da1b949d3
commit: 36ee9012d43da805843689ce1c3e8a493a820d22 [5/7] xfs: recreate work items when recovering intent items
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-062-20231129 (https://download.01.org/0day-ci/archive/20231129/202311291248.jV8lJyud-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291248.jV8lJyud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311291248.jV8lJyud-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_attr_item.c:585:17: sparse: sparse: typename in expression
   fs/xfs/xfs_attr_item.c:585:41: sparse: sparse: Expected ; at end of statement
   fs/xfs/xfs_attr_item.c:585:41: sparse: sparse: got local
   fs/xfs/xfs_attr_item.c:585:17: sparse: sparse: undefined identifier 'int'
   fs/xfs/xfs_attr_item.c:589:57: sparse: sparse: undefined identifier 'local'

vim +585 fs/xfs/xfs_attr_item.c

fd920008784ead Allison Henderson 2022-05-04  541  
36ee9012d43da8 Darrick J. Wong   2023-11-22  542  static inline struct xfs_attr_intent *
36ee9012d43da8 Darrick J. Wong   2023-11-22  543  xfs_attri_recover_work(
36ee9012d43da8 Darrick J. Wong   2023-11-22  544  	struct xfs_mount		*mp,
3ab87e1f7941db Darrick J. Wong   2023-11-22  545  	struct xfs_defer_pending	*dfp,
36ee9012d43da8 Darrick J. Wong   2023-11-22  546  	struct xfs_attri_log_format	*attrp,
36ee9012d43da8 Darrick J. Wong   2023-11-22  547  	struct xfs_inode		*ip,
36ee9012d43da8 Darrick J. Wong   2023-11-22  548  	struct xfs_attri_log_nameval	*nv)
1d08e11d04d293 Allison Henderson 2022-05-09  549  {
e3c5de22026fda Darrick J. Wong   2022-05-22  550  	struct xfs_attr_intent		*attr;
1d08e11d04d293 Allison Henderson 2022-05-09  551  	struct xfs_da_args		*args;
1d08e11d04d293 Allison Henderson 2022-05-09  552  
e3c5de22026fda Darrick J. Wong   2022-05-22  553  	attr = kmem_zalloc(sizeof(struct xfs_attr_intent) +
1d08e11d04d293 Allison Henderson 2022-05-09  554  			   sizeof(struct xfs_da_args), KM_NOFS);
1d08e11d04d293 Allison Henderson 2022-05-09  555  	args = (struct xfs_da_args *)(attr + 1);
1d08e11d04d293 Allison Henderson 2022-05-09  556  
36ee9012d43da8 Darrick J. Wong   2023-11-22  557  	INIT_LIST_HEAD(&attr->xattri_list);
d68c51e9a4095b Allison Henderson 2022-05-11  558  	attr->xattri_da_args = args;
356cb708ea1886 Darrick J. Wong   2022-05-20  559  	attr->xattri_op_flags = attrp->alfi_op_flags &
b53d212b4b5c29 Darrick J. Wong   2022-05-22  560  						XFS_ATTRI_OP_FLAGS_TYPE_MASK;
1d08e11d04d293 Allison Henderson 2022-05-09  561  
4183e4f27f402d Darrick J. Wong   2022-05-23  562  	/*
4183e4f27f402d Darrick J. Wong   2022-05-23  563  	 * We're reconstructing the deferred work state structure from the
4183e4f27f402d Darrick J. Wong   2022-05-23  564  	 * recovered log item.  Grab a reference to the name/value buffer and
4183e4f27f402d Darrick J. Wong   2022-05-23  565  	 * attach it to the new work state.
4183e4f27f402d Darrick J. Wong   2022-05-23  566  	 */
4183e4f27f402d Darrick J. Wong   2022-05-23  567  	attr->xattri_nameval = xfs_attri_log_nameval_get(nv);
4183e4f27f402d Darrick J. Wong   2022-05-23  568  	ASSERT(attr->xattri_nameval);
4183e4f27f402d Darrick J. Wong   2022-05-23  569  
1d08e11d04d293 Allison Henderson 2022-05-09  570  	args->dp = ip;
1d08e11d04d293 Allison Henderson 2022-05-09  571  	args->geo = mp->m_attr_geo;
1d08e11d04d293 Allison Henderson 2022-05-09  572  	args->whichfork = XFS_ATTR_FORK;
4183e4f27f402d Darrick J. Wong   2022-05-23  573  	args->name = nv->name.i_addr;
4183e4f27f402d Darrick J. Wong   2022-05-23  574  	args->namelen = nv->name.i_len;
1d08e11d04d293 Allison Henderson 2022-05-09  575  	args->hashval = xfs_da_hashname(args->name, args->namelen);
85d76aec6bbb3d Darrick J. Wong   2022-05-20  576  	args->attr_filter = attrp->alfi_attr_filter & XFS_ATTRI_FILTER_MASK;
f4288f01820e2d Darrick J. Wong   2022-06-05  577  	args->op_flags = XFS_DA_OP_RECOVERY | XFS_DA_OP_OKNOENT |
f4288f01820e2d Darrick J. Wong   2022-06-05  578  			 XFS_DA_OP_LOGGED;
f4288f01820e2d Darrick J. Wong   2022-06-05  579  
f4288f01820e2d Darrick J. Wong   2022-06-05  580  	ASSERT(xfs_sb_version_haslogxattrs(&mp->m_sb));
1d08e11d04d293 Allison Henderson 2022-05-09  581  
356cb708ea1886 Darrick J. Wong   2022-05-20  582  	switch (attr->xattri_op_flags) {
b53d212b4b5c29 Darrick J. Wong   2022-05-22  583  	case XFS_ATTRI_OP_FLAGS_SET:
b53d212b4b5c29 Darrick J. Wong   2022-05-22  584  	case XFS_ATTRI_OP_FLAGS_REPLACE:
36ee9012d43da8 Darrick J. Wong   2023-11-22 @585  		int			local;
36ee9012d43da8 Darrick J. Wong   2023-11-22  586  
4183e4f27f402d Darrick J. Wong   2022-05-23  587  		args->value = nv->value.i_addr;
4183e4f27f402d Darrick J. Wong   2022-05-23  588  		args->valuelen = nv->value.i_len;
1d08e11d04d293 Allison Henderson 2022-05-09  589  		args->total = xfs_attr_calc_size(args, &local);
fdaf1bb3cafcfe Dave Chinner      2022-05-12  590  		if (xfs_inode_hasattr(args->dp))
fdaf1bb3cafcfe Dave Chinner      2022-05-12  591  			attr->xattri_dela_state = xfs_attr_init_replace_state(args);
fdaf1bb3cafcfe Dave Chinner      2022-05-12  592  		else
e0c41089b998f5 Dave Chinner      2022-05-12  593  			attr->xattri_dela_state = xfs_attr_init_add_state(args);
e0c41089b998f5 Dave Chinner      2022-05-12  594  		break;
b53d212b4b5c29 Darrick J. Wong   2022-05-22  595  	case XFS_ATTRI_OP_FLAGS_REMOVE:
4b9879b19cafa6 Dave Chinner      2022-05-12  596  		attr->xattri_dela_state = xfs_attr_init_remove_state(args);
e0c41089b998f5 Dave Chinner      2022-05-12  597  		break;
1d08e11d04d293 Allison Henderson 2022-05-09  598  	}
c3546cf5d1e503 Allison Henderson 2022-05-11  599  
36ee9012d43da8 Darrick J. Wong   2023-11-22  600  	xfs_defer_recover_work_item(dfp, &attr->xattri_list);
36ee9012d43da8 Darrick J. Wong   2023-11-22  601  	return attr;
36ee9012d43da8 Darrick J. Wong   2023-11-22  602  }
36ee9012d43da8 Darrick J. Wong   2023-11-22  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
