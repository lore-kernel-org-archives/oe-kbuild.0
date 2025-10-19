Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6254654
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 08:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861450; cv=none; b=jPTlaVSZJS4288wx6fbU1nL4QlXJV8TKgESQbCRjv3tJS/8Jrk7UM1DoLCC6jUS2uzd7C4AEELT9czzhkiAl7yxjy01eTQTV1Rv54h5r3tTSC6mZwZ5QxMiGxyQVAh1jd2XHj0JzRMIYwBIV8GsQ/g4g8S+YZ9hvgvoR548e5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861450; c=relaxed/simple;
	bh=y91nr4IBBCn5uoyMua88jxEric5qMVxwoSZZWneT7qE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/T5xZ6ka/jUwB8AcElTiBGtHAEg9Mk5QzBRl3qUKZeP1XfHc1OU5F2VBptcV1TBLid67L5PpkRlWi7gwt9/6rx/rJ5XxjyIj2SId/B9TO0h4zwgRuh6qRo63fl21B3h4WDoJZb01vUNn6tH9Smly3N5PbzyS/HtB3yaOSROP78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuDSlrnb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuDSlrnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760861447; x=1792397447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y91nr4IBBCn5uoyMua88jxEric5qMVxwoSZZWneT7qE=;
  b=OuDSlrnbxaVJn+iMUSe1kSD9DLRxIk+HzdfLT1zZcTvvVOSZ78JQ5wo4
   w+CPYy3G5Bmz0gwpdbLCph0+CEWzTCH8k3sypFC42atlcuS1LWfseIouk
   KFT/+8WSgmf8/i7wDWgd2bpgmtHbYxCZ2A/W+jmvlBczrYwCvE5wmaP8w
   DwMRoLKPu5UzOt3+pW+rfZElZrErT/FpOWrkC7xAKlxQJ/AE9exCX33IT
   Xi/Jxeh6qwupmYSiVjx23WBSPMknVvjPN+vQB6VqhqnSJha8nZjGn01PZ
   +YGGeVDodPNbivBYBqxnQvARsjtXZ5Qn9qJGzZ3KVWdvdPdm/6NG4ZRZE
   w==;
X-CSE-ConnectionGUID: EdrrJ3cXR7W5mdLL79PFZg==
X-CSE-MsgGUID: jCmexzzMTRe7NBiPFkcrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66883576"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="66883576"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 01:10:46 -0700
X-CSE-ConnectionGUID: v0sLPlmOQt6n4bkzcPsq1g==
X-CSE-MsgGUID: DqXFxKe/QGykHuonWM9bFw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Oct 2025 01:10:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAOUi-0008wd-11;
	Sun, 19 Oct 2025 08:10:29 +0000
Date: Sun, 19 Oct 2025 16:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-quota-cleanups 10/20] fs/xfs/xfs_qm.c:1307
 xfs_qm_quotacheck_dqadjust() warn: inconsistent returns '&dqp->q_qlock'.
Message-ID: <202510191616.ecg6r6ZD-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-quota-cleanups
head:   65122be191ff384c885bb15ab86d84951a501c49
commit: bac6d7a22f577467f49a0696ca995957f78b5caa [10/20] xfs: return the dquot unlocked from xfs_qm_dqget
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191616.ecg6r6ZD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510191616.ecg6r6ZD-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_qm.c:1307 xfs_qm_quotacheck_dqadjust() warn: inconsistent returns '&dqp->q_qlock'.

vim +1307 fs/xfs/xfs_qm.c

