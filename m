Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACCFC8E3
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQh+nkwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699192383; x=1730728383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lijhQHbVuEzAu3kFg1Dv+svakEi66HhosaQUaYkgm/Q=;
  b=KQh+nkwJKeApeUKsdIS38GCFHOGoU3D4xeNons4PVOJxEbMQIN87lza2
   pNV3fxRqnK0hP+RYrRtsrsoeF5k49/yevU4W9jvqgZQWYN3D/bZEZgeB/
   yNDk7bH4JeTulaFqKnbmrt9wf661Dytmuv2MT29m2kbSCNb1QmlR6MMGZ
   7oXEzY1qtjM7/19XF+VBlaDYiDEhunIs+C02S1csnj1W6dDsyX/FuiJdp
   WGuPrhxnyPjMThMjfIL0sSDQ4u/bca3t2q7A/WMe+yxI74Y9alP1Sc+Lp
   GRvcr0r4uxnrAuNZyuM3IMgLOomfI61kb/jWwSXyrQez2I8wXymtF0K33
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379541608"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="379541608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 05:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="711971016"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="711971016"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2023 05:53:01 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzdYh-0005V8-1Q;
	Sun, 05 Nov 2023 13:52:59 +0000
Date: Sun, 5 Nov 2023 21:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/fpga/versal-fpga.c:78:34: warning: 'versal_fpga_of_match'
 defined but not used
Message-ID: <202311052137.qkYX2xHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Moritz Fischer <mdf@kernel.org>
CC: Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>

Hi Nava,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 01c54e628932c655e4cd2c6ed0cc688ec6e6f96b fpga: versal-fpga: Add versal fpga manager driver
date:   2 years, 4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 years, 4 months ago
config: i386-buildonly-randconfig-005-20231101 (https://download.01.org/0day-ci/archive/20231105/202311052137.qkYX2xHU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052137.qkYX2xHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311052137.qkYX2xHU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/fpga/versal-fpga.c:78:34: warning: 'versal_fpga_of_match' defined but not used [-Wunused-const-variable=]
      78 | static const struct of_device_id versal_fpga_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~


vim +/versal_fpga_of_match +78 drivers/fpga/versal-fpga.c

01c54e628932c6 Nava kishore Manne 2021-06-26  77  
01c54e628932c6 Nava kishore Manne 2021-06-26 @78  static const struct of_device_id versal_fpga_of_match[] = {
01c54e628932c6 Nava kishore Manne 2021-06-26  79  	{ .compatible = "xlnx,versal-fpga", },
01c54e628932c6 Nava kishore Manne 2021-06-26  80  	{},
01c54e628932c6 Nava kishore Manne 2021-06-26  81  };
01c54e628932c6 Nava kishore Manne 2021-06-26  82  MODULE_DEVICE_TABLE(of, versal_fpga_of_match);
01c54e628932c6 Nava kishore Manne 2021-06-26  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
