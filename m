Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20468155306
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731151553; cv=none; b=XhuTWVXhI52M5/otPpf+XeUfVsySwSL1UtBH1THLOurBYIa+wXeRXnMS0Qi+RSGnur3sxCSKmcghrq+pbYjhD6X7l7LgAMRZgynyMH5LAHb2IJi0Pq7FHcs14FiKy7zp6Ym5xOA41mlB+r3g5o5wAF2MEk+kB/3RNT4X87AxLnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731151553; c=relaxed/simple;
	bh=qiI013Zw3Ezo8dzrmyId6sg7xNFEc+iiGTcvGQS2V5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anxnn+H7s6mED9sDwec3og9BS+TB6Qx9CRSSpxdhlpeXkgfK9EbHcJBjQC58hbzUed69W1KgJnnm348KeJzMrd6Gl4vntqzJh0Voe03Gi8eBTck3b/sdJE9Ch+SQBYaPYrI7TD0Yyqe0ufIERFWB72L0pCaY34tUB+89pigqXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bw4dfioL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bw4dfioL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731151545; x=1762687545;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qiI013Zw3Ezo8dzrmyId6sg7xNFEc+iiGTcvGQS2V5M=;
  b=Bw4dfioLpZ1yBRjJEtx/3sQcDR14CyCUGD6cD+BFzPzyuPhuUFNZVgND
   4XTOxPQmtbni+W2HUDMjF1tvlY4NUuIwiKl9dhF5uGqkK7Oarb1OenVFq
   1sqKzONcx2WAnPNi5nuTuaEB9lv4AEItC9KFC2DYPLFWuuvBA5VV5tepc
   x74wtJxCedrL2pds1p2JQ+T9wQBmoAy30fZU6uGS9CT1NPcOdgArvpuYs
   f0aLu24jvHx5QbNk3kLFSZxJvjeBS7ejYoczW1s8zoRPftNYSA6/3xC9S
   sScw1OTzTfqdeuglupZKPZLEqoA9Vzsz9jOkoTZ6PxlWxIrUZTdN27S4O
   Q==;
X-CSE-ConnectionGUID: jy3EVzhSQuuYxIEdDsi9Tg==
X-CSE-MsgGUID: vdXRYf/wRIypfWpSXhJEnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48480059"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48480059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 03:25:44 -0800
X-CSE-ConnectionGUID: /nHkJ9JdT3u0y1SROv3IyA==
X-CSE-MsgGUID: OHsmeN1cR8iDy4Fe6OBKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86338231"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2024 03:25:43 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9jb2-000sJ8-0o;
	Sat, 09 Nov 2024 11:25:40 +0000
Date: Sat, 9 Nov 2024 19:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <202411091900.KfvIiPoC-lkp@intel.com>
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
In-Reply-To: <20241107085705.490940-3-lukma@denx.de>
References: <20241107085705.490940-3-lukma@denx.de>
TO: Lukasz Majewski <lukma@denx.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Stefan Wahren <wahrenst@gmx.net>
CC: Lukasz Majewski <lukma@denx.de>

