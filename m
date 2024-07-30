Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD719580A
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 13:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347802; cv=none; b=d2BU6vzoFsX/lpUmmgK2tpf5m88Uair5kkYF/sEtOD71C+2fcESlD0J1umSyDSRucdg6m5G4sl5yLrZBuSQjBl92WiLDhzNqZG5VBC95qOioWZ9Ewh4kGnfc3r/HTgX3s80J8MXHtaNy2yJWExqCyHC37kdV0ug/5hIdp7xWL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347802; c=relaxed/simple;
	bh=/DkolSxg/tcMFnR38Km9GEn5r/2pPa8kfq9j6DNyR5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0+F9UtwGM+5V1gsw4pxjKdDjad5HNs63tBM/8FARDpBMvWcg8nEqpWWpx1VYjedl2BsCYw8t5G7TxoJi60u0eObR3VFRwLYUf616jyki1uw4z1N3O4scz3yA1MCXEemPevjjz/xxjbzxmTQ5fxv2kIPPQeUkkvPIadiY97SmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/bS1IZ8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/bS1IZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722347800; x=1753883800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DkolSxg/tcMFnR38Km9GEn5r/2pPa8kfq9j6DNyR5o=;
  b=c/bS1IZ8IJ25yqBOs6dsLN2QdX5ZDLpn5khWW/Cd9sNSprbnng2yEWbr
   2M+HVNEeW9/AC2prYNwHWJIddYFgW1v0osiyiIQe4t1J4ZwVDTVz6+ZJP
   Dlh+xOzEQzzsIIqUv41Ke3f+knJ3PpIWp3RppwqZDraF3PZj/Da04oU6y
   CeJtNq9VR5TRGjKSeYWe9W/EfshmsiVxTmuuviDhanUNATVOhRx2utXQa
   Z2iG7ZUrFCkbuUS+kLSb3nEvp6DCgRkblhpt9GXi/Pb8ezbLOVtC6ZcKt
   FM3QHbjVD0jA1/MuWK45GariCAB4z53FAM3IWry56S6sRmTLfi0JT8On4
   A==;
X-CSE-ConnectionGUID: xm+xOwpRSCe9crues5Rx6A==
X-CSE-MsgGUID: nHXQYMBFTyCKUXECrMVmnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19863469"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19863469"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 06:56:40 -0700
X-CSE-ConnectionGUID: MEkxvkBlTD6e0vsGewEuXg==
X-CSE-MsgGUID: 7/+QHK1zTvKFBVhZrdyP3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54242655"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2024 06:56:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYnLA-000svB-2v;
	Tue, 30 Jul 2024 13:56:36 +0000
Date: Tue, 30 Jul 2024 21:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.12 16/16]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000:
 compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742',
 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745',
 'renesas,pwm-r8a77470', 'renesas,pwm-r...
Message-ID: <202407302140.IwBrMm7D-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Khanh Le <khanh.le.xr@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
head:   ca999750b95caf4829dbd89ecff5c673107d257c
commit: ca999750b95caf4829dbd89ecff5c673107d257c [16/16] arm64: dts: renesas: r8a779h0: Add PWM device nodes
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-randconfig-051-20240730 (https://download.01.org/0day-ci/archive/20240730/202407302140.IwBrMm7D-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302140.IwBrMm7D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407302140.IwBrMm7D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1014.12-1024.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1042.12-1052.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1070.12-1080.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1098.12-1108.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1126.12-1136.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1154.12-1164.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1182.12-1192.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1210.12-1220.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1787.12-1797.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e31000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e32000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e33000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e34000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
