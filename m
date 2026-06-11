Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17983481ABA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205118; cv=none; b=BvJ1MUtsFybyGHDVBsy7YmFcCqnKwvg0CUvxq9bDn5iXLZnE38aDFVYnKXGD+oJLL5a2gBwPzx3I/JYIGgfT1H8a0TDPHIhvOUCf8iU04bkILmFHVx1cdr6OI1D693uKkYEgFfNOqPtR4Rmcp3aC8ewS4wi+oqcqXx7KCkJJFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205118; c=relaxed/simple;
	bh=0yPTZ3N80RgdhkO46XwS2gEKbv4dRxdDtjzAF7W6lYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tND7bpwbpuyI3E64DEi5TNbrZUzGEhWaA75EBzl6UoLQHaTjSEHsfK9deBvMThvXaNZowb+cY7DqZ2iEtDhcZkgq9QjAowLHkYM+15QUCnmtbQHkevPenFWnfYHzICrN2gSwV5QH7ukoc0jnAmAYXAj5fNVQTzC9hgxf1ZQpHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtkAHbHF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtkAHbHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781205116; x=1812741116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0yPTZ3N80RgdhkO46XwS2gEKbv4dRxdDtjzAF7W6lYk=;
  b=HtkAHbHFYBM7OfhZBN5jAXnuYvZATFxwmCx+SMAcECZTuWF6Tm0Ob/C1
   QqQXFfmfnBbwsjRDIL53XT1MxaDZfBqeFSvhtVrlBKkLM4UFbOjHuJw5z
   3CGVrrbKcjTfHbNcl8tKsrEYMfdo71Mrip/HyAfFCdV0c19pw9Hm7oSlG
   Fc22BquPYLwCRit2BAr99ezwilgc72t8U2a9ZgeJt79LyGyUFD3leb3mu
   5cJ2DyDE7fGoITaEY4857BWMQMjuSX8KdlB8scbCqlZDQHQbG4+HPqdC1
   l9H1Ny7Z19IPP0ElB7bPVrBCXS9Ejvmp9GtvRmzJmvNw3R7H0FeEjhNV/
   Q==;
X-CSE-ConnectionGUID: z6eQUWYwQuGiHsutyZVhEQ==
X-CSE-MsgGUID: S2HwkK0JRI2alMtFWdNdKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93421742"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93421742"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:11:55 -0700
X-CSE-ConnectionGUID: tELVn529Ttq5sA6/DrWcEg==
X-CSE-MsgGUID: 54dhq7g+S2KBln6yoI1k+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270608064"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2026 12:11:55 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXkoi-0000000044f-2kln;
	Thu, 11 Jun 2026 19:11:52 +0000
Date: Thu, 11 Jun 2026 21:11:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Message-ID: <202606112137.IRbQ92yX-lkp@intel.com>
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
In-Reply-To: <20260611-crossbar-v2-1-231d4f88298e@gmail.com>
References: <20260611-crossbar-v2-1-231d4f88298e@gmail.com>
TO: Bhargav Joshi <j.bhargav.u@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thomas Gleixner <tglx@kernel.org>
TO: Sricharan R <r.sricharan@ti.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: goledhruva@gmail.com
CC: m-chawdhry@ti.com
CC: daniel.baluta@gmail.com
CC: simona.toaca@nxp.com
CC: j.bhargav.u@gmail.com

Hi Bhargav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb3f4b7426cfd2b79d65b7d37155480b32259a11]

url:    https://github.com/intel-lab-lkp/linux/commits/Bhargav-Joshi/dt-bindings-interrupt-controller-ti-irq-crossbar-Convert-to-DT-schema/20260611-161118
base:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
patch link:    https://lore.kernel.org/r/20260611-crossbar-v2-1-231d4f88298e%40gmail.com
patch subject: [PATCH v2] dt-bindings: interrupt-controller: ti,irq-crossbar: Convert to DT schema
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: microblaze-randconfig-2051-20260611 (https://download.01.org/0day-ci/archive/20260611/202606112137.IRbQ92yX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112137.IRbQ92yX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606112137.IRbQ92yX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml: ti,irqs-reserved: multiple incompatible types: uint8
>> Documentation/devicetree/bindings/interrupt-controller/ti,irq-crossbar.yaml: ti,irqs-reserved: multiple incompatible types: uint32-array

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
