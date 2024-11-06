Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E717995E
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 06:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730875516; cv=none; b=WyS14mFPkS/LBLU/GjnOV3axyDA9dGVURzC5kuAaQy6r/+INyzEvwcWAxbdWTRM++w16oDSt7sFjX4+0YHMOFpnc7mbtb1OldAP80P7Dh0iF06mg75/LzSu1X0vKooF4Kh6r0z56CrVsf46YIkgWtdXsi7talwmFcOKzblZ35c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730875516; c=relaxed/simple;
	bh=JeaCX4CqmpKeGh7PjvA3XDhxW7Sb9E7q6+fFpmwAjHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPlMYXyG55xp5/JM45jHuxEdwDq9eNeKMhNJ/h1Nm2jKYnO8wX+6xlYAylAs2wNJWSOdnyhSz87WSUmv6aStxgOOoQfFpELasZPwDHKunS4C+CTD4UfV5DqGY4D8rXwOL27W9sJ1ZULS22WpxYqcfyZTRR1DE++IFpKBiX24eiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjbfP3ko; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjbfP3ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730875514; x=1762411514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JeaCX4CqmpKeGh7PjvA3XDhxW7Sb9E7q6+fFpmwAjHQ=;
  b=ZjbfP3koFNJ4EJ6RpEIlNbRoOO2VJYK9yWmwoKL4tJjSiGqGOlRRxNf6
   vTF3LfZhLbGz8DQO92AHFZpt3zv08z9ggyHPqfIyi1so1K2ZKU1hthXk+
   R8+8ry/mMVoxhDKjPipDeyJL2MUKGayWb5GPKeos+hw5fqbwlH0+ejFxA
   94wluTGE+CuIa6s5V/w5aMg25kZr8kX8wowx7IjL1m1ds3zq7uYWaUz7p
   Q8wVk3Aq/Urmty5F0bWvvWOeQGT2gv0WwVm8EGUN9SYGk60LpPF59YPeF
   ojvyxBasvnCnGijGjpWslJzUJCgv8oCazYOdWsON06dINod3NRtFlGUWS
   Q==;
X-CSE-ConnectionGUID: HVrAaYZ7QzGIWWSTZF2k3Q==
X-CSE-MsgGUID: ukjxK4D3S6WYlsED3T8XFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="48173141"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="48173141"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 22:45:14 -0800
X-CSE-ConnectionGUID: muxwlYO3RrG4TG7p0YJlsQ==
X-CSE-MsgGUID: s94X2MRdRG2NZCAmZKruOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="107699959"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2024 22:45:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Zmv-000n1A-2I;
	Wed, 06 Nov 2024 06:45:09 +0000
Date: Wed, 6 Nov 2024 14:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 01/10] dt-bindings: imx6q-pcie: Add ref clock for
 i.MX95 PCIe RC
Message-ID: <202411061437.FyLjaZdd-lkp@intel.com>
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
In-Reply-To: <20241101070610.1267391-2-hongxing.zhu@nxp.com>
References: <20241101070610.1267391-2-hongxing.zhu@nxp.com>
TO: Richard Zhu <hongxing.zhu@nxp.com>
TO: l.stach@pengutronix.de
TO: bhelgaas@google.com
TO: lpieralisi@kernel.org
TO: kw@linux.com
TO: manivannan.sadhasivam@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: frank.li@nxp.com
TO: s.hauer@pengutronix.de
TO: festevam@gmail.com
CC: imx@lists.linux.dev
CC: kernel@pengutronix.de
CC: linux-pci@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Richard Zhu <hongxing.zhu@nxp.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

Hi Richard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus shawnguo/for-next mani-mhi/mhi-next linus/master v6.12-rc6 next-20241105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Zhu/dt-bindings-imx6q-pcie-Add-ref-clock-for-i-MX95-PCIe-RC/20241101-150006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241101070610.1267391-2-hongxing.zhu%40nxp.com
patch subject: [PATCH v6 01/10] dt-bindings: imx6q-pcie: Add ref clock for i.MX95 PCIe RC
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20241104 (https://download.01.org/0day-ci/archive/20241106/202411061437.FyLjaZdd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061437.FyLjaZdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061437.FyLjaZdd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
