Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73428134CB
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745141131; cv=none; b=CNbBjyZrfNm4JaKu8uZMAL4CzSodzzRzLT6YjCaEFCkvP/qVNaSQsvMuQxce0sTIy7a9ETrDIpebUR+YDnvPFuaJXtlv5ebxhZUIuFnihW77WZu5imhnY3ku17GXgXPURSAXUS2X3UKsDZ6JGKZXbEewlGi4lor9mhnCitKjrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745141131; c=relaxed/simple;
	bh=rX/neTRW5PojvoVm4mctlD6W2YfDchwfH7tJBY8pl1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZtiLoLwM6jOgmDHE6/kHAM/W9G9iQ8vlcseRKIq2aAzH8udVP2tjh6ZxZkEKgweVKstSSOaUoZngd4MfHNDUe2HDK+PrKHwTMWqvxar+M77GnK7SEhTfo8K/noLf1LFgMQ1o61CophU4Dpe+W29xqcsz/kxdj3ct5PLSNttgJQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qw3ed9MF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qw3ed9MF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745141128; x=1776677128;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rX/neTRW5PojvoVm4mctlD6W2YfDchwfH7tJBY8pl1Y=;
  b=Qw3ed9MFPZtcQXte4x56DYvNzJ6dkPeRndVdwC7bYJwc7JxkRMRMwhOX
   KPs427aN08GU1t+wO6AZbsvuI5OD2yLli7+8aXmbHfkUcKlZeUaZZ+sSC
   dA3eQ82erkVPFE2BHylFi9s+Ejo89Rr12HCYCLCQ/sMm57FtIFtNN4+q/
   TCx62Dlj7mQViTrw8WDQme4G1AWrrJZLnYfJyUwiG6Jd8Bx3ZnfH8xHo1
   b+tkGdLcQ1HsPSsGohMbCARV55zHpEWEPWtvkM7EH2VvA/nIXKrCsv0P8
   rIw1NZvbypa5P/SASuT9iQlQMyyfZt3t1J/NnCrFL1N0sbVGu8xJflJfC
   Q==;
X-CSE-ConnectionGUID: LPYuD38KR3SW2a/w7hMdxg==
X-CSE-MsgGUID: Qs4t2ySXTxaiAWSdZslLpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50533369"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50533369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 02:25:28 -0700
X-CSE-ConnectionGUID: xCj94Kn/QoOUt5xplU77yw==
X-CSE-MsgGUID: dv7sJ/DPQoSQi6nScYOc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136289173"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2025 02:25:26 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6QvU-0004Yr-1c;
	Sun, 20 Apr 2025 09:25:24 +0000
