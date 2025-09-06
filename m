Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA461C27
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757170555; cv=none; b=NLU32ud0NcJW7J3TaiGiWcFBUv+KiluKFuTEtUFjNc+EmUX+OaF6FuSSLC5SnwbbhBpipf+le4/iQTLytDsCDBaM3hhxNI6PrNpGKp3G15FlXio5FWRhdl3in1QcJ4gkj9/G1Szgb6zwREHRuqffVO4pbNhVa/l2yr+4r8t4jp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757170555; c=relaxed/simple;
	bh=C5RlDZbxdXrNcGVOodVb0vpv6keYJy5DP+asJExri7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HbWbHK+kY3u5uEHs9Z1lEag7R9HhJ8d4GrYXNq9SULG38mS7eWkvhWOLxxN12ywQ7Z4CTONcsBo0TXKZD89xWusinpT9citB2mJk2zifTlvywR1bpgriIoSQsVH7N+L3x7Jf3TRXvQHqNFkwkncNj0q4kxp06dU5oqMROpCtIXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SkDTAz+/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SkDTAz+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757170554; x=1788706554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5RlDZbxdXrNcGVOodVb0vpv6keYJy5DP+asJExri7s=;
  b=SkDTAz+/VDo69TMQXEJ/OhhC4zQwHUc77OaiB1NGzMVM2FM6Yvbwj6rn
   DkFDniGeUK1h+qRUlda90Kff4YNhUcVhS5uosnC7mMVotizfF5kDxwDPI
   UNMkkrqVGO5i0SaNV+Fg3z+I4NQ46xnhUAmkkO2jXSGMitQjNg+dWXOWk
   WCGeV5z28t3DhpFI2L9qk+auuy+2bawEbdrIIogWi0runuSoqBGAxV8HL
   w/suWImXt2KsR778CNZmuAFqfSOO5fdPEBlu6wPKoXMoiCBVogS040VqE
   GWhUJXej0OC397ES6rWM8HG9T/7BdchkNLH4dFbhawSZqIFWrSXGkLsdx
   g==;
X-CSE-ConnectionGUID: qKYkub9CQXSTDQHx+LOxNQ==
X-CSE-MsgGUID: nziKYVq4RVSwJZqlHqma8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58704969"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58704969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 07:55:53 -0700
X-CSE-ConnectionGUID: DvxW+ZGRSOK7IR1eGOuNzw==
X-CSE-MsgGUID: 0/UMQkNpTh6DHopgdFHZpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="176477035"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Sep 2025 07:55:51 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuuKS-0001YV-2c;
	Sat, 06 Sep 2025 14:55:48 +0000
Date: Sat, 6 Sep 2025 22:55:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v7 3/3] net: dsa: yt921x: Add support for
 Motorcomm YT921x
