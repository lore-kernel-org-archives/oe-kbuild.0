Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC71625
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jul 2023 03:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688441613; x=1719977613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5Oy/rfu8yVKngN6FzitpJ2jLMK47cqUcjswUGsNcko=;
  b=bstxUhO8NeV71db5AKyrkfKv+iaLygDhSER389bc1CxB2rS8tmQyE2WU
   F7lw+oAAqZSsyaMwjCHf+WoRuvN/BS0k1LZphF/3CNNEEVhFz8/GgoiGR
   d7p+1wQgVzyEVm5xyzbY0C9M+bsQ2D+ivSb9lgSA2840vjb4pYtF3f/AY
   rjR5JzspNY2ZNwMeO/24xG0dAIvHNLdYli/j0XTZt8O0lByRFuqViwbZw
   yDTJEnic1zKeMYTjnos6H3g1tCIaCaF3tIuxw0QczZ0rEh67b3GWkMs69
   ItN572f7oMnRRrC8FCtjWJba1ix3qYHwZHZUg4MYNg+5meH0Jji8SMw50
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347811773"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="347811773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 20:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748286038"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="748286038"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2023 20:33:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGWnC-000Hpv-2R;
	Tue, 04 Jul 2023 03:33:30 +0000
Date: Tue, 4 Jul 2023 11:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 163/217]
 fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202307041151.ATbSgHC7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   c0ed27a65e17a5d3db3a6e2a4df60d4642524c8c
commit: 980f0a8802c65a57d3ab07581bae6770a0b8acd8 [163/217] xfs: introduce a swap-extent log intent item
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: xtensa-randconfig-r053-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041151.ATbSgHC7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041151.ATbSgHC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307041151.ATbSgHC7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

980f0a8802c65a Darrick J. Wong 2023-03-06  44  
980f0a8802c65a Darrick J. Wong 2023-03-06  45  /*
980f0a8802c65a Darrick J. Wong 2023-03-06  46   * Freeing the SXI requires that we remove it from the AIL if it has already
980f0a8802c65a Darrick J. Wong 2023-03-06  47   * been placed there. However, the SXI may not yet have been placed in the AIL
980f0a8802c65a Darrick J. Wong 2023-03-06  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
980f0a8802c65a Darrick J. Wong 2023-03-06  49   * committed vs unpin operations in bulk insert operations. Hence the reference
980f0a8802c65a Darrick J. Wong 2023-03-06  50   * count to ensure only the last caller frees the SXI.
980f0a8802c65a Darrick J. Wong 2023-03-06  51   */
980f0a8802c65a Darrick J. Wong 2023-03-06  52  STATIC void
980f0a8802c65a Darrick J. Wong 2023-03-06  53  xfs_sxi_release(
980f0a8802c65a Darrick J. Wong 2023-03-06  54  	struct xfs_sxi_log_item	*sxi_lip)
980f0a8802c65a Darrick J. Wong 2023-03-06  55  {
980f0a8802c65a Darrick J. Wong 2023-03-06  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
980f0a8802c65a Darrick J. Wong 2023-03-06 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
980f0a8802c65a Darrick J. Wong 2023-03-06 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
980f0a8802c65a Darrick J. Wong 2023-03-06  59  		xfs_sxi_item_free(sxi_lip);
980f0a8802c65a Darrick J. Wong 2023-03-06  60  	}
980f0a8802c65a Darrick J. Wong 2023-03-06  61  }
980f0a8802c65a Darrick J. Wong 2023-03-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
