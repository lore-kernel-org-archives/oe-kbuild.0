Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D95733E
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197151; cv=none; b=HFV+qx7yruC+DuCCGvV74suCGd+/YdLW9mXWD0ryaZ8yA7Rlicw0nCAUsJ1paggrcc5Cea1YnzM8yF4lI/EZsVBno6eqK4s50V/stmpTI0XZbpzbPwgA7eujYpUOL2K7svweaW6F9RbiD0iUEXan09nHvm/Dqdw+ZoivS7hCa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197151; c=relaxed/simple;
	bh=vURH3P3e2av/Qy8CTnbK5TUDX3LYLEJ+AtIvM75GuWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tHQr3nvUujORBGHlC9lA4uYgfGG/zawcjJ5zLkGAoq3JFFhCGG7BGocigBW/BF8AF9Jo/HAcjEF8nJKCdDkPyhNaBJzzQM9rQSdFdiGwCr2ETVUJ5kEqU5O4HKFMqGbzxEvxBseTIyjBC1M99PuJhA+kYm+9lo3HuL2POQQu/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bky83cxD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bky83cxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773197149; x=1804733149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vURH3P3e2av/Qy8CTnbK5TUDX3LYLEJ+AtIvM75GuWA=;
  b=bky83cxDEnQOBIKImkaGCnry2er7kHKtgN7mLIzNJgk5brOUpPWrTfaa
   /lL956fMwpj7Z4yw0sRHCwHHzXMhMpbwAhpr/bkjIACbhFOnYLjxCejIC
   BBKSM6+Nv8Ps4bklGiqQAJt0wPwMRCRLPAkii/IwEKzqzwrhWekTNkoj+
   SDQrsNZ66dEzI6G4RCJvvfDzpSY9xnGd7Pab1Oyt10MBe/yc8MVRiwmfk
   i5psIOPQQRGa2+Kc+YBzH6Bi3juNJfMZvTUenpCAN0pYgzDAa1EMcsG8x
   NY5/2+7DIF2HtiY4ZTb0csoNgpF7E03dOssBJ565imU5obLSMbar7kqHX
   g==;
X-CSE-ConnectionGUID: MUbzcfjHQ2q+55ropRRlBw==
X-CSE-MsgGUID: ho3ns9N9SWOoQBO2tK6IGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91641960"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91641960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:45:48 -0700
X-CSE-ConnectionGUID: zqsUgeXQTxKqC5PT9XZOvw==
X-CSE-MsgGUID: XBErA6f7Ssiugxloqq6vAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220266575"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Mar 2026 19:45:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09Zx-000000003Cn-2YgR;
	Wed, 11 Mar 2026 02:45:45 +0000
Date: Wed, 11 Mar 2026 03:45:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 182/621]
 =?us-ascii?Q?Documentation/devicetree/bindings/leds/backlight/skyworks,?=
 =?us-ascii?Q?sky81452-backlight.yaml:?=
 skyworks,short-detection-threshold-volt: missing type definition
Message-ID: <202603110314.6tM9H5ry-lkp@intel.com>
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
commit: 4c2122457541cadd5693551c1ce6a4a52b1e7660 [182/621] dt-bindings: leds: Convert backlight/skyworks,sky81452-backlight to DT schema
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110314.6tM9H5ry-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110314.6tM9H5ry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110314.6tM9H5ry-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
>> Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Traceback (most recent call last):
     File "/usr/local/bin/dt-mk-schema", line 8, in <module>
       sys.exit(main())
                ~~~~^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/mk_schema.py", line 28, in main
       schemas = dtschema.DTValidator(args.schemas).schemas
                 ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 399, in __init__
       self.make_property_type_cache()
       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
