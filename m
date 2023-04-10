Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A494817D4
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Apr 2023 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681097952; x=1712633952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vzt1ol+0FbQ0fYAsMfKDCnrMB9EsYH2faE/m2HZGddg=;
  b=i1Z4V9K9nRss8+4lSY1r6MP8OfrPt109ak38jbZ5KKD4tILknWMRp+6w
   WYDUcU16Z/wUBmbY8sBhiLoQTRktj1VdZVjkd1c2eWbFMuvCtsx6uPJKm
   dTZN67Lr6Di6E5/feDSF+lfqN3omr96fZyNFzpP/621axM48RK+L+Tm5W
   /7OiJnxnWdPCPNrouAzsreE20Fkxo3slZ3NHWCVVIwapdUwPKKHAqY1jf
   jIVlRu/fxdBoPsfzAwS+OkSj9PS5GQvEZrEdMs+ktAVSEmUbQp/4BYN1A
   JdgWwzPIlmO+gFqeOE9fT6fcHex5hxgOgOXIwKVVTe0RZwZDYcW/1Y+ZM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="340767453"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="340767453"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 20:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="831796616"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="831796616"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2023 20:39:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pliN0-000V0V-01;
	Mon, 10 Apr 2023 03:39:06 +0000
Date: Mon, 10 Apr 2023 11:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-5.10.y 7475/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <202304101155.r27HPJzc-lkp@intel.com>
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
commit: f4b2488987a8152607348f34add9a6e858e18429 [7475/9999] v4l: vxe-enc: Add Device specific memory configuration
:::::: branch date: 6 weeks ago
:::::: commit date: 1 year, 5 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304101155.r27HPJzc-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
