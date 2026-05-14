Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF67083C
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 22:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798525; cv=none; b=Hx+lQFJwgODPGauMRuSy5CT8x+b72izSRzy3O7jXcqpaVZFGIQHQVSfha8vXuMEOJ8YPUW0uEZ3FSeg2+chd+F6nx6A2n/VAVZUkxzNYJlyuNxaRMHJxuNOBN2P0aOncO8wihKnJ6s3aLScKn1iYirgGL+QlXZr2I7k+CXYXE/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798525; c=relaxed/simple;
	bh=yOAtzBrWXBJ6FtUpI0k7T0b79DlP0u262fLqv/NrJJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rmz1VIjy6ZHkHR6aYZR5wo2cPqyC2a01bn1KVQEJgOOb+20Yg+dpXgS2SKRuQpNFGr/J3RvC/tOxrIV67CAnoriyc9pIgid7aTCR8LgoNo80E0I8VyNzarr1eOC7gJUQDKvIhRF5HJ4uKZuyXLbE80St1VkPV2JC4zyzm76N82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pe0wlLes; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pe0wlLes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778798524; x=1810334524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOAtzBrWXBJ6FtUpI0k7T0b79DlP0u262fLqv/NrJJ4=;
  b=Pe0wlLesd7Og4QgA7iZCeY5WL6OTidcMl5D/P74dGsVyegeQzf9qql6k
   J+g9tMzbPLilrF63hwfN41pDr3s87kpFQdrEwV3X6Jzm8WSW9qMBdc7IX
   s7weCICh+yUsdY2v1n2UMt5z0mfUJB41ChLMPxSdKPia9EYq61c5DV3Lf
   uQ3eRiKVvCUY7tFA4es1B4GJLfOsfQcbIjGuPp0UFKqUm5EgDz5i2C56v
   wTyjDSyR0bK3o1z1IbuoQqvXzaS4F0O72Lpr556TpJUryXXYIsw5iMhMl
   2yiobjFLkct6Ekh11VXD2XQkFRMpoaTRrhSW+zpJ5mX5jr1MK2AN4qygx
   A==;
X-CSE-ConnectionGUID: UKZZDPaRS5iSRXZvhs1Hjg==
X-CSE-MsgGUID: xbrzeE4jSQSXGnMkIQRFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83604720"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83604720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 15:42:03 -0700
X-CSE-ConnectionGUID: 9vXLS5kBRv6/G4I+xCkTdw==
X-CSE-MsgGUID: GH0AwU1YRnuyS4AsOlHhmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235473339"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 15:42:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNeki-000000008tB-1LBx;
	Thu, 14 May 2026 22:42:00 +0000
Date: Fri, 15 May 2026 00:41:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: rk3588s-roc-pc set hym8563 rtc
 as wakeup source
Message-ID: <202605150041.e2mK4fOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260505151015.179413-3-eva@evaemmerich.com>
References: <20260505151015.179413-3-eva@evaemmerich.com>
TO: Eva Emmerich <eva@evaemmerich.com>
TO: linux-kernel@vger.kernel.org
TO: linux-rockchip@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: Eva Emmerich <eva@evaemmerich.com>

Hi Eva,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eva-Emmerich/arm64-dts-rockchip-rk3588s-roc-pc-set-hym8563-rtc-as-wakeup-source/20260514-035430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20260505151015.179413-3-eva%40evaemmerich.com
patch subject: [PATCH 2/2] arm64: dts: rockchip: rk3588s-roc-pc set hym8563 rtc as wakeup source
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-2053-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150041.e2mK4fOT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150041.e2mK4fOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150041.e2mK4fOT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: csi@fdd30000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /csi@fdd30000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible:0: 'rockchip,rk3588-mipi-csi2' is not one of ['fsl,imx93-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: csi@fdd50000 (rockchip,rk3588-mipi-csi2): compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2'] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip,rk3568-mipi-csi2.yaml
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: /csi@fdd50000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-csi2', 'rockchip,rk3568-mipi-csi2']
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: fusb302@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: fusb302@22 (fcs,fusb302): connector:altmodes: '#address-cells', '#size-cells', 'altmode@0' do not match any of the regexes: '^(displayport)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: connector (usb-c-connector): altmodes: '#address-cells', '#size-cells', 'altmode@0' do not match any of the regexes: '^(displayport)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/connector/usb-connector.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: phy@fed80000 (rockchip,rk3588-usbdp-phy): 'svid' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
