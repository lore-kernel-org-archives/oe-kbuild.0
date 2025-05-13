Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39561E8324
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116621; cv=none; b=LwuvoKYWwHLlZp5017qMHtMXn/pr8m2bXiBLLzsqQCmaFeG00gOygKiSAwNF52C5lfPAHrHtffUeZmBHRyqIxsPDZjHYpsyGEsHPtIPcyLR568kTbWQP2gOnAe17K28VkdlrpfusrvSD8L/trr3pifWDuS6WSJTSnM686dLUoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116621; c=relaxed/simple;
	bh=tva5sxYRiZefO3aOc5JmY2g3Lywvl03KFE1dJv/3oWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCJIYWYHVzSuCKDfrOvFLZZEilfwZ+JFoVkfgK+6QlKEw7MnIT4FHviJq30/L7pkCa4mwW8M71/o7x05xSEAp53sv6vyixCB/9tJPtG6eu9E5sf8uN7BviWazWRZUvHcIrn0Q0cP67eQSLKwZhVcIwy/d5rJlQ/jlrfa6jKRXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iSTCWDx0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iSTCWDx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747116619; x=1778652619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tva5sxYRiZefO3aOc5JmY2g3Lywvl03KFE1dJv/3oWs=;
  b=iSTCWDx03hpzyZdTLYTKIYcm7cDAw4WqIgnxwosVUMCsdYCPNOFNL6JK
   h4nqsQHkTgs8VvlHAzaKw+ttdIi7yKatQRgsg00OZUQtK7B335tHnlMHC
   puiTzcPragfA4nxLP9xSFYpyyoT7KhVc8lvsZ2J958/DOmu8s/mkyhCGG
   kmuyRYJMLqaO+pgVSvpvrG8Rr3PoRSMtMCaMUJCnWlRo+yvBuhH1cNOwQ
   WAKSVKfQ2KExnEwOwXKe+blGrsbPsQpCIkVpfAwbgDyImHD8zNDpARyyP
   vkQa/cfxrrL+V9P1en4lRhARF5uwJRn2IFR+ph55+rYp2vC9DG6Jz8Pvc
   Q==;
X-CSE-ConnectionGUID: F27ynQ9HT3aYl/gB1B7/vw==
X-CSE-MsgGUID: zfBL7QvdS3e8a7923EywMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74342397"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="74342397"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:10:16 -0700
X-CSE-ConnectionGUID: QTt/4hkSRJa8NDK2kson2Q==
X-CSE-MsgGUID: BMB6VPrHQZCPyAqgFbIlMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137461595"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 May 2025 23:10:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiqC-000FlP-1a;
	Tue, 13 May 2025 06:10:12 +0000
Date: Tue, 13 May 2025 14:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] WIP: arm64: dts: mt8189: Add mt8189 dts evaluation
 board and Mafefile
Message-ID: <202505131410.57t7Q8aR-lkp@intel.com>
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
In-Reply-To: <20250505121627.3944728-3-sirius.wang@mediatek.com>
References: <20250505121627.3944728-3-sirius.wang@mediatek.com>
TO: Sirius Wang <sirius.wang@mediatek.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Sean Wang <sean.wang@mediatek.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: wenst@chromium.org
CC: Sirius Wang <sirius.wang@mediatek.com>

Hi Sirius,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc6 next-20250512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sirius-Wang/WIP-dt-bindings-arm-Add-compatible-for-MediaTek-MT8189/20250505-201837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250505121627.3944728-3-sirius.wang%40mediatek.com
patch subject: [PATCH 2/2] WIP: arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250513/202505131410.57t7Q8aR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131410.57t7Q8aR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131410.57t7Q8aR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8189.dtsi:391.17-394.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +391 arch/arm64/boot/dts/mediatek/mt8189.dtsi

