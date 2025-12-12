Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B138312819
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530707; cv=none; b=ekK3TJnsUb1eS111w1N1fXkJC/OOKlLXB8lOV37bAiB/fn3qI5JB0319X9V39V0ghnnOvo04ybrcbROOzg/alr3eNHkGU26PIMJ9hmub/nKjtsdXEAuAuMoGPLFHd+gLUgfnv7wGVmX6IJAHy1xuXJl+4vqxS+NxPu8hIxa5wOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530707; c=relaxed/simple;
	bh=SfvSh23CeX1EoIs/pMM67edB3BFOE+i1uNPqKIq6a8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gexw/cnYs7TLIRHdVazRPQkyReCo6yZqFAy1sHUrFydiQZxjDddSwL01ZjmNdgcHyjJZ3iltYDd2C7JHxzIUUlRnyTnoqSSQYtTfkOP3tO4UQSsJxaFAkqzyBf58DZOEXHsPDnVgNNLLBQruz50zCqxMbdV6GsN28nzvIaRx2Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJa+9rb2; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJa+9rb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765530705; x=1797066705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfvSh23CeX1EoIs/pMM67edB3BFOE+i1uNPqKIq6a8A=;
  b=OJa+9rb2oQqVPmrLLt75OccFGFNLrNg6piiaeWbIoJaKRKz6+Ja4j2PT
   U/u9J6epP/7rfX+HKUcpoaGIamTsZ2r3DJ4pXxxbVVfTTnoJ4Dic9r6/g
   yDZnD8ZFBFlBOWLGs+fVY+p7PONhlOEWuxVTk59VjEN+v1fkcRPjzS9cD
   H88XTmZ1eRVqtDiTpCEB5Rfc5MiaBE08OSJd6nZUEbaBlvJyAa+mseQkK
   3ibvglvPG6qUnPLLFwTHrU/J0XDoYdpw1mATVCRsQvluikSMqRIMCBzbM
   +L6HgR/mvxWVu772dIELnobMVzmFhpeebO/m603mj0WTQMruaZXfeooQV
   A==;
X-CSE-ConnectionGUID: zboeIDYXTjiUzrRR4n7Yiw==
X-CSE-MsgGUID: 9pZKXvJqT4y4ZKcUNWfsvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67595688"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67595688"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 01:11:44 -0800
X-CSE-ConnectionGUID: LQ0clmSlSEaChfChBA7nWg==
X-CSE-MsgGUID: XRzC+CTuTjeG459zshDLGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196119180"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 01:11:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTzBc-000000005qe-1DFE;
	Fri, 12 Dec 2025 09:11:40 +0000
Date: Fri, 12 Dec 2025 17:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/xfs/xfs_rtalloc.c:1691 xfs_rtmount_inodes() error: uninitialized
 symbol 'error'.
Message-ID: <202512121641.tJQ8xZMO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Carlos Maiolino <cem@kernel.org>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: d8e1ea43e5a314bc01ec059ce93396639dcf9112 xfs: return the allocated transaction from xfs_trans_alloc_empty
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251212/202512121641.tJQ8xZMO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121641.tJQ8xZMO-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_rtalloc.c:1691 xfs_rtmount_inodes() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/xfs/xfs_rtalloc.c:333 xfs_rtallocate_extent_block() error: uninitialized symbol 'next'.
fs/xfs/xfs_rtalloc.c:1299 xfs_growfs_rt_prep_groups() warn: impossible condition '(*new_rgcount > ((-1))) => (0-u32max > u32max)'

vim +/error +1691 fs/xfs/xfs_rtalloc.c

65b1231b8cea7f Darrick J. Wong   2024-11-03  1660  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1661  /*
355e3532132b48 Omar Sandoval     2018-12-12  1662   * Get the bitmap and summary inodes and the summary cache into the mount
355e3532132b48 Omar Sandoval     2018-12-12  1663   * structure at mount time.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1664   */
dcf606914334c6 Darrick J. Wong   2024-11-03  1665  int
^1da177e4c3f41 Linus Torvalds    2005-04-16  1666  xfs_rtmount_inodes(
dcf606914334c6 Darrick J. Wong   2024-11-03  1667  	struct xfs_mount	*mp)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1668  {
dcf606914334c6 Darrick J. Wong   2024-11-03  1669  	struct xfs_trans	*tp;
87fe4c34a383d5 Darrick J. Wong   2024-11-03  1670  	struct xfs_rtgroup	*rtg = NULL;
dcf606914334c6 Darrick J. Wong   2024-11-03  1671  	int			error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1672  
d8e1ea43e5a314 Christoph Hellwig 2025-07-16  1673  	tp = xfs_trans_alloc_empty(mp);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1674  	if (xfs_has_rtgroups(mp) && mp->m_sb.sb_rgcount > 0) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1675  		error = xfs_rtginode_load_parent(tp);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1676  		if (error)
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1677  			goto out_cancel;
65b1231b8cea7f Darrick J. Wong   2024-11-03  1678  	}
65b1231b8cea7f Darrick J. Wong   2024-11-03  1679  
65b1231b8cea7f Darrick J. Wong   2024-11-03  1680  	while ((rtg = xfs_rtgroup_next(mp, rtg))) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1681  		error = xfs_rtmount_rtg(mp, tp, rtg);
65b1231b8cea7f Darrick J. Wong   2024-11-03  1682  		if (error) {
65b1231b8cea7f Darrick J. Wong   2024-11-03  1683  			xfs_rtgroup_rele(rtg);
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1684  			xfs_rtunmount_inodes(mp);
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1685  			break;
65b1231b8cea7f Darrick J. Wong   2024-11-03  1686  		}
65b1231b8cea7f Darrick J. Wong   2024-11-03  1687  	}
87fe4c34a383d5 Darrick J. Wong   2024-11-03  1688  
e3088ae2dcae3c Christoph Hellwig 2024-11-03  1689  out_cancel:
dcf606914334c6 Darrick J. Wong   2024-11-03  1690  	xfs_trans_cancel(tp);
9e13975bb0620c Darrick J. Wong   2022-11-06 @1691  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1692  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1693  

:::::: The code at line 1691 was first introduced by commit
:::::: 9e13975bb0620c2bfa1a4d2943e7eb8514f7708e xfs: load rtbitmap and rtsummary extent mapping btrees at mount time

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
