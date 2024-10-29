Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA980C02
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 02:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167290; cv=none; b=mLeW9buMrht4djqq8Sq+niUd0vT9hAX/ABbudbSDy9sJfj5G8yOyH+ZY27xnOp6V98/Fgonjm8+pnkvcryKGCz3i2c0FiyZoERRY/qlgI4qUJW7G4Se/Dy6P4BcMXF3HLM1ofpk5VFB0ZSguP1rCGKUdsBeGOWnPCaD9tjAiwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167290; c=relaxed/simple;
	bh=wdGdlK3TpehNHxfsqW++vfrWm+D7Qt8bTHbwT9QkIoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kWfLD8NegXaFlN8+s+GfJxKuSdlyM+bOtGOl2pOYtoJoaeG5HpAwc6QkT5rf3TtYqjAWTJnt4IzfnNyU/zshd+yVuMj6kGN8TzQc0bw2PdBBhQf9xB2kBtjDusHeE5qE/GhWjZDCtXCbwKaJe0OXAm4cu67PkDnnirv30Ro3sdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YfNJuEEu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YfNJuEEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730167288; x=1761703288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdGdlK3TpehNHxfsqW++vfrWm+D7Qt8bTHbwT9QkIoY=;
  b=YfNJuEEulV0WSDdYZOJN8tEywrCGs79ewJ3hsdQ0s6Ql07l6OfdHKZDo
   UhFxQoe7RdTJORggaOHZRKaFotIxLe+YwJpYVOoWu81UVbKNzNwYL96tQ
   Ys0s2OFk8SAAvl5QYb1Nktwv6JmLF4itb08b43wCpGQNhSpJsEHAmMIFZ
   /vIuNPw2pzrRt3HPIaIEoM14FLa5SpMQDua0osVSO+zwuuwBv+1krbv+U
   2rgk/CPVQVOnJ13vjeiA6MxWZDi/Z9/0v2Uq6qpzukRqss2HRJNRS1o0P
   hnhl7/dPPQisgPYFk4lN3Jp602h79mejrKwYjiRPZnj3uxJW7sRGYHOns
   A==;
X-CSE-ConnectionGUID: luLRkgTLT1GbPNf0x3r+Dw==
X-CSE-MsgGUID: rHx4BtQdTnKT6FdeQ6Cvhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="33709345"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="33709345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:01:24 -0700
X-CSE-ConnectionGUID: 8HUUdn3tR52T1XkAeLXrnQ==
X-CSE-MsgGUID: Iu8qDvPHTku/YgV0hkpWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82615925"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Oct 2024 18:56:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5bTG-000d8I-2o;
	Tue, 29 Oct 2024 01:56:34 +0000
