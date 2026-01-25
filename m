Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6110F2
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 03:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769311447; cv=none; b=TFAq2cD9TgqmOw7kAjucXK9WZzto1dAiLaTewrdrFXEuEDH4eUSnLhZQGesRBsPJvkpYmiTipumNgPn5ZhBxxcFLUEq9jv3ICRGvkX1PZWrEdPMoKGwwsHTa0EigucSSyx505cs+Xr/Bshg+jro7eaxWIXupIz/Ku0WG261dg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769311447; c=relaxed/simple;
	bh=cQLye+iVeCY+rLuuE+FmVR9KBSkkpDIP0aKM8FHil1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O0iq8bXHMQF7x6EjQfkBVku3J1pX/K02/nEey68HLXyuyWhsWOjtWRSzFVlk/HlEkoUx1vZbFVxwJ7V/QJtipLizT8Du0MqyE+J3lGa+4+TTDhQ8UCon52J29XoQa4991EkVvtWk3AP7BVllILgyNxAYz969YeYyDJqcZGP0h8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UK4s9Ana; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UK4s9Ana"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769311445; x=1800847445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cQLye+iVeCY+rLuuE+FmVR9KBSkkpDIP0aKM8FHil1k=;
  b=UK4s9AnarxMxsWX3OAyDQ1cfMaLo4v5kleKYo+nvtLRjKzZlpCZcaaih
   vxsggp6RiySLNhs2jYN73S/FwgLuQRY5x95r8mZTglOj+0Brjnn3yDlS9
   Nd2sUkCpVGQZwQSS+C5t0Sl0I0egkFHYPBBHh7CX9xEX3xc5CR59QQii4
   PwdrQNXMsCsnaIUoYBPnN616J6sMILTbWgKZR0x1+NUNhi1QkkczpEBWX
   9uxz4Kr0hVxGWld1RNaddsdzdSMFign0FvP3lRFbcecvC8XFLqz4gbT8E
   90EeYJM77U6ghyaOQyMcepso55Z9ei/Q/fc2Hh4F0ZXu8GipzIm1iKXJE
   w==;
X-CSE-ConnectionGUID: QjNkLoB+SDOKMvIABkZNdA==
X-CSE-MsgGUID: wuBhraI1SsmIJHEHN28Atw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81236191"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81236191"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:24:04 -0800
X-CSE-ConnectionGUID: QoqZ9uZAR46aUONy3Pp9dg==
X-CSE-MsgGUID: mtbXgrQ6SxSVlCK989Snig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="244986663"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 Jan 2026 19:24:03 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqjH-0000000017l-4BdI;
	Sun, 25 Jan 2026 03:24:00 +0000
Date: Sun, 25 Jan 2026 04:23:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb:
 scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is
 too short
Message-ID: <202601250419.ShSVuyiQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Tinghan Shen <tinghan.shen@mediatek.com>
CC: Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5dbeeb268b63ea2d9795b3e5e8ffb48c236f5bb0
commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41 arm64: dts: mediatek: mt81=
88: Describe SCP as a cluster with two cores
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/arc=
hive/20260125/202601250419.ShSVuyiQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260125/202601250419.ShSVuyiQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250419.ShSVuyiQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14, 1],=
 [121, 16, 1], [121, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[121, 13, 1], [121, 14, 1],=
 [121, 16, 1], [121, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (=
ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14, 1],=
 [118, 16, 1], [118, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
