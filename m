Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532B322E
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 00:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755823076; cv=none; b=bxcTrGUciyAlGh56Wp7kFp6wkCoikrJrDldtB2361ugRMEv+SFqmQC7+VE/LeTauFnNRSmhSOYPiRtzA6mETOCoEw778bHSpTngOS9l8et5XCOg0HDt13+uPd/5e7VJTqITyAG/moXf74LIsXAdgto19eu7aUVbFUG2NLuZqhgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755823076; c=relaxed/simple;
	bh=k1/IpJ2nrvoj1jF7AJEbG3kwXW/V6LTbp2+jTrI2KG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wv+23SHcHZTW0GvZeEgr1i7CCm8dr7h4RjebS24KJZ/MqF094ceDRkMCqMR/U8A9BAiqphWiOWWZbovfTzNygYZT8AQ70g6GjsihPY8vIpVA0XXHS16XYWdd3N6P3AFz8eVYGJAa2XIpLMlgAlZslej8uPiFmcMYCbFxAW+9Ric=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/T77qng; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/T77qng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755823071; x=1787359071;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k1/IpJ2nrvoj1jF7AJEbG3kwXW/V6LTbp2+jTrI2KG4=;
  b=S/T77qngV+bs6PtD1xNxmTyO6scE1AT3hn3JlXG8IS57hS17seGwvdsp
   Vuxqh6+WKojG1zy2SLcAwFORDMUNEGfqieze4T+SBvVp5nADZvMEMsHW3
   1LAUOZjVvtrnJBnTQjYirJCqCeDWdbXGFwysLmefrKDPW2k7Pqt2ayHya
   91O+PubOUMYtlrpFxzFkgBRvg9gPG0pWoj6Wut7pRMYHMpEC3BGkwpitZ
   qsqgMd1h317yds9EHbXKQb3107aKAj2+xSC98UpfBL0SwKV8xMl5FDCPR
   ITEXE1nAs6SvrX6C7ORRQFNRDmcm0/yuAONZe+zvE62q5Ciq7vV7aTdTo
   w==;
X-CSE-ConnectionGUID: /r1+Lly8Sk2g1v53ftw/4A==
X-CSE-MsgGUID: qqAOTVhnSii+Z2bcfQKU5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="57149090"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="57149090"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 17:37:50 -0700
X-CSE-ConnectionGUID: zGdpBRaUQJeNQ4Or7+7eGw==
X-CSE-MsgGUID: zHRjnvBLTja0YubOo5ZlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="172968164"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 21 Aug 2025 17:37:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upFms-000Kmf-00;
	Fri, 22 Aug 2025 00:37:46 +0000
