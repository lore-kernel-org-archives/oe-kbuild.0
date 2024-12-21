Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDE91CF8B
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734824404; cv=none; b=E+rFUCvY4tBgpeakFVs6X5TWwI0pO94zurmSyt1CYyQcSXOVw96B0R6CBFsc1EMJJ/rghB3GCneXhmvW+1aphVLqIKwXvBkB+HOsB/1+vL9oQL6TqLtFK4mA7VIcZbOCE8Wrp3po534zyePxqa44HyaKjYrFcZmOYmFylG5yv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734824404; c=relaxed/simple;
	bh=mQ/12qDFnxRrbrgtw6JUd2MQyZMZVvzXiMe90+LL/IE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZdTnziXKApbBZMVB9clAqyrKoR5qPA53DMy8PU6qmv28spl7TixZiDSNkMg/dS1Hv1mLfSrqTxJsg1GG1/qpDRuniq3r4WmH4Y3rd6zByAtlRGjS/4YbTTHzUw+9mOHmk59hF/YQRadet4VA0TvVVPl1o7DBXlZlVtAxqzl+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foXd5yri; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foXd5yri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734824401; x=1766360401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQ/12qDFnxRrbrgtw6JUd2MQyZMZVvzXiMe90+LL/IE=;
  b=foXd5yri/eyPWG+XhFjYSnQdeuy0jk83lMVBwwTBCiKwOJSwfH6tDkZi
   pQww/2uTNQXBefd1rg0XGF0yYn2t8VgZymUq4bGJqhzn+/8K5Ua/ryLUb
   qeTZPGswLxIO2QHpUu+4p2j3GIxzvrGr8g+EH+tBUwTiGlM5w0IpBaDms
   3zEsFSBRvcXI9Ax6n97skKNuBOyABuMuzI+QNuvkwZcMUXw3qgUQZrbU+
   QGdYzKUacEAjqbxsowCZq+jS+z5tSxFt7MWOBw+bIMFHE0WeJ93q7Qzkw
   FlgxRzJPwhAng3lRqyPeuhBH9FGdcRAklJbG0uLv479fR5skANTB9yz0I
   A==;
X-CSE-ConnectionGUID: TJBGiIxxT32lkbLVB+FEnQ==
X-CSE-MsgGUID: /QK6+VCjQYqr595NKxU/Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35227785"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35227785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 15:39:58 -0800
X-CSE-ConnectionGUID: 71jVjL7qQd+iql7GelEHdA==
X-CSE-MsgGUID: rLTtJTASQgyhbnxRkBPyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122141127"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 15:39:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP94c-0002ZE-1M;
	Sat, 21 Dec 2024 23:39:54 +0000
Date: Sun, 22 Dec 2024 07:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 7/8] arm64: dts: qcom: qcs8300: enable pcie1 for
 qcs8300 soc
Message-ID: <202412220753.uf0bzugD-lkp@intel.com>
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
In-Reply-To: <20241220055239.2744024-8-quic_ziyuzhan@quicinc.com>
References: <20241220055239.2744024-8-quic_ziyuzhan@quicinc.com>
TO: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
TO: vkoul@kernel.org
TO: kishon@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dmitry.baryshkov@linaro.org
TO: neil.armstrong@linaro.org
TO: abel.vesa@linaro.org
TO: manivannan.sadhasivam@linaro.org
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: bhelgaas@google.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: linux-phy@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: quic_qianyu@quicinc.com
CC: quic_krichai@quicinc.com
CC: quic_vbadigan@quicinc.com
CC: Ziyue Zhang <quic_ziyuzhan@quicinc.com>

Hi Ziyue,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4176cf5c5651c33769de83bb61b0287f4ec7719f]

