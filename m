Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C51579D2
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742185391; cv=none; b=cN1UuQRexrn5pfNDt8muw9bXMafwBZPuBXFDPfiy1Zbqe9ZpVpkUdS7SBBuDZh2uTKVqMLX5JNWm3MqonRQ9APx7lIkosvGt1aUiQOOmLlJMq1R1RweH4Q2UtWZ//lL43JFBxrSN7gt4jwZrvpjjDw8hSBrZTJwgJrN1sypbk8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742185391; c=relaxed/simple;
	bh=26pzgF0iq2Xg1jMBovS/3XBsW+3svVmoNuko1HW6YRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PcAv7IIs81SDmZwvMEhW9/vtEhsNHMyvsqFqU5lBc6sz4aWaLqN6JDTp4o4HLoWIFkUdhUAl5Bvj8nRIwpuGnG4lVUBJUqgKYXnkDsA0oxalr2PjgAoMJ/T/aaWcPlj+b6m5okDxg2yrgFI8Fb6OD3dc3L0q7Ht0roYDZ8GzbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6g4LOje; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6g4LOje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742185389; x=1773721389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=26pzgF0iq2Xg1jMBovS/3XBsW+3svVmoNuko1HW6YRY=;
  b=m6g4LOjeI/GLR7f5CeDDA6fSfXyTvdwQR4fYRLRT/wtnXExdCaBbrGPJ
   MfsBvaBTTJBkXAjW0NtYy30KpzlUQpHiLeJKwApHJsW2ZfbLtHkfl1WpF
   sJKbbW9tg9/TKhI6PJPsYhaSHaYQHhKIQKFDVIwjqIXxq+ZIwCAOQ88XD
   eGJFKskyWl6x7LEJ81xhUpkUhox2OrkidWbM5DenTqS1u3JK8J23Ab3GF
   SGikiwlggwHo5a+qAteiflioJ1ahnCsABpu9anAYuvjotIKxeIFZPOfXm
   ICo66E3/mhsrYfA0PfYpRdgMS2UvEqH96V+2OjLe5wPAczwSc/C+P21e0
   Q==;
X-CSE-ConnectionGUID: IIHIX/swTh6spUTL144SZQ==
X-CSE-MsgGUID: hQiLQqgiTeWokJrbWdHo6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="68623390"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="68623390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 21:23:08 -0700
X-CSE-ConnectionGUID: 9iOWASsqQ4egd2440rzcEg==
X-CSE-MsgGUID: a57G4sZ0SY+vJsC7jKD2sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="145008417"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 Mar 2025 21:23:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu20H-000CSJ-0f;
	Mon, 17 Mar 2025 04:23:05 +0000
Date: Mon, 17 Mar 2025 12:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:imx/dt64 66/84]
 arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb:
 clock-controller@30380000: 'fsl,operating-mode' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202503171257.gNjGwLym-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt64
head:   5a690619426fc4b09c7fd3f40d3a69264ef3db0f
commit: 34662050b023399c5de6ddcb4de121b24297bcc9 [66/84] arm64: dts: imx8mp-skov: add basic board as fallback
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250312 (https://download.01.org/0day-ci/archive/20250317/202503171257.gNjGwLym-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171257.gNjGwLym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503171257.gNjGwLym-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: /: failed to match any schema with compatible: ['skov,imx8mp-skov-basic', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000: 'fsl,operating-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
