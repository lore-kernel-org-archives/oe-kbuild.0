Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C8298CA3
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235139; cv=none; b=EckQlunlNOpciMtVd/8FRWtbNUrKOIl8AZPt2Iu0i0C3tog+ycs4aGqXhpkgZ8DstyXLUOFnBg888g8N4SNSWiUMwKJCNPk5DmJYOL59CmG4IL/jTo9jjgqie5ihrkytlShK6Owv5zt8Grq3n+miMNGYkwFbtnXalkcI5r+/y0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235139; c=relaxed/simple;
	bh=3P3dgBNrdbrHz4Cx1VIcNtTxJr5AOClegGV1mqIMHoI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YS6BwGenSKaGLC63ncgiHy6bb3EG7+cO08lKd5UiaXZ1z3ET3aYa00BaO8lKWIkMuNNm+46o8RgnYD85/bdbFTUU7xzX+DpZea2obfkveDLbf2EEwi3K+4P4s8o3WhX0QhNHcBfB6LAmn/4nEFknknC4pKfj+erbcuH720AjN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSW4xgrz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSW4xgrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773235136; x=1804771136;
  h=date:from:to:cc:subject:message-id;
  bh=3P3dgBNrdbrHz4Cx1VIcNtTxJr5AOClegGV1mqIMHoI=;
  b=dSW4xgrzcuCBMMbqgB5hLW5Oj+Z03q3dIrPS7Id5OnBhFd4CRlCf6sN5
   VWGhHWfCrq1HMNrn2/0BEYL1flWxQErNTh/VERL1H7xwJYxg/S7pJj4Fg
   QkG1oVF35d7nQ5hW1u9x/wfI7aNRG8e6CwI13LjUvzekmKLRdaXM4DxMV
   AG0nTP96CJOyetE9DzvdILwIeGtA/rYVNFjxXej9T/8Sm9h0uFkJc/20S
   y4SvcYBdu43sv07Vj3lJ8oTXqLEq4X3QzgzkV+4qNfdIJH26PHUfiYYCo
   O1dRGj1pJpYpp5disT1/S8amLx+3Q4oFHLiApESiUj+0WV5JqbyRiikbN
   Q==;
X-CSE-ConnectionGUID: EmxxeCTVRkirvd7FOo/G8g==
X-CSE-MsgGUID: SkwKhpRpRve2hZlZwr2Pig==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="96918040"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96918040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:18:55 -0700
X-CSE-ConnectionGUID: jcLMe0mfRwi4VrOkIIX1zw==
X-CSE-MsgGUID: mBETV/6NQZOgQXZBLthZUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="246036243"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2026 06:18:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0JSe-000000003Kb-0qem;
	Wed, 11 Mar 2026 13:18:52 +0000
Date: Wed, 11 Mar 2026 14:18:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 483/621]
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml:
 linux,i2c-index: missing type definition
Message-ID: <202603111422.xOPk8tpP-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 022b93d30db2c659dfe8d5a4f0382ee9bb8405df [483/621] dt-bindings: soc: Convert fsl/cpm_qe/cpm/fsl,cpm1-i2c to DT schema
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111422.xOPk8tpP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111422.xOPk8tpP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603111422.xOPk8tpP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/nios2/altr,nios2-1.0.yaml: altr,exception-addr: missing type definition
   Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/power/reset/ti,keystone-reset.yaml: ti,syscon-pll: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/powerpc/ibm,vas.yaml: name: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pinmux-mode: missing type definition
   Documentation/devicetree/bindings/pinctrl/st,spear300-pinmux.yaml: st,pins: missing type definition
   Documentation/devicetree/bindings/pinctrl/atmel,sama5d2-pinctrl.yaml: atmel,drive-strength: missing type definition
   Documentation/devicetree/bindings/pinctrl/sirf,prima2-pinctrl.yaml: sirf,function: missing type definition
>> Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-index: missing type definition
>> Documentation/devicetree/bindings/soc/fsl/cpm_qe/cpm/fsl,cpm1-i2c.yaml: linux,i2c-class: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-tx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: mal-rx-channel: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: rx-fifo-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: tx-fifo-size: missing type definition
   Documentation/devicetree/bindings/net/ibm,emac.yaml: fifo-entry-size: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