url:    https://github.com/intel-lab-lkp/linux/commits/Ziyue-Zhang/dt-bindings-phy-qcom-sc8280xp-qmp-pcie-phy-Document-the-QCS8300-QMP-PCIe-PHY-Gen4-x2/20241220-135722
base:   4176cf5c5651c33769de83bb61b0287f4ec7719f
patch link:    https://lore.kernel.org/r/20241220055239.2744024-8-quic_ziyuzhan%40quicinc.com
patch subject: [PATCH v3 7/8] arm64: dts: qcom: qcs8300: enable pcie1 for qcs8300 soc
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220753.uf0bzugD-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220753.uf0bzugD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412220753.uf0bzugD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs8300.dtsi:919.31-977.6: ERROR (duplicate_label): /soc@0/pci@1c10000/opp-table: Duplicate label 'pcie3_opp_table' on /soc@0/pci@1c10000/opp-table and /soc@0/pci@1c00000/opp-table
   ERROR: Input tree has errors, aborting (use -f to force output)

vim +/pcie3_opp_table +919 arch/arm64/boot/dts/qcom/qcs8300.dtsi

7be190e4bdd2bd1 Jingyi Wang 2024-12-03   15  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   16  / {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   17  	interrupt-parent = <&intc>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   18  	#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   19  	#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   20  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   21  	clocks {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   22  		xo_board_clk: xo-board-clk {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   23  			compatible = "fixed-clock";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   24  			#clock-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   25  			clock-frequency = <38400000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   26  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   27  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   28  		sleep_clk: sleep-clk {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   29  			compatible = "fixed-clock";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   30  			#clock-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   31  			clock-frequency = <32000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   32  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   33  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   34  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   35  	cpus {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   36  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   37  		#size-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   38  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   39  		cpu0: cpu@0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   40  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   41  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   42  			reg = <0x0 0x0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   43  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   44  			next-level-cache = <&l2_0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   45  			power-domains = <&cpu_pd0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   46  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   47  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   48  			l2_0: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   49  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   50  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   51  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   52  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   53  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   54  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   55  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   56  		cpu1: cpu@100 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   57  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   58  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   59  			reg = <0x0 0x100>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   60  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   61  			next-level-cache = <&l2_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   62  			power-domains = <&cpu_pd1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   63  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   64  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   65  			l2_1: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   66  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   67  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   68  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   69  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   70  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   71  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   72  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   73  		cpu2: cpu@200 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   74  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   75  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   76  			reg = <0x0 0x200>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   77  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   78  			next-level-cache = <&l2_2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   79  			power-domains = <&cpu_pd2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   80  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   81  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   82  			l2_2: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   83  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   84  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   85  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   86  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   87  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   88  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   89  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   90  		cpu3: cpu@300 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   91  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   92  			compatible = "arm,cortex-a78c";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   93  			reg = <0x0 0x300>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   94  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   95  			next-level-cache = <&l2_3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   96  			power-domains = <&cpu_pd3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   97  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   98  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03   99  			l2_3: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  100  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  101  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  102  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  103  				next-level-cache = <&l3_0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  104  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  105  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  106  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  107  		cpu4: cpu@10000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  108  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  109  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  110  			reg = <0x0 0x10000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  111  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  112  			next-level-cache = <&l2_4>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  113  			power-domains = <&cpu_pd4>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  114  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  115  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  116  			l2_4: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  117  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  118  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  119  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  120  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  121  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  122  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  123  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  124  		cpu5: cpu@10100 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  125  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  126  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  127  			reg = <0x0 0x10100>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  128  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  129  			next-level-cache = <&l2_5>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  130  			power-domains = <&cpu_pd5>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  131  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  132  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  133  			l2_5: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  134  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  135  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  136  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  137  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  138  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  139  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  140  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  141  		cpu6: cpu@10200 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  142  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  143  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  144  			reg = <0x0 0x10200>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  145  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  146  			next-level-cache = <&l2_6>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  147  			power-domains = <&cpu_pd6>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  148  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  149  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  150  			l2_6: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  151  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  152  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  153  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  154  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  155  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  156  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  157  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  158  		cpu7: cpu@10300 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  159  			device_type = "cpu";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  160  			compatible = "arm,cortex-a55";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  161  			reg = <0x0 0x10300>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  162  			enable-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  163  			next-level-cache = <&l2_7>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  164  			power-domains = <&cpu_pd7>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  165  			power-domain-names = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  166  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  167  			l2_7: l2-cache {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  168  				compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  169  				cache-level = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  170  				cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  171  				next-level-cache = <&l3_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  172  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  173  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  174  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  175  		cpu-map {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  176  			cluster0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  177  				core0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  178  					cpu = <&cpu0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  179  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  180  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  181  				core1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  182  					cpu = <&cpu1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  183  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  184  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  185  				core2 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  186  					cpu = <&cpu2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  187  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  188  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  189  				core3 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  190  					cpu = <&cpu3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  191  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  192  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  193  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  194  			cluster1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  195  				core0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  196  					cpu = <&cpu4>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  197  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  198  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  199  				core1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  200  					cpu = <&cpu5>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  201  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  202  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  203  				core2 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  204  					cpu = <&cpu6>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  205  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  206  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  207  				core3 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  208  					cpu = <&cpu7>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  209  				};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  210  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  211  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  212  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  213  		l3_0: l3-cache-0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  214  			compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  215  			cache-level = <3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  216  			cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  217  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  218  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  219  		l3_1: l3-cache-1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  220  			compatible = "cache";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  221  			cache-level = <3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  222  			cache-unified;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  223  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  224  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  225  		idle-states {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  226  			entry-method = "psci";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  227  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  228  			little_cpu_sleep_0: cpu-sleep-0-0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  229  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  230  				idle-state-name = "silver-power-collapse";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  231  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  232  				entry-latency-us = <449>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  233  				exit-latency-us = <801>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  234  				min-residency-us = <1574>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  235  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  236  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  237  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  238  			little_cpu_sleep_1: cpu-sleep-0-1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  239  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  240  				idle-state-name = "silver-rail-power-collapse";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  241  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  242  				entry-latency-us = <602>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  243  				exit-latency-us = <961>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  244  				min-residency-us = <4288>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  245  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  246  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  247  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  248  			big_cpu_sleep_0: cpu-sleep-1-0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  249  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  250  				idle-state-name = "gold-power-collapse";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  251  				arm,psci-suspend-param = <0x40000003>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  252  				entry-latency-us = <549>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  253  				exit-latency-us = <901>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  254  				min-residency-us = <1774>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  255  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  256  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  257  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  258  			big_cpu_sleep_1: cpu-sleep-1-1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  259  				compatible = "arm,idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  260  				idle-state-name = "gold-rail-power-collapse";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  261  				arm,psci-suspend-param = <0x40000004>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  262  				entry-latency-us = <702>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  263  				exit-latency-us = <1061>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  264  				min-residency-us = <4488>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  265  				local-timer-stop;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  266  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  267  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  268  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  269  		domain-idle-states {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  270  			silver_cluster_sleep: cluster-sleep-0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  271  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  272  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  273  				entry-latency-us = <2552>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  274  				exit-latency-us = <2848>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  275  				min-residency-us = <5908>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  276  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  277  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  278  			gold_cluster_sleep: cluster-sleep-1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  279  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  280  				arm,psci-suspend-param = <0x41000044>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  281  				entry-latency-us = <2752>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  282  				exit-latency-us = <3048>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  283  				min-residency-us = <6118>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  284  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  285  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  286  			system_sleep: domain-sleep {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  287  				compatible = "domain-idle-state";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  288  				arm,psci-suspend-param = <0x42000144>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  289  				entry-latency-us = <3263>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  290  				exit-latency-us = <6562>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  291  				min-residency-us = <9987>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  292  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  293  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  294  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  295  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  296  	firmware {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  297  		scm: scm {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  298  			compatible = "qcom,scm-qcs8300", "qcom,scm";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  299  			qcom,dload-mode = <&tcsr 0x13000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  300  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  301  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  302  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  303  	memory@80000000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  304  		device_type = "memory";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  305  		/* We expect the bootloader to fill in the size */
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  306  		reg = <0x0 0x80000000 0x0 0x0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  307  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  308  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  309  	clk_virt: interconnect-0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  310  		compatible = "qcom,qcs8300-clk-virt";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  311  		#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  312  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  313  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  314  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  315  	mc_virt: interconnect-1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  316  		compatible = "qcom,qcs8300-mc-virt";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  317  		#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  318  		qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  319  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  320  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  321  	psci {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  322  		compatible = "arm,psci-1.0";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  323  		method = "smc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  324  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  325  		cpu_pd0: power-domain-cpu0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  326  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  327  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  328  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  329  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  330  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  331  		cpu_pd1: power-domain-cpu1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  332  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  333  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  334  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  335  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  336  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  337  		cpu_pd2: power-domain-cpu2 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  338  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  339  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  340  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  341  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  342  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  343  		cpu_pd3: power-domain-cpu3 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  344  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  345  			power-domains = <&cluster_pd0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  346  			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  347  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  348  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  349  		cpu_pd4: power-domain-cpu4 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  350  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  351  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  352  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  353  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  354  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  355  		cpu_pd5: power-domain-cpu5 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  356  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  357  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  358  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  359  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  360  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  361  		cpu_pd6: power-domain-cpu6 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  362  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  363  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  364  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  365  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  366  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  367  		cpu_pd7: power-domain-cpu7 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  368  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  369  			power-domains = <&cluster_pd1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  370  			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  371  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  372  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  373  		cluster_pd0: power-domain-cluster0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  374  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  375  			power-domains = <&system_pd>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  376  			domain-idle-states = <&gold_cluster_sleep>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  377  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  378  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  379  		cluster_pd1: power-domain-cluster1 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  380  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  381  			power-domains = <&system_pd>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  382  			domain-idle-states = <&silver_cluster_sleep>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  383  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  384  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  385  		system_pd: power-domain-system {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  386  			#power-domain-cells = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  387  			domain-idle-states = <&system_sleep>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  388  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  389  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  390  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  391  	reserved-memory {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  392  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  393  		#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  394  		ranges;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  395  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  396  		aop_image_mem: aop-image-region@90800000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  397  			reg = <0x0 0x90800000 0x0 0x60000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  398  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  399  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  400  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  401  		aop_cmd_db_mem: aop-cmd-db-region@90860000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  402  			compatible = "qcom,cmd-db";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  403  			reg = <0x0 0x90860000 0x0 0x20000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  404  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  405  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  406  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  407  		smem_mem: smem@90900000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  408  			compatible = "qcom,smem";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  409  			reg = <0x0 0x90900000 0x0 0x200000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  410  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  411  			hwlocks = <&tcsr_mutex 3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  412  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  413  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  414  		lpass_machine_learning_mem: lpass-machine-learning-region@93b00000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  415  			reg = <0x0 0x93b00000 0x0 0xf00000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  416  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  417  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  418  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  419  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap-region@94a00000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  420  			reg = <0x0 0x94a00000 0x0 0x800000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  421  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  422  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  423  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  424  		camera_mem: camera-region@95200000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  425  			reg = <0x0 0x95200000 0x0 0x500000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  426  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  427  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  428  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  429  		adsp_mem: adsp-region@95c00000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  430  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  431  			reg = <0x0 0x95c00000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  432  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  433  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  434  		q6_adsp_dtb_mem: q6-adsp-dtb-region@97a00000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  435  			reg = <0x0 0x97a00000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  436  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  437  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  438  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  439  		q6_gpdsp_dtb_mem: q6-gpdsp-dtb-region@97a80000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  440  			reg = <0x0 0x97a80000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  441  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  442  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  443  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  444  		gpdsp_mem: gpdsp-region@97b00000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  445  			reg = <0x0 0x97b00000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  446  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  447  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  448  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  449  		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@99900000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  450  			reg = <0x0 0x99900000 0x0 0x80000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  451  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  452  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  453  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  454  		cdsp_mem: cdsp-region@99980000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  455  			reg = <0x0 0x99980000 0x0 0x1e00000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  456  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  457  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  458  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  459  		gpu_microcode_mem: gpu-microcode-region@9b780000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  460  			reg = <0x0 0x9b780000 0x0 0x2000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  461  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  462  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  463  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  464  		cvp_mem: cvp-region@9b782000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  465  			reg = <0x0 0x9b782000 0x0 0x700000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  466  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  467  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  468  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  469  		video_mem: video-region@9be82000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  470  			reg = <0x0 0x9be82000 0x0 0x700000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  471  			no-map;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  472  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  473  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  474  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  475  	smp2p-adsp {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  476  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  477  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  478  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  479  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  480  		mboxes = <&ipcc IPCC_CLIENT_LPASS
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  481  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  482  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  483  		qcom,smem = <443>, <429>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  484  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  485  		qcom,remote-pid = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  486  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  487  		smp2p_adsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  488  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  489  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  490  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  491  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  492  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  493  		smp2p_adsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  494  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  495  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  496  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  497  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  498  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  499  	smp2p-cdsp {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  500  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  501  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  502  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  503  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  504  		mboxes = <&ipcc IPCC_CLIENT_CDSP
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  505  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  506  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  507  		qcom,smem = <94>, <432>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  508  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  509  		qcom,remote-pid = <5>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  510  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  511  		smp2p_cdsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  512  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  513  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  514  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  515  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  516  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  517  		smp2p_cdsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  518  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  519  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  520  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  521  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  522  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  523  	smp2p-gpdsp {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  524  		compatible = "qcom,smp2p";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  525  		interrupts-extended = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  526  					     IPCC_MPROC_SIGNAL_SMP2P
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  527  					     IRQ_TYPE_EDGE_RISING>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  528  		mboxes = <&ipcc IPCC_CLIENT_GPDSP0
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  529  				IPCC_MPROC_SIGNAL_SMP2P>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  530  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  531  		qcom,smem = <617>, <616>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  532  		qcom,local-pid = <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  533  		qcom,remote-pid = <17>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  534  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  535  		smp2p_gpdsp_in: slave-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  536  			qcom,entry-name = "slave-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  537  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  538  			#interrupt-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  539  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  540  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  541  		smp2p_gpdsp_out: master-kernel {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  542  			qcom,entry-name = "master-kernel";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  543  			#qcom,smem-state-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  544  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  545  	};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  546  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  547  	soc: soc@0 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  548  		compatible = "simple-bus";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  549  		ranges = <0 0 0 0 0x10 0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  550  		#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  551  		#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  552  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  553  		gcc: clock-controller@100000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  554  			compatible = "qcom,qcs8300-gcc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  555  			reg = <0x0 0x00100000 0x0 0xc7018>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  556  			#clock-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  557  			#reset-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  558  			#power-domain-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  559  			clocks = <&rpmhcc RPMH_CXO_CLK>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  560  				 <&sleep_clk>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  561  				 <&pcie0_phy>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  562  				 <&pcie1_phy>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  563  				 <0>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  564  				 <0>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  565  				 <0>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  566  				 <0>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  567  				 <0>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  568  				 <0>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  569  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  570  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  571  		ipcc: mailbox@408000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  572  			compatible = "qcom,qcs8300-ipcc", "qcom,ipcc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  573  			reg = <0x0 0x408000 0x0 0x1000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  574  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  575  			interrupt-controller;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  576  			#interrupt-cells = <3>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  577  			#mbox-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  578  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  579  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  580  		qfprom: efuse@784000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  581  			compatible = "qcom,qcs8300-qfprom", "qcom,qfprom";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  582  			reg = <0x0 0x00784000 0x0 0x1200>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  583  			#address-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  584  			#size-cells = <1>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  585  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  586  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  587  		qupv3_id_0: geniqup@9c0000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  588  			compatible = "qcom,geni-se-qup";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  589  			reg = <0x0 0x9c0000 0x0 0x2000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  590  			ranges;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  591  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  592  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  593  			clock-names = "m-ahb",
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  594  				      "s-ahb";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  595  			#address-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  596  			#size-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  597  			status = "disabled";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  598  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  599  			uart7: serial@99c000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  600  				compatible = "qcom,geni-debug-uart";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  601  				reg = <0x0 0x0099c000 0x0 0x4000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  602  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  603  				clock-names = "se";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  604  				pinctrl-0 = <&qup_uart7_default>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  605  				pinctrl-names = "default";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  606  				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  607  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  608  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  609  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  610  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  611  				interconnect-names = "qup-core",
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  612  						     "qup-config";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  613  				status = "disabled";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  614  			};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  615  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  616  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  617  		config_noc: interconnect@14c0000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  618  			compatible = "qcom,qcs8300-config-noc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  619  			reg = <0x0 0x014c0000 0x0 0x13080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  620  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  621  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  622  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  623  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  624  		system_noc: interconnect@1680000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  625  			compatible = "qcom,qcs8300-system-noc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  626  			reg = <0x0 0x01680000 0x0 0x15080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  627  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  628  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  629  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  630  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  631  		aggre1_noc: interconnect@16c0000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  632  			compatible = "qcom,qcs8300-aggre1-noc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  633  			reg = <0x0 0x016c0000 0x0 0x17080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  634  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  635  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  636  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  637  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  638  		aggre2_noc: interconnect@1700000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  639  			compatible = "qcom,qcs8300-aggre2-noc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  640  			reg = <0x0 0x01700000 0x0 0x1a080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  641  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  642  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  643  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  644  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  645  		pcie_anoc: interconnect@1760000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  646  			compatible = "qcom,qcs8300-pcie-anoc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  647  			reg = <0x0 0x01760000 0x0 0xc080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  648  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  649  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  650  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  651  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  652  		gpdsp_anoc: interconnect@1780000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  653  			compatible = "qcom,qcs8300-gpdsp-anoc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  654  			reg = <0x0 0x01780000 0x0 0xd080>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  655  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  656  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  657  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  658  
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  659  		mmss_noc: interconnect@17a0000 {
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  660  			compatible = "qcom,qcs8300-mmss-noc";
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  661  			reg = <0x0 0x017a0000 0x0 0x40000>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  662  			#interconnect-cells = <2>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  663  			qcom,bcm-voters = <&apps_bcm_voter>;
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  664  		};
7be190e4bdd2bd1 Jingyi Wang 2024-12-03  665  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  666  		pcie0: pci@1c00000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  667  			device_type = "pci";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  668  			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  669  			reg = <0x0 0x01c00000 0x0 0x3000>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  670  			      <0x0 0x40000000 0x0 0xf20>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  671  			      <0x0 0x40000f20 0x0 0xa8>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  672  			      <0x0 0x40001000 0x0 0x4000>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  673  			      <0x0 0x40100000 0x0 0x100000>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  674  			      <0x0 0x01c03000 0x0 0x1000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  675  			reg-names = "parf",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  676  				    "dbi",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  677  				    "elbi",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  678  				    "atu",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  679  				    "config",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  680  				    "mhi";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  681  			#address-cells = <3>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  682  			#size-cells = <2>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  683  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  684  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  685  			bus-range = <0x00 0xff>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  686  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  687  			dma-coherent;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  688  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  689  			linux,pci-domain = <0>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  690  			num-lanes = <2>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  691  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  692  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  693  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  694  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  695  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  696  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  697  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  698  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  699  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  700  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  701  			interrupt-names = "msi0",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  702  					  "msi1",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  703  					  "msi2",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  704  					  "msi3",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  705  					  "msi4",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  706  					  "msi5",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  707  					  "msi6",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  708  					  "msi7",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  709  					  "global";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  710  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  711  			#interrupt-cells = <1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  712  			interrupt-map-mask = <0 0 0 0x7>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  713  			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  714  					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  715  					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  716  					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  717  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  718  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  719  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  720  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  721  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  722  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  723  			clock-names = "aux",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  724  				      "cfg",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  725  				      "bus_master",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  726  				      "bus_slave",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  727  				      "slave_q2a";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  728  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  729  			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  730  			assigned-clock-rates = <19200000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  731  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  732  			interconnects = <&pcie_anoc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
6c48b7cf491b802 Ziyue Zhang 2024-12-20  733  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  734  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
6c48b7cf491b802 Ziyue Zhang 2024-12-20  735  					 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  736  			interconnect-names = "pcie-mem",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  737  					     "cpu-pcie";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  738  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  739  			iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  740  				    <0x100 &pcie_smmu 0x0001 0x1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  741  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  742  			resets = <&gcc GCC_PCIE_0_BCR>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  743  				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  744  			reset-names = "pci",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  745  				      "link_down";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  746  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  747  			power-domains = <&gcc GCC_PCIE_0_GDSC>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  748  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  749  			phys = <&pcie0_phy>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  750  			phy-names = "pciephy";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  751  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  752  			status = "disabled";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  753  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  754  			pcie3_opp_table: opp-table {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  755  				compatible = "operating-points-v2";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  756  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  757  				/* GEN 1 x1 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  758  				opp-2500000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  759  					opp-hz = /bits/ 64 <2500000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  760  					required-opps = <&rpmhpd_opp_svs_l1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  761  					opp-peak-kBps = <250000 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  762  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  763  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  764  				/* GEN 1 x2 and GEN 2 x1 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  765  				opp-5000000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  766  					opp-hz = /bits/ 64 <5000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  767  					required-opps = <&rpmhpd_opp_svs_l1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  768  					opp-peak-kBps = <500000 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  769  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  770  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  771  				/* GEN 2 x2 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  772  				opp-10000000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  773  					opp-hz = /bits/ 64 <10000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  774  					required-opps = <&rpmhpd_opp_svs_l1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  775  					opp-peak-kBps = <1000000 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  776  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  777  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  778  				/* GEN 3 x1 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  779  				opp-8000000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  780  					opp-hz = /bits/ 64 <8000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  781  					required-opps = <&rpmhpd_opp_svs_l1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  782  					opp-peak-kBps = <984500 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  783  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  784  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  785  				/* GEN 3 x2 and GEN 4 x1 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  786  				opp-16000000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  787  					opp-hz = /bits/ 64 <16000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  788  					required-opps = <&rpmhpd_opp_nom>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  789  					opp-peak-kBps = <1969000 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  790  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  791  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  792  				/* GEN 4 x2 */
6c48b7cf491b802 Ziyue Zhang 2024-12-20  793  				opp-32000000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  794  					opp-hz = /bits/ 64 <32000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  795  					required-opps = <&rpmhpd_opp_nom>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  796  					opp-peak-kBps = <3938000 1>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  797  				};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  798  			};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  799  		};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  800  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  801  		pcie0_phy: phy@1c04000 {
6c48b7cf491b802 Ziyue Zhang 2024-12-20  802  			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  803  			reg = <0x0 0x01c04000 0x0 0x2000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  804  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  805  			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  806  				 <&gcc GCC_PCIE_CLKREF_EN>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  807  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  808  				 <&gcc GCC_PCIE_0_PIPE_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  809  				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>,
6c48b7cf491b802 Ziyue Zhang 2024-12-20  810  				 <&gcc GCC_PCIE_0_PHY_AUX_CLK>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  811  			clock-names = "cfg_ahb",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  812  				      "ref",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  813  				      "rchng",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  814  				      "pipe",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  815  				      "pipediv2",
6c48b7cf491b802 Ziyue Zhang 2024-12-20  816  				      "phy_aux";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  817  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  818  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  819  			reset-names = "phy";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  820  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  821  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  822  			assigned-clock-rates = <100000000>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  823  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  824  			#clock-cells = <0>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  825  			clock-output-names = "pcie_0_pipe_clk";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  826  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  827  			#phy-cells = <0>;
6c48b7cf491b802 Ziyue Zhang 2024-12-20  828  
6c48b7cf491b802 Ziyue Zhang 2024-12-20  829  			status = "disabled";
6c48b7cf491b802 Ziyue Zhang 2024-12-20  830  		};
6c48b7cf491b802 Ziyue Zhang 2024-12-20  831  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  832  		pcie1: pci@1c10000 {
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  833  			device_type = "pci";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  834  			compatible = "qcom,pcie-qcs8300", "qcom,pcie-sa8775p";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  835  			reg = <0x0 0x01c10000 0x0 0x3000>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  836  			      <0x0 0x60000000 0x0 0xf20>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  837  			      <0x0 0x60000f20 0x0 0xa8>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  838  			      <0x0 0x60001000 0x0 0x4000>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  839  			      <0x0 0x60100000 0x0 0x100000>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  840  			      <0x0 0x01c13000 0x0 0x1000>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  841  			reg-names = "parf",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  842  				    "dbi",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  843  				    "elbi",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  844  				    "atu",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  845  				    "config",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  846  				    "mhi";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  847  			#address-cells = <3>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  848  			#size-cells = <2>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  849  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  850  				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x1fd00000>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  851  			bus-range = <0x00 0xff>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  852  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  853  			dma-coherent;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  854  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  855  			linux,pci-domain = <1>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  856  			num-lanes = <4>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  857  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  858  			interrupts = <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  859  				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  860  				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  861  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  862  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  863  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  864  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  865  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  866  				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  867  			interrupt-names = "msi0",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  868  					  "msi1",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  869  					  "msi2",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  870  					  "msi3",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  871  					  "msi4",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  872  					  "msi5",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  873  					  "msi6",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  874  					  "msi7",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  875  					  "global";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  876  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  877  			#interrupt-cells = <1>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  878  			interrupt-map-mask = <0 0 0 0x7>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  879  			interrupt-map = <0 0 0 1 &intc GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  880  					<0 0 0 2 &intc GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  881  					<0 0 0 3 &intc GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  882  					<0 0 0 4 &intc GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  883  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  884  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  885  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  886  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  887  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  888  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  889  			clock-names = "aux",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  890  				      "cfg",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  891  				      "bus_master",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  892  				      "bus_slave",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  893  				      "slave_q2a";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  894  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  895  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  896  			assigned-clock-rates = <19200000>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  897  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  898  			interconnects = <&pcie_anoc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  899  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  900  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  901  					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  902  			interconnect-names = "pcie-mem", "cpu-pcie";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  903  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  904  			iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  905  				    <0x100 &pcie_smmu 0x0081 0x1>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  906  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  907  			resets = <&gcc GCC_PCIE_1_BCR>,
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  908  				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  909  			reset-names = "pci",
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  910  				      "link_down";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  911  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  912  			power-domains = <&gcc GCC_PCIE_1_GDSC>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  913  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  914  			phys = <&pcie1_phy>;
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  915  			phy-names = "pciephy";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  916  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  917  			status = "disabled";
7f52f554a33b1c1 Ziyue Zhang 2024-12-20  918  
7f52f554a33b1c1 Ziyue Zhang 2024-12-20 @919  			pcie3_opp_table: opp-table {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
