Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2315AA
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Mar 2023 01:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677979752; x=1709515752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COQTaOikpDNGgI8RxmwjeGb6+XInML7VVtSmXztG9wg=;
  b=hj8QQ7lFCdcPkMlBKHEQJMU9XTaBg0r6/W+kos4qtJPQKOnUUWVe+U1E
   qIVXqaBLuVfbQeCuXY+CXZYPAq8SUTwTaeKKA7lcFp44dRR1dfruABXQf
   FwckFWKJCRrw4b02pElXWVXFVIikpYALuMuw6GsjxAcQrP1pzgPurBX/U
   +6y3G07JzVSChMnOW9veo50xym0gDf7/Nltovm96jkmr50y0zpyWPk1va
   khFdvLz+OxdvYijRNvqiG7Jy3KKisX3qTOjhC5Z3EcrtiJT8hsoJ/r0eq
   HKIXAouyiVfBF9qVWcEmezxt7Y4wcQ9ypzia7ZvQlseKMD8/LV5VPo83A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="400151208"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="400151208"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 17:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10639"; a="706037225"
X-IronPort-AV: E=Sophos;i="5.98,234,1673942400"; 
   d="scan'208";a="706037225"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Mar 2023 17:29:11 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYdBW-0002TO-1X;
	Sun, 05 Mar 2023 01:29:10 +0000
Date: Sun, 5 Mar 2023 09:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 30/53] drivers/iommu/iommu.c:
 iommu-priv.h is included more than once.
Message-ID: <202303050926.Nu8TXzXW-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: 9df01e25af3a064a860025a38d73d05c418b08eb [30/53] iommu: Move dev_iommu_ops() to private header
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303050926.Nu8TXzXW-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c: iommu-priv.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
