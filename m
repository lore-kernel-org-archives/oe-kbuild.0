Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EF127B340
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 01:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783991515; cv=none; b=XfMT2UIGXDldE6FUKtbV3CfqwpB1H/lzvF2JDSoEHoQ6x2mzI5V3Z7bNMlH/xETFWwbUmYAPT3ncSOxYl7A3u15hVXd0r+ODvxONIEvCinFXHNdpRnK6l1FIJiZGAwDKVlKAriOoWIAIMfjddp3S99k+ywnpCClIcl3ioFxLDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783991515; c=relaxed/simple;
	bh=B3LQ78ErkZVq5rjRYCmOc63Bc7PXOoNk2gXMoKcBxaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bsgIorBtskvHNawhscsWeVu1Q57SBSp/a7fKs1O6eQP7cIBPPpLoYiT+7cdsDAudsc2IX4Wr253y2/oFGNff3WmDEK9XoylQKgpxILc6JpVPnnZIwX7u6ErD4Bf/FDEsm2qIwODoVo8XMqpaU6/hq/jZTud+6F+EznB7xTNAvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRu7hKWi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRu7hKWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783991514; x=1815527514;
  h=date:from:to:cc:subject:message-id;
  bh=B3LQ78ErkZVq5rjRYCmOc63Bc7PXOoNk2gXMoKcBxaQ=;
  b=VRu7hKWivGpL8PEJjQVPqbam/FTwt6t4ge5IxptZSsbFZeG/F+acVUnA
   Ltm9eicfLF9wTfBTJBDJgQmUjXbi6nYDweR0tOMtIBfmjNcPxiURBX9Ks
   Tf3CihLCGSle8nzck4lorCBAIwAyWynQBSCaQsoBz82/RLsqkR8jLIDE/
   4JcXQMLbRq5eNikmctSG1VG+rHKU8TDwbxiEiFKgqR/eBXPhFjXYtOA2w
   McDt77ejkLMetHAYGXakA77KQcvlpJrt0LGb+N507nnt0WKan58o0AD6d
   A0QfP5zM8pSl9KGN7TVJEB0IJUIBVThpr/L/N1M884CNOIuOueCpJfeSF
   A==;
X-CSE-ConnectionGUID: EJUvbIxIQrGgEf7P10jB5A==
X-CSE-MsgGUID: B4opDjrTSgOP4XWMt08mSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88288005"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88288005"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 18:11:54 -0700
X-CSE-ConnectionGUID: JfGCT8BtSfSJaC8wkEc1+w==
X-CSE-MsgGUID: yJaXSlfTR62k8PR/AugT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255759154"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 13 Jul 2026 18:11:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjRgY-00000000MDF-3HME;
	Tue, 14 Jul 2026 01:11:48 +0000
Date: Tue, 14 Jul 2026 09:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:ovl_copy_file_range 4/6] fs/read_write.c:1640
 vfs_copy_file_range() error: we previously assumed 'fop->copy_file_range'
 could be null (see line 1620)
Message-ID: <202607140945.P14uUcJ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux ovl_copy_file_range
head:   4421f88f42bb20b8a6f9fd56c5c877a1088d0e00
commit: c069fa81750d9d0b50436889a1475549d19c2d14 [4/6] fs: add support for copy file range to another fs
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-141-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140945.P14uUcJ7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607140945.P14uUcJ7-lkp@intel.com/

New smatch warnings:
fs/read_write.c:1640 vfs_copy_file_range() error: we previously assumed 'fop->copy_file_range' could be null (see line 1620)

Old smatch warnings:
fs/read_write.c:1500 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null (see line 1497)

vim +1640 fs/read_write.c

