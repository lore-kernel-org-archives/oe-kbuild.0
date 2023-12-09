Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DA179C6
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 23:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mol77WkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702165989; x=1733701989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=73gI9z4MpONL+g5N9NPLx17Ofn2ayebnmua9Of3Unhc=;
  b=mol77WkHVdPATn512DNWlF+wlyPprDPW4AVEwOCymhkd3bNL7CmAW6BY
   68SB6UTj8Ni1EWjxCYtH3Q1yBqV7KGjOpNBgSx6ZevASwYuwBAmzi+r6x
   iOzxIsBPOE5VJtSvuNFv6gd0oKnCaLnKiwRVcgTHZvuc7QeVP5BPrUyOj
   3QWF7D7oBcnZlWPwOwAchU/AxIngDzRV1QK2ofzrRHFi1HJ7dqnnh8Nc6
   KUZnwJKkrZfsRBTgfpRA3qTgCRWmmAbX8tQ4erW9OFcSTe0RfHl26vBzb
   CAKTg/bKZ1IxW7pxfcFx2we2QzNIrSF1NHGtrIZ+jkNLUFd5a0px+U6Rj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398391418"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="398391418"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 15:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1019748351"
X-IronPort-AV: E=Sophos;i="6.04,264,1695711600"; 
   d="scan'208";a="1019748351"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Dec 2023 15:53:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rC785-000G8f-0f;
	Sat, 09 Dec 2023 23:53:05 +0000
Date: Sun, 10 Dec 2023 07:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v1 1/4] octeon_ep: add PF-VF mailbox
 communication
Message-ID: <202312100726.wnsqAU5W-lkp@intel.com>
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
In-Reply-To: <20231208070352.2606192-2-srasheed@marvell.com>
References: <20231208070352.2606192-2-srasheed@marvell.com>
TO: Shinas Rasheed <srasheed@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: hgani@marvell.com
CC: vimleshk@marvell.com
CC: egallen@redhat.com
CC: mschmidt@redhat.com
CC: pabeni@redhat.com
CC: horms@kernel.org
CC: kuba@kernel.org
CC: davem@davemloft.net
CC: wizhao@redhat.com
CC: kheib@redhat.com
CC: konguyen@redhat.com
CC: Shinas Rasheed <srasheed@marvell.com>
CC: Veerasenareddy Burru <vburru@marvell.com>
CC: Sathesh Edara <sedara@marvell.com>
CC: Eric Dumazet <edumazet@google.com>

Hi Shinas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Shinas-Rasheed/octeon_ep-add-PF-VF-mailbox-communication/20231208-150756
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231208070352.2606192-2-srasheed%40marvell.com
patch subject: [PATCH net-next v1 1/4] octeon_ep: add PF-VF mailbox communication
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231210/202312100726.wnsqAU5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312100726.wnsqAU5W-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c: linux/types.h is included more than once.

vim +8 drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c

   > 8	#include <linux/types.h>
   > 9	#include <linux/types.h>
    10	#include <linux/errno.h>
    11	#include <linux/string.h>
    12	#include <linux/mutex.h>
    13	#include <linux/jiffies.h>
    14	#include <linux/sched.h>
    15	#include <linux/sched/signal.h>
    16	#include <linux/io.h>
    17	#include <linux/pci.h>
    18	#include <linux/etherdevice.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
