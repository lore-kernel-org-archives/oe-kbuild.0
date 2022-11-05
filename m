Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391361C04
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Nov 2022 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667632037; x=1699168037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyUlrmKA+L1rVCFGvpOB5r9Woktz8VU9yWYUJhHySGg=;
  b=fgYzq32yolTKTec3+YbyOyUKya4cPqvcGyD42zCxmX8zq3D/4HhQ1vgG
   HG4AeusVpT/uPKLpabwXQQyYwoZ10OVUerMOxiizBARg1TuUGufTDRMTz
   z44O4y2xP/z3Ys86So4TBIOchAWc7VIgoUinjT5zYB1PtmaXbGnYbeziU
   LHIdXzFTCrgpf6l6q6tcEmMCTOd0dDn7JNsh38MDrT9Ee7s32phV8Cz/H
   MmEguGoBGVYYIphkTM6HSs9HaBJFt0F1RCiZYyn/3e+0opo9VDN59bYVa
   lYoSc/ZsUgDmvTBqhCCgoO13wVuqK2IZxVXh3t+76o31i8JHGfp2znYhV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="297612255"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="297612255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2022 00:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="698910110"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="698910110"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 05 Nov 2022 00:07:15 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orDGs-000HjU-2h;
	Sat, 05 Nov 2022 07:07:14 +0000
Date: Sat, 5 Nov 2022 15:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 2/7]
 sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than
 once.
Message-ID: <202211052354.PacNIdtC-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   6b29cad21000797f343b14bdfb8c690a01c13fac
commit: cc8a6ed85aab1edbf83a9f3547a97d1bb3c3974c [2/7] hifiberry_dacplusadc: add support for the Hifiberry DAC+ ADC
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> sound/soc/bcm/hifiberry_dacplusadc.c: linux/kernel.h is included more than once.
>> /kbuild/src/consumer/sound/soc/bcm/hifiberry_dacplusadc.c: linux/module.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
