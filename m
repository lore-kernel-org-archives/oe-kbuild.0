Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51901375
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1Oxi2iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585106; x=1733121106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bYsBD2STH4dwBQNAqY09XSuJNv5pxeeYMpZdzMHj7UA=;
  b=X1Oxi2iq4Fs6c+ai8i7wkKn4pjA5D/Xoff1E3lwKsvDRrz/iEWKoAJA9
   Ylo1/qETTNZJ+Bq6BzAvvstrkXzuJcfp5b+YBA7/sCgt4wM+PEPIkaHUG
   nbBvA7lLvJyw+EYA2/9KsCnTVIDuNuUGqAMswAl08cbWFZte0fV9nHif3
   lKZof9KPZjD8vJBZPuLOOZbHjsQwvmix7rl73luPE72fXr6tAEHxmjOH1
   onrK5rv3GGvvmu8ROHVU+xz5rbHqJOhIlPbq7GDm8XwHhphsrcp2nEmOh
   2pLaVrNhGcSwIj9K7lx6HLZvJpzC/mlXaNGsyV51YFZe25FdRUUn+Qu6K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6942662"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6942662"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="893652728"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="893652728"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 02 Dec 2023 22:31:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006Jq-10;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/9] scsi: bht: card: Add the source files related to
 card initialization
Message-ID: <202312022052.t3F4JFxH-lkp@intel.com>
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
In-Reply-To: <20231013083320.10279-1-liuchang_125125@163.com>
References: <20231013083320.10279-1-liuchang_125125@163.com>
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
patch link:    https://lore.kernel.org/r/20231013083320.10279-1-liuchang_125125%40163.com
patch subject: [PATCH 3/9] scsi: bht: card: Add the source files related to card initialization
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312022052.t3F4JFxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312022052.t3F4JFxH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/bht/card/cardinterface.c: ../include/cmdhandler.h is included more than once.
>> drivers/scsi/bht/card/cardinterface.c: ../include/card.h is included more than once.
--
>> drivers/scsi/bht/card/output_tuning.c: ../include/card.h is included more than once.

vim +30 drivers/scsi/bht/card/cardinterface.c

  > 30	#include "../include/cmdhandler.h"
    31	#include "../host/hostven.h"
    32	#include "../include/card.h"
    33	#include "../host/hostreg.h"
    34	#include "../include/funcapi.h"
    35	#include "../tagqueue/tq_trans_api.h"
  > 36	#include "../include/cmdhandler.h"
    37	#include "cardcommon.h"
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
