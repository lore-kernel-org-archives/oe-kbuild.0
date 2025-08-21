Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B518E4AEE2
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 05:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755753156; cv=none; b=RUgxbc1EX2rJdZ9nls98DEbizAD0IW0VChVnVnPCQOHrcda9+5Xs8npWWaIjAAbPmor2P6yu1zqgiZJKHwztQNdWdV9SubMuXV9fJBYPPrHNVzOrZ5PGeGiNJS3o1Mfp1WIVtOZEi3EpeEit/MbNWiRafqo7MIqYMs7D8NKlyh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755753156; c=relaxed/simple;
	bh=FMvYLVfRfrEkqpOz0q7K2r169ciuP5AxLdskapwdzpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Te5KLdlBbMzPxoZCUpgZRsc4K61IvwB5RodlIDtQeCn2g1wy18vWc6XeSB+8yF7bJQl/GrSaR4GwdDg3mOJvCye5Z1surs/fZBwDn5lOLV8IpXUeRt1D0FO+wn3j4VEF5nFLxsNsjgVB4yT1K4dkkEU+jyiw/Efhwt2phOWJWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPux8a7E; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPux8a7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755753155; x=1787289155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FMvYLVfRfrEkqpOz0q7K2r169ciuP5AxLdskapwdzpI=;
  b=SPux8a7Ecmq5vPSy84FKRwrtw/N+UR8T9AXI2Ri5hlEm/2zUk84wSRfy
   o8bqgKENIIJ8nSL9gZQKg5FCAJt+xz9j/68edu6/ml0+9MNV3iqbfE0/v
   FP2JVOvFZHyPtdas0ZYqtCD5pe8QuHYOy8L9YXLhmqdUgWSzBDUJQERHw
   f8jZYYkk8aDpvNhkwqiVbndDM+FyViseZjM93jHZi9D+H4qxP0m6e3vlp
   SvNYZNkYFhNqaoWugU4HgdrVLonaTno3dudlJpYz30XoB25EF0hrz7pCT
   P/FfY78wgT7X88YNM2PEO5XB7ulS44DEAMF2d5tyjBNim6eFm2dYsPlbZ
   A==;
X-CSE-ConnectionGUID: HbUWHixdRkCA7cnwPwsDgg==
X-CSE-MsgGUID: 1468h6n0TfSKDPNhCE2mPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61859573"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61859573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 22:12:35 -0700
X-CSE-ConnectionGUID: mJf43wcbSL2UcvEcRJvSrg==
X-CSE-MsgGUID: NBNqrDM6TKib2naIPbXjYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168672929"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2025 22:12:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoxbC-000JxP-3C;
	Thu, 21 Aug 2025 05:12:30 +0000
Date: Thu, 21 Aug 2025 13:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/6] riscv: dts: andes: Add PCIe node into the QiLai SoC
Message-ID: <202508211240.JtiIvH3N-lkp@intel.com>
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
In-Reply-To: <20250820111843.811481-5-randolph@andestech.com>
References: <20250820111843.811481-5-randolph@andestech.com>
TO: Randolph Lin <randolph@andestech.com>
TO: linux-pci@vger.kernel.org
CC: ben717@andestech.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: alex@ghiti.fr
CC: jingoohan1@gmail.com
CC: mani@kernel.org
CC: lpieralisi@kernel.org
CC: kwilczynski@kernel.org
CC: bhelgaas@google.com
CC: randolph.sklin@gmail.com
CC: tim609@andestech.com
CC: Randolph Lin <randolph@andestech.com>

Hi Randolph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus robh/for-next linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Randolph-Lin/riscv-dts-andes-Define-dma-ranges-for-coherent-port/20250820-200016
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250820111843.811481-5-randolph%40andestech.com
patch subject: [PATCH 4/6] riscv: dts: andes: Add PCIe node into the QiLai SoC
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-052-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211240.JtiIvH3N-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211240.JtiIvH3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508211240.JtiIvH3N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/andes/qilai-voyager.dtb: cache-controller@200000 (andestech,qilai-ax45mp-cache): cache-sets: 1024 was expected
   	from schema $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
>> arch/riscv/boot/dts/andes/qilai-voyager.dtb: pci@80000000 (andestech,qilai-pcie): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/andestech,qilai-pcie.yaml#
>> arch/riscv/boot/dts/andes/qilai-voyager.dtb: pci@c0000000 (andestech,qilai-pcie): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/andestech,qilai-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
