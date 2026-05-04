Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6A37F759
	for <oe-kbuild@lists.linux.dev>; Mon,  4 May 2026 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777891779; cv=none; b=WUUP+5lMcxhNFygchMWJbhts8ImHfHnBilHj2pXf2Mazr2GxuAuAPtIy2XRxcoxgajVlXA7hT2Q2KUF/4oMxb823dXwDtuFbuY+0+LvjdM3QqU01hzl7bxhcjXOzz7uiS35fnzebr/UT48cKw9taRPcL3NPNXEmZ2PfBzPuqfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777891779; c=relaxed/simple;
	bh=mi1J8a1C0ikytkgC6AA7A+OQ4nCSeBeCGvf38qSpRg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aW4/3oe5qC57bMQBXslh0Uk42NrIVYRIupF3QVEeNKKiPQRZqQZMOTBlwzk/SNUuOGRJPlDxysB1wZfqgaFUPfDzCNWiiQSztGLknZecccjQJhA10frEggI8dJ2KGDtLcQjo4nRU2i9AvTQjgL2MRnxx3sKSSZPQko+Cf/O3hrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+QHOdYD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+QHOdYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777891775; x=1809427775;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mi1J8a1C0ikytkgC6AA7A+OQ4nCSeBeCGvf38qSpRg0=;
  b=b+QHOdYDY7PE7YGCAMsgpFX9RCnZmgBgMHVGOPsnKkcvl1Rj18FbJZsh
   SA6VaaLviFRn1UxTq7fMt6PkDvmqK3oGOCxIkps0zq7/Hc6KySvrWKWA6
   5mG9uMypRJ6w6OgFk0q1IzQo3x4CAeWAmnyGPdejfkQ2Vw+bIVE/HdZFA
   PQGseYAgV6okAlqjwlWzNtVEQAdwBDQxH0+0QyYmVbmn6SWEYKa90FCOr
   jVvWewCixqdZC6Ykf4PpnPN5agpMixY9x3pWH5lr2jhqxBPanZnzkdBGc
   h9M9aYLo+D+ssO8THnBhDccINk2N0qvjqRTL1/LCJiT7rB3oAB8tctj/P
   w==;
X-CSE-ConnectionGUID: q6XgJjRhRMKJEkeJxQxazA==
X-CSE-MsgGUID: d9MxdybET8irIchMReZ/YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77905467"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="77905467"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 03:49:34 -0700
X-CSE-ConnectionGUID: 4YaS/ogWQ2yyapRLKyjq3A==
X-CSE-MsgGUID: GEPQtygmSYaEATEmkSdWMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="230890169"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 May 2026 03:49:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJqrj-000000005or-1ssq;
	Mon, 04 May 2026 10:49:31 +0000
