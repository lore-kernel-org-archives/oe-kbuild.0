Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08314AA7
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693317613; x=1724853613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d2qTtiFZFOzqFbaQgqNxpL/t+nr/N63RdBpFM0e0OOU=;
  b=jDgsmndgfxFPqa7DTh5bNdbeXEjrD+yDpFwH1XzcCYoVn3DRJzBBwJ3z
   T6Z/ZW8iz4wOZheZJFVOK/fRuqh3Nk3HmkbFnmT33JEWhKz05krjiXu8Y
   gw4FQwTQq/UYHvNH4WTEOB7gejtlXoF/Wbyd11RFMPtaHUOPu+RGYF1qt
   8HIxYTLswMhO4z5HgfEkIy5VJD0i4VQZKveM17NYP2z5gJ5w4EusLkdY8
   kiVwhd8st2ulvzeMQU66qP8Pr6hhEcxvhHxbCmS3cHtiChrwLnJ1DTN9m
   PABSPX/WyDXzxfCRXMBQsaGdDfJSXZE52nBVZKD2QN2GDsqG02K3JayRF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372786849"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="372786849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 07:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="738719420"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="738719420"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Aug 2023 07:00:01 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qazFr-0008nB-2R;
	Tue, 29 Aug 2023 13:59:47 +0000
Date: Tue, 29 Aug 2023 21:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382]
 drivers/spi/spi-cadence-quadspi.c:747:23-25: WARNING opportunity for max()
Message-ID: <202308292155.fEzzQUiT-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Pratyush Yadav <p.yadav@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   dd944f14304d2ce6d26c9cdc3d2d2d6d373a322c
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
:::::: branch date: 7 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292155.fEzzQUiT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230829/202308292155.fEzzQUiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308292155.fEzzQUiT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-cadence-quadspi.c:747:23-25: WARNING opportunity for max()
>> drivers/spi/spi-cadence-quadspi.c:726:22-24: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
