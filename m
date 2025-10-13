Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959282D839D
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Oct 2025 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760385579; cv=none; b=kvtqlauuyFM8Gxh3NAfC7/01IQQaG3VBcR48f/6N1LNXXFHWl2jAGAnmpqX6f8bjl+cLPLShZ5e5hAYTnLCCz/wVMDo6Pk+8YyLqTWdt30FRYaMc1M2AIYOtZ7FuNszhMeqjHgERArsUf7CyhQSIz2CN+xikt4qaUVgGyuH/LJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760385579; c=relaxed/simple;
	bh=3A5Y+tQFuOFMi7wT8AzWEjyA6aQNpaTTZ4d/Gs9CbsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O64/oHwUfrlEwJSVPfB33paU2uVB4PsJvh+NV2KITUBf8L2vyPEf1YH2AMWpmsy70qjOSiLrQsYyzfElp/kJhYBp4VJpUz/nJvZsQhiFrh6DFD/Y4vqLPQCb5r3853tfaNY5QiydyOvcc2R7DmlBYikCIUigwWYRagFXKFjc4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0leaMob; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0leaMob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760385578; x=1791921578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3A5Y+tQFuOFMi7wT8AzWEjyA6aQNpaTTZ4d/Gs9CbsA=;
  b=X0leaMobn7Rne3oj+jCaAZAmg4qo1JNjEl67Y+jHY51CNqj6g1gClQS4
   v7xlEtKS+46A5SQesPfp3yzW0IePN/KV91Guyj7fbMvoImE4YIbBX1s3n
   HG6wOKO3BVdfiIIHDXvKgTE4cZTa38MuqrqOCEmr1VOP6Y+JyOnx27kM6
   4fKfObOA5zNJM9+caEJj0ygwKoAzjTd3xgdoT+1zptuWZoh2q6ezssWu4
   7YcBBq4jANckC6Dc9+hSsqtPdE11jC1D7UU49m5sbYsnbMtEC6dIUmxPh
   rYLhoj3jZQZPW/9HR0fLTOf/coMIFr0UJLOlIzuHPOfVD0Api8NyiijpK
   Q==;
X-CSE-ConnectionGUID: VMDwxUedTn678xkN15wgsw==
X-CSE-MsgGUID: ujZtBxagT+6N+iYT1rWFng==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62634464"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="62634464"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 12:59:37 -0700
X-CSE-ConnectionGUID: hWMQwmXnSM+GrDQ/gmoo1g==
X-CSE-MsgGUID: qZzH+g53RdW8hnaXTf/VkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="181702726"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Oct 2025 12:59:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Ohg-00020x-2r;
	Mon, 13 Oct 2025 19:59:32 +0000
Date: Tue, 14 Oct 2025 03:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/4] arm64: dts: freescale:
 moduline-display-av123z7m-n17: add backlight
Message-ID: <202510140221.DGD6NFrZ-lkp@intel.com>
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
In-Reply-To: <20251009-max25014-v4-4-6adb2a0aa35f@gocontroll.com>
References: <20251009-max25014-v4-4-6adb2a0aa35f@gocontroll.com>
TO: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
TO: Lee Jones <lee@kernel.org>
TO: Daniel Thompson <danielt@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Pavel Machek <pavel@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Helge Deller <deller@gmx.de>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: dri-devel@lists.freedesktop.org
CC: linux-leds@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fbdev@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Maud Spierings <maudspierings@gocontroll.com>

Hi Maud,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c3ba4249a3604477ea9c077e10089ba7ddcaa03]

url:    https://github.com/intel-lab-lkp/linux/commits/Maud-Spierings-via-B4-Relay/dt-bindings-backlight-Add-max25014-bindings/20251010-054728
base:   7c3ba4249a3604477ea9c077e10089ba7ddcaa03
patch link:    https://lore.kernel.org/r/20251009-max25014-v4-4-6adb2a0aa35f%40gocontroll.com
patch subject: [PATCH v4 4/4] arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20251011 (https://download.01.org/0day-ci/archive/20251014/202510140221.DGD6NFrZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140221.DGD6NFrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510140221.DGD6NFrZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: backlight@6f (maxim,max25014): 'default-brightness' does not match any of the regexes: '^led@[01]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
