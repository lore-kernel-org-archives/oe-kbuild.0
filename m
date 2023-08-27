Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5936A
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693100497; x=1724636497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EnTfe+T4wSZC2l7XWvL/Wtepq0c/5SJF/Qlu2kMa+lk=;
  b=A1vbFyEQ6tWtwpR20RJfml2amltw7ffTO3+7Grnp7gAyNEounrxZDDwx
   WbIV289bHU9Rcd/9VFmo19LDCaRa7/oLXUsKyI70pr2odlm07DZrK+js2
   jQnt/1UtM35t/ozmCKg3a0GG1rh/ykuoBHlXacCroxj5ndiqGiF26NMHe
   Nxcp00SflAdmq5GHgX2YoRUj4d1On2fBaqUh/UlaZKXrvcJklOkTUyzla
   l8sUcBHI+NhSZPeNrLyo6LnFobEnYfxoxX6eOrWvpVydhwhI9pzhEVQGp
   xHFYed52ennUlGvau6Jv3h2c7sm50464eYx0GiBkwf+JdEdNn4NnXYxZL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="373790131"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="373790131"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 18:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="772880039"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="772880039"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Aug 2023 18:41:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa4mT-0005GW-2w;
	Sun, 27 Aug 2023 01:41:33 +0000
Date: Sun, 27 Aug 2023 09:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ext4/balloc.c:114:34-36: WARNING opportunity for max()
Message-ID: <202308270938.mK6ZKAQG-lkp@intel.com>
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
TO: Kemeng Shi <shikemeng@huaweicloud.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28f20a19294da7df158dfca259d0e2b5866baaf9
commit: 68e294dcccf965c93d65c4660547794728a4cff0 ext4: improve inode table blocks counting in ext4_num_overhead_clusters
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-052-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270938.mK6ZKAQG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270938.mK6ZKAQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308270938.mK6ZKAQG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/balloc.c:114:34-36: WARNING opportunity for max()
>> fs/ext4/balloc.c:116:30-32: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
