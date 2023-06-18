Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E61865
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687089920; x=1718625920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0IE+w0UtaUo5yIzLMNmdMfBacDi9x+U/5XBCD7odWE=;
  b=P28bvNKvk0TugxzXo8qJoD747nOd1AVj8a6jnAFGisGO8qZhyPaJxnni
   /MUnwpG6ToqbUVcSc/abSwNsqyfKuHUIpbmxlbppHex9P8vZtUSMF5ymw
   mNUb/MjBSvkmQyt5Mi7yZrpjjgLv6l4kmG/kFaXM88qQPQN6M6IhQX4xF
   c1udnGq5xKWbfD+9nrzfPz3lByzGafGUtREewAi1da0ma1s0Xi3KGeQqR
   xvN2a2sokb49ip7RhE/oq/WUGQjC4C5wUi1mCMhhd4smemrxKaRwgqTLT
   p+dzYhXUFACp0S8xrb4P5RvtPHz7HzYiw3HrrRI4Gxi7d09VGX61WYTWS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="344214805"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="344214805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 05:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="826290396"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="826290396"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2023 05:05:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAr9f-0003gy-0F;
	Sun, 18 Jun 2023 12:05:15 +0000
Date: Sun, 18 Jun 2023 20:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:rename-child-lock-fixes 500/508]
 fs/xfs/xfs_bmap_util.c:1505 xfs_map_free_rt_extent() warn: missing error
 code 'error'
Message-ID: <202306181921.JZyZC9PA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rename-child-lock-fixes
head:   91de899c5ad014760acb27d172f5e45d278e6886
commit: f2ff3a76652d5a1a67f7828baf4eda5494faa35d [500/508] xfs: fallocate free space into a file
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m041-20230618 (https://download.01.org/0day-ci/archive/20230618/202306181921.JZyZC9PA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181921.JZyZC9PA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306181921.JZyZC9PA-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_bmap_util.c:1505 xfs_map_free_rt_extent() warn: missing error code 'error'

Old smatch warnings:
fs/xfs/xfs_buf.h:450 xfs_buftarg_zeroout() warn: bitwise AND condition is false here
fs/xfs/xfs_bmap_util.c:1359 xfs_map_free_extent() warn: missing error code 'error'

vim +/error +1505 fs/xfs/xfs_bmap_util.c

f2ff3a76652d5a Darrick J. Wong 2023-03-06  1468  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1469  #ifdef CONFIG_XFS_RT
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1470  STATIC int
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1471  xfs_map_free_rt_extent(
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1472  	struct xfs_inode	*ip,
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1473  	xfs_rtxnum_t		*cursor,
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1474  	xfs_rtxnum_t		end_rtx)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1475  {
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1476  	struct xfs_bmbt_irec	irec;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1477  	struct xfs_mount	*mp = ip->i_mount;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1478  	struct xfs_trans	*tp;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1479  	xfs_off_t		endpos;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1480  	xfs_rtblock_t		rtbno;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1481  	xfs_rtxnum_t		add;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1482  	xfs_rtxlen_t		len_rtx;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1483  	xfs_extlen_t		len;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1484  	uint32_t		mod;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1485  	int			error;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1486  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1487  	if (fatal_signal_pending(current))
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1488  		return -EINTR;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1489  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1490  	error = xfs_trans_alloc_inode(ip, &M_RES(mp)->tr_write, 0, 0, false,
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1491  			&tp);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1492  	if (error)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1493  		return error;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1494  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1495  	xfs_rtbitmap_lock(tp, mp);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1496  	error = xfs_rtalloc_find_freesp(tp, cursor, end_rtx, &len_rtx);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1497  	if (error)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1498  		goto out_cancel;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1499  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1500  	/*
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1501  	 * If off_rtx is beyond the end of the rt device or is past what the
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1502  	 * user asked for, bail out.
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1503  	 */
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1504  	if (*cursor >= end_rtx)
f2ff3a76652d5a Darrick J. Wong 2023-03-06 @1505  		goto out_cancel;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1506  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1507  	len = xfs_rtx_to_rtb(mp, len_rtx);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1508  	error = xfs_map_free_reserve_more(tp, ip, &len);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1509  	if (error)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1510  		goto out_cancel;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1511  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1512  	rtbno = xfs_rtx_to_rtb(mp, *cursor);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1513  	error = xfs_bmapi_freesp(tp, ip, rtbno, len, &irec);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1514  	if (error)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1515  		goto out_cancel;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1516  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1517  	/* Update isize if needed. */
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1518  	endpos = XFS_FSB_TO_B(mp, irec.br_startoff + irec.br_blockcount);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1519  	if (endpos > i_size_read(VFS_I(ip))) {
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1520  		i_size_write(VFS_I(ip), endpos);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1521  		ip->i_disk_size = endpos;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1522  		xfs_trans_log_inode(tp, ip, XFS_ILOG_CORE);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1523  	}
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1524  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1525  	error = xfs_trans_commit(tp);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1526  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1527  	if (error)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1528  		return error;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1529  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1530  	add = xfs_rtb_to_rtx(mp, irec.br_blockcount, &mod);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1531  	if (mod)
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1532  		return -EFSCORRUPTED;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1533  
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1534  	*cursor += add;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1535  	return 0;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1536  out_cancel:
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1537  	xfs_trans_cancel(tp);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1538  	xfs_iunlock(ip, XFS_ILOCK_EXCL);
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1539  	return error;
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1540  }
f2ff3a76652d5a Darrick J. Wong 2023-03-06  1541  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
