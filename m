Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58143208B7
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Oct 2023 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPxE95VM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697918489; x=1729454489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1WMey1/u8Bh/1WaUuynJ3DZZBydwNIA6r/CyAY1Gog=;
  b=UPxE95VMMuP5vZaMja9CE9+xwQvZbiALHmsDYF4C7vZChfpeC3VjaZM6
   K65aAhy4XxvPnujMJF9CQLsGZgFlXCsavg7yUppJLbx9Wk9gKqNw7qHCM
   nJMTJBCzBvZOI+yhQqr3YB6igVej99k3FiPDyP0lWNZg6190ehLjz3+SL
   CITlAlLC6uaEa7drcEx1o4winZ+cKpXUHDAp48U2LzXGceagkadMA2fLK
   bEsm7tWAY/OJxkOqmrSJj5Y2NfM/fHWPds8iUvWnicq0LANXc5ebltcod
   7WnC4BDof7V+YiYDSYW9d5aoeHKvgHKvUGHwh/HepAE+coeP5oYQSFZ0F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385543516"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="385543516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 13:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5413062"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 13:00:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quI9v-0005CA-30;
	Sat, 21 Oct 2023 20:01:19 +0000
Date: Sun, 22 Oct 2023 04:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/9] scsi: bht: card: Add the source files related to
 card initialization
Message-ID: <202310220339.xnImSaRm-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220339.xnImSaRm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310220339.xnImSaRm-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/bht/card/cardinterface.c: ../include/card.h is included more than once.
>> drivers/scsi/bht/card/cardinterface.c: ../include/cmdhandler.h is included more than once.
--
>> drivers/scsi/bht/card/output_tuning.c: ../include/card.h is included more than once.

vim +23 drivers/scsi/bht/card/cardinterface.c

  > 23	#include "../include/card.h"
    24	#include "../include/cardapi.h"
    25	#include "../include/hostapi.h"
    26	#include "../include/transhapi.h"
    27	#include "../include/hostvenapi.h"
    28	#include "../include/util.h"
    29	#include "../include/debug.h"
    30	#include "../include/cmdhandler.h"
    31	#include "../host/hostven.h"
  > 32	#include "../include/card.h"
    33	#include "../host/hostreg.h"
    34	#include "../include/funcapi.h"
    35	#include "../tagqueue/tq_trans_api.h"
    36	#include "../include/cmdhandler.h"
    37	#include "cardcommon.h"
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
