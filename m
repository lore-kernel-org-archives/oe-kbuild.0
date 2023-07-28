Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5E134B0
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690559010; x=1722095010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tkKSw9Frv+CaTP1m2oCdxivvBrtNqb0vCdFUehkzvF8=;
  b=bJQHv8QWVDsGWbVD1Bgt92JIV2+1TUGcVV6HdM7ZALbi8MSZVNXNZtpu
   fy/s4UKC22gCGJ7IVT/DSsTp15T9f12OahDiY5wP+HeFDAlS5/i66jus7
   31GKBTFgRgkPd7ck2pioov1RMiltEMwoT+9NYs9DrBe0za/EoqxAKRh+Y
   qmdlf5ZOkOqpfJwUrRJw/PtU5ceLhKISshls0yF+xqV8gHwJkJqNyWhIE
   rkn4zmfJ8j0ErcEqgdrGntIGM+MH4+t2VSoNUn2ZcdwBVSpm+C9ECAlYL
   2k5uTzwQ6nkgW85J4pSJI8uLS+d33UG1zJdiEJ1s7TopgCP+UUjG+GWKz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="454977059"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="454977059"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 08:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1058176549"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="1058176549"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jul 2023 08:43:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPPcj-0003KO-1v;
	Fri, 28 Jul 2023 15:43:25 +0000
Date: Fri, 28 Jul 2023 23:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [esmil:visionfive 63/75]
 drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202307282343.H9czU0EI-lkp@intel.com>
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
TO: Huan Feng <huan.feng@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux visionfive
head:   4370487fce31acaedcc03e8bd2e64f3a9c591821
commit: e58ddabbe765a384d08c8b7f4c9a9c8b938d31bd [63/75] hwrng: Add StarFive JH7100 Random Number Generator driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-r061-20230728 (https://download.01.org/0day-ci/archive/20230728/202307282343.H9czU0EI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307282343.H9czU0EI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307282343.H9czU0EI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
