Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01773AA50B
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481497; cv=none; b=mSvN62adB4iOxNGzmGZGxq8+9yxu9kGtdIU7zl8NzANonnfr3C8hnoHydBSCSSl45B0Y0w6k24KEfUogEdVq/WkLjwSUyJYApo2J78oLc3r0PO/mdO02sCpfa11NyW0W3pK+YWd74fwjKci1T+GJInJrXoBalWBevC3MYVrohbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481497; c=relaxed/simple;
	bh=efn9a7D5GGa10E+dzdkCGxlBxwdsTSuKSBOJH65Gbk0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GVwRWMZt9AVNktUzi8jMrsJ8ejQrqdT08U+S+Khc7eSP6/gIwy+yI47zmCCIEDIpJJ8NYgYDDwQHo4zVS36Nzfh6W60/v3tZlswjv/vrFZ0TyUpRG6PWN7v22JaHUOC8tj8j+gid6IJEBfdpvVU/ZY1UPz0gAu/UkFqpXxq7Xz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcafxo5k; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcafxo5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481495; x=1823017495;
  h=date:from:to:cc:subject:message-id;
  bh=efn9a7D5GGa10E+dzdkCGxlBxwdsTSuKSBOJH65Gbk0=;
  b=kcafxo5kphbaN0djXF9klXmJ2ZRGH7QN80m79pkvQ2s20Ri87zuvnlDQ
   fm6xnFLcrpiB7Z5AWeHUCXi7dYBgEHLl3dxc6D3skrJhFzxvYQ3ScHUjV
   D9T9A9ao8H+RksCzFSgHK/DohvUVjUx0dFBqwURcXL8j9s+aBi0b7AyDy
   mKFVZfQOE/GeOylMG6jUVbbL0AJNTxAJQUzd2bJCi2u/PfHXhLWOy0gOc
   c9u1ji7Bx7w8UicChMjDo2chnSzxVvv1HGE2FKT5/IxiRiXDMFr0cBV1t
   vdxwWszmOqY9ELleyAzDKfkkTxG3pTvNvFnsnZ1SpyyKc1/BKUOlyMbz/
   w==;
X-CSE-ConnectionGUID: w3DaX82sT0eB1JeokwWvNw==
X-CSE-MsgGUID: OPoovkybSEe6OVnja/suzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="174114"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="174114"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:44:54 -0700
X-CSE-ConnectionGUID: sV9mcgKHQPiRROdiHgY2AQ==
X-CSE-MsgGUID: mvdpdY9gTtWSB/K+9m+2Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="47034"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2026 10:44:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEsAl-000000005ox-1DqC;
	Thu, 08 Oct 2026 17:44:51 +0000
Date: Thu, 08 Oct 2026 19:44:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb:
 audio-codec@11 (everest,es8323): compatible: ['everest,es8323',
 'everest,es8388'] is too long
Message-ID: <202610081942.Z3DMORtL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: BG9OXA <bg9oxa@163.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/BG9OXA/arm64-dts-rockchip-add-ALIENTEK-QuarkPi-CA2/20260927-215132
head:   3d704abed3e248083efe27e11af33a3fc31f6d2f
commit: 3d704abed3e248083efe27e11af33a3fc31f6d2f arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
date:   11 days ago
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261008/202610081942.Z3DMORtL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081942.Z3DMORtL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610081942.Z3DMORtL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): compatible: ['everest,es8323', 'everest,es8388'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dtb: audio-codec@11 (everest,es8323): Unevaluated properties are not allowed ('AVDD-supply', 'DVDD-supply', 'HPVDD-supply', 'PVDD-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
