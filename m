Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECA10FA
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 01:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695951243; x=1727487243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgr3kPzmCx/3kpKBEjTrhvMFgzpIU8wXljQSrcieNDk=;
  b=SuJcV+615+KrnW4WIuVu6kNkYLiWjcwoWG8MTGMFUitEJfu4MP3cZns2
   SaqsMXhoG/Zfbh33x0xnPj+IEWYKfRNvjyPplKvODwBtgAotJlQ8e8RhG
   CBt017FfM1/AgxBEqI9KmWkyOt/aTTUXJVpcgjH4mVUHdFmj7j2PpmIWl
   659eN3UK2weBjCXQ7Qez0J1otpYPou33OzA41q4nFz9x7tT8Y4xYhcJLx
   cDzT2EilJe6XiA6v4xKRvM5hW2LHi6oSX33hAhzU4iUnBYAreUAqQl7sO
   Jxd/WpAxT8bYRplRYaztTgfkofVr6hbQuFG70g4MV5TU4D6Fi7wiJujh1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="822101"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="822101"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 18:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996767250"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="996767250"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 28 Sep 2023 18:34:00 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm2OE-0002Hv-0L;
	Fri, 29 Sep 2023 01:33:58 +0000
Date: Fri, 29 Sep 2023 09:33:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 149/1370]
 drivers/clk/clk-xlnx-clock-wizard-v.c:231:41: sparse: sparse: decimal
 constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means
 long long, C90 compilers are very likely to produce unsigned long (and a
 warning) here
Message-ID: <202309290902.iD4ygGSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/clk-xlnx-clock-wizard-v.c:231:41: sparse: sparse: decimal constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: e756a95a51aa08308550da18fbd27b4811517b68 [149/1370] clocking-wizard: Add versal clocking wizard support
:::::: branch date: 7 days ago
:::::: commit date: 9 months ago
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290902.iD4ygGSq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290902.iD4ygGSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309290902.iD4ygGSq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk-xlnx-clock-wizard-v.c:231:41: sparse: sparse: decimal constant 2160000000 is between LONG_MAX and ULONG_MAX. For C99 that means long long, C90 compilers are very likely to produce unsigned long (and a warning) here

vim +231 drivers/clk/clk-xlnx-clock-wizard-v.c

e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  220  
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  221  static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  222  				 unsigned long parent_rate)
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  223  {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  224  	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  225  	u64 vco_freq, freq, diff;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  226  	u32 m, d, o;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  227  
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  228  	for (m = WZRD_M_MIN; m <= WZRD_M_MAX; m++) {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  229  		for (d = WZRD_D_MIN; d <= WZRD_D_MAX; d++) {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  230  			vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31 @231  			if (vco_freq >= WZRD_VCO_MIN && vco_freq <= WZRD_VCO_MAX) {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  232  				for (o = WZRD_O_MIN; o <= WZRD_O_MAX; o++) {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  233  					freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  234  					diff = abs(freq - rate);
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  235  
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  236  					if (diff < WZRD_MIN_ERR) {
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  237  						divider->valuem = m;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  238  						divider->valued = d;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  239  						divider->valueo = o;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  240  						return 0;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  241  					}
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  242  				}
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  243  			}
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  244  		}
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  245  	}
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  246  	return -EBUSY;
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  247  }
e756a95a51aa08 Shubhrajyoti Datta 2020-03-31  248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
