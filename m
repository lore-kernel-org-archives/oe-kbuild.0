Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8A2596
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 22:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679957440; x=1711493440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RC2SA2z/c1Y/G2+kZFjoUU42rAx+0B/mXKSCYtjxg6U=;
  b=AxRBjHVZWGEHopmSVp0i3pfp5E0uDrS+vFohZWWQ4HO8JCjzC5NyHqjg
   LPjyPRQnZ75AEXhQugCR0Z8kqE+/2KSrW9kFVIWh+uVXhBD9bvMy3zdNJ
   rY0KtHkHmQcBO7DTWpCvyOZTCmDqmBcYfuK5s00fGg/aHFlNxctYGyVHw
   YW7qYA1iuIGVk/mV87S36JhGs47imM9IGgwk8NtevGPXU2+La/C3VC4DK
   gySeI9ppwdz5EQaO1YDp3Odmknq0dlehjfwR870dmIUP/HRgMh9wEgX7H
   QNUxEH9rtlf9dqwOGA7w2DJr2GQ5tFwf/pTUvFCmyjftMQnWK5XlG7P0F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337911194"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="337911194"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 15:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772901521"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="772901521"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2023 15:50:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgvfg-000I4N-36;
	Mon, 27 Mar 2023 22:50:36 +0000
Date: Tue, 28 Mar 2023 06:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 236/287]
 fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
Message-ID: <202303280635.Wyf89H5Y-lkp@intel.com>
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
commit: bd814af9c7536ad3d5c23423f29377dcd64edddc [236/287] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-c44-20230326 (https://download.01.org/0day-ci/archive/20230328/202303280635.Wyf89H5Y-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303280635.Wyf89H5Y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:587:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
