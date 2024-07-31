Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04412E5D
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444473; cv=none; b=s6NifwXOAks1dcre+nOr6JxmkR5A0kaGlwuEvXY/E1WnlWYigr9tDZCdxn2CSt4WOQ63jObpHc3RuOUAh1GaXR0ykCFbi8706Q/do+PGq14thleLVJi604knsTlLbxWfvlpRH76AWFSlzJ4bo8dw46gb6wrxxXzze+vHzeb9A5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444473; c=relaxed/simple;
	bh=Uzv2FVBENmeRhBSy6/clXsyTWdgTaKZJrGRgpLVyqVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tm0eodEJ+gsXwPfZxAb5s9rIDTfONPIUNSsE2UgDnGaJ9J6B8o0Er+dDxeVK1NIzqIfLD+eW7donwb6Om5f3PxUnVejQOW125D22GNdyhnrMDWrpC8bDFFpyMOmZV8D2KjRQuYfs1wlj9cPWq1l0CZeHa5nkfI6W625fbfeGYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acJ02MXd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acJ02MXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722444472; x=1753980472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uzv2FVBENmeRhBSy6/clXsyTWdgTaKZJrGRgpLVyqVc=;
  b=acJ02MXdnuGoNubbYrc8UFIoFlSv/Xc1fKqQhk3H5/IO1BA8ckBHPL2O
   SdWya0UiQE8BjxKmK01NA/S5xndJlq+zTI7CgiUIzE1yVyoZQT8dkXL6F
   OxdAgGoE6EXlDXyBtdU1dhd17gyC+P5P1aXDzL0yPXDLs/D3miZFVU2S7
   4L9vbuveYTDGe8SCMN4s/yuqFDgWuhtia0Tm8StO+akz/enSZUP1yIwFv
   3tKHEIu4i+SURzxxlVA39IWs5ayI2kpDTR5idzuzvfL1dF3HLLIh2fiGr
   NAyB6GxC0xj9pFz5fhn33uuqecQpJMT2mt67oQX10bFTF2sRO/HK5U8Ev
   Q==;
X-CSE-ConnectionGUID: ci+O2RLwRf6NKLN7yzi3qw==
X-CSE-MsgGUID: LGPSl6azQie7TrTPd5Rurg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20522488"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20522488"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 09:47:51 -0700
X-CSE-ConnectionGUID: +ej7DuujRSqbr3VXPz8oNA==
X-CSE-MsgGUID: la4soeFkRv6Vs6Dg7LDZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="78013099"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2024 09:47:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZCUO-000ucm-1B;
	Wed, 31 Jul 2024 16:47:48 +0000
Date: Thu, 1 Aug 2024 00:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 9/12] arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb:
 usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
Message-ID: <202408010005.0MQJpQIH-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   d483f034f03261c8c8450d106aa243837122b5f0
commit: 3c2360f1a50e6ef74c61748696134b5b31a9e191 [9/12] dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010005.0MQJpQIH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010005.0MQJpQIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408010005.0MQJpQIH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clocks: [[8, 140], [8, 126], [8, 147], [8, 142]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names:2: 'mock_utmi' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: clock-names: ['core', 'iface', 'sleep', 'mock_utmi'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
