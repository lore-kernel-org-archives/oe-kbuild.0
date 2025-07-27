Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E974B207A16
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632292; cv=none; b=NDV19gH2Iv93VXWN5T9UbV3R4b73bMalQ+ir8Yj2zndPgB6X+eW0q/6fihNagU9ukr4zGUb5ZeIyeT5V8FcXrskrT8M05hMCjV02KBI6bzmR0TBpuGbO/87xt/clfYgUqDojoUOD6zRldXR3elFwXdB1typWWsMzcFYE2FYFuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632292; c=relaxed/simple;
	bh=RR1AqsI2x0C0a2kEPa4gnU79f6dD4TBxbhKRyTD6uXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BlMzDnCv+bxNF5vYCdkJ6gpZKWcOklEsb5lYsfiduR8TMilLQ7lCY7jr2HuPcAimVrJEGIUDi1FRkdtANuZ6fQbHbjnZhKuum4jmZhWjGUv2nUPxARGcJgdHCmOGiAMkUDvBI+LajC4KHKgb8cW+mHymmMiZe/9UbYJAwekP1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuPjLujf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuPjLujf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753632291; x=1785168291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RR1AqsI2x0C0a2kEPa4gnU79f6dD4TBxbhKRyTD6uXU=;
  b=NuPjLujfkc7/qzd+97U7o8qBKMRxNXx6UwovZr7n3u2BXWaK2k9eWyni
   v9wV9gIquNSAuYVWcEIHUTQ4FLIQlMR//h2ulkWf4CLmAu6NiR3/N3U5B
   Lpszm7yLgP5gsJTx7dieUqSaUITkpZbJItt6am7KwUOWWUnIjTYAfaXql
   lKebKlWOu76lav8PesPdbeH4QS6KPLavrqBN2Ks6ETT0K7B9YS7M/O+lx
   6QbLk8m9dysxKflY3zxhnIBHZYSnb42xah3++c/OBv1bE1CFRKTKfl18Z
   GK5OyMjLGXMYrbC51OklKk+fWlM9/qPAWzCDYotE6EyrzGnRCU0YVDtar
   g==;
X-CSE-ConnectionGUID: AJs5xriwRqO2kJowFxprCw==
X-CSE-MsgGUID: r7lCXJ4qReSPWqr2OjmSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66160794"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66160794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 09:04:51 -0700
X-CSE-ConnectionGUID: 3mmDKSHxRny0A4dT93ae5Q==
X-CSE-MsgGUID: to7gXcC0SJKxh7SYnQ+LVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161909621"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jul 2025 09:04:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug3ri-000Mgh-2y;
	Sun, 27 Jul 2025 16:04:46 +0000
Date: Mon, 28 Jul 2025 00:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/6] ARM: dts: r9a06g032: Add GPIO controllers
Message-ID: <202507272330.DBMkYKqe-lkp@intel.com>
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
In-Reply-To: <20250725152618.32886-3-herve.codina@bootlin.com>
References: <20250725152618.32886-3-herve.codina@bootlin.com>
TO: Herve Codina <herve.codina@bootlin.com>
TO: Hoan Tran <hoan@os.amperecomputing.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Saravana Kannan <saravanak@google.com>
TO: Serge Semin <fancer.lancer@gmail.com>
TO: Herve Codina <herve.codina@bootlin.com>
CC: Phil Edworthy <phil.edworthy@renesas.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on robh/for-next brgl/gpio/for-next linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-gpio-snps-dw-apb-Add-support-for-Renesas-RZ-N1/20250725-233131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250725152618.32886-3-herve.codina%40bootlin.com
patch subject: [PATCH 2/6] ARM: dts: r9a06g032: Add GPIO controllers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250727/202507272330.DBMkYKqe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272330.DBMkYKqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507272330.DBMkYKqe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000b000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000c000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: gpio@5000d000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
--
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: switch@44050000 (renesas,r9a06g032-a5psw): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000b000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000c000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: gpio@5000d000 (renesas,r9a06g032-gpio): 'gpio@0', 'gpio@1' do not match any of the regexes: '^gpio-(port|controller)@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
