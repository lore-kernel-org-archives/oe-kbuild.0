Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD182145B25
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978419; cv=none; b=E2s6JaLlkbEIRPm0f1XC2rz2C58w3HbAnpQlsyxRXmfxvGxziZzfObNtXRCrRBg6xZJdWQyo73ex6eLhffQW4/JC3BLtlLFWtFedjn1mQLSZy8VLHXTolUd0Y2NRk3ZAD5/UaccHqwN4oBrw+/4vGC+iAI3ngLxOruwiut2AUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978419; c=relaxed/simple;
	bh=UT87JK3KbFJ+XDRD8QhhSjQ+WHKLlOhEedEkDVnbjgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgsGQL6A7Y5bGvKEo53AtLbdfNEWjJ+gKYXqwZROcTV9yDFcJ2Kq6CTXbFCP+znw5owJJDNpasM1X25xxPdVLBR9HnImLvgJHSAIR4I3Znsp49lywaysJd9p8OkjyqmCzn4BSoR6BC+rMrNSttX1WFP9sgjXLhzpm+AoqrRlZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpuGOL1M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpuGOL1M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742978418; x=1774514418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UT87JK3KbFJ+XDRD8QhhSjQ+WHKLlOhEedEkDVnbjgg=;
  b=FpuGOL1Mq4JmcOpKl1BN1CgP4fMyzLFZzss2/WLO74sN1jkDqr3eorq6
   aYti9gHJcwszjWU+ZvsbAsQYr3waA3bOv0ktWPbPrH4QSUbz3dV5hqxrq
   lQJwnDZTmY3P7j0qrarPO/NbEDNTOudYr6a/OWkoda267hVMqD+wiFvnA
   sZODDnGapo6sSIFuxfBf3uCJN4TYREjWJr1KNbZVYDeQdKz32VfbE5PjI
   J6mvev5hT2vAQiURySImsQfauhOD0nGHA5YmfLfifFaQMAhF4oJhHZUmJ
   0rFITr5QlSSkzAg8cSrFZ82u2rA2xU2wvLs2W00tJ9iWk1UGCUTYb/5lM
   g==;
X-CSE-ConnectionGUID: HXcB51vnT9yHsuKv+fGnYw==
X-CSE-MsgGUID: qqrmHULDRBqhN2mUiP03YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48129521"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="48129521"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 01:40:17 -0700
X-CSE-ConnectionGUID: 0WPc77jlTiqAr6/q2oEEcg==
X-CSE-MsgGUID: ttcZfhyNQEK05l/5XCRnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="124483141"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2025 01:40:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txMJ0-0005b1-2U;
	Wed, 26 Mar 2025 08:40:11 +0000
Date: Wed, 26 Mar 2025 16:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202503261610.i7nZRUav-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
TO: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>

Hi Xianwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 23a708916ec7ab21c8c81d61bdb7cb933f6867d5]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/arm64-dts-amlogic-a4-add-pinctrl-node/20250326-131834
base:   23a708916ec7ab21c8c81d61bdb7cb933f6867d5
patch link:    https://lore.kernel.org/r/20250326-pinctrl-node-a4-v1-1-8c30639480f6%40amlogic.com
patch subject: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-001-20250326 (https://download.01.org/0day-ci/archive/20250326/202503261610.i7nZRUav-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261610.i7nZRUav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503261610.i7nZRUav-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts:8:
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:8:10: fatal error: 'dt-bindings/pinctrl/amlogic,pinctrl.h' file not found
       8 | #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts:8:
   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:8:10: fatal error: 'dt-bindings/pinctrl/amlogic,pinctrl.h' file not found
       8 | #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

vim +8 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

04c73f8d458050 Xianwei Zhao 2025-03-26  @8  #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
6ef63301fa3708 Xianwei Zhao 2024-04-01   9  / {
6ef63301fa3708 Xianwei Zhao 2024-04-01  10  	cpus {
6ef63301fa3708 Xianwei Zhao 2024-04-01  11  		#address-cells = <2>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  12  		#size-cells = <0>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  13  
6ef63301fa3708 Xianwei Zhao 2024-04-01  14  		cpu0: cpu@0 {
6ef63301fa3708 Xianwei Zhao 2024-04-01  15  			device_type = "cpu";
6ef63301fa3708 Xianwei Zhao 2024-04-01  16  			compatible = "arm,cortex-a53";
6ef63301fa3708 Xianwei Zhao 2024-04-01  17  			reg = <0x0 0x0>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  18  			enable-method = "psci";
6ef63301fa3708 Xianwei Zhao 2024-04-01  19  		};
6ef63301fa3708 Xianwei Zhao 2024-04-01  20  
6ef63301fa3708 Xianwei Zhao 2024-04-01  21  		cpu1: cpu@1 {
6ef63301fa3708 Xianwei Zhao 2024-04-01  22  			device_type = "cpu";
6ef63301fa3708 Xianwei Zhao 2024-04-01  23  			compatible = "arm,cortex-a53";
6ef63301fa3708 Xianwei Zhao 2024-04-01  24  			reg = <0x0 0x1>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  25  			enable-method = "psci";
6ef63301fa3708 Xianwei Zhao 2024-04-01  26  		};
6ef63301fa3708 Xianwei Zhao 2024-04-01  27  
6ef63301fa3708 Xianwei Zhao 2024-04-01  28  		cpu2: cpu@2 {
6ef63301fa3708 Xianwei Zhao 2024-04-01  29  			device_type = "cpu";
6ef63301fa3708 Xianwei Zhao 2024-04-01  30  			compatible = "arm,cortex-a53";
6ef63301fa3708 Xianwei Zhao 2024-04-01  31  			reg = <0x0 0x2>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  32  			enable-method = "psci";
6ef63301fa3708 Xianwei Zhao 2024-04-01  33  		};
6ef63301fa3708 Xianwei Zhao 2024-04-01  34  
6ef63301fa3708 Xianwei Zhao 2024-04-01  35  		cpu3: cpu@3 {
6ef63301fa3708 Xianwei Zhao 2024-04-01  36  			device_type = "cpu";
6ef63301fa3708 Xianwei Zhao 2024-04-01  37  			compatible = "arm,cortex-a53";
6ef63301fa3708 Xianwei Zhao 2024-04-01  38  			reg = <0x0 0x3>;
6ef63301fa3708 Xianwei Zhao 2024-04-01  39  			enable-method = "psci";
6ef63301fa3708 Xianwei Zhao 2024-04-01  40  		};
6ef63301fa3708 Xianwei Zhao 2024-04-01  41  	};
c830ead0d16131 Xianwei Zhao 2024-05-29  42  
c830ead0d16131 Xianwei Zhao 2024-05-29  43  	sm: secure-monitor {
c830ead0d16131 Xianwei Zhao 2024-05-29  44  		compatible = "amlogic,meson-gxbb-sm";
c830ead0d16131 Xianwei Zhao 2024-05-29  45  
c830ead0d16131 Xianwei Zhao 2024-05-29  46  		pwrc: power-controller {
c830ead0d16131 Xianwei Zhao 2024-05-29  47  			compatible = "amlogic,a4-pwrc";
c830ead0d16131 Xianwei Zhao 2024-05-29  48  			#power-domain-cells = <1>;
c830ead0d16131 Xianwei Zhao 2024-05-29  49  		};
c830ead0d16131 Xianwei Zhao 2024-05-29  50  	};
6ef63301fa3708 Xianwei Zhao 2024-04-01  51  };
66eae21a0c1405 Xianwei Zhao 2025-03-11  52  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
