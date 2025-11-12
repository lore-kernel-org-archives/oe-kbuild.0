Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD11F5EA
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Nov 2025 01:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762909246; cv=none; b=ZaI+CTqvk3QgH5CBqojqp0EovA01/6SWDIIPo1+treODvSFOiXHi0sHMu9hbOpNF8+TiqmYJGP+XCSB+kokosbWJZphmOugfRfzTgahqrSWEY8u3HXqzCGC/ABiCWqm9BXsWog34Gm4mjbyD+ziV0jptRK/Afe7NMboLn9e58L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762909246; c=relaxed/simple;
	bh=7q+LEe3eBW3L+gEPjGzNbPnqvWpveBCq7khUCgd3428=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eQ3HZUPrhww/F2kvDEEoEfG74NkTEGTBoH5g3/TJ/HY77hECZMyCd0BbrBz32tVu8ecXw7z5vSQCKBSXqIWbV/3pInrzH4ty/nSzIu6H3nrlTt6BPgn4DbCCqw1Sy5SLhf6eixrFBhI9jqW+seDRzg8+6jYIv8rQEgN7OtJ1MD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuLHqE0U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuLHqE0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762909244; x=1794445244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7q+LEe3eBW3L+gEPjGzNbPnqvWpveBCq7khUCgd3428=;
  b=AuLHqE0U6mHUudgjOMFf9rarRtUxc4+oRlgt97ZZc+Vv2sod3aFgF2S3
   lWPJdpRUOqR8+rCjDvD33jM+QcMiahBNI3xTB+0/9WwqGg+Urwt5laNcd
   QXTYVgwODbzMRPk797uacZlnJ+JO7Bfw+Gj/FM7wE5Qp8sUMyzhczgmcb
   PZEyORFBo2nzBVn3bVl4SC5d8fRiaOC1AlXIvsVBwE22T14rFHKKNKe7p
   yO3jaNw8Fse0k58cRAUcDI2FK5gsAhnbVv4g2t853uXsG2OQLiJ34GICr
   yfrnxnpm0zQP8y6D5EP/PenvfgMpKqrOA9DR2Z0dO1Go2JPBMdU/qPHZ8
   Q==;
X-CSE-ConnectionGUID: OJg/kW+zQbOkBh/A6fHDmg==
X-CSE-MsgGUID: JBTxkV4ERee79M3YbE7w4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64675427"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="64675427"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 17:00:44 -0800
X-CSE-ConnectionGUID: ctRn1z2XRbeBH7jkXrOSJA==
X-CSE-MsgGUID: Z4NHU+i4RIG5CAMlVWwlHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188927714"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 17:00:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIzE0-0003iF-1f;
	Wed, 12 Nov 2025 01:00:40 +0000
Date: Wed, 12 Nov 2025 09:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/8] hwmon:(ina3221)Modify read/write functions for 'in'
 attribute
Message-ID: <202511120848.4BYPxB9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251111080546.32421-7-wenliang202407@163.com>
References: <20251111080546.32421-7-wenliang202407@163.com>
TO: Wenliang Yan <wenliang202407@163.com>
TO: linux@roeck-us.net
TO: Jean Delvare <jdelvare@suse.com>
CC: christophe.jaillet@wanadoo.fr
CC: conor+dt@kernel.org
CC: corbet@lwn.net
CC: devicetree@vger.kernel.org
CC: krzk+dt@kernel.org
CC: linux-hwmon@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: robh@kernel.org
CC: wenliang202407@163.com

Hi Wenliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.18-rc5 next-20251111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenliang-Yan/dt-binding-ti-ina3221-Add-SQ52210/20251111-161425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251111080546.32421-7-wenliang202407%40163.com
patch subject: [PATCH 6/8] hwmon:(ina3221)Modify read/write functions for 'in' attribute
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: hexagon-randconfig-r071-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120848.4BYPxB9e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511120848.4BYPxB9e-lkp@intel.com/

