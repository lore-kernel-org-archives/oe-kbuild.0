Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850472F30
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 00:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755389581; cv=none; b=f4iylczIQgbT/iVu82y18Af1FNFKu2c2B4uNJoYghswqHhOpBq+PrEdrRp/QDaDnQXzGmXANyUnBvY0Kpdy3FlGPnWuXmQlKPxejVuJb3Z5XFXDxRA+EWKgl0XqqRfp4QsBxd7iW9byfYhLA+uQvG/pm/oX5CPJ3okb5twysbSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755389581; c=relaxed/simple;
	bh=c1BflRP2kesPu9euT1QEXXx6MGE4kAsf7hlrzR+BnUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9r03e2yUDSX6tgw50KIYbWPaxyoh3yHE/G6Tq4kBH/4jjQ1xGkBC8hJTZwLjObGJVXykYy8Gg9rCQnPau+ZM2fhrPdrwJgMJIfV/RlddROfioJNVjDGhgUHbxsaJX67msjD9HpXY0lBs+0XJCi/cMQE6UYuvKLk6Qt2Hg2b8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6PZOx55; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6PZOx55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755389579; x=1786925579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c1BflRP2kesPu9euT1QEXXx6MGE4kAsf7hlrzR+BnUI=;
  b=A6PZOx55H3L4UpvVamRxmNQrtbxgBoIDe5H7x4jQJUUGUEmR5oJePG2b
   dgLWcfIxZg++Hs8h35fXCU2NXwuWKvsZujIOiBvewt8e5XAbXuEDYnlBw
   96Q1At7tLFfIj1Rh6TNa50GJa5wOjApADa1lFx/Cbdzny0whBIH3cotwO
   jeE87+dliI8NHtPJ8L95sx97XEGT3jQiCp4oXBdASRzjuo/snOzqgMKjG
   plbvViW6T2Ba/SPy1awrwBU7oXI5DQEKhIN2c2+BrLXJ/JzsWkGBxFXR3
   x/DkgMvf52zSScV+5lao+PP55sDHWeXt3Dz93eI4ecK2XV9E1Co1IElVq
   A==;
X-CSE-ConnectionGUID: OxgDuqCAR8yZFp9U9oXruQ==
X-CSE-MsgGUID: bMBE6pdVTjmDHtMs42Z2Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57765761"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57765761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 17:12:59 -0700
X-CSE-ConnectionGUID: HR66c2uqSHGJjV1WiGOkfA==
X-CSE-MsgGUID: d0NT2d7WSOiITHWX1BBPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198283394"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Aug 2025 17:12:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unR15-000DH1-1v;
	Sun, 17 Aug 2025 00:12:55 +0000
Date: Sun, 17 Aug 2025 08:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] riscv: dts: thead: th1520: add coefficients to the
 PVT node
Message-ID: <202508170730.VFr1mLlG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250816093209.2600355-2-uwu@icenowy.me>
References: <20250816093209.2600355-2-uwu@icenowy.me>
TO: Icenowy Zheng <uwu@icenowy.me>
TO: Drew Fustini <fustini@kernel.org>
TO: Guo Ren <guoren@kernel.org>
TO: Fu Wei <wefu@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Han Gao <rabenda.cn@gmail.com>
CC: Yao Zi <ziyao@disroot.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/riscv-dts-thead-th1520-add-coefficients-to-the-PVT-node/20250816-173608
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250816093209.2600355-2-uwu%40icenowy.me
patch subject: [PATCH 1/3] riscv: dts: thead: th1520: add coefficients to the PVT node
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: riscv-randconfig-052-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170730.VFr1mLlG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170730.VFr1mLlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508170730.VFr1mLlG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-j: -160 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-j: -160 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
