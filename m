Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9356A146006
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 05:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577364; cv=none; b=K9MYL3ZbFoSNsrw5G6s1+9ow31ycqp0nMEGIoUkacFm6r0pd8tvD2uq0EEJCEbC2GktXexfEw8UdbFsBtiwPFp2DElxu6EKa5m5Vu5NgWrHXoblm8ukK00WAasJu0EGIu8KOdnpnfxe1sfOescA5g9frGyvShv3RojJaX3tAe9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577364; c=relaxed/simple;
	bh=xUiYFWW/znctI1A9Ffvsk0L7I5wupJQh6/SUZ1wIy4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FY1vmZ8H9KDAYUwrHEG/ZcLn4lAYqFnMbsIBqsjK3V6H6J7yX3B1GeAZzyrHHDkZwFhuNcg77b1H3tW0YQWJ0jYG49OURikmJryagmNYnHrGmpofUBxnCjJ9kjvGJrfvpDVp6bqZir1mNLF3/+d0H/L97lz7UdIcHEWnraixz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNXAvBmT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNXAvBmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715577362; x=1747113362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUiYFWW/znctI1A9Ffvsk0L7I5wupJQh6/SUZ1wIy4k=;
  b=nNXAvBmTgRTFzXSyqjBUwMkSSscom9k6RqqTNOZFNUkbMygm9IbkQhIU
   DCnLK5rD3CD314LEtljZufAUOXvN+ykf2L2fIDuJ6oA/MXJRcWxmEzbk0
   pqmK1xv7iGXM1F/tRO6LqjcHJpvn98GjH4xX+r/EzU9vhxUD5zPYxFY7D
   gzETN8nVjM6OMOZu8F0G0IaOnUrXb89YW+0nExXEN5Ov3G7EQKWZ9ptEi
   2zxOJKSRF2DAztYxNYjrqVxK/ADAZQA8wJsKXQlpSQIYkcevSwuHTHGAw
   59SmOjNjBDTKNe4APl3pxZZujkpghe7NcvSefea/QbMzAUaL7jMIDM9Aa
   w==;
X-CSE-ConnectionGUID: ch2C0lgMS9eeHrf8XHuZqA==
X-CSE-MsgGUID: B9UzBWIKRgyokOEvRZbzTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="36871360"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="36871360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 22:16:00 -0700
X-CSE-ConnectionGUID: yRGs/hmiRnWv77RW7mt4cA==
X-CSE-MsgGUID: KP5AQtMXRqml4m0CTRSuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="53444429"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2024 22:15:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6O2W-0009ZL-0s;
	Mon, 13 May 2024 05:15:56 +0000
Date: Mon, 13 May 2024 13:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 10/14] MIPS: CPS: Introduce struct cluster_boot_config
Message-ID: <202405131243.1L77zylN-lkp@intel.com>
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
In-Reply-To: <20240511104341.151550-11-aleksandar.rikalo@syrmia.com>
References: <20240511104341.151550-11-aleksandar.rikalo@syrmia.com>
TO: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Aleksandar Rikalo <arikalo@gmail.com>
CC: "Chao-ying Fu" <cfu@wavecomp.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg Ungerer <gerg@kernel.org>
CC: Hauke Mehrtens <hauke@hauke-m.de>
CC: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org
CC: Marc Zyngier <maz@kernel.org>
CC: Paul Burton <paulburton@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Serge Semin <fancer.lancer@gmail.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Tiezhu Yang <yangtiezhu@loongson.cn>

