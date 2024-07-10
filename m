Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAF12F37C
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720632701; cv=none; b=jRl6ZkNvnQ6SQfg/9niOODvHXLF9zMyDcTBxA1bsoEn/eBY5TLm842O5E8H8PCEl53nwHFcRV7OZ1fhjNS2f0t0newh2Ay3HvEyiqbTu4CQW/e7TY/OwSAFJYlctgBRHgbrkL8ljc9bXO98wIkQZUUHCQH3rQFr6iWd8z7M30vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720632701; c=relaxed/simple;
	bh=TM6wMir0T588945+D2gLnPji+Z+t3FLzjtCd0vv2Fvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KjiZSsoz6194cOHY6clzgqB1CeRi2PQgR8kyfPMo8EytTs8AY7RmbGiXj36mrlUXTF+cNHI8Sb4apa11D/IwAhv1sUpJ6fETfuzhDvy0eEyH3lX2b0GAnJTyUEB8eIkMlpYL3dhxJngk8VeReA/kBjydGwUphoIVHp9Rux6rVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jevfLltU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jevfLltU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720632699; x=1752168699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TM6wMir0T588945+D2gLnPji+Z+t3FLzjtCd0vv2Fvg=;
  b=jevfLltUEb7IHew00lB4KIRfuH1hL1CfPgwtLKobr8jWxmkE+rbR6DHZ
   pb8b8x8XFvaakNVNWhucR/ieljYE4LP3w+gew1e1NMTPqsKGpEK269T2t
   9i2OpINi3vB7VZAVW/tpSX+SmADntR8GT6+GYl7QEhh5Cy6XvJVM0ts8j
   Fmw6VOVCkAA/Eh6jRIGBHzl0to2SwNXJag1+I9Q0NpNb1k4S893m2glIw
   8n9qycBRTkSBTo3Szun6gRn8YFK3U5RUDNqlEAm21OfrGgWanz3tGYipv
   4Kk13mF66xcwgyRZXizLw63mPA/kKnehgftTEny7RM8SsxSeZSCSXO+ev
   Q==;
X-CSE-ConnectionGUID: 8D8XbofQS0i5bc1W76qVfA==
X-CSE-MsgGUID: oiony7KuRCSNdKsD5rDX6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18086142"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="18086142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 10:31:39 -0700
X-CSE-ConnectionGUID: ydkDU3PTSZK+53tgOYi9YA==
X-CSE-MsgGUID: HnP2/v6LSN6KYLgSVP2DsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53459476"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2024 10:31:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRbAF-000Y5w-2N;
	Wed, 10 Jul 2024 17:31:35 +0000
Date: Thu, 11 Jul 2024 01:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 10/11]
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: panel@0: 'port@0'
 does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407110115.sQ8gr7i0-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   e4bd1db1c1f771983393bf5574854dff26ca7532
commit: 3808a15e3248820c0859d9b8a0f2c7e5c8259044 [10/11] dt-bindings: display: panel: Add compatible for starry-er88577
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm64-randconfig-051-20240710 (https://download.01.org/0day-ci/archive/20240711/202407110115.sQ8gr7i0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110115.sQ8gr7i0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110115.sQ8gr7i0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:288.10-292.5: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:289.29-291.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: panel@0: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: phy@fe870000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:288.10-292.5: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi:289.29-291.6: Warning (unit_address_vs_reg): /dsi@fe060000/panel@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: panel@0: 'port@0' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/boe,th101mb31ig002-28a.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: phy@fe870000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
