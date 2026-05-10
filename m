Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224E8834
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 05:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778390741; cv=none; b=c+rVEoMqcDoXe/tjAVOTAGXPA+E+P4pQksk+ICSxseNaRH0ezeoIe5uonGkg4Tj3eB/L+SI8Ihrt6tlYpQsspjS81ryCbaoIX9HkbfnBROjI78emXkKaqqRPcd7ubohlSmvM80ufUoHfIz0DLWkWpaAvuPiWD+9v8BZacTtwwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778390741; c=relaxed/simple;
	bh=4FHL+y5ZlxaN9kTHY2ySWCCqPa7NWrlEqycLFEKEyb8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJysRGBI/+p6fnTvb0GAu0tizWEbSzrmFBJhWWIQRgUVoBg2FGLiBn6TbEUVOwMZMsX2Ljphv8yREcm4LZNZ96QzOEAWtJBXDnrhxDAgZs664/fwYC0pjjzDNJSwA2AJONKQvKolHezPaJf3KOoBV5PKFqqFO3Q9gaihU0mDmQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4W9qSxR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4W9qSxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778390740; x=1809926740;
  h=date:from:to:cc:subject:message-id;
  bh=4FHL+y5ZlxaN9kTHY2ySWCCqPa7NWrlEqycLFEKEyb8=;
  b=N4W9qSxRaZhuY2Pt1q6Yl8yAWpYOaM8f1AplsiqoobQl0ifRixnuQpb1
   3Iuq/Ea9h39oqwJ3XUlMHkvgBEfK2JFBhCdCYxdU9zTAUgsCDUdtZLbWh
   5fEX4jmj6mlsugQYQVyUj/qqYScx9P6zCePH6Nwsx5n9F6mDF7X1Q/DvV
   Y/+yY763STNR21ffkbgobIDofwLvZXHn290R5bbJk/XVMNAlzRsbmaFkl
   MYoIOBzwcxlenygKxjfbdZAJiVykTuxAwbLTtHyfO81+ZprrYwrIwPLag
   XBp4YsmJNBdpk8WZlAOOs4DKJX+p88XN/RoYcy0jQ+Zz+ZrygQ/0i4eHG
   A==;
X-CSE-ConnectionGUID: Xe5tufaNSBWCf/dcElZVmA==
X-CSE-MsgGUID: 6eXlIW9ERQq0hHJdIimWAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="81880177"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="81880177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 22:25:39 -0700
X-CSE-ConnectionGUID: 0YE59In7T9SimGDQcy2Q+Q==
X-CSE-MsgGUID: YAhFRo9uQL6tmlFd/EbEoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236308349"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2026 22:25:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLwfX-000000007eP-2sqR;
	Sun, 10 May 2026 05:25:35 +0000
Date: Sun, 10 May 2026 07:24:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:rockchips/dt64 15/40]
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit
 (linux,spdif-dit): 'port' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202605100751.6Pilbnhp-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Peter Robinson <pbrobinson@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchips/dt64
head:   6e3071f4e03997ca0e4388ca61aa06df2802dcd1
commit: e14491aaa6ff598bbe9d462e44c01ac65754f445 [15/40] arm64: dts: rockchip: add overlay for RockPro64 screen
:::::: branch date: 10 months ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260428 (https://download.01.org/0day-ci/archive/20260510/202605100751.6Pilbnhp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100751.6Pilbnhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100751.6Pilbnhp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
