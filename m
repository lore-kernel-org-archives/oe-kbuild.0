Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7812E28D8DB
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002614; cv=none; b=DzcnFXlvHJg1DDh260EJt3dNwERMLYh4ThnQue+chyJrz6535HI13MQcFzdrS4ayXPF13y3qBBWt5jF93Yhhite1gNs5LP48wxdCDggoiB9PJojhwaHdbh8CYU91CqipBK240lUoUaTLpxVV7VOnU7I3++AS8228lK+7aGMXNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002614; c=relaxed/simple;
	bh=8Fut+8b4bDFa+IEIs/N9MXSq/C40dHfzI4vLwNnOOsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9jXoVv2buw3YQ+8JYC64/+qdWiV4RSZ88XxqK29oGOUFuxDpui1o3Or0qUbfMhMoORuEddTymCKjd5he4W7w8f243PyYVGOhDYA0GQZ8oWo6UPpuMh57RI09+55mHSnBoXsucZgVJo8HxbsdSAwBruISnRrWRr456fpMUfb8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJPmpzmY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJPmpzmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764002612; x=1795538612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Fut+8b4bDFa+IEIs/N9MXSq/C40dHfzI4vLwNnOOsc=;
  b=PJPmpzmYeaCQlPeinfHAm+HGgEPfydX2xjcRz/svUEDnk1Am2Sts4bfJ
   igzlYJ5FO5PbZHET00dkzCNK1bBqRwTIjwklSy4xlDF3dVUVrc2zpljXh
   t6BAF+StAp8pgOLp+cizpfHqhdt99mPt7jQ0TMDb8i4fSGvUCju+MX4fD
   EL2PtkGW43Tt3NgOx8G1DUORD4DxlIDekERL/M8icKkaHHQsFp30s7c4L
   83AHBgS+cnFueEGgpcMKzx3h5nmY8pJx/9j1gzsd1YRd02kQoU4BkMdl/
   +VpHH6MFLxAtcdonL9ewnfjPVr8GTJRLO/ubZ8RXiX+7psG4CWr00pb+g
   A==;
X-CSE-ConnectionGUID: x6IbEMwFT/SgBT0B39LcQw==
X-CSE-MsgGUID: VFqVKmGRSu+b7GcNBNbhxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65957711"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="65957711"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 08:43:32 -0800
X-CSE-ConnectionGUID: o0SlWIgASaKfEM9T59k1CA==
X-CSE-MsgGUID: JsFZ5EqmT7mLZNY8Wcau5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="192260363"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Nov 2025 08:43:31 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNZey-000000000HD-2prK;
	Mon, 24 Nov 2025 16:43:28 +0000
Date: Mon, 24 Nov 2025 17:43:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:imx/dt 26/29]
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dtb: pmic@62
 (silergy,sy7636a): 'enable-gpios', 'vcom-en-gpios', 'vin-supply' do not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202511241727.IZsb5KYJ-lkp@intel.com>
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
TO: Andreas Kemnade <akemnade@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Peng Fan <peng.fan@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt
head:   6f813b7814d305cac27b81d5cabe3ebdebd1d8f2
commit: e58a4296807b24c271fb6677188d4b5ce49558cb [26/29] ARM: dts: imx: e70k02: add sy7636
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251124/202511241727.IZsb5KYJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241727.IZsb5KYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511241727.IZsb5KYJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6sl.dtsi:735.28-739.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dtb: lcdif@20f8000 (fsl,imx6sl-lcdif): clock-names: ['pix', 'axi', 'disp_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dtb: lcdif@20f8000 (fsl,imx6sl-lcdif): clocks: [[2, 114], [2, 113], [2, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dtb: lcdif@20f8000 (fsl,imx6sl-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sl-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx6sx-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dtb: pmic@62 (silergy,sy7636a): 'enable-gpios', 'vcom-en-gpios', 'vin-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/silergy,sy7636a.yaml
--
   arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dtb: /soc/bus@2000000/csi@20e8000: failed to match any schema with compatible: ['fsl,imx6sll-csi', 'fsl,imx6s-csi']
   arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dtb: lcd-controller@20f8000 (fsl,imx6sll-lcdif): clock-names: ['pix', 'axi', 'disp_axi'] is too long
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dtb: lcd-controller@20f8000 (fsl,imx6sll-lcdif): clocks: [[2, 129], [2, 123], [2, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
   arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dtb: lcd-controller@20f8000 (fsl,imx6sll-lcdif): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long
   	'fsl,imx6sll-lcdif' is not one of ['fsl,imx23-lcdif', 'fsl,imx28-lcdif', 'fsl,imx6sx-lcdif', 'fsl,imx8mp-lcdif', 'fsl,imx93-lcdif']
   	'fsl,imx6sx-lcdif' was expected
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml
>> arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dtb: pmic@62 (silergy,sy7636a): 'enable-gpios', 'vcom-en-gpios', 'vin-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/silergy,sy7636a.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
