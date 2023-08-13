Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835007E
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Aug 2023 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691920237; x=1723456237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNhNYot0m3yTZAkeXJaydzZhT3CSgB9MhciABZQZRp4=;
  b=mPNSxGlJfGZa7YFYQC0QpYwNDJhSi+EHDXVmDOXFH/kdyPlTdNxtdoMc
   s/pPAbAFlTz5grcJsr6MS9IYocd49cMroi6J334agfTkPJOnaT3henmdk
   OnW5NNgIzPvgP96j80uFSx/U2DjGx7sH4gKC8DABKNIt8qxZOeX5SAiYR
   t49VtddNdiiiztkpb3FQQ8a993uSs2kynzjo7qilNud7imXKh00+7JH78
   qSj09Ia1hSF/vY4T+wW+m8bja1Rr96E7aZjz00lGmF8od0gyyowpk0myq
   tAGZECaGTi5Ih+sTYcmX4Vry12aw6sROZzr+1ZR3vMPLd49fVHjzxwzZC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="375589070"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="375589070"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 02:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876632064"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Aug 2023 02:50:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qV7k2-00092m-1Q;
	Sun, 13 Aug 2023 09:50:34 +0000
Date: Sun, 13 Aug 2023 17:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] genirq/irq_sim: shrink code by using cleanup helpers
Message-ID: <202308131735.26zxY5FT-lkp@intel.com>
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
In-Reply-To: <20230812194457.6432-5-brgl@bgdev.pl>
References: <20230812194457.6432-5-brgl@bgdev.pl>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Yury Norov <yury.norov@gmail.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: linux-kernel@vger.kernel.org
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/genirq-irq_sim-dispose-of-remaining-mappings-before-removing-the-domain/20230813-042246
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20230812194457.6432-5-brgl%40bgdev.pl
patch subject: [PATCH 4/4] genirq/irq_sim: shrink code by using cleanup helpers
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021-20230813 (https://download.01.org/0day-ci/archive/20230813/202308131735.26zxY5FT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308131735.26zxY5FT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308131735.26zxY5FT-lkp@intel.com/

smatch warnings:
kernel/irq/irq_sim.c:183 irq_domain_create_sim() warn: possible memory leak of 'work_ctx'

vim +/work_ctx +183 kernel/irq/irq_sim.c

337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  160  
b19af510e67e6c Bartosz Golaszewski       2017-08-14  161  /**
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  162   * irq_domain_create_sim - Create a new interrupt simulator irq_domain and
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  163   *                         allocate a range of dummy interrupts.
b19af510e67e6c Bartosz Golaszewski       2017-08-14  164   *
ef4cb70a4c22bf Andy Shevchenko           2021-03-02  165   * @fwnode:     struct fwnode_handle to be associated with this domain.
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  166   * @num_irqs:   Number of interrupts to allocate.
b19af510e67e6c Bartosz Golaszewski       2017-08-14  167   *
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  168   * On success: return a new irq_domain object.
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  169   * On failure: a negative errno wrapped with ERR_PTR().
b19af510e67e6c Bartosz Golaszewski       2017-08-14  170   */
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  171  struct irq_domain *irq_domain_create_sim(struct fwnode_handle *fwnode,
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  172  					 unsigned int num_irqs)
b19af510e67e6c Bartosz Golaszewski       2017-08-14  173  {
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  174  	struct irq_sim_work_ctx *work_ctx __free(kfree) = NULL;
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  175  	unsigned long *pending __free(bitmap) = NULL;
b19af510e67e6c Bartosz Golaszewski       2017-08-14  176  
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  177  	work_ctx = kmalloc(sizeof(*work_ctx), GFP_KERNEL);
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  178  	if (!work_ctx)
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  179  		return ERR_PTR(-ENOMEM);
b19af510e67e6c Bartosz Golaszewski       2017-08-14  180  
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  181  	pending = bitmap_zalloc(num_irqs, GFP_KERNEL);
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  182  	if (!pending)
83619b0b9ba402 Bartosz Golaszewski       2023-08-12 @183  		return ERR_PTR(-ENOMEM);
b19af510e67e6c Bartosz Golaszewski       2017-08-14  184  
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  185  	work_ctx->domain = irq_domain_create_linear(fwnode, num_irqs,
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  186  						    &irq_sim_domain_ops,
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  187  						    work_ctx);
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  188  	if (!work_ctx->domain)
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  189  		return ERR_PTR(-ENOMEM);
06459901d55ee2 Bartosz Golaszewski       2018-11-09  190  
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  191  	work_ctx->irq_count = num_irqs;
21673fcb2532dc Sebastian Andrzej Siewior 2022-05-11  192  	work_ctx->work = IRQ_WORK_INIT_HARD(irq_sim_handle_irq);
5471d484dcb9ec Bartosz Golaszewski       2023-08-12  193  	INIT_LIST_HEAD(&work_ctx->irqs);
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  194  	work_ctx->pending = no_free_ptr(pending);
b19af510e67e6c Bartosz Golaszewski       2017-08-14  195  
83619b0b9ba402 Bartosz Golaszewski       2023-08-12  196  	return no_free_ptr(work_ctx)->domain;
b19af510e67e6c Bartosz Golaszewski       2017-08-14  197  }
337cbeb2c13eb4 Bartosz Golaszewski       2020-05-14  198  EXPORT_SYMBOL_GPL(irq_domain_create_sim);
b19af510e67e6c Bartosz Golaszewski       2017-08-14  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
