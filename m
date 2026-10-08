Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909A4388E62
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478426; cv=none; b=NAB8QRzvXLkvKwndtrwdC5kmbdEqWZXRTHvCtvqWcM8d6PH5As8jJTVM77R4rkK+b3PxDRM2N87uzpy68GFpjGUVwRONaSfA3LXPCWy4IWaNFJiLriFqCXDe5Esk0+D5QaA6zHZ02qZ0/K+nsN5nf+7W4HGXJoQ3hEYJaQ6uEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478426; c=relaxed/simple;
	bh=uH+cUC3S/scNmUgyhsIPIIJ7PCqxQuSNM2Tp+e+G5ms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FbRkCac2hrsBisxNcXbfrmo/nf+W4BYv1AH8AayenOvymeA4HeM/SPACLgFOyzSi6X1pqLLCufhW9Qb+gwrHQGECBnGcOsvIB8fECeHP2NlFWu2iL3fgvNLlE7Y3O5YWiD70+8y0iSqJjd2KYt7w/8yZjbjtPJ68GEjZmoqOQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2T0UOLs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2T0UOLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791478426; x=1823014426;
  h=date:from:to:cc:subject:message-id;
  bh=uH+cUC3S/scNmUgyhsIPIIJ7PCqxQuSNM2Tp+e+G5ms=;
  b=F2T0UOLsjlbd8/gdVFYumh6t7evqlVDRc7VzE1w7Ia+nRTQs2gGrTS9G
   EhgoIxE/2DY0bkp0o3yU88W7unieC9P+OAx0EzT4mt1Leigpuj+AUWixm
   z9eOTKLJWuaqSScibzgmhLzwhy3hgiZ0qbYcCURkBr/Lqgiko67EbESKC
   YsHugLzlLkNAU5din5nr+E+mSFyZ3vBMatpEfAkwE1ZrQzBSXOoETfvRS
   jdTIPuC/vBVEjkcIdjEpAZI+Z1Ha6a1CGDiCWkYwt1P9babnQ9Epn8Rj1
   gwwAswu94o3TtKZ8rOLrxqRX3vGfnSc7mKaMwyjpdVZwxrhV6+JJ5qT7f
   A==;
X-CSE-ConnectionGUID: s/dnUY6vTMeMmmt0U4HMXQ==
X-CSE-MsgGUID: Pho6H0vSTxKiK8wGYJ1QNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="267886"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="267886"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 09:53:46 -0700
X-CSE-ConnectionGUID: G/NylENbSDWxqkKz2xYapg==
X-CSE-MsgGUID: 4ewTZAVHS/ebYAcHzFL9Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="411251"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Oct 2026 09:53:45 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xErNG-000000005l5-2OkS;
	Thu, 08 Oct 2026 16:53:42 +0000
Date: Thu, 08 Oct 2026 18:52:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.4-armsoc/dts64 60/62]
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb:
 /soc/phy@2b030000: failed to match any schema with compatible:
 ['rockchip,rk3576-csi-dphy']
Message-ID: <202610081840.4U0vjKgc-lkp@intel.com>
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
TO: Amin Gattout <amin.gattout@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Michael Riesch <michael.riesch@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.4-armsoc/dts64
head:   f204f28bd1fa9b4cf3e47488ba3ba25251aba18a
commit: eea8ce042825cea71009cffc13bf564afaf7dbe4 [60/62] arm64: dts: rockchip: add radxa camera 4k on rock 4d
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261008/202610081840.4U0vjKgc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081840.4U0vjKgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610081840.4U0vjKgc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27c90000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: csi@27cb0000 (rockchip,rk3576-mipi-csi2): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	'rockchip,rk3576-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'fsl,imx95-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	'rockchip,rk3576-mipi-csi2' is not one of ['rockchip,rk3588-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/csi@27cb0000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b030000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d-radxa-4k-cam.dtb: /soc/phy@2b070000: failed to match any schema with compatible: ['rockchip,rk3576-csi-dphy']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
