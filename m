Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94C4C8E
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 05:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746162834; cv=none; b=ViPUE/Jnmvk+I5l927jDXeZq2UjyyBIhIjr6OIiAz/4gBKDQg9Sfrx/yHx4iUBTf7TDUKdFgwchd34tLEQfA+1ySis4MfAYhJN6EWL1jXtfsnaE6teaIGCn+K0Xg33NZr17eIJK9M5nFJ5P7tGkDjQLZYn39rk6sYcU6+I9SliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746162834; c=relaxed/simple;
	bh=72aXHe9tYhX4Ibsn7DlvPHtRH7KYyIPJb10mq3+8IFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sziCvHbWpXr2ljDF/XEQxEYyOxZ/l7nuBxd6YOdtZS7rJZ04tgRGkRAKobyKmvONWcbjqCVb2Bo1/A7I8w/hxEmHUQwwW4V679KCu0xCr8cTsY6DnNlYCvVf5lkIHfzWKEgiz866CJL58Qjdi+8iODVJIhtN9GId3eKs+jJnyA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaAUM9Cv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaAUM9Cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746162832; x=1777698832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72aXHe9tYhX4Ibsn7DlvPHtRH7KYyIPJb10mq3+8IFY=;
  b=LaAUM9Cv1mOocsPoQLMERTDOwb0sCQLtOaKbr/sa9dBpXEkxQne8L6ru
   kocPsEyiZzN7ATlDkmcYiViivnVAWgIQoBcx5HGUYR9fiaDGJG/kIi1hn
   /k6OeikMfYxkhlKdugcu9LH3bRHBGff3Cm2ECKGcjzRSeJdNXZ+VkT/s3
   yVZQfbh8COHgxmm9/AplXXvNnQBbieAkImrNA4a6f1JW2TpWte0geYNZU
   C8Lfebt1uQnXGRN1ggNM+y47pD2Ie12NrY5BHOSCyVw4eUQWeEvKVgCw3
   1k2SEhKQZUu5GPrwzC0c5K91259eEqnrzytYfg7hAsW3lzeFqn7fTr5U5
   Q==;
X-CSE-ConnectionGUID: ru9tfJOyQ/G8+MTgGqhjfA==
X-CSE-MsgGUID: aZIh02AcS7CfHx97R4CJsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58510660"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="58510660"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 22:13:51 -0700
X-CSE-ConnectionGUID: zDMMO8ExQlSk12HCSUPqIg==
X-CSE-MsgGUID: fd/dly39RWyY+VFReDiMSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="165483234"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 May 2025 22:13:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAiiZ-0004YX-2f;
	Fri, 02 May 2025 05:13:47 +0000
Date: Fri, 2 May 2025 13:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dt: imx95: Add TQMa95xxSA
Message-ID: <202505021211.PlxSFPTq-lkp@intel.com>
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
In-Reply-To: <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
References: <20250428135915.520432-2-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux@ew.tq-group.com
CC: linux-renesas-soc@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20250501]
[cannot apply to robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/arm64-dt-imx95-Add-TQMa95xxSA/20250428-221236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250428135915.520432-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 2/2] arm64: dt: imx95: Add TQMa95xxSA
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250502/202505021211.PlxSFPTq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021211.PlxSFPTq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021211.PlxSFPTq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:276.9-288.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('linux,code' was unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@81', 'protocol@84' were unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: usb@4c200000 (fsl,imx95-usb): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb'] is too long
   	'fsl,imx95-usb' is not one of ['fsl,imx27-usb']
   	'fsl,imx95-usb' is not one of ['fsl,imx23-usb', 'fsl,imx25-usb', 'fsl,imx28-usb', 'fsl,imx35-usb', 'fsl,imx50-usb', 'fsl,imx51-usb', 'fsl,imx53-usb', 'fsl,imx6q-usb', 'fsl,imx6sl-usb', 'fsl,imx6sx-usb', 'fsl,imx6ul-usb', 'fsl,imx7d-usb', 'fsl,vf610-usb']
   	'fsl,imx95-usb' is not one of ['fsl,imx8dxl-usb', 'fsl,imx8ulp-usb']
   	'fsl,imx95-usb' is not one of ['fsl,imx8mm-usb', 'fsl,imx8mn-usb', 'fsl,imx93-usb']
   	'fsl,imx95-usb' is not one of ['fsl,imx6sll-usb', 'fsl,imx7ulp-usb']
   	'fsl,imx27-usb' was expected
   	'fsl,imx7ulp-usb' was expected
   	'fsl,imx6ul-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: usb@4c200000 (fsl,imx95-usb): interrupts: [[0, 176, 4], [0, 174, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: usb@4c200000 (fsl,imx95-usb): Unevaluated properties are not allowed ('compatible', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/chipidea,usb2-imx.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: /soc/usb@4c200000: failed to match any schema with compatible: ['fsl,imx95-usb', 'fsl,imx7d-usb', 'fsl,imx27-usb']
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc'] is too long
   	'fsl,imx95-usbmisc' is not one of ['fsl,imx25-usbmisc', 'fsl,imx27-usbmisc', 'fsl,imx35-usbmisc', 'fsl,imx51-usbmisc', 'fsl,imx53-usbmisc', 'fsl,imx6q-usbmisc', 'fsl,vf610-usbmisc']
   	'fsl,imx95-usbmisc' is not one of ['fsl,imx6ul-usbmisc', 'fsl,imx6sl-usbmisc', 'fsl,imx6sx-usbmisc', 'fsl,imx7d-usbmisc']
   	'fsl,imx95-usbmisc' is not one of ['fsl,imx7ulp-usbmisc', 'fsl,imx8mm-usbmisc', 'fsl,imx8mn-usbmisc', 'fsl,imx8ulp-usbmisc']
   	'fsl,imx6sll-usbmisc' was expected
   	'fsl,imx6q-usbmisc' was expected
   	'fsl,imx6ul-usbmisc' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: usbmisc@4c200200 (fsl,imx95-usbmisc): reg: [[0, 1277166080, 0, 512], [0, 1275133972, 0, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usbmisc.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: /soc/usbmisc@4c200200: failed to match any schema with compatible: ['fsl,imx95-usbmisc', 'fsl,imx7d-usbmisc', 'fsl,imx6q-usbmisc']
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