Date: Fri, 22 Aug 2025 08:36:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:b4/dt-bindings-display 7/7]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: scp@10500000
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible':
 ['google,cros-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should
 not be valid under {'description': "Can't find refer...
Message-ID: <202508220847.iFAsM0Yp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux b4/dt-bindings-display
head:   6c8e41c23e9a77b2d17170b3fbf527f23f453dec
commit: 6c8e41c23e9a77b2d17170b3fbf527f23f453dec [7/7] dt-bindings: mfd: Mo=
ve embedded controllers to own directory
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-051-20250822 (https://download.01.org/0day-ci/arch=
ive/20250822/202508220847.iFAsM0Yp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250822/202508220847.iFAsM0Yp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508220847.iFAsM0Yp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does no=
t match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' doe=
s not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch=
-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not ma=
tch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: pinctrl@10=
005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'vol=
up-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: scp@105000=
00 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rp=
msg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under =
{'description': "Can't find referenced schema: http://devicetree.org/schema=
s/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: scp@105000=
00 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not all=
owed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio=
-controller@11220000: failed to match any schema with compatible: ['mediate=
k,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /soc/audio=
-controller@11220000/mt8183-afe-pcm: failed to match any schema with compat=
ible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: syscon@130=
00000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: /mt8183-so=
und: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_t=
s3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-=
rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volu=
p-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does =
not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-r=
st-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not matc=
h any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup=
-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_da7219_max=
98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' do=
es not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7=
219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' do=
es not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7=
219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6=
358_ts3a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does =
not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' d=
oes not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'tou=
ch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: pinctrl@=
10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'v=
olup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: scp@1050=
0000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-=
rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid unde=
r {'description': "Can't find referenced schema: http://devicetree.org/sche=
mas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: scp@1050=
0000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not a=
llowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/aud=
io-controller@11220000: failed to match any schema with compatible: ['media=
tek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /soc/aud=
io-controller@11220000/mt8183-afe-pcm: failed to match any schema with comp=
atible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: syscon@1=
3000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: /mt8183-=
sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219=
_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' =
does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enab=
le' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl',=
 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl=
', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^p=
ins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: scp=
@10500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cro=
s-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid=
 under {'description': "Can't find referenced schema: http://devicetree.org=
/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: scp=
@10500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are =
not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /so=
c/audio-controller@11220000: failed to match any schema with compatible: ['=
mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /so=
c/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with=
 compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: sys=
con@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: /mt=
8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_m=
t6358_ts3a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' =
does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enab=
le' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl',=
 'touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: pin=
ctrl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl=
', 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^p=
ins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: scp=
@10500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cro=
s-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid=
 under {'description': "Can't find referenced schema: http://devicetree.org=
/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: scp=
@10500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are =
not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /so=
c/audio-controller@11220000: failed to match any schema with compatible: ['=
mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /so=
c/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with=
 compatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: sys=
con@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any o=
f the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: /mt=
8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_m=
t6358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-=
rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volu=
p-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-=
rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volu=
p-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7=
219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' do=
es not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6=
358_ts3a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does =
not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-r=
st-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not matc=
h any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volup=
-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3=
a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable' does=
 not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', 'touch-=
rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl', 'volu=
p-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): bt-pins-wakeup: 'piins-bt-wakeup' does not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' do=
es not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7=
219_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' do=
es not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): pp3300-panel-pins: 'panel-3v3-enable=
' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): touchscreen-pins: 'touch-int-odl', '=
touch-rst-l' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): trackpad-pins: 'trackpad-int' does n=
ot match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: pinct=
rl@10005000 (mediatek,mt8183-pinctrl): volume-button-pins: 'voldn-btn-odl',=
 'volup-btn-odl' do not match any of the regexes: '^pinctrl-[0-9]+$', '^pin=
s'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: scp@1=
0500000 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/=
audio-controller@11220000: failed to match any schema with compatible: ['me=
diatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /soc/=
audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with c=
ompatible: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: sysco=
n@13000000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of =
the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: /mt81=
83-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6=
358_ts3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (=
mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (=
mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down-adv=
: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (=
mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-adv: =
10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (=
mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10=
 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: pinctrl@10005000 (=
mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not match =
any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: scp@10500000 (medi=
atek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'], '=
mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'descri=
ption': "Can't find referenced schema: http://devicetree.org/schemas/mfd/go=
ogle,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: scp@10500000 (medi=
atek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allowed ('c=
ompatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-control=
ler@11220000: failed to match any schema with compatible: ['mediatek,mt8183=
-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /soc/audio-control=
ler@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['=
mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: syscon@13000000 (m=
ediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: /mt8183-sound: fai=
led to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pul=
l-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-do=
wn-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up=
-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3=
a227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull=
-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-dow=
n-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-=
adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-ad=
v: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: scp@10500000 =
(mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg=
'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'d=
escription': "Can't find referenced schema: http://devicetree.org/schemas/m=
fd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: scp@10500000 =
(mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allowe=
d ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-co=
ntroller@11220000: failed to match any schema with compatible: ['mediatek,m=
t8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /soc/audio-co=
ntroller@11220000/mt8183-afe-pcm: failed to match any schema with compatibl=
e: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: syscon@130000=
00 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: /mt8183-sound=
: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt10=
15p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pull=
-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-dow=
n-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-=
adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-ad=
v: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005=
000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not m=
atch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: scp@10500000 =
(mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg=
'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'d=
escription': "Can't find referenced schema: http://devicetree.org/schemas/m=
fd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: scp@10500000 =
(mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allowe=
d ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-co=
ntroller@11220000: failed to match any schema with compatible: ['mediatek,m=
t8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-co=
ntroller@11220000/mt8183-afe-pcm: failed to match any schema with compatibl=
e: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: syscon@130000=
00 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /mt8183-sound=
: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a=
227_rt1015p']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pul=
l-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-do=
wn-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up=
-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3=
a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-d=
own-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-u=
p-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-=
adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-d=
own-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-u=
p-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-=
adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: pinctrl@100=
05000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not=
 match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: scp@1050000=
0 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-=
controller@11220000: failed to match any schema with compatible: ['mediatek=
,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /soc/audio-=
controller@11220000/mt8183-afe-pcm: failed to match any schema with compati=
ble: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: syscon@1300=
0000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: /mt8183-sou=
nd: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts=
3a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-cmd-dat:mediatek,pul=
l-up-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-do=
wn-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up=
-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3=
a227_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-down=
-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv=
: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: pinctrl@100050=
00 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not ma=
tch any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: scp@10500000 (=
mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'=
], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'de=
scription': "Can't find referenced schema: http://devicetree.org/schemas/mf=
d/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: scp@10500000 (=
mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allowed=
 ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-con=
troller@11220000: failed to match any schema with compatible: ['mediatek,mt=
8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /soc/audio-con=
troller@11220000/mt8183-afe-pcm: failed to match any schema with compatible=
: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: syscon@1300000=
0 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: /mt8183-sound:=
 failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a2=
27_max98357']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-default:pins-clk:mediatek,pull-do=
wn-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-cmd-dat:mediatek,pull-up=
-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-a=
dv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: pinctrl@1000=
5000 (mediatek,mt8183-pinctrl): panel-pins-default: 'panel-reset' does not =
match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpms=
g'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'=
description': "Can't find referenced schema: http://devicetree.org/schemas/=
mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: scp@10500000=
 (mediatek,mt8183-scp): cros-ec-rpmsg: Unevaluated properties are not allow=
ed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-c=
ontroller@11220000: failed to match any schema with compatible: ['mediatek,=
mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /soc/audio-c=
ontroller@11220000/mt8183-afe-pcm: failed to match any schema with compatib=
le: ['mediatek,mt8183-audio']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: syscon@13000=
000 (mediatek,mt8183-mfgcfg): 'power-domains' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: /mt8183-soun=
d: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3=
a227_max98357']
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: scp@10500=
000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-r=
pmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under=
 {'description': "Can't find referenced schema: http://devicetree.org/schem=
as/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: scp@10500=
000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not al=
lowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: scp@10500=
000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-r=
pmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under=
 {'description': "Can't find referenced schema: http://devicetree.org/schem=
as/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: scp@10500=
000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not al=
lowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: scp@1050=
0000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-=
rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid unde=
r {'description': "Can't find referenced schema: http://devicetree.org/sche=
mas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: scp@1050=
0000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not a=
llowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros=
-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid =
under {'description': "Can't find referenced schema: http://devicetree.org/=
schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are n=
ot allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: soun=
d (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros=
-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid =
under {'description': "Can't find referenced schema: http://devicetree.org/=
schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are n=
ot allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: soun=
d (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros=
-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid =
under {'description': "Can't find referenced schema: http://devicetree.org/=
schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: scp@=
10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are n=
ot allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: soun=
d (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prop=
erty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: scp@1050000=
0 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: scp@1050000=
0 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: scp@1050000=
0 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: scp@1050000=
0 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: scp@105=
00000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec=
-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid und=
er {'description': "Can't find referenced schema: http://devicetree.org/sch=
emas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: scp@105=
00000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not =
allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound (=
mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 =
(mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts=
' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: scp@10500000 (=
mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'=
], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'de=
scription': "Can't find referenced schema: http://devicetree.org/schemas/mf=
d/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: scp@10500000 (=
mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not allowed=
 ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: scp@105000=
00 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rp=
msg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under =
{'description': "Can't find referenced schema: http://devicetree.org/schema=
s/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: scp@105000=
00 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not all=
owed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound (med=
iatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: scp@105000=
00 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rp=
msg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under =
{'description': "Can't find referenced schema: http://devicetree.org/schema=
s/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: scp@105000=
00 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not all=
owed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: sound (med=
iatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: scp@1=
0500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: scp@1=
0500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound=
 (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: scp@1=
0500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-=
ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid u=
nder {'description': "Can't find referenced schema: http://devicetree.org/s=
chemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: scp@1=
0500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are no=
t allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound=
 (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required prope=
rty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: scp=
@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cro=
s-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid=
 under {'description': "Can't find referenced schema: http://devicetree.org=
/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: scp=
@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are =
not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: sou=
nd (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: scp=
@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cro=
s-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid=
 under {'description': "Can't find referenced schema: http://devicetree.org=
/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: scp=
@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are =
not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sou=
nd (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pro=
perty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: sc=
p@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cr=
os-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be vali=
d under {'description': "Can't find referenced schema: http://devicetree.or=
g/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: sc=
p@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are=
 not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: so=
und (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: sc=
p@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cr=
os-ec-rpmsg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be vali=
d under {'description': "Can't find referenced schema: http://devicetree.or=
g/schemas/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: sc=
p@10500000 (mediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are=
 not allowed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: so=
und (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required pr=
operty
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (=
mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts'=
 was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.y=
aml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: scp@10500000 (m=
ediatek,mt8186-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg']=
, 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'des=
cription': "Can't find referenced schema: http://devicetree.org/schemas/mfd=
/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: scp@10500000 (m=
ediatek,mt8186-scp): cros-ec-rpmsg: Unevaluated properties are not allowed =
('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek=
,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt10=
19-rt5682s.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediate=
k,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: scp@10500000 =
(mediatek,mt8192-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg=
'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'d=
escription': "Can't find referenced schema: http://devicetree.org/schemas/m=
fd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: scp@10500000 =
(mediatek,mt8192-scp): cros-ec-rpmsg: Unevaluated properties are not allowe=
d ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: syscon@112100=
00 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: mt8192-afe-pc=
m (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
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
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (media=
tek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: scp@1050000=
0 (mediatek,mt8192-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpm=
sg'], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {=
'description': "Can't find referenced schema: http://devicetree.org/schemas=
/mfd/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: scp@1050000=
0 (mediatek,mt8192-scp): cros-ec-rpmsg: Unevaluated properties are not allo=
wed ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: syscon@1121=
0000 (mediatek,mt8192-audsys): 'mt8192-afe-pcm' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,au=
dsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:3: 'aud_infra_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: mt8192-afe-=
pcm (mediatek,mt8192-audio): clock-names:4: 'aud_infra_26m_clk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yam=
l#
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
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,m=
t6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@1031=
5000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4=
, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: scp@10500000 (me=
diatek,mt8195-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'],=
 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'desc=
ription': "Can't find referenced schema: http://devicetree.org/schemas/mfd/=
google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: scp@10500000 (me=
diatek,mt8195-scp): cros-ec-rpmsg: Unevaluated properties are not allowed (=
'compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediate=
k,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realte=
k,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexp=
ected)
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'=
], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'de=
scription': "Can't find referenced schema: http://devicetree.org/schemas/mf=
d/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: Unevaluated properties are not allowed=
 ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realt=
ek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'=
], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'de=
scription': "Can't find referenced schema: http://devicetree.org/schemas/mf=
d/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: Unevaluated properties are not allowed=
 ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (real=
tek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yam=
l#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realt=
ek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple=
_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple=
_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (=
graph_child_address): /soc/syscon@1c01a000/port: graph node has single chil=
d node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek=
,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10=
315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796,=
 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yam=
l#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: {'compatible': ['google,cros-ec-rpmsg'=
], 'mediatek,rpmsg-name': ['cros-ec-rpmsg']} should not be valid under {'de=
scription': "Can't find referenced schema: http://devicetree.org/schemas/mf=
d/google,cros-ec.yaml#"}
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: scp@10500000 (=
mediatek,mt8195-scp): cros-ec-rpmsg: Unevaluated properties are not allowed=
 ('compatible', 'mediatek,rpmsg-name' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (media=
tek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.ya=
ml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (real=
tek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was une=
xpected)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
