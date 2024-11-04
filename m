Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A81B5EBC
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730747136; cv=none; b=B0/d8X1FDbJt1wJQ3AddrB2ATqlRxUnd66old+GJnHYF3yhFEVx6pWMD4uAYD3OTTGnktEN12cANFyMiCMHUPaPud5fcgo/YThdy7J4Ol1pEcCxh8MIfxpLabjiYa08iKDD8vGFN27FPOg1Eu16Q/z4CMRBGNzuKAAJZzlJUPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730747136; c=relaxed/simple;
	bh=SoTqqhz4YSCZKZ9fZ/6u2Ju0l0W6IKj3HUKGv8y84bo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPNKoSUlfrxt74taGSWIBIR4vNGx+0reu3xmGZ4iuPXUfalqHra8VjtWMfNGtSNI4Swy99HAll+wL0upbg0qyoJBTWlUAGm8YA+rS+I9uuBxkYhTOMUeOn4qBA7wgqaFnHeSxpgFMx11IwTRIN4MSDV3YNs8LehcMo5mnQCIZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StRJzEGh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StRJzEGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730747135; x=1762283135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SoTqqhz4YSCZKZ9fZ/6u2Ju0l0W6IKj3HUKGv8y84bo=;
  b=StRJzEGhJyGk4wJX7V5Uu0G3//+dGp/I5brlC85nxt8LevtN9kD2FVYU
   QmeWJ+82Di+0VcgxUd395BiRllOk6cex3QcUHhmf7K+OfJgIiSkWR7qG9
   IBSCyLo84x5haxhX6YUk2C/RRX71m7zSrY/xnVAJnpo0z/sggcQ4svQsm
   T/uJhqOgMWTXEjz3bLgMFC/htTRO1rUFQkKvzTqo3KRgce6hXdfv+vV1L
   IiEu6/QxeZNULNVYhOQCJ+ng+i6R83EXX05tkkTGHCMytwv1B/FPn/Zr0
   7iMEP78qv/KX9KYVih7kasysPPcewcxL/wKUHMBHeSHtOnh5aM1TlEn2M
   g==;
X-CSE-ConnectionGUID: 3IQofHB2TDSNp+E2+XeHTQ==
X-CSE-MsgGUID: gJCjvniOQs2Ery2KEQCMOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30626763"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30626763"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:05:34 -0800
X-CSE-ConnectionGUID: PAPIvUa3T8mg47n4vneUtA==
X-CSE-MsgGUID: r6FCsH6gTku0oDitnLjUiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84179262"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 11:05:31 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t82OH-000l9q-0n;
	Mon, 04 Nov 2024 19:05:29 +0000
Date: Tue, 5 Nov 2024 03:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:mpmc_v2 3/3] mm/page_frag_test.c:190 objpool_push()
 error: uninitialized symbol 'rc'.
Message-ID: <202411050345.dl2bIHjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git mpmc_v2
head:   b1b3f4485a8277decc8e13a8a8986b3d9298f316
commit: b1b3f4485a8277decc8e13a8a8986b3d9298f316 [3/3] mm: page_frag: numa-aware push
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: openrisc-randconfig-r072-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050345.dl2bIHjE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411050345.dl2bIHjE-lkp@intel.com/

smatch warnings:
mm/page_frag_test.c:190 objpool_push() error: uninitialized symbol 'rc'.

vim +/rc +190 mm/page_frag_test.c

fe0f006f768f10 Yunsheng Lin 2024-07-31  160  
fe0f006f768f10 Yunsheng Lin 2024-07-31  161  /* reclaim an object to object pool */
fe0f006f768f10 Yunsheng Lin 2024-07-31  162  static int objpool_push(void *obj, struct objpool_head *pool)
fe0f006f768f10 Yunsheng Lin 2024-07-31  163  {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  164  	const struct cpumask *prev = cpu_none_mask;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  165  	int numa_node = numa_mem_id();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  166  	const struct cpumask *mask;
fe0f006f768f10 Yunsheng Lin 2024-07-31  167  	unsigned long flags;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  168  	int start_cpu, cpu;
fe0f006f768f10 Yunsheng Lin 2024-07-31  169  	int rc;
fe0f006f768f10 Yunsheng Lin 2024-07-31  170  
fe0f006f768f10 Yunsheng Lin 2024-07-31  171  	/* disable local irq to avoid preemption & interruption */
fe0f006f768f10 Yunsheng Lin 2024-07-31  172  	raw_local_irq_save(flags);
b1b3f4485a8277 Yunsheng Lin 2024-11-03  173  	rcu_read_lock();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  174  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  175  	start_cpu = raw_smp_processor_id();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  176  	for_each_numa_hop_mask(mask, numa_node) {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  177  		for_each_cpu_andnot_wrap(cpu, mask, prev, start_cpu) {
b1b3f4485a8277 Yunsheng Lin 2024-11-03  178  			rc = objpool_try_add_slot(obj, pool, cpu);
b1b3f4485a8277 Yunsheng Lin 2024-11-03  179  			if (!rc)
b1b3f4485a8277 Yunsheng Lin 2024-11-03  180  				goto out;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  181  		}
fe0f006f768f10 Yunsheng Lin 2024-07-31  182  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  183  		start_cpu = 0;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  184  		prev = mask;
b1b3f4485a8277 Yunsheng Lin 2024-11-03  185  	}
b1b3f4485a8277 Yunsheng Lin 2024-11-03  186  
b1b3f4485a8277 Yunsheng Lin 2024-11-03  187  out:
b1b3f4485a8277 Yunsheng Lin 2024-11-03  188  	rcu_read_unlock();
b1b3f4485a8277 Yunsheng Lin 2024-11-03  189  	raw_local_irq_restore(flags);
fe0f006f768f10 Yunsheng Lin 2024-07-31 @190  	return rc;
fe0f006f768f10 Yunsheng Lin 2024-07-31  191  }
fe0f006f768f10 Yunsheng Lin 2024-07-31  192  

:::::: The code at line 190 was first introduced by commit
:::::: fe0f006f768f106d5d3e40ab87e252107ceb0624 mm: page_frag: add a test module for page_frag

:::::: TO: Yunsheng Lin <linyunsheng@huawei.com>
:::::: CC: Yunsheng Lin <linyunsheng@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
