Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C721D687
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696262471; x=1727798471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FttqcYmza97D+a0LFe4A5u1LHIbnT/A4N3GpKvWFOiI=;
  b=b4fUswjZgZSHKXHdXq+xV2Ycgw7QX8TQil/bF1SJAdhBdM3tK62GPTGw
   HSkRUVNlD09y6KwyswLU/nKIJulqpdqGxN8bBn/SNoTVPjmiCh66QVyWP
   /FigJd/AAPZkq0d21NDN9fb7vYtoOxIVq25JO95/63sPGbMEgl+9uivKD
   P7kEzjZ7HPnmxJM36i3I0OlUzrTPp3Vixjg097jeP5YrMuPlTAIz8M2FO
   2aVpeRUhTGCWHksaD0sTIGuUsKusfsR3FHPxMvqMbWheoSbLCwE5axN4J
   xdCpvEeEp/eFeMcLJSO0As0l3a53cWJeGGXauR63ghYuZubY0z+iERNH7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="386549668"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="386549668"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 09:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="894168694"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="894168694"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Oct 2023 08:59:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnLLx-0006AR-37;
	Mon, 02 Oct 2023 16:01:02 +0000
Date: Tue, 3 Oct 2023 00:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 776/1370]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included
 more than once.
Message-ID: <202310022337.40ktutIb-lkp@intel.com>
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
TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Srinivas Neeli <srinivas.neeli@amd.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 5fa84b9723e42132e5a1b6c98f13b0ae75df64ef [776/1370] net: axienet: Add clock support
:::::: branch date: 10 days ago
:::::: commit date: 9 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310022337.40ktutIb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310022337.40ktutIb-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included more than once.

vim +26 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  > 26	#include <linux/clk.h>
    27	#include <linux/delay.h>
    28	#include <linux/etherdevice.h>
    29	#include <linux/module.h>
    30	#include <linux/netdevice.h>
    31	#include <linux/of_mdio.h>
    32	#include <linux/of_net.h>
    33	#include <linux/of_platform.h>
    34	#include <linux/of_irq.h>
    35	#include <linux/of_address.h>
    36	#include <linux/skbuff.h>
    37	#include <linux/math64.h>
    38	#include <linux/phy.h>
    39	#include <linux/mii.h>
    40	#include <linux/ethtool.h>
    41	#include <linux/iopoll.h>
    42	#include <linux/ptp_classify.h>
    43	#include <linux/net_tstamp.h>
    44	#include <linux/random.h>
    45	#include <net/sock.h>
    46	#include <linux/xilinx_phy.h>
  > 47	#include <linux/clk.h>
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