aeefc838ee5e5a Sirius Wang 2025-05-05   10  
aeefc838ee5e5a Sirius Wang 2025-05-05   11  / {
aeefc838ee5e5a Sirius Wang 2025-05-05   12  	compatible = "mediatek,mt8189";
aeefc838ee5e5a Sirius Wang 2025-05-05   13  	interrupt-parent = <&gic>;
aeefc838ee5e5a Sirius Wang 2025-05-05   14  	#address-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   15  	#size-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   16  
aeefc838ee5e5a Sirius Wang 2025-05-05   17  	aliases {
aeefc838ee5e5a Sirius Wang 2025-05-05   18  		serial0 = &uart0;
aeefc838ee5e5a Sirius Wang 2025-05-05   19  	};
aeefc838ee5e5a Sirius Wang 2025-05-05   20  
aeefc838ee5e5a Sirius Wang 2025-05-05   21  	cpus {
aeefc838ee5e5a Sirius Wang 2025-05-05   22  		#address-cells = <1>;
aeefc838ee5e5a Sirius Wang 2025-05-05   23  		#size-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   24  
aeefc838ee5e5a Sirius Wang 2025-05-05   25  		cpu0: cpu@0 {
aeefc838ee5e5a Sirius Wang 2025-05-05   26  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05   27  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05   28  			reg = <0x000>;
aeefc838ee5e5a Sirius Wang 2025-05-05   29  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05   30  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05   31  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05   32  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05   33  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   34  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   35  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   36  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   37  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   38  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   39  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   40  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   41  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   42  		};
aeefc838ee5e5a Sirius Wang 2025-05-05   43  
aeefc838ee5e5a Sirius Wang 2025-05-05   44  		cpu1: cpu@100 {
aeefc838ee5e5a Sirius Wang 2025-05-05   45  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05   46  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05   47  			reg = <0x100>;
aeefc838ee5e5a Sirius Wang 2025-05-05   48  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05   49  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05   50  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05   51  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05   52  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   53  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   54  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   55  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   56  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   57  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   58  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   59  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   60  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   61  		};
aeefc838ee5e5a Sirius Wang 2025-05-05   62  
aeefc838ee5e5a Sirius Wang 2025-05-05   63  		cpu2: cpu@200 {
aeefc838ee5e5a Sirius Wang 2025-05-05   64  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05   65  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05   66  			reg = <0x200>;
aeefc838ee5e5a Sirius Wang 2025-05-05   67  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05   68  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05   69  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05   70  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05   71  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   72  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   73  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   74  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   75  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   76  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   77  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   78  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   79  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   80  		};
aeefc838ee5e5a Sirius Wang 2025-05-05   81  
aeefc838ee5e5a Sirius Wang 2025-05-05   82  		cpu3: cpu@300 {
aeefc838ee5e5a Sirius Wang 2025-05-05   83  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05   84  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05   85  			reg = <0x300>;
aeefc838ee5e5a Sirius Wang 2025-05-05   86  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05   87  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05   88  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05   89  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05   90  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   91  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   92  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   93  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05   94  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05   95  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05   96  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   97  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05   98  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05   99  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  100  
aeefc838ee5e5a Sirius Wang 2025-05-05  101  		cpu4: cpu@400 {
aeefc838ee5e5a Sirius Wang 2025-05-05  102  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05  103  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05  104  			reg = <0x400>;
aeefc838ee5e5a Sirius Wang 2025-05-05  105  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05  106  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  107  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05  108  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05  109  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05  110  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  111  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05  112  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05  113  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  114  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05  115  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  116  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  117  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  118  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  119  
aeefc838ee5e5a Sirius Wang 2025-05-05  120  		cpu5: cpu@500 {
aeefc838ee5e5a Sirius Wang 2025-05-05  121  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05  122  			compatible = "arm,cortex-a55";
aeefc838ee5e5a Sirius Wang 2025-05-05  123  			reg = <0x500>;
aeefc838ee5e5a Sirius Wang 2025-05-05  124  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05  125  			clock-frequency = <2000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  126  			capacity-dmips-mhz = <742>;
aeefc838ee5e5a Sirius Wang 2025-05-05  127  			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff_l &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05  128  			i-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05  129  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  130  			i-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05  131  			d-cache-size = <32768>;
aeefc838ee5e5a Sirius Wang 2025-05-05  132  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  133  			d-cache-sets = <128>;
aeefc838ee5e5a Sirius Wang 2025-05-05  134  			next-level-cache = <&l2_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  135  			performance-domains = <&performance 0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  136  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  137  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  138  
aeefc838ee5e5a Sirius Wang 2025-05-05  139  		cpu6: cpu@600 {
aeefc838ee5e5a Sirius Wang 2025-05-05  140  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05  141  			compatible = "arm,cortex-a78";
aeefc838ee5e5a Sirius Wang 2025-05-05  142  			reg = <0x600>;
aeefc838ee5e5a Sirius Wang 2025-05-05  143  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05  144  			clock-frequency = <3000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  145  			capacity-dmips-mhz = <958>;
aeefc838ee5e5a Sirius Wang 2025-05-05  146  			cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05  147  			i-cache-size = <65536>;
aeefc838ee5e5a Sirius Wang 2025-05-05  148  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  149  			i-cache-sets = <256>;
aeefc838ee5e5a Sirius Wang 2025-05-05  150  			d-cache-size = <65536>;
aeefc838ee5e5a Sirius Wang 2025-05-05  151  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  152  			d-cache-sets = <256>;
aeefc838ee5e5a Sirius Wang 2025-05-05  153  			next-level-cache = <&l2_1>;
aeefc838ee5e5a Sirius Wang 2025-05-05  154  			performance-domains = <&performance 1>;
aeefc838ee5e5a Sirius Wang 2025-05-05  155  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  156  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  157  
aeefc838ee5e5a Sirius Wang 2025-05-05  158  		cpu7: cpu@700 {
aeefc838ee5e5a Sirius Wang 2025-05-05  159  			device_type = "cpu";
aeefc838ee5e5a Sirius Wang 2025-05-05  160  			compatible = "arm,cortex-a78";
aeefc838ee5e5a Sirius Wang 2025-05-05  161  			reg = <0x700>;
aeefc838ee5e5a Sirius Wang 2025-05-05  162  			enable-method = "psci";
aeefc838ee5e5a Sirius Wang 2025-05-05  163  			clock-frequency = <3000000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  164  			capacity-dmips-mhz = <958>;
aeefc838ee5e5a Sirius Wang 2025-05-05  165  			cpu-idle-states = <&cpuoff_m &clusteroff_m &mcusysoff_m &system_vcore &s2idle>;
aeefc838ee5e5a Sirius Wang 2025-05-05  166  			i-cache-size = <65536>;
aeefc838ee5e5a Sirius Wang 2025-05-05  167  			i-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  168  			i-cache-sets = <256>;
aeefc838ee5e5a Sirius Wang 2025-05-05  169  			d-cache-size = <65536>;
aeefc838ee5e5a Sirius Wang 2025-05-05  170  			d-cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  171  			d-cache-sets = <256>;
aeefc838ee5e5a Sirius Wang 2025-05-05  172  			next-level-cache = <&l2_1>;
aeefc838ee5e5a Sirius Wang 2025-05-05  173  			performance-domains = <&performance 1>;
aeefc838ee5e5a Sirius Wang 2025-05-05  174  			#cooling-cells = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  175  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  176  
aeefc838ee5e5a Sirius Wang 2025-05-05  177  		cpu-map {
aeefc838ee5e5a Sirius Wang 2025-05-05  178  			cluster0 {
aeefc838ee5e5a Sirius Wang 2025-05-05  179  				core0 {
aeefc838ee5e5a Sirius Wang 2025-05-05  180  					cpu = <&cpu0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  181  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  182  				core1 {
aeefc838ee5e5a Sirius Wang 2025-05-05  183  					cpu = <&cpu1>;
aeefc838ee5e5a Sirius Wang 2025-05-05  184  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  185  				core2 {
aeefc838ee5e5a Sirius Wang 2025-05-05  186  					cpu = <&cpu2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  187  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  188  				core3 {
aeefc838ee5e5a Sirius Wang 2025-05-05  189  					cpu = <&cpu3>;
aeefc838ee5e5a Sirius Wang 2025-05-05  190  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  191  				core4 {
aeefc838ee5e5a Sirius Wang 2025-05-05  192  					cpu = <&cpu4>;
aeefc838ee5e5a Sirius Wang 2025-05-05  193  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  194  				core5 {
aeefc838ee5e5a Sirius Wang 2025-05-05  195  					cpu = <&cpu5>;
aeefc838ee5e5a Sirius Wang 2025-05-05  196  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  197  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  198  
aeefc838ee5e5a Sirius Wang 2025-05-05  199  			cluster1 {
aeefc838ee5e5a Sirius Wang 2025-05-05  200  				core0 {
aeefc838ee5e5a Sirius Wang 2025-05-05  201  					cpu = <&cpu6>;
aeefc838ee5e5a Sirius Wang 2025-05-05  202  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  203  				core1 {
aeefc838ee5e5a Sirius Wang 2025-05-05  204  					cpu = <&cpu7>;
aeefc838ee5e5a Sirius Wang 2025-05-05  205  				};
aeefc838ee5e5a Sirius Wang 2025-05-05  206  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  207  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  208  
aeefc838ee5e5a Sirius Wang 2025-05-05  209  		idle-states {
aeefc838ee5e5a Sirius Wang 2025-05-05  210  			entry-method = "arm,psci";
aeefc838ee5e5a Sirius Wang 2025-05-05  211  
aeefc838ee5e5a Sirius Wang 2025-05-05  212  			cpuoff_l: cpuoff-l {
aeefc838ee5e5a Sirius Wang 2025-05-05  213  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  214  				arm,psci-suspend-param = <0x00010000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  215  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  216  				entry-latency-us = <97>;
aeefc838ee5e5a Sirius Wang 2025-05-05  217  				exit-latency-us = <252>;
aeefc838ee5e5a Sirius Wang 2025-05-05  218  				min-residency-us = <6710>;
aeefc838ee5e5a Sirius Wang 2025-05-05  219  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  220  
aeefc838ee5e5a Sirius Wang 2025-05-05  221  			cpuoff_m: cpuoff-m {
aeefc838ee5e5a Sirius Wang 2025-05-05  222  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  223  				arm,psci-suspend-param = <0x00010000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  224  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  225  				entry-latency-us = <53>;
aeefc838ee5e5a Sirius Wang 2025-05-05  226  				exit-latency-us = <143>;
aeefc838ee5e5a Sirius Wang 2025-05-05  227  				min-residency-us = <2120>;
aeefc838ee5e5a Sirius Wang 2025-05-05  228  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  229  
aeefc838ee5e5a Sirius Wang 2025-05-05  230  			cpuoff_b: cpuoff-b {
aeefc838ee5e5a Sirius Wang 2025-05-05  231  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  232  				arm,psci-suspend-param = <0x00010000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  233  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  234  				entry-latency-us = <40>;
aeefc838ee5e5a Sirius Wang 2025-05-05  235  				exit-latency-us = <107>;
aeefc838ee5e5a Sirius Wang 2025-05-05  236  				min-residency-us = <2580>;
aeefc838ee5e5a Sirius Wang 2025-05-05  237  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  238  
aeefc838ee5e5a Sirius Wang 2025-05-05  239  			clusteroff_l: clusteroff-l {
aeefc838ee5e5a Sirius Wang 2025-05-05  240  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  241  				arm,psci-suspend-param = <0x01010001>;
aeefc838ee5e5a Sirius Wang 2025-05-05  242  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  243  				entry-latency-us = <109>;
aeefc838ee5e5a Sirius Wang 2025-05-05  244  				exit-latency-us = <325>;
aeefc838ee5e5a Sirius Wang 2025-05-05  245  				min-residency-us = <6710>;
aeefc838ee5e5a Sirius Wang 2025-05-05  246  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  247  
aeefc838ee5e5a Sirius Wang 2025-05-05  248  			clusteroff_m: clusteroff-m {
aeefc838ee5e5a Sirius Wang 2025-05-05  249  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  250  				arm,psci-suspend-param = <0x01010001>;
aeefc838ee5e5a Sirius Wang 2025-05-05  251  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  252  				entry-latency-us = <59>;
aeefc838ee5e5a Sirius Wang 2025-05-05  253  				exit-latency-us = <188>;
aeefc838ee5e5a Sirius Wang 2025-05-05  254  				min-residency-us = <2120>;
aeefc838ee5e5a Sirius Wang 2025-05-05  255  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  256  
aeefc838ee5e5a Sirius Wang 2025-05-05  257  			clusteroff_b: clusteroff-b {
aeefc838ee5e5a Sirius Wang 2025-05-05  258  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  259  				arm,psci-suspend-param = <0x01010001>;
aeefc838ee5e5a Sirius Wang 2025-05-05  260  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  261  				entry-latency-us = <43>;
aeefc838ee5e5a Sirius Wang 2025-05-05  262  				exit-latency-us = <138>;
aeefc838ee5e5a Sirius Wang 2025-05-05  263  				min-residency-us = <2580>;
aeefc838ee5e5a Sirius Wang 2025-05-05  264  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  265  
aeefc838ee5e5a Sirius Wang 2025-05-05  266  			mcusysoff_l: mcusysoff-l {
aeefc838ee5e5a Sirius Wang 2025-05-05  267  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  268  				arm,psci-suspend-param = <0x02010007>;
aeefc838ee5e5a Sirius Wang 2025-05-05  269  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  270  				entry-latency-us = <1357>;
aeefc838ee5e5a Sirius Wang 2025-05-05  271  				exit-latency-us = <835>;
aeefc838ee5e5a Sirius Wang 2025-05-05  272  				min-residency-us = <6710>;
aeefc838ee5e5a Sirius Wang 2025-05-05  273  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  274  
aeefc838ee5e5a Sirius Wang 2025-05-05  275  			mcusysoff_m: mcusysoff-m {
aeefc838ee5e5a Sirius Wang 2025-05-05  276  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  277  				arm,psci-suspend-param = <0x02010007>;
aeefc838ee5e5a Sirius Wang 2025-05-05  278  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  279  				entry-latency-us = <1202>;
aeefc838ee5e5a Sirius Wang 2025-05-05  280  				exit-latency-us = <679>;
aeefc838ee5e5a Sirius Wang 2025-05-05  281  				min-residency-us = <2120>;
aeefc838ee5e5a Sirius Wang 2025-05-05  282  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  283  
aeefc838ee5e5a Sirius Wang 2025-05-05  284  			mcusysoff_b: mcusysoff-b {
aeefc838ee5e5a Sirius Wang 2025-05-05  285  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  286  				arm,psci-suspend-param = <0x02010007>;
aeefc838ee5e5a Sirius Wang 2025-05-05  287  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  288  				entry-latency-us = <1143>;
aeefc838ee5e5a Sirius Wang 2025-05-05  289  				exit-latency-us = <611>;
aeefc838ee5e5a Sirius Wang 2025-05-05  290  				min-residency-us = <2580>;
aeefc838ee5e5a Sirius Wang 2025-05-05  291  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  292  
aeefc838ee5e5a Sirius Wang 2025-05-05  293  			system_vcore: system-vcore {
aeefc838ee5e5a Sirius Wang 2025-05-05  294  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  295  				arm,psci-suspend-param = <0x020100ff>;
aeefc838ee5e5a Sirius Wang 2025-05-05  296  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  297  				entry-latency-us = <940>;
aeefc838ee5e5a Sirius Wang 2025-05-05  298  				exit-latency-us = <3500>;
aeefc838ee5e5a Sirius Wang 2025-05-05  299  				min-residency-us = <35200>;
aeefc838ee5e5a Sirius Wang 2025-05-05  300  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  301  
aeefc838ee5e5a Sirius Wang 2025-05-05  302  			s2idle: s2idle {
aeefc838ee5e5a Sirius Wang 2025-05-05  303  				compatible = "arm,idle-state";
aeefc838ee5e5a Sirius Wang 2025-05-05  304  				arm,psci-suspend-param = <0x020180ff>;
aeefc838ee5e5a Sirius Wang 2025-05-05  305  				local-timer-stop;
aeefc838ee5e5a Sirius Wang 2025-05-05  306  				entry-latency-us = <10000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  307  				exit-latency-us = <10000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  308  				min-residency-us = <4294967295>;
aeefc838ee5e5a Sirius Wang 2025-05-05  309  			};
aeefc838ee5e5a Sirius Wang 2025-05-05  310  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  311  
aeefc838ee5e5a Sirius Wang 2025-05-05  312  		l2_0: l2-cache0 {
aeefc838ee5e5a Sirius Wang 2025-05-05  313  			compatible = "cache";
aeefc838ee5e5a Sirius Wang 2025-05-05  314  			cache-level = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  315  			cache-size = <131072>;
aeefc838ee5e5a Sirius Wang 2025-05-05  316  			cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  317  			cache-sets = <512>;
aeefc838ee5e5a Sirius Wang 2025-05-05  318  			next-level-cache = <&l3_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  319  			cache-unified;
aeefc838ee5e5a Sirius Wang 2025-05-05  320  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  321  
aeefc838ee5e5a Sirius Wang 2025-05-05  322  		l2_1: l2-cache1 {
aeefc838ee5e5a Sirius Wang 2025-05-05  323  			compatible = "cache";
aeefc838ee5e5a Sirius Wang 2025-05-05  324  			cache-level = <2>;
aeefc838ee5e5a Sirius Wang 2025-05-05  325  			cache-size = <262144>;
aeefc838ee5e5a Sirius Wang 2025-05-05  326  			cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  327  			cache-sets = <512>;
aeefc838ee5e5a Sirius Wang 2025-05-05  328  			next-level-cache = <&l3_0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  329  			cache-unified;
aeefc838ee5e5a Sirius Wang 2025-05-05  330  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  331  
aeefc838ee5e5a Sirius Wang 2025-05-05  332  		l3_0: l3-cache {
aeefc838ee5e5a Sirius Wang 2025-05-05  333  			compatible = "cache";
aeefc838ee5e5a Sirius Wang 2025-05-05  334  			cache-level = <3>;
aeefc838ee5e5a Sirius Wang 2025-05-05  335  			cache-size = <1048576>;
aeefc838ee5e5a Sirius Wang 2025-05-05  336  			cache-line-size = <64>;
aeefc838ee5e5a Sirius Wang 2025-05-05  337  			cache-sets = <2048>;
aeefc838ee5e5a Sirius Wang 2025-05-05  338  			cache-unified;
aeefc838ee5e5a Sirius Wang 2025-05-05  339  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  340  	};
aeefc838ee5e5a Sirius Wang 2025-05-05  341  
aeefc838ee5e5a Sirius Wang 2025-05-05  342  	psci {
aeefc838ee5e5a Sirius Wang 2025-05-05  343  		compatible = "arm,psci-1.0";
aeefc838ee5e5a Sirius Wang 2025-05-05  344  		method = "smc";
aeefc838ee5e5a Sirius Wang 2025-05-05  345  	};
aeefc838ee5e5a Sirius Wang 2025-05-05  346  
aeefc838ee5e5a Sirius Wang 2025-05-05  347  	clocks {
aeefc838ee5e5a Sirius Wang 2025-05-05  348  		clk_null: clk-null {
aeefc838ee5e5a Sirius Wang 2025-05-05  349  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  350  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  351  			clock-frequency = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  352  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  353  
aeefc838ee5e5a Sirius Wang 2025-05-05  354  		clk32k: clk32k {
aeefc838ee5e5a Sirius Wang 2025-05-05  355  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  356  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  357  			clock-frequency = <32000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  358  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  359  
aeefc838ee5e5a Sirius Wang 2025-05-05  360  		clk26m: clk26m {
aeefc838ee5e5a Sirius Wang 2025-05-05  361  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  362  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  363  			clock-frequency = <26000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  364  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  365  
aeefc838ee5e5a Sirius Wang 2025-05-05  366  		clk13m: clk13m {
aeefc838ee5e5a Sirius Wang 2025-05-05  367  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  368  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  369  			clock-frequency = <13000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  370  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  371  
aeefc838ee5e5a Sirius Wang 2025-05-05  372  		ulposc: ulposc {
aeefc838ee5e5a Sirius Wang 2025-05-05  373  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  374  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  375  			clock-frequency = <520000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  376  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  377  
aeefc838ee5e5a Sirius Wang 2025-05-05  378  		ulposc3: ulposc3 {
aeefc838ee5e5a Sirius Wang 2025-05-05  379  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  380  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  381  			clock-frequency = <26000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  382  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  383  
aeefc838ee5e5a Sirius Wang 2025-05-05  384  		clk104m: clk104m {
aeefc838ee5e5a Sirius Wang 2025-05-05  385  			compatible = "fixed-clock";
aeefc838ee5e5a Sirius Wang 2025-05-05  386  			#clock-cells = <0>;
aeefc838ee5e5a Sirius Wang 2025-05-05  387  			clock-frequency = <104000000>;
aeefc838ee5e5a Sirius Wang 2025-05-05  388  		};
aeefc838ee5e5a Sirius Wang 2025-05-05  389  	};
aeefc838ee5e5a Sirius Wang 2025-05-05  390  
aeefc838ee5e5a Sirius Wang 2025-05-05 @391  	memory: memory {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
