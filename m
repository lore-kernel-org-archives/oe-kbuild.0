Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99A1878
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Oct 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729255481; cv=none; b=hYo3kQ1ooVJWrtwJCzn/HOcab2DeNKMLKkwZBJZIuVsn64SQq+gabGVEIg8vn8H8kUblD/CNFOikHmsYLf2bTDLGke0/kEAEkCWEhIbevPVAxB9J+Xjhcn+0WKIuo7008vePxryojLtk1yegRJhO/Skcegpxjm4ohkLpYhvAUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729255481; c=relaxed/simple;
	bh=SsfxSA2fMPQxjjkU/2+B9TsCl+MTLkfUgbnk/6adawk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCprLubaWZbHp4YUh+q8YupjGdV0fbKX8eEtvFC791UOi9iFfN6/645+7TwAhTmrHHyNjnC+a8+IAFd1GHc2/qGYkd2B51/E56KyM5JJRxZTngZxyB/zykPP3spINZqSHxjKG04yc0UNOUXaJrMlaoNLngAGijpWovK8jElcG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXrb5AwQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXrb5AwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729255479; x=1760791479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsfxSA2fMPQxjjkU/2+B9TsCl+MTLkfUgbnk/6adawk=;
  b=XXrb5AwQvcGH+YVuMUoXhxoEC3GASY1H4XfXwGk6ptNzPpwUSDz9C6Sa
   aGePJZjoBoagsX6Ie1dr9SLwRFJs+MDlEf1C+PNRJkyhCmahssXOn+1bp
   X+/W91sYuwd6+fAbanl/6xUX4ecY78MwZF0Vhks48PRl3R8edWT8qsexu
   U+2lK/iLwhJ6UpPmXfuSfyj8JADqOTPyFlrb1ZZK/UuQGJlFXi0ayUEub
   8ZkllB1ZCAQOqHv4ClKS8NMPXQxzylFRCIg11qC1n4ulc3NhuMDNvO9XM
   HPoQU9iXPd1zzZfq5S5dx54kMemXVkKZ7GQwjzyftVl+oXeo9llkzpdK3
   g==;
X-CSE-ConnectionGUID: dMHjGWe9TSmAJzYRExqoOg==
X-CSE-MsgGUID: tuGkJv+ZTAKdLtY4t1mppA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28890994"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28890994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 05:44:39 -0700
X-CSE-ConnectionGUID: Mf5YPxKwTWiSMow/fOSy4g==
X-CSE-MsgGUID: wdJV/mxbRl+FGu778pO4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="116317259"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Oct 2024 05:44:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1mLK-000NpR-38;
	Fri, 18 Oct 2024 12:44:34 +0000
Date: Fri, 18 Oct 2024 20:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: Add LicheeRV Nano board
 device tree
Message-ID: <202410182010.LZIoQ3lV-lkp@intel.com>
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
In-Reply-To: <20241010-sg2002-v5-2-a0f2e582b932@bootlin.com>
References: <20241010-sg2002-v5-2-a0f2e582b932@bootlin.com>
TO: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bonnefille/riscv-dts-sophgo-Add-initial-SG2002-SoC-device-tree/20241010-231159
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241010-sg2002-v5-2-a0f2e582b932%40bootlin.com
patch subject: [PATCH v5 2/2] riscv: dts: sophgo: Add LicheeRV Nano board device tree
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20241018/202410182010.LZIoQ3lV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410182010.LZIoQ3lV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410182010.LZIoQ3lV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/sg2002.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: simple-bus unit address format error, expected "3001000"

vim +/3001000 +19 arch/riscv/boot/dts/sophgo/sg2002.dtsi

e481b838575b45 Thomas Bonnefille 2024-10-10   9  
e481b838575b45 Thomas Bonnefille 2024-10-10  10  / {
e481b838575b45 Thomas Bonnefille 2024-10-10  11  	compatible = "sophgo,sg2002";
e481b838575b45 Thomas Bonnefille 2024-10-10  12  
e481b838575b45 Thomas Bonnefille 2024-10-10  13  	memory@80000000 {
e481b838575b45 Thomas Bonnefille 2024-10-10  14  		device_type = "memory";
e481b838575b45 Thomas Bonnefille 2024-10-10  15  		reg = <0x80000000 0x10000000>;
e481b838575b45 Thomas Bonnefille 2024-10-10  16  	};
e481b838575b45 Thomas Bonnefille 2024-10-10  17  
e481b838575b45 Thomas Bonnefille 2024-10-10  18  	soc {
e481b838575b45 Thomas Bonnefille 2024-10-10 @19  		pinctrl: pinctrl@3008000 {
e481b838575b45 Thomas Bonnefille 2024-10-10  20  			compatible = "sophgo,sg2002-pinctrl";
e481b838575b45 Thomas Bonnefille 2024-10-10  21  			reg = <0x03001000 0x1000>,
e481b838575b45 Thomas Bonnefille 2024-10-10  22  			      <0x05027000 0x1000>;
e481b838575b45 Thomas Bonnefille 2024-10-10  23  			reg-names = "sys", "rtc";
e481b838575b45 Thomas Bonnefille 2024-10-10  24  		};
e481b838575b45 Thomas Bonnefille 2024-10-10  25  	};
e481b838575b45 Thomas Bonnefille 2024-10-10  26  };
e481b838575b45 Thomas Bonnefille 2024-10-10  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
