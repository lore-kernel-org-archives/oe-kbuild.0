Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EBF27470
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528987; cv=none; b=eXCoaQGO93t49TC9mGGHw84WMdiZHNBZjVLsYdIIGa5mTP3xgoJgxb28D8BhPJbxqgvhzikTA3CY4pNBOJAkfqn8B5JA7R3RlsD3ki3X4j0eTSgz0vNDY92sj6/4wJR6x6HRx/gUyx4+060CxecTvav+/YwXze8JvFJ8DHrUABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528987; c=relaxed/simple;
	bh=UE36AV4+eWrJu9/5JL+LDVY5VunXICyMUG4ETliLciY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hum92j65XDU279cduUZiaNEhkjTcZn2QslyynxoaAwS6l93DVsjDJPlv3ei0lDscVIvmnW2x+VGT5r4Gnq7k8aulHLbUcwpj7WSTb+pXOCSw0z0u+1NX871TB1esMRIfmBrNtdEVp+hAykdXh9GsKcCfXKLv5tQOecXy6O5ypFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay9AmNmF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay9AmNmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752528984; x=1784064984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UE36AV4+eWrJu9/5JL+LDVY5VunXICyMUG4ETliLciY=;
  b=Ay9AmNmFYC4UjTA6NxDY5ZCPtT4b1mvyO+Ls1KTNUCpBqdRkpj+Pk3R6
   T0bLwavvHJqmlSdGahLm5+VKZodARwRNzYT97Ew/XXnfEXy0GE0UbNkFC
   7GMqbM9OdTT2gCu79gXHjVzpD8I5mYZNwgQkWFv9zSB9kCrSsxh+rXMjU
   F1JrceF4iJz+vYvInQcYADzsXRF4u2cBZaO8oCSE0zqbaPOrzBs5gBs9u
   wrujSREJYeonEKJN7NnAhGkhOCe32WaUxyKJfk1gBKaV6ERYqdebeQNHU
   UwuBl3YUcCszy2hSes3Nj0R2kGRDnE0f7tDhGsEeVAF3Q5t7ERDQGj+6g
   g==;
X-CSE-ConnectionGUID: TwwN3zlaRPGSP/HF87cS6w==
X-CSE-MsgGUID: xEIQEj5cQiu/ooHn6lpUAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54604965"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54604965"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 14:36:22 -0700
X-CSE-ConnectionGUID: pqAUaCF0TY6WK0Jekf1xCg==
X-CSE-MsgGUID: esFJ3T5yS3+3xDBsIGvc3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157137331"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2025 14:36:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQqP-0009Mt-2s;
	Mon, 14 Jul 2025 21:36:17 +0000
Date: Tue, 15 Jul 2025 05:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: interrupt-controller: aspeed: Refine
 AST2700 binding description and example
Message-ID: <202507150549.jfBx9FmD-lkp@intel.com>
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
In-Reply-To: <20250714071753.2653620-1-ryan_chen@aspeedtech.com>
References: <20250714071753.2653620-1-ryan_chen@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: "ryan_chen" <ryan_chen@aspeedtech.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Kevin Chen <kevin_chen@aspeedtech.com>
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next linus/master v6.16-rc6 next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-interrupt-controller-aspeed-Refine-AST2700-binding-description-and-example/20250714-151943
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250714071753.2653620-1-ryan_chen%40aspeedtech.com
patch subject: [PATCH] dt-bindings: interrupt-controller: aspeed: Refine AST2700 binding description and example
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: csky-randconfig-052-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150549.jfBx9FmD-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150549.jfBx9FmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507150549.jfBx9FmD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml: address-cells: missing type definition
>> Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml: size-cells: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
