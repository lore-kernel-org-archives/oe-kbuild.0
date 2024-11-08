Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB071F1319
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731075610; cv=none; b=hYJ188avZcDPakWVKfXUlAqj4ihoeLByl5EXpnXmkGUsE92yo572SsNe/rHZoNmBJncgEyY0GIf4kDluPXBQh8d+xjqT1WWU6Ffq6RD8yx0CxbDy86+D/NQd5BtNKGkeZ45W+/49YeD0gQtr6igTieUudi0giFIVXIivrtcAxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731075610; c=relaxed/simple;
	bh=t9fAJFwkrTBKTfAT1EZucSjCcSRJDyT4OUqzbUHzzaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC++q0SvGRP4L96H3wsnEopFjSFIMU9qtM3R7vUKkTDLCZATunMZZUZTtWVLMlTuS/6yHxP73Oh7frMXwh+y92oySrpsIRx5MFSln9NrnhD1nhQr4jdtmQNINc2vlUYOeBfqI1suzU0GdVKCVENcFHG89Nk3ZZFMKlxIo+otnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFE/bAds; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFE/bAds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731075608; x=1762611608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9fAJFwkrTBKTfAT1EZucSjCcSRJDyT4OUqzbUHzzaY=;
  b=SFE/bAdsiQTtLZr6I1RG5MAgdgHgR08xz8eEdmeqyyZTxKI1/kZg2m2g
   7FUGNrjYRU5aWb+sWCyZ2mew9rkeb/G6Il6DX8ykE3is2z1ubikBLCi9z
   Hirz8x8nhXJ5vE8/WWc0t9KRHQk2O+jKNL/4mM49CZsTrcZRkDeQeTWfS
   hSQNKlvc8JDa9PS35bUgXlyu+SFcG2HVEt+hGNHxzfvk6U4KMg7HYM1zS
   eWA0tYi2LEw1hrHSqa7MnzF9aV34oO8N3NbTp5lIrNUerGqWSN8Ki8vj+
   4oXijS+stQIUhIskGPOwmc3GWlZy4IBdOW8eqiGdv8sO3BSY7TKG3d5xp
   A==;
X-CSE-ConnectionGUID: wI6wV10XQwKIiU+4vxfZqg==
X-CSE-MsgGUID: dk5iy/4UTVCty0dnHSHS7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="41575764"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="41575764"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 06:20:07 -0800
X-CSE-ConnectionGUID: vUA2gVkETKqsg3K+IpxiUQ==
X-CSE-MsgGUID: Ex68GUueReWvAa8RW4HkWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90212424"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2024 06:20:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9PqG-000rUs-17;
	Fri, 08 Nov 2024 14:20:04 +0000
Date: Fri, 8 Nov 2024 22:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/2] dt-bindings: linflexuart: add clock definitions
Message-ID: <202411082240.1XGlojLB-lkp@intel.com>
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
In-Reply-To: <20241107114611.758433-2-ciprianmarian.costea@oss.nxp.com>
References: <20241107114611.758433-2-ciprianmarian.costea@oss.nxp.com>
TO: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Chester Lin <chester62515@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: NXP S32 Linux Team <s32@nxp.com>
CC: imx@lists.linux.dev
CC: Christophe Lizzi <clizzi@redhat.com>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Enric Balletbo <eballetb@redhat.com>
CC: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Hi Ciprian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus robh/for-next linus/master v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciprian-Costea/dt-bindings-linflexuart-add-clock-definitions/20241107-194716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20241107114611.758433-2-ciprianmarian.costea%40oss.nxp.com
patch subject: [PATCH v3 1/2] dt-bindings: linflexuart: add clock definitions
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082240.1XGlojLB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082240.1XGlojLB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411082240.1XGlojLB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: serial@401c8000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: serial@401c8000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: serial@401c8000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: serial@401c8000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: serial@401cc000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: serial@401cc000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
--
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: serial@401c8000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: serial@401c8000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: serial@401cc000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: serial@401cc000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
--
>> arch/arm64/boot/dts/freescale/s32v234-evb.dtb: serial@40053000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32v234-evb.dtb: serial@40053000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32v234-evb.dtb: serial@400bc000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#
>> arch/arm64/boot/dts/freescale/s32v234-evb.dtb: serial@400bc000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/fsl,s32-linflexuart.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
