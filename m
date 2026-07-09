Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBB1385D61
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783620442; cv=none; b=JJ8Xe+JXSLS33Y8UruM7JX11UH4MGuZkSHuBbnN70wd9fqWdv62wOe8eLeyZ5EQ+ymwBeutMqnxBHnuLUNt2ZEWPLZOf9Wc3E/a2KcMG7v7ioWgp69vKJOaas/bjCJWeFIr2HsgXsdBkEgh847/Yz66LQy+WsiWMSc5nb+RSXUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783620442; c=relaxed/simple;
	bh=VXKLP3aNTEZwiueTu2cQ95EvR+kQW3nekKfy0jv7OPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UBRkxG2hvOv/qXuP6Y+tN2+JmP9vkQKHQzuOwBcz9b+gC2taxkJWWS4joqOVdhVQ7+ede2CXI8coEvzKTwhrv7eKRFRBinN9j7nfCPfrd0z+10ZIkXuSay+Iqtl8EmwxseWKgOngB6fwOOW1NXY3GY9GCe6I50Xgwc5hMYXNtJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpUHJNA1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpUHJNA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783620440; x=1815156440;
  h=date:from:to:cc:subject:message-id;
  bh=VXKLP3aNTEZwiueTu2cQ95EvR+kQW3nekKfy0jv7OPk=;
  b=SpUHJNA179+lelRtj5FfclU4ImrMV9wrjzihYtlwHF4FyJ2P7hx7L7M+
   TdDcvEMfaxpBujDJTQSfoCFRvtfXxTqVlhxYlvPa3u5TmXRCnKf8L83Qu
   BYXMDmSWbmvPexs2mseZxOZzYdxKKE7HOp2WMkJyhOw2IztNHjoH1KJAY
   8jRQngYDtPNN6odwXCaaIT9/BeHCpG4i0Kb2RVurvwOQ06hxGZzSDabqo
   Wcx53NlJs7WRotjXNqOoMwXtLbsFL+7Aof7u56YrCE7z0Aq1Ufo1PSKC4
   mrMa9Q+l340oQUKSAX2G2hYYUeiH9ZfZ3b6fY0m6cJEAL1cVhEzPrcWW0
   w==;
X-CSE-ConnectionGUID: juCWHid/T1S3gErjQoQ4iQ==
X-CSE-MsgGUID: d2KAJiMZTgu2Xj2tfE4icA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84366940"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84366940"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 11:07:19 -0700
X-CSE-ConnectionGUID: +PoKkfG6RUSQUfGRHBDiBw==
X-CSE-MsgGUID: 65FzUXFBQFKIhVZ9iZNPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250248645"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2026 11:07:16 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wht9W-0000000031N-0yHS;
	Thu, 09 Jul 2026 18:07:14 +0000
Date: Thu, 09 Jul 2026 20:07:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Documentation/devicetree/bindings/arm/apple.yaml:379:13:
 [warning] wrong indentation: expected 14 but found 12 (indentation)
Message-ID: <202607092023.2d84Bl6O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>
CC: 0day robot <lkp@intel.com>
CC: linux-doc@vger.kernel.org

tree:   https://github.com/intel-lab-lkp/linux/commits/Janne-Grunau/dt-bindings-arm-apple-Add-M3-Pro-Max-Ultra-devices-T603x/20260709-193712
head:   ae04445e526a3d7539967f93745ef1bbaf9dd3bb
commit: b0fc6e5d9d30acf1e1ad3008cf69f0df219cc3a7 dt-bindings: arm: apple: Add M3 Pro/Max/Ultra devices (T603x)
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arc-randconfig-2052-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092023.2d84Bl6O-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092023.2d84Bl6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607092023.2d84Bl6O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/apple.yaml:379:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
   Documentation/devicetree/bindings/arm/apple.yaml:387:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
   Documentation/devicetree/bindings/arm/apple.yaml:388:15: [warning] wrong indentation: expected 16 but found 14 (indentation)
   Documentation/devicetree/bindings/arm/apple.yaml:393:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
   Documentation/devicetree/bindings/arm/apple.yaml:394:15: [warning] wrong indentation: expected 16 but found 14 (indentation)

vim +379 Documentation/devicetree/bindings/arm/apple.yaml