Hi Lukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on shawnguo/for-next krzk/for-next krzk-mem-ctrl/f=
or-next krzk-dt/for-next linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Majewski/dt-b=
indings-arm-Document-the-btt3-i-MX28-based-board/20241107-165937
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20241107085705.490940-3-lukma%40de=
nx.de
patch subject: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287 b=
ased btt3-[012] devices
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20241107 (https://download.01.org/0day-ci/archiv=
e/20241109/202411091900.KfvIiPoC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241109/202411091900.KfvIiPoC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411091900.KfvIiPoC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: $nodename:0: '=
spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: $nodename:0: '=
spi@80012000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'keep-power-in-suspend', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', =
'vmmc-supply', 'wlan@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80014000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80016000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: compatible=
: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: 'auart0-2p=
ins@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2=
-2pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0',=
 'auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'd=
uart@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'hog@1', 'i2c0@0', 'i=
2c0@1', 'i2c1@0', 'i2c1@1', 'keypad-bttc@0', 'lcdif-16bit@0', 'lcdif-18bit@=
0', 'lcdif-24bit@0', 'lcdif-bttc@0', 'lcdif-bttc@1', 'lcdif-sync@0', 'mac0@=
0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-cd-cfg@0', 'mmc=
0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@0', 'mmc2-4bit@=
0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-sck-cfg@1', 'pw=
m0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'saif0@0', 'saif0@1', 'saif1=
@0', 'spi2@0', 'spi3@0', 'spi3@1', 'ssp1-sdio@0', 'usb0@0', 'usb0@1', 'usb0=
id1@0', 'usb0id@0', 'usb1@0', 'usb1@1', 'wifi-en-pin@0' do not match any of=
 the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28=
-lradc']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
--
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: spi@80010000: $nodename:0: '=
spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: spi@80010000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
--
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:63.32-77.5: Warning (unit_addr=
ess_vs_reg): /sound/simple-audio-card,dai-link@0: node has a unit name, but=
 no reg or ranges property
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/duart-4pins@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-nand@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/gpmi-status-cfg@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/gpmi-status-cfg@0)
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:176.19-184.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:227.27-236.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:344.36-353.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:392.36-401.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:414.30-423.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:640.25-649.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:662.25-671.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:686.27-696.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:738.25-746.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:906.25-917.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:929.25-937.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:949.25-957.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@1)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:180.22-191.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@1)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: spi@80010000: $nodename:0: '=
spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: spi@80010000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#

vim +63 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi

