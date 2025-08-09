Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB01B0439
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754755939; cv=none; b=q4JNwxmbFtgx9M8Q/9UJfqITl6SVUBmbGhujJm+SwB6h9q1h5RjGTB09GVt4IHzO1+eN6CMYudHX3VjGhypccbhHgoBLi4etbidtB/bJdH7y3Zs3r5H9uOeBX72SeiIrACr6+VwmxbRyp0/sJW6cGM3cBXU+ZgSVWp6D7A1LmZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754755939; c=relaxed/simple;
	bh=uKMbDN+smIKQNtNXV8tbOr9mbL4/jx+M813NW0TbhGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSfl1qvRWbu2f8Zs8p/zL5uczcir4nXAzZcy1kdj/Ms4rhCewO/32UCkPESHE8U9FszwH+dPORXCMf3cYb1knJAloY7D38PuvzI5k/m3lSmvtEbkgNKrSpXdw5GpUXzprEepZDKPjwS7r/iEvzJ4FH/d4/n/gMINx5cU5rFxw7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyzD3ZKP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyzD3ZKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754755936; x=1786291936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKMbDN+smIKQNtNXV8tbOr9mbL4/jx+M813NW0TbhGI=;
  b=VyzD3ZKPmC9u/pyaGfKXPdw3SRJNWWOK05ezKAuH3htsD+hUpKvT+0VU
   FEY4aeB0yj+zZ5Cab/xsmGsuP93cKG1iOm4AlVkA31Zbt1KNj9NVFwoZc
   ebFCSSNWqjyps1YBYZn42xIo+lzXr/cqRZsgerzVS+OsvgPfVRd4hVTUP
   pm3drczbuxtG/dJkUJzo6WG3+RDQyA6dOVArzh83UVT/A3Cudu23F1Bbo
   +aBoLvqtOkZZL5ZlBSry2fTeouuT1npAI1AZkXPyiPnHgVFMZXVhmC4Sj
   85zspjswGqHvLPZiJFyss+wrOxicRg284Q3Y0KsN3IDX5PIyyrN7oXqE3
   A==;
X-CSE-ConnectionGUID: SEjiS+ZOQL+v1F3c5Qo6pQ==
X-CSE-MsgGUID: 1bFdGG/uRhipX0nsraCrkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60877035"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60877035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 09:12:15 -0700
X-CSE-ConnectionGUID: 7WkMG9RfTKqHsypH80yl1w==
X-CSE-MsgGUID: HonW/XllSdOzCD2ZlJ5YcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165917948"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Aug 2025 09:12:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukmB1-0004ue-1B;
	Sat, 09 Aug 2025 16:12:11 +0000
Date: Sun, 10 Aug 2025 00:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 510/801] arch/powerpc/boot/dts/fsl/p2041rdb.dtb:
 dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@40000',
 'dcsr-cpu-sb-proxy@41000', 'dcsr-cpu-sb-proxy@42000',
 'dcsr-cpu-sb-proxy@43000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0',
 'dcsr-nal@1800...
