Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55984359A71
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285544; cv=none; b=E8oDXtmnCA/SYhO7vkvP+YSnsVEl35a89TBlfKsHTN6kGU8/dSZbOK7kWtEs19crJL50KDhx6iX4UxzyISnB9soUdYkMlF7sAq9+FA2WeMNC68doEO3vA2SwCmrBrsmySaDT2Ob1bZXnJ+0DWHOIPELKm76TbiHMECmaik0MLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285544; c=relaxed/simple;
	bh=S27CasceZBAK7VbaYd3f5R9a+PZaSjofrCTGSD72TWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HffqN+8lf9C9Y2AdnOrvfOOncmgI1QIMh3QpBnUyV4EHtC51Qw6ezoJFsCTDlZl2IDYXu/Ez7Jtev+HhcDAbbOxtNohfxl7MdbMj30SGAOF//db1uKlDjcppR5YcLhZgwf27+0Vpid3AlmCX29xSjPw8Q8XHXrauh0OtXT+CqYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIqWi/Pj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIqWi/Pj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773285543; x=1804821543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S27CasceZBAK7VbaYd3f5R9a+PZaSjofrCTGSD72TWs=;
  b=nIqWi/PjIY5GViTAntoAnO3RIrbK1AtRTbd2lH0qiBp9hXAHy7pJnF2f
   M1RzJIcqT83ObowYbehIcI0v81trZJtZFzvulXnlAqa9P/JIReVY7PQB7
   6ErCI8KpMBjzZyW1cUPbPHeB9fODzWc0uqFWNADbkPJXLKPOVCnHeRFmH
   sH1y3mkbSFgxwapTOqfjDX5l9G6aEj3cQ3p/EwXOS8cCl01eW7rYUFA6R
   vL6aP32duGSSFmdwKElLNudzLf0KL5w0u2LbYI1XuOPWXfITDtnQhBgv+
   gZQtaF/Qx2ifP/f25a8QuBJYZ+bnHe9vTYpOTyc4SKwhCxmdcmeOTWV4q
   w==;
X-CSE-ConnectionGUID: 6roxaqP2Q7ir5f51ac5WDg==
X-CSE-MsgGUID: cmyVEA7HQkiesjt5l6eTbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84686674"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="84686674"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 20:19:02 -0700
X-CSE-ConnectionGUID: DHFWJUUjQGaKc6gPyOR6HA==
X-CSE-MsgGUID: bEimZGoqQWCQ6/IZPV/tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="219946759"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 20:19:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0WZe-000000003Rl-1zz2;
	Thu, 12 Mar 2026 03:18:58 +0000
Date: Thu, 12 Mar 2026 04:18:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD
 card support with UHS modes
Message-ID: <202603120455.ZuF5ZSOi-lkp@intel.com>
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
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
TO: Iker Pedrosa <ikerpedrosam@gmail.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Adrian Hunter <adrian.hunter@intel.com>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Yixun Lan <dlan@kernel.org>
CC: Michael Opdenacker <michael.opdenacker@rootcommit.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: linux-mmc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Iker Pedrosa <ikerpedrosam@gmail.com>

Hi Iker,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b]

url:    https://github.com/intel-lab-lkp/linux/commits/Iker-Pedrosa/mmc-sdhci-of-k1-enable-essential-clock-infrastructure-for-SD-operation/20260309-194400
base:   ec1fb4e55df47ed043ab2ccc6787e39b9d67e49b
patch link:    https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d%40gmail.com
patch subject: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card support with UHS modes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260312/202603120455.ZuF5ZSOi-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120455.ZuF5ZSOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603120455.ZuF5ZSOi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: mmc@d4280000 (spacemit,k1-sdhci): Unevaluated properties are not allowed ('reset-names', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/spacemit,sdhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
