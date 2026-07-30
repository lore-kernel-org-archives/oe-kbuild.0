Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA6B22A7F0
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 04:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785385216; cv=none; b=oBx6ga34CFrNlPzj01DossACD/vFhkU+/6rLczJhZYomim/vWVKZvw0tyXSRzv720kjust9u3njeAYkiFMSDA+Wem/pURAMBgUH+yLbCSpx8S6Rtm/3oTQGctyC7d0/j7duUIhdq2v868Hg3KbFSLITR+Xce3UU/P5zkpxjMjQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785385216; c=relaxed/simple;
	bh=e39LKNQEQSwD5tSJIkaxcHf4x9FB+qVBzPHtr8gNv7M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ulw1YdPdUQy1gZZqDV1V6ktxztPsGpwWiHRo/gmegx8J2p4ZwmvwPInyfn52O/zYoQHPO80m10K+qhYqRjVdA2PbPTzaYq8bzUKqX2UKWgTHlToi5MmzUxLmsGBme6qmhE4bpfZihQvstzzOLqlZIZC51hewy9frSSdLEvHSMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHKiGe48; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHKiGe48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785385214; x=1816921214;
  h=date:from:to:cc:subject:message-id;
  bh=e39LKNQEQSwD5tSJIkaxcHf4x9FB+qVBzPHtr8gNv7M=;
  b=XHKiGe48GsZjZRR0GXiriEwO5+ez+yRIM/Fwlv2fnBxJnPuvFXVNhJ3w
   /2s8Ilrc9hLAjPoGsXZ4nT55uHhPTTdMXCxx95bwtX2oSHQreZU6XuPoe
   HxaAXawuWHaNIkx+YtK1zXNV8KyHIyvKrTUdbiwqz12SmpNO9DPavsGhf
   B5a3nqwdSNldBsTvDA31iG7b7NMIrNCNaE8D7He8KBa490ekafed05KL9
   Hyfy0ifbIWYtvUm5yZoZ22HIrGftCjdmHRA3XiLBN/GII/bOnsjpTmrjq
   YEIw8+tPHHUJnmOUbe4Ye1yT1pL6rzp12L17Cm1P2jfBZPn/AlEQHgal5
   A==;
X-CSE-ConnectionGUID: TFEk+FKATnWOIzqD7loJsg==
X-CSE-MsgGUID: iILr66IsQsa05iArl1m9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84976985"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="84976985"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:20:13 -0700
X-CSE-ConnectionGUID: LsX7nqNuQ9KzfRrjnQzSIA==
X-CSE-MsgGUID: SgM/go7ATkyy6kXUT/P8Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="265251292"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 21:20:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpIFf-000000002JS-0UUE;
	Thu, 30 Jul 2026 04:20:11 +0000
Date: Thu, 30 Jul 2026 06:19:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 236/243]
 arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/remoteproc@d00000: failed to
 match any schema with compatible: ['qcom,glymur-soccp-pas']
Message-ID: <202607300613.NtixjpNL-lkp@intel.com>
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
TO: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Ananthu C V <ananthu.cv@oss.qualcomm.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   23da74833df803c5e8bea71feb878173764ef121
commit: fe76d6b32eb2d3193c65c834693fa4f58b558080 [236/243] arm64: dts: qcom: glymur: add SoCCP DT node
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300613.NtixjpNL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300613.NtixjpNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607300613.NtixjpNL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: touchscreen@38 (hid-over-i2c): 'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/remoteproc@d00000: failed to match any schema with compatible: ['qcom,glymur-soccp-pas']
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@1fd5000 (qcom,glymur-tcsr): 'vdda-qrefrpt0-0p9-supply', 'vdda-qrefrpt1-0p9-supply', 'vdda-qrefrpt2-0p9-supply', 'vdda-qrefrpt3-0p9-supply', 'vdda-qrefrpt4-0p9-supply', 'vdda-qrefrx0-0p9-supply', 'vdda-qrefrx1-0p9-supply', 'vdda-qrefrx2-0p9-supply', 'vdda-qrefrx4-0p9-supply', 'vdda-qrefrx5-0p9-supply', 'vdda-qreftx0-0p9-supply', 'vdda-qreftx0-1p2-supply', 'vdda-qreftx1-0p9-supply', 'vdda-refgen3-0p9-supply', 'vdda-refgen3-1p2-supply', 'vdda-refgen4-0p9-supply', 'vdda-refgen4-1p2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-block-group-count: [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-block-pack-mode: [0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-hstart: [255, 255, 255, 255, 255, 255, 8, 255, 255, 255, 255, 255, 255, 15, 15, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-hstop: [255, 255, 255, 255, 255, 255, 8, 255, 255, 255, 255, 255, 255, 15, 15, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
--
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: touchscreen@38 (hid-over-i2c): 'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/remoteproc@d00000: failed to match any schema with compatible: ['qcom,glymur-soccp-pas']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/clock-controller@1fd5000: failed to match any schema with compatible: ['qcom,mahua-tcsr', 'syscon']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-block-group-count: [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-block-pack-mode: [0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-hstart: [255, 255, 255, 255, 255, 255, 8, 255, 255, 255, 255, 255, 255, 15, 15, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-hstop: [255, 255, 255, 255, 255, 255, 8, 255, 255, 255, 255, 255, 255, 15, 15, 255, 255] is too long
   	from schema $id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: soundwire@6c80000 (qcom,soundwire-v3.1.0): qcom,ports-lane-control: [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
