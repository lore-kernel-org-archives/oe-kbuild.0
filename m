Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BE3A937
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Apr 2023 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682636692; x=1714172692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QT9orJZ8b89OxNIdsK8d1jF7XNItxfUllXr1eNYRmRU=;
  b=E4rF4XXzQBHmd20cshWXyseXvNKHm5oOjxlOvB5bBUpcE/F/wY/Q0HnH
   vrBWiMqqHf4z/kAdTD/xQdthYlgB17unncjLTQSlE2oZfGNQl0f+cMxj4
   Di3At2veFo/YiZgI3WPEQhO6bsFynZ/MNvU0W8eWGeulpqRe+w4Nstkov
   hsT/b2owzlJr4O0iKg3hHz4S1urnzFO5e3DhZMwawLHS3s4NoqlEJlJB5
   nXhnxuFYFTe85od+hHvGi/QNigHgOW13EQHtvxs7o7rjSlyYuuXbG8RBJ
   qa702OF6PXy3SRFBsWtZnLzyC+l9gJDm3kz3UiEAIWs1CWQmbVw+9c5ZT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331877522"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="331877522"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 16:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="764029612"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="764029612"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 16:03:29 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psAe8-0000BR-28;
	Thu, 27 Apr 2023 23:03:28 +0000
Date: Fri, 28 Apr 2023 07:02:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 195/293] fs/xfs/xfs_buf.c:2062:11-12:
 WARNING kmalloc is used to allocate this memory at line 2028
Message-ID: <202304280636.wupTFego-lkp@intel.com>
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

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   69839640c25abcba17f4ab837ecb39fceae17082
commit: fbb7bfd0b0f68cb4dd292d2aa056a824d0e34298 [195/293] xfs: make GFP_ usage consistent when allocating buftargs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-c032-20230423 (https://download.01.org/0day-ci/archive/20230428/202304280636.wupTFego-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304280636.wupTFego-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_buf.c:2062:11-12: WARNING kmalloc is used to allocate this memory at line 2028

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
