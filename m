Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC779CE
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679953117; x=1711489117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7IvFhCnhZu1H4j3cqDeepCQjvxi0vE87uFbBx+YD64=;
  b=b2ZUTmWSTOVetixRdTngBhEXdwxpPp7P/la2oTcYtOUKV4N/p+cOuCK/
   9Z0j0wpYoyqzWiKSyxpSHyrAzlGT7EPim/wTVPEatcwU6VhT7yS4aIOft
   kHKJ1DX9a+i0mr77zCFNCy74eV7zEkX+3R00kv5c2B5tH/tii7dwDSnfB
   dpIJbFQDo5/+BCF9C4HulNs7OU3sCTPI0iGXQOlATcA4BOS0ckSSQONv/
   LZqogF+8tvgPGRogDBZecioG5cgVX0eny4ScuwlBrYAqVKJ6jJJZSTfLz
   2nwXM2eW2YmYmRTU79TheE8n1BMHBlW2IKx35Trijtjlm/YL9mepoodWg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339119311"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="339119311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 14:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772882538"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="772882538"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2023 14:38:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pguXy-000I2B-38;
	Mon, 27 Mar 2023 21:38:34 +0000
Date: Tue, 28 Mar 2023 05:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [djwong-xfs:xfile-page-caching 233/287]
 fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation
 before object free at line 58.
Message-ID: <202303280501.z08I3B74-lkp@intel.com>
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
head:   10b2657dfdd633f83d3de6eba27b8e093cf0caa6
commit: e3c7db23e87e9b1c581fd363b4bf59fd567f0ad3 [233/287] xfs: introduce a swap-extent log intent item
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-c44-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280501.z08I3B74-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303280501.z08I3B74-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_swapext_item.c:57:5-24: WARNING: atomic_dec_and_test variation before object free at line 58.

vim +57 fs/xfs/xfs_swapext_item.c

e3c7db23e87e9b Darrick J. Wong 2023-03-06  44  
e3c7db23e87e9b Darrick J. Wong 2023-03-06  45  /*
e3c7db23e87e9b Darrick J. Wong 2023-03-06  46   * Freeing the SXI requires that we remove it from the AIL if it has already
e3c7db23e87e9b Darrick J. Wong 2023-03-06  47   * been placed there. However, the SXI may not yet have been placed in the AIL
e3c7db23e87e9b Darrick J. Wong 2023-03-06  48   * when called by xfs_sxi_release() from SXD processing due to the ordering of
e3c7db23e87e9b Darrick J. Wong 2023-03-06  49   * committed vs unpin operations in bulk insert operations. Hence the reference
e3c7db23e87e9b Darrick J. Wong 2023-03-06  50   * count to ensure only the last caller frees the SXI.
e3c7db23e87e9b Darrick J. Wong 2023-03-06  51   */
e3c7db23e87e9b Darrick J. Wong 2023-03-06  52  STATIC void
e3c7db23e87e9b Darrick J. Wong 2023-03-06  53  xfs_sxi_release(
e3c7db23e87e9b Darrick J. Wong 2023-03-06  54  	struct xfs_sxi_log_item	*sxi_lip)
e3c7db23e87e9b Darrick J. Wong 2023-03-06  55  {
e3c7db23e87e9b Darrick J. Wong 2023-03-06  56  	ASSERT(atomic_read(&sxi_lip->sxi_refcount) > 0);
e3c7db23e87e9b Darrick J. Wong 2023-03-06 @57  	if (atomic_dec_and_test(&sxi_lip->sxi_refcount)) {
e3c7db23e87e9b Darrick J. Wong 2023-03-06 @58  		xfs_trans_ail_delete(&sxi_lip->sxi_item, SHUTDOWN_LOG_IO_ERROR);
e3c7db23e87e9b Darrick J. Wong 2023-03-06  59  		xfs_sxi_item_free(sxi_lip);
e3c7db23e87e9b Darrick J. Wong 2023-03-06  60  	}
e3c7db23e87e9b Darrick J. Wong 2023-03-06  61  }
e3c7db23e87e9b Darrick J. Wong 2023-03-06  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
