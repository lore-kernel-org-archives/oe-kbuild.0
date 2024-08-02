Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA0425632
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626957; cv=none; b=i9xTnhrnqFWGcVwmEDpbhdYja7IBTHZZ5D+TzEtNnkaCfJ6vPU602gUk6dXx2RoXJMfXwEAxhJTEECjpwK0Ws/S7+AFotjdEzHje1+4S4QyBCXQNLuNABwdby97Foiu6Pm81rQ5JGm9d4+eq7FHi0jQAl/xU+ual+DgipvSAXe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626957; c=relaxed/simple;
	bh=G8EPvTGIyIOEdQDwQeNpZ0TaFZcpfleu7Qu4Vin/8cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYbKQ3hbCPM73owU1G49I2HxBoJ+mO4V3C7Antm3pfRMjCdMTPVzQY2dnHwMu8hege83hkee36dj/OcN08u1W88gdwkRtvDi3ZhxsZMjkl0LEJQ8ZOu62oH5Q4TXX+lpBkFl3sof+SD4UcKuA+FMQmrAyjMxwY65GtKloFFPZi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sf2qdgLD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sf2qdgLD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722626955; x=1754162955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8EPvTGIyIOEdQDwQeNpZ0TaFZcpfleu7Qu4Vin/8cA=;
  b=Sf2qdgLDLV2PiW3Q4T5YGNNXNU9yK4V891TG4SUSnbn2dTD6xthFKF0A
   S2Hg2whTGqAaBPJRP4ZEwcg2pBnuoOIZ/Z2oIhyAI+P8pBybYd6effF9F
   ct/pFve5rx6wv0Uuspj7+0AprZKCuXNlq0WRvjnQoUZF19d6uqXTlNGgA
   9IZqBvOjwmNHVJvzEf8JfdVRons7/ZtDXiQv0gpTO9O3Z57bmCJ+TtNHA
   VnORhQts0zUPa7GIAG1vwWUzTo+Ns91YE1F04tGLIt4KlmM90pXVSWuhj
   i5xU4CArA6dDqMlx4UCqw/RSNw1OSWjgwWEXVpd6zFTWqM72nSwPZC8ll
   g==;
X-CSE-ConnectionGUID: +0/5woAlRBOrhc0hX8rYkA==
X-CSE-MsgGUID: +bkCQhqZQsir0pNGCxlcHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="32034413"
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="32034413"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 12:29:14 -0700
X-CSE-ConnectionGUID: YkN//2k2RIiQwWqzs7P+tw==
X-CSE-MsgGUID: I3ddvUcJRT6odqHYOOGjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,258,1716274800"; 
   d="scan'208";a="55578404"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Aug 2024 12:29:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZxxe-000xL0-0L;
	Fri, 02 Aug 2024 19:29:10 +0000
Date: Sat, 3 Aug 2024 03:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-per-rtg-bitmap 5/5] fs/xfs/xfs_rtalloc.c:1157
 xfs_growfs_rt() warn: impossible condition '(new_rgcount > ((-1))) =>
 (0-u32max > u32max)'
