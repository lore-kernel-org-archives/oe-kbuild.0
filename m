Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996AC147
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745152847; cv=none; b=GvCSxXPcxRNCfBegDQ38Ge+tk96Jx9VHoX9Ri14jgsA3LZ75uY5p1fwBdVo81EMAuFXWmNyYN+p5IcioL4kqK4U5lZt7LPZQSFlp4bCKhQAIxQQjuTH4frwXkdXkA9F+rVjhmDvGrS/E5Kx9tKch49BIqHHDy6+CjwPbnoVvEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745152847; c=relaxed/simple;
	bh=2w2jYyjXiTXScgYTmF2XD7NSfB8awH6OZP+U1rHZZ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rnfvnpZOK+b6StJhTOSZUzCEQ6ZYZTCnzXGQ8F2H0oNMRz0EeQcfksFJiePmnJJ//oldJLBwU/bQ6dT0g6gz7YHvMipiAu0gNJnSvcYlZNS/Htx/hFQXb/+MzkEFTYrJDr8GgfLIrV+a8DAkxEkQELVg3ik0ILYVqzjnqxo6Abw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTh8G3zK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTh8G3zK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745152843; x=1776688843;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2w2jYyjXiTXScgYTmF2XD7NSfB8awH6OZP+U1rHZZ/I=;
  b=VTh8G3zK3U1VnrR8VE/3v0qWzOlM32qrYtVNHgWTpJZbCoiS0rWhk55k
   kpduA6c09PMWl0hbIblyTz4mJ2+mWmKc5YrZkfYja+h1ThPmp3JcNNbyt
   uTqapuuDXgn1/RHOp9aUxmHc5fVTFTEvcGTH+NK6jOtphAAje++lt/hwU
   aS98xFerfVBSYREA4z2HewwmVrwR2eBvJCZVeVSwc4MNkeuBya5tMlGly
   IdpFyUOq9Nl5LX8725tt4IpLmC0/jBrZgPrSSQ/llAI1zxU+eg8wnboKm
   d3NbCvm4hKDIXze+eROCjR9fMZQ7DX2BwS2OXnsTUMqj/nBVoxqCVPn2p
   A==;
X-CSE-ConnectionGUID: Yhm7pcEiTqeDAIh2I4nvJA==
X-CSE-MsgGUID: 5kLMs8EhT6On4UEErKg/Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="57356046"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="57356046"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 05:40:43 -0700
X-CSE-ConnectionGUID: 499mnWv+R2m8ieNmKTDttA==
X-CSE-MsgGUID: BvgZiw7yQg+Heoa8mREIEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131796614"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2025 05:40:41 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6TyR-0004dZ-1q;
	Sun, 20 Apr 2025 12:40:39 +0000
Date: Sun, 20 Apr 2025 20:40:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: qcom: Add initial support for Sony Xperia
 Z Ultra (togari)
Message-ID: <202504202056.Get7ttcT-lkp@intel.com>
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
In-Reply-To: <20250419-togari-v1-4-45840c677364@lucaweiss.eu>
References: <20250419-togari-v1-4-45840c677364@lucaweiss.eu>
TO: Luca Weiss <luca@lucaweiss.eu>
TO: ~postmarketos/upstreaming@lists.sr.ht
TO: phone-devel@vger.kernel.org
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Kevin Widjaja <kevin.widjaja21@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Luca Weiss <luca@lucaweiss.eu>

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ffd015db85fea3e15a77027fda6c02ced4d2444]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Weiss/ARM-dts-qcom-sony-xperia-rhine-Enable-USB-charging/20250419-170401
base:   8ffd015db85fea3e15a77027fda6c02ced4d2444
patch link:    https://lore.kernel.org/r/20250419-togari-v1-4-45840c677364%40lucaweiss.eu
patch subject: [PATCH 4/4] ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504202056.Get7ttcT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202056.Get7ttcT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504202056.Get7ttcT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:552.28-564.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9924000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1955.28-2006.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2026.28-2077.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1252.26-1255.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1267.26-1270.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1287.26-1290.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1297.26-1300.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)

vim +552 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi

