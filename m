Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37E128819
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 02:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758423000; cv=none; b=MdewAz03xFRqFZjFAc+KpcH3u6uCU9KA5GsIDanPnL9EPpEJ8Yytw2b4qKcCDa3cLk8GQgFWiJ3zv8z4vai2dMkr7iJnKCHHNHHdd6WqruT6SHqN0sjkg/qZzRj4TtzPPzWyr+162OaRMnSBgJWhDS0onOPCVAAfbEdSxP0WVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758423000; c=relaxed/simple;
	bh=Ld1VOzvhjGfXeecMfdNE8QJm/VG4l1qgCpa/EoVfNTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjeVRbdMH0xzp6bLjbDQfbncFMWRSwsP68Ac8Tl3RNrwcfjeM9fJ2/vQflbnVPiz0AH9GgDXGXraE5fUa+5KuppwqLx3R8Q8WfOJY7dLHThjdtF2FeAMQamIrKkejPLAYL/xUJsnMqfFqelpdhqQqfjmNoHJ5ZzTBdaOEdecoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd69rCkJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd69rCkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758422997; x=1789958997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ld1VOzvhjGfXeecMfdNE8QJm/VG4l1qgCpa/EoVfNTQ=;
  b=Qd69rCkJMc/+3a2i3zW6Ed4Lv05MfLIOOgfIabcBZvvDtI24OEi06L13
   htxSoH+sAoFDQhz67f2m34wKW/MLj8W+Jg8fvhwoPY8bYhKR/39pgQnd9
   fwfxlXq2FH8iLasW3y41n9y26H6V4++fTs0Tx1yTFaOw2gGTFKwbr3ILh
   H3Hau2WFEmuwZWi8YOKEA7a0lYLi/eZsckmMioUgqtt4lJk1AnVuAd8/6
   wQ8qWBnhm71J1NTRQh7JU0jrqCPqXQpgV9NVdOBX5s6PHVtjYrUDpCSoM
   o1NAWagK951Xkzi3dTJ7pBsoN33RqJwugkSxiDv4Ig8rRJ4Jo4zrz1qkQ
   w==;
X-CSE-ConnectionGUID: DBvQ8frVS0qCb363rT4wOA==
X-CSE-MsgGUID: 6POVuSLlSzWfobn5de+8Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="72089784"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="72089784"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 19:49:56 -0700
X-CSE-ConnectionGUID: h9LQtxdlTdmI8UItf3mACA==
X-CSE-MsgGUID: bARGodjsShKmyHGSIqrpNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="175777783"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Sep 2025 19:49:55 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0A8M-0000NZ-0J;
	Sun, 21 Sep 2025 02:49:26 +0000
Date: Sun, 21 Sep 2025 10:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set
 console UART to 115200
Message-ID: <202509211032.0rJjPoYE-lkp@intel.com>
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
In-Reply-To: <20250920000619.2643457-3-bryan@bryanhinton.com>
References: <20250920000619.2643457-3-bryan@bryanhinton.com>
TO: bryan@bryanhinton.com
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-mediatek@lists.infradead.org
CC: angelogioacchino.delregno@collabora.com
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: matthias.bgg@gmail.com
CC: robh@kernel.org
CC: Bryan Hinton <bryan@bryanhinton.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1522b530ac3e2dadd75ccb351b88d3c7c4cf584e]

url:    https://github.com/intel-lab-lkp/linux/commits/bryan-bryanhinton-com/arm64-dts-mediatek-mt7981b-add-labels-for-UART0-1-2-nodes/20250920-080820
base:   1522b530ac3e2dadd75ccb351b88d3c7c4cf584e
patch link:    https://lore.kernel.org/r/20250920000619.2643457-3-bryan%40bryanhinton.com
patch subject: [PATCH 2/2] arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250920 (https://download.01.org/0day-ci/archive/20250921/202509211032.0rJjPoYE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211032.0rJjPoYE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509211032.0rJjPoYE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dtb: serial@11002000 (mediatek,mt7981-uart): Unevaluated properties are not allowed ('current-speed' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/mediatek,uart.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
