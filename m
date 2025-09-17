Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669928B51E
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119079; cv=none; b=rK0I+4rpK8SuyfQQqskc2WmzxDbXtHroVmgGVyFLp8KAeUNxbIXsN81xQgGdcZiUCh78E8Bjy7Zer9fhhtguyMgfk3Y9r7KJ9OjU/m0S+kU0yD1UfyEmbu1SIh7/YvoCajny1ySNrwjVU0OyeLCfo7BSA5HD5SHrNgP/h0poVR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119079; c=relaxed/simple;
	bh=owFa+WRNDtwTrLOZ8AHQrSrWr84RB58qcqjjdkjmZdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7iwU/s1RtKLdkxmGImxT5OMUPIEsSmGcDfYIGOmP3CnMfudZTaZWSeWJDGFeDJyFdp7QGBB5MMhguerOjQMhr9azEYeKXEvVgPR6L6NF6gr2lf7hvwFryW97pS43DZBc4/XsLvLYaQhn0O9pLTS+wcQnk0tssbgl5EW8A1AUcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXciEKFi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXciEKFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758119076; x=1789655076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owFa+WRNDtwTrLOZ8AHQrSrWr84RB58qcqjjdkjmZdM=;
  b=YXciEKFiwf9i/qVgkxNLJqbRIIux0yBitg7lIxrYR184/E3Z7BOw/dQK
   5DOJPZushKolcBYcEK/7e4EJhNnOl6fS6KRgTxPfWMVoDsX4hVxmmeX0e
   LcJpe3n1OHAwvyuWGbK7kgSBzYYxJnO0FPi9gXD4yItTUAnyAkCdTIj0X
   hYMDSYPqjHoTSyZuxlipFzYGbKfGJ3TXQj84Ga+4p0Y6F6ZgDwIKCAc4M
   x6rDMz02pg5Hkd0xrhQ7ycmlc6jZcy/toIemT8DkH96yaEdKBLwa65Nbp
   c6a6CEHB1C6ApfYseL1LmhtN7HqavIETWDbaHuWu80igPZ8eCNx6Yd9Nn
   A==;
X-CSE-ConnectionGUID: dGyCocjQTi2qqmh1dMbehg==
X-CSE-MsgGUID: IYAVwPnEQbqv5tPZA2fAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="64247880"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="64247880"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 07:24:34 -0700
X-CSE-ConnectionGUID: KVqjuD4BQEu6UGtOCURq4Q==
X-CSE-MsgGUID: 7R/cg9YrQny7iIVGeaF2Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="175058716"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Sep 2025 07:24:33 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyt5C-00026Z-1T;
	Wed, 17 Sep 2025 14:24:30 +0000
Date: Wed, 17 Sep 2025 22:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 153/247]
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fd5000
 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509172233.inaLmSy4-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   520f9fec5d6f5a23e7985140dc4dd9986f0ed140
commit: 7b8849178ecf183880dbdf19d853c92d0877a280 [153/247] arm64: dts: qcom: x1e80100: allow mode-switch events to reach the QMP Combo PHYs
:::::: branch date: 21 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-054-20250912 (https://download.01.org/0day-ci/archive/20250917/202509172233.inaLmSy4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172233.inaLmSy4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509172233.inaLmSy4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4894.11-4904.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e001de-devkit-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1p42100-crd-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fd5000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fda000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp-el2.dtb: phy@fdf000 (qcom,x1e80100-qmp-usb3-dp-phy): 'mode-switch' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
