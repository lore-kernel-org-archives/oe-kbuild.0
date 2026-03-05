Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8A3EBF09
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739370; cv=none; b=UW7pdZ53YEKxxkkrqECBEXiM18De19vSSoKkDGuRPhiNVo0XNINx/t644ZhcZ9W4wlvJxrUuIHSMXFjptsgfBowWdkDhpfjc99t7vYB4FQcq9PwiHRWWGwv/F80xKpjzbgkZwNRYcZbEFX2oaOaYLW05gCy9FS8YvvoufNnXIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739370; c=relaxed/simple;
	bh=UT3BDeR5+QyweDcpA4FvoIWZpvFs9vOpNpVlViex+G0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f8sAcZvxhz8KdUJ46v2gzJvUXEK30yxcB0CsEa/sRDtW0pXBUfQi1NyxmfUdECeeEarDcS/WQFOjAhAPnTOO3gJR3mojbodao0L6BE9mACi28aGyfr7TFGSqv5I+PljicbTo2N9ciHTk69Oj/fE5aL6QWidrDzS9Pf4QpWGjAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/hinkhF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/hinkhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772739359; x=1804275359;
  h=date:from:to:cc:subject:message-id;
  bh=UT3BDeR5+QyweDcpA4FvoIWZpvFs9vOpNpVlViex+G0=;
  b=m/hinkhFwmD6a8IEKYQFhJ7SIosQGB0q5XNC+iiLYGhtb3QmCEPbbMnt
   1DRr8P2w4ykl9rnacDsfsKgL+sWXr9dxJV9O/0iWFVPT/ryBuPYcBcWix
   ldBf3uTdFcu4aQsvfXb3SOnaGSFOkDocswpodj2r2hn6qqoffKeHyjqNN
   m2Xd5MoV4pfJKgf6P5IoiQ3FnygSXb3ivLxG5k4rbeEbbMtn56iEoTN5B
   PbPlzc9nJlvJxS+KP+573D6oUnhzRWv2SywsIUIpZ5ME2vXUXPPdyGQp5
   bHzWvfLTUnAnFMsCORXLk8BpLms1+I9ZMs+MA+fUN1gIT6o6O2txc1Oxw
   A==;
X-CSE-ConnectionGUID: /onwYi18RA2gnF44mztJNg==
X-CSE-MsgGUID: BR/AVvC6TPqr5coN3FmOkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76440503"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="76440503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 11:35:58 -0800
X-CSE-ConnectionGUID: ShHNnNkTQI+RqwKewX7k1w==
X-CSE-MsgGUID: VLjSt6qmStOtJj0MZRLCBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="241795797"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2026 11:35:57 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyEUE-0000000019W-1M2y;
	Thu, 05 Mar 2026 19:35:54 +0000
Date: Fri, 06 Mar 2026 03:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/yt921x.c:1601:9: error: call to
 '__compiletime_assert_1192' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <202603060331.tsFdvPCv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Yang <mmyangfl@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c107785c7e8dbabd1c18301a1c362544b5786282
commit: 186623f4aa724c46cbb4dbd5235cf6942215f5b5 net: dsa: yt921x: Add support for Motorcomm YT921x
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603060331.tsFdvPCv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060331.tsFdvPCv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603060331.tsFdvPCv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/yt921x.c:1601:9: error: call to '__compiletime_assert_1192' declared with 'error' attribute: FIELD_PREP: value too large for the field
    1601 |         ctrl = YT921X_PORT_VLAN_CTRL_CVID(vid);
         |                ^
   drivers/net/dsa/yt921x.h:363:43: note: expanded from macro 'YT921X_PORT_VLAN_CTRL_CVID'
     363 | #define   YT921X_PORT_VLAN_CTRL_CVID(x)                 FIELD_PREP(YT921X_PORT_VLAN_CTRL_CVID_M, (x))
         |                                                         ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:585:2: note: expanded from macro '_compiletime_assert'
     585 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:578:4: note: expanded from macro '__compiletime_assert'
     578 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:46:1: note: expanded from here
      46 | __compiletime_assert_1192
         | ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +1601 drivers/net/dsa/yt921x.c

186623f4aa724c4 David Yang 2025-10-17  1593  
186623f4aa724c4 David Yang 2025-10-17  1594  static int
186623f4aa724c4 David Yang 2025-10-17  1595  yt921x_port_set_pvid(struct yt921x_priv *priv, int port, u16 vid)
186623f4aa724c4 David Yang 2025-10-17  1596  {
186623f4aa724c4 David Yang 2025-10-17  1597  	u32 mask;
186623f4aa724c4 David Yang 2025-10-17  1598  	u32 ctrl;
186623f4aa724c4 David Yang 2025-10-17  1599  
186623f4aa724c4 David Yang 2025-10-17  1600  	mask = YT921X_PORT_VLAN_CTRL_CVID_M;
186623f4aa724c4 David Yang 2025-10-17 @1601  	ctrl = YT921X_PORT_VLAN_CTRL_CVID(vid);
186623f4aa724c4 David Yang 2025-10-17  1602  	return yt921x_reg_update_bits(priv, YT921X_PORTn_VLAN_CTRL(port),
186623f4aa724c4 David Yang 2025-10-17  1603  				      mask, ctrl);
186623f4aa724c4 David Yang 2025-10-17  1604  }
186623f4aa724c4 David Yang 2025-10-17  1605  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
