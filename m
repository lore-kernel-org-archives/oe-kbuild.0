Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E3537F8
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 21:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDqoQLRM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700255812; x=1731791812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PLto8kOG/bWeo7fAXqsQ0v3RC32A6G0YfEYvAMW7zcc=;
  b=oDqoQLRMzNWnQ6WHY2nU0PFX5Tj0diJW6gOpZqG3qMiybR1LSQyi5R9H
   xRmkQ/oo66BZAtixHybJ3XLEPggi7HBlwovxDKGdcLQh5w55g+MhMa2te
   niCstHxLodd0eXMFUXjRFY3NssGookwrq8SH9SozzlpbT7znJh8BZSh2G
   KBGsxOfHp1SuGmWaUVmXo3D2XdwJktrzu7CQu7enXw1T7UNyzu7iQniio
   Xa3xIaWyppx97vxmbIKVOzji/ufAz5HHWs/bH0/RIeAm0H/q5vwcwjoBW
   XXU061xY2umn9EHIxydXawoQIVdwEtyd1vricBInlmGHuwRbeq8MOzLrH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455667887"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="455667887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="836188247"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="836188247"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2023 13:16:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46Ck-00039r-2Q;
	Fri, 17 Nov 2023 21:16:47 +0000
Date: Sat, 18 Nov 2023 05:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:drm-next 22/55]
 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c:
 dcn201/dcn201_hubbub.h is included more than once.
Message-ID: <202311180503.fajzMSgk-lkp@intel.com>
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
TO: Mounika Adhuri <moadhuri@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Martin Leung <martin.leung@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   699d392903c3cebb7d2a2a3505ec9047c419dcd7
commit: cf5668be4e9b7c6e92844559ae7fa430acac271c [22/55] drm/amd/display: Refactor resource into component directory
:::::: branch date: 7 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180503.fajzMSgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180503.fajzMSgk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c: dcn201/dcn201_hubbub.h is included more than once.

vim +43 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c

    36	
    37	#include "dcn10/dcn10_hubp.h"
    38	#include "dcn10/dcn10_ipp.h"
    39	#include "dcn201/dcn201_mpc.h"
    40	#include "dcn201/dcn201_hubp.h"
    41	#include "irq/dcn201/irq_service_dcn201.h"
    42	#include "dcn201/dcn201_dpp.h"
  > 43	#include "dcn201/dcn201_hubbub.h"
    44	#include "dcn201/dcn201_dccg.h"
    45	#include "dcn201/dcn201_optc.h"
    46	#include "dcn201/dcn201_hwseq.h"
    47	#include "dce110/dce110_hwseq.h"
    48	#include "dcn201/dcn201_opp.h"
    49	#include "dcn201/dcn201_link_encoder.h"
    50	#include "dcn20/dcn20_stream_encoder.h"
    51	#include "dce/dce_clock_source.h"
    52	#include "dce/dce_audio.h"
    53	#include "dce/dce_hwseq.h"
    54	#include "virtual/virtual_stream_encoder.h"
    55	#include "dce110/dce110_resource.h"
    56	#include "dce/dce_aux.h"
    57	#include "dce/dce_i2c.h"
  > 58	#include "dcn201/dcn201_hubbub.h"
    59	#include "dcn10/dcn10_resource.h"
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