Hi Aleksandar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus tip/timers/core linus/master v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandar-Rikalo/MIPS-CPS-Add-a-couple-of-multi-cluster-utility-functions/20240511-184836
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20240511104341.151550-11-aleksandar.rikalo%40syrmia.com
patch subject: [PATCH v4 10/14] MIPS: CPS: Introduce struct cluster_boot_config
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r051-20240513 (https://download.01.org/0day-ci/archive/20240513/202405131243.1L77zylN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405131243.1L77zylN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/mips/kernel/smp-cps.c:262:1-25: alloc with no test, possible model on line 269

vim +262 arch/mips/kernel/smp-cps.c

0ee958e102b62b Paul Burton 2014-01-15  212  
0ee958e102b62b Paul Burton 2014-01-15  213  static void __init cps_prepare_cpus(unsigned int max_cpus)
0ee958e102b62b Paul Burton 2014-01-15  214  {
47e42fc012fae4 Paul Burton 2024-05-11  215  	unsigned int nclusters, ncores, core_vpes, c, cl, cca;
1ec9dd80bedc20 Paul Burton 2017-08-12  216  	bool cca_unsuitable, cores_limited;
47e42fc012fae4 Paul Burton 2024-05-11  217  	struct cluster_boot_config *cluster_bootcfg;
47e42fc012fae4 Paul Burton 2024-05-11  218  	struct core_boot_config *core_bootcfg;
245a7868d2f2e5 Paul Burton 2014-04-14  219  
0ee958e102b62b Paul Burton 2014-01-15  220  	mips_mt_set_cpuoptions();
245a7868d2f2e5 Paul Burton 2014-04-14  221  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  222  	if (!core_entry_reg) {
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  223  		pr_err("core_entry address unsuitable, disabling smp-cps\n");
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  224  		goto err_out;
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  225  	}
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  226  
5c399f6eb2c391 Paul Burton 2014-04-14  227  	/* Detect whether the CCA is unsuited to multi-core SMP */
5c399f6eb2c391 Paul Burton 2014-04-14  228  	cca = read_c0_config() & CONF_CM_CMASK;
5c399f6eb2c391 Paul Burton 2014-04-14  229  	switch (cca) {
5c399f6eb2c391 Paul Burton 2014-04-14  230  	case 0x4: /* CWBE */
5c399f6eb2c391 Paul Burton 2014-04-14  231  	case 0x5: /* CWB */
5c399f6eb2c391 Paul Burton 2014-04-14  232  		/* The CCA is coherent, multi-core is fine */
5c399f6eb2c391 Paul Burton 2014-04-14  233  		cca_unsuitable = false;
5c399f6eb2c391 Paul Burton 2014-04-14  234  		break;
5c399f6eb2c391 Paul Burton 2014-04-14  235  
5c399f6eb2c391 Paul Burton 2014-04-14  236  	default:
5c399f6eb2c391 Paul Burton 2014-04-14  237  		/* CCA is not coherent, multi-core is not usable */
5c399f6eb2c391 Paul Burton 2014-04-14  238  		cca_unsuitable = true;
5c399f6eb2c391 Paul Burton 2014-04-14  239  	}
5c399f6eb2c391 Paul Burton 2014-04-14  240  
5c399f6eb2c391 Paul Burton 2014-04-14  241  	/* Warn the user if the CCA prevents multi-core */
1ec9dd80bedc20 Paul Burton 2017-08-12  242  	cores_limited = false;
1ec9dd80bedc20 Paul Burton 2017-08-12  243  	if (cca_unsuitable || cpu_has_dc_aliases) {
5c399f6eb2c391 Paul Burton 2014-04-14  244  		for_each_present_cpu(c) {
1ec9dd80bedc20 Paul Burton 2017-08-12  245  			if (cpus_are_siblings(smp_processor_id(), c))
1ec9dd80bedc20 Paul Burton 2017-08-12  246  				continue;
1ec9dd80bedc20 Paul Burton 2017-08-12  247  
5c399f6eb2c391 Paul Burton 2014-04-14  248  			set_cpu_present(c, false);
1ec9dd80bedc20 Paul Burton 2017-08-12  249  			cores_limited = true;
5c399f6eb2c391 Paul Burton 2014-04-14  250  		}
5c399f6eb2c391 Paul Burton 2014-04-14  251  	}
1ec9dd80bedc20 Paul Burton 2017-08-12  252  	if (cores_limited)
1ec9dd80bedc20 Paul Burton 2017-08-12  253  		pr_warn("Using only one core due to %s%s%s\n",
1ec9dd80bedc20 Paul Burton 2017-08-12  254  			cca_unsuitable ? "unsuitable CCA" : "",
1ec9dd80bedc20 Paul Burton 2017-08-12  255  			(cca_unsuitable && cpu_has_dc_aliases) ? " & " : "",
1ec9dd80bedc20 Paul Burton 2017-08-12  256  			cpu_has_dc_aliases ? "dcache aliasing" : "");
5c399f6eb2c391 Paul Burton 2014-04-14  257  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  258  	setup_cps_vecs();
0f4d3d1155d9a5 Paul Burton 2014-04-14  259  
47e42fc012fae4 Paul Burton 2024-05-11  260  	/* Allocate cluster boot configuration structs */
47e42fc012fae4 Paul Burton 2024-05-11  261  	nclusters = mips_cps_numclusters();
47e42fc012fae4 Paul Burton 2024-05-11 @262  	mips_cps_cluster_bootcfg = kcalloc(nclusters,
47e42fc012fae4 Paul Burton 2024-05-11  263  					   sizeof(*mips_cps_cluster_bootcfg),
47e42fc012fae4 Paul Burton 2024-05-11  264  					   GFP_KERNEL);
47e42fc012fae4 Paul Burton 2024-05-11  265  
47e42fc012fae4 Paul Burton 2024-05-11  266  	for (cl = 0; cl < nclusters; cl++) {
245a7868d2f2e5 Paul Burton 2014-04-14  267  		/* Allocate core boot configuration structs */
47e42fc012fae4 Paul Burton 2024-05-11  268  		ncores = mips_cps_numcores(cl);
47e42fc012fae4 Paul Burton 2024-05-11 @269  		core_bootcfg = kcalloc(ncores, sizeof(*core_bootcfg),
245a7868d2f2e5 Paul Burton 2014-04-14  270  					GFP_KERNEL);
47e42fc012fae4 Paul Burton 2024-05-11  271  		if (!core_bootcfg)
245a7868d2f2e5 Paul Burton 2014-04-14  272  			goto err_out;
47e42fc012fae4 Paul Burton 2024-05-11  273  		mips_cps_cluster_bootcfg[cl].core_config = core_bootcfg;
0ee958e102b62b Paul Burton 2014-01-15  274  
245a7868d2f2e5 Paul Burton 2014-04-14  275  		/* Allocate VPE boot configuration structs */
245a7868d2f2e5 Paul Burton 2014-04-14  276  		for (c = 0; c < ncores; c++) {
47e42fc012fae4 Paul Burton 2024-05-11  277  			core_vpes = core_vpe_count(cl, c);
47e42fc012fae4 Paul Burton 2024-05-11  278  			core_bootcfg[c].vpe_config = kcalloc(core_vpes,
47e42fc012fae4 Paul Burton 2024-05-11  279  					sizeof(*core_bootcfg[c].vpe_config),
245a7868d2f2e5 Paul Burton 2014-04-14  280  					GFP_KERNEL);
47e42fc012fae4 Paul Burton 2024-05-11  281  			if (!core_bootcfg[c].vpe_config)
245a7868d2f2e5 Paul Burton 2014-04-14  282  				goto err_out;
245a7868d2f2e5 Paul Burton 2014-04-14  283  		}
0ee958e102b62b Paul Burton 2014-01-15  284  	}
0ee958e102b62b Paul Burton 2014-01-15  285  
245a7868d2f2e5 Paul Burton 2014-04-14  286  	/* Mark this CPU as booted */
47e42fc012fae4 Paul Burton 2024-05-11  287  	cl = cpu_cluster(&current_cpu_data);
47e42fc012fae4 Paul Burton 2024-05-11  288  	c = cpu_core(&current_cpu_data);
47e42fc012fae4 Paul Burton 2024-05-11  289  	cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
47e42fc012fae4 Paul Burton 2024-05-11  290  	core_bootcfg = &cluster_bootcfg->core_config[c];
47e42fc012fae4 Paul Burton 2024-05-11  291  	atomic_set(&core_bootcfg->vpe_mask, 1 << cpu_vpe_id(&current_cpu_data));
245a7868d2f2e5 Paul Burton 2014-04-14  292  
245a7868d2f2e5 Paul Burton 2014-04-14  293  	return;
245a7868d2f2e5 Paul Burton 2014-04-14  294  err_out:
245a7868d2f2e5 Paul Burton 2014-04-14  295  	/* Clean up allocations */
47e42fc012fae4 Paul Burton 2024-05-11  296  	if (mips_cps_cluster_bootcfg) {
47e42fc012fae4 Paul Burton 2024-05-11  297  		for (cl = 0; cl < nclusters; cl++) {
47e42fc012fae4 Paul Burton 2024-05-11  298  			cluster_bootcfg = &mips_cps_cluster_bootcfg[cl];
47e42fc012fae4 Paul Burton 2024-05-11  299  			ncores = mips_cps_numcores(cl);
47e42fc012fae4 Paul Burton 2024-05-11  300  			for (c = 0; c < ncores; c++) {
47e42fc012fae4 Paul Burton 2024-05-11  301  				core_bootcfg = &cluster_bootcfg->core_config[c];
47e42fc012fae4 Paul Burton 2024-05-11  302  				kfree(core_bootcfg->vpe_config);
47e42fc012fae4 Paul Burton 2024-05-11  303  			}
47e42fc012fae4 Paul Burton 2024-05-11  304  			kfree(mips_cps_cluster_bootcfg[c].core_config);
47e42fc012fae4 Paul Burton 2024-05-11  305  		}
47e42fc012fae4 Paul Burton 2024-05-11  306  		kfree(mips_cps_cluster_bootcfg);
47e42fc012fae4 Paul Burton 2024-05-11  307  		mips_cps_cluster_bootcfg = NULL;
245a7868d2f2e5 Paul Burton 2014-04-14  308  	}
245a7868d2f2e5 Paul Burton 2014-04-14  309  
245a7868d2f2e5 Paul Burton 2014-04-14  310  	/* Effectively disable SMP by declaring CPUs not present */
245a7868d2f2e5 Paul Burton 2014-04-14  311  	for_each_possible_cpu(c) {
245a7868d2f2e5 Paul Burton 2014-04-14  312  		if (c == 0)
245a7868d2f2e5 Paul Burton 2014-04-14  313  			continue;
245a7868d2f2e5 Paul Burton 2014-04-14  314  		set_cpu_present(c, false);
245a7868d2f2e5 Paul Burton 2014-04-14  315  	}
245a7868d2f2e5 Paul Burton 2014-04-14  316  }
245a7868d2f2e5 Paul Burton 2014-04-14  317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
