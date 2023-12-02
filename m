Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA385254
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Dec 2023 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWz9j4UC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701483811; x=1733019811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elGUWyy/OZ4MZenOQFsLdut9fPhH5BLc9723VUrfwFQ=;
  b=bWz9j4UCOw/U2+vD7ew3NFeYnbF9nclPff+KPzY/Y73+2IG8lxdHkcQz
   qFpjm3P7qSFxiPhpheJ3EZ3nzPKrfJiGso3As80gGkFxU+NSeUvyje8Ri
   ZGQFraC60Ey0CBjKWLNEW3TqaNgW9tslOShBXHwvdMehg9TH5fXucu7sc
   BrKf5YLbgAmkDr7tfXjuyIh+h13ndx9o19JOP0bln/Mixzci721Oo4/nZ
   aZQKm30q3uE5F+zNcbugwQuryvm1V8lBK6SYqon5YWXaT6BvJ/l7z7QK0
   7X/b1mD7u6vra/3mhyZh/9J67+uZ7o5ajkZB+6hE5G7KH5DU/7eMIsJHt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="383967998"
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="383967998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 18:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,243,1695711600"; 
   d="scan'208";a="11334914"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Dec 2023 18:23:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9FfD-0004Yl-1Y;
	Sat, 02 Dec 2023 02:23:27 +0000
Date: Sat, 2 Dec 2023 10:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:drm-next 22/55]
 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c:
 dcn201/dcn201_hubbub.h is included more than once.
Message-ID: <202312021003.cuTGPfEl-lkp@intel.com>
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
head:   b719a9c15d52d4f56bdea8241a5d90fd9197ce99
commit: cf5668be4e9b7c6e92844559ae7fa430acac271c [22/55] drm/amd/display: Refactor resource into component directory
:::::: branch date: 27 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021003.cuTGPfEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312021003.cuTGPfEl-lkp@intel.com/

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
