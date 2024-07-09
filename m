Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE437E765
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720567254; cv=none; b=tntwyN5xqM9dxCUFoMoOCAU1BPQx3eqohAdPKFvla1JqzofZz3HiGV/SMmkWvnSuyr0c+SnyOH3RWsvJH8VNPJ0ORohiXhf83EOtVccWLFL9aCYN1tQpHytfSbrhmkcaEpYgDmVrCV9n0g+SZm+lYROM1OSOjx+v8OjbHdHkpRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720567254; c=relaxed/simple;
	bh=hCysYASxebCn6MxjiT/uAHfYDprL2bZ0EFCKRwMRMJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryeFZKW2RQkb36P+61QgprOzrzPiF93406FOV+L5gel80yUU/ZOuQQ8NOyAGTVAeJ43Lil5gk0ZWEbM9Hy8ulWT9PWC3Ax3l3/u5iGkoN8uTtjVRMejB7Ughdn1/8jA2JOjO434EFDhWHbHGgbVSxxi776tLrq5jNoqkp1VmjO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aULDeB9S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aULDeB9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720567253; x=1752103253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCysYASxebCn6MxjiT/uAHfYDprL2bZ0EFCKRwMRMJk=;
  b=aULDeB9SXK/l8j4ioN2qvw/fxtdqFAhY3ABT57U54Tc9MIMWcEeG9XYX
   h145At6M7HjS2hLT2DA5cxfdMrgSOgSFTUpbDj1KV08rreiFxDdMwYtwx
   V1OaObrWbHxcM5Q2mObybpMNj/ig080vLbPRVI66AR4kPuwhQOndI6mXE
   omSpmHQG7b5JJtl16o2TxBlKbL/sB9ryOz1ZJkEsiPcE84H6CTAxa9Q9s
   wt8EpPuePUnAN11uHU0KAleWJcftUHZubXFhaEEwjOKa5VVWqE64k7oxp
   YhnIoKpr1DELqtS7Js7Wo02YyegfwiIGMVXU7ShrqOVNwkRprexoG8mxE
   w==;
X-CSE-ConnectionGUID: nVcc6MCdQ+uAbkG/U/Xf6Q==
X-CSE-MsgGUID: W8peXoaCQhqPYohiarmOCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21677764"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="21677764"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 16:20:50 -0700
X-CSE-ConnectionGUID: fD6/C4zGSuKifvDSYqXEeg==
X-CSE-MsgGUID: G4u7pWphSRauyDVz715I9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48110097"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jul 2024 16:20:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRK8d-000XEQ-28;
	Tue, 09 Jul 2024 23:20:47 +0000
Date: Wed, 10 Jul 2024 07:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-mfd:for-mfd-next 46/55]
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: pmic@20: codec:
 'mic-in-differential' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202407100725.dTVLD9xJ-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Lee Jones <lee@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   70b46487b1558eb25ea6e533c905131b10596dc0
commit: f11121314a6e4ac505233fb7ae777311fb45a6a3 [46/55] dt-bindings: mfd: rk817: Merge support for RK809
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240710/202407100725.dTVLD9xJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100725.dTVLD9xJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407100725.dTVLD9xJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: pmic@20: codec: 'mic-in-differential' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: pmic@20: codec: 'mic-in-differential' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pmic@20: codec: 'mic-in-differential' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk817.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: phy@fe8c0000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,pcie3-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
