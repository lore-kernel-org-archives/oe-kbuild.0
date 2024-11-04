Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F1167296
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698128; cv=none; b=AyVT5Pgf3X0QJ3Msgrq+Y97A/QGxyUJysBWIEBBLl5wcoUtQgIiaBr8ckBN7pYGwnpEj0nMriaICJ4hB9dTd8f2olTYnZjAL6Nmh3bmfxCghMVs7rTxGp942y5T/qdPOSUipOn7rHJy0f2stCYwKrT/sbpIVvh/xCAXOeV4MmDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698128; c=relaxed/simple;
	bh=5MYrAo2A4uRqysXweNuLucaptzHnrmUe00Q6twhkzDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwAh6B/LIHS8qo1W72RUEtg642MPm+C57VPRDn/F/aWkfrkTMDKtUPCOa6/+MNajpSMaa2wO/hFejO5WfGGY24eS+AphpewhtUHE0voAeECBtDl9ADlug1fl+C9Fi8ZnjB071SS8U5PCqe0HQl31csMZ8vM0dP81CaxzPU4/erg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdzXDejK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdzXDejK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730698126; x=1762234126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5MYrAo2A4uRqysXweNuLucaptzHnrmUe00Q6twhkzDI=;
  b=mdzXDejK1koHqjSMIe0ZiwrjKhhkPKY0iVu7/AZGUbdPqTg2rZhXrb0h
   ojt0WtxZH2jBiFVqwnZiKNKvuvMe9W4IdoWF31PybNhuCGJ4KKOFkSoHG
   n2uVb86cjusYxzYEmUOMg4c8KmCkB1WkeD9i34aSk0CUFcF+WuvcpszJG
   uVvYQVdRKt9I0ebU+25bz3ToQmbUNET/P8CM8gJdhEyf/syWk3IL1/9iY
   azusHt2KfxoZZv4ltOyLNDe9chKCj45Z+GbtpxqgWtiFHmyrY0TXRp2wW
   0FtPJoDxXdmIUnFgQuGIXPNtBrKwxzHeoalapRzP7RVnPk4EM5AvwVMbd
   Q==;
X-CSE-ConnectionGUID: /bedLsIqQKibNl/4jlQHbg==
X-CSE-MsgGUID: REv3+Q+cTSyYlwrHxQiUTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41482613"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41482613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 21:28:44 -0800
X-CSE-ConnectionGUID: dzxo/Hy7TQeeM0nWt2h0aQ==
X-CSE-MsgGUID: 94JHv24wT46GG1gZel94HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83070501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2024 21:28:42 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7pdo-000kUV-0A;
	Mon, 04 Nov 2024 05:28:40 +0000
Date: Mon, 4 Nov 2024 13:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 1360/1360]
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <202411041305.karqcxbp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zeng Heng <zengheng4@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4d3056ab32e02139d7656adf048416e877e283b0
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [1360/1360] dt-bindings: arm: Add MPAM MSC binding
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-052-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041305.karqcxbp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041305.karqcxbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411041305.karqcxbp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +76 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml

