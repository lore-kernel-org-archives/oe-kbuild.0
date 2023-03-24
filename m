Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AADD2771F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Mar 2023 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679699139; x=1711235139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zmQ6n+t3ymwS2C62F1CXYlJbg+x3jyOv3fVPU8WmTSQ=;
  b=Cn2W9tUozNNteYqQu4fDbuLtNpkKo5CoakH4nvyG8UsiLd2xMoUzVRT1
   cqRcMCJlXVWOoYCDsm9+rxBP8DtAS0340yeLU0JIKCKEDUuy4U5pAzj8P
   o5AkoL5ixJKYxhc2KroWfDZRsZLlOPLa5RmyMmshEHSOZvNolkv4QrpZm
   o1CpxUhsAki0m8fzP0XmGVI8KjfWD1SUWaBxf2BLv3f02skr/IjdBScsY
   wBLrHATGjEzl64a5Z8BHFmur31/rTwZ6Czx17Lfj3WWTDEnV0+IETM/W1
   JcbQp5w4OGQ6CS6jTsMfG9Ys29+8v9azZRU36lvWauSeYpMY73ctZLzPl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="404829464"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="404829464"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 16:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="752051112"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="752051112"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Mar 2023 16:05:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfqTY-000Fjf-2V;
	Fri, 24 Mar 2023 23:05:36 +0000
Date: Sat, 25 Mar 2023 07:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/regulator/mt6370-regulator.c:310:8-33: WARNING: Threaded IRQ
 with no primary handler requested without IRQF_ONESHOT (unless it is nested
 IRQ)
Message-ID: <202303250737.cy70MiLu-lkp@intel.com>
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
TO: ChiYuan Huang <cy_huang@richtek.com>
CC: Lee Jones <lee@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: ChiaEn Wu <chiaen_wu@richtek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd3d06ff5f4fa23f32bdb7f4d9f308503801d9e0
commit: b2adf788e6037cea0109313934f432f458190992 mfd: mt6370: Add MediaTek MT6370 support
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-c032-20230324 (https://download.01.org/0day-ci/archive/20230325/202303250737.cy70MiLu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303250737.cy70MiLu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/mt6370-regulator.c:310:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
