Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6AB805
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 19:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685562335; x=1717098335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vctuM9sHkrRY3e3pf5lB4/V9I/PtkExo45nvGaP63rI=;
  b=i/iKVSXP8D8kI/BHx+pZ0wTWimeobV+jB6UlaxdmmanO1qDTexBxb0Qj
   4PMV5kq5FOwX6NKSuHjAz6b43Psy8npzddrcqO1V9ZKU8kw9qSAYjk+m2
   Ikh0TPTQ/W2vXkaGlu+EnbJIJnQDzdr9aVPn/EL0vplyOiRyHrnRQZdgw
   H8OnJ28nAFzWIZV0EN/8ivNw2MWQ8pBcLaeP0ffp7J9SHSO3/UqNy2c8P
   p1Wd+4K5NxGvZT/b1I+23fWawJxY2kfGnZMv7hSQ4efM8KeoD0khfN4XS
   N2rfiM83PvtH0sxpYBWFkBkh4nq9/5aaJs+GZUt3hZ+s8ppzqj9vW3HF4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418841892"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="418841892"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 12:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="881319078"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="881319078"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 May 2023 12:44:38 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4RkL-0001Z7-1K;
	Wed, 31 May 2023 19:44:37 +0000
Date: Thu, 1 Jun 2023 03:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:for-next/cacheinfo/fixes 2/2] m68k-linux-ld: section
 .rodata VMA [00002000,0011e9c7] overlaps section .text VMA
 [00000400,006e006f]
Message-ID: <202306010316.gMRBWQ7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: m68k-linux-ld: section .rodata VMA [00002000,0011e9c7] overlaps section .text VMA [00000400,006e006f]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: K Prateek Nayak <kprateek.nayak@amd.com>
CC: Sudeep Holla <sudeep.holla@arm.com>
CC: Yicong Yang <yangyicong@hisilicon.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/cacheinfo/fixes
head:   78c5fa2c98afcde4e389002a4dd9e4770479878e
commit: 78c5fa2c98afcde4e389002a4dd9e4770479878e [2/2] drivers: base: cacheinfo: Update cpu_map_populated during CPU Hotplug
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: m68k-randconfig-s043-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010316.gMRBWQ7b-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=78c5fa2c98afcde4e389002a4dd9e4770479878e
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla for-next/cacheinfo/fixes
        git checkout 78c5fa2c98afcde4e389002a4dd9e4770479878e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306010316.gMRBWQ7b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-ld: section .rodata VMA [00002000,0011e9c7] overlaps section .text VMA [00000400,006e006f]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
