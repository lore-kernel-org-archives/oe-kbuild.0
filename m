Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFB4C98
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576756; cv=none; b=PW8d2r4jH2T6U3iroRBHtTrsZZW//xoKbgA5KYvV23KG+f1sAT4ffHGKrqTL0/VzcT6Y75HPyPiX8rfg8QxFA1lS5cm7saaxSVmbToaNtloVOtLqMQRIP+18w6Y5LcIxA73sFSBEAnnOQ6l2NC//DjUxyYfpDciq52L/3WoqXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576756; c=relaxed/simple;
	bh=rX7nEgYwFcdDsA/eyZFsHdrCE4Z1Q4Fe4CLu+Qa9TIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PAfLcOL1xGMvJMoEfryig05PNnzx8fs7zWQIk7GSEmjYrOgblkvDZ/JY9ulAD1DvIiLyZJ8WEtUdEKdmwWfqVxgEXHg3N1pK7X2CB8CEs7zPraWMydHZXOFOAuw3DgCazoSPyv9mhsJtgxj3joS+KcC3U6IR7OjhVzAFoKUNDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ch3I261f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ch3I261f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766576754; x=1798112754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rX7nEgYwFcdDsA/eyZFsHdrCE4Z1Q4Fe4CLu+Qa9TIU=;
  b=Ch3I261fo8ui1CPqfePSVG/IJelDEoYEUVM6Am7P0mZ5I1+kuWcGv5S+
   gaJ8hx9XNMrjqA9BXGIw8xpFQqAH6egfgLbHXitFDdsocydjmkkHlI9rK
   88CB6kiUAFS0ujhMUo3C2Yg6rImrBAODd4tVGIdYJzTqQvV5y6dPKAr3v
   Lbi9tuwpfzjVBjUL9+bkzDpE0SbcS7HQHovFQigRqA8FmzO/Pl/puzlu+
   PiytncEXSUcXnKMEA/MKzQZOh49YT9VEX30dwReAt8CCh0Tyd4ecyByZw
   lHVI5eW3M1K5B/hvbZgoQsjA5SEY8qK+mO3U3RPYCSBK3heTFWpAxN3GV
   A==;
X-CSE-ConnectionGUID: zBuFKC9WRbO+o4C4XRxAAA==
X-CSE-MsgGUID: 4PvA3DYZQNOsE+VDonBkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79534298"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="79534298"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 03:45:54 -0800
X-CSE-ConnectionGUID: ZHCfoiV9QSuEqsvxKTjMiA==
X-CSE-MsgGUID: AQILij2QTvC/Tq8TCKwgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="199143357"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 24 Dec 2025 03:45:53 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYNJO-000000006CS-1qDf;
	Wed, 24 Dec 2025 11:45:50 +0000
Date: Wed, 24 Dec 2025 12:45:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
Message-ID: <202512241211.t8uGeVRw-lkp@intel.com>
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
In-Reply-To: <20251215212507.3317805-1-robh@kernel.org>
References: <20251215212507.3317805-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
TO: Masami Hiramatsu <mhiramat@kernel.org>
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next krzk-dt/for-next linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-usb-Add-Socionext-Uniphier-DWC3-controller/20251216-053102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20251215212507.3317805-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-2051-20251217 (https://download.01.org/0day-ci/archive/20251224/202512241211.t8uGeVRw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241211.t8uGeVRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512241211.t8uGeVRw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/socionext/uniphier-pro4-ace.dtb: /soc/smpctrl@59801000: failed to match any schema with compatible: ['socionext,uniphier-smpctrl']
>> arch/arm/boot/dts/socionext/uniphier-pro4-ace.dtb: usb@65c00000 (socionext,uniphier-dwc3): phys: [[48]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml
--
   arch/arm/boot/dts/socionext/uniphier-pro4-ref.dtb: /soc/smpctrl@59801000: failed to match any schema with compatible: ['socionext,uniphier-smpctrl']
>> arch/arm/boot/dts/socionext/uniphier-pro4-ref.dtb: usb@65c00000 (socionext,uniphier-dwc3): phys: [[49]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml
--
   arch/arm/boot/dts/socionext/uniphier-pro4-sanji.dtb: /soc/smpctrl@59801000: failed to match any schema with compatible: ['socionext,uniphier-smpctrl']
>> arch/arm/boot/dts/socionext/uniphier-pro4-sanji.dtb: usb@65c00000 (socionext,uniphier-dwc3): phys: [[48]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
