Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E713FEE
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 04:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761626845; cv=none; b=XhJxu+SExd8WfM5/hmJOwEneOCCPkNG1CJrsPsoWKZqPCyTA9p8GZXF7ztv7Md+hHHqvRC2rLRUTJJYo2xlRvHRGCjpdK4n+wmxwODMrBn7ahqjy+ew16xdmlZVEIhAUYntOInrSrACB1UT2NuG/DmzL39TPAi4B/z2jBnLZ+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761626845; c=relaxed/simple;
	bh=G8uggGna+HjDGn1hG6HbpbBDqk0gZiRE/LU0vclnc1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVtgO/QAWcZhjS/wfywvmcSJwc4K+gggiZQEk49+6evQitVYj1VJNUueK+XjMhW6S0K2Gm1i1nFVidtjGgFnKRmrLMPjPrZ2NrkjgdUXAFNhnxYeT8zrGjfmNVO0ROpkmg3/3fyjsIYX+n0NGWFZCTY2JP0ARU0VVGc9QDyRes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsUEfLtB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsUEfLtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761626843; x=1793162843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G8uggGna+HjDGn1hG6HbpbBDqk0gZiRE/LU0vclnc1k=;
  b=LsUEfLtBqdT2wyaWdNdfNRByz6hwaxHGpGjsTeuCL0hHxjA+aD6DXKiR
   EmG5JMyS/+E/xrdUAy5CdFczP9+qDsxYr5RWmP4zxiUkPeKkgcYQV4SCo
   DqZERcpVHAw+6YTDJQSEQ6KQMowozJEu5ce7GS1JKd6zn/l1HsoCjyuDC
   lL73f5LlpdahmcV+Sql93zUBTxYkLKXdwOwUTTfh+9WWvkp8i466HCO6I
   qIXFcES5r1gQvhGM33pTRYRHAwnW6yef9+tl1V28CxAI+gi4CygmYrMkx
   Dhy3ylnGtoKWGzBu26EF3umfoGEM8X6EhjgkhDH61fSjQ5sdSVuHF50cB
   g==;
X-CSE-ConnectionGUID: qofMFSV3TOOCsSEuxLqiiw==
X-CSE-MsgGUID: /9QgOguhSSCOq7+y3XxiTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74392413"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="74392413"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 21:47:22 -0700
X-CSE-ConnectionGUID: MANwsoWlRg+XXJkdHAKy1w==
X-CSE-MsgGUID: yaL7WIfBSP2F0QS/KIMOWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="184941115"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 21:47:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDban-000IlB-0U;
	Tue, 28 Oct 2025 04:46:08 +0000
Date: Tue, 28 Oct 2025 12:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 4/4] irqchip/plic: add support for UltraRISC DP1000
 PLIC
