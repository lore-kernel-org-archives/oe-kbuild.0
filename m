Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF5C8CE
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763904056; cv=none; b=YKchec5n9jFGEaKRoqfNx6eCevGpxaxF62B7QyHT4AQ0FeqgurITM+wu230ocEJXe6r3vxd5WQYuS77Q/YEf036XOykkSm72+35bxfl+Wk2bwUbiHVlI9dUzNXvMZoPJah6GpL0NvNtndxqGJVjDqpHqSXSIPdO6HOw4SgS5B28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763904056; c=relaxed/simple;
	bh=I8u9X0LquuCUXjV19cEAzY7Hff2YPTTF1CRvVrBI0cA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BluYBbB5iJQtsXdyjQnhxLZ9nL8KMiAVYBjpJANeyslvAtk8zHEZP0R+tD7EBIJKEyn/FW8Bv2wFAl76HANQU+mGIqpXLJwPS6b06WkYhDkLPBcXNcK+KckPSFn/UpDnJDUekb/9Pb3zYZe8M65hwFW2TsQrEhzh+Of1ANfsCqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m55ugud/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m55ugud/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763904055; x=1795440055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8u9X0LquuCUXjV19cEAzY7Hff2YPTTF1CRvVrBI0cA=;
  b=m55ugud/WJkRxo4x9E9ndxnGF6D68kJ+MaJS765Gjzn1ZlnnvezzClLk
   caFKkA8nAz4OVYEZ45pzyG/GQPGtfS4vAFqkdqvobRWJJNVgqFi601/HS
   FTSe8qMKoPUTcCIHRam0eMOfuIwqto70Dmew1tDyLH5vXVRS/cDmaZ0bu
   aUYMbgjvi/Nm+2DlD5hmvX1vOg1No5Riv9EKnZm1CHDd5h2VHjCMBuzba
   HmU8rcvA4mVqQuJuL1aaKJgS79bh/8wHGZbELasJBGwhhpgCc6sQNRwvE
   zd621fTimiFho+QNoIV2UiVOvQG1pC3qtfa6hO0i7xzadNea1Z5Kb9EfL
   w==;
X-CSE-ConnectionGUID: a6baFF/nTZWOqZ/24uK+ZQ==
X-CSE-MsgGUID: xmFVVqO0RMqIBZx3V/mGwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="88578693"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="88578693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 05:20:54 -0800
X-CSE-ConnectionGUID: /WbyI6tqRTu9DBUI3mviYg==
X-CSE-MsgGUID: eQmyFC85TriVB/Gd8pGpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="191774905"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Nov 2025 05:20:53 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNA1K-000000002Pv-37lM;
	Sun, 23 Nov 2025 13:20:50 +0000
Date: Sun, 23 Nov 2025 14:20:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 93/134] arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb:
 pinctrl@a7c0000 (qcom,qcm2290-lpass-lpi-pinctrl): compatible:0:
 'qcom,sm6115-lpass-lpi-pinctrl' was expected
Message-ID: <202511231418.I7k8E0Sc-lkp@intel.com>
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
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511231418.I7k8E0Sc-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231418.I7k8E0Sc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231418.I7k8E0Sc-lkp@intel.com/

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
