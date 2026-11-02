Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631485;
	b=TxEZ77EVj42kXQpDF9ixQGEqqwVglDat8WkXbMkkwVGEZ6j4YhbiYQbl3XRBWFzohxfh
	 5zOvDOsvCdJF6/kIndIfdxHTuswFtNK/tI+OdC3LC+rDB0/VBGrqt5zd1Yn8+KuAlo3Om
	 551vqhVypP/qvRV61XacTwVonf+AvcG2x+Eoq9zZu4AoEqMu2931AzkwbuQUlD8GTuj5Z
	 mQEee8Jqi6Q3sVCuMZAiSKWQeGv7nfo0Q59CMph+fTsiie+iymJU4YSi9qKbQHqGLz7eZ
	 FxyOgIs9RSsWxxMXq36Vy31YTNdXYFdECddrwThp2G4BrXfh3ATMr4V4Awz9HnZigLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631485;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kwqUIB3wcINpvnW5M5d/8BFT5p2hZTVOZaCD5tzATyU=;
	b=HAEOORpXmXUtgCX7ErOVy0UQt6FDLsQd9ZDRJecMLuS35U6Oa1ywI0aYLCSoMD/5gEXj
	 bPq1qK1Iq7vpTd4CTF2kEwK8niAa0W4pRpfQLxlTXqajO2xm8WpPRlgDwLp0cgwthmbxp
	 2sM66jU5D3zo7ixN2krUSxfZqUars5qXaof4OmL3kfShPrVYv6Zb6wS8aGAoMSyOEvov9
	 y3bO2gggdqPOVJfY+3Rl3dFGNMxSWp9HeBr5b9BV+OrUiYcjO7YutYYVbpLgXXboqo8XO
	 aWnPp971Gj30oQJi29pHR/IKU+nP2URHhXN1abhEnWw9Zzl+9O5MqOeOTPCIbNQspmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sdhx9Ru+;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE600606A5B4
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 14:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE600606A5B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sdhx9Ru+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793631483; x=1825167483;
  h=date:from:to:cc:subject:message-id;
  bh=Nz1FCqZbp+izcM/9haP+XpcNeX0CtfRYt+lvy8dIoMA=;
  b=Sdhx9Ru+JMY0JVuXOLRuIsmNyxbpKmSLkXtiTsQoD+GauCqv/ty+I94L
   OMPmwdAYIGqoKhYsF6muEAj6M3u97elkskozncmkm7sPBrwkBjrOQIwvu
   k8QG/v93UHrNi6O20lY65umRa7K3hT04NtG+6grY3joH648IKBUDtDJAH
   dKnKKWdPDaDLpcrDBai1vdhd6Y3DxDhXgdrLdvVdVjgGdA5QxKkNoRrCh
   Q/bIB/CwF34CUHbTs+Iz5TOymZda883sDxYwnymXLIogorBiiR+x4ECrb
   KV1uN5ZZSL99xTYwf1lqurWGpdnlRqoX4qpRlGVQ1QX6fL+BEMYMlwrUr
   g==;
X-CSE-ConnectionGUID: vPIS4Vr9TY6IlsMki7LhSg==
X-CSE-MsgGUID: detdgSs6RO6laa/qawMwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2322463"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2322463"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 06:58:03 -0800
X-CSE-ConnectionGUID: PwiX1EkuSpKJwWjTSI0Q7g==
X-CSE-MsgGUID: YK8X2zVHQY+V1QkNS70XbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6154444"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Nov 2026 06:58:01 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNtTz-000000008dT-3FXG;
	Mon, 02 Nov 2026 14:57:59 +0000
Date: Mon, 02 Nov 2026 15:57:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.5-armsoc/dts64 18/37]
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: fan1 (pwm-fan):
 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611021503.VoQaVuXM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Igor Velkov <iav@iav.lv>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.5-armsoc/dts64
head:   bc2e69f575631cb7b6528ad25990406a6339e8a9
commit: f80a26e10a39dd51061513db96fb525244e5e890 [18/37] arm64: dts: rockchip: Label the fans on Kobol Helios64
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261102/202611021503.VoQaVuXM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611021503.VoQaVuXM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611021503.VoQaVuXM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: fan1 (pwm-fan): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dtb: fan2 (pwm-fan): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
