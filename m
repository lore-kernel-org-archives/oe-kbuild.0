Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46200EA0
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685788052; x=1717324052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T4PJmjaqWE96BdI5rrcl9toLgjzUzzvl0GhSYGMOQNk=;
  b=fp5+tKZLWpm9WmF/GoGClJc1Xjd8k7obnmPUU7qPlyivSiRodAgVeGua
   2Y/xDadbKgQYSr/S1BA80jj6HHluDtrw4Ialdxn0T0TOr1YdxRp/rP4qp
   qnRr6VdD1jEwdzR53uoVnzLOIoCHVeZjsUE6nWGTPdyn52+hjPqwUf9AV
   70Ims57YZQIk6d+7CYnKrx8mNYxpYtbLGXC+k5q6+Wvpqx+OdgTRBeZVD
   7tD92zunDmp5veiapBivlxXSaUxUK85incZnbcR2p+br53y6NhEenlGMl
   Ol9yT97oE1kXM/1MvBDx1wqpmulLKAbz1GNC3VG/2L/A8vsp2IOOhS9tX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="353547493"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="353547493"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 03:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685586505"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="685586505"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Jun 2023 03:27:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5OTp-0001WD-0l;
	Sat, 03 Jun 2023 10:27:29 +0000
Date: Sat, 3 Jun 2023 18:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-misc:raid-stripe-tree 23/31] fs/btrfs/raid-stripe-tree.c:
 disk-io.h is included more than once.
Message-ID: <202306031816.QBGkEO6j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git raid-stripe-tree
head:   7f755507b2a1f921afadd2b041bc46829e2bda2b
commit: ce887cbe59dccd694a7de29794258d6973d2f42c [23/31] btrfs: add support for inserting raid stripe extents
:::::: branch date: 27 hours ago
:::::: commit date: 29 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306031816.QBGkEO6j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/raid-stripe-tree.c: disk-io.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
