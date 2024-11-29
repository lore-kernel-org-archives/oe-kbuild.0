Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F158AD23
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 22:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918142; cv=none; b=PdzVO8k3wJBTLhJy//QrMfGlip5atzHdESzZbIMvmQTE4ApRdZiLV9MHH5+2dXJXTzKnxV9XOPLWsIPeNSNpElPfiBD1ySXhjXRKnTHxmgGhUGYjjViCOf8aUPZCA6KGn0UKNCt2YxG/qhMxuWY1kqyNQM4krYrFIRULDc6cENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918142; c=relaxed/simple;
	bh=/YATCfMKzfkg8tMTWXBHL+/t5UsO4F2c+A4hmantDT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HeA74u/BKb/grPa1BMCHnTzBOMrEmChlPWCR5b+Gh9Q74qxBwh81VTrMudjW1CmFk87ch2ZFxo8aueSbhq1lDRBhpp7hMsKCip4dHkR1GEGOcvG/oHJN7a4pb4MNmAr8UIVWIrk7bum83TK/BtJ6GweyFP6ebg/X6EPVlXSi7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7KHKBIm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7KHKBIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732918141; x=1764454141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/YATCfMKzfkg8tMTWXBHL+/t5UsO4F2c+A4hmantDT4=;
  b=f7KHKBImEHuTRxoJBD6J34XfZ86DqCSS6WBNipaahx1CrV6cr8cawYo0
   +3PVChFjleItkTWdoPADlgmHtTyeF/rBsebNA0eHZ06jX508DrPVhkdG2
   e4Oj3B5tgQZt/GtELSCwK/M3VXZJ39ietpJEZgPM3rbntTreYYX/lYfqp
   4MbuRhW2Lf5jNHufPv0NZlvuB1MoCtXnwVaIVjQyScsALY4gC5gIbYC+s
   wxVqxNRzC8CyjAk0U5DmXeZlu1wVgJwG5RJttMmYgCYaBPO6m6KsIVaID
   4bATmJs6uLVerax/0gs2vhVKLxF2P+Ngeu3hb5Q7o/nTeXwARosIUD0ab
   w==;
X-CSE-ConnectionGUID: S5nvW3bRRyyKKPnlrLyQXw==
X-CSE-MsgGUID: S6/A69gbT5qh2rV9bzQbuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="55645260"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="55645260"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 14:09:00 -0800
X-CSE-ConnectionGUID: m25H5X7TSjqyUFu/W9ueEg==
X-CSE-MsgGUID: Cht6rdt0SASWyIUxE1KKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="93048918"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2024 14:08:58 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH9AW-0000jL-0V;
	Fri, 29 Nov 2024 22:08:56 +0000
Date: Sat, 30 Nov 2024 06:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs6490-rb3gen2: enable
 Bluetooth
Message-ID: <202411300545.q75nZKNj-lkp@intel.com>
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
In-Reply-To: <20241127115107.11549-2-quic_janathot@quicinc.com>
References: <20241127115107.11549-2-quic_janathot@quicinc.com>
TO: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Marcel Holtmann <marcel@holtmann.org>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
CC: quic_mohamull@quicinc.com
CC: quic_hbandi@quicinc.com
CC: quic_anubhavg@quicinc.com
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-bluetooth@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Janaki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on linus/master next-20241128]
[cannot apply to robh/for-next broonie-regulator/for-next bluetooth-next/master brgl/gpio/for-next broonie-sound/for-next v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janaki-Ramaiah-Thota/arm64-dts-qcom-qcs6490-rb3gen2-enable-Bluetooth/20241128-112231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20241127115107.11549-2-quic_janathot%40quicinc.com
patch subject: [PATCH v4 1/2] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300545.q75nZKNj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300545.q75nZKNj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411300545.q75nZKNj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4582.26-4653.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4035.10-4045.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'swctrl-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddbtcxmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: bluetooth: 'vddasd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: /wcn6750-pmu: failed to match any schema with compatible: ['qcom,wcn6750-pmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
