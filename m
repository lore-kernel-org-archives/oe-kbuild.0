Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6685D2E628
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731186730; cv=none; b=C4wx2wnoowuOtdDhF8LxbtjfyZxcw8s3bcG7Mra0eXnozSkHmIUi7NQnW6kC+MgOu6I0o/RQfUs8jxp0i9ImHx51z5vfLupbYy0cE1O7k/cx4OdxMfj5BZohCOduoGulHDG5QKY/7ZBrMR6LC8mPorvUT83aRFe1f2VeKGmGzuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731186730; c=relaxed/simple;
	bh=P2GllrrRA4es+vYMJmfjRGA5OOyY2e/b2uupDB8RiT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqXCHBy3xEipw4y3sshAvAOzb0jQAvMWsmsGJ8YLIX5qsqlpUao/0HOPfq/C/qHdYh917FT36Y9ISZSTQHZghIkiaSiswuPqiSIne3AsGwEJ94nwW8sLcO8wgGsOCvsQzVV979qVlUrjc4A8Y8cFjS0UI7xvvtC5UfTCm+FbAxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1pDMFKA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1pDMFKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731186722; x=1762722722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P2GllrrRA4es+vYMJmfjRGA5OOyY2e/b2uupDB8RiT4=;
  b=X1pDMFKAv08SNhnA5/mnEBh0EfeGq/On0GFnWIKucoM+RtVvpbjw3tvv
   I6jt7usnJ5lF16897H6HAVP9SNfSXtN+eIQZ2QH49RYrQ86IOon6vWR6W
   oVrcxexbPkskkVNnWxap2VsdCKjM9HAmDilZhYqLBtT68Ce+pRmGQVLp4
   EnWg+X03Bumx8wbnK5dstBjPC4x19sl6v50EzkoJma3oca2hGUqDb3/oj
   jC7omlIUIIXXXNIeFkZiCMPtlDj4eIdhGTt8OYzqzQ5RNOS1GLKTlvf8L
   kF6VllsrxJ7zB0Q0twqtsfFGTkQz5N4nbLrqrFgULXhOztDILiewoSCUJ
   Q==;
X-CSE-ConnectionGUID: SihSt8EDSPq617OCo3MAlw==
X-CSE-MsgGUID: zEgCznDKSPemLl4ertEpJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="18663973"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="18663973"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 13:12:02 -0800
X-CSE-ConnectionGUID: fjkShnTqTZ6hOPlE9GmN8Q==
X-CSE-MsgGUID: 9HhuuOJ5Q6ajsyUPO7seuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86325218"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2024 13:12:00 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9skP-000sdu-1w;
	Sat, 09 Nov 2024 21:11:57 +0000
Date: Sun, 10 Nov 2024 05:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 3/3] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <202411100454.iJmeQSkX-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-053-20241107 (https://download.01.org/0day-ci/archiv=
e/20241110/202411100454.iJmeQSkX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241110/202411100454.iJmeQSkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100454.iJmeQSkX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
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
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
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
--
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
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
ssp1-sdio@0: duplicate unit-address (also used in node /apb@80000000/apbh-b=
us@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/interrupt-controller@80000000: failed to match any schema with compatib=
le: ['fsl,imx28-icoll', 'fsl,icoll']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: nand-controller@8000c000: #s=
ize-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: $nodename:0: '=
spi@80010000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80010000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'non-removable', 'vmmc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: $nodename:0: '=
spi@80012000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80012000: Unevaluated pr=
operties are not allowed ('#address-cells', '#size-cells', 'bus-width', 'cl=
ocks', 'keep-power-in-suspend', 'mmc-pwrseq', 'no-1-8-v', 'non-removable', =
'vmmc-supply', 'wlan@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mxs-mmc.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80014000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: spi@80016000: Unevaluated pr=
operties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/mxs-spi.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: compatible=
: ['fsl,imx28-pinctrl', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: pinctrl@80018000: 'auart0-2p=
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
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
   arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbh-bus@80000=
000/digctl@8001c000: failed to match any schema with compatible: ['fsl,imx2=
8-digctl', 'fsl,imx23-digctl']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/lradc@80050000: failed to match any schema with compatible: ['fsl,imx28=
-lradc']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dtb: /apb@80000000/apbx-bus@80040=
000/timrot@80068000: failed to match any schema with compatible: ['fsl,imx2=
8-timrot', 'fsl,timrot']
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
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
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
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
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
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
--
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:443.25-467.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:587.35-601.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/hog@1)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:620.36-627.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@1: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/hog@1)
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
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/keypad-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/lcdif-bttc@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/lcdif-bttc@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
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
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/ssp1-sdio@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:166.19-174.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpio@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:216.27-225.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:238.34-249.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/duart=
-4pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:251.30-273.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
nand@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:275.40-283.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/gpmi-=
status-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:285.29-296.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:298.36-307.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
0-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:309.29-320.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:322.36-331.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
1-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:333.36-342.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:355.34-366.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
2-pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:368.29-379.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:381.36-390.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
3-2pins@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:403.30-412.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/auart=
4@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:425.25-441.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:469.25-482.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mac1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:484.35-502.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
8bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:504.35-518.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:520.32-526.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:528.34-535.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc0-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:537.35-551.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:553.32-559.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:561.34-568.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc1-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:571.35-585.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
4bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80=
000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:603.32-609.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
cd-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:611.36-618.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/mmc2-=
sck-cfg@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus=
@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:629.25-638.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:651.25-660.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/i2c1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:673.27-684.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif0=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:698.27-706.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/saif1=
@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800000=
00/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:708.25-716.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:718.25-726.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:728.25-736.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:748.25-756.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/pwm4@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:758.39-789.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-24bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:791.39-816.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-18bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:818.39-841.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-16bit@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@=
80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:843.37-854.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/lcdif=
-sync@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8=
0000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:856.25-865.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:867.25-876.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/can1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:878.25-889.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi2@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:891.25-904.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/spi3@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:919.25-927.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:939.25-947.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb1@=
0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000000=
0/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28.dtsi:959.30-967.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@80000=
000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28.dtsi:969.31-977.7: Warning (unique_unit_=
address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/usb0i=
d1@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@8000=
0000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:160.20-178.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
hog@0: duplicate unit-address (also used in node /apb@80000000/apbh-bus@800=
00000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:193.34-212.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
keypad-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh=
-bus@80000000/pinctrl@80018000/wifi-en-pin@0)
>> arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:214.37-225.4: Warning (unique_=
unit_address_if_enabled): /apb@80000000/apbh-bus@80000000/pinctrl@80018000/=
lcdif-bttc@0: duplicate unit-address (also used in node /apb@80000000/apbh-=
bus@80000000/pinctrl@80018000/wifi-en-pin@0)
   arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi:237.32-250.4: Warning (unique_=
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

vim +214 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi

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
90e311ed817d0b Lukasz Majewski 2024-11-07  193  	keypad_pins_bttc: keypad-b=
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
90e311ed817d0b Lukasz Majewski 2024-11-07  237  	ssp1_sdio_pins_a: ssp1-sdi=
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
