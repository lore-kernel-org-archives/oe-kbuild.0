Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B089238B
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696215076; x=1727751076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpSoIacf6nbk5JOSnHN5SKcPaf4YcSUVDhd8YwuBOPA=;
  b=BJWxVujDzUzO1kdqzVk8nlBIGAvBBJ0l0PMIREDhIeaZDA32+d0vp3hs
   cis4qrnJGoC37ILFVcBNfFhpkllLg0orH5rxxZ4nE2AXntxECsskB1Z6R
   cmTVcjnj3SAkIQv1PtWWVl87Q27mVJRTOJ5DMXrnGGRemN475Cqpe0sZ+
   7XPiABAe35ipOwgaJ4BP96IvR2q71L0pRelaleZjnIcJi0SGDe1xi9sW/
   r4iP4yC28XNezDUdp3quRmtHPFTwfAIsjRRDxTtTUs/pKesR/+CkAtsq1
   DkeBsJ2fcsIzAXFSvLJg3/2XI405wlyu1y24bnZ3IyHScbLNgtdeYhoit
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="446727055"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="446727055"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 19:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779818585"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="779818585"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 01 Oct 2023 19:51:14 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn91c-0005iD-1b;
	Mon, 02 Oct 2023 02:51:12 +0000
Date: Mon, 2 Oct 2023 10:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 640/1370]
 drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more
 than once.
Message-ID: <202310021030.wCK5vsu7-lkp@intel.com>
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
CC: git@amd.com
TO: Maulik Jodhani <maulik.jodhani@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Harini Katakam <harini.katakam@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 8f95a9789277d5c3a7d1baf48889559f1e9f3e94 [640/1370] net: macb: Add support for partial store and forward
:::::: branch date: 10 days ago
:::::: commit date: 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021030.wCK5vsu7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310021030.wCK5vsu7-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/cadence/macb_main.c: linux/crc32.h is included more than once.

vim +11 drivers/net/ethernet/cadence/macb_main.c

  > 11	#include <linux/crc32.h>
    12	#include <linux/module.h>
    13	#include <linux/moduleparam.h>
    14	#include <linux/kernel.h>
    15	#include <linux/types.h>
    16	#include <linux/circ_buf.h>
    17	#include <linux/slab.h>
    18	#include <linux/init.h>
    19	#include <linux/io.h>
    20	#include <linux/gpio.h>
    21	#include <linux/gpio/consumer.h>
    22	#include <linux/interrupt.h>
    23	#include <linux/netdevice.h>
    24	#include <linux/etherdevice.h>
    25	#include <linux/dma-mapping.h>
    26	#include <linux/platform_device.h>
    27	#include <linux/phylink.h>
    28	#include <linux/of.h>
    29	#include <linux/of_device.h>
    30	#include <linux/of_gpio.h>
    31	#include <linux/of_mdio.h>
    32	#include <linux/of_net.h>
    33	#include <linux/ip.h>
    34	#include <linux/udp.h>
    35	#include <linux/tcp.h>
    36	#include <linux/iopoll.h>
    37	#include <linux/phy/phy.h>
    38	#include <linux/pm_runtime.h>
    39	#include <linux/ptp_classify.h>
    40	#include <linux/reset.h>
    41	#include <linux/firmware/xlnx-zynqmp.h>
  > 42	#include <linux/crc32.h>
    43	#include "macb.h"
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
