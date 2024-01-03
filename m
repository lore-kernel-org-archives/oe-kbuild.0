Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F71946B
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vk8wU904"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704282984; x=1735818984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BIJtmf+XapvqqsPnSTms4EM+v4vkQqLH8ZGBCX/+q60=;
  b=Vk8wU904uT+Qo2VSRZdtbQwvuuwy6YKexolQVcJ44FeJRX43vLAIDfJF
   swF3GUTZZ75WFuiPxNWmVadMEIu+pTQZYumYSpJX0UOSCO22AgJRh/RMJ
   VMj8BkMxag7UaOk7TjRZ1LKpoDP6IpTOU9LB6aY+6k79y/7sRmcuqYX5l
   LyYaYPmwfCfke1Ck5bc7xHBySGIRewOSdM4A8ytaRPr0zsPcQeJu9SxyI
   IG0A8LYaCNXakpLixsQuD9FWZ7Nh5PkzsRD8J49isUhbXTCQ/iZBS2Gx6
   gbf0K6hAiyYbtqjeHeUnwBu/Q4oCkNKvIb0vVRxsjEQomlSSAVAI/MRxt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4081654"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4081654"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 03:56:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850422436"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="850422436"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2024 03:56:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKzr9-000M2i-2M;
	Wed, 03 Jan 2024 11:56:19 +0000
Date: Wed, 3 Jan 2024 19:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 153/205]
 fs/xfs/xfs_swapext_item.c:61:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 62.
Message-ID: <202401031943.jhIJwRO1-lkp@intel.com>
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

Hi Darrick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   b18189bccabcaf5598270916c6cd355f8486f30e
commit: a562ed8cb6973bf07f2ddf4e49f1386ef4e7a5ce [153/205] xfs: create deferred log items for extent swapping
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-102-20231212 (https://download.01.org/0day-ci/archive/20240103/202401031943.jhIJwRO1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401031943.jhIJwRO1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:61:5-24: WARNING: atomic_dec_and_test variation before object free at line 62.

vim +61 fs/xfs/xfs_swapext_item.c

2db151f2e053ec Darrick J. Wong 2023-03-06  48  
2db151f2e053ec Darrick J. Wong 2023-03-06  49  /*
2db151f2e053ec Darrick J. Wong 2023-03-06  50   * Freeing the SXI requires that we remove it from the AIL if it has already
2db151f2e053ec Darrick J. Wong 2023-03-06  51   * been placed there. However, the SXI may not yet have been placed in the AIL
2db151f2e053ec Darrick J. Wong 2023-03-06  52   * when called by xfs_sxi_release() from SXD processing due to the ordering of
2db151f2e053ec Darrick J. Wong 2023-03-06  53   * committed vs unpin operations in bulk insert operations. Hence the reference
2db151f2e053ec Darrick J. Wong 2023-03-06  54   * count to ensure only the last caller frees the SXI.
2db151f2e053ec Darrick J. Wong 2023-03-06  55   */
2db151f2e053ec Darrick J. Wong 2023-03-06  56  STATIC void
2db151f2e053ec Darrick J. Wong 2023-03-06  57  xfs_sxi_release(
2db151f2e053ec Darrick J. Wong 2023-03-06  58  	struct xfs_sxi_log_item	*sxi_lip)
2db151f2e053ec Darrick J. Wong 2023-03-06  59  {
2db151f2e053ec Darrick J. Wong 2023-03-06  60  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
2db151f2e053ec Darrick J. Wong 2023-03-06 @61  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
2db151f2e053ec Darrick J. Wong 2023-03-06 @62  		xfs_trans_ail_delete(&sxi_lip->sxi_item, 0);
2db151f2e053ec Darrick J. Wong 2023-03-06  63  		xfs_sxi_item_free(sxi_lip);
2db151f2e053ec Darrick J. Wong 2023-03-06  64  	}
2db151f2e053ec Darrick J. Wong 2023-03-06  65  }
2db151f2e053ec Darrick J. Wong 2023-03-06  66  

:::::: The code at line 61 was first introduced by commit
:::::: 2db151f2e053ec58ea6f4a37325eec5aff35d5f5 xfs: introduce a swap-extent log intent item

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
