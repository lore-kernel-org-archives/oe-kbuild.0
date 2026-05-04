Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFC335BA
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 02:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777860152; cv=none; b=f7bYhg5VrHZQXJf7J+vurOD59lVamdc1aX0BMlQ5iTj6sUFGjcVw+A2IaGxrXs0o97Q6ApZiof/n1xIgahSrtdYxqpzTNaeMlYItuWeU4OshpOf1DrYxKG37uGtHRFKDLu0KtbLZYUol2sPa54xB5m4CMTxqOHuklCB/Yivb4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777860152; c=relaxed/simple;
	bh=9Pt8nZUlC+McOLDVABJJJSQBOLAy3ZzdSzHe576OQjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VLJZt116zkvXdWFIFR1IWsD6yiHGUr5ps4l5jwWtYYI4BHeODacI8KCEVK+SxQt8yXy91R3yk8Yp84hETFkWTsCJpw7gmWPsvGXOU1lGbYmaC0ZWHvmgiGmFUfk2VgK1HFCY5P/CBDlU3R2DbmWOhrzJPLSRDBMXgkJu5h0/9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1hsAf4a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1hsAf4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777860149; x=1809396149;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9Pt8nZUlC+McOLDVABJJJSQBOLAy3ZzdSzHe576OQjc=;
  b=N1hsAf4auNOqEsDJR8rQGkqFubhXJhHkIo1EI3cWymzxtnpcl57UfvJp
   gx2pvUox16vaPiTX8Rm/8P+PmsfYHIU8YsAn3MUTDzgak1y/Cfr0TYybx
   tm6npxaRhROc2v+VT8UAKXveTmKwDfLek8DC0dgw1dFFIPRFVEX/yargb
   n3zAV4msNK6FmLmGovkUGDcSpqGUHHrlu2QdHRvvewN+KWtMQOaB56iYr
   GWlBPkAEO/W9yDO7p8R4RB9O8QqRopioF1ghgO+z7gWoGA9AjYX+SMpiL
   u1vhEa/bqGGKO1fuvrsMBHhppHIemZdiN0Buh+LnRJl/kMbO6+huMBrrH
   Q==;
X-CSE-ConnectionGUID: MxPE7yyjSSW5CZrRj/hX5Q==
X-CSE-MsgGUID: csEuqGyPTMKviH8cW7DrvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78819346"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78819346"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 19:02:28 -0700
X-CSE-ConnectionGUID: XC8bd2/YRdama8yaVop/Sw==
X-CSE-MsgGUID: QSLhfXtqQs2C2j2S452QVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="232747107"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2026 19:02:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJidc-000000005gH-3R72;
	Mon, 04 May 2026 02:02:24 +0000
Date: Mon, 04 May 2026 04:01:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000
 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
Message-ID: <202605040328.EEfGfXxm-lkp@intel.com>
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
head:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41 arm64: dts: mediatek: mt81=
88: Describe SCP as a cluster with two cores
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/arc=
hive/20260504/202605040328.EEfGfXxm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260504/202605040328.EEfGfXxm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b1e157c61db5 ("arm64: dts: mediatek: mt8188: Describe SCP as a clu=
ster with two cores")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040328.EEfGfXxm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#s=
ound-dai-cells', 'mt6359rtc' do not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): reg=
ulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (me=
diatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185], [34, 190], [36, 4],=
 [36, 41], [36, 42], [36, 7], [38, 41], [38, 42], [36, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (me=
diatek,mt8188-mdp3-rdma): mboxes: [[92, 13, 1], [92, 14, 1], [92, 16, 1], [=
92, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (me=
diatek,mt8188-mdp3-rdma): clocks: [[36, 24], [34, 185], [34, 190], [36, 4],=
 [36, 41], [36, 42], [36, 7], [38, 41], [38, 42], [36, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: dma-controller@14001000 (me=
diatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
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
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14, 1],=
 [120, 16, 1], [120, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[120, 13, 1], [120, 14, 1],=
 [120, 16, 1], [120, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[49, 24], [46, 185], [46, 1=
90], [49, 4], [49, 41], [49, 42], [49, 7], [51, 41], [51, 42], [49, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (=
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
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (=
ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14, 1],=
 [119, 16, 1], [119, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (=
ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[118, 13, 1], [118, 14, 1],=
 [118, 16, 1], [118, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
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
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
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
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek=
,mt6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (=
ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[119, 13, 1], [119, 14, 1],=
 [119, 16, 1], [119, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): clocks: [[48, 24], [45, 185], [45, 1=
90], [48, 4], [48, 41], [48, 42], [48, 7], [50, 41], [50, 42], [48, 8]] is =
too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: dma-controller=
@14001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional fail=
ed, one must be fixed:
--
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt=
6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185], [37, 190]=
, [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42], [40, 8]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[128, 13, 1], [128, 14, 1], [1=
28, 16, 1], [128, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): clocks: [[40, 24], [37, 185], [37, 190]=
, [40, 4], [40, 41], [40, 42], [40, 7], [42, 41], [42, 42], [40, 8]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed,=
 one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): regulators: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185], [39, 190]=
, [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42], [42, 8]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): mboxes: [[130, 13, 1], [130, 14, 1], [1=
30, 16, 1], [130, 21, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): clocks: [[42, 24], [39, 185], [39, 190]=
, [42, 4], [42, 41], [42, 42], [42, 7], [44, 41], [44, 42], [42, 8]] is too=
 long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma=
.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: dma-controller@14=
001000 (mediatek,mt8188-mdp3-rdma): compatible: 'oneOf' conditional failed,=
 one must be fixed:
   	['mediatek,mt8188-mdp3-rdma', 'mediatek,mt8195-mdp3-rdma'] is too long
   	'mediatek,mt8188-vdo1-rdma' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
