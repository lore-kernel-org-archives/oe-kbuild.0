Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C0148FE4
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Nov 2024 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732923128; cv=none; b=jUxIKfnCqdBt9yRavqRob2AYD3L5X/KcczWVpXYc58NN/UtrE2G3LdLge3pkhCIrR54AbSEPn2e1QDdUJlGYizLpvhhH4k19dOLi1psKZS48PYAJAfYDXqCbVN6Jou8dcycJxxOn+SE4oSgS/FhPfjNL5fL4m9fViDb4SBZ5MxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732923128; c=relaxed/simple;
	bh=MjBB0jS31Pvjdj3OEeZM0L9WL4JwDDNDfORFcVKAO5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FxosGoSXKlbT+T3gXKX9PSRxfGhNxpNRu+XBFNDddzcAyTpzVkUQnUSAgBi8M1gBDwCMvnlpxQev+OkFR81nUztR6rh53GBoYEAfKAkhxZMFdeeGrP02qxyV8ZGZjXYCMqZRQx4wntTtY9D1M14u7YbwpS1juTZTXN4frh/FmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQSfsw4h; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQSfsw4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732923127; x=1764459127;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MjBB0jS31Pvjdj3OEeZM0L9WL4JwDDNDfORFcVKAO5U=;
  b=EQSfsw4hEuJvTdk8nFiZjZdVAsi9Lw++JtgZjNq2Gt1WG06rEtZ2/htl
   kqkRqd8UbWry7/jt/Gsl7l0VUMLRO+dm9PMfGkct6St3/UED+tSw36D2q
   vqQiTgkwI/a+9+Af+Jgd7BMa25vNCQkjjDBa/MmgZZWSSQsgQc+yvfn4h
   dkFRhmSdkWqtPz959MZcBDtifjlqTiQD/w7WjJxpNFH33E8gXFb3gh9JO
   gzM4hiAvifNr6snRrEAvMREf+GCpwbFvhaNspfKqgV8ydjhpF2BkXml0k
   7QSzyA6hrs8pu7GeEwH9qkIStIWbbXRZVBuSfsZp/0CyTbMty/FuFrNCE
   g==;
X-CSE-ConnectionGUID: TLJclthbSLSCekQ8SncqaQ==
X-CSE-MsgGUID: /Ab7A0vLQXeVnXZtyvCkXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43825422"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43825422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 15:32:06 -0800
X-CSE-ConnectionGUID: 5ZL/Rw44QSawnHahiianDA==
X-CSE-MsgGUID: lOZ1pfRaTy21uFz9H2GwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92972297"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 15:32:05 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHASw-0000lP-1d;
	Fri, 29 Nov 2024 23:32:02 +0000
Date: Sat, 30 Nov 2024 07:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 11687/12916]
 drivers/i2c/busses/i2c-nomadik.c:1077:1-2: nmk_i2c_eyeq_match_table is not
 NULL terminated at line 1077
Message-ID: <202411300752.cqGMW7Nn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
commit: c22d11605331ee77ef001a33dff4f38c5c7d2d06 [11687/12916] i2c: nomadik: switch from of_device_is_compatible() to of_match_device()
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
config: riscv-randconfig-r064-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300752.cqGMW7Nn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411300752.cqGMW7Nn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-nomadik.c:1077:1-2: nmk_i2c_eyeq_match_table is not NULL terminated at line 1077

vim +1077 drivers/i2c/busses/i2c-nomadik.c

c22d11605331ee Théo Lebrun 2024-10-09  1072  
c22d11605331ee Théo Lebrun 2024-10-09  1073  static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
c22d11605331ee Théo Lebrun 2024-10-09  1074  	{
c22d11605331ee Théo Lebrun 2024-10-09  1075  		.compatible = "mobileye,eyeq5-i2c",
c22d11605331ee Théo Lebrun 2024-10-09  1076  		.data = (void *)(NMK_I2C_EYEQ_FLAG_32B_BUS | NMK_I2C_EYEQ_FLAG_IS_EYEQ5),
c22d11605331ee Théo Lebrun 2024-10-09 @1077  	},
c22d11605331ee Théo Lebrun 2024-10-09  1078  };
c22d11605331ee Théo Lebrun 2024-10-09  1079  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
