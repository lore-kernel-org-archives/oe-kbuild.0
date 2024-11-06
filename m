Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEF645
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 17:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730914592; cv=none; b=hjyQJ/ULfmkXoM0XZMXDiBwNnEQke63hOFXDLIw2gVtHzwlGCa7i2Kdy4RxInHBuBxLDCqih2eu7IiFXon0jIBP7x21Ek/shfv3RHpbpj6Zajku6hH5uaohcb9BBuz4nnRcgHg9zFAW/wvDUMsJTiJVFui8ZELPPftsGfbq0Yss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730914592; c=relaxed/simple;
	bh=rttJdRJSMwviLM4blZNBVqD/eCdwjRDZRmODCzkhatU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbhviws+Nj/HgWuL63jnsFYXaiA0PHGzdAdWDVTNxivzbLTcdQfQWG7JU4J087tMXCAd//hqbMSYGezFbUVujg+cWHm8Ud/0dhbkPIrDnhMhgCFbGR4/cC12X9o32C6KQ31QXZsfe2Dewq6GJlxT8djO+aorTCQjaCcaRMnjap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMJI6LJd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMJI6LJd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730914589; x=1762450589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rttJdRJSMwviLM4blZNBVqD/eCdwjRDZRmODCzkhatU=;
  b=FMJI6LJd8lg5JnbUQ6c1fQBB9QgqzSzPGleKtfvlKuBB4+G50U+xVV5z
   zZuHCnexmTqi2VH8Hr+Rixn5lJg/Pjv3xpYILbhOIEp9PehqEbbQukAh/
   EA0Qh4czpwTQCveWDDiEQPbUkRtJTuLXWv1HgZ3zUSCpGRG1lqEWpM1CD
   d7q+YcQBWQiYhqLsOFLtoQ+3FeiPU2nsxX5u1U6EKGmuGnPLey+JP6iLT
   dkjoKAc2N9HoJtBsdg7vl3mhpJkJikLbjSr5UOUmo1Oll/xaSWm5LOlU7
   0Y42EoaoLVx0FT5LzqkD5nUf+7pUDLZmCNm+hIPd6p/caqFVjYH2NMjC1
   Q==;
X-CSE-ConnectionGUID: weGIt3LyTP+5VJhIvw0WaA==
X-CSE-MsgGUID: KF+70QQCQ02lOs4e2A9R9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30135791"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="30135791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 09:36:25 -0800
X-CSE-ConnectionGUID: jEahsMK1SO+AAW91VQzbTA==
X-CSE-MsgGUID: zfwGwBj1THiODBZqzbagsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89774181"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2024 09:33:28 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8juI-000pDu-1N;
	Wed, 06 Nov 2024 17:33:26 +0000
Date: Thu, 7 Nov 2024 01:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:fileSB0yEw 172/181]
 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: esai@59010000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411070157.LCbvDcwD-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileSB0yEw
head:   9b915776e0e6a2d185498077e0ebdb154a2751ac
commit: adf7ea48ce05a6c5c44f0f9d3f81e83e5cb70c3e [172/181] ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai fallback to fsl,imx6ull-esai
:::::: branch date: 3 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070157.LCbvDcwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070157.LCbvDcwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070157.LCbvDcwD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-mek.dtb: esai@59810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-aster.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-colibri-iris-v2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: esai@59010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qm-esai'] is too short
   	'fsl,imx8qm-esai' is not one of ['fsl,imx35-esai', 'fsl,imx6ull-esai', 'fsl,vf610-esai']
   	from schema $id: http://devicetree.org/schemas/sound/fsl,esai.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