90e311ed817d0b Lukasz Majewski 2024-11-07    8 =20
90e311ed817d0b Lukasz Majewski 2024-11-07    9  / {
90e311ed817d0b Lukasz Majewski 2024-11-07   10  	model =3D "BTT3";
90e311ed817d0b Lukasz Majewski 2024-11-07   11 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   12  	compatible =3D "lwn,imx28-=
btt3", "fsl,imx28";
90e311ed817d0b Lukasz Majewski 2024-11-07   13 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   14  	chosen {
90e311ed817d0b Lukasz Majewski 2024-11-07   15  	       bootargs =3D "root=
=3D/dev/mmcblk0p2 rootfstype=3Dext4 ro rootwait console=3DttyAMA0,115200 pa=
nic=3D1 quiet";
90e311ed817d0b Lukasz Majewski 2024-11-07   16  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   17 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   18  	memory@40000000 {
90e311ed817d0b Lukasz Majewski 2024-11-07   19  		reg =3D <0x40000000 0x100=
00000>;
90e311ed817d0b Lukasz Majewski 2024-11-07   20  		device_type =3D "memory";
90e311ed817d0b Lukasz Majewski 2024-11-07   21  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   22 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   23  	panel {
90e311ed817d0b Lukasz Majewski 2024-11-07   24  		compatible =3D "powertip,=
hx8238a", "panel-dpi";
90e311ed817d0b Lukasz Majewski 2024-11-07   25  		power-supply =3D <&reg_3v=
3>;
90e311ed817d0b Lukasz Majewski 2024-11-07   26  		width-mm =3D <70>;
90e311ed817d0b Lukasz Majewski 2024-11-07   27  		height-mm =3D <52>;
90e311ed817d0b Lukasz Majewski 2024-11-07   28 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   29  		panel-timing {
90e311ed817d0b Lukasz Majewski 2024-11-07   30  			clock-frequency =3D <650=
0000>;
90e311ed817d0b Lukasz Majewski 2024-11-07   31  			hactive =3D <320>;
90e311ed817d0b Lukasz Majewski 2024-11-07   32  			vactive =3D <240>;
90e311ed817d0b Lukasz Majewski 2024-11-07   33  			hfront-porch =3D <20>;
90e311ed817d0b Lukasz Majewski 2024-11-07   34  			hback-porch =3D <38>;
90e311ed817d0b Lukasz Majewski 2024-11-07   35  			hsync-len =3D <30>;
90e311ed817d0b Lukasz Majewski 2024-11-07   36  			vfront-porch =3D <4>;
90e311ed817d0b Lukasz Majewski 2024-11-07   37  			vback-porch =3D <14>;
90e311ed817d0b Lukasz Majewski 2024-11-07   38  			vsync-len =3D <4>;
90e311ed817d0b Lukasz Majewski 2024-11-07   39  			hsync-active =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07   40  			vsync-active =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07   41  			de-active =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07   42  			pixelclk-active =3D <1>;
90e311ed817d0b Lukasz Majewski 2024-11-07   43  		};
90e311ed817d0b Lukasz Majewski 2024-11-07   44 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   45  		port {
90e311ed817d0b Lukasz Majewski 2024-11-07   46  			panel_in: endpoint {
90e311ed817d0b Lukasz Majewski 2024-11-07   47  				remote-endpoint =3D <&d=
isplay_out>;
90e311ed817d0b Lukasz Majewski 2024-11-07   48  			};
90e311ed817d0b Lukasz Majewski 2024-11-07   49  		};
90e311ed817d0b Lukasz Majewski 2024-11-07   50  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   51 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   52  	poweroff {
90e311ed817d0b Lukasz Majewski 2024-11-07   53  		compatible =3D "gpio-powe=
roff";
90e311ed817d0b Lukasz Majewski 2024-11-07   54  		gpios =3D <&gpio0 24 GPIO=
_ACTIVE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07   55  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   56 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   57  	sound {
90e311ed817d0b Lukasz Majewski 2024-11-07   58  		compatible =3D "simple-au=
dio-card";
90e311ed817d0b Lukasz Majewski 2024-11-07   59  		simple-audio-card,name =
=3D "BTTC Audio";
90e311ed817d0b Lukasz Majewski 2024-11-07   60  		simple-audio-card,widgets=
 =3D "Speaker", "BTTC Speaker";
90e311ed817d0b Lukasz Majewski 2024-11-07   61  		simple-audio-card,routing=
 =3D "BTTC Speaker", "SPKOUTN", "BTTC Speaker", "SPKOUTP";
90e311ed817d0b Lukasz Majewski 2024-11-07   62 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  @63  		simple-audio-card,dai-lin=
k@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07   64  			format =3D "left_j";
90e311ed817d0b Lukasz Majewski 2024-11-07   65  			bitclock-master =3D <&da=
i0_master>;
90e311ed817d0b Lukasz Majewski 2024-11-07   66  			frame-master =3D <&dai0_=
master>;
90e311ed817d0b Lukasz Majewski 2024-11-07   67  			mclk-fs =3D <256>;
90e311ed817d0b Lukasz Majewski 2024-11-07   68 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   69  			dai0_master: cpu {
90e311ed817d0b Lukasz Majewski 2024-11-07   70  				sound-dai =3D <&saif0>;
90e311ed817d0b Lukasz Majewski 2024-11-07   71  			};
90e311ed817d0b Lukasz Majewski 2024-11-07   72 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   73  			codec {
90e311ed817d0b Lukasz Majewski 2024-11-07   74  				sound-dai =3D <&wm89xx>;
90e311ed817d0b Lukasz Majewski 2024-11-07   75  				clocks =3D <&saif0>;
90e311ed817d0b Lukasz Majewski 2024-11-07   76  			};
90e311ed817d0b Lukasz Majewski 2024-11-07   77  		};
90e311ed817d0b Lukasz Majewski 2024-11-07   78  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   79 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   80  	wifi_pwrseq: sdio-pwrseq {
90e311ed817d0b Lukasz Majewski 2024-11-07   81  		compatible =3D "mmc-pwrse=
q-simple";
90e311ed817d0b Lukasz Majewski 2024-11-07   82  		pinctrl-names =3D "defaul=
t";
90e311ed817d0b Lukasz Majewski 2024-11-07   83  		pinctrl-0 =3D <&wifi_en_p=
in_bttc>;
90e311ed817d0b Lukasz Majewski 2024-11-07   84  		reset-gpios =3D <&gpio0 2=
7 GPIO_ACTIVE_LOW>;
90e311ed817d0b Lukasz Majewski 2024-11-07   85  		/* W1-163 needs 60us for =
WL_EN to be low and */
90e311ed817d0b Lukasz Majewski 2024-11-07   86  		/* 150ms after high befor=
e downloading FW is possible */
90e311ed817d0b Lukasz Majewski 2024-11-07   87  		post-power-on-delay-ms =
=3D <200>;
90e311ed817d0b Lukasz Majewski 2024-11-07   88  		power-off-delay-us =3D <1=
00>;
90e311ed817d0b Lukasz Majewski 2024-11-07   89  	};
90e311ed817d0b Lukasz Majewski 2024-11-07   90  };
90e311ed817d0b Lukasz Majewski 2024-11-07   91 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   92  &auart0 {
90e311ed817d0b Lukasz Majewski 2024-11-07   93  	pinctrl-names =3D "default=
";
90e311ed817d0b Lukasz Majewski 2024-11-07   94  	pinctrl-0 =3D <&auart0_2pi=
ns_a>;
90e311ed817d0b Lukasz Majewski 2024-11-07   95  	status =3D "okay";
90e311ed817d0b Lukasz Majewski 2024-11-07   96  };
90e311ed817d0b Lukasz Majewski 2024-11-07   97 =20
90e311ed817d0b Lukasz Majewski 2024-11-07   98  &auart3 {
90e311ed817d0b Lukasz Majewski 2024-11-07   99  	pinctrl-names =3D "default=
";
90e311ed817d0b Lukasz Majewski 2024-11-07  100  	pinctrl-0 =3D <&auart3_pin=
s_a>;
90e311ed817d0b Lukasz Majewski 2024-11-07  101  	uart-has-rtscts;
90e311ed817d0b Lukasz Majewski 2024-11-07  102  	status =3D "okay";
90e311ed817d0b Lukasz Majewski 2024-11-07  103  };
90e311ed817d0b Lukasz Majewski 2024-11-07  104 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  105  &i2c0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  106  	wm89xx: audio-codec@1a {
90e311ed817d0b Lukasz Majewski 2024-11-07  107  		compatible =3D "wlf,wm894=
0";
90e311ed817d0b Lukasz Majewski 2024-11-07  108  		reg =3D <0x1a>;
90e311ed817d0b Lukasz Majewski 2024-11-07  109  		#sound-dai-cells =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  110  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  111  };
90e311ed817d0b Lukasz Majewski 2024-11-07  112 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  113  &lcdif {
90e311ed817d0b Lukasz Majewski 2024-11-07  114  	pinctrl-names =3D "default=
";
90e311ed817d0b Lukasz Majewski 2024-11-07  115  	pinctrl-0 =3D <&lcdif_24bi=
t_pins_a>, <&lcdif_sync_pins_bttc>,
90e311ed817d0b Lukasz Majewski 2024-11-07  116  		    <&lcdif_reset_pins_bt=
tc>;
90e311ed817d0b Lukasz Majewski 2024-11-07  117  	status =3D "okay";
90e311ed817d0b Lukasz Majewski 2024-11-07  118 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  119  	port {
90e311ed817d0b Lukasz Majewski 2024-11-07  120  		display_out: endpoint {
90e311ed817d0b Lukasz Majewski 2024-11-07  121  			remote-endpoint =3D <&pa=
nel_in>;
90e311ed817d0b Lukasz Majewski 2024-11-07  122  		};
90e311ed817d0b Lukasz Majewski 2024-11-07  123  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  124  };
90e311ed817d0b Lukasz Majewski 2024-11-07  125 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  126  &mac0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  127  	clocks =3D <&clks 57>, <&c=
lks 57>, <&clks 64>;
90e311ed817d0b Lukasz Majewski 2024-11-07  128  	clock-names =3D "ipg", "ah=
b", "enet_out";
90e311ed817d0b Lukasz Majewski 2024-11-07  129  	phy-handle =3D <&mac0_phy>;
90e311ed817d0b Lukasz Majewski 2024-11-07  130  	phy-mode =3D "rmii";
90e311ed817d0b Lukasz Majewski 2024-11-07  131  	phy-supply =3D <&reg_3v3>;
90e311ed817d0b Lukasz Majewski 2024-11-07  132  	/*
90e311ed817d0b Lukasz Majewski 2024-11-07  133  	 * This MAC address is adj=
usted during production.
90e311ed817d0b Lukasz Majewski 2024-11-07  134  	 * Value specified below i=
s used as a fallback during recovery.
90e311ed817d0b Lukasz Majewski 2024-11-07  135  	 */
90e311ed817d0b Lukasz Majewski 2024-11-07  136  	local-mac-address =3D [ 00=
 11 B8 00 BF 8A ];
90e311ed817d0b Lukasz Majewski 2024-11-07  137  	status =3D "okay";
90e311ed817d0b Lukasz Majewski 2024-11-07  138 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  139  	mdio {
90e311ed817d0b Lukasz Majewski 2024-11-07  140  		#address-cells =3D <1>;
90e311ed817d0b Lukasz Majewski 2024-11-07  141  		#size-cells =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  142 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  143  		mac0_phy: ethernet-phy@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  144  			/* LAN8720Ai - PHY ID */
90e311ed817d0b Lukasz Majewski 2024-11-07  145  			compatible =3D "ethernet=
-phy-id0007.c0f0","ethernet-phy-ieee802.3-c22";
90e311ed817d0b Lukasz Majewski 2024-11-07  146  			reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  147  			smsc,disable-energy-dete=
ct;
90e311ed817d0b Lukasz Majewski 2024-11-07  148  			max-speed =3D <100>;
90e311ed817d0b Lukasz Majewski 2024-11-07  149  			reset-gpios =3D <&gpio4 =
12 GPIO_ACTIVE_LOW>;
90e311ed817d0b Lukasz Majewski 2024-11-07  150  			reset-assert-us =3D <100=
0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  151  			reset-deassert-us =3D <1=
000>;
90e311ed817d0b Lukasz Majewski 2024-11-07  152  		};
90e311ed817d0b Lukasz Majewski 2024-11-07  153  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  154  };
90e311ed817d0b Lukasz Majewski 2024-11-07  155 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  156  &pinctrl {
90e311ed817d0b Lukasz Majewski 2024-11-07  157  	pinctrl-names =3D "default=
";
90e311ed817d0b Lukasz Majewski 2024-11-07  158  	pinctrl-0 =3D <&hog_pins_a=
>, <&hog_pins_rev>;
90e311ed817d0b Lukasz Majewski 2024-11-07  159 =20
90e311ed817d0b Lukasz Majewski 2024-11-07 @160  	hog_pins_a: hog@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  161  		reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  162  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  163  			MX28_PAD_GPMI_RDY2__GPIO=
_0_22
90e311ed817d0b Lukasz Majewski 2024-11-07  164  			MX28_PAD_GPMI_RDY3__GPIO=
_0_23
90e311ed817d0b Lukasz Majewski 2024-11-07  165  			MX28_PAD_GPMI_RDN__GPIO_=
0_24
90e311ed817d0b Lukasz Majewski 2024-11-07  166  			MX28_PAD_LCD_VSYNC__GPIO=
_1_28
90e311ed817d0b Lukasz Majewski 2024-11-07  167  			MX28_PAD_SSP2_SS1__GPIO_=
2_20
90e311ed817d0b Lukasz Majewski 2024-11-07  168  			MX28_PAD_SSP2_SS2__GPIO_=
2_21
90e311ed817d0b Lukasz Majewski 2024-11-07  169  			MX28_PAD_AUART2_CTS__GPI=
O_3_10
90e311ed817d0b Lukasz Majewski 2024-11-07  170  			MX28_PAD_AUART2_RTS__GPI=
O_3_11
90e311ed817d0b Lukasz Majewski 2024-11-07  171  			MX28_PAD_GPMI_WRN__GPIO_=
0_25
90e311ed817d0b Lukasz Majewski 2024-11-07  172  			MX28_PAD_ENET0_RXD2__GPI=
O_4_9
90e311ed817d0b Lukasz Majewski 2024-11-07  173  			MX28_PAD_ENET0_TXD2__GPI=
O_4_11
90e311ed817d0b Lukasz Majewski 2024-11-07  174  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  175  		fsl,drive-strength =3D <M=
XS_DRIVE_4mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  176  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  177  		fsl,pull-up =3D <MXS_PULL=
_DISABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  178  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  179 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  180  	hog_pins_rev: hog@1 {
90e311ed817d0b Lukasz Majewski 2024-11-07  181  		reg =3D <1>;
90e311ed817d0b Lukasz Majewski 2024-11-07  182  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  183  			MX28_PAD_ENET0_RXD3__GPI=
O_4_10
90e311ed817d0b Lukasz Majewski 2024-11-07  184  			MX28_PAD_ENET0_TX_CLK__G=
PIO_4_5
90e311ed817d0b Lukasz Majewski 2024-11-07  185  			MX28_PAD_ENET0_COL__GPIO=
_4_14
90e311ed817d0b Lukasz Majewski 2024-11-07  186  			MX28_PAD_ENET0_CRS__GPIO=
_4_15
90e311ed817d0b Lukasz Majewski 2024-11-07  187  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  188  		fsl,drive-strength =3D <M=
XS_DRIVE_4mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  189  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  190  		fsl,pull-up =3D <MXS_PULL=
_DISABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  191  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  192 =20
90e311ed817d0b Lukasz Majewski 2024-11-07 @193  	keypad_pins_bttc: keypad-b=
ttc@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  194  		reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  195  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  196  			MX28_PAD_GPMI_D00__GPIO_=
0_0
90e311ed817d0b Lukasz Majewski 2024-11-07  197  			MX28_PAD_AUART0_CTS__GPI=
O_3_2
90e311ed817d0b Lukasz Majewski 2024-11-07  198  			MX28_PAD_AUART0_RTS__GPI=
O_3_3
90e311ed817d0b Lukasz Majewski 2024-11-07  199  			MX28_PAD_GPMI_D03__GPIO_=
0_3
90e311ed817d0b Lukasz Majewski 2024-11-07  200  			MX28_PAD_GPMI_D04__GPIO_=
0_4
90e311ed817d0b Lukasz Majewski 2024-11-07  201  			MX28_PAD_GPMI_D05__GPIO_=
0_5
90e311ed817d0b Lukasz Majewski 2024-11-07  202  			MX28_PAD_GPMI_D06__GPIO_=
0_6
90e311ed817d0b Lukasz Majewski 2024-11-07  203  			MX28_PAD_GPMI_D07__GPIO_=
0_7
90e311ed817d0b Lukasz Majewski 2024-11-07  204  			MX28_PAD_GPMI_CE1N__GPIO=
_0_17
90e311ed817d0b Lukasz Majewski 2024-11-07  205  			MX28_PAD_GPMI_CE2N__GPIO=
_0_18
90e311ed817d0b Lukasz Majewski 2024-11-07  206  			MX28_PAD_GPMI_CE3N__GPIO=
_0_19
90e311ed817d0b Lukasz Majewski 2024-11-07  207  			MX28_PAD_GPMI_RDY0__GPIO=
_0_20
90e311ed817d0b Lukasz Majewski 2024-11-07  208  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  209  		fsl,drive-strength =3D <M=
XS_DRIVE_4mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  210  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  211  		fsl,pull-up =3D <MXS_PULL=
_DISABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  212  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  213 =20
90e311ed817d0b Lukasz Majewski 2024-11-07 @214  	lcdif_sync_pins_bttc: lcdi=
f-bttc@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  215  		reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  216  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  217  			MX28_PAD_LCD_DOTCLK__LCD=
_DOTCLK
90e311ed817d0b Lukasz Majewski 2024-11-07  218  			MX28_PAD_LCD_ENABLE__LCD=
_ENABLE
90e311ed817d0b Lukasz Majewski 2024-11-07  219  			MX28_PAD_LCD_HSYNC__LCD_=
HSYNC
90e311ed817d0b Lukasz Majewski 2024-11-07  220  			MX28_PAD_LCD_RD_E__LCD_V=
SYNC
90e311ed817d0b Lukasz Majewski 2024-11-07  221  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  222  		fsl,drive-strength =3D <M=
XS_DRIVE_4mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  223  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  224  		fsl,pull-up =3D <MXS_PULL=
_DISABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  225  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  226 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  227  	lcdif_reset_pins_bttc: lcd=
if-bttc@1 {
90e311ed817d0b Lukasz Majewski 2024-11-07  228  		reg =3D <1>;
90e311ed817d0b Lukasz Majewski 2024-11-07  229  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  230  			MX28_PAD_LCD_RESET__GPIO=
_3_30
90e311ed817d0b Lukasz Majewski 2024-11-07  231  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  232  		fsl,drive-strength =3D <M=
XS_DRIVE_4mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  233  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  234  		fsl,pull-up =3D <MXS_PULL=
_ENABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  235  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  236 =20
90e311ed817d0b Lukasz Majewski 2024-11-07 @237  	ssp1_sdio_pins_a: ssp1-sdi=
o@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  238  		reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  239  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  240  			MX28_PAD_SSP1_DATA0__SSP=
1_D0
90e311ed817d0b Lukasz Majewski 2024-11-07  241  			MX28_PAD_GPMI_D01__SSP1_=
D1
90e311ed817d0b Lukasz Majewski 2024-11-07  242  			MX28_PAD_GPMI_D02__SSP1_=
D2
90e311ed817d0b Lukasz Majewski 2024-11-07  243  			MX28_PAD_SSP1_DATA3__SSP=
1_D3
90e311ed817d0b Lukasz Majewski 2024-11-07  244  			MX28_PAD_SSP1_CMD__SSP1_=
CMD
90e311ed817d0b Lukasz Majewski 2024-11-07  245  			MX28_PAD_SSP1_SCK__SSP1_=
SCK
90e311ed817d0b Lukasz Majewski 2024-11-07  246  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  247  		fsl,drive-strength =3D <M=
XS_DRIVE_8mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  248  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  249  		fsl,pull-up =3D <MXS_PULL=
_ENABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  250  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  251 =20
90e311ed817d0b Lukasz Majewski 2024-11-07  252  	wifi_en_pin_bttc: wifi-en-=
pin@0 {
90e311ed817d0b Lukasz Majewski 2024-11-07  253  		reg =3D <0>;
90e311ed817d0b Lukasz Majewski 2024-11-07  254  		fsl,pinmux-ids =3D <
90e311ed817d0b Lukasz Majewski 2024-11-07  255  			MX28_PAD_GPMI_CLE__GPIO_=
0_27
90e311ed817d0b Lukasz Majewski 2024-11-07  256  		>;
90e311ed817d0b Lukasz Majewski 2024-11-07  257  		fsl,drive-strength =3D <M=
XS_DRIVE_8mA>;
90e311ed817d0b Lukasz Majewski 2024-11-07  258  		fsl,voltage =3D <MXS_VOLT=
AGE_HIGH>;
90e311ed817d0b Lukasz Majewski 2024-11-07  259  		fsl,pull-up =3D <MXS_PULL=
_ENABLE>;
90e311ed817d0b Lukasz Majewski 2024-11-07  260  	};
90e311ed817d0b Lukasz Majewski 2024-11-07  261  };
90e311ed817d0b Lukasz Majewski 2024-11-07  262 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
