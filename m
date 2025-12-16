Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0812AE84
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875500; cv=none; b=UkeYTRZ8pxcTbsYVIeiiW6x73a8z+bs06W3/aUcqF6WcimEYMVazbgY63Az+axZeWZZnnvM92Zu7oCkf5IoObWbKl1X0EpzhZmc7E/EQimLqVHqAHOVmiScceTitsfVnk8JeJbXPRNUdAs58Wf3OnRvPljpLCh+ae1LOH/GyX/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875500; c=relaxed/simple;
	bh=ca3ZhvxCSr9DnctEzVTOhZ5RetqS0Z/kSmxZFne7RJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajV+s6IfiF/uDButw8kj0SxLsHjD/8RBOx7TCe/1HuJ3BvDp3DxUJwmHtnCPV5FNjyu9EaHNfboLaY/yK6ZiFySWpaG5Wxm6+RytaYmT44JEGyX74RnK0BKBiiqXuKgkNo+7BvKYxMCDxakjPMTUAwa3FsQPWA7EqfZvOZhQaHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcfmlC/X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcfmlC/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765875496; x=1797411496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ca3ZhvxCSr9DnctEzVTOhZ5RetqS0Z/kSmxZFne7RJU=;
  b=UcfmlC/XlYerxO4ut5e+O2QKIzUXPsSYe2u1VO0MOUDI56P8qCADIj2n
   7lm+5CHtK31sllfkdH0OpG2O2P7e8hL69QzSqjAzB9535NuLjDLP6yy3E
   uA0jEVGEwrowqC1K0+Ad+DCcEYFXfbPVJ37XtCfVMBfY223NPfyzmDcKn
   EBGhp851U7kovr3x80x3bmCzZjrP2cjumW1oxt5d5JhzL6JQbWee4vCJp
   FhAFjpbdjdzDZ40HFvcHqcN1N/AsKomwijSKGx6SpwLjQMYNQv35sJ4VF
   TmB9wojs2SScR3CESZJ+oS4Hn8f/oHekXhbWK9iICtWTzFxdIh/x5F4dp
   w==;
X-CSE-ConnectionGUID: tWb6sBf+RMWeFx8n43hYyw==
X-CSE-MsgGUID: S2DC2WIrT0qR2Hwj1mlLTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67823790"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="67823790"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 00:58:16 -0800
X-CSE-ConnectionGUID: BIfKAf/LRxqpg38Hk2e6GA==
X-CSE-MsgGUID: LQ0cPN39SxekZnU8Ri3C8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="235373197"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2025 00:58:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVQsm-0000000033k-1TrI;
	Tue, 16 Dec 2025 08:58:12 +0000
