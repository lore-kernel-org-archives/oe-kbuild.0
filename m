Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C865A84
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 21:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBlGUjvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702415768; x=1733951768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6QmHvNSiYBZbtKN9cB/tx91dlMw8CuZcRvhDWbpAI4=;
  b=cBlGUjvuEZTPvJSWdxZX1OspA3WUX5s+H2CtSymoa45BQuDyz0gr+u2o
   R94ryy212AKxSYcmwjJKgxNlusPNJfjbE0JCVgPkSAs1oPZsgIAn7tflB
   N4mvLx3Djp0074ErGkZbpq0JifmLGtPnhuXw8+Bz5/5gn5k4VQQQllJwJ
   2QqyDATlg8MVSoL6gjMQESew07+nP1YTrASwon5boNxVjgJy8AJpnwm/K
   N60vTHVz1cMfUoqye26RX54TMAJFvODYB7YiRdusVToXbNbBTsh0AcNqi
   e4Ke6M5BUlZCKkwySTqI7J+LTIT43Sa0xvqj/N6UTnxsQ9TtzCQcLhOrX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="375024823"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="375024823"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 13:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="917421050"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="917421050"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2023 13:16:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDA6l-000Jjx-14;
	Tue, 12 Dec 2023 21:16:03 +0000
Date: Wed, 13 Dec 2023 05:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 153/205]
 fs/xfs/xfs_swapext_item.c:61:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 62.
Message-ID: <202312130510.ynNaaxfS-lkp@intel.com>
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
head:   ae5732f1c245c24e63c885992c35f723f36f79ff
commit: a562ed8cb6973bf07f2ddf4e49f1386ef4e7a5ce [153/205] xfs: create deferred log items for extent swapping
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-102-20231212 (https://download.01.org/0day-ci/archive/20231213/202312130510.ynNaaxfS-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130510.ynNaaxfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312130510.ynNaaxfS-lkp@intel.com/

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