Date: Mon, 04 May 2026 12:49:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605041256.kQdwWfpa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Julien Massot <julien.massot@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: cfe035d8662cfbd6edff9bd89c4b516bbb34c350 arm64: dts: mt6359: Rename=
 RTC node to match binding expectations
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/arc=
hive/20260504/202605041256.kQdwWfpa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260504/202605041256.kQdwWfpa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: cfe035d8662c ("arm64: dts: mt6359: Rename RTC node to match bindin=
g expectations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605041256.kQdwWfpa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: pmic (mediatek,mt6359): '#s=
ound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10320000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: mailbox@10330000 (mediatek,=
mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: scp@10720000 (mediatek,mt81=
88-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
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
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1256.7-1264.4: Warning (=
graph_child_address): /soc/syscon@1c01d000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103200=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: mailbox@103300=
00 (mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (=
mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediate=
k,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@112100=
00 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud=
_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'a=
ud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk=
', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud=
_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac=
_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', =
'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_=
d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top=
_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2=
s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_=
m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_s=
el', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_di=
v2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_d=
iv5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_=
div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clocks: [[59, 0], [59, 7], [59, 8], [59, 6], [59=
, 21], [59, 1], [59, 2], [59, 4], [59, 3], [59, 5], [59, 9], [59, 10], [59,=
 18], [59, 19], [59, 20], [59, 22], [59, 23], [59, 24], [59, 25], [59, 26],=
 [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22=
, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, =
60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], =
[22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147],=
 [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is t=
oo long
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (media=
tek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@1121=
0000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'a=
ud_dac_predis_clk', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', =
'aud_apll24m_clk', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_c=
lk', 'aud_tml_clk', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'a=
ud_adc_hires_tml', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_d=
ac_predis_clk', 'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk'=
, 'aud_infra_26m_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d=
4_d4', 'top_mux_aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 't=
op_mux_aud_eng1', 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_=
i2s0_m_sel', 'top_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s=
4_m_sel', 'top_i2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m=
_sel', 'top_i2s9_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_=
div2', 'top_apll12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12=
_div5', 'top_apll12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll1=
2_div9', 'top_mux_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clocks: [[56, 0], [56, 7], [56, 8], [56, 6], [=
56, 21], [56, 1], [56, 2], [56, 4], [56, 3], [56, 5], [56, 9], [56, 10], [5=
6, 18], [56, 19], [56, 20], [56, 22], [56, 23], [56, 24], [56, 25], [56, 26=
], [23, 47], [23, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [=
22, 48], [22, 105], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22=
, 60], [22, 61], [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67]=
, [22, 68], [22, 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147=
], [22, 148], [22, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is=
 too long
--
>> arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: pmic (mediatek,mt6359): '#s=
ound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: syscon@11210000 (mediatek,m=
t8192-audsys): 'mt8192-afe-pcm' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clock-names: ['aud_afe_clk', 'aud_dac_clk', 'aud_dac_predis_cl=
k', 'aud_adc_clk', 'aud_adda6_adc_clk', 'aud_apll22m_clk', 'aud_apll24m_clk=
', 'aud_apll1_tuner_clk', 'aud_apll2_tuner_clk', 'aud_tdm_clk', 'aud_tml_cl=
k', 'aud_nle', 'aud_dac_hires_clk', 'aud_adc_hires_clk', 'aud_adc_hires_tml=
', 'aud_adda6_adc_hires_clk', 'aud_3rd_dac_clk', 'aud_3rd_dac_predis_clk', =
'aud_3rd_dac_tml', 'aud_3rd_dac_hires_clk', 'aud_infra_clk', 'aud_infra_26m=
_clk', 'top_mux_audio', 'top_mux_audio_int', 'top_mainpll_d4_d4', 'top_mux_=
aud_1', 'top_apll1_ck', 'top_mux_aud_2', 'top_apll2_ck', 'top_mux_aud_eng1'=
, 'top_apll1_d4', 'top_mux_aud_eng2', 'top_apll2_d4', 'top_i2s0_m_sel', 'to=
p_i2s1_m_sel', 'top_i2s2_m_sel', 'top_i2s3_m_sel', 'top_i2s4_m_sel', 'top_i=
2s5_m_sel', 'top_i2s6_m_sel', 'top_i2s7_m_sel', 'top_i2s8_m_sel', 'top_i2s9=
_m_sel', 'top_apll12_div0', 'top_apll12_div1', 'top_apll12_div2', 'top_apll=
12_div3', 'top_apll12_div4', 'top_apll12_divb', 'top_apll12_div5', 'top_apl=
l12_div6', 'top_apll12_div7', 'top_apll12_div8', 'top_apll12_div9', 'top_mu=
x_audio_h', 'top_clk26m_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml
   arch/arm64/boot/dts/mediatek/mt8192-evb.dtb: mt8192-afe-pcm (mediatek,mt=
8192-audio): clocks: [[45, 0], [45, 7], [45, 8], [45, 6], [45, 21], [45, 1]=
, [45, 2], [45, 4], [45, 3], [45, 5], [45, 9], [45, 10], [45, 18], [45, 19]=
, [45, 20], [45, 22], [45, 23], [45, 24], [45, 25], [45, 26], [23, 47], [23=
, 58], [22, 27], [22, 28], [22, 72], [22, 47], [22, 101], [22, 48], [22, 10=
5], [22, 43], [22, 103], [22, 44], [22, 107], [22, 59], [22, 60], [22, 61],=
 [22, 62], [22, 63], [22, 64], [22, 65], [22, 66], [22, 67], [22, 68], [22,=
 142], [22, 143], [22, 144], [22, 145], [22, 146], [22, 147], [22, 148], [2=
2, 149], [22, 150], [22, 151], [22, 152], [22, 55], [2]] is too long
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,m=
t6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediate=
k,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexp=
ected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: edp-tx@1c50000=
0 (mediatek,mt8195-edp-tx): Unevaluated properties are not allowed ('aux-bu=
s' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: edp-tx@1c50000=
0 (mediatek,mt8195-edp-tx): Unevaluated properties are not allowed ('aux-bu=
s' was unexpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was une=
xpected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#=
sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (medi=
atek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, =
797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1245.7-1253.4: War=
ning (graph_child_address): /soc/syscon@1c01d000/port: graph node has singl=
e child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1119.7-1127.4: Wa=
rning (graph_child_address): /soc/syscon@1c01a000/port: graph node has sing=
le child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,m=
t6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/dsi@1c00800=
0/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid=
078', 'himax,hx8279']
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: /soc/dsi@1c00800=
0/panel@0: failed to match any schema with compatible: ['startek,kd070fhfid=
078', 'himax,hx8279']
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1245.7-1253.4: War=
ning (graph_child_address): /soc/syscon@1c01d000/port: graph node has singl=
e child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10320000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: mailbox@10330000 =
(mediatek,mt8188-gce): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mailbox/mediatek,gce-mai=
lbox.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (med=
iatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (med=
iatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iom=
mu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0,=
 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator=
 (mediatek,mt6360-regulator): 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LD=
O5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[12=
3567]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulat=
or.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3335.22-3347.5: Warning (avoid_=
unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size=
-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: /mt8195-sound: fa=
iled to match any schema with compatible: ['mediatek,mt8195_mt6359']
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt=
6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315=
000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4,=
 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