Message-ID: <202508100019.J8eNzAP4-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: d6b7d867d8a9e36b7f9957a1466add7368af54d2 [510/801] dt-bindings: powerpc: Convert fsl/fsl,dcsr to DT schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250810/202508100019.J8eNzAP4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100019.J8eNzAP4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508100019.J8eNzAP4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041si-pre.dtsi:45.10-83.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /: failed to match any schema with compatible: ['fsl,P2041RDB']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: / (fsl,P2041RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: / (fsl,P2041RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: aliases: 'phy_rgmii_0', 'phy_rgmii_1', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_sgmii_2', 'phy_sgmii_3', 'phy_sgmii_4', 'phy_xgmii_2', 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@40000', 'dcsr-cpu-sb-proxy@41000', 'dcsr-cpu-sb-proxy@42000', 'dcsr-cpu-sb-proxy@43000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p2041-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p2041-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p2041-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p2041-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p2041-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p2041-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/p3041si-pre.dtsi:45.10-84.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /: failed to match any schema with compatible: ['fsl,P3041DS']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: / (fsl,P3041DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: / (fsl,P3041DS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: aliases: 'emi1_rgmii', 'emi1_sgmii', 'emi2_xgmii', 'phy_rgmii_0', 'phy_rgmii_1', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_xgmii_1', 'phy_xgmii_2', 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@40000', 'dcsr-cpu-sb-proxy@41000', 'dcsr-cpu-sb-proxy@42000', 'dcsr-cpu-sb-proxy@43000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p3041-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p3041-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p3041-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p3041-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p3041-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p3041-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/p5020si-pre.dtsi:45.10-90.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /: failed to match any schema with compatible: ['fsl,P5020DS']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: / (fsl,P5020DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: / (fsl,P5020DS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: aliases: 'emi1_rgmii', 'emi1_sgmii', 'emi2_xgmii', 'phy_rgmii_0', 'phy_rgmii_1', 'phy_sgmii_1c', 'phy_sgmii_1d', 'phy_sgmii_1e', 'phy_sgmii_1f', 'phy_xgmii_1', 'phy_xgmii_2', 'raideng_jr0', 'raideng_jr1', 'raideng_jr2', 'raideng_jr3', 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@40000', 'dcsr-cpu-sb-proxy@41000', 'dcsr-ddr@12000', 'dcsr-ddr@13000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p5020-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p5020-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p5020-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p5020-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p5020-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p5020-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi:45.10-96.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /: failed to match any schema with compatible: ['fsl,P5040DS']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: / (fsl,P5040DS): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: / (fsl,P5040DS): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: aliases: 'hydra_rg', 'hydra_sg_slot2', 'hydra_sg_slot3', 'hydra_sg_slot5', 'hydra_sg_slot6', 'hydra_xg_slot1', 'hydra_xg_slot2', 'phy_sgmii_slot2_1c', 'phy_sgmii_slot2_1d', 'phy_sgmii_slot2_1e', 'phy_sgmii_slot2_1f', 'phy_sgmii_slot3_1c', 'phy_sgmii_slot3_1d', 'phy_sgmii_slot3_1e', 'phy_sgmii_slot3_1f', 'phy_sgmii_slot5_1c', 'phy_sgmii_slot5_1d', 'phy_sgmii_slot5_1e', 'phy_sgmii_slot5_1f', 'phy_sgmii_slot6_1c', 'phy_sgmii_slot6_1d', 'phy_sgmii_slot6_1e', 'phy_sgmii_slot6_1f', 'raideng_jr0', 'raideng_jr1', 'raideng_jr2', 'raideng_jr3', 'rtic_a', 'rtic_b', 'rtic_c', 'rtic_d', 'sec_jr0', 'sec_jr1', 'sec_jr2', 'sec_jr3', 'sec_mon' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@40000', 'dcsr-cpu-sb-proxy@41000', 'dcsr-cpu-sb-proxy@42000', 'dcsr-cpu-sb-proxy@43000', 'dcsr-ddr@12000', 'dcsr-ddr@13000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p5040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,p5040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,dcsr-npc']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p5040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,p5040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p5040-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,p5040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: / (fsl,T1023RDB): memory: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: / (fsl,T1023RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: board-control@3,0 (fsl,tetra-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,tetra-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,tetra-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,tetra-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,tetra-fpga', 'fsl,fpga-qixis']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'bank-width', 'compatible', 'device-width', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t1024-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1023-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1023-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1023-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   		'fsl,t1040d4rdb-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t1040d4rdb-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t1040d4rdb-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): cpld@3,0: Unevaluated properties are not allowed ('compatible', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /localbus@ffe124000/cpld@3,0: failed to match any schema with compatible: ['fsl,t104xrdb-cpld', 'fsl,deepsleep-cpld']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t1040-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t1040-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t1040-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t1040-dcsr-ocn', 'fsl,dcsr-ocn']
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000', 'dcsr-snpc@32000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   		'fsl,t2080-cpld' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,t2080-cpld' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): board-control@2,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /localbus@ffe124000/board-control@2,0: failed to match any schema with compatible: ['fsl,t2080-cpld']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000', 'dcsr-snpc@32000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-ddr@12000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000', 'dcsr-snpc@32000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t2080-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t2080-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t2080-dcsr-ocn', 'fsl,dcsr-ocn']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /dcsr@f00000000/dcsr-ddr@12000: failed to match any schema with compatible: ['fsl,dcsr-ddr']
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0 (fsl,t4240qds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /localbus@ffe124000/board-control@3,0: failed to match any schema with compatible: ['fsl,t4240qds-fpga', 'fsl,fpga-qixis']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-cpu-sb-proxy@120000', 'dcsr-cpu-sb-proxy@128000', 'dcsr-cpu-sb-proxy@130000', 'dcsr-cpu-sb-proxy@138000', 'dcsr-cpu-sb-proxy@140000', 'dcsr-cpu-sb-proxy@148000', 'dcsr-cpu-sb-proxy@150000', 'dcsr-cpu-sb-proxy@158000', 'dcsr-ddr@12000', 'dcsr-ddr@13000', 'dcsr-ddr@14000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000', 'dcsr-snpc@32000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t4240-dcsr-ocn', 'fsl,dcsr-ocn']
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: / (fsl,T4240RDB): memory: False schema does not allow {'device_type': ['memory']}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: aliases: 'sgmii_phy21', 'sgmii_phy22', 'sgmii_phy23', 'sgmii_phy24', 'sgmii_phy41', 'sgmii_phy42', 'sgmii_phy43', 'sgmii_phy44' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000 (fsl,ifc): 'nor@0,0' does not match any of the regexes: '(flash|fpga|board-control|cpld)@[a-f0-9]+(,[a-f0-9]+)+$', '^nand@[a-f0-9]+(,[a-f0-9]+)+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: dcsr@f00000000 (fsl,dcsr): 'dcsr-corenet', 'dcsr-cpu-sb-proxy@100000', 'dcsr-cpu-sb-proxy@108000', 'dcsr-cpu-sb-proxy@110000', 'dcsr-cpu-sb-proxy@118000', 'dcsr-cpu-sb-proxy@120000', 'dcsr-cpu-sb-proxy@128000', 'dcsr-cpu-sb-proxy@130000', 'dcsr-cpu-sb-proxy@138000', 'dcsr-cpu-sb-proxy@140000', 'dcsr-cpu-sb-proxy@148000', 'dcsr-cpu-sb-proxy@150000', 'dcsr-cpu-sb-proxy@158000', 'dcsr-ddr@12000', 'dcsr-ddr@13000', 'dcsr-ddr@14000', 'dcsr-dpaa@9000', 'dcsr-epu@0', 'dcsr-nal@18000', 'dcsr-npc', 'dcsr-nxc@2000', 'dcsr-ocn@11000', 'dcsr-rcpm@22000', 'dcsr-snpc@30000', 'dcsr-snpc@31000', 'dcsr-snpc@32000' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,dcsr.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-epu@0: failed to match any schema with compatible: ['fsl,t4240-dcsr-epu', 'fsl,dcsr-epu']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-npc: failed to match any schema with compatible: ['fsl,t4240-dcsr-cnpc', 'fsl,dcsr-cnpc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-nxc@2000: failed to match any schema with compatible: ['fsl,dcsr-nxc']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-corenet: failed to match any schema with compatible: ['fsl,dcsr-corenet']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-dpaa@9000: failed to match any schema with compatible: ['fsl,t4240-dcsr-dpaa', 'fsl,dcsr-dpaa']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /dcsr@f00000000/dcsr-ocn@11000: failed to match any schema with compatible: ['fsl,t4240-dcsr-ocn', 'fsl,dcsr-ocn']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
