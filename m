Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BE2E7F11
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 05:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769059896; cv=none; b=YIyBpgphk2bOCxShYVo2z+YGf4aLhk/2xYHqyEDom1y8V5V3EXDtGWYhESguaJww5D16a8sSBl29P+GIzXCmuzkrGYmDMReix3WOdaqwY4uIZkDNo8uU9FILcw/GJg6bn2m5oh4p9ozuoOmP1SQTXn2fV4wj3ra3MxlyUDNI9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769059896; c=relaxed/simple;
	bh=EFI+A8qKAcB6WaJCyLQ5hYdZGQ0WeBAjZoik7r7CltY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnmdNtma0GypJWRTv+yb1fiif73W65/HG0Qv5zmYvB/Qi9SZLBdkwBpCSmXcYT8l77+el4mApkJC2sjwFCBDra1EmeRqTltFyKumQNOeJJOyURKKl4sgmqCPTMxiXxuAdgSkhfWwzeAP0kFAgtn8I7N2mg+TI9FYsGtJOgYTVzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TUtx6Rw8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TUtx6Rw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769059894; x=1800595894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EFI+A8qKAcB6WaJCyLQ5hYdZGQ0WeBAjZoik7r7CltY=;
  b=TUtx6Rw8hVQxbQMjxtZmzkVJIb06PzOwxMHjnpayt+1RCSAsb1upyxpB
   LMabs1oM/dSS0M3cdc7n1exT/Bb8e4IYxqv126p9uu4jdjQsxst5QI1V/
   yHCGldoaJR7u2mgegAqLI1GL/HMJlgQwe2eTIWHmA+zeuEl/BNk+sZypf
   s64wkMIxdHyE9gLttBeEGhgMwzNGqDND8KFWVBdOxineqTjeOdJ5VziI4
   V/+Ng+kCNZWNYcKR/S1zX+cLUKUNwEmviLkW8c1dHgJo0xZXG72joWz+q
   LcT9GINGFdNdz14uMkFUQLMugCsOw8+keOR+zgOEXvjtFFYCqmGHyUyxG
   A==;
X-CSE-ConnectionGUID: ajNG3KDlS1yWJflIDK1ETQ==
X-CSE-MsgGUID: leRsSHQ8TXivIHPDC4Rjag==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81740979"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81740979"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 21:31:33 -0800
X-CSE-ConnectionGUID: 4YgXzuUSQeCcCpO4Xliuwg==
X-CSE-MsgGUID: TOLfpubLRh6sRmAtS+qnrQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2026 21:31:32 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vinI2-000000000RJ-1GkH;
	Thu, 22 Jan 2026 05:31:30 +0000
Date: Thu, 22 Jan 2026 06:30:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
Message-ID: <202601220636.Tk2mF4PK-lkp@intel.com>
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
In-Reply-To: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
TO: Billy Tsai <billy_tsai@aspeedtech.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Linus Walleij <linusw@kernel.org>
TO: Billy Tsai <billy_tsai@aspeedtech.com>
TO: Bartosz Golaszewski <brgl@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-gpio@vger.kernel.org
CC: bmc-sw@aspeedtech.com

Hi Billy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/Add-compatible-strings-for-AST2700-pinctrl-to-the-SCU-binding/20260120-200009
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20260120-upstream_pinctrl-v3-2-868fbf8413b5%40aspeedtech.com
patch subject: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for AST27xx
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-2051-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220636.Tk2mF4PK-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220636.Tk2mF4PK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220636.Tk2mF4PK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
   	'pins' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'anyOf' conditional failed, one must be fixed:
   	'drive-strength' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
   	'type' was expected
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'pins' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml
>> Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml: patternProperties:-state$: 'drive-strength' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'not', 'if', 'else', 'then', 'allOf', 'anyOf', 'oneOf', '$ref']
   	from schema $id: http://devicetree.org/meta-schemas/nodes.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
