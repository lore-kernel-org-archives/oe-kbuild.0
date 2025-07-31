Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A7213D52F
	for <oe-kbuild@lists.linux.dev>; Thu, 31 Jul 2025 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753942988; cv=none; b=XB3Krr9Mo0zlErYRZmdqB9THMeiyRsG6yC1GSvceRCOu0cMrUpFLXHw4yzhAnW4FKBpfSU7pa8bXQ5lhYkvOXIEKMFgVMO8tvolNQEAVv63bj2JMsI3oi5KGTfeGURaygh23BFViY9pLiqcfNDMqsoCccMexPyQbJksagVfxSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753942988; c=relaxed/simple;
	bh=DVF85O91EejBZL4GuEILS4blUOaW8eJEps7Mxeku3eI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnba3/KOZcSnRFgkqHP2ddgb0TB0V2sqH/Lm+t1opknP5f/yXB1du4d3ZTKt7JuGdh5nXXDEpuRx0ieM25KjjxyM56qNSIRnl0TjzIRQ+q9Cs6B+7skTDpeDboXzxDskGVPdeC9Ngc+9vGTuw6VxwKb3SEnjsi4kOqGW/5mxW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCGB2dSO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCGB2dSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753942987; x=1785478987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVF85O91EejBZL4GuEILS4blUOaW8eJEps7Mxeku3eI=;
  b=SCGB2dSO5GgImY8d6r+4r7oG3Scs4NU3oMV4+0cfN0kdcNqJ+LbeMqHA
   qUrCoJSzz1VQEwyx5nr7RA5/MTx5c0gNy2qrlVfW6QV3RCxJMUxhte4UQ
   KnEAtSbAZuxFuYznDC/u2dZ17OcFrwCAHGHR1STS9aGy5A7jv9/ieP/ek
   V3f3wfpGs5XVjLekDxCV9BKKvQs6cObPF0uc6IPW07PYIi4XuIT+uG3ZW
   ifrEQ16Qw1ne57+tAshi5aY9FGIGp03bYZ/GlNeXaXucnVjS/Gy4b/r/3
   5PmwWTC/m8mxHySgefIo/PxWmrWKlnddl1Rpe2Smcv8j/tGMsV3ClxkJ/
   w==;
X-CSE-ConnectionGUID: 0RCM2il7RcSC/ovs9REbIA==
X-CSE-MsgGUID: FBrvrgqiT2WXmZZqg2VDiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="78807832"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="78807832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 23:23:07 -0700
X-CSE-ConnectionGUID: 6iXkITYLQ5yQWvohQL1LLA==
X-CSE-MsgGUID: QlSFwhY9SFuneQQKXBzjzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163967146"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2025 23:23:05 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhMgx-0000ud-25;
	Thu, 31 Jul 2025 06:23:03 +0000
