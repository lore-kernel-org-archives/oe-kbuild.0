Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE22F3E
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jul 2024 03:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721444524; cv=none; b=VVzEVBhNsjyFSySsvTBqfmV3U+1Ni3Skyk6MREAvM8fU8ai+IyLah0pL83nSZa6DVwqZmrremm//MxHrRgYccaxBnNJ4V5L9JhU+6epd4GBx3KCGy0AfCX/raDTG6sBGOi8f09WyyA7xcLDJLtINMdYBZMVEiwkdZ0F3kCYtA3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721444524; c=relaxed/simple;
	bh=m4TVWVSJYm6uKfWDAXCMTXCQ9aWQhiSDSFLVbPAN1pI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5Qg9H3exFNOqQIynk/pXzMYbMAq3FLt7L8dmBW/C6RY5Du2wOIzWyc+zxUmQKpRAVyo+AQaJ0cN6qbdDXby+Ast9Xy4Dt7QRs5G+BdQJYHC7xamOOshy8IfehZtIhlR4iRae7UbVu7i1f+x304FJPURq7NSmZ0PxbZtchV50q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLdXprd5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLdXprd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721444522; x=1752980522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4TVWVSJYm6uKfWDAXCMTXCQ9aWQhiSDSFLVbPAN1pI=;
  b=QLdXprd5+KRL0oIQ1/vfeq3xxZbwHAZnYtJhuyZ15+9M2bElmKSr4OLa
   yH3gN0vCLYmUAM4Flf6/9YMY7iPPRGGzKdXsolcW+mah99SVHS0icjv3v
   o/GN4pix7CvZw/pPqDhoN+m2WXF/QDQwvqdy6AGwijn8mc3nP4N0HgCZY
   dwZz83NOD9U3C9aF/ejCdDGBmQQcH2tggLXSUeC7iRz6SufgdN5v/B8wg
   pyMWuAf+LWJDUdJaZGjUBv8CFW8zCQgu/EsH/Rb9Nt2J+w3c7C0eQ8VRw
   Cf5E5DJYDmJwowlvwayRW8zU1E5MdlfWWiUqm9Ed3UJtIQYbO2TzwWPIh
   g==;
X-CSE-ConnectionGUID: /7Qqc2iDTtCHwXusnqQsZA==
X-CSE-MsgGUID: bPy88LWpQI+TtpRMQCNhZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19211718"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="19211718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 20:01:56 -0700
X-CSE-ConnectionGUID: bHpj0hy5St+juapvvrpOSA==
X-CSE-MsgGUID: SV4cisiXQZyhQj9em2nsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="55480888"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jul 2024 20:01:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV0M4-000in8-1w;
	Sat, 20 Jul 2024 03:01:52 +0000
Date: Sat, 20 Jul 2024 11:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
Message-ID: <202407201017.piJDt62L-lkp@intel.com>
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
In-Reply-To: <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
References: <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Marijn Suijten <marijn.suijten@somainline.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Johan Hovold <johan@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>

Hi Konrad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 523b23f0bee3014a7a752c9bb9f5c54f0eddae88]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-arm-qcom-Add-Lenovo-ThinkPad-T14s-Gen-6/20240720-041951
base:   523b23f0bee3014a7a752c9bb9f5c54f0eddae88
patch link:    https://lore.kernel.org/r/20240719-topic-t14s_upstream-v1-3-d7d97fdebb28%40linaro.org
patch subject: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20240720 (https://download.01.org/0day-ci/archive/20240720/202407201017.piJDt62L-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201017.piJDt62L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407201017.piJDt62L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3873.11-3883.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: thermal-sensor@c271000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: thermal-sensor@c272000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: thermal-sensor@c273000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: thermal-sensor@c274000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/thermal-sensor@c274000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
