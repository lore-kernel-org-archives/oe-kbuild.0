Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017F9463
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858291; cv=none; b=nwYba/NVKBY6wLvTI4K2NFoW23JPW17BOlE7DWVwp8QIHzdU7NLPw8Dh2pSfwApv1qn1+1FOPDGViRH8XBGzmWKWMjHPmP3bGJ+iZDOpZrmx3e05L5pWYNZRew2mVlyVBU8edLauMqbLd0Q9TQbA+RNr0OTU2iPPeqNCxRWVmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858291; c=relaxed/simple;
	bh=2HZHjGUhR4Hmy1Lj56zLXMzJ5nkAjcRuGFapZbSJs7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g79JaywcJxrBhEZCq0LQD6Ih2joEC9tFyVQLeNBuQ/kot30Mjfzg8snaoVUhAAA/WUcYPto6crmFhNHx6ahBurLrIwgFt2wN/6tAKlXfa+e0B6o2gNXsEp7fyiWopJ+4IJTm1UI2FZRuxaQ0jgxJQJOQxtbcgFgQo7U66kQ12JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn5zm2ar; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn5zm2ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777858288; x=1809394288;
  h=date:from:to:cc:subject:message-id;
  bh=2HZHjGUhR4Hmy1Lj56zLXMzJ5nkAjcRuGFapZbSJs7c=;
  b=Cn5zm2arMGWsnKW3tHYa2WkeSe/HUkirnLjdPVxNlaliS+xTvIfMT7Y/
   HjhBQe//EdiCKTki7BZ4sViEqZDOPxJsx9Vpl+5VCqIo828p84slm7QnX
   y2cRPCVwqD3jMk1b/67ZkBaw2wFhpJXVRNyCgv4Zq5Zns54D+mfxWUPMl
   cckMV8sFJ2iLNNlbqs510hgs3G9Ld8C4/cXPriWIU8lH27Tp5z8RF+mkf
   Tld7Rt4mLZRSa8G44nihRn1mwirCVLPRi0yQMnrNHJ9vEWUx9/gPGgDla
   E+KnjMQ7ynOew/hitffVZ3+6XqQHnk3Q87e8tp53ZLLVrAS1BOeiSFcz3
   Q==;
X-CSE-ConnectionGUID: pcd2YNx7T8GRYL322oQqRQ==
X-CSE-MsgGUID: Js1kYU8FTjKo5J/MpgA1vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="66248371"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="66248371"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 18:31:28 -0700
X-CSE-ConnectionGUID: 22sESRu6QtO1wfmcx2gZTg==
X-CSE-MsgGUID: DTi6SAtSR7OyWlGi4euNaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="239702889"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 18:31:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJi9c-000000005g5-2h0w;
	Mon, 04 May 2026 01:31:24 +0000
Date: Mon, 04 May 2026 03:30:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb:
 dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
Message-ID: <202605040358.QBfKZJPo-lkp@intel.com>
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
TO: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/drm-bridge-synopsys-dw-dp-Support-unregistering-the-AUX-channel/20260503-071157
head:   457d316fbeadd8609202b7d0c148f6db0513f81b
commit: 3085b17df3699d4739beb8c9d360431e3198a886 dt-bindings: display: rockchip: dw-dp: fix sound DAI cells
date:   26 hours ago
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260504/202605040358.QBfKZJPo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040358.QBfKZJPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040358.QBfKZJPo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1136.7-1143.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1151.7-1158.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: dp@fde50000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: dp@fde60000 (rockchip,rk3588-dp): #sound-dai-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