Date: Tue, 29 Oct 2024 09:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] parport: add iomem type for parport
Message-ID: <202410290943.3RBgYcqf-lkp@intel.com>
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
In-Reply-To: <20241025082128.60034-4-412574090@163.com>
References: <20241025082128.60034-4-412574090@163.com>
TO: 412574090@163.com
TO: sudipm.mukherjee@gmail.com
CC: linux-kernel@vger.kernel.org
CC: xiongxin@kylinos.cn
CC: weiyufeng <weiyufeng@kylinos.cn>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc5 next-20241028]
[cannot apply to deller-parisc/for-next mkp-scsi/for-next jejb-scsi/for-next tiwai-sound/for-next tiwai-sound/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/412574090-163-com/parport-change-struct-parport-member-to-iobase/20241025-162302
base:   linus/master
patch link:    https://lore.kernel.org/r/20241025082128.60034-4-412574090%40163.com
patch subject: [PATCH 4/4] parport: add iomem type for parport
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20241029 (https://download.01.org/0day-ci/archive/20241029/202410290943.3RBgYcqf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410290943.3RBgYcqf-lkp@intel.com/

New smatch warnings:
drivers/parport/parport_pc.c:2358 __parport_pc_probe_port() warn: 'data.mapbase_hi' from __request_region() not released on lines: 2358.
drivers/parport/parport_pc.c:2358 __parport_pc_probe_port() warn: 'p->membase_hi' from ioremap() not released on lines: 2358.

Old smatch warnings:
drivers/parport/parport_pc.c:2405 parport_pc_unregister_port() warn: consider using resource_size() here

vim +2358 drivers/parport/parport_pc.c

3aeda9bc95d064 Alan Cox          2009-06-11  2243  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2244  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  2245  		int f = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2246  		printmode(PCSPP);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2247  		printmode(TRISTATE);
a6abfdff4fe5dd Joe Perches       2020-04-03  2248  		printmode(COMPAT);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2249  		printmode(EPP);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2250  		printmode(ECP);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2251  		printmode(DMA);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2252  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2253  #undef printmode
^1da177e4c3f41 Linus Torvalds    2005-04-16  2254  #ifndef CONFIG_PARPORT_1284
decf26f6ec25da Joe Perches       2020-04-03  2255  	pr_cont("(,...)");
^1da177e4c3f41 Linus Torvalds    2005-04-16  2256  #endif /* CONFIG_PARPORT_1284 */
decf26f6ec25da Joe Perches       2020-04-03  2257  	pr_cont("]\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  2258  	if (probedirq != PARPORT_IRQ_NONE)
decf26f6ec25da Joe Perches       2020-04-03  2259  		pr_info("%s: irq %d detected\n", p->name, probedirq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2260  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2261  	/* If No ECP release the ports grabbed above. */
eb43c90cbfdb03 weiyufeng         2024-10-25  2262  	if ((p->modes & PARPORT_MODE_ECP) == 0) {
eb43c90cbfdb03 weiyufeng         2024-10-25  2263  		if (p->iobase_hi && ECR_res) {
eb43c90cbfdb03 weiyufeng         2024-10-25  2264  			release_region(p->iobase_hi, 3);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2265  			ECR_res = NULL;
1ba02e2eeb531c weiyufeng         2024-10-25  2266  		} else if (p->membase_hi) {
1ba02e2eeb531c weiyufeng         2024-10-25  2267  			iounmap(p->membase_hi);
1ba02e2eeb531c weiyufeng         2024-10-25  2268  			release_mem_region(p->mapbase_hi,
1ba02e2eeb531c weiyufeng         2024-10-25  2269  						p->mapsize_hi);
1ba02e2eeb531c weiyufeng         2024-10-25  2270  			p->membase_hi = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2271  		}
eb43c90cbfdb03 weiyufeng         2024-10-25  2272  	}
eb43c90cbfdb03 weiyufeng         2024-10-25  2273  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2274  	/* Likewise for EEP ports */
eb43c90cbfdb03 weiyufeng         2024-10-25  2275  	if (p->iobase && EPP_res && (p->modes & PARPORT_MODE_EPP) == 0) {
eb43c90cbfdb03 weiyufeng         2024-10-25  2276  		release_region(p->iobase + 3, 5);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2277  		EPP_res = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2278  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2279  	if (p->irq != PARPORT_IRQ_NONE) {
1ba02e2eeb531c weiyufeng         2024-10-25  2280  		if (!is_ioport(p))
1ba02e2eeb531c weiyufeng         2024-10-25  2281  			irqflags |= IRQF_SHARED;
3f2e40df0e1d76 Jeff Garzik       2007-10-19  2282  		if (request_irq(p->irq, parport_irq_handler,
51dcdfec6a274a Alan Cox          2009-04-07  2283  				 irqflags, p->name, p)) {
decf26f6ec25da Joe Perches       2020-04-03  2284  			pr_warn("%s: irq %d in use, resorting to polled operation\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  2285  				p->name, p->irq);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2286  			p->irq = PARPORT_IRQ_NONE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2287  			p->dma = PARPORT_DMA_NONE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2288  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2289  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2290  #ifdef CONFIG_PARPORT_PC_FIFO
7fbacd5213a03b Al Viro           2005-05-04  2291  #ifdef HAS_DMA
^1da177e4c3f41 Linus Torvalds    2005-04-16  2292  		if (p->dma != PARPORT_DMA_NONE) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2293  			if (request_dma(p->dma, p->name)) {
decf26f6ec25da Joe Perches       2020-04-03  2294  				pr_warn("%s: dma %d in use, resorting to PIO operation\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  2295  					p->name, p->dma);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2296  				p->dma = PARPORT_DMA_NONE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2297  			} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2298  				priv->dma_buf =
c15a3837d2aa30 David Brownell    2007-05-08  2299  				  dma_alloc_coherent(dev,
^1da177e4c3f41 Linus Torvalds    2005-04-16  2300  						       PAGE_SIZE,
c15a3837d2aa30 David Brownell    2007-05-08  2301  						       &priv->dma_handle,
c15a3837d2aa30 David Brownell    2007-05-08  2302  						       GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2303  				if (!priv->dma_buf) {
decf26f6ec25da Joe Perches       2020-04-03  2304  					pr_warn("%s: cannot get buffer for DMA, resorting to PIO operation\n",
^1da177e4c3f41 Linus Torvalds    2005-04-16  2305  						p->name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2306  					free_dma(p->dma);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2307  					p->dma = PARPORT_DMA_NONE;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2308  				}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2309  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2310  		}
7fbacd5213a03b Al Viro           2005-05-04  2311  #endif
7fbacd5213a03b Al Viro           2005-05-04  2312  #endif
^1da177e4c3f41 Linus Torvalds    2005-04-16  2313  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2314  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2315  	/* Done probing.  Now put the port into a sensible start-up state. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2316  	if (priv->ecr)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2317  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  2318  		 * Put the ECP detected port in PS2 mode.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2319  		 * Do this also for ports that have ECR but don't do ECP.
^1da177e4c3f41 Linus Torvalds    2005-04-16  2320  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2321  		ECR_WRITE(p, 0x34);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2322  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2323  	parport_pc_write_data(p, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2324  	parport_pc_data_forward(p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2325  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2326  	/* Now that we've told the sharing engine about the port, and
^1da177e4c3f41 Linus Torvalds    2005-04-16  2327  	   found out its characteristics, let the high-level drivers
^1da177e4c3f41 Linus Torvalds    2005-04-16  2328  	   know about it. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  2329  	spin_lock(&ports_lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2330  	list_add(&priv->list, &ports_list);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2331  	spin_unlock(&ports_lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2332  	parport_announce_port(p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2333  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2334  	return p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2335  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2336  out5:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2337  	if (ECR_res)
eb43c90cbfdb03 weiyufeng         2024-10-25  2338  		release_region(p->iobase_hi, 3);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2339  	if (EPP_res)
eb43c90cbfdb03 weiyufeng         2024-10-25  2340  		release_region(p->iobase + 0x3, 5);
1ba02e2eeb531c weiyufeng         2024-10-25  2341  	if (is_ioport(p))
eb43c90cbfdb03 weiyufeng         2024-10-25  2342  		release_region(p->iobase, 3);
1ba02e2eeb531c weiyufeng         2024-10-25  2343  	else {
1ba02e2eeb531c weiyufeng         2024-10-25  2344  		iounmap(p->membase);
1ba02e2eeb531c weiyufeng         2024-10-25  2345  		release_mem_region(p->mapbase, p->mapsize);
1ba02e2eeb531c weiyufeng         2024-10-25  2346  		p->membase = NULL;
1ba02e2eeb531c weiyufeng         2024-10-25  2347  	}
1ba02e2eeb531c weiyufeng         2024-10-25  2348  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2349  out4:
6fa45a22689722 Sudip Mukherjee   2015-05-20  2350  	parport_del_port(p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2351  out3:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2352  	kfree(priv);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2353  out2:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2354  	kfree(ops);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2355  out1:
a7d801afc3d4d1 Jean Delvare      2007-05-08  2356  	if (pdev)
a7d801afc3d4d1 Jean Delvare      2007-05-08  2357  		platform_device_unregister(pdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16 @2358  	return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2359  }
f01dda1cb85e14 Maciej W. Rozycki 2023-01-08  2360  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