Date: Sun, 20 Apr 2025 17:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
Message-ID: <202504201716.TJnYjIsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250418-watchdog-v1-2-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-2-987ff2046272@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-512x-Rename-wdt-node-to-watchdog/20250419-033055
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250418-watchdog-v1-2-987ff2046272%40posteo.net
patch subject: [PATCH 2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-052-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201716.TJnYjIsU-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201716.TJnYjIsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504201716.TJnYjIsU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/asp834x-redboot.dts:40.9-43.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/asp834x-redboot.dts:59.13-64.5: Warning (simple_bus_reg): /localbus@ff005000/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /: failed to match any schema with compatible: ['analogue-and-micro,asp8347e']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: / (analogue-and-micro,asp8347e): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: localbus@ff005000 (fsl,mpc8347e-localbus): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /localbus@ff005000: failed to match any schema with compatible: ['fsl,mpc8347e-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /localbus@ff005000: failed to match any schema with compatible: ['fsl,mpc8347e-localbus', 'fsl,pq2pro-localbus', 'simple-bus']
>> arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: i2c@3100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/mpc8313erdb.dtb: localbus@e0005000 (fsl,mpc8313-elbc): nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8313-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8313-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8313-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8313-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: soc8313@e0000000 (simple-bus): ptp_clock@24E00: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: soc8313@e0000000 (simple-bus): $nodename:0: 'soc8313@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: sleep-nexus (simple-bus): $nodename:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: localbus@e0005000 (fsl,mpc8315-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8315-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8315-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: immr@e0000000 (fsl,mpc8315-immr): $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000: failed to match any schema with compatible: ['fsl,mpc8315-immr', 'simple-bus']
>> arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: usb@23000 (fsl-usb2-dr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
--
   arch/powerpc/boot/dts/mpc832x_rdb.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc832x_rdb.dts:174.22-195.6: Warning (unit_address_vs_reg): /soc8323@e0000000/par_io@1400/ucc_pin@2: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc832x_rdb.dts:196.22-215.6: Warning (unit_address_vs_reg): /soc8323@e0000000/par_io@1400/ucc_pin@3: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /: failed to match any schema with compatible: ['MPC8323ERDB', 'MPC832xRDB', 'MPC83xxRDB']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: / (MPC8323ERDB): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: soc8323@e0000000 (simple-bus): $nodename:0: 'soc8323@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8323-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8323-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
--
   arch/powerpc/boot/dts/mpc8349emitx.dts:412.12-419.5: Warning (simple_bus_reg): /localbus@e0005000/pata@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /: failed to match any schema with compatible: ['MPC8349EMITX', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /: failed to match any schema with compatible: ['MPC8349EMITX', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /: failed to match any schema with compatible: ['MPC8349EMITX', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: / (MPC8349EMITX): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: soc8349@e0000000 (simple-bus): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: soc8349@e0000000 (simple-bus): $nodename:0: 'soc8349@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: at24@50 (st,24c256): $nodename:0: 'at24@50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: at24@50 (st,24c256): Unevaluated properties are not allowed ('$nodename' was unexpected)
--
   arch/powerpc/boot/dts/mpc8349emitxgp.dts:40.9-43.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /: failed to match any schema with compatible: ['MPC8349EMITXGP', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /: failed to match any schema with compatible: ['MPC8349EMITXGP', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /: failed to match any schema with compatible: ['MPC8349EMITXGP', 'MPC834xMITX', 'MPC83xxMITX']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: / (MPC8349EMITXGP): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: soc8349@e0000000 (simple-bus): $nodename:0: 'soc8349@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: i2c@3100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/mpc836x_rdk.dts:407.11-417.5: Warning (simple_bus_reg): /localbus@e0005000/upm@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/mpc836x_rdk.dts:419.15-432.5: Warning (simple_bus_reg): /localbus@e0005000/display@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /: failed to match any schema with compatible: ['fsl,mpc8360rdk']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: / (fsl,mpc8360rdk): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: / (fsl,mpc8360rdk): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000: failed to match any schema with compatible: ['fsl,mpc8360-immr', 'fsl,immr', 'fsl,soc', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000: failed to match any schema with compatible: ['fsl,mpc8360-immr', 'fsl,immr', 'fsl,soc', 'simple-bus']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000: failed to match any schema with compatible: ['fsl,mpc8360-immr', 'fsl,immr', 'fsl,soc', 'simple-bus']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8360-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/power@b00: failed to match any schema with compatible: ['fsl,mpc8360-pmc', 'fsl,mpc8349-pmc']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: i2c@3000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: i2c@3100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: localbus@e0005000 (fsl,mpc8377-elbc): nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: localbus@e0005000 (fsl,mpc8377-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8377-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8377-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: immr@e0000000 (simple-bus): $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@c00 (fsl,mpc8377-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: gpio-controller@d00 (fsl,mpc8377-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
--
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: / (fsl,mpc8377wlan): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: / (fsl,mpc8377wlan): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: localbus@e0005000 (fsl,mpc8377-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: immr@e0000000 (simple-bus): $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00 (fsl,mpc8377-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8377-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00 (fsl,mpc8377-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8377-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8377-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
--
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: localbus@e0005000 (fsl,mpc8378-elbc): nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: localbus@e0005000 (fsl,mpc8378-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8378-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8378-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8378-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8378-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: immr@e0000000 (simple-bus): $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@c00 (fsl,mpc8378-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8378-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8378-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: gpio-controller@d00 (fsl,mpc8378-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8378-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8378-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
--
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: localbus@e0005000 (fsl,mpc8379-elbc): nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: localbus@e0005000 (fsl,mpc8379-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8379-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000: failed to match any schema with compatible: ['fsl,mpc8379-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8379-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /localbus@e0005000/nand@1,0: failed to match any schema with compatible: ['fsl,mpc8379-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: immr@e0000000 (simple-bus): $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/watchdog@200: failed to match any schema with compatible: ['mpc83xx_wdt']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@c00 (fsl,mpc8379-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8379-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']
   	'fsl,mpc8379-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio', 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-gpio']
   	'fsl,qoriq-gpio' was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/gpio-controller@c00: failed to match any schema with compatible: ['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: gpio-controller@d00 (fsl,mpc8379-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8379-gpio', 'fsl,mpc8349-gpio'] is too long
   	'fsl,mpc8379-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio', 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-gpio', 'fsl,pq3-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
