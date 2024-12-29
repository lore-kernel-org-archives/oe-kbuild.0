Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866EEEDE
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Dec 2024 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735491210; cv=none; b=FHVpADNeKiQdhDZuOgvNVM7mTEX684WvtSC9BZT1Z+Zp1OWiFAnsVV4eyA0c9t2vHdEaAjApu3rW6LnR3KAu7xG3WeDOaaoak6b2tOu3bb8eulY+1QAHkHWWrTSZdfBsK4QuidETH1s1eovcJdjzhKWZAbEg5j/YUKOGV9x8IN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735491210; c=relaxed/simple;
	bh=LdC/jnA9GeyvTY2Z4mLzXY1sNEm+ZNAKA8T3FkD88Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeVnYpoLNX+PRDguu0DrEBUWggeIK4U3IPsn1GyWU2uVG9lXdox6PreFAgu0em2beMRaY1OZvMafiTiSyRftyOoRfVWL2TjQ4eNCTeUw65F6ChXaHPjX0RcEeGuSYlt3aP2un6Nhx9t2GKe+/fVuF/VTJRyMwKXH3FKzckfSPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpieE7LZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpieE7LZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735491209; x=1767027209;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LdC/jnA9GeyvTY2Z4mLzXY1sNEm+ZNAKA8T3FkD88Ns=;
  b=VpieE7LZbSUCwFq6MJuo3lK7nPNVyvOIBVLTHRfhe/wiOcyseAqutRIh
   cBZXj7VvG5Q2O9b50f8Vrt1a45UGCZC7ISCa3u1CWgQ7kcieoBbIU0rii
   gT1u4m5jjZ/6xZzuWClVDpC2x6SFO13/7q0O7dXGLy7jtzhhh+uOkENdA
   gYLCTC8YWu8RgUj7Uhh5vhXM8bYWPTO8HWWMyo+knYkhHB2Oj2N3DJhxi
   VVNBr+zgtdXHYXYwzB51Bf/6nZsxWeSqNwBnEMqyt3Zi6jC5KfSGzHb8G
   gKvX9g6u8t4zx03gxDSeEmAGUHkZ/N284Fa+ClKumnuAA5eWUB8fRpr7J
   A==;
X-CSE-ConnectionGUID: /5o38MeNTVGEFf9QX+2Bog==
X-CSE-MsgGUID: WPlby0kfQ+iX7cp1l/bZjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46382352"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="46382352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 08:53:27 -0800
X-CSE-ConnectionGUID: TP51fwOUQdWcDtw4pcf+XA==
X-CSE-MsgGUID: Imprt/CqTBOLdqbpxFGnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100709439"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Dec 2024 08:53:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRwXb-0004qC-36;
	Sun, 29 Dec 2024 16:53:23 +0000
Date: Mon, 30 Dec 2024 00:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 19/21]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: usb-typec@25:
 compatible:0: 'maxim,max77759-tcpci' is not one of ['maxim,max33359']
Message-ID: <202412300001.lwNuvVjQ-lkp@intel.com>
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
TO: "André Draszik" <andre.draszik@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Peter Griffin <peter.griffin@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f21231ac28f44cd5daf50bc8fdae381f451b46c9
commit: ddbf40d8ce4a6b35821d0a0453370ec1422d915b [19/21] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-052-20241229 (https://download.01.org/0day-ci/archive/20241230/202412300001.lwNuvVjQ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241230/202412300001.lwNuvVjQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412300001.lwNuvVjQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: usb-typec@25: compatible:0: 'maxim,max77759-tcpci' is not one of ['maxim,max33359']
   	from schema $id: http://devicetree.org/schemas/usb/maxim,max33359.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: usb-typec@25: compatible: ['maxim,max77759-tcpci', 'maxim,max33359'] is too long
   	from schema $id: http://devicetree.org/schemas/usb/maxim,max33359.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /soc@0/usi@10d500c0/i2c@10d50000/usb-typec@25: failed to match any schema with compatible: ['maxim,max77759-tcpci', 'maxim,max33359']
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: phy@11100000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/samsung,usb3-drd-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
