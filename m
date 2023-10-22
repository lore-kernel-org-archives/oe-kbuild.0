Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D3B63B8
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amaTyKjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697996586; x=1729532586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JNc+0+TZc/QBfy4nC0KAa7I7uVZulfVC/4/zHS1jrEo=;
  b=amaTyKjAP/S4NP6e4quNGuxqzQGvt/cBVdXtE7Ttn4QIPtWKGMTMN7ub
   dfopfBTFaYZauknKGXYJDziFg+VL12ccFov8Ri4QpJeFi6jbi/8uF1sNx
   4L+1NJedzKEPoB9v6+UdoRmmUXOJ5sQ2eziUX/C6yJFn8K+108AzmMqzA
   PmtxeXw6DRUWMqqRT6iDW3rroppkZAQKj1cO2yt4SHYakn7g3e9WLMqf6
   emaL0tnDDZboaE4ul1+y84J7s2zVrv619Lqn97fQuUMACf5cP3nyO5dpf
   mEmNljGSRJ8gB0sjfrE7SqTY8Pg3+ylw4qJe8MWVo0y5rnH63sA+BwcRB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="8283494"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="8283494"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 10:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="874457992"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="874457992"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2023 10:43:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qucTe-0006A2-0l;
	Sun, 22 Oct 2023 17:43:02 +0000
Date: Mon, 23 Oct 2023 01:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/9] scsi: bht: include: Add the header files related to
 Bayhub specific struct, enum and macro
Message-ID: <202310230123.kYU8vEt2-lkp@intel.com>
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
In-Reply-To: <20231013083358.10313-1-liuchang_125125@163.com>
References: <20231013083358.10313-1-liuchang_125125@163.com>
TO: liuchang_125125@163.com
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: mark.tao@bayhubtech.com
CC: shaper.liu@bayhubtech.com
CC: thomas.hu@bayhubtech.com
CC: chevron.li@bayhubtech.com
CC: charl.liu@bayhubtech.com
CC: Charl Liu <liuchang_125125@163.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 401644852d0b2a278811de38081be23f74b5bb04]

url:    https://github.com/intel-lab-lkp/linux/commits/liuchang_125125-163-com/scsi-Update-Kconfig-and-Makefile-for-supporting-Bayhub-s-SD-MMC-Card-interface-driver/20231017-123349
base:   401644852d0b2a278811de38081be23f74b5bb04
patch link:    https://lore.kernel.org/r/20231013083358.10313-1-liuchang_125125%40163.com
patch subject: [PATCH 5/9] scsi: bht: include: Add the header files related to Bayhub specific struct, enum and macro
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230123.kYU8vEt2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310230123.kYU8vEt2-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/bht/include/basic.h: linux/delay.h is included more than once.

vim +35 drivers/scsi/bht/include/basic.h

    24	
    25	#include <asm/io.h>
    26	#include <asm/uaccess.h>
    27	#include <asm/page.h>
    28	#include <asm/byteorder.h>
    29	#include <linux/stddef.h>
    30	#include <linux/string.h>
    31	#include <linux/errno.h>
    32	#include <linux/kernel.h>
    33	#include <linux/ioport.h>
    34	#include <linux/slab.h>
  > 35	#include <linux/delay.h>
    36	#include <linux/pci.h>
    37	#include <linux/proc_fs.h>
    38	#include <linux/reboot.h>
    39	#include <linux/interrupt.h>
    40	#include <linux/types.h>
    41	#include <scsi/sg.h>
    42	#include <linux/stat.h>
    43	#include <linux/spinlock.h>
    44	#include <linux/sched.h>
    45	#include <linux/spinlock_types.h>
    46	#include <linux/semaphore.h>
    47	#include <linux/completion.h>
  > 48	#include <linux/delay.h>
    49	#include <linux/kdev_t.h>
    50	#include <linux/highmem.h>
    51	#include <linux/export.h>
    52	#include <linux/wait.h>
    53	#include <scsi/scsi_host.h>
    54	#include <scsi/scsi_cmnd.h>
    55	#include <scsi/scsi_device.h>
    56	#include <scsi/scsi.h>
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
