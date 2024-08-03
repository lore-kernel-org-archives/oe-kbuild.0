Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427712E55
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722723450; cv=none; b=nnIvpK1WP+/TDdOiwim0CfvRP9p+rTBBuX4yE5gNkaRtThJID6p1ZCGslmwiLVF/DzwJ3ssc0qV3sAUlCQFRRz770ZCnr8sK6qtxqa1joncGlEZ+0YHPpn6L1JsXEepk2WsThjOM73m0zZlsCK+xTle0qZlNo/HSsMtJLTinXoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722723450; c=relaxed/simple;
	bh=0jLawkAwCs2vhI4XL5hKe4hSIWZOaPUA+R8Nv6BH8wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vExMV7uGsAfuVKFz34TtYEljeJblhE/LHZLV7tZoyIHNonRmeb7Jz9FtNFMAtLzfhVZCCjXQQBqkxFkMuNg6pUKZEZ64TxOI20dj7lzUH6Y3Oj1ZoX+OpqJ7sOo/YcqzSKCKEvDfnDZyECeh/xYSIYEz00Q5FZe8I5E3Bbubpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=miJ14/Yt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="miJ14/Yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722723449; x=1754259449;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0jLawkAwCs2vhI4XL5hKe4hSIWZOaPUA+R8Nv6BH8wo=;
  b=miJ14/YtQssZOkXoXIXyeBXHQ6uoIPkj4f7NdL/Ast6NDcjsPIPLqpI5
   o2oXtDn1KdRtARC6YyTYJHyyOPT8OCjZ3XGFXV6iNUxcoUe0b2ZBLhlJY
   9H7A4RoF6lQ6K0inbGKrBFZ/ick1UZhm6zjOby9FaT7hCZOOHOsqpCSNT
   UyQio4fgOOfK+KwBbsb9lXb3dtdvbiICIyIhsZFALPL5knQWX8zjv+CiP
   saJP3n7s07JZlsplaA18eqLPW9UeG7m1H2weZMeg0ny7ZtmHsMA0b+v63
   LGHpIQzWHwzvDVpobwCLPEhGXO+cm2z9+Jizo1nrm34bpikKSoZDrXjBU
   Q==;
X-CSE-ConnectionGUID: SxrJsFKATbuGcGntkBQpnQ==
X-CSE-MsgGUID: AePP8xivQtGNLjdIQliYPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20532084"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="20532084"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 15:17:28 -0700
X-CSE-ConnectionGUID: mhnV5xTlQyWVOvqXM5D2Rw==
X-CSE-MsgGUID: LzxRjzYpS26uH/DdHqnaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="55993105"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Aug 2024 15:17:27 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saN40-0000wk-0S;
	Sat, 03 Aug 2024 22:17:24 +0000
Date: Sun, 4 Aug 2024 06:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 8/12]
 arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: cdns-usb@f900000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408040604.XKucoo9P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-usb@vger.kernel.org
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   d483f034f03261c8c8450d106aa243837122b5f0
commit: f7fd939e805672417bbf418f6035dec9400230fd [8/12] dt-bindings: usb: ti,j721e-usb: fix compatible list
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408040604.XKucoo9P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040604.XKucoo9P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408040604.XKucoo9P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac.dtb: adc: 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-dualemac-mii.dtb: adc: 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl-wlan.dtb: cdns-usb@f900000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am64-usb'] is too short
   	'ti,j721e-usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
