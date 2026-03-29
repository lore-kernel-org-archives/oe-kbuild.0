Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08CD1465B4
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 00:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774745653; cv=none; b=rNRmfjwLbg5sMxSzZLPH7XMF0QMz0xqCxToJaqelVK2mvtqnacLYi8yDMbLmLFT+mqupBd0jRo4MNJ7a7Yy7bKYBVsMy1MrQx70SBIc52ZUJUb2Zh4mgjaQxq6Ex/A6Q/FnHL97VsPrGAHRPd13LQzbvoFnk3HqJRlFzklXtZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774745653; c=relaxed/simple;
	bh=wVY8zBq9pP8StMdWRyY7EQLLaD1bLixyOoO4qQvhvV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtvWPBcDxQ8Q3Ihz98uZSMGzo7rjxk/tLln6Je5l3/W/GVjY+PJ2E1e/rmyqAj8NPytH49sLl5BvXATGSrxY/MnrE8WIMRfvlpTbFuQPkITv3PhW5qP8jJf2Oda5NzWKFFmkwNu6pttamf/JTJAF7fqZUXPDwIvxoMc7SA787lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVWRQ9sG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVWRQ9sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774745651; x=1806281651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVY8zBq9pP8StMdWRyY7EQLLaD1bLixyOoO4qQvhvV4=;
  b=gVWRQ9sG9qQJgKYT+SwDV960ZnlC9ycf2ueuPsYZhwdbUQFqtJMo5wPx
   N9mfRKHCbaaai2rIUMQIKRSwJoa1cEE10g4TkDxA/ykvQHb634fKWsbBu
   gin9EdrtppN5srBWR2YyW7ke7/+U7jAM/yE3YsrKr3XDerRhUfRcFVYWY
   Dtz+Y6kJvhd2GwCn0lr1mlS9D0SjCNiPwA6JCEBzzL2FXgicphx1sIrHI
   iZV7hQKR0SlsVW2o22I3RGnBqh5PAdrOqEeHCC0WAOMfEWtGDpNmqRNXM
   4Pqn/IpMM+Fos7zsoVMNecIScnhnJKF5WOkiQwKIsQbcxauhn2J/FNgNI
   g==;
X-CSE-ConnectionGUID: cmGEO/TSS6eFY/V8S/TIUg==
X-CSE-MsgGUID: 4yFjOleqSySzMscwCX798w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93357328"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="93357328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 17:54:11 -0700
X-CSE-ConnectionGUID: S4oKpDDRTnaWT68ljw/ntA==
X-CSE-MsgGUID: coGiGarYQFWz4FeOTvnpkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="230449582"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2026 17:54:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ePo-000000007n3-1GAW;
	Sun, 29 Mar 2026 00:54:08 +0000
Date: Sun, 29 Mar 2026 01:53:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Message-ID: <202603290132.XZMeaZsU-lkp@intel.com>
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
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-4-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-4-10255d236439@pengutronix.de>
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <jesszhan0024@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Hi Steffen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Steffen-Trumtrar/dt-bindings-display-simple-Add-JuTouch-JT070TM041-panel/20260326-133311
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-4-10255d236439%40pengutronix.de
patch subject: [PATCH 4/4] arm64: dts: imx8mp-skov: support new 7inch panel board
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2051-20260326 (https://download.01.org/0day-ci/archive/20260329/202603290132.XZMeaZsU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290132.XZMeaZsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290132.XZMeaZsU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt070tm041.dtb: touchscreen@2a (eeti,exc81w32): compatible: 'oneOf' conditional failed, one must be fixed:
   	['eeti,exc81w32'] is too short
   	'eeti,exc3000' was expected
   	'eeti,exc80h60' was expected
   	'eeti,exc80h84' was expected
   	'eeti,egalax_ts' was expected
   	'eeti,exc3000-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
