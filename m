Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5D15B4
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Apr 2023 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645256; x=1714181256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+u6lkN4RaACEWMwKFvpvvdOGbeH/sVKxjWKkSmsg/e0=;
  b=SIn9DRtBMrg4JEw49kjcs2expqSfYQ3aCoP5s5u9e5z1CqGRGMtDmhcI
   uKlUfmy17kOPNy4B4yYeTETnIu+LluuFkbMy0v1mQBwKj4FaOirGrDUds
   XclcLa4BYDLcbgY6sXjPym/2/z3Kozq4ITp445gfxBG3pPBPEmiLQ1Qa9
   dVMwdkW9sbON+Y7pxxmWM0bq5QdcdMpnNVfebO6oahtS62lQxS9HlD008
   kCb5KsPgGOu5hlG1/rCbatDoPL2Ic3HHV9BKlD3u+CN+oyQIDT0Rk23Sm
   hXyGn11COKHQxbvEaAx4MxDYUwlJhTklbewuqikIuXCBfsran79Ln2+5X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071966"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071966"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868962674"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="868962674"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000GB-1s;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 242/293]
 fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
Message-ID: <202304280935.QI03ZzGB-lkp@intel.com>
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
commit: 17832f9e877c398c738aa11ea9151f81f18508bc [242/293] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-c032-20230423 (https://download.01.org/0day-ci/archive/20230428/202304280935.QI03ZzGB-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304280935.QI03ZzGB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:587:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
