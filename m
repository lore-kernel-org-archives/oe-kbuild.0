Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1453D7D7B
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768974044; cv=none; b=L8VjIHXIzk4fKL1uS7uFLgvgymT2drFp9/NcASDYCkX1vibpNbU73OuImbC4Bf1SbQy0SqOxAA8auHhv0IRNL1CfEyMHIVcafTneq4w9wtGcuEMVu9JCfXr/68xmNnYqeobF/RPCHb/m/XMF3UmeuieFqM/c9S5BMRapmu512CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768974044; c=relaxed/simple;
	bh=w0gx06X7kEfL5CS/b9YiYsDY8nnvU3qg6Wp6rLQNOKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWdDiQu+7Mn7UsKRW53jQY+KQ5kTFd48gf/SVBAwrPuMoydJc+anMyiv66RwN88mbgK6zaXGZ5Y9ME3B6vrqmEM4aM0vjwtO46jiVWMVyHbHdNFW+SoYtQPESYqxydZ8K13TNm2UqN0RS+GU4JES94iuU4/gr+VFi6aIMS03pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZkyAJS2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZkyAJS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768974039; x=1800510039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0gx06X7kEfL5CS/b9YiYsDY8nnvU3qg6Wp6rLQNOKY=;
  b=DZkyAJS2FBytNK2eNZOvAnlu1m8/3Jj1sYtVw60h7sSozXzpfkh6C9xF
   QafQXfxYKnrAHfGI4/1965V8q39oMeo9A/WGVWWTgmARComc8F2I3QtPm
   9LgezGiTLHr7o2Koxy6NPDsz41GaJq877m1Qzi5mUrlGm8FwCVB6hRgUS
   1LsCGzibeShO+J/gD2OGYKTsonyD0tDip7rsPAig0DXa205X5/7hHQLf+
   ZJ6pk4XFT2CGsEm3ijupeakQqg4s0pomPsWROdGDAEIX+f56jaom09u9t
   5I6+y0WTC5Pib4SS8yBuA5NL3rj3zbzhixzpaXxiz/Tn2Fa3vYw/GBQN5
   w==;
X-CSE-ConnectionGUID: sl9U2YHcTdCDBXix6p/vfw==
X-CSE-MsgGUID: OPBNCUXrTBOw5b0BAWn+yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70105939"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70105939"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 21:40:35 -0800
X-CSE-ConnectionGUID: 45zaasvnSWql9uK3Hr3O2w==
X-CSE-MsgGUID: L7zeRMvZQl2/WB4fl4RSig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205974583"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jan 2026 21:40:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viQxD-00000000Q2A-2gM0;
	Wed, 21 Jan 2026 05:40:31 +0000
Date: Wed, 21 Jan 2026 13:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 02/10] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <202601211337.VYOUs0Uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mfd/nxp-siul2.c:438:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-3-khristineandreea.barbulescu@oss.nxp.com>
TO: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chester Lin <chester62515@gmail.com>
TO: Matthias Brugger <mbrugger@suse.com>
TO: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
TO: Larisa Grigore <larisa.grigore@nxp.com>
TO: Lee Jones <lee@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Dong Aisheng <aisheng.dong@nxp.com>
TO: Jacky Bai <ping.bai@nxp.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Christophe Lizzi <clizzi@redhat.com>
CC: devicetree@vger.kernel.org
CC: Enric Balletbo <eballetb@redhat.com>
CC: Eric Chanudet <echanude@redhat.com>
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: NXP S32 Linux Team <s32@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: "Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>

Hi Khristine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes shawnguo/for-next linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khristine-Andreea-Barbulescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20260120-202045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20260120115923.3463866-3-khristineandreea.barbulescu%40oss.nxp.com
patch subject: [PATCH v8 02/10] mfd: nxp-siul2: add support for NXP SIUL2
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: parisc-randconfig-r113-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211337.VYOUs0Uf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211337.VYOUs0Uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211337.VYOUs0Uf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/nxp-siul2.c:438:1: sparse: sparse: bad integer constant expression
   drivers/mfd/nxp-siul2.c:438:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/mfd/nxp-siul2.c:439:1: sparse: sparse: bad integer constant expression
   drivers/mfd/nxp-siul2.c:439:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mfd/nxp-siul2.c:440:1: sparse: sparse: bad integer constant expression
   drivers/mfd/nxp-siul2.c:440:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"

vim +438 drivers/mfd/nxp-siul2.c

a0c1c05b8e58e8 Andrei Stefanescu 2026-01-20  437  
a0c1c05b8e58e8 Andrei Stefanescu 2026-01-20 @438  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
