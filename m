Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A4645
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151513; cv=none; b=TNg4QdJey3DPiRpbdQTw7Omt0UpVNGWzl0gVmWXP+ooiHvDWDA9BmY9iwccDJ2hLMvbJpDflJFMu7mtZ1MDlSE3NuW8L6ZujKur1Kslk4cg9sSEq0TCiw/GM2xs0b4xwXhrTxAh4t6T2vGNTtj4DWU3UYErG8J0gN5Bme0JrJ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151513; c=relaxed/simple;
	bh=MnWdOj1m3/6nKS3fS5mQI/RICy8NODnTol2sK/STx14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpl6vcYf8B0MLDztjPO0adB4mxRA1B+F7+YKehmjc7lIlOhGKrhQNocjt3yF0UeNVc5p1ZmcoXukGyZKUDGRBy+Td4WUiuJUgYEhT7NS5UVaKjIuMOXwzen3zmNoQ7akSRhBo0sJj2vj9e+8jf4hUxuIHZpv8aCQ8oVHOcsbYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPtyk1Yt; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPtyk1Yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746151512; x=1777687512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MnWdOj1m3/6nKS3fS5mQI/RICy8NODnTol2sK/STx14=;
  b=QPtyk1Yt3JYgSDbRd51m8BWTf6wF8xtBPoabdggu5h4vFaKNsduEWfsB
   ySago2R0HAH/oz5Y2LXcj97jzuaM5ta3Sx0aH1Rypej6drx8SgMXGtzPY
   H2qbNyCgqk3dxAErXFJaAjsqOk8bU1fiJ6qou2xiYHKg3SEy5dP+isUxb
   GT9UtzPr4wSY3PEdf7zTf+wablP8eyoTtIE57zAjMk/RR2jgLsPhBeZM/
   XuvVbMtnL+UZQ0j1CWuFpNIeRNmqSCAypJFYCf/3xGuTanyV7bL8eauaE
   3+1x/ogSR64wPV/GtyPjZw33NFEmWjV3jlQSgdlBrKxquLaWKIVJH0rBe
   g==;
X-CSE-ConnectionGUID: xFAbPGIcTMGI7kOejqNyqw==
X-CSE-MsgGUID: XDG4YQ4uQqOw7G25SDqkFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47718409"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47718409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:05:09 -0700
X-CSE-ConnectionGUID: H4bgWg2VQNaELBAweyfUUg==
X-CSE-MsgGUID: q/9QGJvTSHCA/O3gE+rfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139676227"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 19:05:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAflx-0004Ux-1s;
	Fri, 02 May 2025 02:05:05 +0000
Date: Fri, 2 May 2025 10:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] LoongArch: dts: Add initial devicetree for CTCISZ
 Ninenine Pi
Message-ID: <202505020947.svS0pSiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250501044239.9404-6-ziyao@disroot.org>
References: <20250501044239.9404-6-ziyao@disroot.org>
TO: Yao Zi <ziyao@disroot.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: WANG Xuerui <kernel@xen0n.name>
TO: Yao Zi <ziyao@disroot.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Junhao Xie <bigfoot@classfun.cn>
TO: "Rafał Miłecki" <rafal@milecki.pl>
TO: Aradhya Bhatia <a-bhatia1@ti.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Binbin Zhou <zhoubinbin@loongson.cn>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: loongarch@lists.linux.dev
TO: Mingcong Bai <jeffbai@aosc.io>
TO: Kexy Biscuit <kexybiscuit@aosc.io>

Hi Yao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yao-Zi/dt-bindings-vendor-prefixes-Add-CTCISZ-Technology-Co-LTD/20250501-125036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250501044239.9404-6-ziyao%40disroot.org
patch subject: [PATCH 4/4] LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: loongarch-randconfig-052-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020947.svS0pSiR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020947.svS0pSiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505020947.svS0pSiR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0300.dtsi:54.6-196.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