Message-ID: <202509062201.7oDUWUsM-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250905181728.3169479-4-mmyangfl@gmail.com>
References: <20250905181728.3169479-4-mmyangfl@gmail.com>
TO: David Yang <mmyangfl@gmail.com>
TO: netdev@vger.kernel.org
CC: David Yang <mmyangfl@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Simon Horman <horms@kernel.org>
CC: Russell King <linux@armlinux.org.uk>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on linus/master v6.17-rc4 next-20250905]
[cannot apply to net-next/main horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/dt-bindings-net-dsa-yt921x-Add-Motorcomm-YT921x-switch-support/20250906-021942
base:   net/main
patch link:    https://lore.kernel.org/r/20250905181728.3169479-4-mmyangfl%40gmail.com
patch subject: [PATCH net-next v7 3/3] net: dsa: yt921x: Add support for Motorcomm YT921x
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-r111-20250906 (https://download.01.org/0day-ci/archive/20250906/202509062201.7oDUWUsM-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509062201.7oDUWUsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509062201.7oDUWUsM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/dsa/yt921x.c:1045:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1110:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1161:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1579:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1611:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1636:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1651:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1668:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1686:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1849:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1867:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:1900:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:2148:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:2187:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
   drivers/net/dsa/yt921x.c:2259:2: warning: variable 'ctrl' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/net/dsa/yt921x.c:2269:2: note: uninitialized use occurs here
           ctrl |= YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_MAC_EN;
           ^~~~
   drivers/net/dsa/yt921x.c:2240:10: note: initialize the variable 'ctrl' to silence this warning
           u32 ctrl;
                   ^
                    = 0
   drivers/net/dsa/yt921x.c:2390:3: warning: variable 'ctrl' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
                   default:
                   ^~~~~~~
   drivers/net/dsa/yt921x.c:2395:17: note: uninitialized use occurs here
                                                mask, ctrl);
                                                      ^~~~
   drivers/net/dsa/yt921x.c:2348:10: note: initialize the variable 'ctrl' to silence this warning
           u32 ctrl;
                   ^
                    = 0
   drivers/net/dsa/yt921x.c:2557:17: warning: unused variable 'dev' [-Wunused-variable]
           struct device *dev = to_device(priv);
                          ^
>> drivers/net/dsa/yt921x.c:1712:10: error: call to '__compiletime_assert_1340' declared with 'error' attribute: FIELD_PREP: value too large for the field
                   ctrl = YT921X_PORT_VLAN_CTRL_CVID(pvid);
                          ^
   drivers/net/dsa/yt921x.h:363:43: note: expanded from macro 'YT921X_PORT_VLAN_CTRL_CVID'
   #define   YT921X_PORT_VLAN_CTRL_CVID(x)                 FIELD_PREP(YT921X_PORT_VLAN_CTRL_CVID_M, (x))
                                                           ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                   ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:15:1: note: expanded from here
   __compiletime_assert_1340
   ^
   17 warnings and 1 error generated.


vim +1712 drivers/net/dsa/yt921x.c

aa100a55442187 David Yang 2025-09-06  1696  
aa100a55442187 David Yang 2025-09-06  1697  static int
aa100a55442187 David Yang 2025-09-06  1698  yt921x_vlan_filtering(struct yt921x_priv *priv, int port, bool vlan_filtering)
aa100a55442187 David Yang 2025-09-06  1699  {
aa100a55442187 David Yang 2025-09-06  1700  	struct dsa_switch *ds = &priv->ds;
aa100a55442187 David Yang 2025-09-06  1701  	struct dsa_port *dp = dsa_to_port(ds, port);
aa100a55442187 David Yang 2025-09-06  1702  	u16 pvid;
aa100a55442187 David Yang 2025-09-06  1703  	u32 mask;
aa100a55442187 David Yang 2025-09-06  1704  	u32 ctrl;
aa100a55442187 David Yang 2025-09-06  1705  	int res;
aa100a55442187 David Yang 2025-09-06  1706  
aa100a55442187 David Yang 2025-09-06  1707  	mask = YT921X_PORT_VLAN_CTRL_CVID_M;
aa100a55442187 David Yang 2025-09-06  1708  	if (!vlan_filtering || !dp->bridge) {
aa100a55442187 David Yang 2025-09-06  1709  		ctrl = YT921X_PORT_VLAN_CTRL_CVID(YT921X_VID_UNWARE);
aa100a55442187 David Yang 2025-09-06  1710  	} else {
aa100a55442187 David Yang 2025-09-06  1711  		br_vlan_get_pvid(dp->bridge->dev, &pvid);
aa100a55442187 David Yang 2025-09-06 @1712  		ctrl = YT921X_PORT_VLAN_CTRL_CVID(pvid);
aa100a55442187 David Yang 2025-09-06  1713  	}
aa100a55442187 David Yang 2025-09-06  1714  	res = yt921x_reg_update_bits(priv, YT921X_PORTn_VLAN_CTRL(port),
aa100a55442187 David Yang 2025-09-06  1715  				     mask, ctrl);
aa100a55442187 David Yang 2025-09-06  1716  	if (res)
aa100a55442187 David Yang 2025-09-06  1717  		return res;
aa100a55442187 David Yang 2025-09-06  1718  
aa100a55442187 David Yang 2025-09-06  1719  	mask = YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_TAGGED |
aa100a55442187 David Yang 2025-09-06  1720  	       YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
aa100a55442187 David Yang 2025-09-06  1721  	ctrl = 0;
aa100a55442187 David Yang 2025-09-06  1722  	if (vlan_filtering) {
aa100a55442187 David Yang 2025-09-06  1723  		/* Do not drop tagged frames here; let VLAN_IGR_FILTER do it */
aa100a55442187 David Yang 2025-09-06  1724  		if (!pvid)
aa100a55442187 David Yang 2025-09-06  1725  			ctrl |= YT921X_PORT_VLAN_CTRL1_CVLAN_DROP_UNTAGGED;
aa100a55442187 David Yang 2025-09-06  1726  	}
aa100a55442187 David Yang 2025-09-06  1727  	res = yt921x_reg_update_bits(priv, YT921X_PORTn_VLAN_CTRL1(port),
aa100a55442187 David Yang 2025-09-06  1728  				     mask, ctrl);
aa100a55442187 David Yang 2025-09-06  1729  	if (res)
aa100a55442187 David Yang 2025-09-06  1730  		return res;
aa100a55442187 David Yang 2025-09-06  1731  
aa100a55442187 David Yang 2025-09-06  1732  	res = yt921x_reg_toggle_bits(priv, YT921X_VLAN_IGR_FILTER,
aa100a55442187 David Yang 2025-09-06  1733  				     YT921X_VLAN_IGR_FILTER_PORTn(port),
aa100a55442187 David Yang 2025-09-06  1734  				     vlan_filtering);
aa100a55442187 David Yang 2025-09-06  1735  	if (res)
aa100a55442187 David Yang 2025-09-06  1736  		return res;
aa100a55442187 David Yang 2025-09-06  1737  
aa100a55442187 David Yang 2025-09-06  1738  	/* Turn on / off VLAN awareness */
aa100a55442187 David Yang 2025-09-06  1739  	mask = YT921X_PORT_IGR_TPIDn_CTAG_M;
aa100a55442187 David Yang 2025-09-06  1740  	if (!vlan_filtering)
aa100a55442187 David Yang 2025-09-06  1741  		ctrl = 0;
aa100a55442187 David Yang 2025-09-06  1742  	else
aa100a55442187 David Yang 2025-09-06  1743  		ctrl = YT921X_PORT_IGR_TPIDn_CTAG(0);
aa100a55442187 David Yang 2025-09-06  1744  	res = yt921x_reg_update_bits(priv, YT921X_PORTn_IGR_TPID(port),
aa100a55442187 David Yang 2025-09-06  1745  				     mask, ctrl);
aa100a55442187 David Yang 2025-09-06  1746  	if (res)
aa100a55442187 David Yang 2025-09-06  1747  		return res;
aa100a55442187 David Yang 2025-09-06  1748  
aa100a55442187 David Yang 2025-09-06  1749  	return 0;
aa100a55442187 David Yang 2025-09-06  1750  }
aa100a55442187 David Yang 2025-09-06  1751  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
