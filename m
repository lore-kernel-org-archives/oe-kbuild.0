Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2C3806C0
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jul 2026 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350973; cv=none; b=MTsTbv5qmdg1U1O6I/c208kaIVaCrMI7CXlqOZMGy/5cZ9LF0APh/Hy79Bwizodhj18rCIbMIWMeNisk7SGOU1/B0siz680zEkUsneKkK20sPJCqzBLqwvpqxeI/rCCfPCkjh79XVbeKKQurGNi+F9k4FduwEniNoLS8btjEEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350973; c=relaxed/simple;
	bh=ZxgYCaRSFUX2E45cFbU3KDfXdYhqIs/zyM+wgnd1ejI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MlFlSeByECHQV9rp5BPVZtb83Nl/W/faQiHtwoai3BH6EADE2zaWawLkQ4XiYctePu3MgNK7fWtiboq4U2hyKqNIsjzKYdeP3xGnZnuQz/Q0D8cnBHN3kdkqCwzYSP45f8YoeNMPwDXfwLtC4EeZLGJtv6xzId+jfLNBUr9MqDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTP6DZuA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTP6DZuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783350970; x=1814886970;
  h=date:from:to:cc:subject:message-id;
  bh=ZxgYCaRSFUX2E45cFbU3KDfXdYhqIs/zyM+wgnd1ejI=;
  b=HTP6DZuAkjn2pxJ2AtaXCK/vsVWX2rkBKJ2Ghr9CmGTcMSN6AnOl9rN7
   7WHTxg2gzgb8OcNfGACOb2f3aal5MLCfxyZB7fKhvrlpJstedQk81msrC
   XcQgsewOMgkI0b9KYsa06492bakufqNi3R96wuv8tXexJ64OocunniYOx
   IGRNpx4YsJk1ZoJIXH84lxFhOcBG69ZdIL7/fEKhkiSZJfKD+Vp1cbOMC
   +ppmFPoygtmdwnJ5/qSFphXVz2+0TOwfGV1pr7Ue7Fytxy2H2v0OjD6lk
   W8pgjWIbnTfd4qpHrREjiBIy9s6nE8zfnVCLjW28oZBnO3I5fnpZWexl+
   w==;
X-CSE-ConnectionGUID: s3s/4U7JTlSrSrKum333qQ==
X-CSE-MsgGUID: Cdd1OsK1QqyVcIWnvkm0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84079244"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="84079244"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 08:16:10 -0700
X-CSE-ConnectionGUID: W+qkqPNeTRqjoeWc3IwIfA==
X-CSE-MsgGUID: YCV0zssYTSG0M7KJKHcUHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253274249"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Jul 2026 08:16:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgl3G-00000000EU5-39rk;
	Mon, 06 Jul 2026 15:16:06 +0000
Date: Mon, 06 Jul 2026 23:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:xfs-codex-fixes 119/122]
 fs/xfs/scrub/quota_repair.c:320 xrep_quota_block() warn: statement has no
 effect 'int'
