Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651CD1F9A95
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735913420; cv=none; b=ChmTJdE+w5/GL0Y0G+GjpDhu8ucdVPEPhikuWn3KHnTiw6rnSUt5CDx2kccTft6Q/xzU5cy/GApcNntugMkk4McPKp3i+B5GLpE4twuva7yz9QOABhCerOm+n1bwiZv9vDxoXNXidXZLZUIdU1j6UcVwuec5MVhfUoBzDC8oUbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735913420; c=relaxed/simple;
	bh=vY62/OZeAMYZP5k6nh5J9IcRCZcUq8YaRbtM3S/CQJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6FLGeHGLhilM9teFDNRvJIkvkGZPh6REiPQsMWVzDDVZn1HmCiV95cPdzhCMs9gQ0r2h+ZSTZbdOJa7qbtLXMp283wCaMygHuDeWK2mE0oewpxQB9No28WjjccytNSVSougg7HjC13TwtWKLyYD3oB9rzKEysb8SWpH/WVHixM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bmmyQyFW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bmmyQyFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735913419; x=1767449419;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vY62/OZeAMYZP5k6nh5J9IcRCZcUq8YaRbtM3S/CQJc=;
  b=bmmyQyFWfBt9Ep4XnsnIt21FX6mrij4x3qameIzJipvMR5OUjE2axVUH
   x7NVWmYZKPt280KGPfHXjKy5vDWVVDSo7xZLYp5M7RAddEXnN/2EqPl2g
   JspBRWe7PwpHnshvrEMWT1YUUFiiu62qS5s5O7Qf5lUtqFoLsT/miaj+B
   cqCpQZupLSb25ITTwMMHNWJCwQyGoIKb6QCDZNwAWGdeXIppF2YTvdS9A
   Uoxz1GUX1p2wPxd22ttXabTQIJGfQz2OA97tJCiSeY4iP6C18J9qVZTxT
   GbIUDlHt+72T9vaODS/7K6H0vpbUg540jIgLP2lOFIESMOzSZKTZ87E/3
   w==;
X-CSE-ConnectionGUID: Y9uF05XlS3aQR2mgNvX6zA==
X-CSE-MsgGUID: Tojr4lCqSImJQog/mTc+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36180066"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36180066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:10:15 -0800
X-CSE-ConnectionGUID: 4EllgIrhT+qndgWXA4IbOg==
X-CSE-MsgGUID: wOhrau+9SL+nuWFjgwA2Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101664575"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jan 2025 06:10:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTiNP-0009oB-2H;
	Fri, 03 Jan 2025 14:10:11 +0000
Date: Fri, 3 Jan 2025 22:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 02/19] powerpc: dts: Extract mpc8315e.dtsi from
 mpc8315erdb.dts
Message-ID: <202501032132.t3R37vmZ-lkp@intel.com>
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
In-Reply-To: <20250102-mpc83xx-v1-2-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-2-86f78ba2a7af@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Frank Li <Frank.Li@nxp.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc033cf25e612e840e545f8d5ad2edd6ba613ed5]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-Generalize-MPC831x-platform-support/20250103-023455
base:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
patch link:    https://lore.kernel.org/r/20250102-mpc83xx-v1-2-86f78ba2a7af%40posteo.net
patch subject: [PATCH 02/19] powerpc: dts: Extract mpc8315e.dtsi from mpc8315erdb.dts
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: powerpc-randconfig-052-20250103 (https://download.01.org/0day-ci/archive/20250103/202501032132.t3R37vmZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032132.t3R37vmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501032132.t3R37vmZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/powerpc/boot/dts/mpc8315e.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc8315erdb.dts:36.13-43.5: Warning (simple_bus_reg): /localbus@e0005000/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc8315erdb.dts:45.12-63.5: Warning (simple_bus_reg): /localbus@e0005000/nand@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /: failed to match any schema with compatible: ['fsl,mpc8315erdb']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: localbus@e0005000: nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

vim +41 arch/powerpc/boot/dts/mpc8315e.dtsi

b3479ebf4de8b2 J. Neuschäfer 2025-01-02  15  
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  16  / {
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  17  	compatible = "fsl,mpc8315e";
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  18  	#address-cells = <1>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  19  	#size-cells = <1>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  20  
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  21  	aliases {
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  22  	};
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  23  
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  24  	cpus {
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  25  		#address-cells = <1>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  26  		#size-cells = <0>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  27  
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  28  		PowerPC,8315@0 {
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  29  			device_type = "cpu";
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  30  			reg = <0x0>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  31  			d-cache-line-size = <32>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  32  			i-cache-line-size = <32>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  33  			d-cache-size = <16384>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  34  			i-cache-size = <16384>;
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  35  			timebase-frequency = <0>;	// from bootloader
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  36  			bus-frequency = <0>;		// from bootloader
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  37  			clock-frequency = <0>;		// from bootloader
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  38  		};
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  39  	};
b3479ebf4de8b2 J. Neuschäfer 2025-01-02  40  
b3479ebf4de8b2 J. Neuschäfer 2025-01-02 @41  	memory {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