^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1239  
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1240  /*
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1241   * Called by dqusage_adjust in doing a quotacheck.
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1242   *
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1243   * Given the inode, and a dquot id this updates both the incore dqout as well
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1244   * as the buffer copy. This is so that once the quotacheck is done, we can
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1245   * just log all the buffers, as opposed to logging numerous updates to
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1246   * individual dquots.
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1247   */
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1248  STATIC int
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1249  xfs_qm_quotacheck_dqadjust(
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1250  	struct xfs_inode	*ip,
1a7ed271653a4f4 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-15  1251  	xfs_dqtype_t		type,
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1252  	xfs_qcnt_t		nblks,
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1253  	xfs_qcnt_t		rtblks)
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1254  {
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1255  	struct xfs_mount	*mp = ip->i_mount;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1256  	struct xfs_dquot	*dqp;
0fcef1270f309df fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1257  	xfs_dqid_t		id;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1258  	int			error;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1259  
0fcef1270f309df fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1260  	id = xfs_qm_id_for_quotatype(ip, type);
30ab2dcf2c0693e fs/xfs/xfs_qm.c       Darrick J. Wong   2018-05-04  1261  	error = xfs_qm_dqget(mp, id, type, true, &dqp);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1262  	if (error) {
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1263  		/*
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1264  		 * Shouldn't be able to turn off quotas here.
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1265  		 */
2451337dd043901 fs/xfs/xfs_qm.c       Dave Chinner      2014-06-25  1266  		ASSERT(error != -ESRCH);
2451337dd043901 fs/xfs/xfs_qm.c       Dave Chinner      2014-06-25  1267  		ASSERT(error != -ENOENT);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1268  		return error;
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06  1269  	}
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1270  
bac6d7a22f57746 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1271  	mutex_lock(&dqp->q_qlock);
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1272  	error = xfs_dquot_attach_buf(NULL, dqp);
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1273  	if (error)
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1274  		return error;
ca378189fdfa890 fs/xfs/xfs_qm.c       Darrick J. Wong   2024-12-02  1275  
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1276  	trace_xfs_dqadjust(dqp);
0b1b213fcf3a848 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2009-12-14  1277  
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1278  	/*
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1279  	 * Adjust the inode count and the block count to reflect this inode's
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1280  	 * resource usage.
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1281  	 */
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1282  	dqp->q_ino.count++;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1283  	dqp->q_ino.reserved++;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1284  	if (nblks) {
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1285  		dqp->q_blk.count += nblks;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1286  		dqp->q_blk.reserved += nblks;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1287  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1288  	if (rtblks) {
be37d40c1ba0b54 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1289  		dqp->q_rtb.count += rtblks;
784e80f5640db9a fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1290  		dqp->q_rtb.reserved += rtblks;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1291  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1292  
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1293  	/*
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1294  	 * Set default limits, adjust timers (since we changed usages)
191f8488f9f7600 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-04-20  1295  	 *
191f8488f9f7600 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-04-20  1296  	 * There are no timers for the default values set in the root dquot.
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1297  	 */
c51df7334167e44 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1298  	if (dqp->q_id) {
c8c753e19a76507 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1299  		xfs_qm_adjust_dqlimits(dqp);
c8c753e19a76507 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1300  		xfs_qm_adjust_dqtimers(dqp);
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1301  	}
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1302  
985a78fdde15e17 fs/xfs/xfs_qm.c       Darrick J. Wong   2020-07-14  1303  	dqp->q_flags |= XFS_DQFLAG_DIRTY;
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1304  	mutex_unlock(&dqp->q_qlock);
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1305  
53d33c2d3e82492 fs/xfs/xfs_qm.c       Christoph Hellwig 2025-09-20  1306  	xfs_qm_dqrele(dqp);
52fda1142495783 fs/xfs/quota/xfs_qm.c Christoph Hellwig 2010-09-06 @1307  	return 0;
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1308  }
^1da177e4c3f415 fs/xfs/quota/xfs_qm.c Linus Torvalds    2005-04-16  1309  

:::::: The code at line 1307 was first introduced by commit
:::::: 52fda114249578311776b25da9f73a9c34f4fd8c xfs: simplify xfs_qm_dqusage_adjust

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Alex Elder <aelder@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
