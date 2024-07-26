Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685CA6026A
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jul 2024 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722033193; cv=none; b=TbFsRZ9W090CEboMRQWWbho/f0ftRivO11miH6kNndiA+shGLs+rdZ0m8GIHe/rmcYlwbuOEQDExrRnllhtdI6onZ+jgHYQUsHwaEwW17QVfbtY9wqi+0Gc05MHMAN38ogC1gafJX/CoxzHxSW26bumQj+1kWggjWACjuFL11sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722033193; c=relaxed/simple;
	bh=eanfE0B+ULj8xak8tG+n10XXj95zQBzswlyKba9VfuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjbDUN1lk4NfgMI/o+C3AHA06GawerI6zyQEraWPFC+CeB29t4qCw8eB458PQv3Cl6DmEauHPH6Mckq0cAl8ObCd1YZ963rCg1iq+BD6IOjdcw8b6MOlKJUQpZ0eJT++bgqYC9OdIbaLfDhfquiPPnLAIK81kczLDgwzgFkTwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m73Fm88I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m73Fm88I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722033190; x=1753569190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eanfE0B+ULj8xak8tG+n10XXj95zQBzswlyKba9VfuQ=;
  b=m73Fm88I7INQ0baQAPGj4PL2/Na+kxEUneInFwNgf4135wfM9CS+S4Pn
   E2j7CzFhXVzJI3+q5uI2kNBngqkuTgWzHpHNCm724hp7ULuOymwngCraX
   uHlrJxgBQB2fHu+PGJe9viJ4qR3kLRlleZjPZcVlA44OPBJ4BOa3S69G9
   sR4EvSnP5afG2Z/meZ+OFOVYFMauhs77wo8XDs9FohdGjIN9CyVu9VhSj
   QvQaeSumn7T28loSJM1jyJKzTiPw79nLXtLIo4ChXQYxlvm9zZzuAhLto
   aRVEZBDS55Y9zgSxL02EVABayuQFZTj6FNUjciuZH70V4zrsnlv2MwBI9
   Q==;
X-CSE-ConnectionGUID: 4YMFpORkQeqrQJjuo01CDg==
X-CSE-MsgGUID: dFA51lLJSsyVlAhsoEQGKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19999613"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="19999613"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 15:33:09 -0700
X-CSE-ConnectionGUID: iZs5+7QuQoCZgFcMNH+Y+w==
X-CSE-MsgGUID: wlsqnCvURuq80El0yzh8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; 
   d="scan'208";a="57689343"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jul 2024 15:33:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXTUn-000pRk-3D;
	Fri, 26 Jul 2024 22:33:06 +0000
Date: Sat, 27 Jul 2024 06:33:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] arm64: dts: rockchip: Add GameForce Ace
Message-ID: <202407270618.OlatBL39-lkp@intel.com>
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
In-Reply-To: <20240726194948.109326-6-macroalpha82@gmail.com>
References: <20240726194948.109326-6-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-rockchip@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: jagan@edgeble.ai
CC: andyshrk@163.com
CC: jonas@kwiboo.se
CC: sre@kernel.org
CC: t.schramm@manjaro.org
CC: heiko@sntech.de
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master next-20240726]
[cannot apply to sre-power-supply/for-next robh/for-next amd-pstate/linux-next amd-pstate/bleeding-edge v6.10]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-power-supply-add-dual-cell-for-cw2015/20240727-035838
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240726194948.109326-6-macroalpha82%40gmail.com
patch subject: [PATCH 5/5] arm64: dts: rockchip: Add GameForce Ace
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-051-20240727 (https://download.01.org/0day-ci/archive/20240727/202407270618.OlatBL39-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407270618.OlatBL39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407270618.OlatBL39-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts:1283.7-1290.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: typec-portc@22: 'vbus-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /pwm-33: failed to match any schema with compatible: ['pwm-gpio']
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: /pwm-132: failed to match any schema with compatible: ['pwm-gpio']

vim +1283 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts

aaec004564226b Chris Morgan 2024-07-26  1277  
aaec004564226b Chris Morgan 2024-07-26  1278  &usb_host0_xhci {
aaec004564226b Chris Morgan 2024-07-26  1279  	dr_mode = "otg";
aaec004564226b Chris Morgan 2024-07-26  1280  	usb-role-switch;
aaec004564226b Chris Morgan 2024-07-26  1281  	status = "okay";
aaec004564226b Chris Morgan 2024-07-26  1282  
aaec004564226b Chris Morgan 2024-07-26 @1283  	port {
aaec004564226b Chris Morgan 2024-07-26  1284  		#address-cells = <1>;
aaec004564226b Chris Morgan 2024-07-26  1285  		#size-cells = <0>;
aaec004564226b Chris Morgan 2024-07-26  1286  		dwc3_0_role_switch: endpoint@0 {
aaec004564226b Chris Morgan 2024-07-26  1287  			reg = <0>;
aaec004564226b Chris Morgan 2024-07-26  1288  			remote-endpoint = <&usbc0_role_sw>;
aaec004564226b Chris Morgan 2024-07-26  1289  		};
aaec004564226b Chris Morgan 2024-07-26  1290  	};
aaec004564226b Chris Morgan 2024-07-26  1291  };
aaec004564226b Chris Morgan 2024-07-26  1292  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
