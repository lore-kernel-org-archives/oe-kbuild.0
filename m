Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88821C176
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 01:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761355480; cv=none; b=OSb6/legRcf4tmdzMWnt/cZjc08EEcjHX9eT8un8HTgrjwwoz8FN6+6yi8hiauFAmruHH673o7QBEXQc6nnSns6HNyhlypq45l5JRyWlAc1vM4evBOsqMpkHtHdcqfvB8ItqVTzfTnWH2Xk54GeOXZ7rekihRKHxLQ3cFOl1OzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761355480; c=relaxed/simple;
	bh=c7ukets4szDFC2RKIEvGgmFo4vWX7AK/4Rc6k0zSjVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTprCHBZ7NDazRvAvrjVF1ZussL+q/QH6m51GWlVh8h34wSY+DFAzAK3OSyf5UxUVeNPUdf1C++Eh+u398/DEcJva1kT7LzRD3MJwBTvA3GU0uhvlgiMTdBBhrBDEt59Z3Hv/NFtWacdnMcisSj2hBvcsvxmDCQK0veS8rsdKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHQPcSna; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHQPcSna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761355479; x=1792891479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7ukets4szDFC2RKIEvGgmFo4vWX7AK/4Rc6k0zSjVI=;
  b=fHQPcSna0tNZ12V7XZG5GBLyvJF96xbKJg67bDIuuCJ6pKcMW02ob3Pr
   bkaOwwzhBC+Qlm/ifRDjCNwkAHjQQ8mOxImKfrecE+hFcTgwBOZvJ+ofr
   WBJt1on4uL5xdM/hqPv6j5iBsggMy+bivmEe4SPpVh9Vva4ZA82t6Sp6S
   w/BDKOhLozT9WZ2U+PS+OWKLOqSl78mMVXyCIv8ufvRgKH504cLi1mS/T
   2/YrstiHq+gc9U/R9cWOq4L85m0MwA6Uw7DevkZEB5A7RglLw72IgCYuW
   Fg4Lul4oUtP46x7mB964R/0vFPFLpA+C49PaPsrsxRgg8bERR1pt8N9pt
   A==;
X-CSE-ConnectionGUID: HvW+ID6CTf66fEc8U9Ig1A==
X-CSE-MsgGUID: JCcByQo9SPK7jVDUQ/nisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67180994"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="67180994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:24:38 -0700
X-CSE-ConnectionGUID: XsKfQmZAR+mg+xYYxxuDPw==
X-CSE-MsgGUID: YZ5EEo+zS9W/rGqZQDSOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="215215860"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 18:24:37 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCT1G-000F2P-2P;
	Sat, 25 Oct 2025 01:24:34 +0000
