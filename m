Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944FB322E
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Dec 2022 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671895605; x=1703431605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=36oVkM6WNUF39lHhrmCbmzqjohRp3VegjnUVquyhFNE=;
  b=X/73Yii+Xt8kUwdd2QCJAcMxvRB4fOmUQdqcMvDTaLEmLPkAhC8UFGPx
   U3P9Z5u7Et6M/+JOHu1iRLu3zWNULIiMO0vUyOLf1XMQP+GlCzsTOFw7A
   zfJiqd3FDiM7Cyq0fdLA7lMTd0jWLmEMmXNgKkw9Za52r0ShNHCfyZZDs
   KGCu2jj0uu6+NGNwBEXvkqIqIyD4G/F+//2pFwrLRqGUgyXxbxhUBN5J1
   QuVDXOpK2JkBoUZ6ID85nJDuJx6lK9XEHdDsENnx3jBVMcjEOlcgr65j9
   QcNzq0iaIhDn7zx20Q3ICR1HIYFZfQXMakBCDln8vWE1sV0HwFEOifB5Y
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="300774552"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="300774552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 07:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10571"; a="759612182"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="759612182"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Dec 2022 07:26:44 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p96Q7-000DRL-2C;
	Sat, 24 Dec 2022 15:26:43 +0000
Date: Sat, 24 Dec 2022 23:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 479/1346]
 arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more
 than once.
Message-ID: <202212242334.nQDCRDYg-lkp@intel.com>
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
TO: Michal Simek <monstr@monstr.eu>
CC: Stefan Asserhall <stefan.asserhall@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   b9b26dcfcb221a7465b71e124f9ec0f4f4be988d
commit: 08dfb7d5fabd8bb46ce8d7761a724012bf1b03cd [479/1346] microblaze: Rework mmu context management to prepare
:::::: branch date: 3 days ago
:::::: commit date: 11 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/microblaze/include/asm/mmu_context_mm.h: linux/sched.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
