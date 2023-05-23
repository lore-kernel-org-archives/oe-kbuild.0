Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B891B8F2
	for <oe-kbuild@lists.linux.dev>; Tue, 23 May 2023 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684825248; x=1716361248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+ZoEorFiMKuP0bIz+CHk3dk0oma91fVKh8nLGBIfrY=;
  b=nyktgXDsxpLqFR0QQnemZJ+0EIcMbDhaoutblYtB9rrIfQQax3qx/VIs
   qvgJFDGVcwJo/t66DoSryqDjSp/XBK332eTl9Um14vI+fKmKSUPruHsQS
   puGlCkiA268K6qK+Fh9HpxiqH6SaiRksg02ZzgASJ8wvnbxkBg8k7USeG
   jRa2UK2RB891CsNvXarisOgw3r7T7FYMFAg13akOJxRjLpNOdHcXCxcZE
   /gtqgAkEhz/vHzXmfQJ28yOl4kOv7yxPXW1ApgmFxuu9qaL80BLwVqFdv
   q2J0NDP/u2zYbbgQdXftKQtr3kMmmQ+GQr5HRLungHdMg4tRRFzGCh30D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="350661786"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="350661786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 00:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="827976857"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="827976857"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 May 2023 00:00:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1M0j-000DYp-3B;
	Tue, 23 May 2023 07:00:45 +0000
Date: Tue, 23 May 2023 15:00:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2827/4223]
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c:65 amdgpu_xcp_run_transition()
 error: buffer overflow 'xcp_mgr->xcp' 8 <= 8
Message-ID: <202305231453.I0bXngYn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lijo Lazar <lijo.lazar@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f258af06b6268be8e960f63c3f66e88bdbbbdb0
commit: 156bf3df0c082ce3feadb27d0306537345c2f42a [2827/4223] drm/amdgpu: Add initial version of XCP routines
:::::: branch date: 27 hours ago
:::::: commit date: 5 days ago
config: s390-randconfig-m031-20230522 (https://download.01.org/0day-ci/archive/20230523/202305231453.I0bXngYn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305231453.I0bXngYn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c:65 amdgpu_xcp_run_transition() error: buffer overflow 'xcp_mgr->xcp' 8 <= 8

vim +65 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c

156bf3df0c082c Lijo Lazar 2022-09-16  57  
156bf3df0c082c Lijo Lazar 2022-09-16  58  static int amdgpu_xcp_run_transition(struct amdgpu_xcp_mgr *xcp_mgr, int xcp_id,
156bf3df0c082c Lijo Lazar 2022-09-16  59  				     int state)
156bf3df0c082c Lijo Lazar 2022-09-16  60  {
156bf3df0c082c Lijo Lazar 2022-09-16  61  	struct amdgpu_xcp_ip *xcp_ip;
156bf3df0c082c Lijo Lazar 2022-09-16  62  	struct amdgpu_xcp *xcp;
156bf3df0c082c Lijo Lazar 2022-09-16  63  	int i, ret;
156bf3df0c082c Lijo Lazar 2022-09-16  64  
156bf3df0c082c Lijo Lazar 2022-09-16 @65  	if (xcp_id > MAX_XCP || !xcp_mgr->xcp[xcp_id].valid)
156bf3df0c082c Lijo Lazar 2022-09-16  66  		return -EINVAL;
156bf3df0c082c Lijo Lazar 2022-09-16  67  
156bf3df0c082c Lijo Lazar 2022-09-16  68  	xcp = &xcp_mgr->xcp[xcp_id];
156bf3df0c082c Lijo Lazar 2022-09-16  69  	for (i = 0; i < AMDGPU_XCP_MAX_BLOCKS; ++i) {
156bf3df0c082c Lijo Lazar 2022-09-16  70  		xcp_ip = &xcp->ip[i];
156bf3df0c082c Lijo Lazar 2022-09-16  71  		ret = __amdgpu_xcp_run(xcp_mgr, xcp_ip, state);
156bf3df0c082c Lijo Lazar 2022-09-16  72  		if (ret)
156bf3df0c082c Lijo Lazar 2022-09-16  73  			break;
156bf3df0c082c Lijo Lazar 2022-09-16  74  	}
156bf3df0c082c Lijo Lazar 2022-09-16  75  
156bf3df0c082c Lijo Lazar 2022-09-16  76  	return ret;
156bf3df0c082c Lijo Lazar 2022-09-16  77  }
156bf3df0c082c Lijo Lazar 2022-09-16  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
