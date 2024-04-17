Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFDB657BC
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 06:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713335953; cv=none; b=RuWnXaphPIQli0nUfbOePUDpRbed0AioYcetDxJngeoE1j4Mg6SOUe+XuKG16AM2IM1HgU1HKc0sg9ZyYm9HjoHRxT4UBmrtAnlQcTPG+y/+4KBdhf+Yr7+/DzfYZVPZ1RMxXwLQQsz6M8JhXBXAPg/t7C61yvBo+cHhQq1TfIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713335953; c=relaxed/simple;
	bh=dlXFxVWpt8ddpTrk9fpYwJA4Zb6lpjVV2FCqHzWOwNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m7BXcYJNwjC6fbxwwK9+DqasbJcI7V481p84Df5+3rVJtettnOeBKo4t+ZLjIKf1sLfjqy9wmmKIcrgbcdfJ1xeq0Oza8tBUjqCFeOOe7eft1iFsrScVvqC30DgvL0CYRv4VwoXO9ykEayhINMHo67UdS0QNZ3gVwjJ3ffTGGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2NXOeH8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2NXOeH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713335950; x=1744871950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlXFxVWpt8ddpTrk9fpYwJA4Zb6lpjVV2FCqHzWOwNg=;
  b=j2NXOeH89Jn7Y2OkoMy9Xwizn5Jjd8PlPzsjShUUF76Cpc/L8/IDhbFp
   HF62/Hmi52CWE8z0WSH1fXPu/zAqN7H/sAxYYPsasaxnYKkOf/ScgbVQ2
   karfaPE5A4a+hlHBoVEwLx+Da4INFM0fsu/6hVtrFOU4Z+iKUnjkTQ0KV
   IIkkowFBLb2yCI1b2fXcKZrnRHwH22INWURLxhacnrjZ0/EtN/NLOashc
   r6Nqt8K9Py1hTwv40eTxxoX0hcJEm/BVjUgAA2tbiONOAHTpHP2dZuVek
   IiRVByn0SKFk+KvnTlK6i5TEbbEH/mwaWipKu2YDFtjLO3SISTA67hy77
   w==;
X-CSE-ConnectionGUID: 5pCuMAt1R2SHM8tW7tZWrA==
X-CSE-MsgGUID: cnGng/fHRqa6tncmU9tj2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8737637"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8737637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:39:09 -0700
X-CSE-ConnectionGUID: 2QROcJg6Sna840xVl7A1CQ==
X-CSE-MsgGUID: AeLVETXmRTOSy+YV29LHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22575338"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2024 23:39:08 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwywi-0006E4-0q;
	Wed, 17 Apr 2024 06:39:04 +0000
Date: Wed, 17 Apr 2024 14:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:amd-staging-drm-next 1942/1975]
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c:
 dcn32/dcn32_clk_mgr.h is included more than once.
Message-ID: <202404171411.FGKP7967-lkp@intel.com>
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
TO: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>
CC: Leo Li <sunpeng.li@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   ff3f4d66e57f7714dd2beafd97a87720f3ce4a12
commit: 6ce9141e6f2ce016678e9a8a4d576b24f9bc5aec [1942/1975] drm/amd/display: Adjust headers
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404171411.FGKP7967-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c: dcn32/dcn32_clk_mgr.h is included more than once.

vim +32 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c

  > 32	#include "dcn32/dcn32_clk_mgr.h"
    33	#include "reg_helper.h"
    34	#include "core_types.h"
    35	#include "dm_helpers.h"
    36	#include "link.h"
    37	#include "dc_state_priv.h"
    38	#include "atomfirmware.h"
    39	#include "smu13_driver_if.h"
    40	
    41	#include "dcn/dcn_3_2_0_offset.h"
    42	#include "dcn/dcn_3_2_0_sh_mask.h"
    43	
  > 44	#include "dcn32/dcn32_clk_mgr.h"
    45	#include "dml/dcn32/dcn32_fpu.h"
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
