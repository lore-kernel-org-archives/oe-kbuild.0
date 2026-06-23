Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABED1C5F27
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 23:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258789; cv=none; b=GTiR7VC1/qM5JE6qAYprftFtsfS+uR4nxsGWy6Mg6pTUIM4k2M0haos7TJYIXD6uf3Amb21soVyyyDeUMLO0bo725JnIULRzYsIvCcgtM6VAxy3s3ydOutBgzzgvwHHTxxmyadL4W5eJlWGcUGfz3OUokSVfSGxAwHsptcM+CNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258789; c=relaxed/simple;
	bh=Wq3nxR9t0qKs2qVTUbtTRiZh3JomWZEXdORHqHuN6RA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnIEjngM0XBRzDe9RbOvBW5Nx4SjkmQ8GEb0km7SsVywKqHoQdRyHNDJfHxu9cNBDGbXzhh0C15edSFTgw8/mekMvyMOQZG4VbA4ouiDXCiYW9hiL2v/LYt8YvS3jP1MlOgAgkZbNfbug13hfWZS+EVCSdjT8JuvDhNjZdcxNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8sPWjPD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8sPWjPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782258788; x=1813794788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wq3nxR9t0qKs2qVTUbtTRiZh3JomWZEXdORHqHuN6RA=;
  b=V8sPWjPDiVO2CnIL6CG05kHsg7zKv+VPeBrjjnWtpoY593JFQHC5Do5C
   n8K5ORkL/3OMUVFMoxpA0fxfAG6tK4H+d+g1mHGm7wtMYCA2klU+3K2Mi
   a/U+iHU1RDFeVqYIXAneWzN7rLH5M//y03Qgm8lOCfxyjF+OcLt6JyEOq
   qBY8yjMj2WrPQIaCT0irKZroUWmL5jZyKfGpQADmjJ3/RuYMd9N2WMOJx
   +cCimpQY4gtPXF0sY19jqcIc1n1tylSUrMm++DWOiSC/nQHvzH+dnDAo8
   KNwWG79L6uFwpujzW2Ty6Sy+BFAci5SpU4+vsj1nGTuUTGtXqAu2yE8TP
   A==;
X-CSE-ConnectionGUID: T0lFZ95dS9ysMOt7kH81eQ==
X-CSE-MsgGUID: QAvVQX//TrOa2DadRHFMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100438863"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="100438863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 16:53:08 -0700
X-CSE-ConnectionGUID: s7RNW3F0R2mbmE61anrSEA==
X-CSE-MsgGUID: Xnpo54LBQ06cXzKtVH12Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="287790210"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2026 16:53:06 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcAvP-000000006HF-36a5;
	Tue, 23 Jun 2026 23:53:03 +0000
Date: Wed, 24 Jun 2026 01:52:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] dt-bindings: misc: convert lis302.txt to YAML
Message-ID: <202606240120.r4ppKtqB-lkp@intel.com>
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
In-Reply-To: <20260619122446.867091-1-inasj268@gmail.com>
References: <20260619122446.867091-1-inasj268@gmail.com>
TO: Jad Keskes <inasj268@gmail.com>
TO: Eric Piel <eric.piel@tremplin-utc.net>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jad Keskes <inasj268@gmail.com>

Hi Jad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1 next-20260623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jad-Keskes/dt-bindings-misc-convert-lis302-txt-to-YAML/20260622-134640
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260619122446.867091-1-inasj268%40gmail.com
patch subject: [PATCH v3] dt-bindings: misc: convert lis302.txt to YAML
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260622 (https://download.01.org/0day-ci/archive/20260624/202606240120.r4ppKtqB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240120.r4ppKtqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606240120.r4ppKtqB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'st,lis331dlh' is not one of ['st,h3lis331dl-accel', 'st,lis2de12', 'st,lis2dw12', 'st,lis2hh12', 'st,lis2dh12-accel', 'st,lis2ds12', 'st,lis302dl', 'st,lis331dl-accel', 'st,lis331dlh-accel', 'st,lis3de', 'st,lis3dh-accel', 'st,lis3dhh', 'st,lis3l02dq', 'st,lis3lv02dl-accel', 'st,lng2dm-accel', 'st,lsm303agr-accel', 'st,lsm303c-accel', 'st,lsm303dl-accel', 'st,lsm303dlh-accel', 'st,lsm303dlhc-accel', 'st,lsm303dlm-accel', 'st,lsm330-accel', 'st,lsm330d-accel', 'st,lsm330dl-accel', 'st,lsm330dlc-accel']
   	'st,iis328dq' was expected
   	'st,lis331dlh' is not one of ['silan,sc7a20']
   	'st,lis331dlh' is not one of ['st,l3g4200d-gyro', 'st,l3g4is-gyro', 'st,l3gd20-gyro', 'st,l3gd20h-gyro', 'st,lsm330-gyro', 'st,lsm330d-gyro', 'st,lsm330dl-gyro', 'st,lsm330dlc-gyro', 'st,lsm9ds0-gyro']
   	'st,lis331dlh' is not one of ['st,iis2mdc', 'st,lis2mdl', 'st,lis3mdl-magn', 'st,lsm303agr-magn', 'st,lsm303c-magn', 'st,lsm303dlh-magn', 'st,lsm303dlhc-magn', 'st,lsm303dlm-magn', 'st,lsm9ds1-magn']
   	'st,lis331dlh' is not one of ['st,lps001wp-press', 'st,lps22df', 'st,lps22hb-press', 'st,lps22hh', 'st,lps25h-press', 'st,lps331ap-press', 'st,lps33hw', 'st,lps35hw']
   	'st,lis331dlh' is not one of ['st,lsm303d-imu', 'st,lsm9ds0-imu']
   	'st,lis331dlh' is not one of ['st,lis302dl-spi', 'st,lis3lv02d']
   	'st,h3lis331dl-accel' was expected
   	from schema $id: http://devicetree.org/schemas/iio/st,st-sensors.yaml
>> arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dtb: accelerometer@1d (st,lis331dlh): 'Vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/misc/st,lis3lv02d.yaml
>> arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dtb: accelerometer@1d (st,lis331dlh): 'Vdd_IO-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/misc/st,lis3lv02d.yaml
   arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dtb: gpio-keys (gpio-keys): 'lid', 'tablet_mode' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dtb: /i2c/camera@21: failed to match any schema with compatible: ['ovti,ov7670']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
