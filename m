Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678D36B
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 01:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202149; cv=none; b=e+3YJOQhGdBm7wbwV6OkWUVwHegObLqj1Ux55fqV4W9sUe7cD+ZSisVSSIogHL3BCvO+At20XmF/M/01+XZFlR/lyl0/ajUYwvz9vhhByGB0IjdNzZUHFGqgYff0DYqZDG+RhP16f4KeAz2aR2W4Ct+MCjh08Ar0t17QOS30PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202149; c=relaxed/simple;
	bh=/EtPIvApnp4GSErSFi2Qr3kTfs3mcZkfgbGiFAI+Tk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gem2q7jg046FzdzHo3N17GWwHUjInoP8fdIDTB3cdGQglzzW9IvJuPGc0ICMo/5tFCiy03j//+c00tQdd8TyPO8ah0ayuudww6bntYpuIF2TdU8y1Bg3kqqMqx1CKtbFacIZ54hnZ/miN9VyINxzMXoWQjK+oT9LBl3buVXWe3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grh8X1P+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grh8X1P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731202148; x=1762738148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EtPIvApnp4GSErSFi2Qr3kTfs3mcZkfgbGiFAI+Tk8=;
  b=Grh8X1P+/aE7f3nnETwBFIUvGfh0hJMvTz+zekzb4RhRgVNp4jTnMSR+
   Q+xaAXwGLwXwTeYIZeLI5iigaeFO7vidgJyQZfZNNQzHZdPUrHbg1654K
   g3fRIhfwfYZibIGlr/4t+m4daMj5d8QB6rnhM5SebxEF4bKEtFQOQtvlX
   aJEiXVCPxDMNQjdSJ7QVkwIirbgYPeYT0pDvMBS9v0miGhGCol4W3Gx2j
   jG47V4cDY1pkHKv3Ps/DGRL7L84EbkfNscCc5oWgKREkGR15BEhYYb2Ik
   t5P8jUCOpbQksaECFdOX+LlFY9jM5hj+LLc6rtFk/Q5V9WTg3dSYE2Nup
   A==;
X-CSE-ConnectionGUID: hvDqu49+RbaFlefJ4WO0Zg==
X-CSE-MsgGUID: 6wP8GNSOTIyBo03n03Lpjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42145059"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42145059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 17:29:08 -0800
X-CSE-ConnectionGUID: 6jWpliGWSCWCUSqhLpAb7Q==
X-CSE-MsgGUID: wYioxFtpT32CvZhSYUpasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="117158945"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2024 17:29:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9wlE-000soU-1H;
	Sun, 10 Nov 2024 01:29:04 +0000
Date: Sun, 10 Nov 2024 09:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.13-armsoc/dts64 64/84]
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: analog-sound:
 'simple-audio-card,hp-det-gpios' does not match any of the regexes:
 '^simple-audio-card,codec(@[0-9a-f]+)?$',
 '^simple-audio-card,cpu(@[0-9a-f]+)?$',
 '^simple-audio-card,dai-link(@[0-9a-f...
Message-ID: <202411100928.a8IqvTCe-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Cenk Uluisik <cenk.uluisik@googlemail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.13-armsoc/dts64
head:   2b47332134e4cd29078b3fb7d30b0a0555af01f3
commit: 46fa3fee0b1c027862b04717b51630195c253a30 [64/84] arm64: dts: rockchip: Add rk3588-orangepi-5b device tree
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20241108 (https://download.01.org/0day-ci/archive/20241110/202411100928.a8IqvTCe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100928.a8IqvTCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100928.a8IqvTCe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: /hdmi@fde80000: failed to match any schema with compatible: ['rockchip,rk3588-dw-hdmi-qp']
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: analog-sound: 'simple-audio-card,hp-det-gpios' does not match any of the regexes: '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
