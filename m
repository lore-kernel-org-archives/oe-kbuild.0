Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE68E552
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Mar 2025 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742366875; cv=none; b=uBm8h9oiBvIrZktiOIhgBr9cmFlGO4rk2Eg3+Yscwd+soQm0L+SEpmzdhtzIYbfSfYZh3uW2cqynz0b4ytYRs/Ad3H+vEnK9Vw5CDpSx4S03hZxJXtUDSzASGUIlDPfO+fGBmTUGrp9hPebeLGk05uU4y/9niAIDywpEzNWZw0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742366875; c=relaxed/simple;
	bh=mZLC8HM2TtZQoXgpxYsY2LRKY6Sj6o4PoVyYbitG8bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5knmi/YV8B7SM6UNOwigLbqUBV+cpjLUjAXAF860L1K/ytqsE9Dowz1JDtnxLIuN9uhUfXCBgDmCjH2TvK04clP49JVrD+03Wbd8euVKIENrr/1VOCzuT4gWx6PQj6Vt0MOjW22wHVjOmiyAugBY5Va0F9bTIYeSXdm5GM+GNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VixIX8HK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VixIX8HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742366873; x=1773902873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZLC8HM2TtZQoXgpxYsY2LRKY6Sj6o4PoVyYbitG8bw=;
  b=VixIX8HK6XXwTXb68f43zjuabcIFCdDNVQQ7fZDAEalxIPY94A8y5pw0
   Mb+n9HU90GzMRz52Ojvfw7NElIh2dPXy8Xs0yRXHq4ZKARK8XZdvtdlF8
   xKrxc2EHf+l1C2ziXw0NdoyJ/iEN1Z/4ynfsWB9nKW0yA1V89JbDExr0k
   DRSd4idWK/MjZVNfe7bhhimKdOKW4mNSydjdUiOrZkmxqWcI5fG3of2Bo
   JOBJBTt3Z7HDViklMwpJPs4DzHfT2yCjweYtWzlxZKz69uS3U85cnIj8m
   b8oKQCAHNVyej6Q8maig9FKXzPk0r7spSBxe2hQ/cTsEk4w7o4LG3s7hN
   A==;
X-CSE-ConnectionGUID: UnGUpqaPRYyLQRCVgjqAzQ==
X-CSE-MsgGUID: sAKG3UEERQ21FY6UdTVugg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43271913"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43271913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 23:47:53 -0700
X-CSE-ConnectionGUID: kPlqvXiNSgaImM7hKdYIPw==
X-CSE-MsgGUID: a9atLyaER6qM9fGKtWMyhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122419020"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Mar 2025 23:47:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tunDR-000ERW-2M;
	Wed, 19 Mar 2025 06:47:49 +0000
Date: Wed, 19 Mar 2025 14:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-18-2 11/11]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:593.19-599.4: Warning
 (spi_bus_reg): /soc/spi@e6ea0000/port: missing or empty reg property
Message-ID: <202503191453.dfVnJ9lS-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-18-2
head:   920e565f45c3b4a2065fdab49586b975b90f1712
commit: 920e565f45c3b4a2065fdab49586b975b90f1712 [11/11] arm64: dts: renesas: sparrow hawk: Add MSIOF Sound support
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-003-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191453.dfVnJ9lS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503191453.dfVnJ9lS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503191453.dfVnJ9lS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:593.19-599.4: Warning (spi_bus_reg): /soc/spi@e6ea0000/port: missing or empty reg property
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1262.24-1276.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6ea0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1357.12-1367.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1386.12-1396.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1415.12-1425.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1444.12-1454.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1473.12-1483.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1502.12-1512.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1531.12-1541.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1560.12-1570.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +593 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts

920e565f45c3b4 Kuninori Morimoto 2025-03-18  584  
920e565f45c3b4 Kuninori Morimoto 2025-03-18  585  &msiof1 {
920e565f45c3b4 Kuninori Morimoto 2025-03-18  586  	pinctrl-0 = <&msiof1_pins>;
920e565f45c3b4 Kuninori Morimoto 2025-03-18  587  	pinctrl-names = "default";
920e565f45c3b4 Kuninori Morimoto 2025-03-18  588  
920e565f45c3b4 Kuninori Morimoto 2025-03-18  589  	compatible = "renesas,msiof-snd-r8a779g0",
920e565f45c3b4 Kuninori Morimoto 2025-03-18  590  		     "renesas,msiof-snd-rcar-gen4";
920e565f45c3b4 Kuninori Morimoto 2025-03-18  591  	status = "okay";
920e565f45c3b4 Kuninori Morimoto 2025-03-18  592  
920e565f45c3b4 Kuninori Morimoto 2025-03-18 @593  	msiof1_snd: port {
920e565f45c3b4 Kuninori Morimoto 2025-03-18  594  		msiof1_snd_endpoint: endpoint {
920e565f45c3b4 Kuninori Morimoto 2025-03-18  595  			remote-endpoint = <&da7212_endpoint>;
920e565f45c3b4 Kuninori Morimoto 2025-03-18  596  //			bitclock-master;
920e565f45c3b4 Kuninori Morimoto 2025-03-18  597  //			frame-master;
920e565f45c3b4 Kuninori Morimoto 2025-03-18  598  		};
920e565f45c3b4 Kuninori Morimoto 2025-03-18  599  	};
df1969bba83d97 Marek Vasut       2025-02-23  600  };
df1969bba83d97 Marek Vasut       2025-02-23  601  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
