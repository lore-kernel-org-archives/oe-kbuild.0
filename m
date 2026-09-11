Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498B439D6E5
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 04:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789101984; cv=none; b=RHfy7f6B2LJG62K9sZMzfz+ShqCYOAOLEMamm9VjAtJC1VGenfLOT8WvaDIJmLdo3fmJe5eT4xPGjWID9o+e68wmJGWsPNBNgl/Bh7usfPngCKkASXzNtej++Y0aTHBcA5UnicPlCLR8y4qy7uGyOEziYBfwFEkowXJPX1avfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789101984; c=relaxed/simple;
	bh=I8K9HJACTtwPkiLh8lw7Lgv86Rmvn7Bqj4bUy5Uzx78=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NRpyZCoxal6LSKeqIQrczrngk/XxaGDUqX/tpWhxfDdmekNCV3WCAElU0btoAdOjyGZLI2uwxmuepIuZO2sdIyAicVj/efWcdt8ekloXpk73DObX0XlYvoZRK1Bqb1NQZlWMhVJrsfNIbTKtqCDezMCnso3WhtzJDQ26X+rbbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8wOpVmk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8wOpVmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789101983; x=1820637983;
  h=date:from:to:cc:subject:message-id;
  bh=I8K9HJACTtwPkiLh8lw7Lgv86Rmvn7Bqj4bUy5Uzx78=;
  b=X8wOpVmkvC3R3lvhBFz8j8h2Rc8pILGDvPYMNIxWv/Bi4nGkhJDomOWW
   e5iDHBXeYedfAWGTCJTflR/m9FfsO765BlGgwbQ5zB+1kkDrRF2L15zE3
   8bH8aAu5WMGJhNRzdwzXzALz9KngLCTEJzQzOnm1CQkp6o1SSq/AOkVoU
   /NEYqJSYUK3R89+oul00wOryqnVUTiNoYJkS24y4KjVvQhtWpn+fyqxlW
   Wkr+25U0Kjutod58y/e8ssLs9xQSOVJyI8axKLKssnsQOIxAquiOx+ywk
   ICzqhXfSoL/ZMTdNKxO3XnpZYPgMNhdPFIcQTc9CsY9vxJ8l0L+uw+hlP
   g==;
X-CSE-ConnectionGUID: hWafH5ELRba6oyD2GkzyjA==
X-CSE-MsgGUID: FZRdKUSpRpihbn5okeDQ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89403010"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89403010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 21:46:23 -0700
X-CSE-ConnectionGUID: VmcNCffVQUuk6oX3nFOfjg==
X-CSE-MsgGUID: WpkfqCJ1T2WDedK47jmbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="275593147"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Sep 2026 21:46:22 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4t9W-0000000011a-4Arq;
	Fri, 11 Sep 2026 04:46:18 +0000
Date: Fri, 11 Sep 2026 12:46:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/hwmon/pmbus/tda38740.c:58:42: error: invalid
 application of 'sizeof' to an incomplete type 'struct tda38740_data'
Message-ID: <202609111238.o3pozuou-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Colin-Huang/dt-bindings-hwmon-pmbus-Add-Infineon-tda38740-and-tda38725/20260910-203550, commit: 624603abe6d524d514b8131b2532f3515e6b7b2e"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Colin Huang <u8813345@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Colin-Huang/dt-bindings-hwmon-pmbus-Add-Infineon-tda38740-and-tda38725/20260910-203550
head:   624603abe6d524d514b8131b2532f3515e6b7b2e
commit: 624603abe6d524d514b8131b2532f3515e6b7b2e hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111238.o3pozuou-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111238.o3pozuou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609111238.o3pozuou-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/tda38740.c:58:42: error: invalid application of 'sizeof' to an incomplete type 'struct tda38740_data'
      58 |         data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
         |                                                 ^~~~~~~
   drivers/hwmon/pmbus/tda38740.c:56:9: note: forward declaration of 'struct tda38740_data'
      56 |         struct tda38740_data *data;
         |                ^
>> drivers/hwmon/pmbus/tda38740.c:62:14: error: incomplete definition of type 'struct tda38740_data'
      62 |         memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
         |                 ~~~~^
   include/linux/fortify-string.h:641:17: note: expanded from macro 'memcpy'
     641 |                 __struct_size(p), __struct_size(q),                     \
         |                               ^
   include/linux/compiler_types.h:525:56: note: expanded from macro '__struct_size'
     525 | #define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
         |                                                               ^
   include/linux/fortify-string.h:578:27: note: expanded from macro '__fortify_memcpy_chk'
     578 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   drivers/hwmon/pmbus/tda38740.c:56:9: note: forward declaration of 'struct tda38740_data'
      56 |         struct tda38740_data *data;
         |                ^
>> drivers/hwmon/pmbus/tda38740.c:62:14: error: incomplete definition of type 'struct tda38740_data'
      62 |         memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
         |                 ~~~~^
   include/linux/fortify-string.h:642:17: note: expanded from macro 'memcpy'
     642 |                 __member_size(p), __member_size(q),                     \
         |                               ^
   include/linux/compiler_types.h:526:56: note: expanded from macro '__member_size'
     526 | #define __member_size(p)        __builtin_dynamic_object_size(p, 1)
         |                                                               ^
   include/linux/fortify-string.h:580:33: note: expanded from macro '__fortify_memcpy_chk'
     580 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   drivers/hwmon/pmbus/tda38740.c:56:9: note: forward declaration of 'struct tda38740_data'
      56 |         struct tda38740_data *data;
         |                ^
>> drivers/hwmon/pmbus/tda38740.c:62:14: error: incomplete definition of type 'struct tda38740_data'
      62 |         memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
         |                 ~~~~^
   include/linux/fortify-string.h:640:47: note: expanded from macro 'memcpy'
     640 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                               ^
   include/linux/fortify-string.h:595:20: note: expanded from macro '__fortify_memcpy_chk'
     595 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/hwmon/pmbus/tda38740.c:56:9: note: forward declaration of 'struct tda38740_data'
      56 |         struct tda38740_data *data;
         |                ^
   drivers/hwmon/pmbus/tda38740.c:64:37: error: incomplete definition of type 'struct tda38740_data'
      64 |         return pmbus_do_probe(client, &data->info);
         |                                        ~~~~^
   drivers/hwmon/pmbus/tda38740.c:56:9: note: forward declaration of 'struct tda38740_data'
      56 |         struct tda38740_data *data;
         |                ^
   5 errors generated.


vim +58 drivers/hwmon/pmbus/tda38740.c

624603abe6d524d Colin Huang 2026-09-10  53  
624603abe6d524d Colin Huang 2026-09-10  54  static int tda38740_probe(struct i2c_client *client)
624603abe6d524d Colin Huang 2026-09-10  55  {
624603abe6d524d Colin Huang 2026-09-10  56  	struct tda38740_data *data;
624603abe6d524d Colin Huang 2026-09-10  57  
624603abe6d524d Colin Huang 2026-09-10 @58  	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
624603abe6d524d Colin Huang 2026-09-10  59  	if (!data)
624603abe6d524d Colin Huang 2026-09-10  60  		return -ENOMEM;
624603abe6d524d Colin Huang 2026-09-10  61  
624603abe6d524d Colin Huang 2026-09-10 @62  	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
624603abe6d524d Colin Huang 2026-09-10  63  
624603abe6d524d Colin Huang 2026-09-10  64  	return pmbus_do_probe(client, &data->info);
624603abe6d524d Colin Huang 2026-09-10  65  }
624603abe6d524d Colin Huang 2026-09-10  66  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
