Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0718024
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 02:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949928; cv=none; b=ReL1JS0mNhWQq7Q+9FL0MEZLhmjvCPm2My8ZwxDBPhhLBRzT7by8+PvRcE7zUpl5tW6xOU7NypHhv1omCs3IMNYwjZ77QSKqLAJD8Uuv5b+6KUZMZwns0X253zUkHB0oHggN/iV0RhhUIT1bO75j4tV2lrSozKSHXxQZ0t1foUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949928; c=relaxed/simple;
	bh=HghkFMaIw9U37/team3F/e4Kc3Y1z9cruVKWvM9JXSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufSkPrdHEycmb0qCifzmo5pEZlz4zl1LK9vR0euJqlVU+zFwFusjB008r+7EMICscalAO/ojJoxjnfil3jz/JNDn1MA43bHecR4MwjffdJ4ksRBBQWfieCV4hedw1HjmbwiI+/kBZbkqo1I8gSBdOIc9EyNoBVeSDZRB0bmYtSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYLEDRsO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYLEDRsO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763949924; x=1795485924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HghkFMaIw9U37/team3F/e4Kc3Y1z9cruVKWvM9JXSM=;
  b=jYLEDRsOoaaP4eZ27fi439+V842ggwwifzqRM2cwmRKNfkanZ4EZ/n1r
   sTe+Q5xxWwrRfLUz8YhwwvvEc45wIVpxy/2A9TnGl2Jt6240L1MnOXyrc
   pehfULjW15g2NOQdO/1qIaCdDwPOx/U5J0sblLFpGDVruwU+JUiHhoixB
   4dMyGhRgscl/1vHtH2mAvfyAv0CNOVGfbL+7SPLtxuJcMoBAiq06lEKvc
   fSV0d0fSOa2Ev+reLGb2YVWyaOQ+MT7SmRllyiRnJv5xxTkEiIJEuKZv6
   hljpaW6pmG8foncX52OPPkoD5hcPGIVV334kFqp7N8oIxZUwscH8AYz1J
   A==;
X-CSE-ConnectionGUID: Gx3ELFwMQPWKyUL5DkUDOA==
X-CSE-MsgGUID: PyEi6nZ6TZaTZkPF8KBfnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69809637"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69809637"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 18:05:23 -0800
X-CSE-ConnectionGUID: sLg3BIbBROezSjsuyYc8Cw==
X-CSE-MsgGUID: iUZc2VlYQ+6TwIBbMGmlqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="229499311"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Nov 2025 18:05:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNLx9-0000000007Z-30PI;
	Mon, 24 Nov 2025 02:05:19 +0000
Date: Mon, 24 Nov 2025 03:04:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 93/134] arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb:
 pinctrl@a7c0000 (qcom,qcm2290-lpass-lpi-pinctrl): compatible:0:
 'qcom,sm6115-lpass-lpi-pinctrl' was expected
Message-ID: <202511240318.sSZRjk3q-lkp@intel.com>
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
TO: Alexey Klimov <alexey.klimov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt64
head:   f481e772e014da92fa1232de54e4cac66b5fc5e4
commit: 1fc30731562bb45e53e09d40fc69bc4364310b6e [93/134] arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251124/202511240318.sSZRjk3q-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511240318.sSZRjk3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511240318.sSZRjk3q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1979.27-2052.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1937.11-1947.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pinctrl@a7c0000 (qcom,qcm2290-lpass-lpi-pinctrl): compatible:0: 'qcom,sm6115-lpass-lpi-pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: pinctrl@a7c0000 (qcom,qcm2290-lpass-lpi-pinctrl): compatible: ['qcom,qcm2290-lpass-lpi-pinctrl', 'qcom,sm6115-lpass-lpi-pinctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/pinctrl@a7c0000: failed to match any schema with compatible: ['qcom,qcm2290-lpass-lpi-pinctrl', 'qcom,sm6115-lpass-lpi-pinctrl']
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:0: 'top' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:1: 'csid0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:2: 'csid1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:3: 'csiphy0' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: camss@5c6e000 (qcom,qcm2290-camss): reg-names:4: 'csiphy1' was expected
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-camss.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