Message-ID: <202607062338.zg159u8g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-codex-fixes
head:   8cb8707b5e700fabc3c6bcd612aa914b4bc54fa4
commit: 7606c37564764f10a45b99dd82490fd1499d0dfc [119/122] xfs: reinitialize dquot block if non-first dquot can't load
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: csky-randconfig-r072-20260706 (https://download.01.org/0day-ci/archive/20260706/202607062338.zg159u8g-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607062338.zg159u8g-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/quota_repair.c:320 xrep_quota_block() warn: statement has no effect 'int'

vim +/int +320 fs/xfs/scrub/quota_repair.c

a5b91555403e3a0 Darrick J. Wong 2023-12-15  290  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  291  /* Fix anything the verifiers complain about. */
a5b91555403e3a0 Darrick J. Wong 2023-12-15  292  STATIC int
a5b91555403e3a0 Darrick J. Wong 2023-12-15  293  xrep_quota_block(
a5b91555403e3a0 Darrick J. Wong 2023-12-15  294  	struct xfs_scrub	*sc,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  295  	xfs_daddr_t		daddr,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  296  	xfs_dqtype_t		dqtype,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  297  	xfs_dqid_t		id)
a5b91555403e3a0 Darrick J. Wong 2023-12-15  298  {
a5b91555403e3a0 Darrick J. Wong 2023-12-15  299  	struct xfs_dqblk	*dqblk;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  300  	struct xfs_quotainfo	*qi = sc->mp->m_quotainfo;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  301  	struct xfs_def_quota	*defq = xfs_get_defquota(qi, dqtype);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  302  	struct xfs_buf		*bp = NULL;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  303  	enum xfs_blft		buftype = 0;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  304  	int			i;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  305  	int			error;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  306  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  307  	error = xfs_trans_read_buf(sc->mp, sc->tp, sc->mp->m_ddev_targp, daddr,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  308  			qi->qi_dqchunklen, 0, &bp, &xfs_dquot_buf_ops);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  309  	switch (error) {
a5b91555403e3a0 Darrick J. Wong 2023-12-15  310  	case -EFSBADCRC:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  311  	case -EFSCORRUPTED:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  312  		/* Failed verifier, retry read with no ops. */
a5b91555403e3a0 Darrick J. Wong 2023-12-15  313  		error = xfs_trans_read_buf(sc->mp, sc->tp,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  314  				sc->mp->m_ddev_targp, daddr, qi->qi_dqchunklen,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  315  				0, &bp, NULL);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  316  		if (error)
a5b91555403e3a0 Darrick J. Wong 2023-12-15  317  			return error;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  318  		break;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  319  	case 0:
7606c37564764f1 Darrick J. Wong 2026-07-02 @320  		int		bad = 0;
7606c37564764f1 Darrick J. Wong 2026-07-02  321  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  322  		dqblk = bp->b_addr;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  323  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  324  		/*
a5b91555403e3a0 Darrick J. Wong 2023-12-15  325  		 * If there's nothing that would impede a dqiterate, we're
a5b91555403e3a0 Darrick J. Wong 2023-12-15  326  		 * done.
a5b91555403e3a0 Darrick J. Wong 2023-12-15  327  		 */
7606c37564764f1 Darrick J. Wong 2026-07-02  328  		for (i = 0; i < qi->qi_dqperchunk; i++, dqblk++) {
7606c37564764f1 Darrick J. Wong 2026-07-02  329  			struct xfs_disk_dquot	*ddq = &dqblk->dd_diskdq;
7606c37564764f1 Darrick J. Wong 2026-07-02  330  
7606c37564764f1 Darrick J. Wong 2026-07-02  331  			if ((ddq->d_type & XFS_DQTYPE_REC_MASK) != dqtype ||
7606c37564764f1 Darrick J. Wong 2026-07-02  332  			    id != be32_to_cpu(ddq->d_id))
7606c37564764f1 Darrick J. Wong 2026-07-02  333  				bad++;
7606c37564764f1 Darrick J. Wong 2026-07-02  334  		}
7606c37564764f1 Darrick J. Wong 2026-07-02  335  
7606c37564764f1 Darrick J. Wong 2026-07-02  336  		if (!bad) {
a5b91555403e3a0 Darrick J. Wong 2023-12-15  337  			xfs_trans_brelse(sc->tp, bp);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  338  			return 0;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  339  		}
a5b91555403e3a0 Darrick J. Wong 2023-12-15  340  		break;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  341  	default:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  342  		return error;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  343  	}
a5b91555403e3a0 Darrick J. Wong 2023-12-15  344  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  345  	/* Something's wrong with the block, fix the whole thing. */
a5b91555403e3a0 Darrick J. Wong 2023-12-15  346  	dqblk = bp->b_addr;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  347  	bp->b_ops = &xfs_dquot_buf_ops;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  348  	for (i = 0; i < qi->qi_dqperchunk; i++, dqblk++) {
7606c37564764f1 Darrick J. Wong 2026-07-02  349  		struct xfs_disk_dquot	*ddq = &dqblk->dd_diskdq;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  350  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  351  		trace_xrep_disk_dquot(sc->mp, dqtype, id + i);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  352  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  353  		ddq->d_magic = cpu_to_be16(XFS_DQUOT_MAGIC);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  354  		ddq->d_version = XFS_DQUOT_VERSION;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  355  		ddq->d_type = dqtype;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  356  		ddq->d_id = cpu_to_be32(id + i);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  357  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  358  		if (xfs_has_bigtime(sc->mp) && ddq->d_id)
a5b91555403e3a0 Darrick J. Wong 2023-12-15  359  			ddq->d_type |= XFS_DQTYPE_BIGTIME;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  360  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  361  		xrep_quota_fix_timer(sc->mp, ddq, ddq->d_blk_softlimit,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  362  				ddq->d_bcount, &ddq->d_btimer,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  363  				defq->blk.time);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  364  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  365  		xrep_quota_fix_timer(sc->mp, ddq, ddq->d_ino_softlimit,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  366  				ddq->d_icount, &ddq->d_itimer,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  367  				defq->ino.time);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  368  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  369  		xrep_quota_fix_timer(sc->mp, ddq, ddq->d_rtb_softlimit,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  370  				ddq->d_rtbcount, &ddq->d_rtbtimer,
a5b91555403e3a0 Darrick J. Wong 2023-12-15  371  				defq->rtb.time);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  372  
a5b91555403e3a0 Darrick J. Wong 2023-12-15  373  		/* We only support v5 filesystems so always set these. */
51ed85ad4e4c5ef Darrick J. Wong 2026-06-08  374  		dqblk->dd_lsn = 0;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  375  		uuid_copy(&dqblk->dd_uuid, &sc->mp->m_sb.sb_meta_uuid);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  376  		xfs_update_cksum((char *)dqblk, sizeof(struct xfs_dqblk),
a5b91555403e3a0 Darrick J. Wong 2023-12-15  377  				 XFS_DQUOT_CRC_OFF);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  378  	}
a5b91555403e3a0 Darrick J. Wong 2023-12-15  379  	switch (dqtype) {
a5b91555403e3a0 Darrick J. Wong 2023-12-15  380  	case XFS_DQTYPE_USER:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  381  		buftype = XFS_BLFT_UDQUOT_BUF;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  382  		break;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  383  	case XFS_DQTYPE_GROUP:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  384  		buftype = XFS_BLFT_GDQUOT_BUF;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  385  		break;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  386  	case XFS_DQTYPE_PROJ:
a5b91555403e3a0 Darrick J. Wong 2023-12-15  387  		buftype = XFS_BLFT_PDQUOT_BUF;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  388  		break;
a5b91555403e3a0 Darrick J. Wong 2023-12-15  389  	}
a5b91555403e3a0 Darrick J. Wong 2023-12-15  390  	xfs_trans_buf_set_type(sc->tp, bp, buftype);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  391  	xfs_trans_log_buf(sc->tp, bp, 0, BBTOB(bp->b_length) - 1);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  392  	return xrep_roll_trans(sc);
a5b91555403e3a0 Darrick J. Wong 2023-12-15  393  }
a5b91555403e3a0 Darrick J. Wong 2023-12-15  394  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
