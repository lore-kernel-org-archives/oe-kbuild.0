Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A2A29
	for <oe-kbuild@lists.linux.dev>; Sun, 21 May 2023 05:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684645212; x=1716181212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LdOl00vsz1TZw2H0yuPkNbplvPc+t5Ur3AH94oDjqaY=;
  b=h+BfZk/cZse66Z+bZd6lD+8xS14VhEfZqPNRAc/Hich1sV7K/mXtYmki
   ydVd6qUxCjuwLjD9AYCsfltGepfVLOm20V1lZ1oLHcA0M0caSrIUw7Cm+
   AnGp5DmG317hBmokHBhRZKjwiYyVL2CNgZ9Qi2iiAUAVWfltK0ctRsOzx
   si1uzELxHUb69RvcCyXhTvydtYb/tsjWg9JBLUoc+katsrQHT1zGRwNek
   R6hh0xtok/wjobIL+XDumDRMydoGT10ZXxDgrOIv7nvlWAj8ReJtdCIAq
   W4KWvKvUSAHVNkAToFULd5sts8uhpF3zEPoe0m1LeEIup+op3hSt/Zx0L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="418374974"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; 
   d="scan'208";a="418374974"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2023 22:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10716"; a="815216845"
X-IronPort-AV: E=Sophos;i="6.00,181,1681196400"; 
   d="scan'208";a="815216845"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 20 May 2023 22:00:11 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q0bAw-000BzU-35;
	Sun, 21 May 2023 05:00:10 +0000
Date: Sun, 21 May 2023 12:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:drm-next 388/588] drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c:
 amdgpu_xcp.h is included more than once.
Message-ID: <202305211214.DmnW4NMZ-lkp@intel.com>
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
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   cc11fe38a2de1f219f28cd29b6c6bf3db579e466
commit: d56eb041b55247ee13046be35450b332335989ca [388/588] drm/amdgpu: Add XCP functions for GFX v9.4.3
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305211214.DmnW4NMZ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c: amdgpu_xcp.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
