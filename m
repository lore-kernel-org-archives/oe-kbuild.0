Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00B2DC35E
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Jul 2025 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978566; cv=none; b=DlW3TjF1FFKUX2jQgsDKFmodjANL+64a/Q4NabLqSwKTy1dGMyOd7F/Hpnw61BNyiyu2Pg+eaDqz6SQCOUymQ+16tSE+PqcyUqojKrcee8Iw4oP7tG6IhrHvBguo64Vc4GTRlnjYOVVz7zxV+vat+IQ6Swu9tWVnT1GZzBYewWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978566; c=relaxed/simple;
	bh=a/PgoCLWVGlONMNw3S8L09VWU3LGrIGI2FJO8Uu3oDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZRWgDrf2tIU9GzgMxoav2mf6rS6AUvkvKP7yDcL+R5czELz+ERIrFH/87NFHbMQwMMGPbGm25XDJts7+pgn9FV6iFTcwD1eXH1LJo17XsLer6rlwigOpzewxv3a++a3Pya1wp9VjOPqF8wzc1Q8UlBiwqWLTUbmWz50hOubJOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSa0Lspn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSa0Lspn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751978564; x=1783514564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a/PgoCLWVGlONMNw3S8L09VWU3LGrIGI2FJO8Uu3oDM=;
  b=VSa0Lspn+U5DgGl8KTd/eJGvFQYG8NkMG1Fpwuei+9DBexg0tKQlhhfY
   xDiug48CDYvX4B5fTwWt96YjermrKggyiXFeLbDbwb9rP2K1/7cXk1Bys
   qv3CBTGWnPANqUj8eZbeIKywrCmUgHLCMWK5/Tf6rC2c2eMsVS2DxSzKt
   cSayAZcA6Y91Y3/8Dw3bXXGwDBa3e+tIBpP1NDML7THsaLNbjnJIPGsiU
   +PK0QNERw81BOozLISQvKvdAmR4SZ7Gm2dM+u9vsSMWhVNH1XGTdWCVFN
   RppcvOgHPrAVYy2O8oWOwaXYA6AKHFT7zcFxgp2hmC9NkB0GA9UADKRzc
   A==;
X-CSE-ConnectionGUID: UvZKCrNmTXmlsUwLd+hsOg==
X-CSE-MsgGUID: QMFm21f+SmqZIwlErRxDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41837553"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="41837553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 05:42:43 -0700
X-CSE-ConnectionGUID: Algyau7dTieoQhBbBgRe6Q==
X-CSE-MsgGUID: Lu7df6g8THWDKEIzW9r/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="192667327"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jul 2025 05:42:41 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZ7eh-0001RX-1J;
	Tue, 08 Jul 2025 12:42:39 +0000
Date: Tue, 8 Jul 2025 20:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 10/10] arm64: dts: mediatek: Convert all SoCs to use
 access-controllers
Message-ID: <202507082005.V4y1JCN0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250707105605.98248-11-angelogioacchino.delregno@collabora.com>
References: <20250707105605.98248-11-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: linux-mediatek@lists.infradead.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: matthias.bgg@gmail.com
CC: angelogioacchino.delregno@collabora.com
CC: ulf.hansson@linaro.org
CC: y.oudjana@protonmail.com
CC: fshao@chromium.org
CC: wenst@chromium.org
CC: lihongbo22@huawei.com
CC: mandyjh.liu@mediatek.com
CC: mbrugger@suse.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: kernel@collabora.com
CC: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next krzk-mem-ctrl/for-next linus/master v6.16-rc5 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-memory-mtk-smi-Document-access-controller-cells/20250707-185916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250707105605.98248-11-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 10/10] arm64: dts: mediatek: Convert all SoCs to use access-controllers
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-052-20250708 (https://download.01.org/0day-ci/archive/20250708/202507082005.V4y1JCN0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507082005.V4y1JCN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507082005.V4y1JCN0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1244.7-1252.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1244.7-1252.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): #access-controller-cells: False schema does not allow 0
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8188-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mailbox.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