c21dc717760f85 Rob Herring 2024-01-22   8  
c21dc717760f85 Rob Herring 2024-01-22   9  description: |
c21dc717760f85 Rob Herring 2024-01-22  10    The Arm MPAM specification can be found here:
c21dc717760f85 Rob Herring 2024-01-22  11  
c21dc717760f85 Rob Herring 2024-01-22  12    https://developer.arm.com/documentation/ddi0598/latest
c21dc717760f85 Rob Herring 2024-01-22  13  
c21dc717760f85 Rob Herring 2024-01-22  14  maintainers:
c21dc717760f85 Rob Herring 2024-01-22  15    - Rob Herring <robh@kernel.org>
c21dc717760f85 Rob Herring 2024-01-22  16  
c21dc717760f85 Rob Herring 2024-01-22  17  properties:
c21dc717760f85 Rob Herring 2024-01-22  18    compatible:
c21dc717760f85 Rob Herring 2024-01-22  19      items:
c21dc717760f85 Rob Herring 2024-01-22  20        - const: arm,mpam-msc                   # Further details are discoverable
c21dc717760f85 Rob Herring 2024-01-22  21        - const: arm,mpam-memory-controller-msc
c21dc717760f85 Rob Herring 2024-01-22  22  
c21dc717760f85 Rob Herring 2024-01-22  23    reg:
c21dc717760f85 Rob Herring 2024-01-22  24      maxItems: 1
c21dc717760f85 Rob Herring 2024-01-22  25      description: A memory region containing registers as defined in the MPAM
c21dc717760f85 Rob Herring 2024-01-22  26        specification.
c21dc717760f85 Rob Herring 2024-01-22  27  
c21dc717760f85 Rob Herring 2024-01-22  28    interrupts:
c21dc717760f85 Rob Herring 2024-01-22  29      minItems: 1
c21dc717760f85 Rob Herring 2024-01-22  30      items:
c21dc717760f85 Rob Herring 2024-01-22  31        - description: error (optional)
c21dc717760f85 Rob Herring 2024-01-22  32        - description: overflow (optional, only for monitoring)
c21dc717760f85 Rob Herring 2024-01-22  33  
c21dc717760f85 Rob Herring 2024-01-22  34    interrupt-names:
c21dc717760f85 Rob Herring 2024-01-22  35      oneOf:
c21dc717760f85 Rob Herring 2024-01-22  36        - items:
c21dc717760f85 Rob Herring 2024-01-22  37            - enum: [ error, overflow ]
c21dc717760f85 Rob Herring 2024-01-22  38        - items:
c21dc717760f85 Rob Herring 2024-01-22  39            - const: error
c21dc717760f85 Rob Herring 2024-01-22  40            - const: overflow
c21dc717760f85 Rob Herring 2024-01-22  41  
c21dc717760f85 Rob Herring 2024-01-22  42    arm,not-ready-us:
c21dc717760f85 Rob Herring 2024-01-22  43      description: The maximum time in microseconds for monitoring data to be
c21dc717760f85 Rob Herring 2024-01-22  44        accurate after a settings change. For more information, see the
c21dc717760f85 Rob Herring 2024-01-22  45        Not-Ready (NRDY) bit description in the MPAM specification.
c21dc717760f85 Rob Herring 2024-01-22  46  
c21dc717760f85 Rob Herring 2024-01-22  47    numa-node-id: true # see NUMA binding
c21dc717760f85 Rob Herring 2024-01-22  48  
c21dc717760f85 Rob Herring 2024-01-22  49    '#address-cells':
c21dc717760f85 Rob Herring 2024-01-22  50      const: 1
c21dc717760f85 Rob Herring 2024-01-22  51  
c21dc717760f85 Rob Herring 2024-01-22  52    '#size-cells':
c21dc717760f85 Rob Herring 2024-01-22  53      const: 0
c21dc717760f85 Rob Herring 2024-01-22  54  
c21dc717760f85 Rob Herring 2024-01-22  55  patternProperties:
c21dc717760f85 Rob Herring 2024-01-22  56    '^ris@[0-9a-f]$':
c21dc717760f85 Rob Herring 2024-01-22  57      type: object
c21dc717760f85 Rob Herring 2024-01-22  58      additionalProperties: false
c21dc717760f85 Rob Herring 2024-01-22  59      description: |
c21dc717760f85 Rob Herring 2024-01-22  60        RIS nodes for each RIS in an MSC. These nodes are required for each RIS
c21dc717760f85 Rob Herring 2024-01-22  61        implementing known MPAM controls
c21dc717760f85 Rob Herring 2024-01-22  62  
c21dc717760f85 Rob Herring 2024-01-22  63      properties:
c21dc717760f85 Rob Herring 2024-01-22  64        compatible:
c21dc717760f85 Rob Herring 2024-01-22  65          enum:
c21dc717760f85 Rob Herring 2024-01-22  66              # Bulk storage for cache
c21dc717760f85 Rob Herring 2024-01-22  67            - arm,mpam-cache
c21dc717760f85 Rob Herring 2024-01-22  68              # Memory bandwidth
c21dc717760f85 Rob Herring 2024-01-22  69            - arm,mpam-memory
c21dc717760f85 Rob Herring 2024-01-22  70  
c21dc717760f85 Rob Herring 2024-01-22  71        reg:
c21dc717760f85 Rob Herring 2024-01-22  72          minimum: 0
c21dc717760f85 Rob Herring 2024-01-22  73          maximum: 0xf
c21dc717760f85 Rob Herring 2024-01-22  74  
c21dc717760f85 Rob Herring 2024-01-22  75        cpus:
c21dc717760f85 Rob Herring 2024-01-22 @76          $ref: '/schemas/types.yaml#/definitions/phandle-array'
c21dc717760f85 Rob Herring 2024-01-22  77          description:
c21dc717760f85 Rob Herring 2024-01-22  78            Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
c21dc717760f85 Rob Herring 2024-01-22  79            device's affinity is used.
c21dc717760f85 Rob Herring 2024-01-22  80  
c21dc717760f85 Rob Herring 2024-01-22  81        arm,mpam-device:
c21dc717760f85 Rob Herring 2024-01-22  82          $ref: '/schemas/types.yaml#/definitions/phandle'
c21dc717760f85 Rob Herring 2024-01-22  83          description:
c21dc717760f85 Rob Herring 2024-01-22  84            By default, the MPAM enabled device associated with a RIS is the MSC's
c21dc717760f85 Rob Herring 2024-01-22  85            parent node. It is possible for each RIS to be associated with different
c21dc717760f85 Rob Herring 2024-01-22  86            devices in which case 'arm,mpam-device' should be used.
c21dc717760f85 Rob Herring 2024-01-22  87  
c21dc717760f85 Rob Herring 2024-01-22  88      required:
c21dc717760f85 Rob Herring 2024-01-22  89        - compatible
c21dc717760f85 Rob Herring 2024-01-22  90        - reg
c21dc717760f85 Rob Herring 2024-01-22  91  
c21dc717760f85 Rob Herring 2024-01-22  92  required:
c21dc717760f85 Rob Herring 2024-01-22  93    - compatible
c21dc717760f85 Rob Herring 2024-01-22  94    - reg
c21dc717760f85 Rob Herring 2024-01-22  95  
c21dc717760f85 Rob Herring 2024-01-22  96  dependencies:
c21dc717760f85 Rob Herring 2024-01-22  97    interrupts: [ interrupt-names ]
c21dc717760f85 Rob Herring 2024-01-22  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
