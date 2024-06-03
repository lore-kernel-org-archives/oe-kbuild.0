Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37512D205
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717429713; cv=none; b=GjnmjWWIdCTCm7csIgp+r6XHYhGkU2lBH6Fi8yU8yNYeIwdK+Ot10DvRKmpULg7s3zLlQCCtgbqLZsQKzLUVgS5rZQErGEFLUK14JM1xGYSuLllRwmXfNJ9aHD4TSmucmf+M24o88DIc9/P4BNLkTFWJvxUJpu7EcbFrm+2YvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717429713; c=relaxed/simple;
	bh=4EORV5jUXG+b0mStgG/92e5YyUjDVTN8pPgX/CGVBNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgpUne4GblHIyGE+HSRHaIuryIHokCxh/C/dpb4gzmHHYJ7K4vhTT0R97BO0ANgXV6snnwgJL3bbN+cOcHc/qoMRAQWjE0Ywsh1wydntJT2gppR9LZ1cy44AjLvGx5ZYMUy5cVInIacVc+38XIcNnm7gYa+ZpjwnGRs49r5Q7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOnG9LBy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOnG9LBy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717429712; x=1748965712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4EORV5jUXG+b0mStgG/92e5YyUjDVTN8pPgX/CGVBNA=;
  b=jOnG9LBylEDyhWusEdNOw9zvkmlRq3MNvzoYLeYWe1gcOC/+p0VbmXpN
   a2b8vKI44NgVVojG00ok2sEZwTqzscnYpESu7kqEUJGwzOUrdiO4z2YuF
   akE8Q8llV0HubMt3bRFQ4BxC6aLn2/RJslIg0srnQiImtBYS578p+lgmt
   6WP/5+N7kINzUVf1Py3pKZTrfMyYhBflmIpc2PBCXNNVY+ITbt7lFZ8wC
   yra194YaZGlH9JdlNOI1fZaY3SHbaoE5IBujdjq074NV+NW+9q5wuoYAU
   LLydEIQfjbuOWEmOzDEE1pIkcOI2++zvq+9Xe1vUoY4Vx6Yo9sxBPb/1H
   g==;
X-CSE-ConnectionGUID: whvUfVprRxqUxWDuBgutUw==
X-CSE-MsgGUID: 19Nn7/0LQwW7QDZhVfNUUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31458801"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="31458801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 08:48:30 -0700
X-CSE-ConnectionGUID: c+zOlFrqRTSBw7hO8ZlJmw==
X-CSE-MsgGUID: MyObqFEjQWyDyjS9JnjvHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="41831432"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2024 08:48:28 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE9ux-000LqF-11;
	Mon, 03 Jun 2024 15:48:21 +0000
Date: Mon, 3 Jun 2024 23:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 68/68] dtbs_check:
 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml:54:1: but
 found another document
