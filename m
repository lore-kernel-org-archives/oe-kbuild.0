Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC151D618A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 21:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748727533; cv=none; b=iehWRqDl2smqOxzUmQo2ElRVImFvqYF3ZcEqr7iXRCEe6uQiSPQNfAtWxGGj2CJvK34jiGBJbCYIkSevs3SuTUysAQ0MxsZd2UDE1NYjnG8o7im3Pnb8RcqT8KLjGaiU+ClyP9owfcrXhZjWFBh87r3PI1ym17NnEe2Fup/G0+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748727533; c=relaxed/simple;
	bh=qiWddpxZs723r+00L18labBoY8BJ3L38YMCnLzBygW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XNpHHsZaIpcnxP8Dc/L3CQWL5Ar+q7rZaeuG8BoZwc2/o3z6waVL9LF3v0rA5NBi+Pi3epWvH9DesN1JVqKJNZbYnFQCRwLf52J0UJxKxJcAwiD99eQuiGLAzGF3MGW2cdEy9X+XUE+Zgh/dvcr1yJWcAfAk87//ZvVsmgHltjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kM2vE0HX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kM2vE0HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748727531; x=1780263531;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qiWddpxZs723r+00L18labBoY8BJ3L38YMCnLzBygW4=;
  b=kM2vE0HX1mVT8MBBBu5MMM/JERR2qzlQWlaQ3v+Kfj3ke/9UvhJ14KxI
   SLOR9roRPEvFSs5n7SpIBuUASnn7IGVLrtbt5owvs2mWyC2ItWkcCb9+E
   1Vv/xqI74en1nT41zt6YTizAk5Y8PClKp9Y1fIXMhLxGx8TOcErb3ehew
   LO+dTckF37HFVPOXd4ZaWGzYjwGAiMqEK/d8cglIxnXFSFNuYlKJOq2aL
   LxfIOuChKZ1bl+wDKMGnL1bQffAAPMa82/y+wTJ7jey3I6KN1IcMR7oK0
   i6W5ty1kDKmOlt+XFRD0btIV9yKlAcaf7KuUjeGi/gTUdGzopUZxLSC/9
   Q==;
X-CSE-ConnectionGUID: c3NzRB35ShSofuOi0+aGXw==
X-CSE-MsgGUID: wIA+uO5DT5+9MLVHgOHtew==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61457803"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="61457803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 14:38:50 -0700
X-CSE-ConnectionGUID: zJfgvBxJQ5K948+lggbI1w==
X-CSE-MsgGUID: iPS8lzjwT4WgnPmoscmBkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144090469"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 14:38:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLTug-000YfE-2T;
	Sat, 31 May 2025 21:38:46 +0000
Date: Sun, 1 Jun 2025 05:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: arm/bcm: Fix and validate brcm,bcm63138
 bindings with no errors
Message-ID: <202506010545.q3yWkRzc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250525194333.1729443-1-shankari.ak0208@gmail.com>
References: <20250525194333.1729443-1-shankari.ak0208@gmail.com>
TO: Shankari Anand <shankari.ak0208@gmail.com>
TO: devicetree@vger.kernel.org
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: William Zhang <william.zhang@broadcom.com>
CC: Anand Gore <anand.gore@broadcom.com>
CC: Kursad Oney <kursad.oney@broadcom.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: "Rafał Miłecki" <rafal@milecki.pl>
CC: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Rob Herring <robh@kernel.org>
CC: skhan@linuxfoundation.org
CC: Shankari Anand <shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/dt-bindings-arm-bcm-Fix-and-validate-brcm-bcm63138-bindings-with-no-errors/20250526-034456
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250525194333.1729443-1-shankari.ak0208%40gmail.com
patch subject: [PATCH] dt-bindings: arm/bcm: Fix and validate brcm,bcm63138 bindings with no errors
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250531 (https://download.01.org/0day-ci/archive/20250601/202506010545.q3yWkRzc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010545.q3yWkRzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506010545.q3yWkRzc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm63138.dtsi:251.10-256.5: Warning (simple_bus_reg): /ubus@fffe8000/reboot: missing or empty reg/ranges property
>> arch/arm/boot/dts/broadcom/bcm963138.dtb: / (brcm,bcm963138): compatible:0: 'brcm,bcm63138' was expected
   	from schema $id: http://devicetree.org/schemas/arm/bcm/brcm,bcm63138.yaml#
>> arch/arm/boot/dts/broadcom/bcm963138.dtb: / (brcm,bcm963138): compatible: ['brcm,bcm963138', 'brcm,bcm63138', 'brcm,bcmbca'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/bcm/brcm,bcm63138.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: armpll@20000 (brcm,bcm63138-armpll): #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: armpll@20000 (brcm,bcm63138-armpll): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800c0 (brcm,bcm63138-pmb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800c0 (brcm,bcm63138-pmb): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138.dtb: reset-controller@4800e0 (brcm,bcm63138-pmb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/broadcom/bcm63138.dtsi:251.10-256.5: Warning (simple_bus_reg): /ubus@fffe8000/reboot: missing or empty reg/ranges property
>> arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: / (brcm,BCM963138DVT): compatible:0: 'brcm,bcm63138' was expected
   	from schema $id: http://devicetree.org/schemas/arm/bcm/brcm,bcm63138.yaml#
>> arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: / (brcm,BCM963138DVT): compatible: ['brcm,BCM963138DVT', 'brcm,bcm63138', 'brcm,bcmbca'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/bcm/brcm,bcm63138.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: armpll@20000 (brcm,bcm63138-armpll): #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: armpll@20000 (brcm,bcm63138-armpll): 'clock-output-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/brcm,iproc-clocks.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800c0 (brcm,bcm63138-pmb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800c0 (brcm,bcm63138-pmb): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/brcm,bcm-pmb.yaml#
   arch/arm/boot/dts/broadcom/bcm963138dvt.dtb: reset-controller@4800e0 (brcm,bcm63138-pmb): '#reset-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
