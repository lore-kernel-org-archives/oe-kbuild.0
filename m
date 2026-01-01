Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FD02E8B94
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767283668; cv=none; b=PmmFYPYevsMQ2M0tsAO6RAPzVbjWnELJkOaIWUOayeEgIggvkoIiNIXgHB0XFxrLPMFQsHUIzQdiizyNwloMAJmItqG326heTpdXCEaGpLTb9zAdKfFV+/risFNRGK1BurtgcwSPIyDFS+ASQ+tuSPYybM5rDm8shzHf6V13J5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767283668; c=relaxed/simple;
	bh=mEzR7ByQgATBb72TVglsM4x7MJr1Y9kQEtgHRiRc9g8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mB8/2vnV43gdA2W5UBwuiP86H7fPfoZRsGvvSDu3BA+7sTOvuIPRMhp/CpRJZpWJJHLw581JiR82wsIOudNtPPuPFB7Y515FuMISTMQHfJAzySCTbM7+xkfZesxPyhq5bFgerJWGbNXByX3c57cqVCDTuk5ZRErFy2SbcMkyRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVl27nw7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVl27nw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767283665; x=1798819665;
  h=date:from:to:cc:subject:message-id;
  bh=mEzR7ByQgATBb72TVglsM4x7MJr1Y9kQEtgHRiRc9g8=;
  b=MVl27nw7LTA7FFTVh1osLXK/wBoZN0SVyY0CntmsYurJS4aljw22qBf/
   e1if6RVyoBPTjKjzhlFF24b5OiIK3/pMyUPXSzMOJ5gQhrOZXzY7Yh23P
   vCP2p8hGcxEhWtnZGbuV6eCLCJFHmsGpyh/W5kjJp8MuGf7LqssSzwxfr
   pc532j6qBoyFVvbbSACcA9dZlqZ3/TkBngvzzXoTBHxFDrzCF+NesQtaa
   Z6NZorfaiI2isZUJOcPGPkYUKsDw8dIlx0ucH1mTMJkDXQDG7n4aFHlSz
   q2oxJaH//ze5Vv3+Lumjf4nunAO3NvLMPUiP7L00sI4OVwINe9lR7mhV7
   A==;
X-CSE-ConnectionGUID: k97Le+trSWm7NDbvkDn3Yw==
X-CSE-MsgGUID: u/9A+NRZSc2h2Hhy7Z4lKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68718947"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="68718947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 08:07:42 -0800
X-CSE-ConnectionGUID: On08RxB7TkiWvcLfbEnnhA==
X-CSE-MsgGUID: MMz0TeB5R9KYJ1H85x/nEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="205805732"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jan 2026 08:07:42 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbLD8-000000001uv-3vMC;
	Thu, 01 Jan 2026 16:07:38 +0000
Date: Fri, 02 Jan 2026 00:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/spi/spi-offload.c:181:15-22: ERROR: invalid
 reference to the index variable of the iterator on line 169
Message-ID: <202601020045.cRWaypvi-lkp@intel.com>
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
CC: Mark Brown <broonie@kernel.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Nuno Sa <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b69053dd3ffbc0d2dedbbc86182cdef6f641fe1b
commit: 5a19e1985d014fab9892348f6175a19143cec810 spi: axi-spi-engine: implement offload support
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260102/202601020045.cRWaypvi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 86b9f90b9574b3a7d15d28a91f6316459dcfa046)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601020045.cRWaypvi-lkp@intel.com/

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
