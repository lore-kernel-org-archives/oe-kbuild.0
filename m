Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E83D179
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 00:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682640936; x=1714176936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IJK6Sie2zwIc35sRwxpNReFri3rJ7o9s0CbWLW8B7WE=;
  b=h++55nn0W/q1cZehfko8T2xiAsXZ45QjUTCSDIYoVZvfAowl5jwdDfNu
   FULr4pV1RbIfA115VDXU0ClVuHU9aLdUXS2DgzaOK74tBpym0l/if3Jqj
   qgTP5SWHrOOQs92zpiks98sNX8eLLnaMxJ1FevuT0NBJGl5RG9cq6WaoG
   Q48aCT3efV3n8MUqjr2duXJbS4heDvAaracAI4E9iNH4kzuDQNPUcUaYJ
   mfPyPU4DY69+JI6AH4c/8aaeXLL/XOniQWxuN6wDbxipU8e9/ECxVuWWv
   /UjJQBMPV8Yh0+lO+TZEbsgZjiDRqJZh8O4ByOkTXT6Y6LdUOwlXGYA8/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="412989416"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="412989416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 17:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868940774"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868940774"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 17:15:30 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psBlq-0000DZ-0A;
	Fri, 28 Apr 2023 00:15:30 +0000
Date: Fri, 28 Apr 2023 08:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 239/293]
 fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202304280800.q1Oon7Bn-lkp@intel.com>
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
head:   69839640c25abcba17f4ab837ecb39fceae17082
commit: dc7cb20d92819eb1909d893036c34b72b0c1734c [239/293] xfs: introduce a swap-extent log intent item
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-c032-20230423 (https://download.01.org/0day-ci/archive/20230428/202304280800.q1Oon7Bn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304280800.q1Oon7Bn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

dc7cb20d92819e Darrick J. Wong 2023-03-06  44  
dc7cb20d92819e Darrick J. Wong 2023-03-06  45  /*
dc7cb20d92819e Darrick J. Wong 2023-03-06  46   * Freeing the SXI requires that we remove it from the AIL if it has already
dc7cb20d92819e Darrick J. Wong 2023-03-06  47   * been placed there. However, the SXI may not yet have been placed in the AIL
dc7cb20d92819e Darrick J. Wong 2023-03-06  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
dc7cb20d92819e Darrick J. Wong 2023-03-06  49   * committed vs unpin operations in bulk insert operations. Hence the reference
dc7cb20d92819e Darrick J. Wong 2023-03-06  50   * count to ensure only the last caller frees the SXI.
dc7cb20d92819e Darrick J. Wong 2023-03-06  51   */
dc7cb20d92819e Darrick J. Wong 2023-03-06  52  STATIC void
dc7cb20d92819e Darrick J. Wong 2023-03-06  53  xfs_sxi_release(
dc7cb20d92819e Darrick J. Wong 2023-03-06  54  	struct xfs_sxi_log_item	*sxi_lip)
dc7cb20d92819e Darrick J. Wong 2023-03-06  55  {
dc7cb20d92819e Darrick J. Wong 2023-03-06  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
dc7cb20d92819e Darrick J. Wong 2023-03-06 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
dc7cb20d92819e Darrick J. Wong 2023-03-06 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
dc7cb20d92819e Darrick J. Wong 2023-03-06  59  		xfs_sxi_item_free(sxi_lip);
dc7cb20d92819e Darrick J. Wong 2023-03-06  60  	}
dc7cb20d92819e Darrick J. Wong 2023-03-06  61  }
dc7cb20d92819e Darrick J. Wong 2023-03-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
