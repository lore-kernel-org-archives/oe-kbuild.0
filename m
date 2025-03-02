Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF69AD39
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740911064; cv=none; b=AxWi2A44QwHP+rm4qpI6kB8vGmn6NmOf86pZt5u10NJRtAGLclZYQC9FSjw/0R9FV7gIdtbR+HLD6gB1N/5WJVdfGvQR8b5eem1T3KPJ4fpY81QfJidrzoXWw4Kz1yqdLMZJvgfk+F4KHUd/rvm9wlIRQjr04XIw/V+y9bC3cF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740911064; c=relaxed/simple;
	bh=p09SDOio3Ax+GZbikfdqvHxXZbMBhhh4FZ6ngt6DS1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iQLyOtb9bHbmOBx32T44RxDkJiKYz5YieIAtJ8wqdj/PNKZ5gycrMdBFXtLOz7HplkDdCd36NGGFnOs6MK57PNmNRGbzsnCRSwF+NB155DAyrjgk7qvaeBSjjyGn+0nnyUDl4+H8DrUYJmSPoxFfBztLFjbLt7SO/sU5PND8wY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBQWorkW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBQWorkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740911063; x=1772447063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p09SDOio3Ax+GZbikfdqvHxXZbMBhhh4FZ6ngt6DS1Q=;
  b=kBQWorkWo2Q9b4YEoX3HZCCyPM42hv5NqKVF1fTjP6wxGDxm9FpY2gw7
   KO3IrJ9JJCWOo5Q/BBQ7o3EiPtiXAHMqXriVdW9rszzA9YN5nyFw3q+t0
   3ScgF+IEyPHDy5wBaN2RCDHGzLHuEP/+xfpEG5DQihXqfkZl5crsqi8eg
   MM8dMe4UTRUXywnxuXtnRia5Qe4K+07muIuvw/gewLhztN0JDnAhvzy3i
   0i8pHB/8bXzi9M9oYUec1/GkDdDC0ENg8niJEAqNejb8HAAEv7hGY60Wd
   3kmpZKn3ygA/arMyeqfDe80zTMSCBG6mVG+HxBvR8XD4TNQrEn16lYUrO
   Q==;
X-CSE-ConnectionGUID: 3xvV8PpoS2ye2RKVbs++0Q==
X-CSE-MsgGUID: y/O4BdtZQI+6ud+IB81k2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="40969105"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="40969105"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 02:24:22 -0800
X-CSE-ConnectionGUID: Fs9Erzq3QDGeXGDAjCHkVw==
X-CSE-MsgGUID: k2b2wgysTqiXnw04RdmvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="118236437"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Mar 2025 02:24:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1togUd-000HFW-04;
	Sun, 02 Mar 2025 10:24:19 +0000
Date: Sun, 2 Mar 2025 18:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <202503021828.owwMm5aB-lkp@intel.com>
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
In-Reply-To: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-3-thierry.bultel.yh@bp.renesas.com>
TO: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
TO: thierry.bultel@linatsea.fr
CC: linux-renesas-soc@vger.kernel.org
CC: geert@linux-m68k.org
CC: paul.barker.ct@bp.renesas.com
CC: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus geert-renesas-devel/next linus/master v6.14-rc4 next-20250227]
[cannot apply to geert-renesas-drivers/renesas-clk]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Bultel/dt-bindings-clock-Add-cpg-for-the-Renesas-RZ-T2H-SoC/20250226-221033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250226130935.3029927-3-thierry.bultel.yh%40bp.renesas.com
patch subject: [PATCH v3 02/13] dt-bindings: clock: Add cpg for the Renesas RZ/T2H SoC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250227 (https://download.01.org/0day-ci/archive/20250302/202503021828.owwMm5aB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021828.owwMm5aB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021828.owwMm5aB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dtb: ethernet-phy@1: compatible: ['ethernet-phy-id001c.c816', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
>> arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dtb: clock-controller@fcfe0010: reg: [[4244504592, 1109]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7743-iwg20d-q7.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7743-iwg20d-q7-dbcm-ca.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7744-iwg20d-q7.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7744-iwg20d-q7-dbcm-ca.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
   arch/arm/boot/dts/renesas/r8a7790-lager.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7790-stout.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7790-stout.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
--
>> arch/arm/boot/dts/renesas/r8a7791-porter.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7791-porter.dtb: pmic@5a: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
--
   arch/arm/boot/dts/renesas/r8a7792.dtsi:87.12-92.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/renesas/r8a7792-blanche.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7792-blanche.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
--
   arch/arm/boot/dts/renesas/r8a7792.dtsi:87.12-92.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/renesas/r8a7792-wheat.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7793-gose.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
   arch/arm/boot/dts/renesas/r8a7793-gose.dtb: composite-in@20: ports:port@3:endpoint: Unevaluated properties are not allowed ('bus-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/media/i2c/adv7180.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7794-alt.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7794-alt.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#
--
>> arch/arm/boot/dts/renesas/r8a7794-silk.dtb: clock-controller@e6150000: reg: [[0, 3860135936, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/renesas,cpg-mssr.yaml#
   arch/arm/boot/dts/renesas/r8a7794-silk.dtb: pmic@58: 'interrupts' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
