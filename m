Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB938DD4
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Aug 2024 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723329170; cv=none; b=T3fLQAjEr3ucofCg2gAvuXY5isHRXz4hSu/WhzK6V0foXkyVkhBDcWvTGuqtpIaXmEY//zd5c2qYQMZZyhf69srxsriV4EEWesqsr4Sm1KF6omPhsG4DtLo8T31PZHS0bsRVtvWHeC78JlNX8OmiNhNpM9i7Q1QnimjqhT7SD+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723329170; c=relaxed/simple;
	bh=QNWdShG/Hw7cRBMx2f6FgcYa42A6C9L7nF5GjgFEBQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1VTwcHcwLKfyr5EGuAcfk03PUmkh7x/5AASVgmQnjJ2Bc8eLj50qWDJs/1WOhJWpHA2LOUJJcA8VVfHFLXCCijo6SMGchraI/q0/qOgV7YR8csgyEV3IPUZqi+IjyLEHdB+wZbVrg398RipJ2eLTo8JBlH7XepbuKlPfaWkxZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+eoy/o3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+eoy/o3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723329168; x=1754865168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNWdShG/Hw7cRBMx2f6FgcYa42A6C9L7nF5GjgFEBQw=;
  b=c+eoy/o35y9zfnsWJMowIiyVqzWgLpB20QXzcs6jPjppcRrNHIL6ePLl
   5dlAYy5K9hJQC/hzXCvw7GA2ZA6CtDqbgpP3NqzC5zYmpZe+ogOVdmBkN
   S4JYWRJcooFLUtqdIXXx4RmcKK25OYwjBQRrHbh3DxKo6pLXCoolhcVlZ
   7V1mQEj05j1Slr8WW8jFbe4dCWF0R3wyO2znrq1ybWgx+UWjhBzujCq4R
   zFEQPd4cJsICYoIHM7g59Sk2XPfzI3OeC51o1nCWC8sMPfW5Xz/9apKHc
   c3aBJ1YqFRAoRtZOIpoIUbRh//qyxt3ZzsdPWFgHu7dyF2t8SNpRUAF0I
   Q==;
X-CSE-ConnectionGUID: GSJo+jVwTVGz8rSbwD652Q==
X-CSE-MsgGUID: 4XYqClLeSUCQ0mIBoxxRtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="32885757"
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="32885757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 15:32:48 -0700
X-CSE-ConnectionGUID: Fkq+VCFrT9y5XbbqsEDN1A==
X-CSE-MsgGUID: fB3PFDOAQI690u+USeOfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,280,1716274800"; 
   d="scan'208";a="88743051"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Aug 2024 15:32:47 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scudg-000AMR-2k;
	Sat, 10 Aug 2024 22:32:44 +0000
Date: Sun, 11 Aug 2024 06:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 28/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <202408110618.ZuCSphQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 4c378b4ec3bb24f4d0d8621604a6433d9afe04b1 [28/78] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408110618.ZuCSphQT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110618.ZuCSphQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408110618.ZuCSphQT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-733.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: usb@c9100000: '#address-cells', '#size-cells', 'hub@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: hub@1: 'reset-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/genesys,gl850g.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
