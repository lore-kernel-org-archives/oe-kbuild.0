Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91641DC198
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292740; cv=none; b=gEN/PjnJa9tP2sPXakiAFAs8igHrPkaaDj9djJpFoVIYhtKsHhLq2LSfhlUXBMexk6ay3Jwbijee/krjs8Ew/+8I3+wiIvLS+ZZjgqhieo55bLl0HSHispoGn0c8na2HDVXbEDo9J299PUFGQsQN7hrRUbHeJIenzBO9+tFaR5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292740; c=relaxed/simple;
	bh=h65E8r6klU763jByV+VyZp+bknCmtaEtAWtv+BG2lRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jKQOWCzD9DibggeUl5Wi3HGf8guvK7nCFTinSCwLUdXsd+kn+ufbDwyUGBaymEed9eysujvHJdf7QDVwaPpGGAaPhK3ZTg0a+Vr3lZ0ZECFhL/e3ID9gmtY9ymbCss1AQECH1t3h1DJEs+dZzxw+7JjN1xZu6tu3uTl75pxUUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqwj8X7k; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqwj8X7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292739; x=1784828739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h65E8r6klU763jByV+VyZp+bknCmtaEtAWtv+BG2lRM=;
  b=nqwj8X7kE/U72BuwiwGc8f5JmWNNmjvimDm6AKh2g/ztNoYfsUbaj4jN
   TdBikGk2L7giCZNcO12xKUn3mP6/waLIlKSJMJcjPf6usoijzKWji0z6y
   dPKBDtGHHGEzyua0frEcaqiYNrSNd2DsIqSZbwVMpMGcWVoEtwlSrNm+s
   OyHUrQwH/3tcP+SE1i/D0oEMTP+B3LvKOKHAbI20yLlLVa5/d0ZSC46KK
   XGtLqniQIla5bxxFHe/UbStVpJEKIObv4kaVig2zmdOgeEAi4B9P/QRqQ
   xWG6BCRua3eRFCMhts0DQuQv0EALA3IK90U3YAA1uWNDsfnlFPM4GCDlR
   Q==;
X-CSE-ConnectionGUID: AEKoPt0pSlCxkhBqs2oD5g==
X-CSE-MsgGUID: G9vy/b9lR8mM/z0mXoRuDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043049"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043049"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:39 -0700
X-CSE-ConnectionGUID: nbnZSiNlQY+8/czgKsWlSw==
X-CSE-MsgGUID: IQEIzkvaTxCCwO5+s438BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159418162"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:38 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX5-0000AS-1u;
	Wed, 23 Jul 2025 17:45:35 +0000
Date: Wed, 23 Jul 2025 16:23:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/sm8750-integration-and-todo 14/19]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match
 any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
Message-ID: <202507231654.w7gd1ptj-lkp@intel.com>
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
TO: "krishnachaitanya-linux" <krichai@qti.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

tree:   https://github.com/krzk/linux wip/sm8750-integration-and-todo
head:   ece0c34ad660cedc7e51b544f420d6c25bf0d79d
commit: 5f9f59f351915ab223feb465fca984d46b1f13ca [14/19] arm64: dts: qcom: sm8750: Add PCIe PHY and controller node
:::::: branch date: 2 hours ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20250723 (https://download.01.org/0day-ci/archive/20250723/202507231654.w7gd1ptj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6193dd55535460c347f8c0b794df7d7d52fa78c9)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507231654.w7gd1ptj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507231654.w7gd1ptj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3114.27-3177.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3005.27-3092.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3114.27-3177.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2765.34-2766.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2866.31-2867.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
