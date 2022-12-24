Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD83D61
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Dec 2022 19:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671911390; x=1703447390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rsLxdRw53mKY7c3qS0yrfyGbwBqh06pOtc+bvtrnAk=;
  b=g1LZKNE83Bz0P+ClPvUgFDRRAdE4ToPVv4KVxfZ8Dj0kBKUBQabbTJdK
   GcYHAM1W6DwaWUfsoklFpmcCTRw/rlHOF2/vYYavCAnGFVRuFMp41/Hs5
   gab8t6ERSf5Ihftc5AAIh8SO2cf6hddxL4X0b/eyEfOUggDB2hGROiqF0
   vs9dlUic/8HbbwdY5VJqlHnnz0nxZsQQfGmQgc76Qo24xvQWMb7gqgBb/
   6q3ogrxpkjaTUMIZew/r8dkWjVUtC1mWQu1ZwkYzEDp7LVC3RESH9nYdo
   gfVffmqDNXqdhJrGHRbTTQOfRSKt28tFroiRp38hnRi+jLGeJnJgHXIya
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="382714826"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="382714826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 11:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="715742929"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="715742929"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Dec 2022 11:49:48 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p9AWi-000DYw-0H;
	Sat, 24 Dec 2022 19:49:48 +0000
Date: Sun, 25 Dec 2022 03:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 1089/1346]
 drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: linux/clk.h is
 included more than once.
Message-ID: <202212250343.LwqD1Uyw-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Harini Katakam <harini.katakam@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   b9b26dcfcb221a7465b71e124f9ec0f4f4be988d
commit: 8c6910de988070200e93c242ced7187754c4020d [1089/1346] net: xilinx: Move Xilinx TSN to staging
:::::: branch date: 3 days ago
:::::: commit date: 9 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/staging/xilinx-tsn/xilinx_axienet_main_tsn.c: linux/clk.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
