Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96441E51FA
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760871939; cv=none; b=MkWEyDXCzTrnl2RmXo1yYxlRrdogTYczT/pWSSVw/rXk5aKZisps7I8ijUfzUlZtTuIgZORIRLwAn3w43p9YyinPuWZVKZFu7ueP1xbeUKQDZc1kYVpvaaOND7iINw22UdRpaQGiGc0l+T8NwYbVemR6OSgBg2U7UM9G0di2iCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760871939; c=relaxed/simple;
	bh=piDO6pDpVlETRC32oj6WYM68OlZEAtKi3zFH0uroQNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nF/MAUOPN3ynFgKDEoIN5Eh+IfhaNHbRVkiMxecu3eVyJVIm08MFaaz+BMX5sJ2SGh2x//M41J0dPZXYeRlDaqfZCjLMPUMTo2SNFQcXc9fvykmjIpzshEC0wWQfY2r9/X+LZPc7bjCi+MvcwirMlYcti8McH/aj1we+OI5NUZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPxZ9EtN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPxZ9EtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760871935; x=1792407935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=piDO6pDpVlETRC32oj6WYM68OlZEAtKi3zFH0uroQNE=;
  b=JPxZ9EtN8b8jx51LfUQk85czTeJuqwtweFLQ4dgtAubSdqfeTo49W1AW
   LSFs7zQ5gZo2+mKMKAp2kRACys49rWu4mLKPr5LLV2/tSknEosuHChK09
   lpoovGs6uNicfPluOhrFUQ7S6tB9E0BlZXt6IxBWlRE8NpfmuxGgnqM3S
   Knjp5xLbzGtBd5ByUSmJkTy2l4Ef1mLpBlLRCv6WnszRdm2P6aMq/+H8x
   n7uzVLHZSr+6WICYCEbJElakw8qgqkGk26gi9e396tmoI8pvDv1w7Te0J
   p07GiaOFSKhmUY33FeY+alAWrhYr7CIhAkZbuFFHcOi9SNsr3mWSc/HhN
   w==;
X-CSE-ConnectionGUID: v3UqHnF4RZiPFRGqi4wieQ==
X-CSE-MsgGUID: vrLUNwmJQqOR53dK/XqjEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62723478"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="62723478"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 04:05:35 -0700
X-CSE-ConnectionGUID: oOGO5pjhRpO/CgSUeXNBjQ==
X-CSE-MsgGUID: EgX/abxWR0mObCHhi3uLaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182299982"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2025 04:05:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAREA-00092n-36;
	Sun, 19 Oct 2025 11:05:30 +0000
Date: Sun, 19 Oct 2025 19:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-quota-cleanups 14/20] fs/xfs/scrub/quotacheck.c:605
 xqcheck_compare_dquot() warn: inconsistent returns '&dq->q_qlock'.
Message-ID: <202510191855.DAo2A5zX-lkp@intel.com>
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
commit: 2b4f89bdf5696bbc066f43533a17b891f4cd3ef9 [14/20] xfs: move q_qlock locking into xqcheck_compare_dquot
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251019/202510191855.DAo2A5zX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510191855.DAo2A5zX-lkp@intel.com/

smatch warnings:
fs/xfs/scrub/quotacheck.c:605 xqcheck_compare_dquot() warn: inconsistent returns '&dq->q_qlock'.

vim +605 fs/xfs/scrub/quotacheck.c

