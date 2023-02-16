Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E17B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676537304; x=1708073304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gw+gT/AsumbFSAyOR5cFa4xr/Zcz27pmYcq8BIvN6vg=;
  b=L8+RxcdSix0slvxaeELEC2T5Gcs6OSXYl3U20qJc/TF2HksD3YLGybPb
   2JQ3VG/RDXPEHEDYTN0P/LTjN9+hZvdSaQrTWn09bErJZsl4gCIJKGX1h
   wXjt5ghJeAkHGWyFgPlGINTCWN5W+UAcuu91f4MNaOKOsa7jnNk3EXLWA
   69BO2cWYVAYYd1v+UNEb3fug71JPCJpRy5vinaQejWaoOadSdwBNIXWaC
   f4axLeYe4YlHRrtVz6/rcokgI1a3dtXdyZbBSGCDbPPpOLkopNVUbEAnU
   RgN3WP4/x/EMTKdhl9GJwjsWugNfcTdfNo9dXZMaLXYjq9knpJ6GKcSVW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396304972"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="396304972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 00:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="663384685"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="663384685"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2023 00:48:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSZwE-000A9p-0J;
	Thu, 16 Feb 2023 08:48:22 +0000
Date: Thu, 16 Feb 2023 16:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 220/268]
 fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
Message-ID: <202302161638.PK6yYrWm-lkp@intel.com>
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
head:   b1434f1ffff0b89a85493bd8ab8c880b3887ca75
commit: 890bcee8bff999cc2d8ee10916502ec3f30b085b [220/268] xfs: add a ->xchg_file_range handler
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230216/202302161638.PK6yYrWm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302161638.PK6yYrWm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:186:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:187:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
