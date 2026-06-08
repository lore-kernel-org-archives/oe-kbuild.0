Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672802DE6E3
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jun 2026 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925705; cv=none; b=rRP0p3C1L9KSEMP0zudscyR5ssCYq3N4UZEYqMLOZCN1pCDfk0XLZTVWxbIgy7/WUYlH0oBvLy5OEBmkpwKu/pboyQ0d7h5t08zXys+AM6+Gr9fyewflS5yOsHhzt9kwkf9ipVZ3iLJ4n4xHpxXXH4vYgGVz7SgHc7VEc8usse8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925705; c=relaxed/simple;
	bh=o824uKj38G/y5MGRv4VdqKzzmFo1GF2ZFuRyYciIn6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofhB5hbQq0yLt20w4T/NSW3j+7oQF/j04tx4hTCEOkmr/xE3Qnk+HVrsDI9fuLykXFUCwjS4d1oMBw68nm7jZqUr3hwHt/OgpPt5jrWE+MtlkyK7kw46tQN3Cjg1isP58l4JCaB8CPWPE/8JB/hkfCGi5vYBsNqyfYeAPfZ+y78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGo4EkQo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGo4EkQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780925703; x=1812461703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o824uKj38G/y5MGRv4VdqKzzmFo1GF2ZFuRyYciIn6E=;
  b=RGo4EkQouiB9kesxZOMYtnrC2IgFqAh2UjJNxtpK4kSkLfPOXX/0yL1k
   vBU+O0tQEB/5c60JMJtoGXd61zLzGWadR+6jsg5vou4vi9ADoHYCF3+L/
   GU1zPZRCA6VjvzMNLhze6qS/nAu3d9r98b95kNi8R3EAFjm/EiWiEHtZI
   lP19PXgqwVjIm+wpMcaA5T0AkrFAJ0q9O6E6dhUJ4Fx1Qj4N/wYGIohe+
   Mx3bPK62cAr9FIkOZfF/1Qiz+Gjwnvr4dOdchmGeQ9ciJQ5+Zn0oIOo2q
   guiyrz0nOMA5Du+WmjGfePLWi9FMtChwNjEmly9VevfE3tLXn279X4xA3
   A==;
X-CSE-ConnectionGUID: coqk0eOLSUGcZEYORLYqYw==
X-CSE-MsgGUID: gEM1EhGKSQmRcaklwIzOUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81567918"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81567918"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 06:35:03 -0700
X-CSE-ConnectionGUID: labt24OXSziMsYpMz9YQZw==
X-CSE-MsgGUID: 0Lus8GcBSJmbW36E5lJPJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="250473546"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Jun 2026 06:35:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWa83-000000003Fh-2cIL;
	Mon, 08 Jun 2026 13:34:59 +0000
Date: Mon, 8 Jun 2026 15:34:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] mips: dts: ar9132: fix wdt node name
Message-ID: <202606081513.P6E88uFN-lkp@intel.com>
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
In-Reply-To: <20260608053202.12004-1-rosenp@gmail.com>
References: <20260608053202.12004-1-rosenp@gmail.com>
TO: Rosen Penev <rosenp@gmail.com>
TO: linux-mips@vger.kernel.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc7 next-20260605]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mips-dts-ar9132-fix-wdt-node-name/20260608-133408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260608053202.12004-1-rosenp%40gmail.com
patch subject: [PATCH] mips: dts: ar9132: fix wdt node name
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: mips-randconfig-2051-20260608 (https://download.01.org/0day-ci/archive/20260608/202606081513.P6E88uFN-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606081513.P6E88uFN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606081513.P6E88uFN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /: failed to match any schema with compatible: ['tplink,tl-wr1043nd-v1', 'qca,ar9132']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000 (ns8250): $nodename:0: 'uart@18020000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: watchdog@18060008 (qca,ar7130-wdt): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000/flash@0: failed to match any schema with compatible: ['s25sl064a']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