407e9c63ee571f Darrick J. Wong   2020-10-15  1581  
29732938a6289a Zach Brown        2015-11-10  1582  /*
29732938a6289a Zach Brown        2015-11-10  1583   * copy_file_range() differs from regular file read and write in that it
29732938a6289a Zach Brown        2015-11-10  1584   * specifically allows return partial success.  When it does so is up to
29732938a6289a Zach Brown        2015-11-10  1585   * the copy_file_range method.
29732938a6289a Zach Brown        2015-11-10  1586   */
29732938a6289a Zach Brown        2015-11-10  1587  ssize_t vfs_copy_file_range(struct file *file_in, loff_t pos_in,
29732938a6289a Zach Brown        2015-11-10  1588  			    struct file *file_out, loff_t pos_out,
29732938a6289a Zach Brown        2015-11-10  1589  			    size_t len, unsigned int flags)
29732938a6289a Zach Brown        2015-11-10  1590  {
29732938a6289a Zach Brown        2015-11-10  1591  	ssize_t ret;
10bc8e4af65946 Amir Goldstein    2022-11-17  1592  	bool splice = flags & COPY_FILE_SPLICE;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1593  	int fscmp = copy_file_fs_cmp(file_in, file_out, flags);
c069fa81750d9d Amir Goldstein    2026-07-13  1594  	const struct file_operations *fop =
c069fa81750d9d Amir Goldstein    2026-07-13  1595  		(fscmp == FS_COPY_TO_OTHER_FS) ? file_in->f_op : file_out->f_op;
29732938a6289a Zach Brown        2015-11-10  1596  
10bc8e4af65946 Amir Goldstein    2022-11-17  1597  	if (flags & ~COPY_FILE_SPLICE)
29732938a6289a Zach Brown        2015-11-10  1598  		return -EINVAL;
29732938a6289a Zach Brown        2015-11-10  1599  
96e6e8f4a68df2 Amir Goldstein    2019-06-05  1600  	ret = generic_copy_file_checks(file_in, pos_in, file_out, pos_out, &len,
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1601  				       fscmp);
a31713517dac08 Amir Goldstein    2019-06-05  1602  	if (unlikely(ret))
a31713517dac08 Amir Goldstein    2019-06-05  1603  		return ret;
11cbfb10775aa2 Amir Goldstein    2017-01-31  1604  
29732938a6289a Zach Brown        2015-11-10  1605  	ret = rw_verify_area(READ, file_in, &pos_in, len);
bc61384dcdd82a Al Viro           2016-03-31  1606  	if (unlikely(ret))
bc61384dcdd82a Al Viro           2016-03-31  1607  		return ret;
bc61384dcdd82a Al Viro           2016-03-31  1608  
29732938a6289a Zach Brown        2015-11-10  1609  	ret = rw_verify_area(WRITE, file_out, &pos_out, len);
bc61384dcdd82a Al Viro           2016-03-31  1610  	if (unlikely(ret))
29732938a6289a Zach Brown        2015-11-10  1611  		return ret;
29732938a6289a Zach Brown        2015-11-10  1612  
29732938a6289a Zach Brown        2015-11-10  1613  	if (len == 0)
29732938a6289a Zach Brown        2015-11-10  1614  		return 0;
29732938a6289a Zach Brown        2015-11-10  1615  
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1616  	/*
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1617  	 * Make sure return value doesn't overflow in 32bit compat mode.  Also
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1618  	 * limit the size for all cases except when calling ->copy_file_range().
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1619  	 */
c069fa81750d9d Amir Goldstein    2026-07-13 @1620  	if (splice || !fop->copy_file_range || in_compat_syscall())
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1621  		len = min_t(size_t, MAX_RW_COUNT, len);
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1622  
c069fa81750d9d Amir Goldstein    2026-07-13  1623  	if (fscmp != FS_COPY_TO_OTHER_FS)
bfe219d373cada Amir Goldstein    2017-01-31  1624  		file_start_write(file_out);
29732938a6289a Zach Brown        2015-11-10  1625  
a76b5b04375f97 Christoph Hellwig 2016-12-09  1626  	/*
868f9f2f8e004b Amir Goldstein    2022-06-30  1627  	 * Cloning is supported by more file systems, so we implement copy on
868f9f2f8e004b Amir Goldstein    2022-06-30  1628  	 * same sb using clone, but for filesystems where both clone and copy
868f9f2f8e004b Amir Goldstein    2022-06-30  1629  	 * are supported (e.g. nfs,cifs), we only call the copy method.
c069fa81750d9d Amir Goldstein    2026-07-13  1630  	 * Cross-fs copy (FROM_OTHER_FS / TO_OTHER_FS) is handled by whichever
c069fa81750d9d Amir Goldstein    2026-07-13  1631  	 * side declared FOP_CROSS_FS_COPY.
a76b5b04375f97 Christoph Hellwig 2016-12-09  1632  	 */
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1633  	switch (fscmp) {
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1634  	case FS_COPY_SPLICE:
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1635  		break;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1636  	case FS_COPY_SAME_FS:
c069fa81750d9d Amir Goldstein    2026-07-13  1637  	case FS_COPY_TO_OTHER_FS:
b86e287575a3f8 Amir Goldstein    2026-07-13  1638  	case FS_COPY_FROM_OTHER_FS:
c069fa81750d9d Amir Goldstein    2026-07-13  1639  		ret = fop->copy_file_range(file_in, pos_in, file_out, pos_out,
868f9f2f8e004b Amir Goldstein    2022-06-30 @1640  					   len, flags);
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1641  		break;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1642  	case FS_COPY_SAME_SB:
c069fa81750d9d Amir Goldstein    2026-07-13  1643  		if (fop->remap_file_range)
c069fa81750d9d Amir Goldstein    2026-07-13  1644  			ret = fop->remap_file_range(file_in, pos_in,
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1645  						    file_out, pos_out, len,
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1646  						    REMAP_FILE_CAN_SHORTEN);
73065126866407 Amir Goldstein    2023-11-30  1647  		/* Fallback to splice for same sb copy for backward compat */
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1648  		if (ret <= 0)
73065126866407 Amir Goldstein    2023-11-30  1649  			splice = true;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1650  		break;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1651  	case FS_COPY_CROSS_FS:
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1652  		/* This should have failed in generic_copy_file_checks() */
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1653  		ret = -EXDEV;
cd6e8d0dbe33ef Amir Goldstein    2026-07-13  1654  		break;
a76b5b04375f97 Christoph Hellwig 2016-12-09  1655  	}
a76b5b04375f97 Christoph Hellwig 2016-12-09  1656  
c069fa81750d9d Amir Goldstein    2026-07-13  1657  	if (fscmp != FS_COPY_TO_OTHER_FS)
73065126866407 Amir Goldstein    2023-11-30  1658  		file_end_write(file_out);
73065126866407 Amir Goldstein    2023-11-30  1659  
73065126866407 Amir Goldstein    2023-11-30  1660  	if (!splice)
73065126866407 Amir Goldstein    2023-11-30  1661  		goto done;
73065126866407 Amir Goldstein    2023-11-30  1662  
868f9f2f8e004b Amir Goldstein    2022-06-30  1663  	/*
868f9f2f8e004b Amir Goldstein    2022-06-30  1664  	 * We can get here for same sb copy of filesystems that do not implement
868f9f2f8e004b Amir Goldstein    2022-06-30  1665  	 * ->copy_file_range() in case filesystem does not support clone or in
868f9f2f8e004b Amir Goldstein    2022-06-30  1666  	 * case filesystem supports clone but rejected the clone request (e.g.
868f9f2f8e004b Amir Goldstein    2022-06-30  1667  	 * because it was not block aligned).
868f9f2f8e004b Amir Goldstein    2022-06-30  1668  	 *
868f9f2f8e004b Amir Goldstein    2022-06-30  1669  	 * In both cases, fall back to kernel copy so we are able to maintain a
868f9f2f8e004b Amir Goldstein    2022-06-30  1670  	 * consistent story about which filesystems support copy_file_range()
868f9f2f8e004b Amir Goldstein    2022-06-30  1671  	 * and which filesystems do not, that will allow userspace tools to
868f9f2f8e004b Amir Goldstein    2022-06-30  1672  	 * make consistent desicions w.r.t using copy_file_range().
10bc8e4af65946 Amir Goldstein    2022-11-17  1673  	 *
73065126866407 Amir Goldstein    2023-11-30  1674  	 * We also get here if caller (e.g. nfsd) requested COPY_FILE_SPLICE
73065126866407 Amir Goldstein    2023-11-30  1675  	 * for server-side-copy between any two sb.
73065126866407 Amir Goldstein    2023-11-30  1676  	 *
73065126866407 Amir Goldstein    2023-11-30  1677  	 * In any case, we call do_splice_direct() and not splice_file_range(),
73065126866407 Amir Goldstein    2023-11-30  1678  	 * without file_start_write() held, to avoid possible deadlocks related
73065126866407 Amir Goldstein    2023-11-30  1679  	 * to splicing from input file, while file_start_write() is held on
73065126866407 Amir Goldstein    2023-11-30  1680  	 * the output file on a different sb.
868f9f2f8e004b Amir Goldstein    2022-06-30  1681  	 */
f8f59a2c05dc16 Miklos Szeredi    2025-08-13  1682  	ret = do_splice_direct(file_in, &pos_in, file_out, &pos_out, len, 0);
a76b5b04375f97 Christoph Hellwig 2016-12-09  1683  done:
29732938a6289a Zach Brown        2015-11-10  1684  	if (ret > 0) {
b86e287575a3f8 Amir Goldstein    2026-07-13  1685  		if (fscmp != FS_COPY_FROM_OTHER_FS) {
29732938a6289a Zach Brown        2015-11-10  1686  			fsnotify_access(file_in);
29732938a6289a Zach Brown        2015-11-10  1687  			add_rchar(current, ret);
b86e287575a3f8 Amir Goldstein    2026-07-13  1688  		}
c069fa81750d9d Amir Goldstein    2026-07-13  1689  		if (fscmp != FS_COPY_TO_OTHER_FS) {
29732938a6289a Zach Brown        2015-11-10  1690  			fsnotify_modify(file_out);
29732938a6289a Zach Brown        2015-11-10  1691  			add_wchar(current, ret);
29732938a6289a Zach Brown        2015-11-10  1692  		}
c069fa81750d9d Amir Goldstein    2026-07-13  1693  	}
a76b5b04375f97 Christoph Hellwig 2016-12-09  1694  
b86e287575a3f8 Amir Goldstein    2026-07-13  1695  	if (fscmp != FS_COPY_FROM_OTHER_FS)
29732938a6289a Zach Brown        2015-11-10  1696  		inc_syscr(current);
c069fa81750d9d Amir Goldstein    2026-07-13  1697  	if (fscmp != FS_COPY_TO_OTHER_FS)
29732938a6289a Zach Brown        2015-11-10  1698  		inc_syscw(current);
29732938a6289a Zach Brown        2015-11-10  1699  
29732938a6289a Zach Brown        2015-11-10  1700  	return ret;
29732938a6289a Zach Brown        2015-11-10  1701  }
29732938a6289a Zach Brown        2015-11-10  1702  EXPORT_SYMBOL(vfs_copy_file_range);
29732938a6289a Zach Brown        2015-11-10  1703  

:::::: The code at line 1640 was first introduced by commit
:::::: 868f9f2f8e004bfe0d3935b1976f625b2924893b vfs: fix copy_file_range() regression in cross-fs copies

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