Message-ID: <202408030320.zYTuPl1H-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   a20a115ce4258bcd890eddb67ff3b15c7a4e9157
commit: a20a115ce4258bcd890eddb67ff3b15c7a4e9157 [5/5] xfs: use per-RTG bitmaps and summaries
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240802 (https://download.01.org/0day-ci/archive/20240803/202408030320.zYTuPl1H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408030320.zYTuPl1H-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1157 xfs_growfs_rt() warn: impossible condition '(new_rgcount > ((-1))) => (0-u32max > u32max)'
fs/xfs/xfs_rtalloc.c:1456 xfs_rtmount_iread_extents() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:332 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.

vim +1157 fs/xfs/xfs_rtalloc.c

31e8765dfb1353 Darrick J. Wong     2024-05-28  1078  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1079  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1080   * Grow the realtime area of the filesystem.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1081   */
^1da177e4c3f41 Linus Torvalds      2005-04-16  1082  int
^1da177e4c3f41 Linus Torvalds      2005-04-16  1083  xfs_growfs_rt(
a20a115ce4258b Christoph Hellwig   2024-07-31  1084  	struct xfs_mount	*mp,
a20a115ce4258b Christoph Hellwig   2024-07-31  1085  	struct xfs_growfs_rt	*in)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1086  {
a20a115ce4258b Christoph Hellwig   2024-07-31  1087  	xfs_rgnumber_t		last_rgno = mp->m_sb.sb_rgcount - 1;
a20a115ce4258b Christoph Hellwig   2024-07-31  1088  	unsigned int		new_rgcount = 1;
a20a115ce4258b Christoph Hellwig   2024-07-31  1089  	xfs_rtxnum_t		nrextents;
a20a115ce4258b Christoph Hellwig   2024-07-31  1090  	struct xfs_rtgroup	*rtg;
a20a115ce4258b Christoph Hellwig   2024-07-31  1091  	xfs_rgnumber_t		rgno;
a20a115ce4258b Christoph Hellwig   2024-07-31  1092  	struct xfs_buf		*bp;
a20a115ce4258b Christoph Hellwig   2024-07-31  1093  	int			error;	
a20a115ce4258b Christoph Hellwig   2024-07-31  1094  	unsigned int		i;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1095  
743bb4650da9e2 sandeen@sandeen.net 2008-11-25  1096  	if (!capable(CAP_SYS_ADMIN))
2451337dd04390 Dave Chinner        2014-06-25  1097  		return -EPERM;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1098  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1099  	/* Needs to have been mounted with an rt device. */
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1100  	if (!XFS_IS_REALTIME_MOUNT(mp))
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1101  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1102  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1103  	/* Shrink not supported. */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1104  	if (in->newblocks <= mp->m_sb.sb_rblocks)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1105  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1106  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1107  	/* Can only change rt extent size when adding rt volume. */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1108  	if (mp->m_sb.sb_rblocks > 0 && in->extsize != mp->m_sb.sb_rextsize)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1109  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1110  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1111  	/* Range check the extent size. */
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1112  	if (XFS_FSB_TO_B(mp, in->extsize) > XFS_MAX_RTEXTSIZE ||
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1113  	    XFS_FSB_TO_B(mp, in->extsize) < XFS_MIN_RTEXTSIZE)
2451337dd04390 Dave Chinner        2014-06-25  1114  		return -EINVAL;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1115  
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1116  	/* Unsupported realtime features. */
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1117  	if (!xfs_has_rtgroups(mp) && (xfs_has_rmapbt(mp) || xfs_has_reflink(mp)))
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1118  		return -EOPNOTSUPP;
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1119  	if (xfs_has_quota(mp))
a7b6869effc4eb Darrick J. Wong     2024-05-28  1120  		return -EOPNOTSUPP;
bb88dce9eeb696 Darrick J. Wong     2024-05-28  1121  	if (xfs_has_reflink(mp) && in->extsize != 1)
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1122  		return -EOPNOTSUPP;
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1123  
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1124  	error = xfs_sb_validate_fsb_count(&mp->m_sb, in->newblocks);
0e2af9296f4f9c Darrick J. Wong     2021-07-12  1125  	if (error)
4cc929ee305c69 Nathan Scott        2007-05-14  1126  		return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1127  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1128  	 * Read in the last block of the device, make sure it exists.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1129  	 */
ba3726742c1712 Dave Chinner        2014-10-02  1130  	error = xfs_buf_read_uncached(mp->m_rtdev_targp,
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1131  				XFS_FSB_TO_BB(mp, in->newblocks - 1),
ba3726742c1712 Dave Chinner        2014-10-02  1132  				XFS_FSB_TO_BB(mp, 1), 0, &bp, NULL);
ba3726742c1712 Dave Chinner        2014-10-02  1133  	if (error)
eab4e63368b4cf Dave Chinner        2012-11-12  1134  		return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1135  	xfs_buf_relse(bp);
1922c949c59f93 Dave Chinner        2010-09-22  1136  
^1da177e4c3f41 Linus Torvalds      2005-04-16  1137  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  1138  	 * Calculate new parameters.  These are the final values to be reached.
^1da177e4c3f41 Linus Torvalds      2005-04-16  1139  	 */
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1140  	nrextents = div_u64(in->newblocks, in->extsize);
5bb69dac440d87 Christoph Hellwig   2024-07-30  1141  	if (nrextents == 0)
e14293803f4e84 Darrick J. Wong     2023-12-01  1142  		return -EINVAL;
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1143  
31e8765dfb1353 Darrick J. Wong     2024-05-28  1144  	/* Make sure the new fs size won't cause problems with the log. */
31e8765dfb1353 Darrick J. Wong     2024-05-28  1145  	error = xfs_growfs_check_rtgeom(mp, mp->m_sb.sb_dblocks, in->newblocks,
31e8765dfb1353 Darrick J. Wong     2024-05-28  1146  			in->extsize);
31e8765dfb1353 Darrick J. Wong     2024-05-28  1147  	if (error)
31e8765dfb1353 Darrick J. Wong     2024-05-28  1148  		return error;
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1149  
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1150  	/*
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1151  	 * Compute the new number of rt groups.  Changing the rtgroup size is
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1152  	 * not allowed (even if the rt volume hasn't yet been initialized)
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1153  	 * because the userspace ABI doesn't support it.
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1154  	 */
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1155  	if (xfs_has_rtgroups(mp)) {
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1156  		new_rgcount = howmany_64(nrextents, mp->m_sb.sb_rgextents);
d40c00393d9cf8 Darrick J. Wong     2024-05-28 @1157  		if (new_rgcount > XFS_MAX_RGNUMBER)
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1158  			return -EINVAL;
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1159  
a20a115ce4258b Christoph Hellwig   2024-07-31  1160  		/*
a20a115ce4258b Christoph Hellwig   2024-07-31  1161  		 * Set up the realtime superblock if we're adding a new rt
a20a115ce4258b Christoph Hellwig   2024-07-31  1162  		 * section.
a20a115ce4258b Christoph Hellwig   2024-07-31  1163  		 */
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1164  		if (xfs_has_rtsb(mp) && mp->m_sb.sb_rblocks == 0) {
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1165  			error = xfs_growfs_rt_init_super(mp);
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1166  			if (error)
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1167  				return error;
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1168  		}
d40c00393d9cf8 Darrick J. Wong     2024-05-28  1169  
a20a115ce4258b Christoph Hellwig   2024-07-31  1170  		/* Make sure the /rtgroups dir has been created */
a20a115ce4258b Christoph Hellwig   2024-07-31  1171  		if (!mp->m_rtdirip) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1172  			struct xfs_trans	*tp;
a20a115ce4258b Christoph Hellwig   2024-07-31  1173  
a20a115ce4258b Christoph Hellwig   2024-07-31  1174  			error = xfs_trans_alloc_empty(mp, &tp);
1050c71e2925ab Christoph Hellwig   2011-02-13  1175  			if (error)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1176  				return error;
a20a115ce4258b Christoph Hellwig   2024-07-31  1177  			error = xfs_rtginode_load_parent(tp);
a20a115ce4258b Christoph Hellwig   2024-07-31  1178  			xfs_trans_cancel(tp);
a20a115ce4258b Christoph Hellwig   2024-07-31  1179  
a20a115ce4258b Christoph Hellwig   2024-07-31  1180  			if (error == -ENOENT)
a20a115ce4258b Christoph Hellwig   2024-07-31  1181  				error = xfs_rtginode_mkdir_parent(mp);
1050c71e2925ab Christoph Hellwig   2011-02-13  1182  			if (error)
^1da177e4c3f41 Linus Torvalds      2005-04-16  1183  				return error;
a20a115ce4258b Christoph Hellwig   2024-07-31  1184  		}
a20a115ce4258b Christoph Hellwig   2024-07-31  1185  	}
65eed012d1f2d0 Omar Sandoval       2018-12-21  1186  
a20a115ce4258b Christoph Hellwig   2024-07-31  1187  	error = xfs_initialize_rtgroups(mp, new_rgcount);
4da78a3598bec4 Christoph Hellwig   2024-07-30  1188  	if (error)
4da78a3598bec4 Christoph Hellwig   2024-07-30  1189  		return error;
a20a115ce4258b Christoph Hellwig   2024-07-31  1190  
a20a115ce4258b Christoph Hellwig   2024-07-31  1191  	/*
a20a115ce4258b Christoph Hellwig   2024-07-31  1192  	 * If the last RT group is completely full we can skip it.
a20a115ce4258b Christoph Hellwig   2024-07-31  1193  	 */
a20a115ce4258b Christoph Hellwig   2024-07-31  1194  	if (xfs_rtgroup_extents(mp, last_rgno) == mp->m_sb.sb_rgextents)
a20a115ce4258b Christoph Hellwig   2024-07-31  1195  		last_rgno++;
a20a115ce4258b Christoph Hellwig   2024-07-31  1196  
a20a115ce4258b Christoph Hellwig   2024-07-31  1197  	for_each_rtgroup_range(mp, last_rgno, new_rgcount - 1, rtg) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1198  		unsigned int	i;
a20a115ce4258b Christoph Hellwig   2024-07-31  1199  
a20a115ce4258b Christoph Hellwig   2024-07-31  1200  		for (i = 0; i < XFS_RTG_MAX; i++) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1201  			error = xfs_rtginode_ensure(rtg, i);
a20a115ce4258b Christoph Hellwig   2024-07-31  1202  			if (error) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1203  				xfs_rtgroup_rele(rtg);
a20a115ce4258b Christoph Hellwig   2024-07-31  1204  				goto out_free;
a20a115ce4258b Christoph Hellwig   2024-07-31  1205  			}
4da78a3598bec4 Christoph Hellwig   2024-07-30  1206  		}
65eed012d1f2d0 Omar Sandoval       2018-12-21  1207  
a20a115ce4258b Christoph Hellwig   2024-07-31  1208  		error = xfs_growfs_rtg(rtg, in->newblocks, in->extsize);
a20a115ce4258b Christoph Hellwig   2024-07-31  1209  		if (error) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1210  			xfs_rtgroup_rele(rtg);
7249c95a3fd72c Darrick J. Wong     2020-10-07  1211  			goto out_free;
6cb9e23fdae7c1 Christoph Hellwig   2024-07-30  1212  		}
a20a115ce4258b Christoph Hellwig   2024-07-31  1213  	}
7249c95a3fd72c Darrick J. Wong     2020-10-07  1214  
7249c95a3fd72c Darrick J. Wong     2020-10-07  1215  	/* Update secondary superblocks now the physical grow has completed */
7249c95a3fd72c Darrick J. Wong     2020-10-07  1216  	error = xfs_update_secondary_sbs(mp);
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1217  	if (error)
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1218  		goto out_free;
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1219  
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1220  	/* Reset the rt metadata btree space reservations. */
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1221  	xfs_rt_resv_free(mp);
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1222  	error = xfs_rt_resv_init(mp);
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1223  	if (error == -ENOSPC)
440d1b20a3bcdd Darrick J. Wong     2024-05-28  1224  		error = 0;
a20a115ce4258b Christoph Hellwig   2024-07-31  1225  	if (error)
a20a115ce4258b Christoph Hellwig   2024-07-31  1226  		goto out_free;
a20a115ce4258b Christoph Hellwig   2024-07-31  1227  
a20a115ce4258b Christoph Hellwig   2024-07-31  1228  	return 0;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1229  
7249c95a3fd72c Darrick J. Wong     2020-10-07  1230  out_free:
a20a115ce4258b Christoph Hellwig   2024-07-31  1231  	rgno = mp->m_sb.sb_rgcount + 1;
a20a115ce4258b Christoph Hellwig   2024-07-31  1232  	for_each_rtgroup_range(mp, rgno, new_rgcount - 1, rtg) {
a20a115ce4258b Christoph Hellwig   2024-07-31  1233  		for (i = 0; i < XFS_RTG_MAX; i++)
a20a115ce4258b Christoph Hellwig   2024-07-31  1234  			xfs_rtginode_irele(&rtg->rtg_inodes[i]);
65eed012d1f2d0 Omar Sandoval       2018-12-21  1235  	}
65eed012d1f2d0 Omar Sandoval       2018-12-21  1236  
a20a115ce4258b Christoph Hellwig   2024-07-31  1237  	xfs_free_unused_rtgroup_range(mp, mp->m_sb.sb_rgcount + 1,
a20a115ce4258b Christoph Hellwig   2024-07-31  1238  			new_rgcount - 1);
^1da177e4c3f41 Linus Torvalds      2005-04-16  1239  	return error;
^1da177e4c3f41 Linus Torvalds      2005-04-16  1240  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  1241  

:::::: The code at line 1157 was first introduced by commit
:::::: d40c00393d9cf8cbb1731c2a9caefde5f015e6a1 xfs: grow the realtime section when realtime groups are enabled

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