Date: Thu, 31 Jul 2025 08:22:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/boot/dts/xtfpga.dtsi:45.6-119.4: Warning
 (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit
 name
Message-ID: <202507310849.ujgJCuOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   260f6f4fda93c8485c8037865c941b42b9cba5d2
commit: 47812144d39566da3f1dbc7a615f656969f99337 xtensa: migrate to the generic rule for built-in DTB
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: xtensa-xip_kc705_defconfig (https://download.01.org/0day-ci/archive/20250731/202507310849.ujgJCuOp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507310849.ujgJCuOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507310849.ujgJCuOp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/xtensa/boot/dts/xtfpga.dtsi:45.6-119.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (unit_address_vs_reg): /soc/main-oscillator: node has a reg or ranges property, but no unit name
>> arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (simple_bus_reg): /soc/main-oscillator: simple-bus unit address format error, expected "d020004"
>> arch/xtensa/boot/dts/xtfpga.dtsi:57.28-67.5: Warning (simple_bus_reg): /soc/serial@0d050020: simple-bus unit address format error, expected "d050020"
>> arch/xtensa/boot/dts/xtfpga.dtsi:69.25-76.5: Warning (simple_bus_reg): /soc/ethoc@0d030000: simple-bus unit address format error, expected "d030000"
>> arch/xtensa/boot/dts/xtfpga.dtsi:78.29-84.5: Warning (simple_bus_reg): /soc/xtfpga-i2s@0d080000: simple-bus unit address format error, expected "d080000"
>> arch/xtensa/boot/dts/xtfpga.dtsi:86.29-104.5: Warning (simple_bus_reg): /soc/i2c-master@0d090000: simple-bus unit address format error, expected "d090000"
>> arch/xtensa/boot/dts/xtfpga.dtsi:106.22-118.5: Warning (simple_bus_reg): /soc/spi@0d0a0000: simple-bus unit address format error, expected "d0a0000"
>> arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:4.25-27.5: Warning (simple_bus_reg): /soc/flash@00000000: simple-bus unit address format error, expected "0"

vim +45 arch/xtensa/boot/dts/xtfpga.dtsi

08a7bbf624072b Max Filippov 2014-02-23  @45  	soc {
08a7bbf624072b Max Filippov 2014-02-23   46  		#address-cells = <1>;
08a7bbf624072b Max Filippov 2014-02-23   47  		#size-cells = <1>;
08a7bbf624072b Max Filippov 2014-02-23   48  		compatible = "simple-bus";
08a7bbf624072b Max Filippov 2014-02-23   49  		ranges = <0x00000000 0xf0000000 0x10000000>;
08a7bbf624072b Max Filippov 2014-02-23   50  
58c3e3ac7a1daf Max Filippov 2016-07-25  @51  		osc: main-oscillator {
58c3e3ac7a1daf Max Filippov 2016-07-25   52  			#clock-cells = <0>;
58c3e3ac7a1daf Max Filippov 2016-07-25   53  			compatible = "cdns,xtfpga-clock";
58c3e3ac7a1daf Max Filippov 2016-07-25   54  			reg = <0x0d020004 0x4>;
58c3e3ac7a1daf Max Filippov 2016-07-25   55  		};
58c3e3ac7a1daf Max Filippov 2016-07-25   56  
08a7bbf624072b Max Filippov 2014-02-23  @57  		serial0: serial@0d050020 {
5584b4da7814af Max Filippov 2012-11-03   58  			device_type = "serial";
5584b4da7814af Max Filippov 2012-11-03   59  			compatible = "ns16550a";
5584b4da7814af Max Filippov 2012-11-03   60  			no-loopback-test;
08a7bbf624072b Max Filippov 2014-02-23   61  			reg = <0x0d050020 0x20>;
5584b4da7814af Max Filippov 2012-11-03   62  			reg-shift = <2>;
abfbd89595e91d Max Filippov 2015-08-24   63  			reg-io-width = <4>;
abfbd89595e91d Max Filippov 2015-08-24   64  			native-endian;
5584b4da7814af Max Filippov 2012-11-03   65  			interrupts = <0 1>; /* external irq 0 */
cdc9af7ccfc26d Max Filippov 2014-01-29   66  			clocks = <&osc>;
5584b4da7814af Max Filippov 2012-11-03   67  		};
5584b4da7814af Max Filippov 2012-11-03   68  
08a7bbf624072b Max Filippov 2014-02-23  @69  		enet0: ethoc@0d030000 {
5584b4da7814af Max Filippov 2012-11-03   70  			compatible = "opencores,ethoc";
08a7bbf624072b Max Filippov 2014-02-23   71  			reg = <0x0d030000 0x4000 0x0d800000 0x4000>;
d99434e1760b94 Max Filippov 2015-08-25   72  			native-endian;
5584b4da7814af Max Filippov 2012-11-03   73  			interrupts = <1 1>; /* external irq 1 */
5584b4da7814af Max Filippov 2012-11-03   74  			local-mac-address = [00 50 c2 13 6f 00];
2bc2fde6385832 Max Filippov 2014-01-29   75  			clocks = <&osc>;
5584b4da7814af Max Filippov 2012-11-03   76  		};
c2c62e61fb8559 Max Filippov 2013-04-19   77  
c2c62e61fb8559 Max Filippov 2013-04-19  @78  		i2s0: xtfpga-i2s@0d080000 {
c2c62e61fb8559 Max Filippov 2013-04-19   79  			#sound-dai-cells = <0>;
c2c62e61fb8559 Max Filippov 2013-04-19   80  			compatible = "cdns,xtfpga-i2s";
c2c62e61fb8559 Max Filippov 2013-04-19   81  			reg = <0x0d080000 0x40>;
c2c62e61fb8559 Max Filippov 2013-04-19   82  			interrupts = <2 1>; /* external irq 2 */
c2c62e61fb8559 Max Filippov 2013-04-19   83  			clocks = <&cdce706 4>;
c2c62e61fb8559 Max Filippov 2013-04-19   84  		};
c2c62e61fb8559 Max Filippov 2013-04-19   85  
c2c62e61fb8559 Max Filippov 2013-04-19  @86  		i2c0: i2c-master@0d090000 {
c2c62e61fb8559 Max Filippov 2013-04-19   87  			compatible = "opencores,i2c-ocores";
c2c62e61fb8559 Max Filippov 2013-04-19   88  			#address-cells = <1>;
c2c62e61fb8559 Max Filippov 2013-04-19   89  			#size-cells = <0>;
c2c62e61fb8559 Max Filippov 2013-04-19   90  			reg = <0x0d090000 0x20>;
c2c62e61fb8559 Max Filippov 2013-04-19   91  			reg-shift = <2>;
bce299ca547357 Max Filippov 2015-08-25   92  			reg-io-width = <4>;
bce299ca547357 Max Filippov 2015-08-25   93  			native-endian;
c2c62e61fb8559 Max Filippov 2013-04-19   94  			interrupts = <4 1>;
c2c62e61fb8559 Max Filippov 2013-04-19   95  			clocks = <&osc>;
c2c62e61fb8559 Max Filippov 2013-04-19   96  
c2c62e61fb8559 Max Filippov 2013-04-19   97  			cdce706: clock-synth@69 {
c2c62e61fb8559 Max Filippov 2013-04-19   98  				compatible = "ti,cdce706";
c2c62e61fb8559 Max Filippov 2013-04-19   99  				#clock-cells = <1>;
c2c62e61fb8559 Max Filippov 2013-04-19  100  				reg = <0x69>;
c2c62e61fb8559 Max Filippov 2013-04-19  101  				clocks = <&clk54>;
c2c62e61fb8559 Max Filippov 2013-04-19  102  				clock-names = "clk_in0";
c2c62e61fb8559 Max Filippov 2013-04-19  103  			};
c2c62e61fb8559 Max Filippov 2013-04-19  104  		};
c2c62e61fb8559 Max Filippov 2013-04-19  105  
f37598be4e3896 Max Filippov 2018-12-04 @106  		spi0: spi@0d0a0000 {

:::::: The code at line 45 was first introduced by commit
:::::: 08a7bbf624072bed1cb35e5b4db7d538580f731c xtensa: xtfpga: introduce SoC I/O bus

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
