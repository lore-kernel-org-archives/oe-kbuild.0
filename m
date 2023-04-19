Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBBF197;
	Wed, 19 Apr 2023 04:42:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-2fbb99cb297so1340066f8f.1;
        Tue, 18 Apr 2023 21:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681879359; x=1684471359;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rg17OEPD/HpqiUqkk1EGt0TAJm79SfIK4kHWRGVMOgc=;
        b=TCzkHTkNaj6cihXWHZPN9Zyn1dIU0QfksLmfX9zus2ApeMVfbtuuDxbRTOIx1W8nIg
         QP5oRBv2e2ViGY9Eq3HxSp2Cl15DyoWgg8xD1ziQZdqyuudwg0/GP6L5gDjLPnIDPMg7
         5VJQ2Shc9DZ4eswINFlA3Y29mgLbsub4DjRA8mbPyO+tzzgIsXcWzwqH4bsorLHsnOyY
         T6wA1jOh3+89wFkyXdqvOW3npTbdfz40qdx7BWdzerebCLRvLTh+Ppo5NZKFxaXcYqRz
         3rcqKQcVxc3Z6a4VXepiRuBOFG4Gd+49drgDllrvpwL5uRUWzcBOuY9gm8gcN7Yoq6X1
         ddyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681879359; x=1684471359;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rg17OEPD/HpqiUqkk1EGt0TAJm79SfIK4kHWRGVMOgc=;
        b=MSScf+xsCVfpVxtBZNV6RUzdFU0SfUEWngRSOUQdQZQHDsAINuTrESx5ZGjafZp8pF
         MPU6PB6HSJ4ya218HAEAmPhRilwSokIEsPd7HVeOpSuhCS8V/wH2js+3lthggC0Pt81a
         WLuXUz44u2dUmhnfIQC391qJM/LCKn13R68F3JEAv9MlUVGd3h/YCpdGuHoM2KgoA7lt
         s1xFgth5EaVx6YRNtnxw1tKdeaHDKK/MXDwibTqWgKl9csL7kIKOiOwSMu+/0Oo6hafF
         JC2V3ZtZD9P2iYd7yTnvCNXE8r3oY5RWyqULnSxbmDHFyiVd12jXSWp15DXHrmH2eVKW
         t2Aw==
X-Gm-Message-State: AAQBX9eng3Yzzk8yTSekOUhhsAb9RCgFOmCPF2xQXgwK8xj72e8m47kL
	iKtz+ElAe7mvFy3QT6C7hPVimrRRl73iYwBn
X-Google-Smtp-Source: AKy350bg/6oyNd2L8+kUXrGBSheCysTkDRCpeYG4ayrOqiiavxa+Rc+6UfiWMrhQfZOba/jWCF4hxg==
X-Received: by 2002:a5d:55c1:0:b0:2dc:cad4:87b9 with SMTP id i1-20020a5d55c1000000b002dccad487b9mr3280558wrw.68.1681879357209;
        Tue, 18 Apr 2023 21:42:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z14-20020adff1ce000000b002f28de9f73bsm14591510wro.55.2023.04.18.21.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 21:42:36 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:42:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, git@amd.com,
	linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
	michal.simek@xilinx.com
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <588e6275-88a2-4c3a-beee-e73eb2c99eac@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230418102855.6791-3-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
config: csky-randconfig-m041-20230418 (https://download.01.org/0day-ci/archive/20230419/202304190429.UOH2nE9u-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304190429.UOH2nE9u-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:264 clk_wzrd_dynamic_reconfig() error: uninitialized symbol 'value'.

vim +/value +264 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  226  static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  227  				     unsigned long parent_rate)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  228  {
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  229  	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  230  	void __iomem *div_addr = divider->base + divider->offset;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  231  	u32 value, regh, edged, p5en, p5fedge, regval, regval1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  232  	unsigned long flags = 0;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  233  	int err;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  234  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  235  	if (divider->lock)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  236  		spin_lock_irqsave(divider->lock, flags);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  237  	else
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  238  		__acquire(divider->lock);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  239  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  240  	if (!divider->is_versal) {
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  241  		value = DIV_ROUND_CLOSEST(parent_rate, rate);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  242  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  243  		/* Cap the value to max */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  244  		min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  245  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  246  		/* Set divisor and clear phase offset */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  247  		writel(value, div_addr);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  248  		writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  249  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  250  		/* Check status register */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  251  		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  252  					 value, value & WZRD_DR_LOCK_BIT_MASK,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  253  					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  254  		if (err)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  255  			goto err_reconfig;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  256  
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  257  		/* Initiate reconfiguration */
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  258  		writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  259  		       divider->base + WZRD_DR_INIT_REG_OFFSET);
dd5e7431ac54e0 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2022-04-11  260  		writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  261  		       divider->base + WZRD_DR_INIT_REG_OFFSET);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  262  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  263  	} else {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18 @264  		regh = (value / 4);
                                                                                                                                ^^^^^
Uninitialized.

143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  265  		regval1 = readl(div_addr);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  266  		regval1 |= WZRD_CLKFBOUT_PREDIV2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  267  		regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  268  		if (value % 4 > 1) {
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  269  			edged = 1;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  270  			regval1 |= (edged << WZRD_EDGE_SHIFT);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  271  		}
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  272  		p5fedge = value % 2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  273  		p5en = value % 2;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  274  		regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  275  		writel(regval1, div_addr);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  276  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  277  		regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  278  		writel(regval, div_addr + 4);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  279  		/* Check status register */
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  280  		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  281  					 value, value & WZRD_DR_LOCK_BIT_MASK,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  282  					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  283  		if (err)
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  284  			goto err_reconfig;
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  285  
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  286  		/* Initiate reconfiguration */
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  287  		writel(WZRD_DR_BEGIN_DYNA_RECONF,
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  288  		       divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
143916412aa6a4 drivers/clk/xilinx/clk-xlnx-clock-wizard.c              Shubhrajyoti Datta 2023-04-18  289  	}
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  290  	/* Check status register */
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  291  	err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  292  				 value, value & WZRD_DR_LOCK_BIT_MASK,
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  293  				 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  294  err_reconfig:
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  295  	if (divider->lock)
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  296  		spin_unlock_irqrestore(divider->lock, flags);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  297  	else
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  298  		__release(divider->lock);
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  299  	return err;
5a853722eb3218 drivers/staging/clocking-wizard/clk-xlnx-clock-wizard.c Shubhrajyoti Datta 2021-02-24  300  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