smatch warnings:
drivers/hwmon/ina3221.c:389 sq52210_alert_to_reg() warn: signedness bug returning '(-32760)'

vim +389 drivers/hwmon/ina3221.c

fc25444996311f Wenliang Yan 2025-11-11  363  
fc25444996311f Wenliang Yan 2025-11-11  364  /*
fc25444996311f Wenliang Yan 2025-11-11  365   * Turns alert limit values into register values.
fc25444996311f Wenliang Yan 2025-11-11  366   * Opposite of the formula in ina3221_read_value().
fc25444996311f Wenliang Yan 2025-11-11  367   */
fc25444996311f Wenliang Yan 2025-11-11  368  static u16 sq52210_alert_to_reg(struct ina3221_data *ina, int reg, long val)
fc25444996311f Wenliang Yan 2025-11-11  369  {
fc25444996311f Wenliang Yan 2025-11-11  370  	int regval;
fc25444996311f Wenliang Yan 2025-11-11  371  	/*
fc25444996311f Wenliang Yan 2025-11-11  372  	 * Formula to convert voltage_uv to register value:
fc25444996311f Wenliang Yan 2025-11-11  373  	 *     regval = (voltage_mv / scale) << shift
fc25444996311f Wenliang Yan 2025-11-11  374  	 * Results:
fc25444996311f Wenliang Yan 2025-11-11  375  	 *     bus_voltage: (1 / 8mV) << 3 = 1 mV
fc25444996311f Wenliang Yan 2025-11-11  376  	 */
fc25444996311f Wenliang Yan 2025-11-11  377  	switch (reg) {
fc25444996311f Wenliang Yan 2025-11-11  378  	case INA3221_BUS1:
fc25444996311f Wenliang Yan 2025-11-11  379  	case INA3221_BUS2:
fc25444996311f Wenliang Yan 2025-11-11  380  	case INA3221_BUS3:
fc25444996311f Wenliang Yan 2025-11-11  381  		/* clamp voltage */
fc25444996311f Wenliang Yan 2025-11-11  382  		regval = clamp_val(val, -32760, 32760);
fc25444996311f Wenliang Yan 2025-11-11  383  		return regval;
fc25444996311f Wenliang Yan 2025-11-11  384  	case SQ52210_CURRENT1:
fc25444996311f Wenliang Yan 2025-11-11  385  	case SQ52210_CURRENT2:
fc25444996311f Wenliang Yan 2025-11-11  386  	case SQ52210_CURRENT3:
fc25444996311f Wenliang Yan 2025-11-11  387  		/* signed register, result in mA */
fc25444996311f Wenliang Yan 2025-11-11  388  		regval = DIV_ROUND_CLOSEST(val * 8000, ina->current_lsb_uA);
fc25444996311f Wenliang Yan 2025-11-11 @389  		return clamp_val(regval, -32760, 32760);
fc25444996311f Wenliang Yan 2025-11-11  390  	case SQ52210_POWER1:
fc25444996311f Wenliang Yan 2025-11-11  391  	case SQ52210_POWER2:
fc25444996311f Wenliang Yan 2025-11-11  392  	case SQ52210_POWER3:
fc25444996311f Wenliang Yan 2025-11-11  393  		regval = DIV_ROUND_CLOSEST(val * 8000, ina->power_lsb_uW);
fc25444996311f Wenliang Yan 2025-11-11  394  		return clamp_val(regval, 0, 65528);
fc25444996311f Wenliang Yan 2025-11-11  395  	default:
fc25444996311f Wenliang Yan 2025-11-11  396  		/* programmer goofed */
fc25444996311f Wenliang Yan 2025-11-11  397  		WARN_ON_ONCE(1);
fc25444996311f Wenliang Yan 2025-11-11  398  		return 0;
fc25444996311f Wenliang Yan 2025-11-11  399  	}
fc25444996311f Wenliang Yan 2025-11-11  400  }
fc25444996311f Wenliang Yan 2025-11-11  401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
