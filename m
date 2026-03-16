Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3625228D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Mar 2026 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666530; cv=none; b=L7AOI53kPwTah5aE8nsLAKAxSqNic2+uWN9kaQ3OYwUlUIy7lD7MPSTy398eLomDo6TsY5G+V2RHxOGkp0tNFBasyACRnXXPcB9h3UVp54Si0PmhwFd3HFiIr+fj6CNHFGA6eoNpvxJwI89A4Q2z17TUnKMo0WiTFAJ0YBJZ3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666530; c=relaxed/simple;
	bh=kJNiFRLF7H4LjZ/coxhuUGIOAqe9bVjlbeU5PUN3VPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flvbZhuzHan3pIGiCazGq8tokae/ZfQF2hks15337yy9YMWd26bx/HlTFBFeWmzpFBOAeeHMLLatxxzbSiy1r3T6dWWc74glezqv4zAno3zoliKTOnK8BAQeJy30cAYcGQ3IfcXbqgx31kvv7TEaMSerl5fuu1flhWqrdNTA5V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fz+z4PRy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fz+z4PRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773666528; x=1805202528;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kJNiFRLF7H4LjZ/coxhuUGIOAqe9bVjlbeU5PUN3VPU=;
  b=fz+z4PRyfVfuOL01eO2QpmYV1DHDEIa5P1EiBYp1LjSTXNrmbbI7q34i
   jYuPYIh7ragRw7PEYgaZHA1UI2JG1lujMBZfPfpYrfOaLNy7S+edOwgDM
   mhW8C3t5S1+mjALokuIlPk507wyjt+1//Y6yHwaEYIYClSxg69r4zUrGo
   YtHu7DDiu8Ceq77qpZvieAF8EatCyKtK/z6Wea0WAIgCk9Ax9+bz/ku81
   U7/+E0dySKJKxquEHGlE2VNkup4hySjaI53cKW31hcusML5/3Zf/eb0yh
   jb0CbMfQJxegxiMhsQUOHHKx0sFu9fR2PLMdOVsR29tWa1JmZMGgd5qsi
   Q==;
X-CSE-ConnectionGUID: aBTDv0AeRRihj3ATWvvI/w==
X-CSE-MsgGUID: vzmAb8LvTlu+CSVKHitI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73696500"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73696500"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:08:47 -0700
X-CSE-ConnectionGUID: 6TKlWFBaSty9ZwT5F5QvfQ==
X-CSE-MsgGUID: i0gUmSzTTA6+dA4IQGl4FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221859602"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Mar 2026 06:08:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w27gZ-000000004EP-15uf;
	Mon, 16 Mar 2026 13:08:43 +0000
Date: Mon, 16 Mar 2026 14:08:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe
 controller
Message-ID: <202603161429.tNXnD2ov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
References: <20260316-ultrarisc-pcie-v1-3-ef2946ede698@ultrarisc.com>
TO: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Jingoo Han <jingoohan1@gmail.com>
TO: Xincheng Zhang <zhangxincheng@ultrarisc.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Jia Wang <wangjia@ultrarisc.com>

Hi Jia,

kernel test robot noticed the following build errors:

[auto build test ERROR on f338e77383789c0cae23ca3d48adcc5e9e137e3c]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Wang-via-B4-Relay/riscv-add-UltraRISC-SoC-family-Kconfig-support/20260316-151310
base:   f338e77383789c0cae23ca3d48adcc5e9e137e3c
patch link:    https://lore.kernel.org/r/20260316-ultrarisc-pcie-v1-3-ef2946ede698%40ultrarisc.com
patch subject: [PATCH 3/4] dt-bindings: PCI: Add UltraRISC DP1000 PCIe controller
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: openrisc-randconfig-2051-20260316 (https://download.01.org/0day-ci/archive/20260316/202603161429.tNXnD2ov-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161429.tNXnD2ov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603161429.tNXnD2ov-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml: ignoring, error parsing file
--
>> Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:38:19: mapping values are not allowed here
--
>> Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:26:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
>> Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml:38:19: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
   Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1: [warning] too many blank lines (2 > 1) (empty-lines)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
