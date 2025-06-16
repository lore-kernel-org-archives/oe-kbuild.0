Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA491A8F94
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jun 2025 04:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750047986; cv=none; b=dNHaP8hF+33h4lp21XdBo1izGHhFy3ADB2ayALGgNCB5Aov2ogQEQV7PFEukuf/bsVW8JT2pl9PQvh2lKstUXgc9OZKgMaqVnxylQ7Z5OATbiaUvrGJTvXp8uj5fLsUsN/wLUKVAn7pbCnE4hKM1zVc6KCfReNSHGcWcMpH1UlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750047986; c=relaxed/simple;
	bh=e3qkyXpROzIoefLbCz8gkPr2LCKDs3XoKC24u6fjbKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hd1XJpnTJAOaETZCTh+q06WqMMVZPCxs3cr+HEiJutwh4w9tEyekWjFZetv+WZyXYrN3I4/KY+WXfCTvqFrsQPAmC75w18E3g3tW5G9N1ems7Ent4tXMPU6Q3xP3unvMA0v8RmyutgI6P9I7eWODxmh9ZFbEG5nnlJMU8V5elzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMMmwmdS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMMmwmdS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750047985; x=1781583985;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e3qkyXpROzIoefLbCz8gkPr2LCKDs3XoKC24u6fjbKc=;
  b=SMMmwmdS/uXaqdeKN4nfYxrVVzLsyM6hGv7zLvnGr2nNY5kb4xYvopC4
   81HFwQVaECiMxw2zK26b2OzrTT7SlJIjWGzx965Wf/Ai4FJe+Qqy5qjwU
   DynQuRLVD95GVgghChnfG3tJnlpln2or6K/3ZfqFupQM2ylrcUGHhD0LT
   0pMEYY2GrowAy80SyUhuCZtXGQzNn3/TgsqEScSWY6CK7hHyDBtxjwC1t
   7XWQcVIhVdZCZC9UI8iP1NSk/20Nie0qX3fM6vCxBdgaDmgqJ++T3+T5x
   mrMZvuOqB2S4XtyoOZUN/va8F3wQARbKe9kf2JezO0W8T/iUi47lrLzeW
   g==;
X-CSE-ConnectionGUID: mdAgUpWxQpyfmXx2WAtWkw==
X-CSE-MsgGUID: pp6b4nrMSXaVyz+61PXJzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54800365"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="54800365"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:26:16 -0700
X-CSE-ConnectionGUID: A8+VPcXrRhKUeES+RFVd1g==
X-CSE-MsgGUID: gCcVBsZdTCGerGudgrWseg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149239924"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 21:26:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1QC-000Ek3-08;
	Mon, 16 Jun 2025 04:26:12 +0000
Date: Mon, 16 Jun 2025 12:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy
 S22
Message-ID: <202506161130.j8LJjvNl-lkp@intel.com>
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
In-Reply-To: <20250615205608.1133129-2-ghatto404@gmail.com>
References: <20250615205608.1133129-2-ghatto404@gmail.com>
TO: "Eric Gonçalves" <ghatto404@gmail.com>
TO: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: konradybcio@kernel.org
CC: robh@kernel.org
CC: "Eric Gonçalves" <ghatto404@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Gon-alves/arm64-dts-qcom-add-initial-tree-for-Samsung-Galaxy-S22/20250616-045847
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250615205608.1133129-2-ghatto404%40gmail.com
patch subject: [PATCH v2] arm64: dts: qcom: add initial tree for Samsung Galaxy S22
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-004-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161130.j8LJjvNl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161130.j8LJjvNl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506161130.j8LJjvNl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts:69.9-73.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +69 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

