Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9E2D3A7C
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629491; cv=none; b=ZiziraXDlhqmf7UwCgK8ZcvbVneZjvJi4LJN0XyqiHGygOXVOJ9idGm/ZrQjv1JI6rP/XlPsPgx7exqYJi/RpOGJKHeDXEwfp8gvZFmVCV8IxVOk7v6mkqSEip2YlF9tRYkXNMgPcNLmpVELJZ8fBKE6iZ6FiTRqG1HBvIzErHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629491; c=relaxed/simple;
	bh=tj4f2KpZpO35OjCw6KwFCSBsUxxCPH9XftIL9nUslK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EH0MczrLNkw4Tkpda9rKN8yxgjdLcrTEhAVUOWgM+tsfi72kjdn5UrhCn2HOMxgFMWMJD0ktU5q0hOAmktxIPDHNvZeCzSK4S2MpRO8HsqjH1AcBvVKEL/2SNmTNwYfSbhXegDzbc4QjNqCIJtpdn7xeUBIAhiPojC/I+cjx1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RxmZ0XQU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RxmZ0XQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751629489; x=1783165489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tj4f2KpZpO35OjCw6KwFCSBsUxxCPH9XftIL9nUslK4=;
  b=RxmZ0XQUmMjqKWPS6c7MCu26G6HhV/5lMXKAZFUpzln9w9hXyX9rTIGV
   Fg+zxfhF4eX3MiL3K6kWASVCc4YUKBP2/AFUZ8tdx3tQaTZlfYPYHFWrJ
   Wmx1X9jK1Pn1b6EWimgBV6g/Jnc9++sW3rc+EHiP9YrtP+BAHWF40JNj6
   txYy8ZfI2fieAkemyGvdfuX1ybp0KhVuQ9OqZISd8GzSqKgSu5QzbHU+W
   7T2WXUcjUHdaYgOxThQmRSRF86kzZxJXXT6QBO8MsuxV3h89jb3W49YeS
   H+63K8ZW6mJc5aodfX0jWcEuPXPZ8OIiPqtmDlZnZNFRhMro3AoO3Xdxe
   w==;
X-CSE-ConnectionGUID: WdEIEK1bQ2eHfFcUn7Wxkg==
X-CSE-MsgGUID: 8JaQEd22TVOhKP//FDpXIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79404127"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="79404127"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 04:44:46 -0700
X-CSE-ConnectionGUID: 8cheZBEfSMyTI6RVkCn7RQ==
X-CSE-MsgGUID: qek5tvekTtmrxmikZpGnSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154709740"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2025 04:44:45 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXeqR-0003el-1H;
	Fri, 04 Jul 2025 11:44:43 +0000
Date: Fri, 4 Jul 2025 19:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 10/10] arm64: dts: mediatek: Convert all SoCs to use
 access-controllers
Message-ID: <202507041904.og7ttZ0c-lkp@intel.com>
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
In-Reply-To: <20250703110247.99927-11-angelogioacchino.delregno@collabora.com>
References: <20250703110247.99927-11-angelogioacchino.delregno@collabora.com>
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

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next krzk-mem-ctrl/for-next linus/master v6.16-rc4 next-20250703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-memory-mtk-smi-Document-access-controller-cells/20250703-190843
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250703110247.99927-11-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 10/10] arm64: dts: mediatek: Convert all SoCs to use access-controllers
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-051-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041904.og7ttZ0c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041904.og7ttZ0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507041904.og7ttZ0c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'LDO1-IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (realtek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (realtek,rt5682i): 'LDO1-IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1244.7-1252.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1119.7-1127.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1244.7-1252.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: syscon@10001000 (mediatek,mt8188-infracfg-ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator (mediatek,mt6360-regulator): 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[123567]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3001.17-3058.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3075.17-3111.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3319.22-3331.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: syscon@10001000 (mediatek,mt8195-infracfg_ao): '#access-controller-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt8195-sys-clock.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
