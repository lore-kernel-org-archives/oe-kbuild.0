Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD09476
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Feb 2025 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739417546; cv=none; b=ktadcIh6sOAkJbTeULETJ8OnHPFLZXU5HUSIo50IIlaEsW341UeHCZKUOcK4/Ke3JCv8a/ylwEALr4xnR6wdM1w/6gj9lNNDSiYEdYuIpiw3emOcjR3JNT6OyZx9BSqezvYZ2PVs6gZTdo7Ph1xqRts/7RE4cDBPVHX6WXBjkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739417546; c=relaxed/simple;
	bh=Qc+cHDux6hrkkDkexC6Rh+hNaTXVGlQ6cBKXuNcni98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vigaf+SPWjHkCgEfpJlpWg3dAthtSTeQkR977381JdkEyYD5Bp6U9LBipRohFTpPDxgQO0BwJ9oArJwFmO9oDskCMeXTMAh8KRFoknWFWbxDAOevvVZFioIvvlP269I0/IXQh52KxfbP+0sLjo0Ws03Cc+FgXmAiZhAdzxuKfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fP1xJHIh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fP1xJHIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739417544; x=1770953544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qc+cHDux6hrkkDkexC6Rh+hNaTXVGlQ6cBKXuNcni98=;
  b=fP1xJHIhYGgMCYz9tpQroXuh/obcQGqGTopMP8ruj2L1JRSnvA3bqNlS
   vvYWq/bbUXDDwYbARs8gcTUTkXDgBD9y3kN2HrTstOynwauOphhfTIuJE
   z12FvL0hSMLd+kWxR+XSQmSkDfCcfBtNY45cMjwvi+GOkVlufbPHcxEhW
   7NBWrO8lGEnrhnLRXmQJAKbPj9KknoIVQ6Iob84tKZFaXfx+09OpyzGmp
   I6aXhA0VuN2rwW7jOqIBu2D+s+kmNUbPfM0YqQQYece9bOxRS/zsIqHdl
   eZYKXjyOhoLvZVfEaQYpQkhyiuP/91ApXU6KPhsmyf+GAZnc1TwjhUM6B
   g==;
X-CSE-ConnectionGUID: ib8EeRbVRE+KefzjIi8Xxg==
X-CSE-MsgGUID: JOWNdAdoRumdd47Bp7Ui7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39288864"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="39288864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:32:23 -0800
X-CSE-ConnectionGUID: q36PD/KtRUK5WcR3ktMUAQ==
X-CSE-MsgGUID: 7nY3bBjATgi1HUX8XQyz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="112872608"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Feb 2025 19:32:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiPxb-0016Rf-1b;
	Thu, 13 Feb 2025 03:32:19 +0000
