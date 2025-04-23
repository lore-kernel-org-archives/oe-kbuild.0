Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D784715350B
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Apr 2025 13:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414919; cv=none; b=R0OQg5Ljr7gwaLOCAs0JmkLBqd42MCZJOkmXeKCxywraSlZlUY1WC3tpUdbeHe3MgZBwoo33IFsbfyx4WdSYpR+/09o67ijMA77XNQUdtE1npRxLh6+7C96FJoKVsqJ+XzqSWI+L792CSA4FqhIpz8VWTqEOSSAPOLSGj243jb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414919; c=relaxed/simple;
	bh=GTfQJWRkjWXNeLHU0PsI9bEe5cqk+x05VDTK/kOiDU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZdXPsw5rXMOp/zY8ZiNg2g2ua4cfYYwIcEBQd8AHnDeAOoVYT7IKJ81pWfwJ68KgyNQyPAg2sVkaOOJ2w+I8Ixgwnh9GjLtCWolPp0nMBe7LB8HSSfRNXWfGMS6owdzJEqIhemRrHKUIYJLkxaYZj2dCqOTA/vhdL/6Ie2tigJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZFuYB/H; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZFuYB/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745414917; x=1776950917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GTfQJWRkjWXNeLHU0PsI9bEe5cqk+x05VDTK/kOiDU8=;
  b=IZFuYB/HiZY2C/vkeonu0ElhqXqdCLX0qvAi5sYU75s1ReHOCEjUm63j
   3iENFi2QIZNE6M+fUUoLOiGeoN0rcD/3q6qvoVx+umVHi3kmztg2N7iSX
   dGR0hWj5C2MIXXMVnamhBGOkwm9x8gC5D889zKKQ3jCp+xmajPXR5rSlU
   u+dglCf3E2CxoTws60M49AUmDkOKwkK5E2diFDkjcfzkrv/2tpIl35U6R
   EN3PdSAjcro70QUrRvh5xhFhg0aK+hOC4e2H4s6mHbN4NU2Ifk1IT4GxC
   gNLQju5rd2dS0kmGqXBkPEjl6O8ARrL5GYpKJYhRp4jddHojlm1YO9IsK
   g==;
X-CSE-ConnectionGUID: gfsTXgS2RYyA7SRGOlyKLw==
X-CSE-MsgGUID: PxmVXZq4Rgy47jDX/H9JeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="49673209"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="49673209"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:28:36 -0700
X-CSE-ConnectionGUID: U5Qn9iQwQuKjnVcFtQFneg==
X-CSE-MsgGUID: m0c1hymATbu0SVvQbN98gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132848591"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 06:28:35 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7a9R-00025F-00;
	Wed, 23 Apr 2025 13:28:33 +0000
Date: Wed, 23 Apr 2025 21:27:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 1/12]
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint:
 ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
Message-ID: <202504232154.60e4ApGt-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Andrej Picej <andrej.picej@norik.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   ac1c1d2e2124387752b4cc955dd359753783c147
commit: 7ed7d1ed852d8f4c4dee7a4d4f7807ad59c7915d [1/12] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250423 (https://download.01.org/0day-ci/archive/20250423/202504232154.60e4ApGt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504232154.60e4ApGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504232154.60e4ApGt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-clock-microvolt: [200000, 600000] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint:ti,lvds-vod-swing-data-microvolt: [200000, 600000] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: bridge@2d (ti,sn65dsi83): ports:port@2:endpoint: Unevaluated properties are not allowed ('ti,lvds-vod-swing-clock-microvolt', 'ti,lvds-vod-swing-data-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-data-microvolt:1: 600000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:0: 200000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtb: endpoint: ti,lvds-vod-swing-clock-microvolt:1: 600000 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