vim +54 arch/loongarch/boot/dts/loongson-2k0300.dtsi

054616578cd3a3 Yao Zi 2025-05-01  10  
054616578cd3a3 Yao Zi 2025-05-01  11  / {
054616578cd3a3 Yao Zi 2025-05-01  12  	compatible = "loongson,ls2k0300";
054616578cd3a3 Yao Zi 2025-05-01  13  	#address-cells = <2>;
054616578cd3a3 Yao Zi 2025-05-01  14  	#size-cells = <2>;
054616578cd3a3 Yao Zi 2025-05-01  15  
054616578cd3a3 Yao Zi 2025-05-01  16  	aliases {
054616578cd3a3 Yao Zi 2025-05-01  17  		serial0 = &uart0;
054616578cd3a3 Yao Zi 2025-05-01  18  		serial1 = &uart1;
054616578cd3a3 Yao Zi 2025-05-01  19  		serial2 = &uart2;
054616578cd3a3 Yao Zi 2025-05-01  20  		serial3 = &uart3;
054616578cd3a3 Yao Zi 2025-05-01  21  		serial4 = &uart4;
054616578cd3a3 Yao Zi 2025-05-01  22  		serial5 = &uart5;
054616578cd3a3 Yao Zi 2025-05-01  23  		serial6 = &uart6;
054616578cd3a3 Yao Zi 2025-05-01  24  		serial7 = &uart7;
054616578cd3a3 Yao Zi 2025-05-01  25  		serial8 = &uart8;
054616578cd3a3 Yao Zi 2025-05-01  26  		serial9 = &uart9;
054616578cd3a3 Yao Zi 2025-05-01  27  	};
054616578cd3a3 Yao Zi 2025-05-01  28  
054616578cd3a3 Yao Zi 2025-05-01  29  	cpus {
054616578cd3a3 Yao Zi 2025-05-01  30  		#address-cells = <1>;
054616578cd3a3 Yao Zi 2025-05-01  31  		#size-cells = <0>;
054616578cd3a3 Yao Zi 2025-05-01  32  
054616578cd3a3 Yao Zi 2025-05-01  33  		cpu0: cpu@0 {
054616578cd3a3 Yao Zi 2025-05-01  34  			compatible = "loongson,la264";
054616578cd3a3 Yao Zi 2025-05-01  35  			reg = <0>;
054616578cd3a3 Yao Zi 2025-05-01  36  			device_type = "cpu";
054616578cd3a3 Yao Zi 2025-05-01  37  			clocks = <&cpu_clk>;
054616578cd3a3 Yao Zi 2025-05-01  38  		};
054616578cd3a3 Yao Zi 2025-05-01  39  
054616578cd3a3 Yao Zi 2025-05-01  40  	};
054616578cd3a3 Yao Zi 2025-05-01  41  
054616578cd3a3 Yao Zi 2025-05-01  42  	cpuintc: interrupt-controller {
054616578cd3a3 Yao Zi 2025-05-01  43  		compatible = "loongson,cpu-interrupt-controller";
054616578cd3a3 Yao Zi 2025-05-01  44  		interrupt-controller;
054616578cd3a3 Yao Zi 2025-05-01  45  		#interrupt-cells = <1>;
054616578cd3a3 Yao Zi 2025-05-01  46  	};
054616578cd3a3 Yao Zi 2025-05-01  47  
054616578cd3a3 Yao Zi 2025-05-01  48  	cpu_clk: clock-1000m {
054616578cd3a3 Yao Zi 2025-05-01  49  		compatible = "fixed-clock";
054616578cd3a3 Yao Zi 2025-05-01  50  		clock-frequency = <1000000000>;
054616578cd3a3 Yao Zi 2025-05-01  51  		#clock-cells = <0>;
054616578cd3a3 Yao Zi 2025-05-01  52  	};
054616578cd3a3 Yao Zi 2025-05-01  53  
054616578cd3a3 Yao Zi 2025-05-01 @54  	soc {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