Date: Thu, 13 Feb 2025 11:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:157.18-164.6: Warning
 (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node
 has a reg or ranges property, but no unit name
Message-ID: <202502131138.HHntltFM-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4dc1d1bec89864d8076e5ab314f86f46442bfb02
commit: f868aab874e863374416ecc50419d8b8afc5ea76 ARM: dts: aspeed: bonnell: Reorganise FSI description
date:   1 year, 6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm-randconfig-004-20230928 (https://download.01.org/0day-ci/archive/20250213/202502131138.HHntltFM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131138.HHntltFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502131138.HHntltFM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:157.18-164.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi:322.18-329.6: Warning (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts:81.19-98.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +157 arch/arm/boot/dts/aspeed/ibm-power10-dual.dtsi

fa9d3b8be23d02f Eddie James 2023-08-09    3  
fa9d3b8be23d02f Eddie James 2023-08-09    4  &fsim0 {
fa9d3b8be23d02f Eddie James 2023-08-09    5  	status = "okay";
fa9d3b8be23d02f Eddie James 2023-08-09    6  
fa9d3b8be23d02f Eddie James 2023-08-09    7  	#address-cells = <2>;
fa9d3b8be23d02f Eddie James 2023-08-09    8  	#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09    9  
fa9d3b8be23d02f Eddie James 2023-08-09   10  	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
fa9d3b8be23d02f Eddie James 2023-08-09   11  
fa9d3b8be23d02f Eddie James 2023-08-09   12  	cfam@0,0 {
fa9d3b8be23d02f Eddie James 2023-08-09   13  		reg = <0 0>;
fa9d3b8be23d02f Eddie James 2023-08-09   14  		#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   15  		#size-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   16  		chip-id = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   17  
fa9d3b8be23d02f Eddie James 2023-08-09   18  		scom@1000 {
fa9d3b8be23d02f Eddie James 2023-08-09   19  			compatible = "ibm,fsi2pib";
fa9d3b8be23d02f Eddie James 2023-08-09   20  			reg = <0x1000 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09   21  		};
fa9d3b8be23d02f Eddie James 2023-08-09   22  
fa9d3b8be23d02f Eddie James 2023-08-09   23  		i2c@1800 {
fa9d3b8be23d02f Eddie James 2023-08-09   24  			compatible = "ibm,fsi-i2c-master";
fa9d3b8be23d02f Eddie James 2023-08-09   25  			reg = <0x1800 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09   26  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   27  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   28  
fa9d3b8be23d02f Eddie James 2023-08-09   29  			cfam0_i2c0: i2c-bus@0 {
fa9d3b8be23d02f Eddie James 2023-08-09   30  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   31  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   32  				reg = <0>;	/* OMI01 */
fa9d3b8be23d02f Eddie James 2023-08-09   33  			};
fa9d3b8be23d02f Eddie James 2023-08-09   34  
fa9d3b8be23d02f Eddie James 2023-08-09   35  			cfam0_i2c1: i2c-bus@1 {
fa9d3b8be23d02f Eddie James 2023-08-09   36  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   37  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   38  				reg = <1>;	/* OMI23 */
fa9d3b8be23d02f Eddie James 2023-08-09   39  			};
fa9d3b8be23d02f Eddie James 2023-08-09   40  
fa9d3b8be23d02f Eddie James 2023-08-09   41  			cfam0_i2c10: i2c-bus@a {
fa9d3b8be23d02f Eddie James 2023-08-09   42  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   43  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   44  				reg = <10>;	/* OP3A */
fa9d3b8be23d02f Eddie James 2023-08-09   45  			};
fa9d3b8be23d02f Eddie James 2023-08-09   46  
fa9d3b8be23d02f Eddie James 2023-08-09   47  			cfam0_i2c11: i2c-bus@b {
fa9d3b8be23d02f Eddie James 2023-08-09   48  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   49  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   50  				reg = <11>;	/* OP3B */
fa9d3b8be23d02f Eddie James 2023-08-09   51  			};
fa9d3b8be23d02f Eddie James 2023-08-09   52  
fa9d3b8be23d02f Eddie James 2023-08-09   53  			cfam0_i2c12: i2c-bus@c {
fa9d3b8be23d02f Eddie James 2023-08-09   54  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   55  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   56  				reg = <12>;	/* OP4A */
fa9d3b8be23d02f Eddie James 2023-08-09   57  			};
fa9d3b8be23d02f Eddie James 2023-08-09   58  
fa9d3b8be23d02f Eddie James 2023-08-09   59  			cfam0_i2c13: i2c-bus@d {
fa9d3b8be23d02f Eddie James 2023-08-09   60  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   61  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   62  				reg = <13>;	/* OP4B */
fa9d3b8be23d02f Eddie James 2023-08-09   63  			};
fa9d3b8be23d02f Eddie James 2023-08-09   64  
fa9d3b8be23d02f Eddie James 2023-08-09   65  			cfam0_i2c14: i2c-bus@e {
fa9d3b8be23d02f Eddie James 2023-08-09   66  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   67  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   68  				reg = <14>;	/* OP5A */
fa9d3b8be23d02f Eddie James 2023-08-09   69  			};
fa9d3b8be23d02f Eddie James 2023-08-09   70  
fa9d3b8be23d02f Eddie James 2023-08-09   71  			cfam0_i2c15: i2c-bus@f {
fa9d3b8be23d02f Eddie James 2023-08-09   72  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   73  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   74  				reg = <15>;	/* OP5B */
fa9d3b8be23d02f Eddie James 2023-08-09   75  			};
fa9d3b8be23d02f Eddie James 2023-08-09   76  		};
fa9d3b8be23d02f Eddie James 2023-08-09   77  
fa9d3b8be23d02f Eddie James 2023-08-09   78  		fsi2spi@1c00 {
fa9d3b8be23d02f Eddie James 2023-08-09   79  			compatible = "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09   80  			reg = <0x1c00 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09   81  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   82  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   83  
fa9d3b8be23d02f Eddie James 2023-08-09   84  			cfam0_spi0: spi@0 {
fa9d3b8be23d02f Eddie James 2023-08-09   85  				reg = <0x0>;
fa9d3b8be23d02f Eddie James 2023-08-09   86  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09   87  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   88  
fa9d3b8be23d02f Eddie James 2023-08-09   89  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09   90  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09   91  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09   92  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09   93  
fa9d3b8be23d02f Eddie James 2023-08-09   94  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09   95  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09   96  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09   97  				};
fa9d3b8be23d02f Eddie James 2023-08-09   98  			};
fa9d3b8be23d02f Eddie James 2023-08-09   99  
fa9d3b8be23d02f Eddie James 2023-08-09  100  			cfam0_spi1: spi@20 {
fa9d3b8be23d02f Eddie James 2023-08-09  101  				reg = <0x20>;
fa9d3b8be23d02f Eddie James 2023-08-09  102  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  103  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  104  
fa9d3b8be23d02f Eddie James 2023-08-09  105  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  106  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  107  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  108  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  109  
fa9d3b8be23d02f Eddie James 2023-08-09  110  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  111  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  112  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  113  				};
fa9d3b8be23d02f Eddie James 2023-08-09  114  			};
fa9d3b8be23d02f Eddie James 2023-08-09  115  
fa9d3b8be23d02f Eddie James 2023-08-09  116  			cfam0_spi2: spi@40 {
fa9d3b8be23d02f Eddie James 2023-08-09  117  				reg = <0x40>;
fa9d3b8be23d02f Eddie James 2023-08-09  118  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09  119  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  120  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  121  
fa9d3b8be23d02f Eddie James 2023-08-09  122  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  123  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  124  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  125  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  126  
fa9d3b8be23d02f Eddie James 2023-08-09  127  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  128  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  129  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  130  				};
fa9d3b8be23d02f Eddie James 2023-08-09  131  			};
fa9d3b8be23d02f Eddie James 2023-08-09  132  
fa9d3b8be23d02f Eddie James 2023-08-09  133  			cfam0_spi3: spi@60 {
fa9d3b8be23d02f Eddie James 2023-08-09  134  				reg = <0x60>;
fa9d3b8be23d02f Eddie James 2023-08-09  135  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09  136  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  137  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  138  
fa9d3b8be23d02f Eddie James 2023-08-09  139  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  140  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  141  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  142  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  143  
fa9d3b8be23d02f Eddie James 2023-08-09  144  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  145  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  146  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  147  				};
fa9d3b8be23d02f Eddie James 2023-08-09  148  			};
fa9d3b8be23d02f Eddie James 2023-08-09  149  		};
fa9d3b8be23d02f Eddie James 2023-08-09  150  
fa9d3b8be23d02f Eddie James 2023-08-09  151  		sbefifo@2400 {
fa9d3b8be23d02f Eddie James 2023-08-09  152  			compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02f Eddie James 2023-08-09  153  			reg = <0x2400 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  154  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  155  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  156  
fa9d3b8be23d02f Eddie James 2023-08-09 @157  			fsi_occ0: occ {
fa9d3b8be23d02f Eddie James 2023-08-09  158  				compatible = "ibm,p10-occ";
fa9d3b8be23d02f Eddie James 2023-08-09  159  
fa9d3b8be23d02f Eddie James 2023-08-09  160  				occ-hwmon {
fa9d3b8be23d02f Eddie James 2023-08-09  161  					compatible = "ibm,p10-occ-hwmon";
fa9d3b8be23d02f Eddie James 2023-08-09  162  					ibm,no-poll-on-init;
fa9d3b8be23d02f Eddie James 2023-08-09  163  				};
fa9d3b8be23d02f Eddie James 2023-08-09  164  			};
fa9d3b8be23d02f Eddie James 2023-08-09  165  		};
fa9d3b8be23d02f Eddie James 2023-08-09  166  
fa9d3b8be23d02f Eddie James 2023-08-09  167  		fsi_hub0: hub@3400 {
fa9d3b8be23d02f Eddie James 2023-08-09  168  			compatible = "fsi-master-hub";
fa9d3b8be23d02f Eddie James 2023-08-09  169  			reg = <0x3400 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  170  			#address-cells = <2>;
fa9d3b8be23d02f Eddie James 2023-08-09  171  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  172  		};
fa9d3b8be23d02f Eddie James 2023-08-09  173  	};
fa9d3b8be23d02f Eddie James 2023-08-09  174  };
fa9d3b8be23d02f Eddie James 2023-08-09  175  
fa9d3b8be23d02f Eddie James 2023-08-09  176  &fsi_hub0 {
fa9d3b8be23d02f Eddie James 2023-08-09  177  	cfam@1,0 {
fa9d3b8be23d02f Eddie James 2023-08-09  178  		reg = <1 0>;
fa9d3b8be23d02f Eddie James 2023-08-09  179  		#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  180  		#size-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  181  		chip-id = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  182  
fa9d3b8be23d02f Eddie James 2023-08-09  183  		scom@1000 {
fa9d3b8be23d02f Eddie James 2023-08-09  184  			compatible = "ibm,fsi2pib";
fa9d3b8be23d02f Eddie James 2023-08-09  185  			reg = <0x1000 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  186  		};
fa9d3b8be23d02f Eddie James 2023-08-09  187  
fa9d3b8be23d02f Eddie James 2023-08-09  188  		i2c@1800 {
fa9d3b8be23d02f Eddie James 2023-08-09  189  			compatible = "ibm,fsi-i2c-master";
fa9d3b8be23d02f Eddie James 2023-08-09  190  			reg = <0x1800 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  191  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  192  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  193  
fa9d3b8be23d02f Eddie James 2023-08-09  194  			cfam1_i2c2: i2c-bus@2 {
fa9d3b8be23d02f Eddie James 2023-08-09  195  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  196  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  197  				reg = <2>;	/* OMI45 */
fa9d3b8be23d02f Eddie James 2023-08-09  198  			};
fa9d3b8be23d02f Eddie James 2023-08-09  199  
fa9d3b8be23d02f Eddie James 2023-08-09  200  			cfam1_i2c3: i2c-bus@3 {
fa9d3b8be23d02f Eddie James 2023-08-09  201  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  202  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  203  				reg = <3>;	/* OMI67 */
fa9d3b8be23d02f Eddie James 2023-08-09  204  			};
fa9d3b8be23d02f Eddie James 2023-08-09  205  
fa9d3b8be23d02f Eddie James 2023-08-09  206  			cfam1_i2c10: i2c-bus@a {
fa9d3b8be23d02f Eddie James 2023-08-09  207  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  208  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  209  				reg = <10>;	/* OP3A */
fa9d3b8be23d02f Eddie James 2023-08-09  210  			};
fa9d3b8be23d02f Eddie James 2023-08-09  211  
fa9d3b8be23d02f Eddie James 2023-08-09  212  			cfam1_i2c11: i2c-bus@b {
fa9d3b8be23d02f Eddie James 2023-08-09  213  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  214  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  215  				reg = <11>;	/* OP3B */
fa9d3b8be23d02f Eddie James 2023-08-09  216  			};
fa9d3b8be23d02f Eddie James 2023-08-09  217  
fa9d3b8be23d02f Eddie James 2023-08-09  218  			cfam1_i2c14: i2c-bus@e {
fa9d3b8be23d02f Eddie James 2023-08-09  219  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  220  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  221  				reg = <14>;	/* OP5A */
fa9d3b8be23d02f Eddie James 2023-08-09  222  			};
fa9d3b8be23d02f Eddie James 2023-08-09  223  
fa9d3b8be23d02f Eddie James 2023-08-09  224  			cfam1_i2c15: i2c-bus@f {
fa9d3b8be23d02f Eddie James 2023-08-09  225  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  226  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  227  				reg = <15>;	/* OP5B */
fa9d3b8be23d02f Eddie James 2023-08-09  228  			};
fa9d3b8be23d02f Eddie James 2023-08-09  229  
fa9d3b8be23d02f Eddie James 2023-08-09  230  			cfam1_i2c16: i2c-bus@10 {
fa9d3b8be23d02f Eddie James 2023-08-09  231  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  232  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  233  				reg = <16>;	/* OP6A */
fa9d3b8be23d02f Eddie James 2023-08-09  234  			};
fa9d3b8be23d02f Eddie James 2023-08-09  235  
fa9d3b8be23d02f Eddie James 2023-08-09  236  			cfam1_i2c17: i2c-bus@11 {
fa9d3b8be23d02f Eddie James 2023-08-09  237  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  238  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  239  				reg = <17>;	/* OP6B */
fa9d3b8be23d02f Eddie James 2023-08-09  240  			};
fa9d3b8be23d02f Eddie James 2023-08-09  241  		};
fa9d3b8be23d02f Eddie James 2023-08-09  242  
fa9d3b8be23d02f Eddie James 2023-08-09  243  		fsi2spi@1c00 {
fa9d3b8be23d02f Eddie James 2023-08-09  244  			compatible = "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09  245  			reg = <0x1c00 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  246  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  247  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  248  
fa9d3b8be23d02f Eddie James 2023-08-09  249  			cfam1_spi0: spi@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  250  				reg = <0x0>;
fa9d3b8be23d02f Eddie James 2023-08-09  251  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  252  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  253  
fa9d3b8be23d02f Eddie James 2023-08-09  254  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  255  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  256  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  257  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  258  
fa9d3b8be23d02f Eddie James 2023-08-09  259  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  260  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  261  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  262  				};
fa9d3b8be23d02f Eddie James 2023-08-09  263  			};
fa9d3b8be23d02f Eddie James 2023-08-09  264  
fa9d3b8be23d02f Eddie James 2023-08-09  265  			cfam1_spi1: spi@20 {
fa9d3b8be23d02f Eddie James 2023-08-09  266  				reg = <0x20>;
fa9d3b8be23d02f Eddie James 2023-08-09  267  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  268  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  269  
fa9d3b8be23d02f Eddie James 2023-08-09  270  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  271  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  272  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  273  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  274  
fa9d3b8be23d02f Eddie James 2023-08-09  275  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  276  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  277  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  278  				};
fa9d3b8be23d02f Eddie James 2023-08-09  279  			};
fa9d3b8be23d02f Eddie James 2023-08-09  280  
fa9d3b8be23d02f Eddie James 2023-08-09  281  			cfam1_spi2: spi@40 {
fa9d3b8be23d02f Eddie James 2023-08-09  282  				reg = <0x40>;
fa9d3b8be23d02f Eddie James 2023-08-09  283  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09  284  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  285  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  286  
fa9d3b8be23d02f Eddie James 2023-08-09  287  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  288  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  289  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  290  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  291  
fa9d3b8be23d02f Eddie James 2023-08-09  292  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  293  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  294  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  295  				};
fa9d3b8be23d02f Eddie James 2023-08-09  296  			};
fa9d3b8be23d02f Eddie James 2023-08-09  297  
fa9d3b8be23d02f Eddie James 2023-08-09  298  			cfam1_spi3: spi@60 {
fa9d3b8be23d02f Eddie James 2023-08-09  299  				reg = <0x60>;
fa9d3b8be23d02f Eddie James 2023-08-09  300  				compatible =  "ibm,fsi2spi";
fa9d3b8be23d02f Eddie James 2023-08-09  301  				#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  302  				#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  303  
fa9d3b8be23d02f Eddie James 2023-08-09  304  				eeprom@0 {
fa9d3b8be23d02f Eddie James 2023-08-09  305  					at25,byte-len = <0x80000>;
fa9d3b8be23d02f Eddie James 2023-08-09  306  					at25,addr-mode = <4>;
fa9d3b8be23d02f Eddie James 2023-08-09  307  					at25,page-size = <256>;
fa9d3b8be23d02f Eddie James 2023-08-09  308  
fa9d3b8be23d02f Eddie James 2023-08-09  309  					compatible = "atmel,at25";
fa9d3b8be23d02f Eddie James 2023-08-09  310  					reg = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  311  					spi-max-frequency = <1000000>;
fa9d3b8be23d02f Eddie James 2023-08-09  312  				};
fa9d3b8be23d02f Eddie James 2023-08-09  313  			};
fa9d3b8be23d02f Eddie James 2023-08-09  314  		};
fa9d3b8be23d02f Eddie James 2023-08-09  315  
fa9d3b8be23d02f Eddie James 2023-08-09  316  		sbefifo@2400 {
fa9d3b8be23d02f Eddie James 2023-08-09  317  			compatible = "ibm,p9-sbefifo";
fa9d3b8be23d02f Eddie James 2023-08-09  318  			reg = <0x2400 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  319  			#address-cells = <1>;
fa9d3b8be23d02f Eddie James 2023-08-09  320  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  321  
fa9d3b8be23d02f Eddie James 2023-08-09 @322  			fsi_occ1: occ {
fa9d3b8be23d02f Eddie James 2023-08-09  323  				compatible = "ibm,p10-occ";
fa9d3b8be23d02f Eddie James 2023-08-09  324  
fa9d3b8be23d02f Eddie James 2023-08-09  325  				occ-hwmon {
fa9d3b8be23d02f Eddie James 2023-08-09  326  					compatible = "ibm,p10-occ-hwmon";
fa9d3b8be23d02f Eddie James 2023-08-09  327  					ibm,no-poll-on-init;
fa9d3b8be23d02f Eddie James 2023-08-09  328  				};
fa9d3b8be23d02f Eddie James 2023-08-09  329  			};
fa9d3b8be23d02f Eddie James 2023-08-09  330  		};
fa9d3b8be23d02f Eddie James 2023-08-09  331  
fa9d3b8be23d02f Eddie James 2023-08-09  332  		fsi_hub1: hub@3400 {
fa9d3b8be23d02f Eddie James 2023-08-09  333  			compatible = "fsi-master-hub";
fa9d3b8be23d02f Eddie James 2023-08-09  334  			reg = <0x3400 0x400>;
fa9d3b8be23d02f Eddie James 2023-08-09  335  			#address-cells = <2>;
fa9d3b8be23d02f Eddie James 2023-08-09  336  			#size-cells = <0>;
fa9d3b8be23d02f Eddie James 2023-08-09  337  
fa9d3b8be23d02f Eddie James 2023-08-09  338  			no-scan-on-init;
fa9d3b8be23d02f Eddie James 2023-08-09  339  		};
fa9d3b8be23d02f Eddie James 2023-08-09  340  	};
fa9d3b8be23d02f Eddie James 2023-08-09  341  };
fa9d3b8be23d02f Eddie James 2023-08-09  342  

:::::: The code at line 157 was first introduced by commit
:::::: fa9d3b8be23d02f22f7476c2df2c7aa6e67fb115 ARM: dts: aspeed: Add P10 FSI descriptions

:::::: TO: Eddie James <eajames@linux.ibm.com>
:::::: CC: Joel Stanley <joel@jms.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
