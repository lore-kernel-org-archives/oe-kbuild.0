Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787F2E7161
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 22:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765663528; cv=none; b=D1O6NHnN4d0q4tootEZsB2R3qudG58EEk/F/jXT2rkVCfiC9sVctaDQ6rmmDCtnzczMgtYT1of8suqQZ0wM2N5Y/WutcIfrXuC7r71ysTfFv39sZ0fPVT3aGx2oss6ck1XrfahFr6TTBxLtZFKGMP0GwQuri2hHQzDkHl6vs97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765663528; c=relaxed/simple;
	bh=RpfcfvUnFJqT68awOBcqEgOHANEskM2YHOu1kLDoVyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lOywnSwn2rBzu93m7V4u0kufrDeCoDrHjos+hv4dlN54pOC+KMzcV4b36dDROln8DytSdYdtitxgKHkvU83GiTOfKAIGHdVkI1zQBrHQQJ6fSyG02fVdMzGLoOxpJSTwHzDhAxkitDMYtzQT6F3hl2+Kn39IKKTCanKw8BY3q4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+MPAIYO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+MPAIYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765663526; x=1797199526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpfcfvUnFJqT68awOBcqEgOHANEskM2YHOu1kLDoVyI=;
  b=e+MPAIYOg4HvKbk9MZpdoYPHu605vnRzh7n+NcJ9FitWlytD1+CZa6w8
   cvHwWoTCOL2/TUk+6TYdc5c4bgqZ8Wr1X74B5Ym5gXtkt6HFFNwlA2OgC
   ut+THGo2wRJqKVwEm7wo7y1D7YK3EbIJT4hC50COnzQYh3Kc/fkwkrATC
   eAGzB4AOq0WAdyuckatiisQbeKp/P9+AqSNFDzbbbLAAF6301vflBbIWd
   mCYgKHQ28JPEcFHfGxabJKySfuPBtW6WOXcdhW8DxNhDzHEC0KF+CVPPo
   G5bi7CQFVIAfCy0BsXAjjOIMjDRWTGQyQ1vzIwoK6W1z6KBklCcyaEdhS
   w==;
X-CSE-ConnectionGUID: oGU57BwCRYm4H2gRIvdLaA==
X-CSE-MsgGUID: 3T8F1j4NSF2WR5MyG12fwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66796107"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66796107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:05:25 -0800
X-CSE-ConnectionGUID: aPJcj6eDSS2tcoRy9ec80Q==
X-CSE-MsgGUID: GzLFyuJFQO6xzcQlQAIgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196664083"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 14:05:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXju-000000008Fx-1E2T;
	Sat, 13 Dec 2025 22:05:22 +0000
Date: Sun, 14 Dec 2025 06:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <202512140549.iEqTsRLs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-rpmsg.c:488:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251212194341.966387-5-shenwei.wang@nxp.com>
References: <20251212194341.966387-5-shenwei.wang@nxp.com>
TO: Shenwei Wang <shenwei.wang@nxp.com>
TO: Linus Walleij <linusw@kernel.org>
TO: Bartosz Golaszewski <brgl@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Jonathan Corbet <corbet@lwn.net>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: Shenwei Wang <shenwei.wang@nxp.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-remoteproc@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-doc@vger.kernel.org
CC: linux-imx@nxp.com
CC: Andrew Lunn <andrew@lunn.ch>

Hi Shenwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20251212]
[also build test WARNING on linus/master]
[cannot apply to brgl/gpio/for-next remoteproc/rproc-next shawnguo/for-next robh/for-next v6.18 v6.18-rc7 v6.18-rc6 v6.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenwei-Wang/dt-bindings-remoteproc-imx_rproc-Add-rpmsg-subnode-support/20251213-035425
base:   next-20251212
patch link:    https://lore.kernel.org/r/20251212194341.966387-5-shenwei.wang%40nxp.com
patch subject: [PATCH v6 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arc-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140549.iEqTsRLs-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140549.iEqTsRLs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512140549.iEqTsRLs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-rpmsg.c:488:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-rpmsg.c:488:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-rpmsg.c:489:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-rpmsg.c:489:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-rpmsg.c:490:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-rpmsg.c:490:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +488 drivers/gpio/gpio-rpmsg.c

3ddc443efc6f20 Shenwei Wang 2025-12-12  487  
3ddc443efc6f20 Shenwei Wang 2025-12-12 @488  MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
