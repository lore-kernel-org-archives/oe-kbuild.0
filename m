Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AEF17EF
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 09:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677405235; x=1708941235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tvXi/9aZCLJLrzTynlII+1QtnDT21D4hG5ArICIAxSg=;
  b=QX6HWgSc/K0vvHDezIxesJZJwwhR//sHxaUIU5ZIhJXPQSqMBZpo1N29
   ZlVxsOvy1G7KIFtlUtOHLY6wwkOsbBziKHoXokngWBswTq6bbXOhurj5N
   Z01ZJ2UqfhjyYCrQPVxrO5fv64fkWU6/zFwfOHics7WlHv+wTLQfRiRL6
   BnNLsDVkrua8bRZtrIMOP+ejA6d32SHSsOHDe87/3TDM4jLPfxa7IZaIY
   5CP+HGC8Y+SsOZcGx3Q+QvESSOObZQ00RDt9cFkd6wFgWlS4YWlTdzscU
   ecy2cTw3JOlQhDwQgtWtuCRbyxlzV6pzKiqAEqnK8KgAUM3qQKNimUYl/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="313373087"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="313373087"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 01:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="705781724"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="705781724"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Feb 2023 01:53:54 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWDj7-0003gd-0b;
	Sun, 26 Feb 2023 09:53:53 +0000
Date: Sun, 26 Feb 2023 17:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-gfx] [PATCH v4 08/22] drm/i915/mtl: C20 PLL programming
Message-ID: <202302261757.1TKkbUsw-lkp@intel.com>
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
In-Reply-To: <20230224101356.2390838-9-mika.kahola@intel.com>
References: <20230224101356.2390838-9-mika.kahola@intel.com>
TO: Mika Kahola <mika.kahola@intel.com>

Hi Mika,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Kahola/drm-i915-mtl-Initial-DDI-port-setup/20230224-182308
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230224101356.2390838-9-mika.kahola%40intel.com
patch subject: [Intel-gfx] [PATCH v4 08/22] drm/i915/mtl: C20 PLL programming
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302261757.1TKkbUsw-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c: intel_tc.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
