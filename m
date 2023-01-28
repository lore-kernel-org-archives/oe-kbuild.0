Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6310733F7
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jan 2023 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674931068; x=1706467068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9Z++si90fcKc1ebKlJsoYFKCkf93NvaAgfa8llTJzE=;
  b=TOJPSfNlNb+UVBkfg1ECE7T+grfXXgq8ym6MVrCDf44TAo+xwR2ZFyQv
   YiCaHN8itGCtssq4y0FGF2HtI44U2s0bsjxwfX68tGfO9Eu9c5PyfJZpJ
   y+rLiNGkWqEtsv2fWhbYYb27pi2bLrN0zp2ONK968IL4Yju5UjQhSJfOU
   DqSJxE8Lhr4QWRkE2RcW8MjniTiSoUeRzRZVu5T/zyLdglLleN1+Ufy/T
   MBVi5wOz0+5M+J0D3tB5A4Z/PxxE3EYE9yVWHraqU1Wv5ube/I1AdeyFI
   k+BH6IEojAUVWjxjKGXI0vkUpfXwhyIJXXCOz1HmyA6HZi9hk6x8NUWqh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391876976"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391876976"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 10:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="992422559"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="992422559"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2023 10:37:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLq5B-0000zU-2s;
	Sat, 28 Jan 2023 18:37:45 +0000
Date: Sun, 29 Jan 2023 02:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [agd5f:drm-next-6.3 306/313]
 drivers/gpu/drm/amd/display/dc/core/dc_link.c: opp.h is included more than
 once.
Message-ID: <202301290224.3wkZZaSI-lkp@intel.com>
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
TO: Wenjing Liu <wenjing.liu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: George Shen <George.Shen@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.3
head:   cdf657fc1f4c9758f86ae3adeb32ee68cbd90691
commit: 6ca7415f11af5200ab10bd420b513f846e9bfb99 [306/313] drm/amd/display: merge dc_link_dp into dc_link
:::::: branch date: 20 hours ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/core/dc_link.c: opp.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
