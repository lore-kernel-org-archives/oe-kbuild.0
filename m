Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A913234
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677616798; x=1709152798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HydcF2iT3wnjQeNRVai8NtLrAV+9U1YnbDeVa6QyRGs=;
  b=Yt0XR5S+qYXiLS1dn50YUIve1H+4E7iHVbSOtdsI8LMuMCfgc83OBN1Z
   BNQogz9gk77We2CNU1owEDrdrrrakLRLZh4igGpINJCahPA/Ue76Nzuxp
   z1UTYvD85vWILj+i75kH+YtlOr+LZqP82kEjRqXe9hY6se3HodufgAuDE
   tF8Q6tHS+Tnk25l6aj/g5KAqe1tV3RrnodjKuUHmQE73kl7ps0K5MiSXM
   Ljv4Jvdm47KMF/I9N1OJpwD5/S1Q8BAHgoJZMM7TKZIdRwjExMSkUGWGE
   zSumsD7QH7rfvoqRoM5OAWB5wYo6YzPV3mcO12mD48NxsEPiDtmT9Vh33
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="331723384"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="331723384"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 12:39:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="798178867"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="798178867"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2023 12:39:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX6lL-0005dX-0D;
	Tue, 28 Feb 2023 20:39:51 +0000
Date: Wed, 1 Mar 2023 04:39:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <202303010448.DNdmOOVk-lkp@intel.com>
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
head:   c1a12919117a6978f40e723d6e0c67c744e026b9
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
:::::: branch date: 5 days ago
:::::: commit date: 1 year, 4 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303010448.DNdmOOVk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
