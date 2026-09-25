Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816E3B27F3
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 22:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375867; cv=none; b=lI5xnOThrUVLp2p2ZxBzM4pbfnDK0wZ+VP+VDhVj9zUxQmUBxP8A25uEPN/EEoVaG263jmA61+AM8WXkZO2Dq7+S+BWkkegQRW+OHnoYAuepuK0JDoQsDQ8PaOHdU4HWoM2enhzSsXt8z6SCiQFXp5OoWXDjSbLu9otbParncDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375867; c=relaxed/simple;
	bh=qMMvTVw6518vkjzrYFbrmZmmsX2AsczmY1rTLb9Ensc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RzJk7mNzW93FOfFDIiHndOrXYNvgFA9/yhxuzfL+V5vX+svLOdOGLR0C3F+uw59pZoxWOvVDZfWw7gyJQoDkSsfZLOUhMEvZ6uJYWxnfmJh6WVtcK7FJ4JffjEJjNMZb4EjsVrSj1SAlaL1iODtb6wm3eEa8bfLmnBZqG8Fqi+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+nlcfPe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+nlcfPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790375865; x=1821911865;
  h=date:from:to:cc:subject:message-id;
  bh=qMMvTVw6518vkjzrYFbrmZmmsX2AsczmY1rTLb9Ensc=;
  b=R+nlcfPeR+U07IFwSf0L1bsOMXyG+dQ9yHbQZsPTkUfHqTp26XboEIoO
   gxyNtcVrzMdxL4xP1mH1rs23oeQsHqzzl85anTb0VJ2YZiFArmeream/2
   3yus1loyGG3XuPkQF5neYFWHKoa9wIddIv5C8xITDTmGmYe0I1GizGD2O
   LONhSuosjj2OmTNR+V/6NwipapTBc+rGNPYU0qYnzaAJRWmpkOQm7AthG
   8HTX+8xGtIMWc041OSFK4kZlrtUFL6cBD89Ir1yIitIO+fr341w3OfiBW
   mOyPJ1qLfSdtthHkcKoLqEXiMHh/VnB//1bEkyQefD7/y/fQLPVIl3CLK
   A==;
X-CSE-ConnectionGUID: G4mHaZ+oRu+ga0wjz36wyw==
X-CSE-MsgGUID: lp9gQ7VpQjKmbV+Xff4MtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93887115"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="93887115"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 15:37:45 -0700
X-CSE-ConnectionGUID: 4sBnMzQbRguNk2anpwwGXQ==
X-CSE-MsgGUID: 6yASvCT9Qhq4LiTeaxaDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273970356"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Sep 2026 15:37:44 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAEY1-0000000003K-46t1;
	Fri, 25 Sep 2026 22:37:41 +0000
Date: Sat, 26 Sep 2026 00:37:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb:
 aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed
 ('no-map', 'reg' were unexpected)
Message-ID: <202609260039.VPBsMks0-lkp@intel.com>
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
TO: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anand-Tiwari/arm64-dts-qcom-hamoa-iot-evk-Add-eDP-display-overlay/20260922-161251
head:   c796c4bdcf6845fbc36de7257b4fb12aad91138f
commit: c796c4bdcf6845fbc36de7257b4fb12aad91138f arm64: dts: qcom: purwa-iot-evk: Add eDP display overlay
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2401-20260924 (https://download.01.org/0day-ci/archive/20260926/202609260039.VPBsMks0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260039.VPBsMks0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609260039.VPBsMks0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: aop-cmd-db@81c60000 (qcom,cmd-db): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/qcom,cmd-db.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 284], [2, 0], [53, 286], [53, 287], [53, 301]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 288], [25, 7], [53, 290], [53, 291], [53, 317]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'p2rr2p_pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clocks: [[53, 292], [25, 8], [53, 294], [53, 295], [53, 333]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
