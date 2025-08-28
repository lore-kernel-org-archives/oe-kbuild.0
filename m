Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFBD191F6A
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756381738; cv=none; b=H+bfnbwahyTZtr1iBGV5EXs4bW0vH4on+lqcpk3tI1Px2huEMJaKkr39nwpedVRtKmwhb/oAjeQRWWwmzpWXZJ+PHikEB8ZkUrGMg6bD0QrwKT2CdIyExHRMB8QGo9i+AFtqB1QAd3EVP6C0YgCWBvmAmsuD/8QV1xDxaUoDvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756381738; c=relaxed/simple;
	bh=acRvEStemEim8eaOaO4k+EsXfNjdWIME79vy04sE1Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRLS7QDncYg8L/r7l4gQSmk2QKHTLLUMweMDDnxqHhX7hNLUb/fE4RDYzqJjbIcgPz3UUD/NSotsSbTUtvCG5DgXfUsKESueUioCH6Ww7s2/0cVKK0ciVIDBlCeSi5Q+b3xrmQgd7gKCaMIULJQYH5lwXKA7NgumT6yxbIpb+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NDmOePzt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NDmOePzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756381737; x=1787917737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acRvEStemEim8eaOaO4k+EsXfNjdWIME79vy04sE1Ro=;
  b=NDmOePztv4Xh986Ay2+6FwdeWuUEjyJ4+YNfMasGbAICQD/IaRPTw7Am
   ONC3rK8Jm6WJnESkjOBNNduKWO2fSNesr/0Hmk1QbYNxeX6TzLLN+NUUh
   GlNFMLYo/BMvPcqqjA9C1vKU+4vM0JjoB6MbG8d9iIwp/GsF4DggzyCch
   6XK0nWwr7l/vze2AjnIF8Ap8Qcg8Ya00F7yDeu/D3yZHkE0wAJ7Nx8/4U
   7lMZOfRwXCTDKdek4Lc4Cho6h+ECfpItOSBAv4QpKsZXljP6NPwYuy7Ci
   fQfqFXRctGSertqbCpn0+AZ8al9JG1N+XKA2ygdmNos9mVK9lC1zr1GsI
   g==;
X-CSE-ConnectionGUID: gqBJkKbBSXOw0GLocSS+Rg==
X-CSE-MsgGUID: iJ2DsT1CQtaM7hfRU1wsYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62471590"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="62471590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 04:48:56 -0700
X-CSE-ConnectionGUID: L9ZykEVvTdSDdIn8QjzxJQ==
X-CSE-MsgGUID: q5e0Vg8KR7y7hZLXLnortA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170264567"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2025 04:48:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urb6z-000TgN-0h;
	Thu, 28 Aug 2025 11:48:26 +0000
Date: Thu, 28 Aug 2025 19:47:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ambarus:b4/acpm-clk 2/6]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: power-management
 (google,gs101-acpm-ipc): '#clock-cells' is a required property
Message-ID: <202508281955.8CrEXzO1-lkp@intel.com>
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
TO: Tudor Ambarus <tudor.ambarus@linaro.org>

tree:   https://github.com/ambarus/linux-0day b4/acpm-clk
head:   baaf0618c22bc11ad955a9197c70093d5c347f64
commit: 70221f9ff61f8a37513eaf2eae10f14ed70e8f50 [2/6] dt-bindings: firmware: google,gs101-acpm-ipc: add #clock-cells
:::::: branch date: 23 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250828 (https://download.01.org/0day-ci/archive/20250828/202508281955.8CrEXzO1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281955.8CrEXzO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508281955.8CrEXzO1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: power-management (google,gs101-acpm-ipc): '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
--
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: power-management (google,gs101-acpm-ipc): '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