d366b02bf6a72c Eric Gonçalves 2025-06-15   28  
d366b02bf6a72c Eric Gonçalves 2025-06-15   29  / {
d366b02bf6a72c Eric Gonçalves 2025-06-15   30  	chassis-type = "handset";
d366b02bf6a72c Eric Gonçalves 2025-06-15   31  	model = "Samsung Galaxy S22 (SM-S901E)";
d366b02bf6a72c Eric Gonçalves 2025-06-15   32  	compatible = "samsung,r0q", "qcom,sm8450";
d366b02bf6a72c Eric Gonçalves 2025-06-15   33  
d366b02bf6a72c Eric Gonçalves 2025-06-15   34  	chosen {
d366b02bf6a72c Eric Gonçalves 2025-06-15   35  		#address-cells = <2>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   36  		#size-cells = <2>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   37  		ranges;
d366b02bf6a72c Eric Gonçalves 2025-06-15   38  
d366b02bf6a72c Eric Gonçalves 2025-06-15   39  		bootargs = "clk_ignore_unused pd_ignore_unused";
d366b02bf6a72c Eric Gonçalves 2025-06-15   40  		linux,initrd-start = <0x00 0xb6915000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   41  		linux,initrd-end = <0x00 0xb7fff22c>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   42  		stdout-path = "serial0:115200n8";
d366b02bf6a72c Eric Gonçalves 2025-06-15   43  
d366b02bf6a72c Eric Gonçalves 2025-06-15   44  		framebuffer: framebuffer@b8000000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15   45  			compatible = "simple-framebuffer";
d366b02bf6a72c Eric Gonçalves 2025-06-15   46  			reg = <0x0 0xb8000000 0x0 0x2b00000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   47  			width = <1080>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   48  			height = <2340>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   49  			stride = <(1080 * 4)>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   50  			format = "a8r8g8b8";
d366b02bf6a72c Eric Gonçalves 2025-06-15   51  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15   52  	};
d366b02bf6a72c Eric Gonçalves 2025-06-15   53  
d366b02bf6a72c Eric Gonçalves 2025-06-15   54  	gpio-keys {
d366b02bf6a72c Eric Gonçalves 2025-06-15   55  		compatible = "gpio-keys";
d366b02bf6a72c Eric Gonçalves 2025-06-15   56  		autorepeat;
d366b02bf6a72c Eric Gonçalves 2025-06-15   57  
d366b02bf6a72c Eric Gonçalves 2025-06-15   58  		pinctrl-0 = <&vol_up_n>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   59  		pinctrl-names = "default";
d366b02bf6a72c Eric Gonçalves 2025-06-15   60  
d366b02bf6a72c Eric Gonçalves 2025-06-15   61  		key-vol-up {
d366b02bf6a72c Eric Gonçalves 2025-06-15   62  			label = "Volume Up";
d366b02bf6a72c Eric Gonçalves 2025-06-15   63  			linux,code = <KEY_VOLUMEUP>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   64  			gpios = <&pm8350_gpios 6 GPIO_ACTIVE_LOW>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   65  			debounce-interval = <15>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   66  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15   67  	};
d366b02bf6a72c Eric Gonçalves 2025-06-15   68  
d366b02bf6a72c Eric Gonçalves 2025-06-15  @69  	memory {
d366b02bf6a72c Eric Gonçalves 2025-06-15   70  		ddr_device_type = <0x08>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   71  		device_type = "memory";
d366b02bf6a72c Eric Gonçalves 2025-06-15   72  		reg = <0x00 0x80000000 0x00 0x6a000000 0x00 0xf1c00000 0x00 0xe400000 0x08 0x00 0x00 0x3ab00000 0x08 0x40000000 0x01 0x40000000 0x08 0x3b100000 0x00 0x1e00000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   73  	};
d366b02bf6a72c Eric Gonçalves 2025-06-15   74  
d366b02bf6a72c Eric Gonçalves 2025-06-15   75  	reserved-memory {
d366b02bf6a72c Eric Gonçalves 2025-06-15   76  		xbl_ramdump_mem: memory@a6b80000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15   77  			reg = <0x0 0xa7d00000 0x0 0x300000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   78  			no-map;
d366b02bf6a72c Eric Gonçalves 2025-06-15   79  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15   80  
d366b02bf6a72c Eric Gonçalves 2025-06-15   81  		xbl_sc_mem: memory@a6e00000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15   82  			reg = <0x0 0xa6e00000 0x0 0x40000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   83  			no-map;
d366b02bf6a72c Eric Gonçalves 2025-06-15   84  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15   85  
d366b02bf6a72c Eric Gonçalves 2025-06-15   86  		adsp_mem: memory@9fd00000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15   87  			reg = <0x0 0x84500000 0x0 0x3b00000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   88  			no-map;
d366b02bf6a72c Eric Gonçalves 2025-06-15   89  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15   90  
d366b02bf6a72c Eric Gonçalves 2025-06-15   91  		rmtfs_mem: memory@fe200000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15   92  			compatible = "qcom,rmtfs-mem";
d366b02bf6a72c Eric Gonçalves 2025-06-15   93  			reg = <0x0 0xfe200000 0x0 0x280000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   94  			reg-names = "rmtfs";
d366b02bf6a72c Eric Gonçalves 2025-06-15   95  			qcom,client-id = <1>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   96  			no-map;
d366b02bf6a72c Eric Gonçalves 2025-06-15   97  
d366b02bf6a72c Eric Gonçalves 2025-06-15   98  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d366b02bf6a72c Eric Gonçalves 2025-06-15   99  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15  100  
d366b02bf6a72c Eric Gonçalves 2025-06-15  101  		splash_region@b8000000 {
d366b02bf6a72c Eric Gonçalves 2025-06-15  102  			reg = <0x0 0xb8000000 0x0 0x2b00000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15  103  			no-map;
d366b02bf6a72c Eric Gonçalves 2025-06-15  104  		};
d366b02bf6a72c Eric Gonçalves 2025-06-15  105  	};
d366b02bf6a72c Eric Gonçalves 2025-06-15  106  
d366b02bf6a72c Eric Gonçalves 2025-06-15  107  	vph_pwr: vph-pwr-regulator {
d366b02bf6a72c Eric Gonçalves 2025-06-15  108  		compatible = "regulator-fixed";
d366b02bf6a72c Eric Gonçalves 2025-06-15  109  		regulator-name = "vph_pwr";
d366b02bf6a72c Eric Gonçalves 2025-06-15  110  		regulator-min-microvolt = <3700000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15  111  		regulator-max-microvolt = <3700000>;
d366b02bf6a72c Eric Gonçalves 2025-06-15  112  
d366b02bf6a72c Eric Gonçalves 2025-06-15  113  		regulator-always-on;
d366b02bf6a72c Eric Gonçalves 2025-06-15  114  		regulator-boot-on;
d366b02bf6a72c Eric Gonçalves 2025-06-15  115  	};
d366b02bf6a72c Eric Gonçalves 2025-06-15  116  };
d366b02bf6a72c Eric Gonçalves 2025-06-15  117  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
