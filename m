Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8684597F
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 22:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721685846; cv=none; b=EihNJEbOopdud4XZfBqWaB7IxpM/WPPQZ76GL7mX+i424acezJPHYO0/jrWoTYe2WKt/QPjCuTHvfx+GhU7crjujj0gVX1mP8a8WkkEHaumaEs3rwDW6AuzytHZ+P9hj7Gi7eDlcweJDJWDHYHve9ft5MJO7ttlqz5O9XpS64wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721685846; c=relaxed/simple;
	bh=f2oQr/TXhC5BS/vFVFQNczETuseD2kebSIIWrKZj45k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCggVat2O2JU+PcPUYBRNmWRu3JFzSbAIyUyVbrXFGf/IENZqUrQC8pool6q1UxjPq1nCXSia8//elhrzpUuQs54O8svRBoWIhbOsk+sHRf16CYz1U+hy6X5DInkQP3ze45J7d94GEEI8ExI1sl0EFDPCf/As9dhJpcyParFdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gsc+bYjr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gsc+bYjr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721685844; x=1753221844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2oQr/TXhC5BS/vFVFQNczETuseD2kebSIIWrKZj45k=;
  b=Gsc+bYjrnZ51TPWmU6hk/kn0Mlw/zeL34pjGoZ1b1XJasbtYf5DeCU2H
   esUZ48MCPLQZvwzOShMI/C40tlg6O+90jACzan8zxCzvRyQaF92Cmh++6
   85p7tWkxMdPZSGDSAjSoy8He6SI1emdG3M3G65jr7lU7YLPTIYqzzuQB/
   7jeZWUyiIFAvucnfsB2TNQHVPSaQh6rC0MWDVhlKKeH/q7w5amEzpbe3p
   C+yERKhGQMtbUDlPndH23d4Ghtkj8tlUTbSDeyxk2IZXRjPNh4vNIIB9W
   cP5B0+F6YZzO44Qg1SQZpWMY9s9Lozl3D+hcI2JUtjEUL10MJefi7PBOP
   A==;
X-CSE-ConnectionGUID: 2tMg5e8NSvaIQ8CEQshD6Q==
X-CSE-MsgGUID: OwY4COcFTMelBXR5lUJjcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30706217"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="30706217"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 15:04:03 -0700
X-CSE-ConnectionGUID: au+g3P2oSL+bUQFUr+iKYw==
X-CSE-MsgGUID: R4BEE1J1RSWMLdK5AVUkjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="51730702"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2024 15:04:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW18S-000lQu-20;
	Mon, 22 Jul 2024 22:04:00 +0000
Date: Tue, 23 Jul 2024 06:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
Message-ID: <202407230553.RaPVIdtg-lkp@intel.com>
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
In-Reply-To: <20240722094249.26471-9-johan+linaro@kernel.org>
References: <20240722094249.26471-9-johan+linaro@kernel.org>
TO: Johan Hovold <johan+linaro@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Sibi Sankar <quic_sibis@quicinc.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Rajendra Nayak <quic_rjendra@quicinc.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Johan Hovold <johan+linaro@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20240722]
[cannot apply to robh/for-next v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/arm64-dts-qcom-x1e80100-crd-fix-PCIe4-PHY-supply/20240722-180159
base:   linus/master
patch link:    https://lore.kernel.org/r/20240722094249.26471-9-johan%2Blinaro%40kernel.org
patch subject: [PATCH v2 8/8] arm64: dts: qcom: x1e80100-crd: enable SDX65 modem
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240723/202407230553.RaPVIdtg-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230553.RaPVIdtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407230553.RaPVIdtg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3995.11-4005.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1c00000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
