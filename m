Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8CF1D47AF
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730817942; cv=none; b=IakiIuZdQ1UdWxV98QQmHUYBuxOikLA6EWximu/+qZ2KgKOJkUlDcIJnULpls285Br/HpQU3f6p747wcO2q/6HuqpfxS20ylFk3prd0OSgW1tQic7zOrTvn3vdl3H+My0tfjLc04aa5GamOpOhuXxMI+6oGaKRxC4EXkAwU1JL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730817942; c=relaxed/simple;
	bh=5qcX39NZ02EWTHEL4Ncz+XFNvV1afYaVhttbfygIO8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhwkd7jfl4vwemttmQeoP20G4vRG+IOUlWVd6KxzvaKy4F94QIwlREkhGACoohp8kYBaQkVSb5lDmUGirL5JsnesIfs9qZ+JsDhJFBcHrSSWZUc+M1RMe2QN8mmJzpXvT+vnnomN6xcuzAkQ1JKYcvs8hA6fK8i4SxxZUPr3SSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etxIQY6C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etxIQY6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730817940; x=1762353940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5qcX39NZ02EWTHEL4Ncz+XFNvV1afYaVhttbfygIO8s=;
  b=etxIQY6CR0MDMUQNUHnYWaVb+6W5/xbV6Yyxha0TOakmsoQirQjlhIaD
   8KcfcgJ/thfnCGrUL+9O1UpEEn47JRVTDABU5k0BPKI/K3HYgFTFZ+5NP
   6l/OciiCT/EWM2udg6aKgl2kfZTkb9R4G0MxCTMtgJnGX0QwCiggvhuZ0
   IgPy7c2k55Cdu3VMe9cNh8SoGp0Uz/GzqjdcB+lLON9eQ8DsUqb3PKZrI
   UZDeYpU0Ggj5S8SSm5dJ/hXV6QZaiV0nqcRUYWochCVO2+9M3ya/KKVvb
   XBmRyNbkClDr8xG205q8ZC6m9Rl6dka3jL0H1IaDdtjpr4cO7P2o1bDLH
   g==;
X-CSE-ConnectionGUID: 4ZjoN030TSWHfa8yfupJgg==
X-CSE-MsgGUID: k1KZBw8JTDKHx46waFW7WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30342451"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30342451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:45:36 -0800
X-CSE-ConnectionGUID: 6TbNgdYpQUCcRDXxprpHOA==
X-CSE-MsgGUID: 7/HkG4ClSeOAuaCbcTM1aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="83707068"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2024 06:45:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8KoF-000mA5-0i;
	Tue, 05 Nov 2024 14:45:31 +0000
Date: Tue, 5 Nov 2024 22:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned 64/68] fs/xfs/xfs_rtalloc.c:1487 xfs_growfs_rt()
 warn: inconsistent returns '&mp->m_growlock'.
