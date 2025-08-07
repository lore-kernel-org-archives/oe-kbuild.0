Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9E81C860A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754594659; cv=none; b=ROgyDPHXJwsqxry4brmY+n4lQY90foATaB6nRZhmlvlW0cMvyfnxnVtwHaVUVz8EBzQ8BSa7hEVooBb0TvFKuLT8bTivlKQg5Srcpd+xO+DI5e00nK4qJuPRtHM+D7MEo7sdvQBrSxBd3AwounYaHz532+JjpSwQMbrafwoJXiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754594659; c=relaxed/simple;
	bh=osy3XfwFuGou8NsM1nUTUdrbKFyMKmKMNksvHJ5pgVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XUt+W+r+Qpj0Cb4MHlCM+ZqcPQXIsbymIq3zm9zdK7sdXuG72vjCdKKYnxNh6Uwxdzvi1OrkieRkFE+nnEe2FBE1V6kv+AGKoc+8BJWhrPhVlyjDyGMShArgvh1K8+qMMI00d8HKkI57WWfQkF2Z9/UqayKajeBszl86OPoOtb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALrO25aH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALrO25aH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754594657; x=1786130657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osy3XfwFuGou8NsM1nUTUdrbKFyMKmKMNksvHJ5pgVk=;
  b=ALrO25aHIOFCw/2mfcPU8P8q6OCa88UAI+w7c/t0BWDBU8XZLqUFZ5nk
   4aAjB6zdfkQoFif+2qhNdT+tbrhN3cCOvqikgX7RlXsHnXKxZesWtATQO
   xhN7l8Kf+qMaRbVom/r9Lk75piRb+ujQGOQXRh2ldxO9C1sZVr4AP8p/5
   kGh+1+tqUd5Gh+rwk7PQkJphgOaPIWWJrBHpW5DKG9Kh2JkM3e7Vc5cGA
   0Oaq/eXZ7BYQeMZAUFn0rUBXFebfL2oucMatQrZFC31wIT9H9K2o5nUFF
   cYgbI6uDTrrU+QEOh60eaz8AtBQxHMWciru3qbpR6sKBvUXw/CI7RcHko
   A==;
X-CSE-ConnectionGUID: ypyyrKgfSu6fVWk6Xcvfbw==
X-CSE-MsgGUID: sAd4D3YMS5ahuZkRVMYk5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67533727"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="67533727"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 12:24:17 -0700
X-CSE-ConnectionGUID: 3wPijoPCSEusNkRdMT24ZA==
X-CSE-MsgGUID: 4j8x4mIlQUqXIJCorcYuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165485935"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 12:24:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk6Dj-000396-1a;
	Thu, 07 Aug 2025 19:24:12 +0000
Date: Fri, 8 Aug 2025 03:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801] arch/arc/boot/dts/axs101.dtb:
 dw-apb-gpio@2000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was
 expected
Message-ID: <202508080306.HygmyBp8-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux: Convert adi,adgs1408 to DT schema
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080306.HygmyBp8-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080306.HygmyBp8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080306.HygmyBp8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): input-clk: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): arc700-intc@cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: cpu_card (simple-bus): 'arc700-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs101.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs101.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): connector: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs101.dtb: axs10x_mb (simple-bus): sound_playback: 'ranges' is a required property
--
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs101.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs101.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs101.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): pct: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
>> arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103.dtb: pct (snps,archs-pct): 'clocks' is a required property
--
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): idu-interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): $nodename:0: 'cpu_card' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: cpu_card (simple-bus): 'archs-intc@cpu' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: archs-intc@cpu (snps,archs-intc): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-gpio@2000 (snps,dw-apb-gpio): $nodename:0: 'dw-apb-gpio@2000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): $nodename:0: 'dw-apb-uart@5000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: dw-apb-uart@5000 (snps,dw-apb-uart): Unevaluated properties are not allowed ('baud' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): '#interrupt-cells', 'interrupt-parent', 'interrupts' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/arc/snps,archs-pct.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: pct (snps,archs-pct): 'clocks' is a required property
--
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'dvdd-3v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: adv7511@39 (adi,adv7511): 'bgvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7511.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio@13000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@1:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio@14000 (snps,dw-apb-gpio): gpio-controller@2:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@1 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: gpio-controller@2 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arc/boot/dts/axs103_idu.dtb: pgu@17000 (snps,arcpgu): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