007bd42364b5b6 Hector Martin 2021-02-05    8  
007bd42364b5b6 Hector Martin 2021-02-05    9  maintainers:
007bd42364b5b6 Hector Martin 2021-02-05   10    - Hector Martin <marcan@marcan.st>
007bd42364b5b6 Hector Martin 2021-02-05   11  
007bd42364b5b6 Hector Martin 2021-02-05   12  description: |
007bd42364b5b6 Hector Martin 2021-02-05   13    ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
007bd42364b5b6 Hector Martin 2021-02-05   14  
f30ce10e9a49f2 Nick Chan     2024-10-23   15    This currently includes devices based on the "A7" SoC:
f30ce10e9a49f2 Nick Chan     2024-10-23   16  
f30ce10e9a49f2 Nick Chan     2024-10-23   17    - iPhone 5s
f30ce10e9a49f2 Nick Chan     2024-10-23   18    - iPad Air (1)
f30ce10e9a49f2 Nick Chan     2024-10-23   19    - iPad mini 2
f30ce10e9a49f2 Nick Chan     2024-10-23   20    - iPad mini 3
f30ce10e9a49f2 Nick Chan     2024-10-23   21  
474952a48a6fcf Nick Chan     2024-10-23   22    Devices based on the "A8" SoC:
474952a48a6fcf Nick Chan     2024-10-23   23  
474952a48a6fcf Nick Chan     2024-10-23   24    - iPhone 6
474952a48a6fcf Nick Chan     2024-10-23   25    - iPhone 6 Plus
474952a48a6fcf Nick Chan     2024-10-23   26    - iPad mini 4
474952a48a6fcf Nick Chan     2024-10-23   27    - iPod touch 6
474952a48a6fcf Nick Chan     2024-10-23   28    - Apple TV HD
474952a48a6fcf Nick Chan     2024-10-23   29  
bce8129bd91f7a Nick Chan     2024-10-23   30    Device based on the "A8X" SoC:
bce8129bd91f7a Nick Chan     2024-10-23   31  
bce8129bd91f7a Nick Chan     2024-10-23   32    - iPad Air 2
bce8129bd91f7a Nick Chan     2024-10-23   33  
51cec658c307ce Nick Chan     2024-10-23   34    Devices based on the "A9" SoC:
51cec658c307ce Nick Chan     2024-10-23   35  
51cec658c307ce Nick Chan     2024-10-23   36    - iPhone 6s
51cec658c307ce Nick Chan     2024-10-23   37    - iPhone 6s Plus
51cec658c307ce Nick Chan     2024-10-23   38    - iPhone SE (2016)
51cec658c307ce Nick Chan     2024-10-23   39    - iPad 5
51cec658c307ce Nick Chan     2024-10-23   40  
bef712e3c109b6 Nick Chan     2024-10-23   41    Devices based on the "A9X" SoC:
bef712e3c109b6 Nick Chan     2024-10-23   42  
bef712e3c109b6 Nick Chan     2024-10-23   43    - iPad Pro (9.7-inch)
bef712e3c109b6 Nick Chan     2024-10-23   44    - iPad Pro (12.9-inch)
bef712e3c109b6 Nick Chan     2024-10-23   45  
179626edeafe36 Nick Chan     2024-10-23   46    Devices based on the "A10" SoC:
179626edeafe36 Nick Chan     2024-10-23   47  
179626edeafe36 Nick Chan     2024-10-23   48    - iPhone 7
179626edeafe36 Nick Chan     2024-10-23   49    - iPhone 7 Plus
179626edeafe36 Nick Chan     2024-10-23   50    - iPod touch 7
179626edeafe36 Nick Chan     2024-10-23   51    - iPad 6
179626edeafe36 Nick Chan     2024-10-23   52    - iPad 7
179626edeafe36 Nick Chan     2024-10-23   53  
1600498764824f Nick Chan     2024-10-23   54    Devices based on the "A10X" SoC:
1600498764824f Nick Chan     2024-10-23   55  
1600498764824f Nick Chan     2024-10-23   56    - Apple TV 4K (1st generation)
1600498764824f Nick Chan     2024-10-23   57    - iPad Pro (2nd Generation) (10.5 Inch)
1600498764824f Nick Chan     2024-10-23   58    - iPad Pro (2nd Generation) (12.9 Inch)
1600498764824f Nick Chan     2024-10-23   59  
007c9b75f7e34d Nick Chan     2025-02-03   60    Devices based on the "T2" SoC:
007c9b75f7e34d Nick Chan     2025-02-03   61  
007c9b75f7e34d Nick Chan     2025-02-03   62    - Apple T2 MacBookPro15,2 (j132)
007c9b75f7e34d Nick Chan     2025-02-03   63    - Apple T2 iMacPro1,1 (j137)
007c9b75f7e34d Nick Chan     2025-02-03   64    - Apple T2 MacBookAir8,2 (j140a)
007c9b75f7e34d Nick Chan     2025-02-03   65    - Apple T2 MacBookAir8,1 (j140k)
007c9b75f7e34d Nick Chan     2025-02-03   66    - Apple T2 MacBookPro16,1 (j152f)
007c9b75f7e34d Nick Chan     2025-02-03   67    - Apple T2 MacPro7,1 (j160)
007c9b75f7e34d Nick Chan     2025-02-03   68    - Apple T2 Macmini8,1 (j174)
007c9b75f7e34d Nick Chan     2025-02-03   69    - Apple T2 iMac20,1 (j185)
007c9b75f7e34d Nick Chan     2025-02-03   70    - Apple T2 iMac20,2 (j185f)
007c9b75f7e34d Nick Chan     2025-02-03   71    - Apple T2 MacBookPro15,4 (j213)
007c9b75f7e34d Nick Chan     2025-02-03   72    - Apple T2 MacBookPro16,2 (j214k)
007c9b75f7e34d Nick Chan     2025-02-03   73    - Apple T2 MacBookPro16,4 (j215)
007c9b75f7e34d Nick Chan     2025-02-03   74    - Apple T2 MacBookPro16,3 (j223)
007c9b75f7e34d Nick Chan     2025-02-03   75    - Apple T2 MacBookAir9,1 (j230k)
007c9b75f7e34d Nick Chan     2025-02-03   76    - Apple T2 MacBookPro15,1 (j680)
007c9b75f7e34d Nick Chan     2025-02-03   77    - Apple T2 MacBookPro15,3 (j780)
007c9b75f7e34d Nick Chan     2025-02-03   78  
cc35d5bc24cc47 Nick Chan     2024-10-23   79    Devices based on the "A11" SoC:
cc35d5bc24cc47 Nick Chan     2024-10-23   80  
cc35d5bc24cc47 Nick Chan     2024-10-23   81    - iPhone 8
cc35d5bc24cc47 Nick Chan     2024-10-23   82    - iPhone 8 Plus
cc35d5bc24cc47 Nick Chan     2024-10-23   83    - iPhone X
cc35d5bc24cc47 Nick Chan     2024-10-23   84  
f30ce10e9a49f2 Nick Chan     2024-10-23   85    Devices based on the "M1" SoC:
007bd42364b5b6 Hector Martin 2021-02-05   86  
007bd42364b5b6 Hector Martin 2021-02-05   87    - Mac mini (M1, 2020)
007bd42364b5b6 Hector Martin 2021-02-05   88    - MacBook Pro (13-inch, M1, 2020)
007bd42364b5b6 Hector Martin 2021-02-05   89    - MacBook Air (M1, 2020)
ad1569476e7644 Janne Grunau  2021-11-23   90    - iMac (24-inch, M1, 2021)
007bd42364b5b6 Hector Martin 2021-02-05   91  
828fe6b6245bd9 Janne Grunau  2023-03-07   92    Devices based on the "M2" SoC:
828fe6b6245bd9 Janne Grunau  2023-03-07   93  
828fe6b6245bd9 Janne Grunau  2023-03-07   94    - MacBook Air (M2, 2022)
efad8eaf6f2f00 Janne Grunau  2025-08-23   95    - MacBook Air (15-inch, M2, 2023)
828fe6b6245bd9 Janne Grunau  2023-03-07   96    - MacBook Pro (13-inch, M2, 2022)
828fe6b6245bd9 Janne Grunau  2023-03-07   97    - Mac mini (M2, 2023)
828fe6b6245bd9 Janne Grunau  2023-03-07   98  
01f38c14423eef Janne Grunau  2026-05-07   99    Devices based on the "M3" SoC:
01f38c14423eef Janne Grunau  2026-05-07  100  
01f38c14423eef Janne Grunau  2026-05-07  101    - MacBook Air (13-inch, M3, 2024)
01f38c14423eef Janne Grunau  2026-05-07  102    - MacBook Air (15-inch, M3, 2024)
01f38c14423eef Janne Grunau  2026-05-07  103    - MacBook Pro (14-inch, M3, 2023)
01f38c14423eef Janne Grunau  2026-05-07  104    - iMac (24-inch, M3, 2023)
01f38c14423eef Janne Grunau  2026-05-07  105  
28f94ed138c347 Janne Grunau  2025-09-14  106    Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
e15b8c8563983c Hector Martin 2021-12-09  107  
e15b8c8563983c Hector Martin 2021-12-09  108    - MacBook Pro (14-inch, M1 Pro, 2021)
e15b8c8563983c Hector Martin 2021-12-09  109    - MacBook Pro (14-inch, M1 Max, 2021)
e15b8c8563983c Hector Martin 2021-12-09  110    - MacBook Pro (16-inch, M1 Pro, 2021)
e15b8c8563983c Hector Martin 2021-12-09  111    - MacBook Pro (16-inch, M1 Max, 2021)
a450fc9a43799f Janne Grunau  2022-09-16  112    - Mac Studio (M1 Max, 2022)
a450fc9a43799f Janne Grunau  2022-09-16  113    - Mac Studio (M1 Ultra, 2022)
e15b8c8563983c Hector Martin 2021-12-09  114  
28f94ed138c347 Janne Grunau  2025-09-14  115    Devices based on the "M2 Pro", "M2 Max" and "M2 Ultra" SoCs:
28f94ed138c347 Janne Grunau  2025-09-14  116  
28f94ed138c347 Janne Grunau  2025-09-14  117    - MacBook Pro (14-inch, M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  118    - MacBook Pro (14-inch, M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  119    - MacBook Pro (16-inch, M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  120    - MacBook Pro (16-inch, M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  121    - Mac mini (M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  122    - Mac Studio (M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  123    - Mac Studio (M2 Ultra, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  124    - Mac Pro (M2 Ultra, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  125  
b0fc6e5d9d30ac Janne Grunau  2026-07-09  126    Devices based on the "M3 Pro", "M3 Max" and "M3 Ultra" SoCs:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  127  
b0fc6e5d9d30ac Janne Grunau  2026-07-09  128    - MacBook Pro (14-inch, M3 Pro, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  129    - MacBook Pro (14-inch, M3 Max, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  130    - MacBook Pro (16-inch, M3 Pro, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  131    - MacBook Pro (16-inch, M3 Max, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  132    - Mac Studio (M3 Ultra, 2025)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  133  
007bd42364b5b6 Hector Martin 2021-02-05  134    The compatible property should follow this format:
007bd42364b5b6 Hector Martin 2021-02-05  135  
007bd42364b5b6 Hector Martin 2021-02-05  136    compatible = "apple,<targettype>", "apple,<socid>", "apple,arm-platform";
007bd42364b5b6 Hector Martin 2021-02-05  137  
007bd42364b5b6 Hector Martin 2021-02-05  138    <targettype> represents the board/device and comes from the `target-type`
007bd42364b5b6 Hector Martin 2021-02-05  139    property of the root node of the Apple Device Tree, lowercased. It can be
007bd42364b5b6 Hector Martin 2021-02-05  140    queried on macOS using the following command:
007bd42364b5b6 Hector Martin 2021-02-05  141  
007bd42364b5b6 Hector Martin 2021-02-05  142    $ ioreg -d2 -l | grep target-type
007bd42364b5b6 Hector Martin 2021-02-05  143  
007bd42364b5b6 Hector Martin 2021-02-05  144    <socid> is the lowercased SoC ID. Apple uses at least *five* different
007bd42364b5b6 Hector Martin 2021-02-05  145    names for their SoCs:
007bd42364b5b6 Hector Martin 2021-02-05  146  
007bd42364b5b6 Hector Martin 2021-02-05  147    - Marketing name ("M1")
007bd42364b5b6 Hector Martin 2021-02-05  148    - Internal name ("H13G")
007bd42364b5b6 Hector Martin 2021-02-05  149    - Codename ("Tonga")
007bd42364b5b6 Hector Martin 2021-02-05  150    - SoC ID ("T8103")
007bd42364b5b6 Hector Martin 2021-02-05  151    - Package/IC part number ("APL1102")
007bd42364b5b6 Hector Martin 2021-02-05  152  
007bd42364b5b6 Hector Martin 2021-02-05  153    Devicetrees should use the lowercased SoC ID, to avoid confusion if
007bd42364b5b6 Hector Martin 2021-02-05  154    multiple SoCs share the same marketing name. This can be obtained from
007bd42364b5b6 Hector Martin 2021-02-05  155    the `compatible` property of the arm-io node of the Apple Device Tree,
007bd42364b5b6 Hector Martin 2021-02-05  156    which can be queried as follows on macOS:
007bd42364b5b6 Hector Martin 2021-02-05  157  
007bd42364b5b6 Hector Martin 2021-02-05  158    $ ioreg -n arm-io | grep compatible
007bd42364b5b6 Hector Martin 2021-02-05  159  
007bd42364b5b6 Hector Martin 2021-02-05  160  properties:
007bd42364b5b6 Hector Martin 2021-02-05  161    $nodename:
007bd42364b5b6 Hector Martin 2021-02-05  162      const: "/"
007bd42364b5b6 Hector Martin 2021-02-05  163    compatible:
007bd42364b5b6 Hector Martin 2021-02-05  164      oneOf:
f30ce10e9a49f2 Nick Chan     2024-10-23  165        - description: Apple A7 SoC based platforms
f30ce10e9a49f2 Nick Chan     2024-10-23  166          items:
f30ce10e9a49f2 Nick Chan     2024-10-23  167            - enum:
f30ce10e9a49f2 Nick Chan     2024-10-23  168                - apple,j71  # iPad Air (Wi-Fi)
f30ce10e9a49f2 Nick Chan     2024-10-23  169                - apple,j72  # iPad Air (Cellular)
f30ce10e9a49f2 Nick Chan     2024-10-23  170                - apple,j73  # iPad Air (Cellular, China)
f30ce10e9a49f2 Nick Chan     2024-10-23  171                - apple,j85  # iPad mini 2 (Wi-Fi)
f30ce10e9a49f2 Nick Chan     2024-10-23  172                - apple,j85m # iPad mini 3 (Wi-Fi)
f30ce10e9a49f2 Nick Chan     2024-10-23  173                - apple,j86  # iPad mini 2 (Cellular)
f30ce10e9a49f2 Nick Chan     2024-10-23  174                - apple,j86m # iPad mini 3 (Cellular)
f30ce10e9a49f2 Nick Chan     2024-10-23  175                - apple,j87  # iPad mini 2 (Cellular, China)
f30ce10e9a49f2 Nick Chan     2024-10-23  176                - apple,j87m # iPad mini 3 (Cellular, China)
f30ce10e9a49f2 Nick Chan     2024-10-23  177                - apple,n51  # iPhone 5s (GSM)
f30ce10e9a49f2 Nick Chan     2024-10-23  178                - apple,n53  # iPhone 5s (LTE)
f30ce10e9a49f2 Nick Chan     2024-10-23  179            - const: apple,s5l8960x
f30ce10e9a49f2 Nick Chan     2024-10-23  180            - const: apple,arm-platform
f30ce10e9a49f2 Nick Chan     2024-10-23  181  
474952a48a6fcf Nick Chan     2024-10-23  182        - description: Apple A8 SoC based platforms
474952a48a6fcf Nick Chan     2024-10-23  183          items:
474952a48a6fcf Nick Chan     2024-10-23  184            - enum:
474952a48a6fcf Nick Chan     2024-10-23  185                - apple,j42d # Apple TV HD
474952a48a6fcf Nick Chan     2024-10-23  186                - apple,j96  # iPad mini 4 (Wi-Fi)
474952a48a6fcf Nick Chan     2024-10-23  187                - apple,j97  # iPad mini 4 (Cellular)
474952a48a6fcf Nick Chan     2024-10-23  188                - apple,n56  # iPhone 6 Plus
474952a48a6fcf Nick Chan     2024-10-23  189                - apple,n61  # iPhone 6
474952a48a6fcf Nick Chan     2024-10-23  190                - apple,n102 # iPod touch 6
474952a48a6fcf Nick Chan     2024-10-23  191            - const: apple,t7000
474952a48a6fcf Nick Chan     2024-10-23  192            - const: apple,arm-platform
474952a48a6fcf Nick Chan     2024-10-23  193  
bce8129bd91f7a Nick Chan     2024-10-23  194        - description: Apple A8X SoC based platforms
bce8129bd91f7a Nick Chan     2024-10-23  195          items:
bce8129bd91f7a Nick Chan     2024-10-23  196            - enum:
bce8129bd91f7a Nick Chan     2024-10-23  197                - apple,j81 # iPad Air 2 (Wi-Fi)
bce8129bd91f7a Nick Chan     2024-10-23  198                - apple,j82 # iPad Air 2 (Cellular)
bce8129bd91f7a Nick Chan     2024-10-23  199            - const: apple,t7001
bce8129bd91f7a Nick Chan     2024-10-23  200            - const: apple,arm-platform
bce8129bd91f7a Nick Chan     2024-10-23  201  
51cec658c307ce Nick Chan     2024-10-23  202        - description: Apple Samsung A9 SoC based platforms
51cec658c307ce Nick Chan     2024-10-23  203          items:
51cec658c307ce Nick Chan     2024-10-23  204            - enum:
51cec658c307ce Nick Chan     2024-10-23  205                - apple,j71s # iPad 5 (Wi-Fi) (S8000)
51cec658c307ce Nick Chan     2024-10-23  206                - apple,j72s # iPad 5 (Cellular) (S8000)
51cec658c307ce Nick Chan     2024-10-23  207                - apple,n66  # iPhone 6s Plus (S8000)
51cec658c307ce Nick Chan     2024-10-23  208                - apple,n69u # iPhone SE (S8000)
51cec658c307ce Nick Chan     2024-10-23  209                - apple,n71  # iPhone 6S (S8000)
51cec658c307ce Nick Chan     2024-10-23  210            - const: apple,s8000
51cec658c307ce Nick Chan     2024-10-23  211            - const: apple,arm-platform
51cec658c307ce Nick Chan     2024-10-23  212  
51cec658c307ce Nick Chan     2024-10-23  213        - description: Apple TSMC A9 SoC based platforms
51cec658c307ce Nick Chan     2024-10-23  214          items:
51cec658c307ce Nick Chan     2024-10-23  215            - enum:
51cec658c307ce Nick Chan     2024-10-23  216                - apple,j71t # iPad 5 (Wi-Fi) (S8003)
51cec658c307ce Nick Chan     2024-10-23  217                - apple,j72t # iPad 5 (Cellular) (S8003)
51cec658c307ce Nick Chan     2024-10-23  218                - apple,n66m # iPhone 6s Plus (S8003)
51cec658c307ce Nick Chan     2024-10-23  219                - apple,n69  # iPhone SE (S8003)
51cec658c307ce Nick Chan     2024-10-23  220                - apple,n71m # iPhone 6S (S8003)
51cec658c307ce Nick Chan     2024-10-23  221            - const: apple,s8003
51cec658c307ce Nick Chan     2024-10-23  222            - const: apple,arm-platform
51cec658c307ce Nick Chan     2024-10-23  223  
bef712e3c109b6 Nick Chan     2024-10-23  224        - description: Apple A9X SoC based platforms
bef712e3c109b6 Nick Chan     2024-10-23  225          items:
bef712e3c109b6 Nick Chan     2024-10-23  226            - enum:
bef712e3c109b6 Nick Chan     2024-10-23  227                - apple,j127 # iPad Pro (9.7-inch) (Wi-Fi)
bef712e3c109b6 Nick Chan     2024-10-23  228                - apple,j128 # iPad Pro (9.7-inch) (Cellular)
bef712e3c109b6 Nick Chan     2024-10-23  229                - apple,j98a # iPad Pro (12.9-inch) (Wi-Fi)
bef712e3c109b6 Nick Chan     2024-10-23  230                - apple,j99a # iPad Pro (12.9-inch) (Cellular)
bef712e3c109b6 Nick Chan     2024-10-23  231            - const: apple,s8001
bef712e3c109b6 Nick Chan     2024-10-23  232            - const: apple,arm-platform
bef712e3c109b6 Nick Chan     2024-10-23  233  
179626edeafe36 Nick Chan     2024-10-23  234        - description: Apple A10 SoC based platforms
179626edeafe36 Nick Chan     2024-10-23  235          items:
179626edeafe36 Nick Chan     2024-10-23  236            - enum:
179626edeafe36 Nick Chan     2024-10-23  237                - apple,d10  # iPhone 7 (Qualcomm)
179626edeafe36 Nick Chan     2024-10-23  238                - apple,d11  # iPhone 7 (Intel)
179626edeafe36 Nick Chan     2024-10-23  239                - apple,d101 # iPhone 7 Plus (Qualcomm)
179626edeafe36 Nick Chan     2024-10-23  240                - apple,d111 # iPhone 7 Plus (Intel)
179626edeafe36 Nick Chan     2024-10-23  241                - apple,j71b # iPad 6 (Wi-Fi)
179626edeafe36 Nick Chan     2024-10-23  242                - apple,j72b # iPad 6 (Cellular)
179626edeafe36 Nick Chan     2024-10-23  243                - apple,j171 # iPad 7 (Wi-Fi)
179626edeafe36 Nick Chan     2024-10-23  244                - apple,j172 # iPad 7 (Cellular)
179626edeafe36 Nick Chan     2024-10-23  245                - apple,n112 # iPod touch 7
179626edeafe36 Nick Chan     2024-10-23  246            - const: apple,t8010
179626edeafe36 Nick Chan     2024-10-23  247            - const: apple,arm-platform
179626edeafe36 Nick Chan     2024-10-23  248  
1600498764824f Nick Chan     2024-10-23  249        - description: Apple A10X SoC based platforms
1600498764824f Nick Chan     2024-10-23  250          items:
1600498764824f Nick Chan     2024-10-23  251            - enum:
1600498764824f Nick Chan     2024-10-23  252                - apple,j105a # Apple TV 4K (1st Generation)
1600498764824f Nick Chan     2024-10-23  253                - apple,j120  # iPad Pro 2 (12.9-inch) (Wi-Fi)
1600498764824f Nick Chan     2024-10-23  254                - apple,j121  # iPad Pro 2 (12.9-inch) (Cellular)
1600498764824f Nick Chan     2024-10-23  255                - apple,j207  # iPad Pro 2 (10.5-inch) (Wi-Fi)
1600498764824f Nick Chan     2024-10-23  256                - apple,j208  # iPad Pro 2 (10.5-inch) (Cellular)
1600498764824f Nick Chan     2024-10-23  257            - const: apple,t8011
1600498764824f Nick Chan     2024-10-23  258            - const: apple,arm-platform
1600498764824f Nick Chan     2024-10-23  259  
007c9b75f7e34d Nick Chan     2025-02-03  260        - description: Apple T2 SoC based platforms
007c9b75f7e34d Nick Chan     2025-02-03  261          items:
007c9b75f7e34d Nick Chan     2025-02-03  262            - enum:
007c9b75f7e34d Nick Chan     2025-02-03  263                - apple,j132  # Apple T2 MacBookPro15,2 (j132)
007c9b75f7e34d Nick Chan     2025-02-03  264                - apple,j137  # Apple T2 iMacPro1,1 (j137)
007c9b75f7e34d Nick Chan     2025-02-03  265                - apple,j140a # Apple T2 MacBookAir8,2 (j140a)
007c9b75f7e34d Nick Chan     2025-02-03  266                - apple,j140k # Apple T2 MacBookAir8,1 (j140k)
007c9b75f7e34d Nick Chan     2025-02-03  267                - apple,j152f # Apple T2 MacBookPro16,1 (j152f)
007c9b75f7e34d Nick Chan     2025-02-03  268                - apple,j160  # Apple T2 MacPro7,1 (j160)
007c9b75f7e34d Nick Chan     2025-02-03  269                - apple,j174  # Apple T2 Macmini8,1 (j174)
007c9b75f7e34d Nick Chan     2025-02-03  270                - apple,j185  # Apple T2 iMac20,1 (j185)
007c9b75f7e34d Nick Chan     2025-02-03  271                - apple,j185f # Apple T2 iMac20,2 (j185f)
007c9b75f7e34d Nick Chan     2025-02-03  272                - apple,j213  # Apple T2 MacBookPro15,4 (j213)
007c9b75f7e34d Nick Chan     2025-02-03  273                - apple,j214k # Apple T2 MacBookPro16,2 (j214k)
007c9b75f7e34d Nick Chan     2025-02-03  274                - apple,j215  # Apple T2 MacBookPro16,4 (j215)
007c9b75f7e34d Nick Chan     2025-02-03  275                - apple,j223  # Apple T2 MacBookPro16,3 (j223)
007c9b75f7e34d Nick Chan     2025-02-03  276                - apple,j230k # Apple T2 MacBookAir9,1 (j230k)
007c9b75f7e34d Nick Chan     2025-02-03  277                - apple,j680  # Apple T2 MacBookPro15,1 (j680)
007c9b75f7e34d Nick Chan     2025-02-03  278                - apple,j780  # Apple T2 MacBookPro15,3 (j780)
007c9b75f7e34d Nick Chan     2025-02-03  279            - const: apple,t8012
007c9b75f7e34d Nick Chan     2025-02-03  280            - const: apple,arm-platform
007c9b75f7e34d Nick Chan     2025-02-03  281  
cc35d5bc24cc47 Nick Chan     2024-10-23  282        - description: Apple A11 SoC based platforms
cc35d5bc24cc47 Nick Chan     2024-10-23  283          items:
cc35d5bc24cc47 Nick Chan     2024-10-23  284            - enum:
cc35d5bc24cc47 Nick Chan     2024-10-23  285                - apple,d20  # iPhone 8 (Global)
cc35d5bc24cc47 Nick Chan     2024-10-23  286                - apple,d21  # iPhone 8 Plus (Global)
cc35d5bc24cc47 Nick Chan     2024-10-23  287                - apple,d22  # iPhone X (Global)
cc35d5bc24cc47 Nick Chan     2024-10-23  288                - apple,d201 # iPhone 8 (GSM)
cc35d5bc24cc47 Nick Chan     2024-10-23  289                - apple,d211 # iPhone 8 Plus (GSM)
cc35d5bc24cc47 Nick Chan     2024-10-23  290                - apple,d221 # iPhone X (GSM)
cc35d5bc24cc47 Nick Chan     2024-10-23  291            - const: apple,t8015
cc35d5bc24cc47 Nick Chan     2024-10-23  292            - const: apple,arm-platform
cc35d5bc24cc47 Nick Chan     2024-10-23  293  
007bd42364b5b6 Hector Martin 2021-02-05  294        - description: Apple M1 SoC based platforms
007bd42364b5b6 Hector Martin 2021-02-05  295          items:
007bd42364b5b6 Hector Martin 2021-02-05  296            - enum:
007bd42364b5b6 Hector Martin 2021-02-05  297                - apple,j274 # Mac mini (M1, 2020)
007bd42364b5b6 Hector Martin 2021-02-05  298                - apple,j293 # MacBook Pro (13-inch, M1, 2020)
007bd42364b5b6 Hector Martin 2021-02-05  299                - apple,j313 # MacBook Air (M1, 2020)
ad1569476e7644 Janne Grunau  2021-11-23  300                - apple,j456 # iMac (24-inch, 4x USB-C, M1, 2021)
ad1569476e7644 Janne Grunau  2021-11-23  301                - apple,j457 # iMac (24-inch, 2x USB-C, M1, 2021)
007bd42364b5b6 Hector Martin 2021-02-05  302            - const: apple,t8103
007bd42364b5b6 Hector Martin 2021-02-05  303            - const: apple,arm-platform
a450fc9a43799f Janne Grunau  2022-09-16  304  
828fe6b6245bd9 Janne Grunau  2023-03-07  305        - description: Apple M2 SoC based platforms
828fe6b6245bd9 Janne Grunau  2023-03-07  306          items:
828fe6b6245bd9 Janne Grunau  2023-03-07  307            - enum:
828fe6b6245bd9 Janne Grunau  2023-03-07  308                - apple,j413 # MacBook Air (M2, 2022)
efad8eaf6f2f00 Janne Grunau  2025-08-23  309                - apple,j415 # MacBook Air (15-inch, M2, 2023)
828fe6b6245bd9 Janne Grunau  2023-03-07  310                - apple,j473 # Mac mini (M2, 2023)
828fe6b6245bd9 Janne Grunau  2023-03-07  311                - apple,j493 # MacBook Pro (13-inch, M2, 2022)
828fe6b6245bd9 Janne Grunau  2023-03-07  312            - const: apple,t8112
828fe6b6245bd9 Janne Grunau  2023-03-07  313            - const: apple,arm-platform
828fe6b6245bd9 Janne Grunau  2023-03-07  314  
01f38c14423eef Janne Grunau  2026-05-07  315        - description: Apple M3 SoC based platforms
01f38c14423eef Janne Grunau  2026-05-07  316          items:
01f38c14423eef Janne Grunau  2026-05-07  317            - enum:
01f38c14423eef Janne Grunau  2026-05-07  318                - apple,j433 # iMac (24-inch, 2x USB-C, M3, 2023)
01f38c14423eef Janne Grunau  2026-05-07  319                - apple,j434 # iMac (24-inch, 4x USB-C, M3, 2023)
01f38c14423eef Janne Grunau  2026-05-07  320                - apple,j504 # MacBook Pro (14-inch, M3, 2023)
01f38c14423eef Janne Grunau  2026-05-07  321                - apple,j613 # MacBook Air (13-inch, M3, 2024)
01f38c14423eef Janne Grunau  2026-05-07  322                - apple,j615 # MacBook Air (15-inch, M3, 2024)
01f38c14423eef Janne Grunau  2026-05-07  323            - const: apple,t8122
01f38c14423eef Janne Grunau  2026-05-07  324            - const: apple,arm-platform
01f38c14423eef Janne Grunau  2026-05-07  325  
e15b8c8563983c Hector Martin 2021-12-09  326        - description: Apple M1 Pro SoC based platforms
e15b8c8563983c Hector Martin 2021-12-09  327          items:
e15b8c8563983c Hector Martin 2021-12-09  328            - enum:
e15b8c8563983c Hector Martin 2021-12-09  329                - apple,j314s # MacBook Pro (14-inch, M1 Pro, 2021)
e15b8c8563983c Hector Martin 2021-12-09  330                - apple,j316s # MacBook Pro (16-inch, M1 Pro, 2021)
e15b8c8563983c Hector Martin 2021-12-09  331            - const: apple,t6000
e15b8c8563983c Hector Martin 2021-12-09  332            - const: apple,arm-platform
a450fc9a43799f Janne Grunau  2022-09-16  333  
e15b8c8563983c Hector Martin 2021-12-09  334        - description: Apple M1 Max SoC based platforms
e15b8c8563983c Hector Martin 2021-12-09  335          items:
e15b8c8563983c Hector Martin 2021-12-09  336            - enum:
e15b8c8563983c Hector Martin 2021-12-09  337                - apple,j314c # MacBook Pro (14-inch, M1 Max, 2021)
e15b8c8563983c Hector Martin 2021-12-09  338                - apple,j316c # MacBook Pro (16-inch, M1 Max, 2021)
a450fc9a43799f Janne Grunau  2022-09-16  339                - apple,j375c # Mac Studio (M1 Max, 2022)
e15b8c8563983c Hector Martin 2021-12-09  340            - const: apple,t6001
e15b8c8563983c Hector Martin 2021-12-09  341            - const: apple,arm-platform
007bd42364b5b6 Hector Martin 2021-02-05  342  
a450fc9a43799f Janne Grunau  2022-09-16  343        - description: Apple M1 Ultra SoC based platforms
a450fc9a43799f Janne Grunau  2022-09-16  344          items:
a450fc9a43799f Janne Grunau  2022-09-16  345            - enum:
a450fc9a43799f Janne Grunau  2022-09-16  346                - apple,j375d # Mac Studio (M1 Ultra, 2022)
a450fc9a43799f Janne Grunau  2022-09-16  347            - const: apple,t6002
a450fc9a43799f Janne Grunau  2022-09-16  348            - const: apple,arm-platform
a450fc9a43799f Janne Grunau  2022-09-16  349  
28f94ed138c347 Janne Grunau  2025-09-14  350        - description: Apple M2 Pro SoC based platforms
28f94ed138c347 Janne Grunau  2025-09-14  351          items:
28f94ed138c347 Janne Grunau  2025-09-14  352            - enum:
28f94ed138c347 Janne Grunau  2025-09-14  353                - apple,j414s # MacBook Pro (14-inch, M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  354                - apple,j416s # MacBook Pro (16-inch, M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  355                - apple,j474s # Mac mini (M2 Pro, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  356            - const: apple,t6020
28f94ed138c347 Janne Grunau  2025-09-14  357            - const: apple,arm-platform
28f94ed138c347 Janne Grunau  2025-09-14  358  
28f94ed138c347 Janne Grunau  2025-09-14  359        - description: Apple M2 Max SoC based platforms
28f94ed138c347 Janne Grunau  2025-09-14  360          items:
28f94ed138c347 Janne Grunau  2025-09-14  361            - enum:
28f94ed138c347 Janne Grunau  2025-09-14  362                - apple,j414c # MacBook Pro (14-inch, M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  363                - apple,j416c # MacBook Pro (16-inch, M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  364                - apple,j475c # Mac Studio (M2 Max, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  365            - const: apple,t6021
28f94ed138c347 Janne Grunau  2025-09-14  366            - const: apple,arm-platform
28f94ed138c347 Janne Grunau  2025-09-14  367  
28f94ed138c347 Janne Grunau  2025-09-14  368        - description: Apple M2 Ultra SoC based platforms
28f94ed138c347 Janne Grunau  2025-09-14  369          items:
28f94ed138c347 Janne Grunau  2025-09-14  370            - enum:
28f94ed138c347 Janne Grunau  2025-09-14  371                - apple,j180d # Mac Pro (M2 Ultra, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  372                - apple,j475d # Mac Studio (M2 Ultra, 2023)
28f94ed138c347 Janne Grunau  2025-09-14  373            - const: apple,t6022
28f94ed138c347 Janne Grunau  2025-09-14  374            - const: apple,arm-platform
28f94ed138c347 Janne Grunau  2025-09-14  375  
b0fc6e5d9d30ac Janne Grunau  2026-07-09  376        - description: Apple M3 Pro SoC based platforms
b0fc6e5d9d30ac Janne Grunau  2026-07-09  377          items:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  378            - enum:
b0fc6e5d9d30ac Janne Grunau  2026-07-09 @379              - apple,j514s # MacBook Pro (14-inch, M3 Pro, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  380              - apple,j516s # MacBook Pro (16-inch, M3 Pro, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  381            - const: apple,t6030
b0fc6e5d9d30ac Janne Grunau  2026-07-09  382            - const: apple,arm-platform
b0fc6e5d9d30ac Janne Grunau  2026-07-09  383  
b0fc6e5d9d30ac Janne Grunau  2026-07-09  384        - description: Apple M3 Max SoC based platforms
b0fc6e5d9d30ac Janne Grunau  2026-07-09  385          oneOf:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  386            - items:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  387              - enum:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  388                - apple,j514c # MacBook Pro (14-inch, M3 Max, 16 cores, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  389                - apple,j516c # MacBook Pro (16-inch, M3 Max, 16 cores, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  390              - const: apple,t6031
b0fc6e5d9d30ac Janne Grunau  2026-07-09  391              - const: apple,arm-platform
b0fc6e5d9d30ac Janne Grunau  2026-07-09  392            - items:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  393              - enum:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  394                - apple,j514m # MacBook Pro (14-inch, M3 Max, 14 cores, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  395                - apple,j516m # MacBook Pro (16-inch, M3 Max, 14 cores, 2023)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  396              - const: apple,t6034
b0fc6e5d9d30ac Janne Grunau  2026-07-09  397              - const: apple,arm-platform
b0fc6e5d9d30ac Janne Grunau  2026-07-09  398  
b0fc6e5d9d30ac Janne Grunau  2026-07-09  399        - description: Apple M3 Ultra SoC based platforms
b0fc6e5d9d30ac Janne Grunau  2026-07-09  400          items:
b0fc6e5d9d30ac Janne Grunau  2026-07-09  401            - const: apple,j575d # Mac Studio (M3 Ultra, 2025)
b0fc6e5d9d30ac Janne Grunau  2026-07-09  402            - const: apple,t6032
b0fc6e5d9d30ac Janne Grunau  2026-07-09  403            - const: apple,arm-platform
b0fc6e5d9d30ac Janne Grunau  2026-07-09  404  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
