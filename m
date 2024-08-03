Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17801078B
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722708008; cv=none; b=gouJFhCd4bRkOx02slnA62g1QgIOipZTG2TOA7u8VU2Kv/eAKHIIlBQLzwTd61RKnsXz66SEW8kuAH/HUppIn3g9JOFzQvT7nXIEc8IhHog6Fc8cPRivI1zqSmO/0/QO7s6VA1GGnYJmgIVd/d7d9wy/rFhTdwH58fgyK3S9mKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722708008; c=relaxed/simple;
	bh=XSd6ngNToxEgDesUuzNwj7+1E2lIEjniBnVaJLxXAyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUdmYM9xcAxtMbin6/BcWE3QTJm5DToGhTRV3BZHWK5rCwsl04HAysizo3QGsF7ojVsB72doJSU2YqqJc+EAhf+xPNBZxgwLpYB+yY/tfqcOR1SEWP776LAnqv770rQG6qF5695zlHo0U78CLMQ3a8o3oqI2MYB1VySdhJzvMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLlX0I6Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLlX0I6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722708007; x=1754244007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSd6ngNToxEgDesUuzNwj7+1E2lIEjniBnVaJLxXAyk=;
  b=eLlX0I6QX5qZR/zE4JChzvq6bOlF/KuOpum07qNpaIUyuMbEgUYhGZaT
   kTSLBAPw4NJI+UcBkjcGefFNtVvFkzhcyja2q/jL7GQIi6yRmtKfX6qgE
   26S0JU04g1oqMElwGYiMk54Q0OhHf+PkWSwILYyS5b35Xshd2uupZGcag
   vKaF/6rZIoGDkOPKKo7Rbyjn391yfngu97IsW/IbfDVh9XurZkiVLyO0J
   +l6rH3BiXc7yFSWhsAmQLi49K8bktrnKyahZSaraIwfHyGZe4DO0FFx3+
   AXaujqNYSbQNM1tJs4gcBUR2NX0bxAwyG503+gyeAZN4XPd8zcVjD3AU+
   A==;
X-CSE-ConnectionGUID: qPABfFoLQJC1vcG01ZeDPA==
X-CSE-MsgGUID: 8NxcsgnqT0+h7lUUUzJm2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="46113792"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="46113792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 11:00:06 -0700
X-CSE-ConnectionGUID: HtMSLtzXSpyIT8M+K+zgNw==
X-CSE-MsgGUID: hP2KuTqPQhWZSbJUBWi/EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="56500638"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Aug 2024 11:00:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saJ2w-0000pG-2X;
	Sat, 03 Aug 2024 18:00:02 +0000
Date: Sun, 4 Aug 2024 01:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v7 3/5] arm64: dts: rockchip: Add AP6275P wireless
 support to Khadas Edge 2
Message-ID: <202408040138.y36TbnRC-lkp@intel.com>
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
In-Reply-To: <20240802025715.2360456-4-jacobe.zang@wesion.com>
References: <20240802025715.2360456-4-jacobe.zang@wesion.com>
TO: Jacobe Zang <jacobe.zang@wesion.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: heiko@sntech.de
TO: kvalo@kernel.org
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: conor+dt@kernel.org
TO: arend.vanspriel@broadcom.com
CC: efectn@protonmail.com
CC: dsimic@manjaro.org
CC: jagan@edgeble.ai
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: arend@broadcom.com
CC: linux-wireless@vger.kernel.org
CC: netdev@vger.kernel.org
CC: megi@xff.cz
CC: duoming@zju.edu.cn
CC: bhelgaas@google.com
CC: minipli@grsecurity.net
CC: brcm80211@lists.linux.dev
CC: brcm80211-dev-list.pdl@broadcom.com
CC: nick@khadas.com
CC: Jacobe Zang <jacobe.zang@wesion.com>

Hi Jacobe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.10]
[also build test WARNING on linus/master next-20240802]
[cannot apply to wireless-next/main wireless/main rockchip/for-next robh/for-next v6.11-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacobe-Zang/dt-bindings-net-wireless-brcm4329-fmac-add-pci14e4-449d/20240803-064705
base:   v6.10
patch link:    https://lore.kernel.org/r/20240802025715.2360456-4-jacobe.zang%40wesion.com
patch subject: [PATCH v7 3/5] arm64: dts: rockchip: Add AP6275P wireless support to Khadas Edge 2
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240804/202408040138.y36TbnRC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040138.y36TbnRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408040138.y36TbnRC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: wifi@0,0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm4329-fmac', 'pci14e4,449d'] is too long
   	'brcm,bcm4329-fmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: wifi@0,0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
