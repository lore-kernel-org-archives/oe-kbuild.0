Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CB3403EE
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199040; cv=none; b=uOSwi75vrpTs95I9NZt58wThEQC7XQL4PRtyeyJpyH4gW1SJeTN4FA7fM1hAO0dxR74Q6GQIqe31yLmG7aKnCpe0JahI1Gv7P/A+XeMxqN2pMe20JO75j5GePzbIKqd32i7xNIEhMj11pfhtemf+Hu/jp/D2VbwivTHQ2JPBh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199040; c=relaxed/simple;
	bh=8EvB7idMH8pXBC8t1/f34thhqQ8GZSL+GAabKnRP/MQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iwi2PEEdm8fNVglfQ/mJ8L8bQFARdVVasBYME02R0s/QHE7EMpNvVd+j37i80TZRmXfQV540Z96uDc8kh+kWjraYu1k9i71DG/9B+1PUhanRelekbKD4hR5cZUzDD6Lnh+/aNld9CDNNqZCwGk1Uv4NL9+SNlci0vU4A8nVPFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNS5kB+J; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNS5kB+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199039; x=1810735039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8EvB7idMH8pXBC8t1/f34thhqQ8GZSL+GAabKnRP/MQ=;
  b=UNS5kB+JoqOu2iVgCtm6PAQTXpqxGQhwBK6/3ACOO9BctdT09DFaM3UJ
   rdpb1x8DtNnYueUGp+nVWsyT4VNB40xwLWWY/slF0OjSJ7k8rkTEQp2Hg
   GX0NPVAkpDdzOULYLN3y7Fzgb8Ph2dry3ZFKLl45wX0eNCCkcQ7+ayPLt
   qAabAEEPj1Gt5ieLmpcnJl5JrU7B32uPv768a9Q6/MmYKWDl4xdSSdFob
   Ppf2iPWu6msKOp1iF4gShBfzSQCwD2sP/moUbjFF5+E/+uLxiWCFrRrO6
   Op8MiHEtMN0Ta84cERmi88uNReODhPPB73BNop1wFOE8E7iMS30vMEgN5
   w==;
X-CSE-ConnectionGUID: e1EqWdcUS0KSA40Cr4/nOg==
X-CSE-MsgGUID: MyxMv8nGTTax0dULQM/z8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90772630"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90772630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:57:18 -0700
X-CSE-ConnectionGUID: Vx8fBK7USHSHuVSD0RhUbQ==
X-CSE-MsgGUID: R3Rlm8TeQvud8EqpaoGHWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243776059"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 06:57:17 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPKwd-00000000ADN-0OMX;
	Tue, 19 May 2026 13:57:15 +0000
Date: Tue, 19 May 2026 15:56:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for
 S32G platforms
Message-ID: <202605191524.QYYlQnoP-lkp@intel.com>
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
In-Reply-To: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
TO: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
TO: Chester Lin <chester62515@gmail.com>
TO: Matthias Brugger <mbrugger@suse.com>
TO: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: NXP S32 Linux <s32@nxp.com>
CC: Christophe Lizzi <clizzi@redhat.com>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Enric Balletbo <eballetb@redhat.com>

Hi Khristine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khristine-Andreea-Barbulescu/arm64-dts-Add-usbphynop-and-usbotg-pinctrl-for-S32G-platforms/20260518-141711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260518061522.2884441-2-khristineandreea.barbulescu%40oss.nxp.com
patch subject: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-2055-20260518 (https://download.01.org/0day-ci/archive/20260519/202605191524.QYYlQnoP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191524.QYYlQnoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605191524.QYYlQnoP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'usbotg_pins' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: usb@44064000 (nxp,s32g2-usb): Unevaluated properties are not allowed ('fsl,usbmisc', 'fsl,usbphy' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'usbotg_pins' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: usb@44064000 (nxp,s32g2-usb): Unevaluated properties are not allowed ('fsl,usbmisc', 'fsl,usbphy' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm64/boot/dts/freescale/s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: pinctrl@4009c240 (nxp,s32g2-siul2-pinctrl): 'usbotg_pins' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: usb@44064000 (nxp,s32g3-usb): Unevaluated properties are not allowed ('fsl,usbmisc', 'fsl,usbphy' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
