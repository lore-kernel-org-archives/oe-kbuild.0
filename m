Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7D0B652
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731859251; cv=none; b=oZEdDqYkR20KwSmE5gvs5O8uY4UOJYoGSFcMNFp0Aj1agvRla6L6nTiw/jw5Z6bdTjP3tND7SiUgwua6dVBfJaIOkmtIPuKFHkqMfbysQ5eHkpTHjayiqWI6+GslCzxIi8qiIwLDflDAqzj8I45/98a7vclK3B6rf2/iinAxuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731859251; c=relaxed/simple;
	bh=wG1Yl3RvFwjakX4ZOAelsyQo8MSKPryK2jEbDDOCXHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOU5Vve1MrlCWZ2+mgDP+CWlwmrIKztkwMdhQZKM58xe749tEWRkwFjhQhmBdBiaGLLkPeZz4D2ubnnNPRTK2CmoyvFDOWpZSNSbM3s67z8blv8QcMmKonme66EtQu/KkVIWC+r+l/fVOMbE7Mxdddursxg13/igqElg7vAc8Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3vSaNmc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3vSaNmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731859250; x=1763395250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wG1Yl3RvFwjakX4ZOAelsyQo8MSKPryK2jEbDDOCXHs=;
  b=T3vSaNmcjxAO+X/GPe0N5kgoRXW+Rh2S1cYsZwhSWlfwlRYM+DOmbXXG
   5DF72W6e0FcSl2XNvAf2Kis9YoJ5ego+9Pcv3uPXDs05hUmOTMcU89xKv
   lB5aOGrLWWRGGvDBtnRqlsqa0sa6LMD/sUPEgG5kJYbEP0sOztAGMzAp4
   G0oqAjS+341CylUoSJrWVVGLU8mLWbSXQSKChsKehVH457pV567h9OCaF
   uHNhwJWGQKG0l+RDGvSGY6e9VKVkawy/umUfcmg6VCVGxKpjESXSKY7aP
   bkPcOJoxAZWtMgkF8N4vVp/rCzpPPFFuuu0XJAG1ITeic690/5l8fLMaR
   Q==;
X-CSE-ConnectionGUID: 5zPuKkbURa6Burup08YYyA==
X-CSE-MsgGUID: H/mUrsgwSo2owldjRfJYEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31947070"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31947070"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 08:00:50 -0800
X-CSE-ConnectionGUID: ntql5S4ZTSCGbtG5N0fdrA==
X-CSE-MsgGUID: JPugmbFySpWD+y/Q1DqBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="112304856"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2024 08:00:48 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tChhd-0001s7-2g;
	Sun, 17 Nov 2024 16:00:45 +0000
Date: Mon, 18 Nov 2024 00:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chenhuacai-loongson:loongarch-next 5/8]
 arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: /bus@10000000/i2s@1fe2d000:
 failed to match any schema with compatible: ['loongson,ls2k1000-i2s']
Message-ID: <202411172316.4JGjb9Ol-lkp@intel.com>
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
TO: Binbin Zhou <zhoubinbin@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   66b31c6222ee988c7a708b0bb83e35e064f498f1
commit: 1725736ff87d0bace9b449e5610b5eebbbfee64f [5/8] LoongArch: dts: Add I2S support to Loongson-2K1000
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: loongarch-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172316.4JGjb9Ol-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172316.4JGjb9Ol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411172316.4JGjb9Ol-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: /bus@10000000/i2s@1fe2d000: failed to match any schema with compatible: ['loongson,ls2k1000-i2s']
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000: ethernet@3,1:interrupts:0: [14, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
