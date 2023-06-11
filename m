Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18A646B3
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686474058; x=1718010058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITwqvNqZbO3P1i8iSkSvaIWShgPA22mpnXHZUCQvGKE=;
  b=SyhEbLh7fMEae1K6Gw3AMpHo3H2dM0yFGPpmG+Mv2LKEY+7vAearI0Eo
   ECYQMVWyobsU2B40IqTbXjA5yYYn1wylVPNzChqTyrn+sydmY1ZeDBUsz
   CyHoBfX5SNeao2xcz9m59vRJ2BwzuB6uXjNiYmv3DoXtbNyprt4LMyzz5
   4KoRyOq+ZDT43MkrZg+3j/n48qWOB9sewA4D/48rcUBkm5WlFRyfVD0Pe
   GwjcAN2kI3aJsYSKMMNjFYykJcdAuHSlGBff3/VVsnihYgnMdg+4SmngJ
   BJZtZ6/TzDozMWzrEBihC1ep7U+8wji+5rzKI0IdACIcdV0jjCSydJRNh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="357836519"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="357836519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 02:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="705027879"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="705027879"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Jun 2023 02:00:56 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8GwR-000AlY-2f;
	Sun, 11 Jun 2023 09:00:55 +0000
Date: Sun, 11 Jun 2023 17:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-unstable 52/158] mm/page_owner.c:760:0-23: WARNING:
 proc_page_owner_threshold should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <202306111651.4UQzNL3d-lkp@intel.com>
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
TO: Oscar Salvador <osalvador@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   49e038b1919ee5a0a24f4466d061a390be98dde2
commit: 118472c7332ac22f2669b2249da2ae29168ff50e [52/158] mm,page_owner: filter out stacks by a threshold counter
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: s390-randconfig-c042-20230611 (https://download.01.org/0day-ci/archive/20230611/202306111651.4UQzNL3d-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306111651.4UQzNL3d-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/page_owner.c:760:0-23: WARNING: proc_page_owner_threshold should be defined with DEFINE_DEBUGFS_ATTRIBUTE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
