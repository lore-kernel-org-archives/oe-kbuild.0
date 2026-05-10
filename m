Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C071A9FA4
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778414505; cv=none; b=ugN4N+Eo84b9c/XkS8djQi4EjfY/eTCUX9Ib7qblu1O09+Idxd+wKYRwRs/ZSmdg9K3BXCil6bTZ1EgRJP7Flr8GSDH0/iDTLEW6UjkdekSPMc0tCEIRO0/MLnDFkvXG8rx97lM8qDwhvjzjQhRmBVLUaqs11UZimWbO+Uij/L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778414505; c=relaxed/simple;
	bh=IMiHEGIyhFMqeAKuDbsENWnYkvuVlgmax/XhpaN1wsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6FqGin8XhD5MwcFFjY+XUr0zFcuuJXQjO+ExkrQP2OvgnsMh3vA/BmXZdQXUS73h7LuOerS9pRygHyJwLX3vSBTqeL8/VxQC65MEn33XlZTFPZ/gbmf80xvFyuRCxEUU6piO47stdHUqRXAelSmYbYgPPOp7Ik0mcNVJgUQewI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwKmJn/c; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwKmJn/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778414504; x=1809950504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMiHEGIyhFMqeAKuDbsENWnYkvuVlgmax/XhpaN1wsY=;
  b=RwKmJn/caGZwBU82od7y9srAgdz0Tb3WFTzmCaRguCZ7TxuAlBB1NZUI
   oYCngczv+gUTnEuHY8zVQgzp469SfJIHm4t6nGhbNvmBBhqtl+kVy5sdy
   UZHcBI+M6Zw5wtdSt7wD8Qjyung0C9a+MiMfl/BB6AAPyd/k+MH20mEp8
   XdpR7Mzf/6p3D0cv+BE92bCevvLPojUmYVOlg6a2FmmdaOBHQyiKxQOBL
   3m6gbvzhOFPnU7Q+j91VQHjhqXU7drEg77yIL3Ywc0hZn/2Vqx8hG7Kkt
   PCJAxJFPu+zds3UMrRmSu4CUwGqJ3nFLoHkIwZfrPMEpWqOGvsWRtbwbE
   g==;
X-CSE-ConnectionGUID: dCYojOQVShqFWhNzaigEvw==
X-CSE-MsgGUID: rEqHgw/6Tqem0xpWAO6grg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79310466"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79310466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 05:01:43 -0700
X-CSE-ConnectionGUID: 0NTG/DsTTHCzcNtzalWZqA==
X-CSE-MsgGUID: kcpoRMwoRaCkcmbPoaZoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="275341815"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2026 05:01:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM2qp-000000007iL-3JpC;
	Sun, 10 May 2026 12:01:39 +0000
Date: Sun, 10 May 2026 14:01:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v4 10/10] docs: iio: add documentation for ad9910
 driver
Message-ID: <202605101422.M9fU9TGG-lkp@intel.com>
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
In-Reply-To: <20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d@analog.com>
References: <20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d@analog.com>
TO: Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>

