Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF0520B05
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 10:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZrwZMxt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704362945; x=1735898945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbLl22d0g/5OFzLrjLEm1bgH7fo5MzO8V+KO1n4MV0g=;
  b=kZrwZMxt5Nwn901PwuMLAE1/meUezvmWf5MrqRjETsb4woIr6ugyYNnX
   0LHjPWHoAlGS0o3pGDijnBnKVDyEOz9VBDCCgkWtYAdVffPys26tBW8a6
   1JZMQaepuOb18PEaYURKxmY6O7vGzPWT1ylIG44xlr6uMK8cnIMneUFle
   55Oeupf+W0j2xo2w3Ro3OibKlMDHyIBq8bcyveFTweEcLfzUIOjfUmzfj
   0EO7CHa7bf4CBSR515GdFTsEoNcFrm/3XtOUVNbAy1QnhJv7htuM32lNN
   U09RjapMb11byap29Spz96o8Q6Hhay/9CJ5Jl2CW9xJxkahVZQG6xEK8G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="399974970"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="399974970"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 02:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="1111680267"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="1111680267"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Jan 2024 02:09:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLKer-000N9E-0K;
	Thu, 04 Jan 2024 10:09:01 +0000
Date: Thu, 4 Jan 2024 18:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH iwl-next v1] ixgbe: Convert ret val type from s32 to int
Message-ID: <202401041701.6QKTsZmx-lkp@intel.com>
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
In-Reply-To: <20240103101135.386891-1-jedrzej.jagielski@intel.com>
References: <20240103101135.386891-1-jedrzej.jagielski@intel.com>
TO: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
TO: intel-wired-lan@lists.osuosl.org
CC: anthony.l.nguyen@intel.com
CC: netdev@vger.kernel.org
CC: Jedrzej Jagielski <jedrzej.jagielski@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

Hi Jedrzej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on horms-ipvs/master]
[cannot apply to tnguy-next-queue/dev-queue tnguy-net-queue/dev-queue linus/master v6.7-rc8 next-20240104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jedrzej-Jagielski/ixgbe-Convert-ret-val-type-from-s32-to-int/20240103-182213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git master
patch link:    https://lore.kernel.org/r/20240103101135.386891-1-jedrzej.jagielski%40intel.com
patch subject: [PATCH iwl-next v1] ixgbe: Convert ret val type from s32 to int
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041701.6QKTsZmx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401041701.6QKTsZmx-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c:2884 ixgbe_get_lcd_t_x550em() warn: missing error code? 'status'
drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c:3130 ixgbe_enter_lplu_t_x550em() warn: missing error code? 'status'

Old smatch warnings:
drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c:2890 ixgbe_get_lcd_t_x550em() warn: missing error code? 'status'

vim +/status +2884 drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c

cb8e051446ae55 Tony Nguyen       2016-10-26  2859  
6ac7439459606a Don Skidmore      2015-06-17  2860  /** ixgbe_get_lcd_x550em - Determine lowest common denominator
6ac7439459606a Don Skidmore      2015-06-17  2861   *  @hw: pointer to hardware structure
6ac7439459606a Don Skidmore      2015-06-17  2862   *  @lcd_speed: pointer to lowest common link speed
6ac7439459606a Don Skidmore      2015-06-17  2863   *
6ac7439459606a Don Skidmore      2015-06-17  2864   *  Determine lowest common link speed with link partner.
6ac7439459606a Don Skidmore      2015-06-17  2865   **/
9ea222bfe41f87 Jedrzej Jagielski 2024-01-03  2866  static int ixgbe_get_lcd_t_x550em(struct ixgbe_hw *hw,
6ac7439459606a Don Skidmore      2015-06-17  2867  				  ixgbe_link_speed *lcd_speed)
6ac7439459606a Don Skidmore      2015-06-17  2868  {
6ac7439459606a Don Skidmore      2015-06-17  2869  	u16 an_lp_status;
9ea222bfe41f87 Jedrzej Jagielski 2024-01-03  2870  	int status;
6ac7439459606a Don Skidmore      2015-06-17  2871  	u16 word = hw->eeprom.ctrl_word_3;
6ac7439459606a Don Skidmore      2015-06-17  2872  
6ac7439459606a Don Skidmore      2015-06-17  2873  	*lcd_speed = IXGBE_LINK_SPEED_UNKNOWN;
6ac7439459606a Don Skidmore      2015-06-17  2874  
6ac7439459606a Don Skidmore      2015-06-17  2875  	status = hw->phy.ops.read_reg(hw, IXGBE_AUTO_NEG_LP_STATUS,
4dc4000b35119f Emil Tantilov     2016-09-26  2876  				      MDIO_MMD_AN,
6ac7439459606a Don Skidmore      2015-06-17  2877  				      &an_lp_status);
6ac7439459606a Don Skidmore      2015-06-17  2878  	if (status)
6ac7439459606a Don Skidmore      2015-06-17  2879  		return status;
6ac7439459606a Don Skidmore      2015-06-17  2880  
6ac7439459606a Don Skidmore      2015-06-17  2881  	/* If link partner advertised 1G, return 1G */
6ac7439459606a Don Skidmore      2015-06-17  2882  	if (an_lp_status & IXGBE_AUTO_NEG_LP_1000BASE_CAP) {
6ac7439459606a Don Skidmore      2015-06-17  2883  		*lcd_speed = IXGBE_LINK_SPEED_1GB_FULL;
6ac7439459606a Don Skidmore      2015-06-17 @2884  		return status;
6ac7439459606a Don Skidmore      2015-06-17  2885  	}
6ac7439459606a Don Skidmore      2015-06-17  2886  
6ac7439459606a Don Skidmore      2015-06-17  2887  	/* If 10G disabled for LPLU via NVM D10GMP, then return no valid LCD */
6ac7439459606a Don Skidmore      2015-06-17  2888  	if ((hw->bus.lan_id && (word & NVM_INIT_CTRL_3_D10GMP_PORT1)) ||
6ac7439459606a Don Skidmore      2015-06-17  2889  	    (word & NVM_INIT_CTRL_3_D10GMP_PORT0))
6ac7439459606a Don Skidmore      2015-06-17  2890  		return status;
6ac7439459606a Don Skidmore      2015-06-17  2891  
6ac7439459606a Don Skidmore      2015-06-17  2892  	/* Link partner not capable of lower speeds, return 10G */
6ac7439459606a Don Skidmore      2015-06-17  2893  	*lcd_speed = IXGBE_LINK_SPEED_10GB_FULL;
6ac7439459606a Don Skidmore      2015-06-17  2894  	return status;
6ac7439459606a Don Skidmore      2015-06-17  2895  }
6ac7439459606a Don Skidmore      2015-06-17  2896  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
