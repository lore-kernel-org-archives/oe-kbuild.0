Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48C7210EC
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jul 2024 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209748; cv=none; b=PJvbzv8k9vbjrz9PKKX2e7SMdW+s16D/3V2x9P5wlUTrVhXLyTnFOhlej7uY+3dPnj+2/aGxGnGmlqLdytG0NODip6Iy8AqErS9Pm6pBZdONZdf/5+s4B7+IZEuCrMmSYWBmKKTZC4AqhksiZXE+/HeHieTw4xyhJbqqVm63gVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209748; c=relaxed/simple;
	bh=0HCax6lnXkLwXyD3RvirLPaSGCbJkcAFuY1Qu0sKqNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUwumbgBjyX0od63UYqC7I+iWw2TejpcQ4uXQXvDezTWCt1nFMUeeWgW7PNXG6QtIEbLlhxzjs1MAkNgQWaz1jM83A5S/FaIoy7rR6bxn+JUAoNtWxPMHoyILQiHZs9zMJQlH98Gv/kZg+4TI/FS6/SEStJQ9iOMbsg8w4A9t00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBqbsGPX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBqbsGPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721209746; x=1752745746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0HCax6lnXkLwXyD3RvirLPaSGCbJkcAFuY1Qu0sKqNY=;
  b=IBqbsGPXmQ9Thl8SHEHKMjn5eE18wvQGvgkBJc1Wu4Uw3JDfd6mdlpB8
   sUPdSH6ckq/1NN4hzQ9KNnU7wggxbt8Q/KjTdvZomhOcALelZXi3f9Zd6
   5NPdRfeoAipogNrQIQprL2zQQ8eTEPdRzXEDEB+A8eo4Jp56kDSouHZvi
   KxOV8TkH6R6TG+/Pi8aidYXkF5uODwWpHsgbSI+WarAEkoe2LhmV6CN2q
   /TXsN1bQp6ermyO0DmZryqNSsTXqrfCTNO2wRe7MTlB1I76ngLXBGzHDh
   YdbyyIvJiWx70aEmkZA3j0jcivP5UTwTK82X1N+sMbPMNhuBID6rgNbu0
   w==;
X-CSE-ConnectionGUID: baCJdW5GSha421Ac+YyVWg==
X-CSE-MsgGUID: dchFbBp5RkuQ9bMp4vmNBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18839153"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18839153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 02:49:05 -0700
X-CSE-ConnectionGUID: QVKdMFR0S72EWViLSnDT/Q==
X-CSE-MsgGUID: d3q/CcO+TRu6vcWDmLWOew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50275080"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 02:49:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU1HR-000gDi-2N;
	Wed, 17 Jul 2024 09:49:01 +0000
Date: Wed, 17 Jul 2024 17:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 42/74]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /rk3568-gpiomem: failed
 to match any schema with compatible: ['rockchip,rk3568-gpiomem']
Message-ID: <202407171745.EmJimf66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve Jeong <how2soft@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: 905d94c26ec85e35bcc9d727a5c49130603afbb9 [42/74] ODROID-M1: Add /dev/gpiomem device
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407171745.EmJimf66-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407171745.EmJimf66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407171745.EmJimf66-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-combphy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: phy@fe820000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-combphy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /rk3568-gpiomem: failed to match any schema with compatible: ['rockchip,rk3568-gpiomem']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