Date: Sat, 25 Oct 2025 09:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 1/3] net: dsa: yt921x: Add STP/MST support
Message-ID: <202510250954.SHhCZUaW-lkp@intel.com>
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
In-Reply-To: <20251024033237.1336249-2-mmyangfl@gmail.com>
References: <20251024033237.1336249-2-mmyangfl@gmail.com>
TO: David Yang <mmyangfl@gmail.com>
TO: netdev@vger.kernel.org
CC: David Yang <mmyangfl@gmail.com>
CC: Andrew Lunn <andrew@lunn.ch>
CC: Vladimir Oltean <olteanv@gmail.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-yt921x-Add-STP-MST-support/20251024-113613
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251024033237.1336249-2-mmyangfl%40gmail.com
patch subject: [PATCH net-next 1/3] net: dsa: yt921x: Add STP/MST support
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510250954.SHhCZUaW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250954.SHhCZUaW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510250954.SHhCZUaW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/dsa/yt921x.c:2154:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2154 |         mask64 = YT921X_VLAN_CTRL_STP_ID_M;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:48:20: note: expanded from macro 'GENMASK_TYPE'
      48 |              (type_max(t) << (l) &                              \
         |                           ^  ~~~
>> drivers/net/dsa/yt921x.c:2154:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2154 |         mask64 = YT921X_VLAN_CTRL_STP_ID_M;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: note: expanded from macro 'GENMASK_TYPE'
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.c:2155:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2155 |         ctrl64 = YT921X_VLAN_CTRL_STP_ID(msti->msti);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:342:51: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID'
     342 | #define   YT921X_VLAN_CTRL_STP_ID(x)                    FIELD_PREP(YT921X_VLAN_CTRL_STP_ID_M, (x))
         |                                                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/dsa/yt921x.c:2155:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2155 |         ctrl64 = YT921X_VLAN_CTRL_STP_ID(msti->msti);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:342:51: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID'
     342 | #define   YT921X_VLAN_CTRL_STP_ID(x)                    FIELD_PREP(YT921X_VLAN_CTRL_STP_ID_M, (x))
         |                                                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/dsa/yt921x.c:2155:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2155 |         ctrl64 = YT921X_VLAN_CTRL_STP_ID(msti->msti);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:342:51: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID'
     342 | #define   YT921X_VLAN_CTRL_STP_ID(x)                    FIELD_PREP(YT921X_VLAN_CTRL_STP_ID_M, (x))
         |                                                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/dsa/yt921x.c:2155:11: warning: shift count >= width of type [-Wshift-count-overflow]
    2155 |         ctrl64 = YT921X_VLAN_CTRL_STP_ID(msti->msti);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:342:51: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID'
     342 | #define   YT921X_VLAN_CTRL_STP_ID(x)                    FIELD_PREP(YT921X_VLAN_CTRL_STP_ID_M, (x))
         |                                                         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/yt921x.h:341:37: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID_M'
     341 | #define  YT921X_VLAN_CTRL_STP_ID_M              GENMASK(39, 36)
         |                                                 ^
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:597:22: note: expanded from macro 'compiletime_assert'
     597 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:585:23: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:577:9: note: expanded from macro '__compiletime_assert'
     577 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/net/dsa/yt921x.c:2155:11: error: call to '__compiletime_assert_989' declared with 'error' attribute: FIELD_PREP: mask is zero
   drivers/net/dsa/yt921x.h:342:40: note: expanded from macro 'YT921X_VLAN_CTRL_STP_ID'
     342 | #define   YT921X_VLAN_CTRL_STP_ID(x)                    FIELD_PREP(YT921X_VLAN_CTRL_STP_ID_M, (x))
         |                                                         ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:67:3: note: expanded from macro '__BF_FIELD_CHECK'
      67 |                 BUILD_BUG_ON_MSG((_mask) == 0, _pfx "mask is zero");    \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:47:1: note: expanded from here
      47 | __compiletime_assert_989
         | ^
   6 warnings and 1 error generated.


vim +2155 drivers/net/dsa/yt921x.c

5c1f0fbc2c12ae David Yang 2025-10-24  2139  
5c1f0fbc2c12ae David Yang 2025-10-24  2140  static int
5c1f0fbc2c12ae David Yang 2025-10-24  2141  yt921x_dsa_vlan_msti_set(struct dsa_switch *ds, struct dsa_bridge bridge,
5c1f0fbc2c12ae David Yang 2025-10-24  2142  			 const struct switchdev_vlan_msti *msti)
5c1f0fbc2c12ae David Yang 2025-10-24  2143  {
5c1f0fbc2c12ae David Yang 2025-10-24  2144  	struct yt921x_priv *priv = to_yt921x_priv(ds);
5c1f0fbc2c12ae David Yang 2025-10-24  2145  	u64 mask64;
5c1f0fbc2c12ae David Yang 2025-10-24  2146  	u64 ctrl64;
5c1f0fbc2c12ae David Yang 2025-10-24  2147  	int res;
5c1f0fbc2c12ae David Yang 2025-10-24  2148  
5c1f0fbc2c12ae David Yang 2025-10-24  2149  	if (!msti->vid)
5c1f0fbc2c12ae David Yang 2025-10-24  2150  		return -EINVAL;
5c1f0fbc2c12ae David Yang 2025-10-24  2151  	if (msti->msti <= 0 || msti->msti >= YT921X_MSTI_NUM)
5c1f0fbc2c12ae David Yang 2025-10-24  2152  		return -EINVAL;
5c1f0fbc2c12ae David Yang 2025-10-24  2153  
5c1f0fbc2c12ae David Yang 2025-10-24 @2154  	mask64 = YT921X_VLAN_CTRL_STP_ID_M;
5c1f0fbc2c12ae David Yang 2025-10-24 @2155  	ctrl64 = YT921X_VLAN_CTRL_STP_ID(msti->msti);
5c1f0fbc2c12ae David Yang 2025-10-24  2156  
5c1f0fbc2c12ae David Yang 2025-10-24  2157  	mutex_lock(&priv->reg_lock);
5c1f0fbc2c12ae David Yang 2025-10-24  2158  	res = yt921x_reg64_update_bits(priv, YT921X_VLANn_CTRL(msti->vid),
5c1f0fbc2c12ae David Yang 2025-10-24  2159  				       mask64, ctrl64);
5c1f0fbc2c12ae David Yang 2025-10-24  2160  	mutex_unlock(&priv->reg_lock);
5c1f0fbc2c12ae David Yang 2025-10-24  2161  
5c1f0fbc2c12ae David Yang 2025-10-24  2162  	return res;
5c1f0fbc2c12ae David Yang 2025-10-24  2163  }
5c1f0fbc2c12ae David Yang 2025-10-24  2164  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
