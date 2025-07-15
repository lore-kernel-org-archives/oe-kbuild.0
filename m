Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68A81DED5F
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571365; cv=none; b=DGeHTWJlJ/p5PH4Jl4Qb5fqTSzWYYmwW985ZS1p+BR/HLSdojYO5mm2lG1SU6JpY6TpQ1s78PpqoenbsTDbA6uAmj1eVzntCdnuA7x3myb0vlhYHmKLYGV1ebNaixp9uM9I/7tqAkB4o3v+JM5eeUXz39Becpu8hko2tM4ev1Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571365; c=relaxed/simple;
	bh=Lx8SY27RDFkD80KI+D8c5ic2SuMW8VJL4nOX80LrNOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cH5t1ELfi+OaTR5TUnnU9iLweOujI8eDv4arwpnyPBoiqTELklAJckJmf4yHFuE3Na82oYZyzFTAkeiyuyV9EPMpzQMNVYAwS0T/ELPN3VqJgUUow0WZH3KGQNr1K5lEUuKyZWFzAYYxBZu6oHOHXKLda7FhhvUnQIe6wcN1v+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HadARCwl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HadARCwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752571364; x=1784107364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx8SY27RDFkD80KI+D8c5ic2SuMW8VJL4nOX80LrNOk=;
  b=HadARCwlhbEN/NyyFfKIxwy5Sigmd9/cdTeCRCu3EobYpGPCeZGDNj0L
   deORGrRFXxmARVNYOJ76a6fCo7GnIsU07LNMlkB0KXaHFyq5/fkcqUYcl
   fp7pQgTOTiMG9fIEbBkkKVT/cw+Q9leyR12OYBIU9JbyrEQTbWedrtIdr
   xjIlMKkiANC5shLq4oOFItGIYXwofkeOSrPhBsd4veKI02dCZHSc70od+
   qj+kAmuXAsxQCxVxo1I7mp6fUFvTrKTVZg+Th4vv/ahfZXY22fXC8ZWkA
   00ewIQMa4Hk1NkH0tD6cDaFmyjNeU0K93P+F/mvczWCu5B/Ah8EviVd+i
   w==;
X-CSE-ConnectionGUID: ZkOmp7XQQA2/UBMFS3HMbw==
X-CSE-MsgGUID: vzpCmKQeSc+TyLEzkKa+OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54636560"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54636560"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 02:22:43 -0700
X-CSE-ConnectionGUID: 0XF/8AydR1CqPcKWPTQwqA==
X-CSE-MsgGUID: 4TVITvd0TLeYss2POcAPrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="161486634"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jul 2025 02:22:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubbrz-0009u3-1x;
	Tue, 15 Jul 2025 09:22:39 +0000
Date: Tue, 15 Jul 2025 17:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/sm8750-integration-and-todo 14/16]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match
 any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
Message-ID: <202507151717.boyW74T0-lkp@intel.com>
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
head:   4d24890b0a35a7b59236f86da7fcbb2e1b4c2cb7
commit: 5f9f59f351915ab223feb465fca984d46b1f13ca [14/16] arm64: dts: qcom: sm8750: Add PCIe PHY and controller node
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151717.boyW74T0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151717.boyW74T0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507151717.boyW74T0-lkp@intel.com/

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
