Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792273DA5C0
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 09:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602595; cv=none; b=FUQEwpv21HpXA8xRs28Nbj1APjZSAiKF31g66JBmYv4RBkG0ypqmFH+IYW05AiPMNOQm8Wlp37XC+azjblDb+arvqZKVofhf7XITCt0lEmcCv+n+iTkkAo3Oxi3X1Dclr5/0p5l46IKqhUlK60Yyd/pxDt3c79frYxXToxH/vsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602595; c=relaxed/simple;
	bh=h8A0i7CngI4K2eYqpyn3uixkB/EQQxe6b8S6XnbB8+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OBy/IQl0dt1jhdjuW6eCOXg4BJ5uvP2IsatWL2nXIU9nObyUFqkHpgVmloEx2hHvFCJaWk5Lo7kDwo8mZVqAMFge40IRnfl2h9CQ3e+OsoGqYDccyvBZQ/HZ/dff+x1hcab45z1HHt/3CHuNbgwtNHH6HmTEBFwNPrO0HS+IeO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsWMtMj9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsWMtMj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774602594; x=1806138594;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h8A0i7CngI4K2eYqpyn3uixkB/EQQxe6b8S6XnbB8+s=;
  b=KsWMtMj9URTaRwyQDkrzjxdVgCJsHTkpKeKuzFU/jRqwkLTthtZ8J+E7
   43kkbRVMCjPwTvpErXCoJ/wwkc6Da0o/+ZXSkREbmzW3MO2Bxy/VZ6Zep
   x00tIcCGQI3shfQ12SWv7p+xhQb900H0LXlFp3PpVyrRu3zEIEurmCwPT
   V+3cUHE9DtaqjyCQR+ZOrXWPtEH11UQ9/nvBfZtBHs40B2Javsy3LPQXm
   aPEfAVfwWOGJf3Q3Vc1nGjsVYsULpoPTywwc1640zRRZC+myf3VOhgWhl
   GpYBuy2dJifIujl1EHDnYjiknBV9BtWPw+d0bVTMU+N1tZVSiql5EV/o8
   Q==;
X-CSE-ConnectionGUID: A3zgjyhiRKelIuBW3afPJw==
X-CSE-MsgGUID: xqU//Q5mRj+5Y1gQgKXOgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75387853"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75387853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:09:53 -0700
X-CSE-ConnectionGUID: TuhDbE0NRyOhdatdKFtWjQ==
X-CSE-MsgGUID: Ydq33DcRQjiH6sl1OjdbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="230189139"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Mar 2026 02:09:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w63CP-000000007TB-2EMp;
	Fri, 27 Mar 2026 09:09:49 +0000
Date: Fri, 27 Mar 2026 10:09:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert
 rockchip-max98090.txt to yaml
Message-ID: <202603271020.KBjrZ4L9-lkp@intel.com>
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
In-Reply-To: <20260324135508.839142-1-festevam@gmail.com>
References: <20260324135508.839142-1-festevam@gmail.com>
TO: Fabio Estevam <festevam@gmail.com>
TO: broonie@kernel.org
CC: heiko@sntech.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Fabio Estevam <festevam@gmail.com>

