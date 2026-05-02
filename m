Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ACD298CA3
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777701849; cv=none; b=D+LmNccZxgsdpLe2CkJs+T2+SPhpVMzKzyuqonUkLlLZhLpkqhvfZpXI1BPX3RjzdWujs+jQkr8RL7PRfaYa/gkihxOVnhbfaJv9Dt9n+T47clREZcbs7JElDQramOjbzL1pH585m8ZUhtyAcN5o0b+HQYejo2++/RQf6u0Kpl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777701849; c=relaxed/simple;
	bh=5jNztUR6+S9Lf+MnmqwH5lQ17Hv8rBBQWq9YNFAsf1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=imkN2jdguVz8RmEEEYtqjSeHlqWTbibp2UNYoaPtSd87PSEXEbHuw/fdTthVygVK0Vo9fje3zhFQcunLzl5W4Eqe9qxBEEq5fOjmKhfUYSnBGeC+tOjeunTOJsjCTNEkV9ufknJQf4UMvOVzCbE544gST9WfvC7pwKbhm79DCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brJumxKa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brJumxKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777701847; x=1809237847;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5jNztUR6+S9Lf+MnmqwH5lQ17Hv8rBBQWq9YNFAsf1o=;
  b=brJumxKa039UICBvV8KCxs13KsxF3cv/4H1OvS/fh58UfTSuXfzb70wA
   YWluxWJFnCQUVYYC1W63M4oDBxtFMOXDdb+fmdE+OOKi2zklH3E/reQ/J
   sLWn3qfYZhSSd3VBPc+NAjHiHkFjhSgNdiHbg+QKtssDeZIiv7ezw12cO
   LP2H5vrK+FAbAxvYi+xCYhYnmx56Haq1oO7RDBTUgLQNN/3vJ6BROpNhk
   k3IfMwpQypWesROnHbweMYK13ipR/Na+a6X/Z7YsPgGlhaW0cZpmoROK1
   SVDfYSl4uCwlmUS7UDa1X/BAFb+pJAy9OdUzKNMrz50q1p5MJ/tJEqvZc
   w==;
X-CSE-ConnectionGUID: 3znNU2QCRDqWb8v0chaXWA==
X-CSE-MsgGUID: 7YwnkgSvQY2AZ1W1OysW2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="88962172"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="88962172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 23:04:03 -0700
X-CSE-ConnectionGUID: YF6suZK+TwKf3n1eylZUog==
X-CSE-MsgGUID: jeDtCMSwTXynAos9XnnYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="230683903"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2026 23:03:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ3SH-000000005D1-01Zt;
	Sat, 02 May 2026 06:03:57 +0000
Date: Sat, 02 May 2026 08:03:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000
 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
Message-ID: <202605020858.4ynUgWe7-lkp@intel.com>
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
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: b1e157c61db5e6f8d9c35e8ebc714ab6ce02ee41 arm64: dts: mediatek: mt81=
88: Describe SCP as a cluster with two cores
date:   1 year ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/arc=
hive/20260502/202605020858.4ynUgWe7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260502/202605020858.4ynUgWe7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b1e157c61db5 ("arm64: dts: mediatek: mt8188: Describe SCP as a clu=
ster with two cores")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605020858.4ynUgWe7-lkp@intel.com/

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
