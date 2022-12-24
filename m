Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAB2587
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Dec 2022 10:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671879221; x=1703415221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sdq9CKx7dPCoEvg7ZyZHkRv9Kb7rxfeOwaoRkx2Nmac=;
  b=mWJB3lf8JHcWmCkwUOpQ/i9Z6Y2ULziDw3HG1LSvN0cP48fHrbIXYGjk
   ZGs/+J7Yb4eZOXY316f+e5sdccM0qhyazRp08AjNGSfxuHhhINzx8ihzC
   1Zfi+RfvWSQINEbbXhgjaj3rD962r/ZtZj34aqAu3SnMtwvhzQ61JRdvX
   nH0tswF7M8RqUizaOqljHKbokdE9sD8+xkkWuIteEq43R8EnNfz9lUunO
   wATEGBH1YEjOtRjH6yaYgHyP4JzjubyFZcVWWJ4z4YvWgO8+qf/wDDVAE
   yvb8fxFNep4f8rb11tlAciS+JbTrjHOUD6STI9iwtDp7HWg+wio+hcBQS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="321633237"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="321633237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2022 02:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10570"; a="794668655"
X-IronPort-AV: E=Sophos;i="5.96,271,1665471600"; 
   d="scan'208";a="794668655"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2022 02:53:39 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p929r-000DLD-0o;
	Sat, 24 Dec 2022 10:53:39 +0000
Date: Sat, 24 Dec 2022 18:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 224/1346]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included
 more than once.
Message-ID: <202212241800.rSW9mrRQ-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   b9b26dcfcb221a7465b71e124f9ec0f4f4be988d
commit: 353f790929055728585095cb890b378ee0471607 [224/1346] net: axienet: Add clock support
:::::: branch date: 3 days ago
:::::: commit date: 11 months ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