Hi Fabio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on rockchip/for-next robh/for-next linus/master v7=
=2E0-rc5 next-20260325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-Estevam/ASoC-d=
t-bindings-rockchip-Convert-rockchip-max98090-txt-to-yaml/20260325-140025
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
patch link:    https://lore.kernel.org/r/20260324135508.839142-1-festevam%4=
0gmail.com
patch subject: [PATCH] ASoC: dt-bindings: rockchip: Convert rockchip-max980=
90.txt to yaml
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260325 (https://download.01.org/0day-ci/archi=
ve/20260327/202603271020.KBjrZ4L9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260327/202603271020.KBjrZ4L9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603271020.KBjrZ4L9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: / (google,veyron-fi=
evel-rev8): False schema does not allow {'device_type': ['memory'], 'reg': =
[[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: btmrvl@2 (marvell,s=
d8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd=
8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): False schema does not allow [[58]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: ethernet@ff290000 (=
rockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wa=
keup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dtb: sound (rockchip,roc=
kchip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp=
-det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: / (google,veyron-jaq-r=
ev5): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0=
, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: btmrvl@2 (marvell,sd88=
97-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd=
8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: tsadc@ff280000 (rockch=
ip,rk3288-tsadc): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: sound (rockchip,rockch=
ip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp-de=
t-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dtb: panel (innolux,n116bge=
): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: / (google,veyron-jer=
ry-rev15): False schema does not allow {'device_type': ['memory'], 'reg': [=
[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1 (marvell,sd88=
97): marvell,caldata-txpwrlimit-2g: [1, 0, 6, 0, 8, 2, 137, 1, 36, 0, 103, =
9, 20, 1, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9=
, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 2=
, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12=
, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 3, 0, 15,=
 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12=
, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 4, 0, 15, 1, 12, =
2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12=
, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 5, 0, 15, 1, 12, 2, 12, 3=
, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9,=
 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 6, 0, 15, 1, 12, 2, 12, 3, 12, 4,=
 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, =
15, 9, 137, 1, 36, 0, 103, 9, 20, 7, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, =
12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 1=
37, 1, 36, 0, 103, 9, 20, 8, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 1=
2, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 3=
6, 0, 103, 9, 20, 9, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9,=
 8, 9, 9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 10=
3, 9, 20, 10, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, =
9, 9, 10, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 2=
0, 11, 0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 1=
0, 12, 11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 12, =
0, 15, 1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, =
11, 12, 12, 12, 13, 9, 14, 9, 15, 9, 137, 1, 36, 0, 103, 9, 20, 13, 0, 15, =
1, 12, 2, 12, 3, 12, 4, 12, 5, 12, 6, 12, 7, 9, 8, 9, 9, 9, 10, 12, 11, 12,=
 12, 12, 13, 9, 14, 9, 15, 9] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: wifi@1 (marvell,sd88=
97): marvell,caldata-txpwrlimit-5g-sub2: [1, 0, 6, 0, 54, 1, 137, 1, 58, 0,=
 136, 19, 20, 149, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9,=
 8, 10, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5=
, 20, 5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 13=
6, 19, 20, 153, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8,=
 10, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 2=
0, 5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, =
19, 20, 157, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10=
, 10, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, =
5, 21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19,=
 20, 161, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 1=
0, 11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, =
21, 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5, 137, 1, 58, 0, 136, 19, 20=
, 165, 1, 11, 2, 11, 3, 11, 4, 10, 5, 10, 6, 10, 7, 8, 8, 8, 9, 8, 10, 10, =
11, 10, 12, 10, 13, 8, 14, 8, 15, 8, 16, 4, 17, 4, 18, 5, 19, 5, 20, 5, 21,=
 5, 22, 4, 23, 4, 24, 5, 25, 5, 26, 5, 27, 5] is too short
   	from schema $id: http://devicetree.org/schemas/net/wireless/marvell,sd8=
787.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: trackpad@2c (hid-ove=
r-i2c): 'vcc-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/hid-over-i2c.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: sound (rockchip,rock=
chip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp-=
det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dtb: panel (innolux,n116b=
ge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: / (google,veyron-mi=
ghty-rev5): False schema does not allow {'device_type': ['memory'], 'reg': =
[[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: btmrvl@2 (marvell,s=
d8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd=
8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: sound (rockchip,roc=
kchip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp=
-det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-mighty.dtb: panel (innolux,n116=
bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: / (google,veyron-mi=
nnie-rev4): False schema does not allow {'device_type': ['memory'], 'reg': =
[[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): False schema does not allow [[75]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: sound (rockchip,roc=
kchip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp=
-det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-minnie.dtb: panel (auo,b101ean0=
1): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: / (google,veyron-pin=
ky-rev2): False schema does not allow {'device_type': ['memory'], 'reg': [[=
0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: sound (rockchip,rock=
chip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp-=
det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: panel (innolux,n116b=
ge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dtb: lid-switch (gpio-key=
s): key-power: 'linux,code' is a required property
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: / (google,veyron-sp=
eedy-rev9): False schema does not allow {'device_type': ['memory'], 'reg': =
[[0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: tsadc@ff280000 (roc=
kchip,rk3288-tsadc): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: sound (rockchip,roc=
kchip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp=
-det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-speedy.dtb: panel (innolux,n116=
bge): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml
--
   arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi:25.9-28.4: Warning (unit_a=
ddress_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: / (google,veyron-tig=
er-rev8): False schema does not allow {'device_type': ['memory'], 'reg': [[=
0, 0, 0, 2147483648]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: btmrvl@2 (marvell,sd=
8897-bt): $nodename:0: 'btmrvl@2' does not match '^bluetooth(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/marvell,sd=
8897-bt.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: tsadc@ff280000 (rock=
chip,rk3288-tsadc): False schema does not allow [[62]]
   	from schema $id: http://devicetree.org/schemas/thermal/rockchip-thermal=
=2Eyaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: ethernet@ff290000 (r=
ockchip,rk3288-gmac): Unevaluated properties are not allowed ('mdio0', 'wak=
eup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
>> arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: sound (rockchip,rock=
chip-audio-max98090): Unevaluated properties are not allowed ('rockchip,hp-=
det-gpios', 'rockchip,mic-det-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,rockchip-=
audio-max98090.yaml
   arch/arm/boot/dts/rockchip/rk3288-veyron-tiger.dtb: panel (auo,b101ean01=
): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp-=
legacy.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
