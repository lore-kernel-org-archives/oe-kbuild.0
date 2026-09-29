Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2A23AE87
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 00:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790640726; cv=none; b=CLdswPxoEkCvkwSOAW2S/bc+cxrRKAhugvESlCuCRB3Xrc55v8fhry4CH/ce41nRaghurr1uTZkZRZNDUgFL/trzGwHBQw6UGXAGxAoePKeIKHtqtYI3sRahcnUQsMc7K8E41fUVfkav9kBA+sR3vWSufqdgl5yqC0pv042Wgkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790640726; c=relaxed/simple;
	bh=rvRpB855sDnO/jshFxhrTpvzQMDeKWS3bXdcryVZx5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmHFNuSSpvkhDpnq1GtgmNcKy5gSnb2hsLcTXeFb9cZYdsabQIVjb7FKZMIyJZqe1S5hep6brHuNu+i2cXimqv5remzXJCq3d3LpsfCHlU22kntNeJ/VhvfWqVpCkWFUx/XY7bD2YWNxhOGWqb1hrz9/27pDCsPg4IW+M0GNNwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lk/MbLWF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lk/MbLWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790640725; x=1822176725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rvRpB855sDnO/jshFxhrTpvzQMDeKWS3bXdcryVZx5Q=;
  b=lk/MbLWFk3r/bcepchaf6cw2s2OXghdw5P7MJoJa5uWdqsWQGQtD34J/
   icI/Bd9mpBn8nceVk1h3fXHcL9EJc5rKI3nIrtvh5e2nUuil4fbOcKCPc
   ozyar2BS1ar4qDfdnTqBNv3PS6P2USc1IWUdG8CL/6eoTNw4RThJEheSD
   xjNlNX3U8oWw0MF2xdhjVdJFH/8FlTsOXPDLLNoYFbBvaHqN4aUtbHMth
   y3lxkIMRLts2nkLduZbk3RPKrYGLhG6zkzQDI4AkNfa3yLBuAjRhYvZyU
   9eeOIK51g1kJbovdw62xF4s3FK3oO2bQjIIy2LVSQBO1nEZmLBV/wO3UZ
   w==;
X-CSE-ConnectionGUID: NKuZxJy0Qrm/Q1nbsHJG+Q==
X-CSE-MsgGUID: /u6DxrNWQw2t0ABSEfeG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101516895"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101516895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 17:12:05 -0700
X-CSE-ConnectionGUID: /H49v+OOSYqQFYhtVWm1XQ==
X-CSE-MsgGUID: Urk4tgueSAWFHLIgNb3mAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283279620"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 17:12:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBLRx-00000000OhM-098A;
	Tue, 29 Sep 2026 00:12:01 +0000
Date: Tue, 29 Sep 2026 08:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: net: ethtool: add BaseC2C medium & AUI C2C link modes
Message-ID: <202609290735.6l9LLSfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <202609290735.6l9LLSfn-lkp@intel.com>
References: <202609290735.6l9LLSfn-lkp@intel.com>

Hi Siddaraju,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Siddaraju-DH/net-ethtool-add-BaseC2C-medium-AUI-C2C-link-modes/20260928-040656
base:   
patch link:    https://lore.kernel.org/r/202609290735.6l9LLSfn-lkp%40intel.com
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260929/202609290735.6l9LLSfn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290735.6l9LLSfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609290735.6l9LLSfn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy-core.c:21:2: error: call to '__compiletime_assert_605' declared with 'error' attribute: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.
--
   21 |         BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
   |         ^
   include/linux/build_bug.h:40:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
   |                                     ^
   include/linux/compiler_types.h:702:2: note: expanded from macro 'compiletime_assert'
   702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   |         ^
   include/linux/compiler_types.h:690:2: note: expanded from macro '_compiletime_assert'
   690 |         __compiletime_assert(condition, msg, prefix, suffix)
   |         ^
   include/linux/compiler_types.h:683:4: note: expanded from macro '__compiletime_assert'
   683 |                         prefix ## suffix();                             \
   |                         ^
   <scratch space>:141:1: note: expanded from here
   141 | __compiletime_assert_605
   | ^
>> drivers/net/phy/phy-core.c:21:2: error: call to '__compiletime_assert_605' declared with 'error' attribute: Enum ethtool_link_mode_bit_indices and phylib are out of sync. If a speed or mode has been added please update phy_speed_to_str and the PHY settings array.


vim +21 drivers/net/phy/phy-core.c

