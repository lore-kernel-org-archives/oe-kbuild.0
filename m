Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6423148DD
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Mar 2026 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208794; cv=none; b=KIhoOsu+un/yu+3sWP3cpV4U+3Nj4SyGJyY6Tq8lfufeqyVDTwrNWrVqsSLrcBVQ3jAc6AYuwM5hOFyc/UujKUGgz8EXaAtevYW6NqEdPP/XDQZfMQ/tn3BETNR+Tl/S6mOYt8ns+Af8szIyigHxHLRbp5T77wDwvURyIXKLk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208794; c=relaxed/simple;
	bh=fSyGhsQa31PTlUAD0zEVTPpoWZCvi0Qr7F195MUT+2g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/1AqhQPCNJ/bQT+8ej6yBbMD/Izfq0+uPKpraW7cDY5cqClpTk8VC3hcFYkxcbTRUTy2IrGg9GNldz0w2CfpI7JEa0ryl6YPn1q3xByWkIDfj6piQLvvphdLDQKI8DgadKsoOlTDMQZxRgf83KBsuE9KAfx4OyZi4DCtfniqvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAPePwyn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAPePwyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773208792; x=1804744792;
  h=date:from:to:cc:subject:message-id;
  bh=fSyGhsQa31PTlUAD0zEVTPpoWZCvi0Qr7F195MUT+2g=;
  b=ZAPePwynFESmOMiL63g0iymdVx0OEoaX5GJxyvTK4H8Vm+0Wh7bNftQs
   eV3lUu4GtOlI4DjBcSVGkBL9JLYg/TljVPT+nii+4WV7g+aeTGlAEDeeB
   /9U1uhrQmrqTniez1/rtdl8XWO26sItCVk0BhI8Q7trqEEbSP/RskZ2ze
   cCNP44Axi/8KN94s8ZMGqPyBfMTCDjOztgytF20ITwKV8Zp2W8DQy5+0e
   9mjEyBDgP+pn7GZrIKnuh2NG807P2vYThZlpvnUxn2wHe16LxUD2i6ZyK
   V82vHMLp2y3SrRlfkuOxpQfIlefja9WiebUMqz7NDRDPc9PxLmXX0tU45
   Q==;
X-CSE-ConnectionGUID: UiULjmalRmuY/jbF79jHyA==
X-CSE-MsgGUID: x+Ty5uu5RrWChWZ2d3mY8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96882758"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="96882758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:59:52 -0700
X-CSE-ConnectionGUID: DRqUkYsuSeyix8aKG6/XSA==
X-CSE-MsgGUID: T7KcYU/+Rd+N/zgBx+uyFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219486541"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 22:59:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Cbl-000000003H3-0EI0;
	Wed, 11 Mar 2026 05:59:49 +0000
Date: Wed, 11 Mar 2026 06:59:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 263/621]
 Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml:
 cavium,bus-max-width: missing type definition
Message-ID: <202603110611.pPZ50ous-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: ca33599d946dfed82e9e9294c26ae555c20442bf [263/621] dt-bindings: mmc: Convert cavium,octeon-6130-mmc to DT schema
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-2051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110611.pPZ50ous-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110611.pPZ50ous-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603110611.pPZ50ous-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mmc/cavium,octeon-6130-mmc.yaml: cavium,bus-max-width: missing type definition
   Documentation/devicetree/bindings/memory-controllers/atmel,ebi.yaml: atmel,smc-page-mode: missing type definition
   Documentation/devicetree/bindings/memory-controllers/marvell,mvebu-devbus.yaml: devbus,bus-width: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: bright-addr: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: gpio-ext: missing type definition
   Documentation/devicetree/bindings/leds/lacie,netxbig-leds.yaml: timers: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
   Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Traceback (most recent call last):

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