Date: Tue, 16 Dec 2025 09:57:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Message-ID: <202512160928.X0lv4qKm-lkp@intel.com>
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
In-Reply-To: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
TO: James Calligeros <jcalligeros99@gmail.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/dt-bindings-hwmon-Add-Apple-System-Management-Controller-hwmon-schema/20251215-214101
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215-macsmc-subdevs-v6-1-0518cb5f28ae%40gmail.com
patch subject: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: microblaze-randconfig-2052-20251216 (https://download.01.org/0day-ci/archive/20251216/202512160928.X0lv4qKm-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160928.X0lv4qKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512160928.X0lv4qKm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml:73:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +73 Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml

3f4240e0d2de44 James Calligeros 2025-12-15   8  
3f4240e0d2de44 James Calligeros 2025-12-15   9  description:
3f4240e0d2de44 James Calligeros 2025-12-15  10    Apple's System Management Controller (SMC) exposes a vast array of
3f4240e0d2de44 James Calligeros 2025-12-15  11    hardware monitoring sensors, including temperature probes, current and
3f4240e0d2de44 James Calligeros 2025-12-15  12    voltage sense, power meters, and fan speeds. It also provides endpoints
3f4240e0d2de44 James Calligeros 2025-12-15  13    to manually control the speed of each fan individually. Each Apple
3f4240e0d2de44 James Calligeros 2025-12-15  14    Silicon device exposes a different set of endpoints via SMC keys. This
3f4240e0d2de44 James Calligeros 2025-12-15  15    is true even when two machines share an SoC. The CPU core temperature
3f4240e0d2de44 James Calligeros 2025-12-15  16    sensor keys on an M1 Mac mini are different to those on an M1 MacBook
3f4240e0d2de44 James Calligeros 2025-12-15  17    Pro, for example.
3f4240e0d2de44 James Calligeros 2025-12-15  18  
3f4240e0d2de44 James Calligeros 2025-12-15  19  maintainers:
3f4240e0d2de44 James Calligeros 2025-12-15  20    - James Calligeros <jcalligeros99@gmail.com>
3f4240e0d2de44 James Calligeros 2025-12-15  21  
3f4240e0d2de44 James Calligeros 2025-12-15  22  $defs:
3f4240e0d2de44 James Calligeros 2025-12-15  23    sensor:
3f4240e0d2de44 James Calligeros 2025-12-15  24      type: object
3f4240e0d2de44 James Calligeros 2025-12-15  25  
3f4240e0d2de44 James Calligeros 2025-12-15  26      properties:
3f4240e0d2de44 James Calligeros 2025-12-15  27        apple,key-id:
3f4240e0d2de44 James Calligeros 2025-12-15  28          $ref: /schemas/types.yaml#/definitions/string
3f4240e0d2de44 James Calligeros 2025-12-15  29          pattern: "^[A-Za-z0-9]{4}$"
3f4240e0d2de44 James Calligeros 2025-12-15  30          description: The SMC FourCC key of the desired sensor.
3f4240e0d2de44 James Calligeros 2025-12-15  31            Must match the node's suffix.
3f4240e0d2de44 James Calligeros 2025-12-15  32  
3f4240e0d2de44 James Calligeros 2025-12-15  33        label:
3f4240e0d2de44 James Calligeros 2025-12-15  34          description: Human-readable name for the sensor
3f4240e0d2de44 James Calligeros 2025-12-15  35  
3f4240e0d2de44 James Calligeros 2025-12-15  36      required:
3f4240e0d2de44 James Calligeros 2025-12-15  37        - apple,key-id
3f4240e0d2de44 James Calligeros 2025-12-15  38  
3f4240e0d2de44 James Calligeros 2025-12-15  39  properties:
3f4240e0d2de44 James Calligeros 2025-12-15  40    compatible:
3f4240e0d2de44 James Calligeros 2025-12-15  41      const: apple,smc-hwmon
3f4240e0d2de44 James Calligeros 2025-12-15  42  
3f4240e0d2de44 James Calligeros 2025-12-15  43  patternProperties:
3f4240e0d2de44 James Calligeros 2025-12-15  44    "^current-[A-Za-z0-9]{4}$":
3f4240e0d2de44 James Calligeros 2025-12-15  45      $ref: "#/$defs/sensor"
3f4240e0d2de44 James Calligeros 2025-12-15  46      unevaluatedProperties: false
3f4240e0d2de44 James Calligeros 2025-12-15  47  
3f4240e0d2de44 James Calligeros 2025-12-15  48    "^fan-[A-Za-z0-9]{4}$":
3f4240e0d2de44 James Calligeros 2025-12-15  49      $ref: "#/$defs/sensor"
3f4240e0d2de44 James Calligeros 2025-12-15  50      unevaluatedProperties: false
3f4240e0d2de44 James Calligeros 2025-12-15  51  
3f4240e0d2de44 James Calligeros 2025-12-15  52      properties:
3f4240e0d2de44 James Calligeros 2025-12-15  53        apple,fan-minimum:
3f4240e0d2de44 James Calligeros 2025-12-15  54          $ref: /schemas/types.yaml#/definitions/string
3f4240e0d2de44 James Calligeros 2025-12-15  55          pattern: "^[A-Za-z0-9]{4}$"
3f4240e0d2de44 James Calligeros 2025-12-15  56          description: SMC key containing the fan's minimum speed
3f4240e0d2de44 James Calligeros 2025-12-15  57  
3f4240e0d2de44 James Calligeros 2025-12-15  58        apple,fan-maximum:
3f4240e0d2de44 James Calligeros 2025-12-15  59          $ref: /schemas/types.yaml#/definitions/string
3f4240e0d2de44 James Calligeros 2025-12-15  60          pattern: "^[A-Za-z0-9]{4}$"
3f4240e0d2de44 James Calligeros 2025-12-15  61          description: SMC key containing the fan's maximum speed
3f4240e0d2de44 James Calligeros 2025-12-15  62  
3f4240e0d2de44 James Calligeros 2025-12-15  63        apple,fan-target:
3f4240e0d2de44 James Calligeros 2025-12-15  64          $ref: /schemas/types.yaml#/definitions/string
3f4240e0d2de44 James Calligeros 2025-12-15  65          pattern: "^[A-Za-z0-9]{4}$"
3f4240e0d2de44 James Calligeros 2025-12-15  66          description: Writeable endpoint for setting desired fan speed
3f4240e0d2de44 James Calligeros 2025-12-15  67  
3f4240e0d2de44 James Calligeros 2025-12-15  68        apple,fan-mode:
3f4240e0d2de44 James Calligeros 2025-12-15  69          $ref: /schemas/types.yaml#/definitions/string
3f4240e0d2de44 James Calligeros 2025-12-15  70          pattern: "^[A-Za-z0-9]{4}$"
3f4240e0d2de44 James Calligeros 2025-12-15  71          description: Writeable key to enable/disable manual fan control
3f4240e0d2de44 James Calligeros 2025-12-15  72  
3f4240e0d2de44 James Calligeros 2025-12-15 @73  
3f4240e0d2de44 James Calligeros 2025-12-15  74    "^power-[A-Za-z0-9]{4}$":
3f4240e0d2de44 James Calligeros 2025-12-15  75      $ref: "#/$defs/sensor"
3f4240e0d2de44 James Calligeros 2025-12-15  76      unevaluatedProperties: false
3f4240e0d2de44 James Calligeros 2025-12-15  77  
3f4240e0d2de44 James Calligeros 2025-12-15  78    "^temperature-[A-Za-z0-9]{4}$":
3f4240e0d2de44 James Calligeros 2025-12-15  79      $ref: "#/$defs/sensor"
3f4240e0d2de44 James Calligeros 2025-12-15  80      unevaluatedProperties: false
3f4240e0d2de44 James Calligeros 2025-12-15  81  
3f4240e0d2de44 James Calligeros 2025-12-15  82    "^voltage-[A-Za-z0-9]{4}$":
3f4240e0d2de44 James Calligeros 2025-12-15  83      $ref: "#/$defs/sensor"
3f4240e0d2de44 James Calligeros 2025-12-15  84      unevaluatedProperties: false
3f4240e0d2de44 James Calligeros 2025-12-15  85  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
