Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55CA949
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686602229; x=1718138229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9S7GFgrwyznHm+9EpOlYuC98FjmBWuKubriUg5lXRo=;
  b=eXtUuwVIT1nV/MXUD0+uXmyE6gsfbsGr+Zu9YwvlLlpvxsbuSwfF8JBK
   rDFXk/llfYdykJ/bVKooUQ5BwrB9geHtXbBYCcXfOoFUP/6mdpztlD1JF
   Q8W5G9IoaeO2GP0FvA76Jy7F/DhCY6BSz702ZMfZpFpTXk7AfYgGjEowi
   N2W7y/iawe8dwOg7eW81aGxfbxgdNvYY+e0eFWP37PTUGLDAmeNX918DK
   krSqqH1sDAXEm3eB/29WykN4KHCyuP0OZU9MrWHfen4BEBlITfGr4164S
   iUtPWv9E/jce3gzr73ZQs6a1C3UXHETY2gtIMCgqMD4E0+IyPZRQo+4uE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="355652700"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="355652700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 13:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="835623538"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="835623538"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2023 13:37:06 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8oHi-0000ge-07;
	Mon, 12 Jun 2023 20:37:06 +0000
Date: Tue, 13 Jun 2023 04:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 142/196]
 fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202306130425.1K2gzDGB-lkp@intel.com>
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
head:   cc77862c21f358548d987f990b0ed32a39255523
commit: 06d3daf2d7009c64a821a2cc8f5cb28f385848d1 [142/196] xfs: introduce a swap-extent log intent item
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: sh-randconfig-c023-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130425.1K2gzDGB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306130425.1K2gzDGB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

06d3daf2d7009c Darrick J. Wong 2023-03-06  44  
06d3daf2d7009c Darrick J. Wong 2023-03-06  45  /*
06d3daf2d7009c Darrick J. Wong 2023-03-06  46   * Freeing the SXI requires that we remove it from the AIL if it has already
06d3daf2d7009c Darrick J. Wong 2023-03-06  47   * been placed there. However, the SXI may not yet have been placed in the AIL
06d3daf2d7009c Darrick J. Wong 2023-03-06  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
06d3daf2d7009c Darrick J. Wong 2023-03-06  49   * committed vs unpin operations in bulk insert operations. Hence the reference
06d3daf2d7009c Darrick J. Wong 2023-03-06  50   * count to ensure only the last caller frees the SXI.
06d3daf2d7009c Darrick J. Wong 2023-03-06  51   */
06d3daf2d7009c Darrick J. Wong 2023-03-06  52  STATIC void
06d3daf2d7009c Darrick J. Wong 2023-03-06  53  xfs_sxi_release(
06d3daf2d7009c Darrick J. Wong 2023-03-06  54  	struct xfs_sxi_log_item	*sxi_lip)
06d3daf2d7009c Darrick J. Wong 2023-03-06  55  {
06d3daf2d7009c Darrick J. Wong 2023-03-06  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
06d3daf2d7009c Darrick J. Wong 2023-03-06 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
06d3daf2d7009c Darrick J. Wong 2023-03-06 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
06d3daf2d7009c Darrick J. Wong 2023-03-06  59  		xfs_sxi_item_free(sxi_lip);
06d3daf2d7009c Darrick J. Wong 2023-03-06  60  	}
06d3daf2d7009c Darrick J. Wong 2023-03-06  61  }
06d3daf2d7009c Darrick J. Wong 2023-03-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
