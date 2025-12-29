Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F1714A8B
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766977924; cv=none; b=Zej8EK0x/Tbl9pVyv8AEFduPf+CtpMbwb1m4c8oN4xUGolCqeLuClFTYmxB14iRmbFcX/brVkgEMoKyNpH9pL35/cOycG1he+1pnQm8m9CduXKTZdcFbOER7ip/87P9js7ftAmZ2UAWdbClnibt+ktRl6EXkhzTPFHYbmjuNAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766977924; c=relaxed/simple;
	bh=xPHXLaN2w6nETIbi1cU89oeCnWSTZe8OQZfyxOU38co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZU4czX/t0pnaDKuxA9kqc3hq8jPqeNJzuwLLj5J816eC8FJaIXO2Ff0uPdrt2FmgNKXaAJTItBD73W632zFEq5CkEHsXuQbqiT4S/vQPvV26rVQq9KaE78l8GbiRbmBvuxDt0C1xF0iZGkjy9g2bXdyFggqLJV5EmApAik/wUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asV8EwHA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asV8EwHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766977922; x=1798513922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xPHXLaN2w6nETIbi1cU89oeCnWSTZe8OQZfyxOU38co=;
  b=asV8EwHA4h9GlXwjfnne+ccjqKU4j5QcmW42/niHbnfSimSemwO1r3ON
   MpoJ2J15EqnybHfxrlndx1Qb2hC9yisWr51N51K0EZ7/CQ+0A75hEDnUq
   HU6H/DaixPKvi6hXkyVai0UQXmaa9d2990EUGm30wTt0E4rN9MJkkHBCQ
   hm8J/zj8g9AkZG8Cm/Lo+9qk6VLgpVs1GAvbuvINj95oIfKAGuZjXkZ7u
   HeUjhrKanRlHU4Pm6Ec+g2Gkv9DAShLTcIVC+fa8w0ouZDbUWbPTJSNSE
   gWMQNQSrkLCpD46Zp0JsiCA59/HT4RU/YjjxsQBPEWXrkE2cXZjo7vFFd
   g==;
X-CSE-ConnectionGUID: XQ93SSiWR26sm8kJVLLh6Q==
X-CSE-MsgGUID: lEq2PTmSTDK+Q/dzaabc7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="94064472"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="94064472"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 19:12:01 -0800
X-CSE-ConnectionGUID: uSgElnsOQxW63lzIS+cRyQ==
X-CSE-MsgGUID: xp3W703dTzKfgp6fASA1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205732138"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2025 19:12:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va3fq-000000007f2-0tmo;
	Mon, 29 Dec 2025 03:11:58 +0000
Date: Mon, 29 Dec 2025 04:11:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 37/128]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: framebuffer@0
 (apple,simple-framebuffer): 'post-init-providers' does not match any of the
 regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
Message-ID: <202512290405.0abIR5Ff-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 08a810d95d197e56c1809677e49abedb41ed11ee [37/128] arm64: dts: apple: t600x: Add DCP power domain to missing devices
:::::: branch date: 6 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251229/202512290405.0abIR5Ff-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251229/202512290405.0abIR5Ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512290405.0abIR5Ff-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /sound: failed to match any schema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /sound: failed to match any schema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /sound: failed to match any schema with compatible: ['apple,j316-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /sound: failed to match any schema with compatible: ['apple,j316-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
