Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F68F58
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676301023; x=1707837023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZQ/0xDM8anGj+7CY02NyMvJUQML0MZTzL7/Ui5+7H0=;
  b=hmOiyc3UV+hIYOwGn1iYYj1gTSXlx4z3hzdUJ+jlRgTBHlDmmdZ0UWFg
   vhPl03XAN8+rVKQluFtOPhfHSXAc9bjne3g8mHHOGuDbSuw7j2E4zGaIY
   BdgsCAiWlKdl2dn+afHO6xUHFw67HyBcV/gamU7LVZe01MmvlP5Ejuiln
   qBI/RWhS3hpvARSAc1gfBXSBvFACU2vlPUbcqSUmwmE0+h2Juj0pfgITM
   NRQdUCcjn9dRBTmWg/6LmUGl8RdqfdJcNkg7QSYHpminzUtzBaA7c9j76
   hR+Hxr3mwFn1O9UsmPlMfYbg5zb8H6XXcro6FsUDgDQtQw3qAuX8O8gNa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="358315089"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="358315089"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 07:10:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914353061"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="914353061"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Feb 2023 07:10:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRaTF-0007o5-0g;
	Mon, 13 Feb 2023 15:10:21 +0000
Date: Mon, 13 Feb 2023 23:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <202302132230.ZNJOxXxi-lkp@intel.com>
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
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 3 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302132230.ZNJOxXxi-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
