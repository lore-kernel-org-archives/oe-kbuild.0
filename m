Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9923406
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jun 2023 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686606683; x=1718142683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s94fA+TaMhsm+Qfcntm/J3jLdjfuiBGqGmKe22B7Xw=;
  b=ajsi2qVcgrsUUVC1kyRapGxGXR1CmQHRrkRmpS6PhztDNVdkLEmnG9Xw
   LlqTJbOTbZf8EBGHnJhyy/EMkC7fqXsEZBpxulxqJbNainsXhIywgIew9
   fJyhVGcUIeYuNxd8bwYZYef9eAbBnWQf4nkg7McSGqyTqXD+go26kqf/T
   V3LNBMH3yS0UqljyMqf15gLWwhZHqsgzQzeZ3eY702KLcWx8+pD2I6TCq
   /HPRkrmzT2xviRiGW27iTWVvuD+lmUHYHVklF5fB9/27Pxmk1rqualQ+n
   R87SDNU2BC4x8T5ZNAqLf0H7J9P71weg1Z4eYOUR43YG3QyBtzCZ70kF1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386560087"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="386560087"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 14:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711380785"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="711380785"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 14:51:17 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8pRU-0000m4-1I;
	Mon, 12 Jun 2023 21:51:16 +0000
Date: Tue, 13 Jun 2023 05:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [djwong-xfs:xfile-page-caching 145/196]
 fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
Message-ID: <202306130511.e0hTlbVd-lkp@intel.com>
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
commit: 1b4770ff595e75f28c9a002225b69e36d32ce0d4 [145/196] xfs: bind the xfs-specific extent swape code to the vfs-generic file exchange code
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: sh-randconfig-c023-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130511.e0hTlbVd-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306130511.e0hTlbVd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_xchgrange.c:586:11-12: WARNING opportunity for max()
   fs/xfs/xfs_xchgrange.c:587:11-12: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