Hi Rodrigo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9e62a5d329f8f0f07c4d5f80a691e3f16dcb957c]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-ad9910/20260510-101220
base:   9e62a5d329f8f0f07c4d5f80a691e3f16dcb957c
patch link:    https://lore.kernel.org/r/20260508-ad9910-iio-driver-v4-10-d26bfd20ee3d%40analog.com
patch subject: [PATCH RFC v4 10/10] docs: iio: add documentation for ad9910 driver
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: csky-randconfig-2052-20260510 (https://download.01.org/0day-ci/archive/20260510/202605101422.M9fU9TGG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101422.M9fU9TGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605101422.M9fU9TGG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml:148:28: [warning] too few spaces after comma (commas)

vim +148 Documentation/devicetree/bindings/iio/frequency/adi,ad9910.yaml

6c18b7a7132552 Rodrigo Alencar 2026-05-08    8  
6c18b7a7132552 Rodrigo Alencar 2026-05-08    9  maintainers:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   10    - Rodrigo Alencar <rodrigo.alencar@analog.com>
6c18b7a7132552 Rodrigo Alencar 2026-05-08   11  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   12  description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   13    The AD9910 is a 1 GSPS direct digital synthesizer (DDS) with an integrated
6c18b7a7132552 Rodrigo Alencar 2026-05-08   14    14-bit DAC. It features single tone mode with 8 configurable profiles,
6c18b7a7132552 Rodrigo Alencar 2026-05-08   15    a digital ramp generator, RAM control, OSK, and a parallel data port for
6c18b7a7132552 Rodrigo Alencar 2026-05-08   16    high-speed streaming.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   17  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   18    https://www.analog.com/en/products/ad9910.html
6c18b7a7132552 Rodrigo Alencar 2026-05-08   19  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   20  properties:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   21    compatible:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   22      const: adi,ad9910
6c18b7a7132552 Rodrigo Alencar 2026-05-08   23  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   24    reg:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   25      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   26  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   27    spi-max-frequency:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   28      maximum: 70000000
6c18b7a7132552 Rodrigo Alencar 2026-05-08   29  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   30    clocks:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   31      minItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   32      items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   33        - description: Reference clock (REF_CLK).
6c18b7a7132552 Rodrigo Alencar 2026-05-08   34        - description: Optional synchronization clock (SYNC_IN).
6c18b7a7132552 Rodrigo Alencar 2026-05-08   35  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   36    clock-names:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   37      oneOf:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   38        - items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   39            - const: ref_clk
6c18b7a7132552 Rodrigo Alencar 2026-05-08   40        - items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   41            - const: ref_clk
6c18b7a7132552 Rodrigo Alencar 2026-05-08   42            - const: sync_in
6c18b7a7132552 Rodrigo Alencar 2026-05-08   43  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   44    '#clock-cells':
6c18b7a7132552 Rodrigo Alencar 2026-05-08   45      const: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   46  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   47    clock-output-names:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   48      minItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   49      maxItems: 3
6c18b7a7132552 Rodrigo Alencar 2026-05-08   50      items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   51        enum: [ sync_clk, pdclk, sync_out ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08   52  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   53    interrupts:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   54      minItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   55      items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   56        - description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   57            Signal that indicates that Digital Ramp Generator has reached a limit.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   58        - description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   59            Signal that indicates the end of a RAM Sweep.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   60  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   61    interrupt-names:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   62      minItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   63      maxItems: 2
6c18b7a7132552 Rodrigo Alencar 2026-05-08   64      items:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   65        enum: [ drover, ram_swp_ovr ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08   66  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   67    dvdd-io33-supply:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   68      description: 3.3V Digital I/O supply.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   69  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   70    avdd33-supply:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   71      description: 3.3V Analog DAC supply.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   72  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   73    dvdd18-supply:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   74      description: 1.8V Digital Core supply.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   75  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   76    avdd18-supply:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   77      description: 1.8V Analog Core supply.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   78  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   79    reset-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   80      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   81        GPIOs controlling the Main Device reset.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   82  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   83    io-reset-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   84      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   85      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   86        GPIO controlling the I/O_RESET pin.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   87  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   88    powerdown-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   89      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   90      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   91        GPIO controlling the EXT_PWR_DWN pin.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   92  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   93    update-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   94      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08   95      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   96        GPIO controlling the I/O_UPDATE pin.
6c18b7a7132552 Rodrigo Alencar 2026-05-08   97  
6c18b7a7132552 Rodrigo Alencar 2026-05-08   98    profile-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08   99      minItems: 3
6c18b7a7132552 Rodrigo Alencar 2026-05-08  100      maxItems: 3
6c18b7a7132552 Rodrigo Alencar 2026-05-08  101      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  102        GPIOs controlling the PROFILE[2:0] pins for profile selection.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  103  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  104    sync-err-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  105      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08  106      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  107        GPIO used to read SYNC_SMP_ERR pin status.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  108  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  109    lock-detect-gpios:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  110      maxItems: 1
6c18b7a7132552 Rodrigo Alencar 2026-05-08  111      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  112        GPIO used to read PLL_LOCK pin status.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  113  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  114    adi,pll-enable:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  115      type: boolean
6c18b7a7132552 Rodrigo Alencar 2026-05-08  116      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  117        Indicates that a loop filter is connected and the internal PLL is enabled.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  118        Often used when the reference clock is provided by a crystal or by a
6c18b7a7132552 Rodrigo Alencar 2026-05-08  119        single-ended on-board oscillator.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  120  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  121    adi,charge-pump-current-microamp:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  122      minimum: 212
6c18b7a7132552 Rodrigo Alencar 2026-05-08  123      maximum: 387
6c18b7a7132552 Rodrigo Alencar 2026-05-08  124      default: 212
6c18b7a7132552 Rodrigo Alencar 2026-05-08  125      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  126        PLL charge pump current in microamps. Only applicable when the internal
6c18b7a7132552 Rodrigo Alencar 2026-05-08  127        PLL is enabled. The value is rounded to the nearest supported step. This
6c18b7a7132552 Rodrigo Alencar 2026-05-08  128        value depends mostly on the loop filter design.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  129  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  130    adi,refclk-out-drive-strength:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  131      $ref: /schemas/types.yaml#/definitions/string
6c18b7a7132552 Rodrigo Alencar 2026-05-08  132      enum: [ disabled, low, medium, high ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  133      default: disabled
6c18b7a7132552 Rodrigo Alencar 2026-05-08  134      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  135        Reference clock output (DRV0) drive strength. Only applicable when
6c18b7a7132552 Rodrigo Alencar 2026-05-08  136        the internal PLL is enabled.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  137  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  138    adi,dac-output-current-microamp:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  139      minimum: 8640
6c18b7a7132552 Rodrigo Alencar 2026-05-08  140      maximum: 31590
6c18b7a7132552 Rodrigo Alencar 2026-05-08  141      default: 20070
6c18b7a7132552 Rodrigo Alencar 2026-05-08  142      description:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  143        DAC full-scale output current in microamps.
6c18b7a7132552 Rodrigo Alencar 2026-05-08  144  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  145  dependencies:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  146    adi,charge-pump-current-microamp: [ 'adi,pll-enable' ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  147    adi,refclk-out-drive-strength: [ 'adi,pll-enable' ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08 @148    lock-detect-gpios: [ adi,pll-enable ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  149    interrupts: [ interrupt-names ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  150    clocks: [ clock-names ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  151    '#clock-cells': [ clock-output-names ]
6c18b7a7132552 Rodrigo Alencar 2026-05-08  152  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  153  required:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  154    - compatible
6c18b7a7132552 Rodrigo Alencar 2026-05-08  155    - reg
6c18b7a7132552 Rodrigo Alencar 2026-05-08  156    - clocks
6c18b7a7132552 Rodrigo Alencar 2026-05-08  157    - dvdd-io33-supply
6c18b7a7132552 Rodrigo Alencar 2026-05-08  158    - avdd33-supply
6c18b7a7132552 Rodrigo Alencar 2026-05-08  159    - dvdd18-supply
6c18b7a7132552 Rodrigo Alencar 2026-05-08  160    - avdd18-supply
6c18b7a7132552 Rodrigo Alencar 2026-05-08  161  
6c18b7a7132552 Rodrigo Alencar 2026-05-08  162  allOf:
6c18b7a7132552 Rodrigo Alencar 2026-05-08  163    - $ref: /schemas/spi/spi-peripheral-props.yaml#
6c18b7a7132552 Rodrigo Alencar 2026-05-08  164  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