Message-ID: <202406032338.bHUEI7Vw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml:54:1: but found another document"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2268a7004f002732576535c32b514ad4933e3d13
commit: 2268a7004f002732576535c32b514ad4933e3d13 [68/68] FROMLIST: dt-bindings: mailbox: Add mediatek,gce-props.yaml
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.5.dev4+ga5bbb3e
reproduce: (https://download.01.org/0day-ci/archive/20240603/202406032338.bHUEI7Vw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406032338.bHUEI7Vw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/wireless/microchip,wilc1000.yaml: title: 'Microchip WILC wireless devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/trivial-devices.yaml: title: 'Trivial I2C and SPI devices that have simple device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/display/bridge/ps8640.yaml: title: 'MIPI DSI to eDP Video Format Converter Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml:54:1: but found another document
   Documentation/devicetree/bindings/leds/leds-lp50xx.yaml: ^led@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
>> Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/sdhci-am654.yaml: sdhci-caps-mask: missing type definition
   Documentation/devicetree/bindings/mtd/ingenic,nand.yaml: ecc-engine: missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-active-high: missing type definition
   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml: linux-keycodes: missing type definition
   Documentation/devicetree/bindings/media/renesas,vin.yaml: field-active-even: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml: mediatek,default-timing-adjust: missing type definition

vim +54 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml

2268a7004f0027 Jason-jh Lin 2024-05-27   8  
2268a7004f0027 Jason-jh Lin 2024-05-27   9  maintainers:
2268a7004f0027 Jason-jh Lin 2024-05-27  10    - Houlong Wei <houlong.wei@mediatek.com>
2268a7004f0027 Jason-jh Lin 2024-05-27  11  
2268a7004f0027 Jason-jh Lin 2024-05-27  12  description:
2268a7004f0027 Jason-jh Lin 2024-05-27  13    The Global Command Engine (GCE) is an instruction based, multi-threaded,
2268a7004f0027 Jason-jh Lin 2024-05-27  14    single-core command dispatcher for MediaTek hardware. The Command Queue
2268a7004f0027 Jason-jh Lin 2024-05-27  15    (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
2268a7004f0027 Jason-jh Lin 2024-05-27  16    mailbox framework. It is used to receive messages from mailbox consumers
2268a7004f0027 Jason-jh Lin 2024-05-27  17    and configure GCE to execute the specified instruction set in the message.
2268a7004f0027 Jason-jh Lin 2024-05-27  18    We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  19    driver. A device driver that uses the CMDQ driver to configure its hardware
2268a7004f0027 Jason-jh Lin 2024-05-27  20    registers is a mailbox consumer. The mailbox consumer can request a mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  21    channel corresponding to a GCE hardware thread to send a message, specifying
2268a7004f0027 Jason-jh Lin 2024-05-27  22    that the GCE thread to configure its hardware. The mailbox provider can also
2268a7004f0027 Jason-jh Lin 2024-05-27  23    reserve a mailbox channel to configure GCE hardware register by the specific
2268a7004f0027 Jason-jh Lin 2024-05-27  24    GCE thread. This binding defines the common GCE properties for both mailbox
2268a7004f0027 Jason-jh Lin 2024-05-27  25    provider and consumers.
2268a7004f0027 Jason-jh Lin 2024-05-27  26  
2268a7004f0027 Jason-jh Lin 2024-05-27  27  properties:
2268a7004f0027 Jason-jh Lin 2024-05-27  28    mediatek,gce-events:
2268a7004f0027 Jason-jh Lin 2024-05-27  29      description:
2268a7004f0027 Jason-jh Lin 2024-05-27  30        GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
2268a7004f0027 Jason-jh Lin 2024-05-27  31        Each event ID has a boolean event value with the default value 0.
2268a7004f0027 Jason-jh Lin 2024-05-27  32        The property mediatek,gce-events is used to obtain the event IDs.
2268a7004f0027 Jason-jh Lin 2024-05-27  33        Some gce-events are hardware-bound and cannot be changed by software.
2268a7004f0027 Jason-jh Lin 2024-05-27  34        For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
2268a7004f0027 Jason-jh Lin 2024-05-27  35        send an event signal to GCE, setting the value of event ID 597 to 1.
2268a7004f0027 Jason-jh Lin 2024-05-27  36        Similarly, in MT8188, the value of event ID 574 will be set to 1 when
2268a7004f0027 Jason-jh Lin 2024-05-27  37        VOD0_MUTEX is stream done.
2268a7004f0027 Jason-jh Lin 2024-05-27  38        On the other hand, some gce-events are not hardware-bound and can be
2268a7004f0027 Jason-jh Lin 2024-05-27  39        changed by software. For example, in MT8188, we can set the value of
2268a7004f0027 Jason-jh Lin 2024-05-27  40        event ID 855, which is not bound to any hardware, to 1 when the driver
2268a7004f0027 Jason-jh Lin 2024-05-27  41        in the secure world completes a task. However, in MT8195, event ID 855
2268a7004f0027 Jason-jh Lin 2024-05-27  42        is already bound to VDEC_LAT1, so we need to select another event ID to
2268a7004f0027 Jason-jh Lin 2024-05-27  43        achieve the same purpose. This event ID can be any ID that is not bound
2268a7004f0027 Jason-jh Lin 2024-05-27  44        to any hardware and is not yet used in any software driver.
2268a7004f0027 Jason-jh Lin 2024-05-27  45        To determine if the event ID is bound to the hardware or used by a
2268a7004f0027 Jason-jh Lin 2024-05-27  46        software driver, refer to the GCE header
2268a7004f0027 Jason-jh Lin 2024-05-27  47        include/dt-bindings/gce/<chip>-gce.h of each chip.
2268a7004f0027 Jason-jh Lin 2024-05-27  48      $ref: /schemas/types.yaml#/definitions/uint32-array
2268a7004f0027 Jason-jh Lin 2024-05-27  49      minItems: 1
2268a7004f0027 Jason-jh Lin 2024-05-27  50      maxItems: 32
2268a7004f0027 Jason-jh Lin 2024-05-27  51  
2268a7004f0027 Jason-jh Lin 2024-05-27  52  additionalProperties: true
2268a7004f0027 Jason-jh Lin 2024-05-27  53  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
2268a7004f0027 Jason-jh Lin 2024-05-27 @54  %YAML 1.2
2268a7004f0027 Jason-jh Lin 2024-05-27  55  ---
2268a7004f0027 Jason-jh Lin 2024-05-27  56  $id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
2268a7004f0027 Jason-jh Lin 2024-05-27  57  $schema: http://devicetree.org/meta-schemas/core.yaml#
2268a7004f0027 Jason-jh Lin 2024-05-27  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