3933d267835c8b arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-01-16   11  
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   12  / {
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09   13  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09   14  	#size-cells = <1>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   15  	interrupt-parent = <&intc>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   16  
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18   17  	chosen { };
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18   18  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   19  	clocks {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   20  		xo_board: xo_board {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   21  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   22  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   23  			clock-frequency = <19200000>;
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   24  		};
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   25  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   26  		sleep_clk: sleep_clk {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   27  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   28  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   29  			clock-frequency = <32768>;
ca3971cf77f0bc arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   30  		};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26   31  	};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26   32  
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   33  	cpus {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   34  		#address-cells = <1>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   35  		#size-cells = <0>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   36  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   37  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   38  		cpu0: cpu@0 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   39  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   40  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   41  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   42  			reg = <0>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   43  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   44  			qcom,acc = <&acc0>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   45  			qcom,saw = <&saw0>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   46  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   47  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   48  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   49  		cpu1: cpu@1 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   50  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   51  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   52  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   53  			reg = <1>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   54  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   55  			qcom,acc = <&acc1>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   56  			qcom,saw = <&saw1>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   57  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   58  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   59  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   60  		cpu2: cpu@2 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   61  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   62  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   63  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   64  			reg = <2>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   65  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   66  			qcom,acc = <&acc2>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   67  			qcom,saw = <&saw2>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   68  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   69  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   70  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   71  		cpu3: cpu@3 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   72  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   73  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   74  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   75  			reg = <3>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   76  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   77  			qcom,acc = <&acc3>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   78  			qcom,saw = <&saw3>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   79  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   80  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   81  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   82  		l2: l2-cache {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   83  			compatible = "cache";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   84  			cache-level = <2>;
925a80af6106a5 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-16   85  			cache-unified;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   86  			qcom,saw = <&saw_l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   87  		};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   88  
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   89  		idle-states {
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   90  			cpu_spc: cpu-spc {
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   91  				compatible = "qcom,idle-state-spc",
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   92  						"arm,idle-state";
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   93  				entry-latency-us = <150>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   94  				exit-latency-us = <200>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   95  				min-residency-us = <2000>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   96  			};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   97  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   98  	};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   99  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  100  	firmware {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  101  		scm {
363c1b04cfce56 arch/arm/boot/dts/qcom-msm8974.dtsi      David Heidelberg             2022-06-26  102  			compatible = "qcom,scm-msm8974", "qcom,scm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  103  			clocks = <&gcc GCC_CE1_CLK>, <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  104  			clock-names = "core", "bus", "iface";
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  105  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  106  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  107  
cad23ffd46e220 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18  108  	memory@0 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  109  		device_type = "memory";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  110  		reg = <0x0 0x0>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  111  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  112  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  113  	pmu {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  114  		compatible = "qcom,krait-pmu";
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05  115  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  116  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  117  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  118  	rpm: remoteproc {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  119  		compatible = "qcom,msm8974-rpm-proc", "qcom,rpm-proc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  120  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  121  		master-stats {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  122  			compatible = "qcom,rpm-master-stats";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  123  			qcom,rpm-msg-ram = <&apss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  124  					   <&mpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  125  					   <&lpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  126  					   <&pronto_master_stats>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  127  			qcom,master-names = "APSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  128  					    "MPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  129  					    "LPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  130  					    "PRONTO";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  131  		};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  132  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  133  		smd-edge {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  134  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  135  			mboxes = <&apcs 0>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  136  			qcom,smd-edge = <15>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  137  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  138  			rpm_requests: rpm-requests {
a11a87a9a66e5e arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-07-29  139  				compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  140  				qcom,smd-channels = "rpm_requests";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  141  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  142  				rpmcc: clock-controller {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  143  					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  144  					#clock-cells = <1>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  145  					clocks = <&xo_board>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  146  					clock-names = "xo";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  147  				};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  148  			};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  149  		};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  150  	};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  151  
56080a49773935 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Bingwu Zhang                 2024-07-15  152  	reserved_memory: reserved-memory {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  153  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  154  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  155  		ranges;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  156  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  157  		mpss_region: mpss@8000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  158  			reg = <0x08000000 0x5100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  159  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  160  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  161  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  162  		mba_region: mba@d100000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  163  			reg = <0x0d100000 0x100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  164  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  165  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  166  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  167  		wcnss_region: wcnss@d200000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  168  			reg = <0x0d200000 0xa00000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  169  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  170  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  171  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  172  		adsp_region: adsp@dc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  173  			reg = <0x0dc00000 0x1900000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  174  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  175  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  176  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  177  		venus_region: memory@f500000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  178  			reg = <0x0f500000 0x500000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  179  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  180  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  181  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  182  		smem_region: smem@fa00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  183  			reg = <0xfa00000 0x200000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  184  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  185  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  186  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  187  		tz_region: memory@fc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  188  			reg = <0x0fc00000 0x160000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  189  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  190  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  191  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  192  		rfsa_mem: memory@fd60000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  193  			reg = <0x0fd60000 0x20000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  194  			no-map;
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21  195  		};
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21  196  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  197  		rmtfs@fd80000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  198  			compatible = "qcom,rmtfs-mem";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  199  			reg = <0x0fd80000 0x180000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  200  			no-map;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06  201  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  202  			qcom,client-id = <1>;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06  203  		};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28  204  	};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28  205  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  206  	smem {
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  207  		compatible = "qcom,smem";
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  208  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  209  		memory-region = <&smem_region>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  210  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  211  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  212  		hwlocks = <&tcsr_mutex 3>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  213  	};
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  214  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  215  	smp2p-adsp {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  216  		compatible = "qcom,smp2p";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  217  		qcom,smem = <443>, <429>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  218  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  219  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  220  		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  221  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  222  		mboxes = <&apcs 10>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  223  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  224  		qcom,local-pid = <0>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  225  		qcom,remote-pid = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  226  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  227  		adsp_smp2p_out: master-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  228  			qcom,entry-name = "master-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  229  			#qcom,smem-state-cells = <1>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  230  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  231  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  232  		adsp_smp2p_in: slave-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  233  			qcom,entry-name = "slave-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  234  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  235  			interrupt-controller;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  236  			#interrupt-cells = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  237  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  238  	};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  239  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  240  	smp2p-modem {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  241  		compatible = "qcom,smp2p";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  242  		qcom,smem = <435>, <428>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  243  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  244  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  245  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  246  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  247  		mboxes = <&apcs 14>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  248  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  249  		qcom,local-pid = <0>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  250  		qcom,remote-pid = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  251  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  252  		modem_smp2p_out: master-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  253  			qcom,entry-name = "master-kernel";
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  254  			#qcom,smem-state-cells = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  255  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  256  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  257  		modem_smp2p_in: slave-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  258  			qcom,entry-name = "slave-kernel";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  259  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  260  			interrupt-controller;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  261  			#interrupt-cells = <2>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  262  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  263  	};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  264  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  265  	smp2p-wcnss {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  266  		compatible = "qcom,smp2p";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  267  		qcom,smem = <451>, <431>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  268  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  269  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  270  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  271  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  272  		mboxes = <&apcs 18>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  273  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  274  		qcom,local-pid = <0>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  275  		qcom,remote-pid = <4>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  276  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  277  		wcnss_smp2p_out: master-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  278  			qcom,entry-name = "master-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  279  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  280  			#qcom,smem-state-cells = <1>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  281  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  282  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  283  		wcnss_smp2p_in: slave-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  284  			qcom,entry-name = "slave-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  285  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  286  			interrupt-controller;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  287  			#interrupt-cells = <2>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  288  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  289  	};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  290  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  291  	smsm {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  292  		compatible = "qcom,smsm";
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  293  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  294  		#address-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  295  		#size-cells = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  296  
368a5aed131271 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-06-19  297  		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  298  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  299  		apps_smsm: apps@0 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  300  			reg = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  301  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  302  			#qcom,smem-state-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  303  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  304  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  305  		modem_smsm: modem@1 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  306  			reg = <1>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  307  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  308  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  309  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  310  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  311  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  312  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  313  		adsp_smsm: adsp@2 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  314  			reg = <2>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  315  			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  316  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  317  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  318  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  319  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  320  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  321  		wcnss_smsm: wcnss@7 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  322  			reg = <7>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  323  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  324  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  325  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  326  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  327  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  328  	};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  329  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  330  	soc: soc {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  331  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  332  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  333  		ranges;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  334  		compatible = "simple-bus";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  335  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  336  		intc: interrupt-controller@f9000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  337  			compatible = "qcom,msm-qgic2";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  338  			interrupt-controller;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  339  			#interrupt-cells = <3>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  340  			reg = <0xf9000000 0x1000>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  341  			      <0xf9002000 0x1000>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  342  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  343  
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  344  		apcs: mailbox@f9011000 {
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  345  			compatible = "qcom,msm8974-apcs-kpss-global",
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  346  				     "qcom,msm8994-apcs-kpss-global", "syscon";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  347  			reg = <0xf9011000 0x1000>;
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  348  			#mbox-cells = <1>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  349  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  350  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  351  		saw_l2: power-manager@f9012000 {
c0fe5442b1e5bc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  352  			compatible = "qcom,msm8974-saw2-v2.1-l2", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  353  			reg = <0xf9012000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  354  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  355  
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  356  		watchdog@f9017000 {
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  357  			compatible = "qcom,apss-wdt-msm8974", "qcom,kpss-wdt";
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  358  			reg = <0xf9017000 0x1000>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  359  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  360  				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  361  			clocks = <&sleep_clk>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  362  		};
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  363  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  364  		timer@f9020000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  365  			#address-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  366  			#size-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  367  			ranges;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  368  			compatible = "arm,armv7-timer-mem";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  369  			reg = <0xf9020000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  370  			clock-frequency = <19200000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  371  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  372  			frame@f9021000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  373  				frame-number = <0>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  374  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  375  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  376  				reg = <0xf9021000 0x1000>,
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  377  				      <0xf9022000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  378  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  379  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  380  			frame@f9023000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  381  				frame-number = <1>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  382  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  383  				reg = <0xf9023000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  384  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  385  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  386  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  387  			frame@f9024000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  388  				frame-number = <2>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  389  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  390  				reg = <0xf9024000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  391  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  392  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  393  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  394  			frame@f9025000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  395  				frame-number = <3>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  396  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  397  				reg = <0xf9025000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  398  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  399  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  400  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  401  			frame@f9026000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  402  				frame-number = <4>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  403  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  404  				reg = <0xf9026000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  405  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  406  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  407  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  408  			frame@f9027000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  409  				frame-number = <5>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  410  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  411  				reg = <0xf9027000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  412  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  413  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  414  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  415  			frame@f9028000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  416  				frame-number = <6>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  417  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  418  				reg = <0xf9028000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  419  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  420  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  421  		};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  422  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  423  		acc0: power-manager@f9088000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  424  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  425  			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  426  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  427  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  428  		saw0: power-manager@f9089000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  429  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  430  			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  431  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  432  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  433  		acc1: power-manager@f9098000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  434  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  435  			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  436  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  437  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  438  		saw1: power-manager@f9099000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  439  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  440  			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  441  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  442  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  443  		acc2: power-manager@f90a8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  444  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  445  			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  446  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  447  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  448  		saw2: power-manager@f90a9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  449  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  450  			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  451  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  452  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  453  		acc3: power-manager@f90b8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  454  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  455  			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  456  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  457  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  458  		saw3: power-manager@f90b9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  459  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  460  			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  461  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  462  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  463  		sdhc_1: mmc@f9824900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  464  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  465  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  466  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  467  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  468  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  469  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  470  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  471  				 <&gcc GCC_SDCC1_APPS_CLK>,
a91b2e690d4094 arch/arm/boot/dts/qcom-msm8974.dtsi      Ritesh Harjani               2016-11-21  472  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  473  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  474  			bus-width = <8>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  475  			non-removable;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  476  
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  477  			status = "disabled";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  478  		};
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  479  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  480  		sdhc_3: mmc@f9864900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  481  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  482  			reg = <0xf9864900 0x11c>, <0xf9864000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  483  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  484  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  485  				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  486  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  487  			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  488  				 <&gcc GCC_SDCC3_APPS_CLK>,
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  489  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  490  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  491  			bus-width = <4>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  492  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  493  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  494  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  495  
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  496  			status = "disabled";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  497  		};
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  498  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  499  		sdhc_2: mmc@f98a4900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  500  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  501  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  502  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  503  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  504  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  505  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  506  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  507  				 <&gcc GCC_SDCC2_APPS_CLK>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  508  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  509  			clock-names = "iface", "core", "xo";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  510  			bus-width = <4>;
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  511  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  512  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  513  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  514  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  515  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  516  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  517  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  518  		blsp1_uart1: serial@f991d000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  519  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  520  			reg = <0xf991d000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  521  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  522  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  523  			clock-names = "core", "iface";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  524  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  525  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  526  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  527  		blsp1_uart2: serial@f991e000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  528  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  529  			reg = <0xf991e000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  530  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  531  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  532  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06  533  			pinctrl-names = "default";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06  534  			pinctrl-0 = <&blsp1_uart2_default>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  535  			status = "disabled";
7d7db8db67003e arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2014-02-06  536  		};
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16  537  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  538  		blsp1_i2c1: i2c@f9923000 {
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  539  			status = "disabled";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  540  			compatible = "qcom,i2c-qup-v2.1.1";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  541  			reg = <0xf9923000 0x1000>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05  542  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  543  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  544  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  545  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  546  			pinctrl-0 = <&blsp1_i2c1_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  547  			pinctrl-1 = <&blsp1_i2c1_sleep>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  548  			#address-cells = <1>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  549  			#size-cells = <0>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  550  		};
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  551  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15 @552  		blsp1_i2c2: i2c@f9924000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
