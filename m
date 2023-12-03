Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C251843
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4cgsHoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585173; x=1733121173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sq2dQuSB1wO8ubrP0WE+ComUjL7cK+XKZwFspQs8d4=;
  b=U4cgsHoJ4HoadW8xxLNjCEFy7txjFRnObonClmGSDKU8n6oAaGQVl5GW
   cSPFguwYkTo80BHT9giN3y4FPl8Ycp+YiWAL9YSrg6njRA8ciKzxIQ3QT
   f94r2oUbKULNsxJ2JnfbP8Px41LFO2AislsvqTzQ4ARWYQSxCCvIY87gg
   P0gsS8awplh1Bd7fEwcXx8l7/SjLLPFFawt71KhoAYwOc73PQ4qB61o1A
   iJ9AF+bdnf1IPrj6v7n7dJveGxvHoc32ZzOCP2reGr1MqF/XSa3tUBXBs
   m+8RfLJEsRaFPogGC6qKeX8lSvu4BSHN1KHGywYtIgi7PISMKMSF+DM5B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180406"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="914081663"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="914081663"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Le-1y;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/9] scsi: bht: include: Add the header files related to
 Bayhub specific struct, enum and macro
Message-ID: <202312031127.SIjTpP0B-lkp@intel.com>
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
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031127.SIjTpP0B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031127.SIjTpP0B-lkp@intel.com/

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
