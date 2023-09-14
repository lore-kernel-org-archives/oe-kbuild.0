Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0625233F2
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 23:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694733235; x=1726269235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBsqNFd6/AEgYziU+Kxic7UiNRSjOMCNAejaKLTGkmE=;
  b=VctN6HKOjynDpqbd2Kjb+rWVrB/KLkqovmaGrnJNgAVebauRsXsnHuBq
   ltJtT2eQJSb5D2BTU93K0zdgaPuM4X3fnvhX0FfR+XRz7C+pQHhOhuYVF
   3KzaBzja57B/s7lfxekfqMRa8cBd0aDK5g4mrz6RQjQtLyPfDwj2zpbeD
   E8EB4sksKxCI6s1fms9vFsvlekqXCewQVpdQIjExqGieyxWarHy3FNZ6U
   f9+jH18g4xqaXMIhsb0f7aobMNc8u1qV2JKa325956h3gex8AB9QfcpCJ
   bxGc0QaQjf2qxXmaJYWOG7hKuuFEnDNMRLaObHehieqxzMpLlq+YRHkRq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465472444"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="465472444"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 16:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="747968433"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="747968433"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Sep 2023 16:13:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgvWw-0002AD-2g;
	Thu, 14 Sep 2023 23:13:50 +0000
Date: Fri, 15 Sep 2023 07:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1530/5363]
 drivers/video/fbdev/core/fb_logo.c:67:41-42: WARNING opportunity for min()
Message-ID: <202309150740.uvZflHvf-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98897dc735cf6635f0966f76eb0108354168fb15
commit: 8887086ef2e0047ec321103a15e7d766be3a3874 [1530/5363] fbdev/core: Move logo functions into separate source file
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-053-20230915 (https://download.01.org/0day-ci/archive/20230915/202309150740.uvZflHvf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309150740.uvZflHvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309150740.uvZflHvf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/core/fb_logo.c:67:41-42: WARNING opportunity for min()
   drivers/video/fbdev/core/fb_logo.c:68:41-42: WARNING opportunity for min()
   drivers/video/fbdev/core/fb_logo.c:69:41-42: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
