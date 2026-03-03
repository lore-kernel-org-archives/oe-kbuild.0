Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF56388E42
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 22:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577806; cv=none; b=i1qCJ/PDSf6WPVvRXEg/mG5DJocnWJwZ9Zamit8IJqoodUQSEgACF/GAI6Z3c5L4xGVIi8F6miWw0YcKByuAMQxxej1u+co6hm1UW8xWsKfJv6i5af1zjTVG/kSDVK5uc2wvuozQo9DDcdPYwuMmes68eX6hZYeZjT8bUHiP0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577806; c=relaxed/simple;
	bh=Nna4OUSP7ooArUXjpcNByOhmrPpYBtR1wZCsbBoUoIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvN4A6ZMIigK5o+itKOgNyO93T6HYjFVwfDhJBwxO7o7X1TDPoqxDyXBIUcYp92EpxSiWCvOR5uneWmCqOg2+rK2d7B5cxfPd4iOvmGlyVsNvPHvEdwv4thJswHIDOkkVtCIIazP42tjqM43iWCxbHSufgseD0AanqiVrVbhHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDKL5VjM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDKL5VjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772577803; x=1804113803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nna4OUSP7ooArUXjpcNByOhmrPpYBtR1wZCsbBoUoIs=;
  b=LDKL5VjM2dfAFM+5Udinl9IwCa9HjucbKhByDcyBywEeqrFx9MYirWRp
   fOUK/AIb4S7NNzVYCJuu7ZEgENABhmmvY/PO6AJVfgUDFS5vNnT7xOvyr
   ybr4K1e80wcIFSxGkfb9HHiwc+3LMKqyewY7qzE45ceAneCHD7W9FkmEe
   zyzVqsChNYhz83fkJ45ieWbJNcVrWoh/XdTv/OJLh1GLEokza//OZ2Yl+
   1F+XCUOmAQfqLz0owicPFtHCvvCXX5v1K+KcuBGqIQSizjFmpGDOsmPBm
   bN3quWANdsUOPNdHE2TUYak8y1dXUfRZF/j+v420odaSwjle5JceJeCBh
   Q==;
X-CSE-ConnectionGUID: dQDpQAQrRNOo6kmcP25R6w==
X-CSE-MsgGUID: Y3wfcHRoS7a3jXK71GdbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99105102"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="99105102"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 14:43:22 -0800
X-CSE-ConnectionGUID: vqvFCOixShG+iAhZtQZyDw==
X-CSE-MsgGUID: B6psMy4NRD2RloVu7+sXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="217382501"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2026 14:43:22 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxYSV-000000001YT-35SG;
	Tue, 03 Mar 2026 22:43:19 +0000
Date: Tue, 3 Mar 2026 23:42:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss
 from staging
Message-ID: <202603032325.bjQqr68U-lkp@intel.com>
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
In-Reply-To: <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
References: <20260303-drop-starfive-camss-v3-2-8f44c07fb137@ideasonboard.com>
TO: Jai Luthra <jai.luthra@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rishikesh Donadkar <r-donadkar@ti.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-staging@lists.linux.dev
CC: Jai Luthra <jai.luthra@ideasonboard.com>

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/media-staging-Drop-starfive-camss-from-staging/20260303-172833
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260303-drop-starfive-camss-v3-2-8f44c07fb137%40ideasonboard.com
patch subject: [PATCH v3 2/2] media: dt-bindings: Drop starfive,jh7110-camss from staging
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260303/202603032325.bjQqr68U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032325.bjQqr68U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032325.bjQqr68U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-lite-emmc.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.2a.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']
--
>> arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb: /soc/isp@19840000: failed to match any schema with compatible: ['starfive,jh7110-camss']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