48dd9117a34fe9a Darrick J. Wong   2024-02-22  539  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  540  /*
48dd9117a34fe9a Darrick J. Wong   2024-02-22  541   * Part 2: Comparing dquot resource counters.  Walk each xfs_dquot, comparing
48dd9117a34fe9a Darrick J. Wong   2024-02-22  542   * the resource usage counters against our shadow dquots; and then walk each
48dd9117a34fe9a Darrick J. Wong   2024-02-22  543   * shadow dquot (that wasn't covered in the first part), comparing it against
48dd9117a34fe9a Darrick J. Wong   2024-02-22  544   * the xfs_dquot.
48dd9117a34fe9a Darrick J. Wong   2024-02-22  545   */
48dd9117a34fe9a Darrick J. Wong   2024-02-22  546  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  547  /*
48dd9117a34fe9a Darrick J. Wong   2024-02-22  548   * Check the dquot data against what we observed.  Caller must hold the dquot
48dd9117a34fe9a Darrick J. Wong   2024-02-22  549   * lock.
48dd9117a34fe9a Darrick J. Wong   2024-02-22  550   */
48dd9117a34fe9a Darrick J. Wong   2024-02-22  551  STATIC int
48dd9117a34fe9a Darrick J. Wong   2024-02-22  552  xqcheck_compare_dquot(
48dd9117a34fe9a Darrick J. Wong   2024-02-22  553  	struct xqcheck		*xqc,
48dd9117a34fe9a Darrick J. Wong   2024-02-22  554  	xfs_dqtype_t		dqtype,
48dd9117a34fe9a Darrick J. Wong   2024-02-22  555  	struct xfs_dquot	*dq)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  556  {
48dd9117a34fe9a Darrick J. Wong   2024-02-22  557  	struct xqcheck_dquot	xcdq;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  558  	struct xfarray		*counts = xqcheck_counters_for(xqc, dqtype);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  559  	int			error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  560  
200491875ce144f Darrick J. Wong   2024-02-22  561  	if (xchk_iscan_aborted(&xqc->iscan)) {
200491875ce144f Darrick J. Wong   2024-02-22  562  		xchk_set_incomplete(xqc->sc);
200491875ce144f Darrick J. Wong   2024-02-22  563  		return -ECANCELED;
200491875ce144f Darrick J. Wong   2024-02-22  564  	}
200491875ce144f Darrick J. Wong   2024-02-22  565  
2b4f89bdf5696bb Christoph Hellwig 2025-09-20  566  	mutex_lock(&dq->q_qlock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  567  	mutex_lock(&xqc->lock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  568  	error = xfarray_load_sparse(counts, dq->q_id, &xcdq);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  569  	if (error)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  570  		goto out_unlock;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  571  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  572  	if (xcdq.icount != dq->q_ino.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  573  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  574  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  575  	if (xcdq.bcount != dq->q_blk.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  576  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  577  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  578  	if (xcdq.rtbcount != dq->q_rtb.count)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  579  		xchk_qcheck_set_corrupt(xqc->sc, dqtype, dq->q_id);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  580  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  581  	xcdq.flags |= (XQCHECK_DQUOT_COMPARE_SCANNED | XQCHECK_DQUOT_WRITTEN);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  582  	error = xfarray_store(counts, dq->q_id, &xcdq);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  583  	if (error == -EFBIG) {
48dd9117a34fe9a Darrick J. Wong   2024-02-22  584  		/*
48dd9117a34fe9a Darrick J. Wong   2024-02-22  585  		 * EFBIG means we tried to store data at too high a byte offset
48dd9117a34fe9a Darrick J. Wong   2024-02-22  586  		 * in the sparse array.  IOWs, we cannot complete the check and
48dd9117a34fe9a Darrick J. Wong   2024-02-22  587  		 * must notify userspace that the check was incomplete.  This
200491875ce144f Darrick J. Wong   2024-02-22  588  		 * should never happen outside of the collection phase.
48dd9117a34fe9a Darrick J. Wong   2024-02-22  589  		 */
48dd9117a34fe9a Darrick J. Wong   2024-02-22  590  		xchk_set_incomplete(xqc->sc);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  591  		error = -ECANCELED;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  592  	}
48dd9117a34fe9a Darrick J. Wong   2024-02-22  593  	mutex_unlock(&xqc->lock);
2b4f89bdf5696bb Christoph Hellwig 2025-09-20  594  	mutex_unlock(&dq->q_qlock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22  595  	if (error)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  596  		return error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  597  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  598  	if (xqc->sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
48dd9117a34fe9a Darrick J. Wong   2024-02-22  599  		return -ECANCELED;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  600  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  601  	return 0;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  602  
48dd9117a34fe9a Darrick J. Wong   2024-02-22  603  out_unlock:
48dd9117a34fe9a Darrick J. Wong   2024-02-22  604  	mutex_unlock(&xqc->lock);
48dd9117a34fe9a Darrick J. Wong   2024-02-22 @605  	return error;
48dd9117a34fe9a Darrick J. Wong   2024-02-22  606  }
48dd9117a34fe9a Darrick J. Wong   2024-02-22  607  

:::::: The code at line 605 was first introduced by commit
:::::: 48dd9117a34fe9a34a6be0b1dba5694e0f19cbd4 xfs: implement live quotacheck inode scan

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
