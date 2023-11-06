Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BB18636
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 11:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xn6FYE4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699271521; x=1730807521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0fbU+Tk9Rm7i389iOSuDP4qsJzKTBoitdw7QqrWQ+A=;
  b=Xn6FYE4vsv+Cmj5ujG1aXZegRZG5GKS21tghhdiGjm86x0Aqr2qdwbOK
   0+W6tO2JItq+SHxhCCkLem69dW2Fe6JXGjg5dlzE+hVnPG2l+hoEApQGh
   c7HtWVd4O35i9QrXTkHU5jdBaqntXNvaXqfJKEhEqxy1tUneuLodFKf6z
   NXZ8xzQ+3rXKiZslksjQDr6tGHjSwov4v5qmEW1EzY4uEFNItwhE9aJSO
   TFDVYTcY2Omv/IaNeG14agF/bzkNOmD6NCNteEWKooUw70JWVFlm4m3h5
   cHO02vNtdTsiZZh0yYdk/OkIExyIIeRhjSTlleIBdW5TK+7xk85W0Z1Ol
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="475494032"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="475494032"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 03:52:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852981474"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="852981474"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Nov 2023 03:51:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzy96-0006NC-2m;
	Mon, 06 Nov 2023 11:51:56 +0000
Date: Mon, 6 Nov 2023 19:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djwong-xfs:report-refcounts 436/501]
 fs/xfs/libxfs/xfs_refcount.c:129 xfs_refcount_check_perag_irec() warn:
 impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
Message-ID: <202311061939.luHEIhei-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   0a31e564c5c22bd33b46625694f7ccbb694dceb3
commit: 596535d265cf30cca3a7c0b32dc042019f8b3fc7 [436/501] xfs: namespace the maximum length/refcount symbols
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231106 (https://download.01.org/0day-ci/archive/20231106/202311061939.luHEIhei-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061939.luHEIhei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061939.luHEIhei-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_refcount.c:129 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_blockcount > (~0)) => (0-u32max > u32max)'
fs/xfs/libxfs/xfs_refcount.c:139 xfs_refcount_check_perag_irec() warn: impossible condition '(irec->rc_refcount > (~0)) => (0-u32max > u32max)'

vim +129 fs/xfs/libxfs/xfs_refcount.c

174edb0e46e520 Darrick J. Wong 2016-10-03  123  
a1b475f3cac721 Darrick J. Wong 2023-03-06  124  inline xfs_failaddr_t
a1b475f3cac721 Darrick J. Wong 2023-03-06  125  xfs_refcount_check_perag_irec(
a1b475f3cac721 Darrick J. Wong 2023-03-06  126  	struct xfs_perag		*pag,
2b30cc0bf0589d Darrick J. Wong 2023-04-11  127  	const struct xfs_refcount_irec	*irec)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  128  {
596535d265cf30 Darrick J. Wong 2023-03-06 @129  	if (irec->rc_blockcount == 0 || irec->rc_blockcount > XFS_REFC_LEN_MAX)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  130  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  131  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  132  	if (!xfs_refcount_check_domain(irec))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  133  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  134  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  135  	/* check for valid extent range, including overflow */
2b30cc0bf0589d Darrick J. Wong 2023-04-11  136  	if (!xfs_verify_agbext(pag, irec->rc_startblock, irec->rc_blockcount))
2b30cc0bf0589d Darrick J. Wong 2023-04-11  137  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  138  
596535d265cf30 Darrick J. Wong 2023-03-06 @139  	if (irec->rc_refcount == 0 || irec->rc_refcount > XFS_REFC_REFCOUNT_MAX)
2b30cc0bf0589d Darrick J. Wong 2023-04-11  140  		return __this_address;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  141  
2b30cc0bf0589d Darrick J. Wong 2023-04-11  142  	return NULL;
2b30cc0bf0589d Darrick J. Wong 2023-04-11  143  }
2b30cc0bf0589d Darrick J. Wong 2023-04-11  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
