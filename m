Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A00933FE
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681907973; x=1713443973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWKeQnYSXbNRsBKF7EFa73iP187KLuZPXX9T5T35Xv8=;
  b=YesgqpxcgJgmGHq7gbHklSzcl/7jUW9IZ3F4hT7D0kZQSMklQD+VZ16A
   awH5D3UqDzwbfC3UlFjIjB4kTsQhfLhV5VbB/o4SuUrylDnGN3j715Tf+
   aL3iltheodQUFiGkdAVnFcbzwDPFqmadnmZAL2Yul3tfw9N0f/QmNPzYe
   OzPOH2uTiFlgG7h1dgBh25qg4TyZMpiJwjInkDWZ47OVe/uMY6aP8iAJf
   LcuLRbuP7zOdZivclbFmiZenQ9M1/aGw09rUbqwU/eBknXxFAlHJzl2PP
   vW+ft+/PJeLTln0vwUYJp9D8J+FNkTzCxew3xeCe5cY+UHzLcuvBsnTcN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="329611650"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="329611650"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 05:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021195108"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="1021195108"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Apr 2023 05:38:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pp75G-000esi-0q;
	Wed, 19 Apr 2023 12:38:50 +0000
Date: Wed, 19 Apr 2023 20:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <202304192017.EBRueUFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/xilinx/clk-xlnx-clock-wizard.c:331:26: sparse: sparse: decimal constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
References: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
TO: devicetree@vger.kernel.org
CC: git@amd.com
CC: linux-clk@vger.kernel.org
CC: robh+dt@kernel.org
CC: sboyd@kernel.org
CC: mturquette@baylibre.com
CC: krzysztof.kozlowski+dt@linaro.org
CC: michal.simek@xilinx.com

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20230418]
[cannot apply to xilinx-xlnx/master robh/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230418102855.6791-3-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: openrisc-randconfig-s052-20230419 (https://download.01.org/0day-ci/archive/20230419/202304192017.EBRueUFL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/143916412aa6a419e20fa37059004329e300ca95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
        git checkout 143916412aa6a419e20fa37059004329e300ca95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/clk/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304192017.EBRueUFL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:331:26: sparse: sparse: decimal constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:332:26: sparse: sparse: cast truncates bits from constant value (1017df800 becomes 17df800)

vim +331 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  315  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  316  static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  317  				 unsigned long parent_rate)
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  318  {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  319  	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  320  	unsigned long vco_freq, freq, diff, vcomin, vcomax;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  321  	u32 m, d, o;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  322  	u32 mmin, mmax, dmin, dmax, omin, omax;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  323  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  324  	if (divider->is_versal) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  325  		mmin = VER_WZRD_M_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  326  		mmax = VER_WZRD_M_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  327  		dmin = VER_WZRD_D_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  328  		dmax = VER_WZRD_D_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  329  		omin = VER_WZRD_O_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  330  		omax = VER_WZRD_O_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18 @331  		vcomin = VER_WZRD_VCO_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18 @332  		vcomax = VER_WZRD_VCO_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  333  	} else {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  334  		mmin = WZRD_M_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  335  		mmax = WZRD_M_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  336  		dmin = WZRD_D_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  337  		dmax = WZRD_D_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  338  		omin = WZRD_O_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  339  		omax = WZRD_O_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  340  		vcomin = WZRD_VCO_MIN;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  341  		vcomax = WZRD_VCO_MAX;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  342  	}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  343  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  344  	for (m = mmin; m <= mmax; m++) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  345  		for (d = dmin; d <= dmax; d++) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  346  			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  347  			if (vco_freq >= vcomin && vco_freq <= vcomax) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  348  				for (o = omin; o <= omax; o++) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  349  					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  350  					diff = abs(freq - rate);
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  351  
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  352  					if (diff < WZRD_MIN_ERR) {
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  353  						divider->m = m;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  354  						divider->d = d;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  355  						divider->o = o;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  356  						return 0;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  357  					}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  358  				}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  359  			}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  360  		}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  361  	}
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  362  	return -EBUSY;
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  363  }
595c88cda65d30 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-03-27  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
