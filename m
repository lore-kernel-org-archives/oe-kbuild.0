Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727745023
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720870759; cv=none; b=gHqb/Ju4h+enyW/Itgoc8RBHLen7C/NPR9m6U0o8ojwLAnIO2/6lXTXJK1di4qHX1iRE7WullG5TtdyQ0nfwMUf6ZzfK69ug705DqWHNDyHwMBCF5K6/mOoftlD2Fm6NjHnDx7wJ6Ly1aWqUdsnpknDqOZ060I6niF3koOaNspY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720870759; c=relaxed/simple;
	bh=B2MwSLkXUmWLLQQkICCnqPZ5vQjriHn6pccso76532Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9hDnGRwwiDC1l1rroKqDmRu4ZCZhWSj0gZMFpzTG7CNG9YsnkASX3/NuJnbjhA5E27uRFASEgFOBtMdbi/NXk+Xg33h71VRbHVHpPD4G1a8UfYmUkxGMcxxGJcTsq0+973lDe30uygfcwL84hzV8dOhbL6t0fHqmVArhlkpekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBfG/zCD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBfG/zCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720870757; x=1752406757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2MwSLkXUmWLLQQkICCnqPZ5vQjriHn6pccso76532Y=;
  b=fBfG/zCDf2VtFyFEUS/gU+oSrXim3PeQ7dtVKzI0dUjlCVZrqcL5gFET
   9VKgyDub01T/iGF+pqE99mhEEKEPlY/ni/565e/+QEMz7YDumSrzECA5o
   uH0gnrrtowj8Yf7uhJoWuj5vdcT3/4m73OxPsgUu2dVhykTej1ddxM+qq
   5NOLVGMX7RJyhcXU5O6QA7TYMPIb18TK3g7K5Zvef2eOXIcWE/t6Pj9M9
   PnzX+WM3U63CoRgb5IlPLMRpBtRpDjBHx9uiWHe6Red77+RtULgJYOoe0
   u9nzgmfucXS8p7qXxGvZduEKKLnfSU7I3mIpVIdJrsg/6x8EC2IxEjXHj
   Q==;
X-CSE-ConnectionGUID: iPH3RNw3Siau4FdMNtxfgA==
X-CSE-MsgGUID: BXsrfrrfTHORq+S4iQit9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28985497"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="28985497"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 04:39:16 -0700
X-CSE-ConnectionGUID: vACYqPvJTIevGpwEnl9HMw==
X-CSE-MsgGUID: ZoDNPyKuS4SA9RHPBr5Edw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="86665985"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jul 2024 04:36:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSb31-000c1K-00;
	Sat, 13 Jul 2024 11:36:15 +0000
Date: Sat, 13 Jul 2024 19:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-5.15 14/14]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:57.35-61.6: Warning
 (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <202407131951.OB2QHc8z-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9982b53bf389c6dfe6a73336380c64f5d0dd41d6
commit: 9982b53bf389c6dfe6a73336380c64f5d0dd41d6 [14/14] CHROMIUM: arm64: dts: mt8186-wugtrio: Add thermal limitation for pmic-ntc
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131951.OB2QHc8z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131951.OB2QHc8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131951.OB2QHc8z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1510.24-1512.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/data1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1514.26-1516.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/data1-1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1518.27-1520.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/calib: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1522.27-1525.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:431.16-437.4: Warning (unit_address_vs_reg): /soc/mali@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:439.16-442.4: Warning (unit_address_vs_reg): /soc/mali@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2184.30-2188.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2190.23-2194.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2196.35-2200.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:57.35-61.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:63.31-67.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:69.35-73.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/pmic-ntc-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:81.37-86.4: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:88.34-93.4: Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1006.35-1011.5: Warning (simple_bus_reg): /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1013.35-1018.5: Warning (simple_bus_reg): /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1907.23-1929.5: Warning (simple_bus_reg): /soc/venc@17000000: simple-bus unit address format error, expected "17020000"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2053.30-2174.5: Warning (simple_bus_reg): /soc/opp-table-3: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2176.32-2293.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:43.28-118.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@1100f000/it6505dptx@5c: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +57 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi

8aa0b3ed2564db lvzhaoxiong  2024-04-01   48  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   49  &thermal_zones {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   50  	tboard2 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   51  		polling-delay = <1000>; /* milliseconds */
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   52  		polling-delay-passive = <50>; /* milliseconds */
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   53  		thermal-sensors = <&tboard_thermistor2>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   54  		sustainable-power = <1000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   55  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   56  		trips {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @57  			pmic_temp_alert0: trip-point@0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   58  				temperature = <50000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   59  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   60  				type = "passive";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   61  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   62  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @63  			pmic_temp_alert1: target@1 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   64  				temperature = <60000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   65  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   66  				type = "passive";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   67  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   68  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @69  			pmic_ntc_crit: pmic-ntc-crit@0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   70  				temperature = <80000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   71  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   72  				type = "critical";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   73  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   74  		};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   75  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   76  		cooling-maps {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   77  			map0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   78  				trip = <&pmic_temp_alert1>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   79  				cooling-device = <&cpu0
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   80  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   81  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   82  						<&cpu1
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   83  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   84  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   85  						<&cpu2
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   86  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   87  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   88  						<&cpu3
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   89  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   90  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   91  						<&cpu4
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   92  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   93  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   94  						<&cpu5
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   95  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   96  					THERMAL_NO_LIMIT>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   97  				contribution = <4096>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   98  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   99  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  100  			map1 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  101  				trip = <&pmic_temp_alert1>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  102  				cooling-device = <&cpu6
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  103  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  104  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  105  						<&cpu7
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  106  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  107  					THERMAL_NO_LIMIT>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  108  				contribution = <1024>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  109  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  110  		};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  111  	};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  112  };
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
