Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA0244677
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754742966; cv=none; b=KUy0HMJTHzNgffnD0pz0e66z9y5mwPdiEgepZzmDMPZKtu/a5ysxrYFsishWYEJtxjypjoZ+kKiQZFIdxAi1g4xM5osKf/d2mHuF6DxK75bRPSvP1sm/4V0c5NXJrs1KBoD+H9OjZX1ryPezHxIAPNlplHJbE8hqVZTQAo8Xy8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754742966; c=relaxed/simple;
	bh=Y7rcuTHWr5vSeb0kpfY+cXkBZqZM+KQrkw6Tccj8ffw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvFkj4D9UzVvQ7vBmkL9QJQhBYGlN8jPQ9b3/dW3qbhei+S7etOpICm5ZX9IOPBE1vOIReP50hjNm+nSrj5P4FbBXYlqME1fOL74896e+uS3hX68cfx3Zk+X+Bexo282TvtY+1t+13AsuJcSg04eY/+kt6Xn3XP3epNgDIl31v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQwVF1/l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQwVF1/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754742965; x=1786278965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7rcuTHWr5vSeb0kpfY+cXkBZqZM+KQrkw6Tccj8ffw=;
  b=WQwVF1/lIkUTMYLHAd9TgBrVd5CSlXEjf0RUfiDtWSHOrZuPASka16l0
   l+Lb1cDP1xbL+3hhQhVWxuSPCbQR2Zsait304ZzGW2760dAsUS7NVjHKF
   XOBJuG7qut4Fx6WPK9HAcRvFutyZY8E19dvDCx1Sb6pfoWLBC6XYeyblN
   ErQps76pI4kjX1gczP1+kDqP9uaFuvkj4JO9nc4LtIwVY9AVVSfm1iPwD
   Udb/vs1yh7TUqJEFfOjgYiKexqckYWDf3farx+DwLDqYTmV5bikRCg7Ok
   wbF10HM3oW6PDSFoxYFxUGem6lGovd+VYbs1dO02bzRius1fJIc+GNLhp
   A==;
X-CSE-ConnectionGUID: ZE4IdqBNTPmHxquLjTOIkw==
X-CSE-MsgGUID: ql7c9joBSoOnyMtsGctg5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56994545"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56994545"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 05:36:04 -0700
X-CSE-ConnectionGUID: 7XKczX3PTy+gHi5Xvz/j0g==
X-CSE-MsgGUID: seCPxt03TCuZqLisBkrUzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169974039"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Aug 2025 05:36:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukinp-0004my-0K;
	Sat, 09 Aug 2025 12:36:01 +0000
Date: Sat, 9 Aug 2025 20:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-wip 49/208]
 arch/arm64/boot/dts/apple/t6001-j314c.dtb: framebuffer@0
 (apple,simple-framebuffer): 'post-init-providers' does not match any of the
 regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
Message-ID: <202508092030.1dZA8bmr-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: d1638d803ce6646c052c3e0e08a8d716cbca41ba [49/208] arm64: dts: apple: t600x: Add DCP power domain to missing devices
:::::: branch date: 6 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-052-20250804 (https://download.01.org/0day-ci/archive/20250809/202508092030.1dZA8bmr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508092030.1dZA8bmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508092030.1dZA8bmr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: usb@1302280000 (apple,t6000-dwc3): iommus: [[209, 0], [210, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6000-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6000-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: framebuffer@0 (apple,simple-framebuffer): 'post-init-providers' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /sound: failed to match any schema with compatible: ['apple,j314-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
