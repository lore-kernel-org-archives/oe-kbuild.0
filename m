Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648560;
	b=Z9hJ/z3Q5uy1IfIqhRyeI8vPOYh1YFBJzOrfMYywsxVusILEetk04tchjl+w1MsZASCc
	 f7Wp2pgy0wBG1RQ7turXzof1NJPfwqQqaQccflO303IjnOZiD6ZztiM09HV+qCafQqjl9
	 aMOMjHzda3urO+NqQKumBOWD61YFnIW765QUB0eDmFRbwr2/nneLS01YwweFXW+9nFaUN
	 DxIFs1Zdk+/muw4+JiS5U3mMP7rU9+th47K4Vne8MDpU3GiFK5/Gr+KlmAU/cIVcf6qIH
	 rNo8Me/wS/cGVxa59C5botaRQRswnIZDguCuFysJXVlOpb3/VNoTyV0aZntsIApOsEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eKyvLVmMVI632Tlx2c1z8w4YybQipT2a0CBXhNRRd18=;
	b=V6gV4EhdV38shxSmuTHYk34TWKi7RVIy7lshcq8fUn462snsF6HS04qhQyOw92N/ia/2
	 E9ZOdeIi4QR3yRMV2ytyONkfzvuxvLwKXD83TfCT7mk6MqbkMJt02WC8QmWE6ED9dWrDQ
	 QqvKt8OSlB5QmMLnPwYtN7O/VyUGJffBCphbFb8DbFvCxwqL2pm7veLF1+89DDI+boPdH
	 yqvZehiXpBNZ8lwleEddLhr7KqxPHfOVn1KBB8lc5w1kKeXLcFqWvsXGr72ojNZyp/VNw
	 fmFNowGhprEmlEuvPB+pj29juz6gtIk+XF1uBHNAVTdkVyO1Zcia7GjQYC5+vKLyW4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYPD1KvB;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558CD606A327
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 19:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 558CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYPD1KvB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793648559; x=1825184559;
  h=date:from:to:cc:subject:message-id;
  bh=ixmRsnzznu4JtoH/be5IxqOJ8PByH9Gwo0dJwrVQ6ew=;
  b=ZYPD1KvBALeHc9xXOi3R4hX6FLZvrSVhNGPlNbIvxjPLccFpMFlWChzP
   x/OtOEKYO/tzUKrv8GixZnUGL8bAoMMc6FcTUjmWq+R+csIefpYmiQEdX
   jQmbs0+t3MHDwY7Veh0iNldVS5MmE8JQ9e4086E9p9BmX2CpRiWE9pjrm
   /ePRikZKNIko9MPZ2DcEueVpAdIz7rgg43d9SFThp2PcHjE6JJuoqh1yl
   VXOeYelC84rAQweRMt/LiFLu2Y40j3GlrKZztho7OKM8vTgiPC3zh/tac
   OXncH2qzJuDe3loS/I2sIs7DQQVmcT3lri38UecBL2Z/7eepZcGwZE+WI
   w==;
X-CSE-ConnectionGUID: ir+F0uu6TiykGXtflbaUrQ==
X-CSE-MsgGUID: E8ns9yS4ROOndIJz2Zmn5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2373426"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2373426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 11:42:39 -0800
X-CSE-ConnectionGUID: JzyP5GwDRNKP4zouUC0CSQ==
X-CSE-MsgGUID: oGQWHGUKQ7i6GVBOH26nJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6595745"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2026 11:42:38 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNxvP-000000008i3-3qnj;
	Mon, 02 Nov 2026 19:42:35 +0000
Date: Mon, 02 Nov 2026 20:42:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 14/36]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones:
 gpu-thermal: 'gpu-trips' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611022026.aRJyCfw6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mikhail Kalashnikov <iuncuim@gmail.com>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   1cdb4d4846ffaddce6d648dbbfcdcca78f8a0bcc
commit: 836aa9a16eef4207c85cc11171fb74b28bdccaeb [14/36] Allwinner: A523: add support for A523 THS0/1 controllers
:::::: branch date: 6 months ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261102/202611022026.aRJyCfw6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611022026.aRJyCfw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611022026.aRJyCfw6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1212.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: thermal-zones: gpu-thermal: 'gpu-trips' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
