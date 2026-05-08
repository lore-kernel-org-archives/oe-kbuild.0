Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EF52C21C5
	for <oe-kbuild@lists.linux.dev>; Fri,  8 May 2026 03:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778210632; cv=none; b=AsRxjZ/DXDB3chnTHmuZfvGuqcDJoesNOqUeYAsY5WaN+c5L4Vx8hgESHvfdh6vm+bvP/ueFGAAx0P2jcJgSg8aL1H4IK+SDf5wuglrtUfv1jWrIxdXHyO3Bw3UUKXLElwvNYckMF55zqzFB/Zx6eQ8txkYaEZtm3E0owBbT2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778210632; c=relaxed/simple;
	bh=4UzruZkjFVu8lEBEC4gULEOHuB4v8MYNfscEPPtNwX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KRudyx5y0SAQa+M1VTO+UFauF3lPTo5ag5zN+zhP91nU731ePHZ5QvGI7YnzCh/2a0CcxrtZO9QB9ObG6xuGBAo3+cHiGGerpyEuqnHdZaYwVnlksUBlCXDgAxrcskAA+LcZJ7/pm3u9TeGE1pLoTJGcKsScLxAe34XstT/Q5EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbrvZ7jQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbrvZ7jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778210630; x=1809746630;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4UzruZkjFVu8lEBEC4gULEOHuB4v8MYNfscEPPtNwX4=;
  b=UbrvZ7jQVe+7ZXC0AvZl5bfLFpxgHlLzAUJkJS/2kGgclA6+6EqbsahD
   9VK9CHlFB1YUVAWc2VnGZgugt0/ToIEfvNGNG2Zg0oNSQ4v8YWMDLnM1h
   edYih0/+SYUjW4MJyKVa0wE8SzyoNHwitdW+j+8QPHvyKaSaCCXZLk/n5
   To3fJODE/RB+/v5OW62iJF7QQ8vnP8jeM9Mwz3xIC4o2lInc5e9T+pkrq
   QoFd1KGfSuBnW8t656NfmA0ZSpZyVZjAUYqZRmMrTiAS0Mh9YcYw+SMtR
   AEWtVPFRNNaCln1uyHmcI0AEl2TK8TEqs4/erqfk7og5unnQyz4V4z21Y
   g==;
X-CSE-ConnectionGUID: zmd+WQUPQJSsF90Ehi6wKQ==
X-CSE-MsgGUID: 9YA7LY7ETP6NLXvB/MVyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79281345"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79281345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 20:23:50 -0700
X-CSE-ConnectionGUID: M8OKTRaMT7ezSC72WZj2mA==
X-CSE-MsgGUID: jxLbyC97To+80nI6FmCrlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="238433948"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 20:23:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLBoZ-00000000753-00yT;
	Fri, 08 May 2026 03:23:47 +0000
Date: Fri, 08 May 2026 05:23:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb:
 scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is
 too short
Message-ID: <202605080545.PGO57Nqr-lkp@intel.com>
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
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41 arm64: dts: mediatek: mt81=
88: Describe SCP as a cluster with two cores
date:   1 year, 1 month ago
:::::: branch date: 11 months ago
:::::: commit date: 1 year, 1 month ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/arc=
hive/20260508/202605080545.PGO57Nqr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260508/202605080545.PGO57Nqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b1e157c61db5 ("arm64: dts: mediatek: mt8188: Describe SCP as a clu=
ster with two cores")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605080545.PGO57Nqr-lkp@intel.com/

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
