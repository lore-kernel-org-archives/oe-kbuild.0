Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0D2E1C7C
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 01:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355874; cv=none; b=IMmsXzBXytBZFWaA05F3lszzfWTno2MkzAFanTfTn2kUi4r4wiv8cSfnAP6UZo3gNEyH0hPo1M6BtEXiDWlUeUpemXTLRQDRX/rRfC88on0JafO6AjK/BJLxUZKHeVzwey8RtuJCV+r+NwtAX/SddJBiZIiClphx8w396YIlNx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355874; c=relaxed/simple;
	bh=JJSfAIK7ayiM56cwDaGP0ucpHPy0VqlyCYu8d+JNTBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rh+XgNvdXf7+Z0btTBLtQitHe+Vccep2QNBiW/46pMJyn9JlfFKyKTZY5QvoaRontzN1k8RG7EJJIChBPO6Z+8JYuynBcHzZGtoUC5Pxd4XfsgRueWr9J5m5YNdR9LgFBH7DNo+OiydyPiGwcIh5GMVCxkseMOTM80Xcsd2woBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0mLbJCm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0mLbJCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768355873; x=1799891873;
  h=date:from:to:cc:subject:message-id;
  bh=JJSfAIK7ayiM56cwDaGP0ucpHPy0VqlyCYu8d+JNTBg=;
  b=j0mLbJCmiuv2X/tRKo7S73IRwFugj00fL+tnELqoAktZc0KDm6yAum2B
   Nm8UPsb0WDCCaOjcnYbeSIw5vzipWlE/Gspjxi3/f6D/GQIYbUWL9S1zT
   QRVv/EgUnKNaG45ZuR3F+mpYmk04qyeyBncPtBcQxPrCCyXMeaSQG7JN2
   jnjXXVph+1TTeZs5mwWHZ5dgLxi/rR+5M1kCDmMCIFzbAdKkxx1t3dOd0
   56LJ+cZbuT/gi6GFaN0VyhEd4No5Bm6SOiyKSwPgdE0KGoRY3QeYZJz0B
   9HfBU2UjNzH9PLNQqBwaaf0NH5RqOUDXZP/QIcKdv+vtqgZnbyZZt6ZDd
   w==;
X-CSE-ConnectionGUID: upiF3OPvRk+TpNFaYZcKVw==
X-CSE-MsgGUID: V3MkQEATToWUg9CiN8UMhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69736492"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69736492"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 17:57:52 -0800
X-CSE-ConnectionGUID: ZEws4lIbQTOlh4dPHXjJIg==
X-CSE-MsgGUID: nC6J7c9tSRyvMHJDV3XjLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204434364"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 17:57:51 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfq8r-000000001HB-2V4N;
	Wed, 14 Jan 2026 01:57:49 +0000
Date: Wed, 14 Jan 2026 02:56:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.20-armsoc/dts64 35/49]
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: hdmi@fde80000
 (rockchip,rk3588-dw-hdmi-qp): Unevaluated properties are not allowed
 ('no-hpd' was unexpected)
Message-ID: <202601140225.HjQkqYAK-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Chris Morgan <macromorgan@hotmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.20-armsoc/dts64
head:   d813ddc0b348febf32fc9d7737ba82d2955051ac
commit: 97a9b5edcdd4179063773f17a00904a464b8aa7c [35/49] arm64: dts: rockchip: Add HDMI to Gameforce Ace
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2053-20260112 (https://download.01.org/0day-ci/archive/20260114/202601140225.HjQkqYAK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140225.HjQkqYAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140225.HjQkqYAK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts:1462.7-1469.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: hdmi@fde80000 (rockchip,rk3588-dw-hdmi-qp): Unevaluated properties are not allowed ('no-hpd' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
