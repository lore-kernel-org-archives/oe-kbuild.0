Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733E3E714C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406931; cv=none; b=Ykx120vTGleQqlbdG/QDi0CBKvzn1p0HjoN/ekcQFxIi3SNCYpe2G1Lb86ugKKRIL79Akf3ltpBHN4LMLjBoEtXQFh0cpfnWIb+SaHN5w78gjjoh2bZcdhrzvsrfSLEcqaelpW5m8/5SUBnsuk0J/RYk+x7q6VcoZYmyCREhzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406931; c=relaxed/simple;
	bh=8KCuOPKqLkV15a5G5Gf+Zun1idauyFoMF7BvCxc7CKM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QcglSXYYB7bfydtXlMUARcrG2FGVQQ82lO3kit1t7QNf6/amFnvJjVv230Org764B/nUOIRyef2eIbuq6H1ZGNfzFtIDeYF9qlf1bF0z+NB2RfpCEylGux/mLWvHB4xnCRYFabws++10SS2l3CobWD+wxyaxUSYc3DDcCEzl/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3eM95HD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3eM95HD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780406930; x=1811942930;
  h=date:from:to:cc:subject:message-id;
  bh=8KCuOPKqLkV15a5G5Gf+Zun1idauyFoMF7BvCxc7CKM=;
  b=G3eM95HDod3+65z5iWqvADKP76xX/7mjLPmmSfazyXWc982iIfkCly8u
   LWebaLuy7tgQkblMzYa5S8I4sqBP99lrscbout0z1rOEnaOF1STbriLmz
   T2LJta3JdliL+bPLTU/N7gxeX2+m3fxzxd2u6JLwSIIInNvMwrQ4sj2xm
   QCP15AxCV0u4g/CtCjzQTTpSTcIG+3rcPFt3FO2Cgj++yFlTFozSPMooq
   pP4Ktd7wDu49aoVOZ2CW+ENisKAAz03MezfshTOSrw/SbGaOaXAiibaTy
   B6PP3LLpxkKoAfQ7R3qp9IDleTnz1+q+D/CjKM1PHVtK7dI891j1MGQyW
   A==;
X-CSE-ConnectionGUID: npPxYnonTi+QxciNaVSBLQ==
X-CSE-MsgGUID: DcOkB0WDR02rMKLLgE77Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="92302325"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92302325"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 06:28:49 -0700
X-CSE-ConnectionGUID: G//TheyBTviEW32ikKeYpg==
X-CSE-MsgGUID: Od20yoioQGiN9+DbCCnrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242881599"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2026 06:28:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUPAj-00000000C4m-48gs;
	Tue, 02 Jun 2026 13:28:45 +0000
Date: Tue, 02 Jun 2026 21:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-offload.c:181:15-22: ERROR: invalid
 reference to the index variable of the iterator on line 169
Message-ID: <202606022105.yWXRWAPb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Lechner <dlechner@baylibre.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
commit: cbc986cda57a0488069f7c6bda7e16cd592e8157 iio: adc: ad7944: add support for SPI offload
date:   1 year, 4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 4 months ago
config: hexagon-randconfig-r064-20260601 (https://download.01.org/0day-ci/archive/20260602/202606022105.yWXRWAPb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cbc986cda57a ("iio: adc: ad7944: add support for SPI offload")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606022105.yWXRWAPb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-offload.c:181:15-22: ERROR: invalid reference to the index variable of the iterator on line 169

vim +181 drivers/spi/spi-offload.c

d7231be4b4657e David Lechner 2025-02-07  158  
d7231be4b4657e David Lechner 2025-02-07  159  static struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  160  *spi_offload_trigger_get(enum spi_offload_trigger_type type,
d7231be4b4657e David Lechner 2025-02-07  161  			 struct fwnode_reference_args *args)
d7231be4b4657e David Lechner 2025-02-07  162  {
d7231be4b4657e David Lechner 2025-02-07  163  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  164  	bool match = false;
d7231be4b4657e David Lechner 2025-02-07  165  	int ret;
d7231be4b4657e David Lechner 2025-02-07  166  
d7231be4b4657e David Lechner 2025-02-07  167  	guard(mutex)(&spi_offload_triggers_lock);
d7231be4b4657e David Lechner 2025-02-07  168  
d7231be4b4657e David Lechner 2025-02-07 @169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172  
d7231be4b4657e David Lechner 2025-02-07  173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177  
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180  
d7231be4b4657e David Lechner 2025-02-07 @181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182  
d7231be4b4657e David Lechner 2025-02-07  183  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  184  		return ERR_PTR(-ENODEV);
d7231be4b4657e David Lechner 2025-02-07  185  
d7231be4b4657e David Lechner 2025-02-07  186  	if (trigger->ops->request) {
d7231be4b4657e David Lechner 2025-02-07  187  		ret = trigger->ops->request(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  188  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  189  			return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  190  	}
d7231be4b4657e David Lechner 2025-02-07  191  
d7231be4b4657e David Lechner 2025-02-07  192  	kref_get(&trigger->ref);
d7231be4b4657e David Lechner 2025-02-07  193  
d7231be4b4657e David Lechner 2025-02-07  194  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  195  }
d7231be4b4657e David Lechner 2025-02-07  196  

:::::: The code at line 181 was first introduced by commit
:::::: d7231be4b4657e5f922a4c6dc11e8dffc71fee87 spi: offload: add support for hardware triggers

:::::: TO: David Lechner <dlechner@baylibre.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
