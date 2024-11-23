Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FE23BE
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 07:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732347084; cv=none; b=hPn1TBdhpLpYUupD9sKheIamvRhktlyF+cmQv0P1w+SFXNR9Hn2SHmi6uXxVQtjf1mIkJnPGjWMzrf1wRVTV2nk5RMfu6g+7mc0VifR0zxHg2dBRWmpHO18k1hDIyCnG2LmUa7OiIX9Dsd6nWZ++MpayMOrLirBWbTl7xkdksaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732347084; c=relaxed/simple;
	bh=S8ad9/CqvMvUK8OR4YAwTCT4L6yXvqJyQwgRz9wjmOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNYhjzmWLbNmZVXyLn4a17bAceofehwIoWBL4eA7Zv3I7/bdKHiehyl81WFc9Fzi0/jWBdgxtLpH7YcQ9z12suRD29YdTx5uMnpJvTjDIYa9Ns/jZARNe123zalCJnd6d8f2ZAtJzYQyGOIdCRINXSlyfc6/hao0VeZvinGUcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dyj8VoHQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dyj8VoHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732347082; x=1763883082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S8ad9/CqvMvUK8OR4YAwTCT4L6yXvqJyQwgRz9wjmOk=;
  b=Dyj8VoHQrXTUTK81t7s3allTou+jGpgfa6H95EQQW/ylAAQ1dRnSZHoV
   E4u+JOqS1C7LeV1Oqcv/sHvNj2qVaPTzFj45WsbPhzsmRBxUdR6H+7ZgE
   P1HnKqLk0r/YGYu2Cc/1SGr11+7mJGAHArZ/neZkXHyXOH+zTuGsAEMcd
   LMTxDcOH9ksUcinN+X1s//26yA86j3y0paKPyGAaijaDtKp5HfNdLVeTJ
   UMZdxNuko8T2+0O0yqlnMa+kqGOzcTjh7NKO8LUpVw4Yox3U3Qquqv1jp
   eeKiRjposSy+ThuDhWP5ysXR2qmFP6Lm8MfEW9GVY5lsbyUnejDT8BJ04
   w==;
X-CSE-ConnectionGUID: qUVhd18zRcOnlLH2W5QoWg==
X-CSE-MsgGUID: sZjmhhdATZOHZVDZK1tiQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="50023136"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="50023136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 23:31:22 -0800
X-CSE-ConnectionGUID: QBVokZYHQ++A8xnfgvFKhQ==
X-CSE-MsgGUID: ytlPSPPbRFiXHUOsNoZaYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="90970361"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 23:31:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEkbu-0004V5-00;
	Sat, 23 Nov 2024 07:31:18 +0000
Date: Sat, 23 Nov 2024 15:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
Message-ID: <202411231554.CW84fS2O-lkp@intel.com>
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
In-Reply-To: <20241120135859.3133984-5-daniel.baluta@nxp.com>
References: <20241120135859.3133984-5-daniel.baluta@nxp.com>
TO: Daniel Baluta <daniel.baluta@nxp.com>
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: kernel@pengutronix.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: frank.li@nxp.com
CC: aisheng.dong@nxp.com
CC: daniel.baluta@gmail.com
CC: laurentiu.mihalcea@nxp.com
CC: shengjiu.wang@nxp.com
CC: iuliana.prodan@nxp.com
CC: Daniel Baluta <daniel.baluta@nxp.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12-rc6]
[also build test WARNING on linus/master next-20241122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Baluta/arm64-dts-imx8mp-Add-mu2-root-clock/20241121-132543
base:   v6.12-rc6
patch link:    https://lore.kernel.org/r/20241120135859.3133984-5-daniel.baluta%40nxp.com
patch subject: [PATCH 4/5] arm64: dts: imx8mp: Add fsl,dsp-ctrl property for dsp
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231554.CW84fS2O-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231554.CW84fS2O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411231554.CW84fS2O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: dsp@3b6e8000: memory-region: [[147]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: dsp@3b6e8000: memory-region: [[143]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: dsp@3b6e8000: memory-region: [[118]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: dsp@3b6e8000: memory-region: [[117]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: dsp@3b6e8000: memory-region: [[151]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dtb: dsp@3b6e8000: memory-region: [[155]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: dsp@3b6e8000: memory-region: [[139]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: dsp@3b6e8000: memory-region: [[101]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb: dsp@3b6e8000: memory-region: [[139]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: dsp@3b6e8000: memory-region: [[108]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: dsp@3b6e8000: memory-region: [[127]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: dsp@3b6e8000: memory-region: [[123]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dtb: dsp@3b6e8000: memory-region: [[125]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: dsp@3b6e8000: memory-region: [[126]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: dsp@3b6e8000: memory-region: [[152]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: dsp@3b6e8000: memory-region: [[155]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: dsp@3b6e8000: memory-region: [[104]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: dsp@3b6e8000: memory-region: [[119]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: dsp@3b6e8000: memory-region: [[126]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: dsp@3b6e8000: memory-region: [[128]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: dsp@3b6e8000: memory-region: [[135]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: dsp@3b6e8000: memory-region: [[121]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[163]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: dsp@3b6e8000: memory-region: [[159]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: dsp@3b6e8000: memory-region: [[158]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: dsp@3b6e8000: memory-region: [[157]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: dsp@3b6e8000: memory-region: [[168]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: dsp@3b6e8000: memory-region: [[164]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: dsp@3b6e8000: memory-region: [[163]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: dsp@3b6e8000: memory-region: [[162]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk-no-eth.dtb: dsp@3b6e8000: memory-region: [[127]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: dsp@3b6e8000: memory-region: [[139]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds.dtb: dsp@3b6e8000: memory-region: [[152]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: dsp@3b6e8000: memory-region: [[152]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: dsp@3b6e8000: memory-region: [[135]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: clock-controller@30e20000: compatible: ['fsl,imx8mp-audio-blk-ctrl', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: dsp@3b6e8000: memory-region: [[135]] is too short
   	from schema $id: http://devicetree.org/schemas/dsp/fsl,dsp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
