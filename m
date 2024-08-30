Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504AA1509AE
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Aug 2024 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725035423; cv=none; b=X3/JtVziVYEFLh6XU1Rsemp7vDMLQ5vy8sj44f1cimywV6afIYormwlF7mSynYby5qEc5B6TvQRO378AMqCyITtVkaOb7Hqbf1EkXUTjFCxNHKW5J8mCiOwAADovZST6h/zhl2JgaAzlAbZaMgtTWldkhQhUAw3ung6eyGLmLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725035423; c=relaxed/simple;
	bh=Xk8uzFF2NZMF+79nExFmGKWT2vnbFLH4F87RbjIYMSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DChJEaCRShG1omxgWp+Or1/MGw0OMgJA+0AyjZEZi66vD9M3RF3vKsik2CUWwDUAhdpCkLL3S1ViJCO3EABBRr5aIkSZwCpslj4wPKHkPOmRE7LlrY+pPJw2d57g5lQEWjBVqn7/XfE7LPsmdwTpMMPv7543GQAWrrd0R7asgDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SP9bEnpD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SP9bEnpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725035419; x=1756571419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xk8uzFF2NZMF+79nExFmGKWT2vnbFLH4F87RbjIYMSw=;
  b=SP9bEnpDXJl9S9DqwCZBmDoRsgk1EyaFyFXiiHovoAu7nb05wDJ1vJjG
   djNpfqGJLp+hnveiE2tUwGGb6XE8TeOH+Qi9XFjV9jI7SsQcJ3w74oNo6
   bHWozHR1zriypP3HkeE5IbYQtXb/R+p+lwqMGo2DXPJXSwCfaJrV8sq19
   EMJZttXLlEoQfmJZyIKWBNrRDhj+fxypX2QT6zU08UMiB7qJvtblhx2nT
   3E2or3gH6IGG/UuGD3TFw8A5uYshwsrH9oeVGJYGtJ5eh0PoCVvSb0Fuh
   lMFlTvKyRtlkKwyb38Aikz/aEd1Mb4ORwsBdzW4ySwFfXTxgckXFHVlXO
   g==;
X-CSE-ConnectionGUID: a+JaX0rTSN2w27jcixPzEg==
X-CSE-MsgGUID: lBl93fMCQJiDMe8MIKCBIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23202333"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23202333"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:30:18 -0700
X-CSE-ConnectionGUID: A4g+8TrlTTykb5B/9sf5gA==
X-CSE-MsgGUID: ynqxxB8dQ62Phi+jR6WVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64137122"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2024 09:30:18 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk4Vr-0001eP-2i;
	Fri, 30 Aug 2024 16:30:15 +0000
Date: Sat, 31 Aug 2024 00:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 11/11] arm64: dts: rockchip: Add rk3576-armsom-sige5
 board
Message-ID: <202408310046.hOeIMEV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: In file included from arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts:14:"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <01020191998abb6d-28177629-d50c-4247-8a27-799ca2f04e56-000000@eu-west-1.amazonses.com>
References: <01020191998abb6d-28177629-d50c-4247-8a27-799ca2f04e56-000000@eu-west-1.amazonses.com>
TO: Detlev Casanova <detlev.casanova@collabora.com>
TO: linux-kernel@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Lee Jones <lee@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Chris Morgan <macromorgan@hotmail.com>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Tim Lunn <tim@feathertop.org>
CC: Chukun Pan <amadeus@jmu.edu.cn>
CC: Muhammed Efe Cetin <efectn@protonmail.com>
CC: Andy Yan <andyshrk@163.com>
CC: Jagan Teki <jagan@edgeble.ai>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Detlev Casanova <detlev.casanova@collabora.com>
CC: Ondrej Jirman <megi@xff.cz>
CC: Jimmy Hon <honyuenkwun@gmail.com>
CC: Elon Zhang <zhangzj@rock-chips.com>

Hi Detlev,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next tty/tty-testing tty/tty-next tty/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.11-rc5]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/dt-bindings-arm-rockchip-Add-rk3576-compatible-string-to-pmu-yaml/20240828-231452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/01020191998abb6d-28177629-d50c-4247-8a27-799ca2f04e56-000000%40eu-west-1.amazonses.com
patch subject: [PATCH v3 11/11] arm64: dts: rockchip: Add rk3576-armsom-sige5 board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240831/202408310046.hOeIMEV9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310046.hOeIMEV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408310046.hOeIMEV9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts:14:
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:6:10: fatal error: dt-bindings/clock/rockchip,rk3576-cru.h: No such file or directory
       6 | #include <dt-bindings/clock/rockchip,rk3576-cru.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
