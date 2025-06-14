Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA37C1A42C4
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 05:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749878045; cv=none; b=k08z5qE3GZD2v+mXJx4XQNUXIEwLNm/48yKsZ0tdDk7UBsfykA0mFeFxwBKHdP8LSnRlZBS+U7tvT/NcbpgM+DXwfhlym0dQfy/136AGiK7VURjoM+t61jz3wnb7xgo+3C8ujQoUXzNEEpB/TjrcceeGSIo1L6tKx956e7avtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749878045; c=relaxed/simple;
	bh=xiXnqkekXAz3dK1o16Hu0tBsJ3aG04CirtbG5qDio1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIi7kqKtRYI2LlqRo9yRocKL94+54AIqMoBLj155U0hdaKqLDlNKb5nbwsiw6+eo/+aHkVpCKcKZoQ/u7SyZpIYvKTen0kheKRER2nhaxWGuOCM9ZT4KNTDFkcjpXJA4Bc4m9W1O7EQoYjSxAFux3+0ix4lZwr7hxd7TOTKYpNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRaDL/JZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRaDL/JZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749878043; x=1781414043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xiXnqkekXAz3dK1o16Hu0tBsJ3aG04CirtbG5qDio1E=;
  b=lRaDL/JZAO9MJz5ui0zqB7mqRhOY6DMQ547lkdTewUxPRD3/cEbQG5Rk
   mVNGTAHyog1SA8aka1H3IY0owICBmyHU1bpeufPOzIq6KG+yjYvJyAy+o
   AumVFs5cQXZnlUIzoxuF+tN/97w0ea520DMJApuPfpZJ7xDbLIgf2IIzr
   4wBJFN+f8yUJogU85dQIzZcpqoorzaoqQUMP9tQoFd/y/pCvk/QDxAEO/
   oWKCmVrbXjizxAYy4U8rsOkuc+QlgHGdDX4/0fDmCVsd5D4RyG7jIDyKK
   U8+rL+NXErtqwBQN5BSoTlG8sxR3MyTFV4PW+K1K/iIzHCeE5Vjz91Nf+
   w==;
X-CSE-ConnectionGUID: zApj6qyhR8yYXtSx6TVwqA==
X-CSE-MsgGUID: LTfaWq1nQ2+3ubPXPK7dUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63448801"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="63448801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 22:14:02 -0700
X-CSE-ConnectionGUID: ICO0FjaTQF+BGw4EoCsS6Q==
X-CSE-MsgGUID: jmGbgkYqQC+MEEK6/RiuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="151822444"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2025 22:14:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQJDL-000DJc-1S;
	Sat, 14 Jun 2025 05:13:59 +0000
Date: Sat, 14 Jun 2025 13:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.17 23/26]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15800200
 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202506141305.yUtjZbX7-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.17
head:   9d07ff19f068eb508c1bbaa8ba652b0a8a544eb5
commit: 8cdba78ca5e7db0092ef0fe2677d7fb2ea6f32f8 [23/26] arm64: dts: renesas: r9a09g056: Add USB2.0 support
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-051-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141305.yUtjZbX7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141305.yUtjZbX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506141305.yUtjZbX7-lkp@intel.com/

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
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045', 'renesas,usbhs-r9a09g057']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
