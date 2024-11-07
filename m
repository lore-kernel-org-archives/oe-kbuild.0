Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA81372
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 02:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730945752; cv=none; b=Gn5yHPCYgBI7Z6+hbq+hiWkmlumrRgXB/FqJB6kF7Thza5oOxaXVmRrkm2XpLONCaWm6tISJScMYaMy7ZUVXphWfmV45o8jtq5k049fa5J+iRsMfHQr4HbbapRr/vFjCEV9s8m+oXaujd/5e96F2bPyg+rFgT6AqUtkpk4zJ/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730945752; c=relaxed/simple;
	bh=LiKnVlC9uDkfFmsvbv98lKKjoz/WfRIBmiNSYwNvu5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNKUdso4Xr5aJFZu12uIF9XMqBS7jmiFlpU9oMP2Bfa7yAZoENJwKsFdV/+IPuaZMZcH+7pNIc121Jwf+sGirN2mx8saA9XGvWmG6rByRUQ6lDnnx79YvzSZO167giVOIsOVpzAajy7mSKLEeG8Sxlf/sQ3JVRjZEtZhL6eK8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3wRdsUL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3wRdsUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730945750; x=1762481750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LiKnVlC9uDkfFmsvbv98lKKjoz/WfRIBmiNSYwNvu5s=;
  b=F3wRdsULQKB9c66awcRG85CeBS5Ew+r4FqAPw+/4WW9Fsbix9Ih6JXRj
   mhoAHuwJBZs3A8TAxqmp3jHvrc6/twqWteAF8CJEQDGAfkqR6/r9vqIyw
   eZnuDcMG/SAKsxdhrGbBZQdFejZJg0PMFXvZbK9OKyPYRjcLu0TsEoGWf
   LVFjEN/k8qmswDzDSsZuY5+oux2OXRvRGDwhCMudfOV6HAKqYkdNH4jY3
   6qCyG5ctk2RQb+IMHcQpFojFwwYC+CPbEfMOWaU6ioixH/fk72ZMPEh3p
   gT0GRO+ZgIV7E/UhI8+B+qgTC7UnMl+dX1sJf3QtDxvlUvar6arSFTTVJ
   Q==;
X-CSE-ConnectionGUID: 0bkLSsd2RDegUa7+eSaPvQ==
X-CSE-MsgGUID: CCvdwxvzTDSvs0gbEkInyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30875069"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="30875069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 18:15:50 -0800
X-CSE-ConnectionGUID: d9dVts8YS9WS9K+TfpOBeg==
X-CSE-MsgGUID: stTucHUKT+S6PWhaKQr/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84806161"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 18:15:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8s3l-000pgU-2g;
	Thu, 07 Nov 2024 02:15:45 +0000
Date: Thu, 7 Nov 2024 10:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 1/1] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <202411070953.dsq444AZ-lkp@intel.com>
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
In-Reply-To: <20241105073615.3076979-1-quic_qianyu@quicinc.com>
References: <20241105073615.3076979-1-quic_qianyu@quicinc.com>
TO: Qiang Yu <quic_qianyu@quicinc.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: quic_cang@quicinc.com
CC: quic_mrana@quicinc.com
CC: quic_qianyu@quicinc.com
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: Johan Hovold <johan+linaro@kernel.org>

Hi Qiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qiang-Yu/arm64-dts-qcom-x1e80100-Add-support-for-PCIe3-on-x1e80100/20241105-155000
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241105073615.3076979-1-quic_qianyu%40quicinc.com
patch subject: [PATCH v9 1/1] arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241107/202411070953.dsq444AZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070953.dsq444AZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070953.dsq444AZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4343.11-4353.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pcie@1bd0000: interrupts: [[0, 158, 4], [0, 166, 4], [0, 769, 4], [0, 836, 4], [0, 671, 4], [0, 200, 4], [0, 218, 4], [0, 219, 4], [0, 121, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pcie@1bd0000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7', 'global'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/phy@1be0000: failed to match any schema with compatible: ['qcom,x1e80100-qmp-gen4x8-pcie-phy']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
