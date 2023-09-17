Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9867FF
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Sep 2023 03:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694920852; x=1726456852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GbnBql64MMfLulRVos2Gwz7+QUA5XxL3p167lLLsDec=;
  b=TDgrAWRJ4ObgtN23l9DXTh9Y1qVtxusg1rIocQIiQc31ROPPORqRCE9N
   NWBlEuOYiFKG42CjfkvPbQzIonXEKE6zT6e/24UwwMwrI60bXalVO68ia
   MGNvXyEgxGyLrtD6AXmbodTMF/l0b1ALKJv94QdPFfz54qOrE1sbLVEoX
   lDbvQFbEnvK1KGqqCdulSIQXLt5TtXlnHQX384Wv2blb2wXPk2byloY/6
   N6nOEg21TodE6KFTk90eMHeCrQaGJc9gyCajAYhITU98bNf/hq36cocG+
   VbT+e7HFWJZoo1hsV6uc57c2dwT99RfLUAYgW9fA8tUaVXC2iG8s6jnJq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="445934478"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="445934478"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 20:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="745444595"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="745444595"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2023 20:20:50 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhiL2-0004uN-2Q;
	Sun, 17 Sep 2023 03:20:48 +0000
Date: Sun, 17 Sep 2023 11:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/can/raw.c:497:2-9: WARNING: NULL check before dev_{put, hold}
 functions is not needed.
Message-ID: <202309171129.nrPj3k6p-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Oliver Hartkopp <socketcan@hartkopp.net>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b0d403eabbe135d8dbb40ad5e41018947d336c
commit: c275a176e4b69868576e543409927ae75e3a3288 can: raw: add missing refcount for memory leak fix
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-101-20230917 (https://download.01.org/0day-ci/archive/20230917/202309171129.nrPj3k6p-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230917/202309171129.nrPj3k6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309171129.nrPj3k6p-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/can/raw.c:497:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
