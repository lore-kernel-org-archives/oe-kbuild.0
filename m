Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F0C13B
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 16:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752337382; cv=none; b=reYxrQSNfdh48T8OVhUbAqHBWHj1vkaglX/uMeI2JzIn4L9jDPlIxSJortYmvIXQvOB3pFciAO46LhlTUX2m8pbTsQi7X4dPHTit2DF5IQdC8r8ISIu9c+9GSu3kU3cKP+ximKgpNIQwo/JfpjBGIB8vGgca6s/U5LeeiI84Wuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752337382; c=relaxed/simple;
	bh=gNh+66/yNVyPwSnPkHiLo/dH0E4L6cwSXo+fxQE8Eh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJJbYqbW+kAulfG4jRsuNZ9H1BPPY9dTNjoqMR1rH9Kr7ShFRvORorjSb1MlJV8uubyaCgcxYeG/HCCSfQ4LQtjeBLc5Vmb+tM+lr9uhpBKK1nTiAGSR2zNOKlLyU404RHcjjmmLVCEf3DiuGs2ByD0nfkiIZ2k/LOQYiJSGcio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQf2i11K; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQf2i11K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752337379; x=1783873379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gNh+66/yNVyPwSnPkHiLo/dH0E4L6cwSXo+fxQE8Eh0=;
  b=iQf2i11KtFdiUWyrFUYZ3/bk4QHCCVFs7TFniYn/SiirFo5aj8nLKNZr
   y0ggQl8wpJxEX9Z6iLbO/YXooMACAQ0SCa/L4q/Li+Sj6370UmySjtmWe
   PuT+TV7CfTjBtFMjkPSQl8rUykSnqUNV78btl71oNl7ansAJNlKBwqhVI
   M3A7qspdVKi+WLMkPQavSjOYBdyFp0g40RQRcJDT9TJVebus6tgWnKZVc
   3ow309a6VKX2AbR2s9qHkeed38cDZacC5BRJ8dHnJAKSAkN02psFs7Fiq
   EMbsI980OGNnNX5Kpbx1GsXSkL30oBzRtLXFPVxast5y0cKpUzhfJDec3
   g==;
X-CSE-ConnectionGUID: AMh0fx8nQVWJjeqPHVJaJA==
X-CSE-MsgGUID: kI6r01RDQiajnpVHaSv4KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65179031"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65179031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 09:22:59 -0700
X-CSE-ConnectionGUID: H/L9qe0OQ3226IJszIAuKA==
X-CSE-MsgGUID: AO3N2SfzTX290e0LyCAoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="160611079"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2025 09:22:58 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uad03-0007UF-2x;
	Sat, 12 Jul 2025 16:22:55 +0000
Date: Sun, 13 Jul 2025 00:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 10/84]
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb:
 / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507130048.5KlMtVbD-lkp@intel.com>
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
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   440bd77d25a61985358404bc578598817ff475c3
commit: abe127c46704d3619ef8b1280b81965c8ddc0cca [10/84] arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display
:::::: branch date: 32 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250713/202507130048.5KlMtVbD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130048.5KlMtVbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507130048.5KlMtVbD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too long
   	'gocontroll,moduline-display' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'fsl,ls2081a' was expected
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display', 'fsl,imx8mp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