Message-ID: <202411052208.zlY4ueQm-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   bdd2e8eca7805ce39b762a49098e4852c59b6f1f
commit: 937d89e065a77b67572051a23436accd7ce4c782 [64/68] xfs: factor out a xfs_rt_check_size helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241105 (https://download.01.org/0day-ci/archive/20241105/202411052208.zlY4ueQm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411052208.zlY4ueQm-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1487 xfs_growfs_rt() warn: inconsistent returns '&mp->m_growlock'.

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:333 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:1300 xfs_growfs_rt_prep_groups() warn: impossible condition '(*new_rgcount > ((-1))) => (0-u32max > u32max)'

vim +1487 fs/xfs/xfs_rtalloc.c

937d89e065a77b6 Christoph Hellwig   2024-07-30  1361  
^1da177e4c3f415 Linus Torvalds      2005-04-16  1362  /*
^1da177e4c3f415 Linus Torvalds      2005-04-16  1363   * Grow the realtime area of the filesystem.
^1da177e4c3f415 Linus Torvalds      2005-04-16  1364   */
^1da177e4c3f415 Linus Torvalds      2005-04-16  1365  int
^1da177e4c3f415 Linus Torvalds      2005-04-16  1366  xfs_growfs_rt(
c2290446af8946b Darrick J. Wong     2024-10-15  1367  	struct xfs_mount	*mp,
c2290446af8946b Darrick J. Wong     2024-10-15  1368  	struct xfs_growfs_rt	*in)
^1da177e4c3f415 Linus Torvalds      2005-04-16  1369  {
c2290446af8946b Darrick J. Wong     2024-10-15  1370  	xfs_rgnumber_t		old_rgcount = mp->m_sb.sb_rgcount;
c2290446af8946b Darrick J. Wong     2024-10-15  1371  	xfs_rgnumber_t		new_rgcount = 1;
c2290446af8946b Darrick J. Wong     2024-10-15  1372  	xfs_rgnumber_t		rgno;
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1373  	xfs_agblock_t		old_rextsize = mp->m_sb.sb_rextsize;
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1374  	int			error;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1375  
743bb4650da9e25 sandeen@sandeen.net 2008-11-25  1376  	if (!capable(CAP_SYS_ADMIN))
2451337dd043901 Dave Chinner        2014-06-25  1377  		return -EPERM;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1378  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1379  	/* Needs to have been mounted with an rt device. */
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1380  	if (!XFS_IS_REALTIME_MOUNT(mp))
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1381  		return -EINVAL;
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1382  
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1383  	if (!mutex_trylock(&mp->m_growlock))
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1384  		return -EWOULDBLOCK;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1385  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1386  	/* Shrink not supported. */
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1387  	error = -EINVAL;
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1388  	if (in->newblocks <= mp->m_sb.sb_rblocks)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1389  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1390  	/* Can only change rt extent size when adding rt volume. */
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1391  	if (mp->m_sb.sb_rblocks > 0 && in->extsize != mp->m_sb.sb_rextsize)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1392  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1393  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1394  	/* Range check the extent size. */
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1395  	if (XFS_FSB_TO_B(mp, in->extsize) > XFS_MAX_RTEXTSIZE ||
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1396  	    XFS_FSB_TO_B(mp, in->extsize) < XFS_MIN_RTEXTSIZE)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1397  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1398  
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1399  	/* Unsupported realtime features. */
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1400  	error = -EOPNOTSUPP;
9c871895435c232 Darrick J. Wong     2024-10-15  1401  	if ((xfs_has_rmapbt(mp) || xfs_has_quota(mp)) && !xfs_has_rtgroups(mp))
1d1fde3ab4498cf Darrick J. Wong     2024-10-15  1402  		goto out_unlock;
c74ba44d90a5216 Darrick J. Wong     2024-10-15  1403  	if (xfs_has_reflink(mp) &&
c74ba44d90a5216 Darrick J. Wong     2024-10-15  1404  	    !xfs_reflink_supports_rextsize(mp, in->extsize))
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1405  		goto out_unlock;
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1406  
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1407  	error = xfs_sb_validate_fsb_count(&mp->m_sb, in->newblocks);
0e2af9296f4f9c4 Darrick J. Wong     2021-07-12  1408  	if (error)
937d89e065a77b6 Christoph Hellwig   2024-07-30  1409  		return error;
937d89e065a77b6 Christoph Hellwig   2024-07-30  1410  
937d89e065a77b6 Christoph Hellwig   2024-07-30  1411  	error = xfs_rt_check_size(mp, in->newblocks - 1);
ba3726742c1712c Dave Chinner        2014-10-02  1412  	if (error)
937d89e065a77b6 Christoph Hellwig   2024-07-30  1413  		return error;
1922c949c59f93b Dave Chinner        2010-09-22  1414  
^1da177e4c3f415 Linus Torvalds      2005-04-16  1415  	/*
^1da177e4c3f415 Linus Torvalds      2005-04-16  1416  	 * Calculate new parameters.  These are the final values to be reached.
^1da177e4c3f415 Linus Torvalds      2005-04-16  1417  	 */
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1418  	error = -EINVAL;
140f03a1285d84d Christoph Hellwig   2024-10-15  1419  	if (in->newblocks < in->extsize)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1420  		goto out_unlock;
7996f10ce6cc6a9 Christoph Hellwig   2024-08-30  1421  
140f03a1285d84d Christoph Hellwig   2024-10-15  1422  	/* Make sure the new fs size won't cause problems with the log. */
59ad7d04a88ab22 Darrick J. Wong     2024-10-15  1423  	error = xfs_growfs_check_rtgeom(mp, mp->m_sb.sb_dblocks, in->newblocks,
59ad7d04a88ab22 Darrick J. Wong     2024-10-15  1424  			in->extsize);
140f03a1285d84d Christoph Hellwig   2024-10-15  1425  	if (error)
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1426  		goto out_unlock;
65eed012d1f2d0f Omar Sandoval       2018-12-21  1427  
c2290446af8946b Darrick J. Wong     2024-10-15  1428  	if (xfs_has_rtgroups(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1429  		error = xfs_growfs_rt_prep_groups(mp, in->newblocks,
c2290446af8946b Darrick J. Wong     2024-10-15  1430  				in->extsize, &new_rgcount);
c2290446af8946b Darrick J. Wong     2024-10-15  1431  		if (error)
c2290446af8946b Darrick J. Wong     2024-10-15  1432  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1433  	}
c2290446af8946b Darrick J. Wong     2024-10-15  1434  
c2290446af8946b Darrick J. Wong     2024-10-15  1435  	if (xfs_grow_last_rtg(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1436  		error = xfs_growfs_rtg(mp, old_rgcount - 1, in->newblocks,
c2290446af8946b Darrick J. Wong     2024-10-15  1437  				in->extsize);
3cb30d5162292a3 Christoph Hellwig   2024-08-30  1438  		if (error)
3cb30d5162292a3 Christoph Hellwig   2024-08-30  1439  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1440  	}
7249c95a3fd72c7 Darrick J. Wong     2020-10-07  1441  
c2290446af8946b Darrick J. Wong     2024-10-15  1442  	for (rgno = old_rgcount; rgno < new_rgcount; rgno++) {
c2290446af8946b Darrick J. Wong     2024-10-15  1443  		xfs_rtbxlen_t	rextents = div_u64(in->newblocks, in->extsize);
c2290446af8946b Darrick J. Wong     2024-10-15  1444  
c2290446af8946b Darrick J. Wong     2024-10-15  1445  		error = xfs_rtgroup_alloc(mp, rgno, new_rgcount, rextents);
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1446  		if (error)
e0bdb91d92d21a1 Christoph Hellwig   2024-10-15  1447  			goto out_unlock;
c2290446af8946b Darrick J. Wong     2024-10-15  1448  
c2290446af8946b Darrick J. Wong     2024-10-15  1449  		error = xfs_growfs_rtg(mp, rgno, in->newblocks, in->extsize);
c2290446af8946b Darrick J. Wong     2024-10-15  1450  		if (error) {
c2290446af8946b Darrick J. Wong     2024-10-15  1451  			struct xfs_rtgroup	*rtg;
c2290446af8946b Darrick J. Wong     2024-10-15  1452  
c2290446af8946b Darrick J. Wong     2024-10-15  1453  			rtg = xfs_rtgroup_grab(mp, rgno);
c2290446af8946b Darrick J. Wong     2024-10-15  1454  			if (!WARN_ON_ONCE(!rtg)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1455  				xfs_rtunmount_rtg(rtg);
c2290446af8946b Darrick J. Wong     2024-10-15  1456  				xfs_rtgroup_rele(rtg);
c2290446af8946b Darrick J. Wong     2024-10-15  1457  				xfs_rtgroup_free(mp, rgno);
c2290446af8946b Darrick J. Wong     2024-10-15  1458  			}
c2290446af8946b Darrick J. Wong     2024-10-15  1459  			break;
c2290446af8946b Darrick J. Wong     2024-10-15  1460  		}
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1461  	}
a24cae8fc1f13f6 Darrick J. Wong     2024-08-22  1462  
c2290446af8946b Darrick J. Wong     2024-10-15  1463  	if (!error && old_rextsize != in->extsize)
c2290446af8946b Darrick J. Wong     2024-10-15  1464  		error = xfs_growfs_rt_fixup_extsize(mp);
c2290446af8946b Darrick J. Wong     2024-10-15  1465  
c2290446af8946b Darrick J. Wong     2024-10-15  1466  	/*
c2290446af8946b Darrick J. Wong     2024-10-15  1467  	 * Update secondary superblocks now the physical grow has completed.
c2290446af8946b Darrick J. Wong     2024-10-15  1468  	 *
c2290446af8946b Darrick J. Wong     2024-10-15  1469  	 * Also do this in case of an error as we might have already
c2290446af8946b Darrick J. Wong     2024-10-15  1470  	 * successfully updated one or more RTGs and incremented sb_rgcount.
c2290446af8946b Darrick J. Wong     2024-10-15  1471  	 */
c2290446af8946b Darrick J. Wong     2024-10-15  1472  	if (!xfs_is_shutdown(mp)) {
c2290446af8946b Darrick J. Wong     2024-10-15  1473  		int error2 = xfs_update_secondary_sbs(mp);
c2290446af8946b Darrick J. Wong     2024-10-15  1474  
c2290446af8946b Darrick J. Wong     2024-10-15  1475  		if (!error)
c2290446af8946b Darrick J. Wong     2024-10-15  1476  			error = error2;
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1477  
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1478  		/* Reset the rt metadata btree space reservations. */
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1479  		xfs_rt_resv_free(mp);
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1480  		error2 = xfs_rt_resv_init(mp);
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1481  		if (error2 && error2 != -ENOSPC)
3db6c1b842a69bf Darrick J. Wong     2024-10-15  1482  			error = error2;
c2290446af8946b Darrick J. Wong     2024-10-15  1483  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16  1484  
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1485  out_unlock:
16e1fbdce9c8d08 Darrick J. Wong     2024-08-22  1486  	mutex_unlock(&mp->m_growlock);
^1da177e4c3f415 Linus Torvalds      2005-04-16 @1487  	return error;
^1da177e4c3f415 Linus Torvalds      2005-04-16  1488  }
^1da177e4c3f415 Linus Torvalds      2005-04-16  1489  

:::::: The code at line 1487 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
