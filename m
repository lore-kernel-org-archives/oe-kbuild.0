Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AA4A3C
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 04:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766721742; cv=none; b=O2+I9kFG5mIREY7+svwMdZr7L2YHKSBX7pIQ8IsM5O5p2JQ7YJ5l0krtwIUub9llz+VoMVWBdnGtsuY5CtilC6FO49jT+sm28lqRdUMYwIp7YlHnlt0JIB3yshjHLGe2V+/OyZHeT9fh/YzxWRmgq6kwlyVToL/xZyrvVGTj+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766721742; c=relaxed/simple;
	bh=wSeBCQRqDxtj79wAaD1ojK7muolRuwecXD2/V+jOgaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnecRIYFCWyyrkwiyureE/kFAMmjNM2UZLutSRYlIMynX/vq/Q/iXhGph47cQIT1y4x5TrKp3fMdLv2igGAJYsQ+kyVR2eejsKRg7SDKl6X+SSbMO38TXSi6QIsbDTzmIc2exr79Z61Lq7Cv04YeI/TDubzCvlsErpUH36dBszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGck3Qxm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGck3Qxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766721741; x=1798257741;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wSeBCQRqDxtj79wAaD1ojK7muolRuwecXD2/V+jOgaw=;
  b=MGck3QxmS3QYtTf1kAV9EOUEQXs7rk3UoT9xqakKkYM7JOBInuYJruE3
   kMZZWa1YuSjWdJ2+zAvu3mbbN87rVEvmSIyT07p7qOUtj4d/Dfyf0l6Rk
   nep8Tp2fk/l1VrvfbMgKyPTp1jM0EwcnHqC6JgF1phDU9v6JgOkkI7YoU
   DkEHM7WE9+7OQcMhohyHekJuX7p2vnVjz0x9ftCPHBA6Ur88uMvQTymNx
   Xrv0iku6PaobYRD5UjafZYuEe60gfYCrYAXcbpzlPKo35Nb026V8/CB43
   RyOPwkwg3zKq7OjrwaRH6LPR92ejy9bFBj0UjQDzNONNqaXTdewpYVuOP
   A==;
X-CSE-ConnectionGUID: vvQkc1bURy+vAAkolMCC4g==
X-CSE-MsgGUID: EUQM4lJ6QE6E0TPSsoEPeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68384699"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68384699"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 20:02:20 -0800
X-CSE-ConnectionGUID: qKLle70xQOmU0MK+Y//4/w==
X-CSE-MsgGUID: ywyiJYuLQfOw+t0qf3REEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200805170"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Dec 2025 20:02:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYz1s-000000006lc-3DxY;
	Fri, 26 Dec 2025 04:02:16 +0000
Date: Fri, 26 Dec 2025 05:02:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/clk 3/5]
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb:
 clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a
 required property
Message-ID: <202512260541.MaVWWdjl-lkp@intel.com>
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
TO: Peter Griffin <peter.griffin@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: "André Draszik" <andre.draszik@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/clk
head:   eaf9206bf3d68f792ecd5e6f488eab1fb5afe900
commit: 2e8e9a2492edbbef54de6ab1c5bf1578ffef4c8c [3/5] dt-bindings: clock: google,gs101-clock: add samsung,sysreg property as required
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251226/202512260541.MaVWWdjl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260541.MaVWWdjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512260541.MaVWWdjl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10800000 (google,gs101-cmu-peric0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@10c00000 (google,gs101-cmu-peric1): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@11000000 (google,gs101-cmu-hsi0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@14400000 (google,gs101-cmu-hsi2): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: clock-controller@17400000 (google,gs101-cmu-apm): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
--
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10010000 (google,gs101-cmu-misc): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10800000 (google,gs101-cmu-peric0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@10c00000 (google,gs101-cmu-peric1): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@11000000 (google,gs101-cmu-hsi0): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@14400000 (google,gs101-cmu-hsi2): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: clock-controller@17400000 (google,gs101-cmu-apm): 'samsung,sysreg' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
