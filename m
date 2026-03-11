Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE6A95E
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 05:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773206334; cv=none; b=RrLK2m0+3P0rwQYO448vg1veBdt/bf/MJzg3lC9LPUa2LeeGVlJFhPEMH9/WrXZMklaOhvt8RQhEKjbLLRs7983Ue5CI+HZMyWSgckv/kaaBMIc8vp6cW02Z86PdMrx/Mem5HRBeYgHZC7/ug4eqX7pzcmp7wRx5k00Rc/5f7FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773206334; c=relaxed/simple;
	bh=URxAsZCit1RrLY5wZb07+t800C3+lAhrNYrqd20ruAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cHy50epWVFqGpSZ13PUNX+7kuB2TosYEAzrtNdG5/eOFLew1HwXN0QhvxAeMTwt1aRE8JlaAUO6maMrGPjMlYpGpAwq8lcfOGi0Ggu8wHYthoR7iAZxkUDlhfzt9P5kYJURw2i5oU51+PzrIzMdv71Pg4bVZ6ULE+cf0Q0plboI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RFXBplvS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RFXBplvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773206333; x=1804742333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URxAsZCit1RrLY5wZb07+t800C3+lAhrNYrqd20ruAI=;
  b=RFXBplvSNUTr7tVtfY7HE4YJyMZDXBeqAZrRRhCqD6WRzp/36Ud3mfs6
   aqiPKrp59F605n8HLPtAT7vjp0jRW1+23tpUYnButSwZXX+uEY3zuDW/F
   lbDXhHpwUhHHXE5LZIKT2RFom5pRdFbEUnbknS6+o//UfZ4Bbh4bqVx5g
   eKTHkjLW1iTlIR7Ke+5T14sGBncH9kTh5eqYhV6fhDniilCw9QXlu8xHq
   9VMdY9W3v/UrByMZ5MVmY3eMDKGOj6e1pKI18Y+Fs7NIG08OVcAkB8qIh
   H5aoMcJtdaksUR+hzMqUXeCC3hpm6xvD3TuPRN9SA8s0wPdriGPwfz8mk
   w==;
X-CSE-ConnectionGUID: qB86OzbvRFq01ESsfp8RAA==
X-CSE-MsgGUID: Z0K+BjpRSmGlklyDmbzcIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74454435"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74454435"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:18:52 -0700
X-CSE-ConnectionGUID: H0dKkX8dRIeeU8bF0AnUXQ==
X-CSE-MsgGUID: Ycm9GhydS5K27mxsXPbDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219593139"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2026 22:18:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0By4-000000003Gj-3DVa;
	Wed, 11 Mar 2026 05:18:48 +0000
Date: Wed, 11 Mar 2026 06:17:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 219/621]
 =?us-ascii?Q?Documentation/devicetree/bindings/memory-controllers/marvel?=
 =?us-ascii?Q?l,mvebu-devbus.yaml:?= devbus,bus-width: missing type
 definition
Message-ID: <202603110613.v9b4YB7C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 2b01de253b00a1fcff671f63b239234d0feb5fb5 [219/621] dt-bindings: memory-controllers: Convert marvell,mvebu-devbus to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110613.v9b4YB7C-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110613.v9b4YB7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110613.v9b4YB7C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
>> Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
