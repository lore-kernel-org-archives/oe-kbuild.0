Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6F2F3D
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685295314; x=1716831314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeNoY3YflfkRiSrSvhM1oqjaayQ+4mH2MkLby/eGJI4=;
  b=HzASPV5lBTOHNjLEO+E7GkmCW/Vwj0RpAErCrhshewTu7LZljjBVIUs3
   qMWvnrZFOz7C8UP8u9jvC2g/Ss3mlVloaBwIJm9C3edFUxiKMwUsYlk9G
   rX4wnXi6fv9oXg72lB67UPc/mZATOqRThQfxl4eiq1fgXF0moH1aHpi6c
   L6schMD3CEf9oQBpIrgn3hsp8Ja0UTWyBe4tbHyRB1Q+xe4DJ2x8NI/ch
   mNKJa8pf25v1lf2nLBuzx71a7v4YWf8PN5Sc9IUnralssHQ2CcBI2qmP/
   Ahua3LjmrcTO+vuJjlpfDZRXgejne1ts363mBiHHxbQ56r+4tLYO+G/fV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="382793578"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="382793578"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 10:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="795670549"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="795670549"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 May 2023 10:35:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3KIS-000KhC-03;
	Sun, 28 May 2023 17:35:12 +0000
Date: Mon, 29 May 2023 01:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma/idxd/device.c:774:8-26: WARNING: dma_alloc_coherent used
 in
Message-ID: <202305290109.qddh20pB-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Fenghua Yu <fenghua.yu@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7877cb91f1081754a1487c144d85dc0d2e2e7fc4
commit: 244da66cda359227d80ccb41dbcb99da40eae186 dmaengine: idxd: setup event log configuration
date:   7 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c022-20230528 (https://download.01.org/0day-ci/archive/20230529/202305290109.qddh20pB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202305290109.qddh20pB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma/idxd/device.c:774:8-26: WARNING: dma_alloc_coherent used in 
   	 /*
>> 	 * Address needs to be page aligned. However, dma_alloc_coherent() provides
>> 	 * at minimal page size aligned address. No manual alignment required.
   	 */ 
>> 	 addr   already zeroes out memory, so memset is not needed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