Message-ID: <202510281247.vt1Cbh3h-lkp@intel.com>
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
In-Reply-To: <20251024083647.475239-5-lzampier@redhat.com>
References: <20251024083647.475239-5-lzampier@redhat.com>
TO: Lucas Zampieri <lzampier@redhat.com>
TO: linux-kernel@vger.kernel.org
CC: Charles Mirabile <cmirabil@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: Vivian Wang <dramforever@live.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: Zhang Xincheng <zhangxincheng@ultrarisc.com>
CC: Lucas Zampieri <lzampier@redhat.com>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.18-rc3]
[cannot apply to tip/irq/core next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Zampieri/dt-bindings-vendor-prefixes-add-UltraRISC/20251024-165132
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251024083647.475239-5-lzampier%40redhat.com
patch subject: [PATCH v6 4/4] irqchip/plic: add support for UltraRISC DP1000 PLIC
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r072-20251027 (https://download.01.org/0day-ci/archive/20251028/202510281247.vt1Cbh3h-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510281247.vt1Cbh3h-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-sifive-plic.c:772 plic_probe() error: uninitialized symbol 'handler'.

vim +/handler +772 drivers/irqchip/irq-sifive-plic.c

a15587277a246c Anup Patel        2024-02-22  617  
4d936f10ff8027 Anup Patel        2024-08-20  618  static int plic_probe(struct fwnode_handle *fwnode)
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  619  {
a15587277a246c Anup Patel        2024-02-22  620  	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
8ec99b033147ef Anup Patel        2024-02-22  621  	unsigned long plic_quirks = 0;
2234ae846ccb9e Anup Patel        2020-05-18  622  	struct plic_handler *handler;
a15587277a246c Anup Patel        2024-02-22  623  	u32 nr_irqs, parent_hwirq;
8ec99b033147ef Anup Patel        2024-02-22  624  	struct plic_priv *priv;
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  625  	irq_hw_number_t hwirq;
4d936f10ff8027 Anup Patel        2024-08-20  626  	void __iomem *regs;
206dd13a101196 Sunil V L         2024-08-27  627  	int id, context_id;
206dd13a101196 Sunil V L         2024-08-27  628  	u32 gsi_base;
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  629  
4d936f10ff8027 Anup Patel        2024-08-20  630  	if (is_of_node(fwnode)) {
8ec99b033147ef Anup Patel        2024-02-22  631  		const struct of_device_id *id;
8ec99b033147ef Anup Patel        2024-02-22  632  
4d936f10ff8027 Anup Patel        2024-08-20  633  		id = of_match_node(plic_match, to_of_node(fwnode));
8ec99b033147ef Anup Patel        2024-02-22  634  		if (id)
8ec99b033147ef Anup Patel        2024-02-22  635  			plic_quirks = (unsigned long)id->data;
4d936f10ff8027 Anup Patel        2024-08-20  636  
4d936f10ff8027 Anup Patel        2024-08-20  637  		regs = of_iomap(to_of_node(fwnode), 0);
4d936f10ff8027 Anup Patel        2024-08-20  638  		if (!regs)
4d936f10ff8027 Anup Patel        2024-08-20  639  			return -ENOMEM;
4d936f10ff8027 Anup Patel        2024-08-20  640  	} else {
206dd13a101196 Sunil V L         2024-08-27  641  		regs = devm_platform_ioremap_resource(to_platform_device(fwnode->dev), 0);
206dd13a101196 Sunil V L         2024-08-27  642  		if (IS_ERR(regs))
206dd13a101196 Sunil V L         2024-08-27  643  			return PTR_ERR(regs);
8ec99b033147ef Anup Patel        2024-02-22  644  	}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  645  
206dd13a101196 Sunil V L         2024-08-27  646  	error = plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts, &gsi_base, &id);
95652106478030 Anup Patel        2024-02-22  647  	if (error)
4d936f10ff8027 Anup Patel        2024-08-20  648  		goto fail_free_regs;
95652106478030 Anup Patel        2024-02-22  649  
4d936f10ff8027 Anup Patel        2024-08-20  650  	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
4d936f10ff8027 Anup Patel        2024-08-20  651  	if (!priv) {
4d936f10ff8027 Anup Patel        2024-08-20  652  		error = -ENOMEM;
4d936f10ff8027 Anup Patel        2024-08-20  653  		goto fail_free_regs;
4d936f10ff8027 Anup Patel        2024-08-20  654  	}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  655  
4d936f10ff8027 Anup Patel        2024-08-20  656  	priv->fwnode = fwnode;
dd46337ca69662 Lad Prabhakar     2022-06-30  657  	priv->plic_quirks = plic_quirks;
95652106478030 Anup Patel        2024-02-22  658  	priv->nr_irqs = nr_irqs;
4d936f10ff8027 Anup Patel        2024-08-20  659  	priv->regs = regs;
206dd13a101196 Sunil V L         2024-08-27  660  	priv->gsi_base = gsi_base;
206dd13a101196 Sunil V L         2024-08-27  661  	priv->acpi_plic_id = id;
dd46337ca69662 Lad Prabhakar     2022-06-30  662  
4d936f10ff8027 Anup Patel        2024-08-20  663  	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
4d936f10ff8027 Anup Patel        2024-08-20  664  	if (!priv->prio_save) {
4d936f10ff8027 Anup Patel        2024-08-20  665  		error = -ENOMEM;
4d936f10ff8027 Anup Patel        2024-08-20  666  		goto fail_free_priv;
4d936f10ff8027 Anup Patel        2024-08-20  667  	}
e80f0b6a2cf302 Mason Huo         2023-04-04  668  
6adfe8d2f5b353 Anup Patel        2019-02-12  669  	for (i = 0; i < nr_contexts; i++) {
206dd13a101196 Sunil V L         2024-08-27  670  		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
206dd13a101196 Sunil V L         2024-08-27  671  						  priv->acpi_plic_id);
a15587277a246c Anup Patel        2024-02-22  672  		if (error) {
4d936f10ff8027 Anup Patel        2024-08-20  673  			pr_warn("%pfwP: hwirq for context%d not found\n", fwnode, i);
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  674  			continue;
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  675  		}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  676  
206dd13a101196 Sunil V L         2024-08-27  677  		if (is_of_node(fwnode)) {
206dd13a101196 Sunil V L         2024-08-27  678  			context_id = i;
206dd13a101196 Sunil V L         2024-08-27  679  		} else {
206dd13a101196 Sunil V L         2024-08-27  680  			context_id = acpi_rintc_get_plic_context(priv->acpi_plic_id, i);
206dd13a101196 Sunil V L         2024-08-27  681  			if (context_id == INVALID_CONTEXT) {
206dd13a101196 Sunil V L         2024-08-27  682  				pr_warn("%pfwP: invalid context id for context%d\n", fwnode, i);
206dd13a101196 Sunil V L         2024-08-27  683  				continue;
206dd13a101196 Sunil V L         2024-08-27  684  			}
206dd13a101196 Sunil V L         2024-08-27  685  		}
206dd13a101196 Sunil V L         2024-08-27  686  
a4c3733d32a72f Christoph Hellwig 2019-10-28  687  		/*
a4c3733d32a72f Christoph Hellwig 2019-10-28  688  		 * Skip contexts other than external interrupts for our
a4c3733d32a72f Christoph Hellwig 2019-10-28  689  		 * privilege level.
a4c3733d32a72f Christoph Hellwig 2019-10-28  690  		 */
a15587277a246c Anup Patel        2024-02-22  691  		if (parent_hwirq != RV_IRQ_EXT) {
098fdbc3531f06 Niklas Cassel     2022-03-02  692  			/* Disable S-mode enable bits if running in M-mode. */
098fdbc3531f06 Niklas Cassel     2022-03-02  693  			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
098fdbc3531f06 Niklas Cassel     2022-03-02  694  				void __iomem *enable_base = priv->regs +
098fdbc3531f06 Niklas Cassel     2022-03-02  695  					CONTEXT_ENABLE_BASE +
098fdbc3531f06 Niklas Cassel     2022-03-02  696  					i * CONTEXT_ENABLE_SIZE;
098fdbc3531f06 Niklas Cassel     2022-03-02  697  
098fdbc3531f06 Niklas Cassel     2022-03-02  698  				for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
098fdbc3531f06 Niklas Cassel     2022-03-02  699  					__plic_toggle(enable_base, hwirq, 0);
098fdbc3531f06 Niklas Cassel     2022-03-02  700  			}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  701  			continue;
098fdbc3531f06 Niklas Cassel     2022-03-02  702  		}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  703  
fc03acaeab358c Atish Patra       2019-02-12  704  		if (cpu < 0) {
4d936f10ff8027 Anup Patel        2024-08-20  705  			pr_warn("%pfwP: Invalid cpuid for context %d\n", fwnode, i);
fc03acaeab358c Atish Patra       2019-02-12  706  			continue;
fc03acaeab358c Atish Patra       2019-02-12  707  		}
fc03acaeab358c Atish Patra       2019-02-12  708  
9ce06497c2722a Christoph Hellwig 2019-09-03  709  		/*
9ce06497c2722a Christoph Hellwig 2019-09-03  710  		 * When running in M-mode we need to ignore the S-mode handler.
9ce06497c2722a Christoph Hellwig 2019-09-03  711  		 * Here we assume it always comes later, but that might be a
9ce06497c2722a Christoph Hellwig 2019-09-03  712  		 * little fragile.
9ce06497c2722a Christoph Hellwig 2019-09-03  713  		 */
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  714  		handler = per_cpu_ptr(&plic_handlers, cpu);
3fecb5aac28888 Anup Patel        2019-02-12  715  		if (handler->present) {
4d936f10ff8027 Anup Patel        2024-08-20  716  			pr_warn("%pfwP: handler already present for context %d.\n", fwnode, i);
ccbe80bad571c2 Atish Patra       2020-03-02  717  			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
9ce06497c2722a Christoph Hellwig 2019-09-03  718  			goto done;
3fecb5aac28888 Anup Patel        2019-02-12  719  		}
3fecb5aac28888 Anup Patel        2019-02-12  720  
f1ad1133b18f2a Atish Patra       2020-03-02  721  		cpumask_set_cpu(cpu, &priv->lmask);
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  722  		handler->present = true;
0d3616bbd03cdf Niklas Cassel     2022-03-02  723  		handler->hart_base = priv->regs + CONTEXT_BASE +
206dd13a101196 Sunil V L         2024-08-27  724  			context_id * CONTEXT_SIZE;
86c7cbf1e8d1d4 Anup Patel        2019-02-12  725  		raw_spin_lock_init(&handler->enable_lock);
0d3616bbd03cdf Niklas Cassel     2022-03-02  726  		handler->enable_base = priv->regs + CONTEXT_ENABLE_BASE +
206dd13a101196 Sunil V L         2024-08-27  727  			context_id * CONTEXT_ENABLE_SIZE;
f1ad1133b18f2a Atish Patra       2020-03-02  728  		handler->priv = priv;
e80f0b6a2cf302 Mason Huo         2023-04-04  729  
4d936f10ff8027 Anup Patel        2024-08-20  730  		handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),
e80f0b6a2cf302 Mason Huo         2023-04-04  731  					       sizeof(*handler->enable_save), GFP_KERNEL);
6eabf656048d90 Charlie Jenkins   2024-09-03  732  		if (!handler->enable_save) {
6eabf656048d90 Charlie Jenkins   2024-09-03  733  			error = -ENOMEM;
a15587277a246c Anup Patel        2024-02-22  734  			goto fail_cleanup_contexts;
6eabf656048d90 Charlie Jenkins   2024-09-03  735  		}
9ce06497c2722a Christoph Hellwig 2019-09-03  736  done:
a1706a1c5062e0 Samuel Holland    2022-07-01  737  		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
86c7cbf1e8d1d4 Anup Patel        2019-02-12  738  			plic_toggle(handler, hwirq, 0);
a1706a1c5062e0 Samuel Holland    2022-07-01  739  			writel(1, priv->regs + PRIORITY_BASE +
a1706a1c5062e0 Samuel Holland    2022-07-01  740  				  hwirq * PRIORITY_PER_ID);
a1706a1c5062e0 Samuel Holland    2022-07-01  741  		}
6adfe8d2f5b353 Anup Patel        2019-02-12  742  		nr_handlers++;
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  743  	}
8237f8bc4f6eb7 Christoph Hellwig 2018-07-26  744  
206dd13a101196 Sunil V L         2024-08-27  745  	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,
b68d0ff529a939 Anup Patel        2024-02-22  746  						   &plic_irqdomain_ops, priv);
6eabf656048d90 Charlie Jenkins   2024-09-03  747  	if (WARN_ON(!priv->irqdomain)) {
6eabf656048d90 Charlie Jenkins   2024-09-03  748  		error = -ENOMEM;
a15587277a246c Anup Patel        2024-02-22  749  		goto fail_cleanup_contexts;
6eabf656048d90 Charlie Jenkins   2024-09-03  750  	}
b68d0ff529a939 Anup Patel        2024-02-22  751  
2234ae846ccb9e Anup Patel        2020-05-18  752  	/*
e306a894bd5118 Samuel Holland    2024-05-29  753  	 * We can have multiple PLIC instances so setup global state
8ec99b033147ef Anup Patel        2024-02-22  754  	 * and register syscore operations only once after context
8ec99b033147ef Anup Patel        2024-02-22  755  	 * handlers of all online CPUs are initialized.
2234ae846ccb9e Anup Patel        2020-05-18  756  	 */
e306a894bd5118 Samuel Holland    2024-05-29  757  	if (!plic_global_setup_done) {
e306a894bd5118 Samuel Holland    2024-05-29  758  		struct irq_domain *domain;
e306a894bd5118 Samuel Holland    2024-05-29  759  		bool global_setup = true;
e306a894bd5118 Samuel Holland    2024-05-29  760  
8ec99b033147ef Anup Patel        2024-02-22  761  		for_each_online_cpu(cpu) {
8ec99b033147ef Anup Patel        2024-02-22  762  			handler = per_cpu_ptr(&plic_handlers, cpu);
8ec99b033147ef Anup Patel        2024-02-22  763  			if (!handler->present) {
e306a894bd5118 Samuel Holland    2024-05-29  764  				global_setup = false;
8ec99b033147ef Anup Patel        2024-02-22  765  				break;
8ec99b033147ef Anup Patel        2024-02-22  766  			}
8ec99b033147ef Anup Patel        2024-02-22  767  		}
e306a894bd5118 Samuel Holland    2024-05-29  768  
e306a894bd5118 Samuel Holland    2024-05-29  769  		if (global_setup) {
ada6142a99441d Charles Mirabile  2025-10-24  770  			void (*handler_fn)(struct irq_desc *) = plic_handle_irq;
ada6142a99441d Charles Mirabile  2025-10-24  771  
ada6142a99441d Charles Mirabile  2025-10-24 @772  			if (test_bit(PLIC_QUIRK_CP100_CLAIM_REGISTER_ERRATUM, &handler->priv->plic_quirks))
ada6142a99441d Charles Mirabile  2025-10-24  773  				handler_fn = plic_handle_irq_cp100;
ada6142a99441d Charles Mirabile  2025-10-24  774  
e306a894bd5118 Samuel Holland    2024-05-29  775  			/* Find parent domain and register chained handler */
e306a894bd5118 Samuel Holland    2024-05-29  776  			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
e306a894bd5118 Samuel Holland    2024-05-29  777  			if (domain)
e306a894bd5118 Samuel Holland    2024-05-29  778  				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
e306a894bd5118 Samuel Holland    2024-05-29  779  			if (plic_parent_irq)
ada6142a99441d Charles Mirabile  2025-10-24  780  				irq_set_chained_handler(plic_parent_irq, handler_fn);
e306a894bd5118 Samuel Holland    2024-05-29  781  
ccbe80bad571c2 Atish Patra       2020-03-02  782  			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
ccbe80bad571c2 Atish Patra       2020-03-02  783  					  "irqchip/sifive/plic:starting",
ccbe80bad571c2 Atish Patra       2020-03-02  784  					  plic_starting_cpu, plic_dying_cpu);
f99b926f6543fa Anup Patel        2023-10-25  785  			register_syscore_ops(&plic_irq_syscore_ops);
e306a894bd5118 Samuel Holland    2024-05-29  786  			plic_global_setup_done = true;
2234ae846ccb9e Anup Patel        2020-05-18  787  		}
8ec99b033147ef Anup Patel        2024-02-22  788  	}
2234ae846ccb9e Anup Patel        2020-05-18  789  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
