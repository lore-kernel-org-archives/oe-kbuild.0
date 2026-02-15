Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4391C45C0B
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771182199; cv=none; b=kHwSD+yYpRs+0vMbLmBID5gDFCTWwyPxr6VXlFmO7UXysYaPKL5E/Vn8vlbTn2we3rM2i8i8rBJgRQqOePjZctuRpPwVEgpmvmAmHeBa6GueczVbhx8DjpYOAs0bxiV1qqxPbBrOvG51POIMVnTu2KkHQd3H/xtelFLFhJi6K0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771182199; c=relaxed/simple;
	bh=vEY0F8s3CvuiGuztnmgWGyHLePx9YsJDTSKoHains5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hVUJftPv2VxZqQNVkUvESGdfLYv0za4S0Em/Xq5yRg6d/354mBKb3PxwZC6b9VSLZJ8mIXUZK8EmURVs/d+vlt89Wqb7vCvtOCHVSvUrWLmPuaNtt+km1f1McNvHlWYLenmaJO2Nzq/sxDz6R+yeieJA+bKxDPjxd289ggLzbK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzY8HxUX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzY8HxUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771182196; x=1802718196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEY0F8s3CvuiGuztnmgWGyHLePx9YsJDTSKoHains5s=;
  b=AzY8HxUX1QK8e0LQpHsdpBJUMYc/5BnyFWVika+SoaDUBEEhJdxTzKe7
   HsVdam0fNAVlgTatWA1s5S74u22xr58/qvJqCkANl93f4jzdIG4dIoMel
   91BzuaukMn7hgyhgGK5qE53hxlkOMWmQA5Ue6JYP4UBcZGxp6Bnfa1ZX4
   ZwwEDRK3qFEBA5ZETWe46FDKmMGJO2CmN9Tz3mDpGGmC7Y/fRoqI6sVvd
   U2vriY3iaDQAEOk6xJyI4+fSNjMj5RgVsg9YZKCTfWYyLNTeFCha5blSm
   ytA2R076KF5LcdSp+1vJ5DbyMKnHF6MQxLcpy6k3ltu7fOZna4xOdkRR6
   g==;
X-CSE-ConnectionGUID: 288U47BxQ529IKDDIODTTQ==
X-CSE-MsgGUID: /mAkpm4tQKimS3LfgOtOog==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72376806"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="72376806"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:03:16 -0800
X-CSE-ConnectionGUID: /gKTQgYHQcyq8HtjSz6zng==
X-CSE-MsgGUID: jRhnBn4nR2KJlYFattC7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="242615537"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2026 11:03:14 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrhOi-000000002Dp-1uDT;
	Sun, 15 Feb 2026 19:03:12 +0000
Date: Sun, 15 Feb 2026 20:02:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
Message-ID: <202602152058.ORIhgZzV-lkp@intel.com>
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
In-Reply-To: <aY_BpRQmLdqOOW2K@google.com>
References: <aY_BpRQmLdqOOW2K@google.com>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
CC: Arnd Bergmann <arnd@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on robh/for-next soc/for-next linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/ARM-tegra-paz00-configure-WiFi-rfkill-switch-through-device-tree/20260214-083759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/aY_BpRQmLdqOOW2K%40google.com
patch subject: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260214 (https://download.01.org/0day-ci/archive/20260215/202602152058.ORIhgZzV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602152058.ORIhgZzV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602152058.ORIhgZzV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra20-paz00.dtb: /i2c@7000d000/tps6586x@34: failed to match any schema with compatible: ['ti,tps6586x']
   arch/arm/boot/dts/nvidia/tegra20-paz00.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra20-paz00.dtb: /pcie@80003000: failed to match any schema with compatible: ['nvidia,tegra20-pcie']
   arch/arm/boot/dts/nvidia/tegra20-paz00.dtb: gpio-leds (gpio-leds): led-0:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'rfkill0' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'rfkill0' does not match '^cpu[0-9]*$'
   	'rfkill0' does not match '^hci[0-9]+-power$'
   	'rfkill0' does not match '^mmc[0-9]+$'
   	'rfkill0' does not match '^phy[0-9]+tx$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
>> arch/arm/boot/dts/nvidia/tegra20-paz00.dtb: rfkill (rfkill-gpio): 'reset-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/rfkill-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
