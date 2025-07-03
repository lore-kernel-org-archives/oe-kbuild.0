Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF02550A3
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Jul 2025 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751565230; cv=none; b=pVdDbUUHSgUeU/ZGzpZ4cKGcNBszvMfjAGFtRKDCIaBJvO0XqZEPt/BvGdya520l2Ky7pCSOBA1z5QWSTgZSCxUiprmc3tEjWXOeQPAd1BRWq7w5Yq4E32eoPYXNwLvawcOL4r4xpQbbMIVrlAhjxOP59lfLiKHGaNVDiALObVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751565230; c=relaxed/simple;
	bh=gHpCdKixTfSCtRikGXKKSobvI1mGdnFCHleOjnN16Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6LAjbfph6ngd021Zcg6RZyRS6Og2yKaZen0WUe130Oz7GXpMej0O3drriiOBBpj7T/8gF20umZHVRz0TgJtj+n7Z1wQN+Lr3vmC1yVXxqOYRON1KychmWkD9DvLDmft6BnhxarZ2EKu1mS+XwoxxG9K7aD/UF+40OvpkRrs39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guci1VCN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guci1VCN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751565228; x=1783101228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gHpCdKixTfSCtRikGXKKSobvI1mGdnFCHleOjnN16Uw=;
  b=guci1VCN37cl5JlYAFXbYa2tFHII+V6o9LmYzlBqiyiVPMT9UsJTMLwh
   3O/9HV1d4a55RnifqrNt4WgY/uH7KGPKap2Fmub0gW9XWEGOdWO0R5HNU
   sLrIo83dLhrgRjZM+dqCs1x3YGFrhuiT9nCQnKilxA24ILoqB6eWCm4sG
   lDtodua+qUaal58DpFEwSaCAHtBzN3OkGMaz7djCJnxdPyqWVb1iKdPl4
   4RC/eKp+x/HBdghN6TMr/Anzw9yttRJaL2D5oykdUWoLkRDx3OQ3FJwTN
   SgNjSj8dcTGHL94259I7KWl0e2jhPUbOorbvRX303SeawNoVqVhCzp4cs
   w==;
X-CSE-ConnectionGUID: mgG6TR+uTMmH6LW9NO1wwA==
X-CSE-MsgGUID: DQ+SzsRgQvCtKowJuQmSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53873971"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53873971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 10:53:46 -0700
X-CSE-ConnectionGUID: 8dzrxsoTQ/+cgyo1Din70g==
X-CSE-MsgGUID: KRu47acvTXqXTsBTY79nGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="158986308"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 10:53:46 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXO7z-0000VP-23;
	Thu, 03 Jul 2025 17:53:43 +0000
Date: Thu, 3 Jul 2025 19:52:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt 23/34]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200
 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507031918.JfgnGCmz-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt
head:   41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f
commit: f46bcf3a9ae8f1c1cc865d1302c46dfceb7a2b59 [23/34] arm64: dts: renesas: r9a09g056: Add USB2.0 support
:::::: branch date: 7 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250701 (https://download.01.org/0day-ci/archive/20250703/202507031918.JfgnGCmz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507031918.JfgnGCmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507031918.JfgnGCmz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a09g047']
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,usb2-phy-r9a09g056', 'renesas,usb2-phy-r9a09g057'] is too long
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r8a77470', 'renesas,usb2-phy-r9a08g045', 'renesas,usb2-phy-r9a09g057']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r7s9210', 'renesas,usb2-phy-r8a774a1', 'renesas,usb2-phy-r8a774b1', 'renesas,usb2-phy-r8a774c0', 'renesas,usb2-phy-r8a774e1', 'renesas,usb2-phy-r8a7795', 'renesas,usb2-phy-r8a7796', 'renesas,usb2-phy-r8a77961', 'renesas,usb2-phy-r8a77965', 'renesas,usb2-phy-r8a77990', 'renesas,usb2-phy-r8a77995']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r9a07g043', 'renesas,usb2-phy-r9a07g044', 'renesas,usb2-phy-r9a07g054']
   	'renesas,rcar-gen3-usb2-phy' was expected
   	'renesas,rzg2l-usb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r7s9210']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