a3e51d4711793b Heiner Kallweit 2025-02-22  13  
4069a572d423b7 Andrew Lunn     2020-09-23  14  /**
4069a572d423b7 Andrew Lunn     2020-09-23  15   * phy_speed_to_str - Return a string representing the PHY link speed
4069a572d423b7 Andrew Lunn     2020-09-23  16   *
4069a572d423b7 Andrew Lunn     2020-09-23  17   * @speed: Speed of the link
4069a572d423b7 Andrew Lunn     2020-09-23  18   */
da4625ac2637e4 Russell King    2017-07-25  19  const char *phy_speed_to_str(int speed)
da4625ac2637e4 Russell King    2017-07-25  20  {
491c5dc98b848c Yael Chemla     2025-11-19 @21  	BUILD_BUG_ON_MSG(__ETHTOOL_LINK_MODE_MASK_NBITS != 125,
c6576bfe2f4baa Heiner Kallweit 2019-04-13  22  		"Enum ethtool_link_mode_bit_indices and phylib are out of sync. "
c6576bfe2f4baa Heiner Kallweit 2019-04-13  23  		"If a speed or mode has been added please update phy_speed_to_str "
c6576bfe2f4baa Heiner Kallweit 2019-04-13  24  		"and the PHY settings array.\n");
c6576bfe2f4baa Heiner Kallweit 2019-04-13  25  
da4625ac2637e4 Russell King    2017-07-25  26  	switch (speed) {
da4625ac2637e4 Russell King    2017-07-25  27  	case SPEED_10:
da4625ac2637e4 Russell King    2017-07-25  28  		return "10Mbps";
da4625ac2637e4 Russell King    2017-07-25  29  	case SPEED_100:
da4625ac2637e4 Russell King    2017-07-25  30  		return "100Mbps";
da4625ac2637e4 Russell King    2017-07-25  31  	case SPEED_1000:
da4625ac2637e4 Russell King    2017-07-25  32  		return "1Gbps";
da4625ac2637e4 Russell King    2017-07-25  33  	case SPEED_2500:
da4625ac2637e4 Russell King    2017-07-25  34  		return "2.5Gbps";
da4625ac2637e4 Russell King    2017-07-25  35  	case SPEED_5000:
da4625ac2637e4 Russell King    2017-07-25  36  		return "5Gbps";
da4625ac2637e4 Russell King    2017-07-25  37  	case SPEED_10000:
da4625ac2637e4 Russell King    2017-07-25  38  		return "10Gbps";
da4625ac2637e4 Russell King    2017-07-25  39  	case SPEED_14000:
da4625ac2637e4 Russell King    2017-07-25  40  		return "14Gbps";
da4625ac2637e4 Russell King    2017-07-25  41  	case SPEED_20000:
da4625ac2637e4 Russell King    2017-07-25  42  		return "20Gbps";
da4625ac2637e4 Russell King    2017-07-25  43  	case SPEED_25000:
da4625ac2637e4 Russell King    2017-07-25  44  		return "25Gbps";
da4625ac2637e4 Russell King    2017-07-25  45  	case SPEED_40000:
da4625ac2637e4 Russell King    2017-07-25  46  		return "40Gbps";
da4625ac2637e4 Russell King    2017-07-25  47  	case SPEED_50000:
da4625ac2637e4 Russell King    2017-07-25  48  		return "50Gbps";
da4625ac2637e4 Russell King    2017-07-25  49  	case SPEED_56000:
da4625ac2637e4 Russell King    2017-07-25  50  		return "56Gbps";
a9927022c4491b Mika Westerberg 2026-01-15  51  	case SPEED_80000:
a9927022c4491b Mika Westerberg 2026-01-15  52  		return "80Gbps";
da4625ac2637e4 Russell King    2017-07-25  53  	case SPEED_100000:
da4625ac2637e4 Russell King    2017-07-25  54  		return "100Gbps";
5a3144e4195621 Heiner Kallweit 2019-04-13  55  	case SPEED_200000:
5a3144e4195621 Heiner Kallweit 2019-04-13  56  		return "200Gbps";
14af7fd1d4279c Jiri Pirko      2019-10-12  57  	case SPEED_400000:
14af7fd1d4279c Jiri Pirko      2019-10-12  58  		return "400Gbps";
404c76783f3221 Amit Cohen      2022-10-20  59  	case SPEED_800000:
404c76783f3221 Amit Cohen      2022-10-20  60  		return "800Gbps";
491c5dc98b848c Yael Chemla     2025-11-19  61  	case SPEED_1600000:
491c5dc98b848c Yael Chemla     2025-11-19  62  		return "1600Gbps";
da4625ac2637e4 Russell King    2017-07-25  63  	case SPEED_UNKNOWN:
da4625ac2637e4 Russell King    2017-07-25  64  		return "Unknown";
da4625ac2637e4 Russell King    2017-07-25  65  	default:
da4625ac2637e4 Russell King    2017-07-25  66  		return "Unsupported (update phy-core.c)";
da4625ac2637e4 Russell King    2017-07-25  67  	}
da4625ac2637e4 Russell King    2017-07-25  68  }
da4625ac2637e4 Russell King    2017-07-25  69  EXPORT_SYMBOL_GPL(phy_speed_to_str);
da4625ac2637e4 Russell King    2017-07-25  70  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
