Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD636E
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 04:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668055270; x=1699591270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYJ9dkK3idYXlPa5v+MkeW3i1YDyTzBP+ykAh6XH2P4=;
  b=WQ0M9xufopkTUHzIOPYMB2WtHH6sxNKJd8i8gZkRVpnvFSDEJymUqz/w
   1vQqFjY+fq+SLfimn7HgoJG5TUhCEYDraWAdhOy1Z1p+03CcnVLd1lPqR
   wkWojXZX83Ya/ZHHkq0ZgVkp1oqhssPZFLCs/CnFP0pCIn7U7DC+oZfrN
   E5DpZQ32XexZdACMtMsMPiklC1F42z1y33YJAvSt7NcdQfmoYm4qKF7pq
   Zz3HPb+8C30piLmkFjS1S9roLrAxKLiI9tWmkVL6Jx72MuOIbvfM3m376
   8+CbMH0EqNf51DmPlDamtJPrkSao9ffB+d/gBlUqp0dPsfPOSn+VB8ELA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="312980746"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="312980746"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2022 20:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="966264753"
X-IronPort-AV: E=Sophos;i="5.96,152,1665471600"; 
   d="scan'208";a="966264753"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Nov 2022 20:41:08 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oszNE-0002RA-0a;
	Thu, 10 Nov 2022 04:41:08 +0000
Date: Thu, 10 Nov 2022 12:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <202211101240.y3bhVoHR-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Sunita Nadampalli <sunitan@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   4c9aff667ee7bb101378666e629f8bc55c150ee8
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
:::::: branch date: 7 days ago
:::::: commit date: 12 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
