Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F83136F
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 02:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680920843; x=1712456843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGN3d/9Mlu0N/1r8hrsuEzqRxr6hldSNBZTKDCWTHWE=;
  b=Cdgg3QvP5uTlIdnt+DvFXJxL72Djn+0LNEm5TcZ06epJL5rb212G+n3N
   J8U8NEMg24Dwnd8ytT3LFD9zL+cYhJXdH/wVRuTu4FhNGCtbmiFd29rUV
   8a6sYoDySF8xcrkIbJtb49LZyY64Y4X+tAAsll7bE4D54oTglapqyWPQ0
   1szocp2h0rWP8jT61RN0r+VHqrDnX8iYKvLgH4SRhe5tujkLOkvaF5uIS
   XCe8l2wQ/c+M05cm5R58yPK/UG+B27PNRxb/fcg3b35S1MNh/iI6EXR1m
   KmCnbjQfcC1Jh6uqoP4e6UpxL9Cr/tRR+1/SyCeZmyuS3yRQjHU7oWYjr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="327193473"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="327193473"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 19:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="637879066"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="637879066"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Apr 2023 19:27:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkyIT-000TBU-0B;
	Sat, 08 Apr 2023 02:27:21 +0000
Date: Sat, 8 Apr 2023 10:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
Message-ID: <202304081045.5aflIfGy-lkp@intel.com>
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
In-Reply-To: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
References: <20230404090823.148226-3-biju.das.jz@bp.renesas.com>
TO: Biju Das <biju.das.jz@bp.renesas.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: linux-clk@vger.kernel.org
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1bd575707d704530a52d5dd320c29d79e9cff42d]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/dt-bindings-clock-Add-Renesas-versa3-clock-generator-bindings/20230404-171012
base:   1bd575707d704530a52d5dd320c29d79e9cff42d
patch link:    https://lore.kernel.org/r/20230404090823.148226-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v4 2/3] drivers: clk: Add support for versa3 clock driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-m031-20230405 (https://download.01.org/0day-ci/archive/20230408/202304081045.5aflIfGy-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304081045.5aflIfGy-lkp@intel.com/

smatch warnings:
drivers/clk/clk-versaclock3.c:546 vc3_clk_mux_determine_rate() warn: replace divide condition 'req->best_parent_rate / req->rate' with 'req->best_parent_rate >= req->rate'

vim +546 drivers/clk/clk-versaclock3.c

fe68e1ca2f2871 Biju Das 2023-04-04  537  
fe68e1ca2f2871 Biju Das 2023-04-04  538  static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
fe68e1ca2f2871 Biju Das 2023-04-04  539  				      struct clk_rate_request *req)
fe68e1ca2f2871 Biju Das 2023-04-04  540  {
fe68e1ca2f2871 Biju Das 2023-04-04  541  	int ret;
fe68e1ca2f2871 Biju Das 2023-04-04  542  	int frc;
fe68e1ca2f2871 Biju Das 2023-04-04  543  
fe68e1ca2f2871 Biju Das 2023-04-04  544  	ret = clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
fe68e1ca2f2871 Biju Das 2023-04-04  545  	if (ret) {
fe68e1ca2f2871 Biju Das 2023-04-04 @546  		if (req->best_parent_rate / req->rate) {
fe68e1ca2f2871 Biju Das 2023-04-04  547  			frc = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
fe68e1ca2f2871 Biju Das 2023-04-04  548  						    req->rate);
fe68e1ca2f2871 Biju Das 2023-04-04  549  			req->rate *= frc;
fe68e1ca2f2871 Biju Das 2023-04-04  550  			return clk_mux_determine_rate_flags(hw, req,
fe68e1ca2f2871 Biju Das 2023-04-04  551  							    CLK_SET_RATE_PARENT);
fe68e1ca2f2871 Biju Das 2023-04-04  552  		}
fe68e1ca2f2871 Biju Das 2023-04-04  553  		ret = 0;
fe68e1ca2f2871 Biju Das 2023-04-04  554  	}
fe68e1ca2f2871 Biju Das 2023-04-04  555  
fe68e1ca2f2871 Biju Das 2023-04-04  556  	return ret;
fe68e1ca2f2871 Biju Das 2023-04-04  557  }
fe68e1ca2f2871 Biju Das 2023-04-04  558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
