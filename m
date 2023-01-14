Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147427C;
	Sat, 14 Jan 2023 08:03:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z5so21895594wrt.6;
        Sat, 14 Jan 2023 00:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLEn/+P6vnsRzdZVBqrUgcwK2fGBmdeiH2yyLLnM0F0=;
        b=FQT2OmuTuysT8HRaiRxcuTS890KmSi4IilS6AbLzh8cSLNfQklt+V4wMKmm789K0Ub
         6hTz+h/6Elc9OhUPve1gbF/2S7U+4FnRhBh33By+kZS9a5Nj0gKSR/veMxf1DFu6FqXb
         cgHlTemXPQqff4MHeXmGXWJynmC8d/0RoiAbWzEeqUTEKvQRFphMczWEqfsN3wK7gCfb
         cdxVyzHxVZmHA2BxGSq3n8An2jb6yvTXch+xNWW7xgyeJLUKddnjBhIVOT/Uq/48BDgP
         m6JbaBVAX0dLyZPPbn0C1hhlSrI3HKDmouyh3oNUTHJ0P9SdVrMLcvgYunxTk5/Emh1g
         vfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLEn/+P6vnsRzdZVBqrUgcwK2fGBmdeiH2yyLLnM0F0=;
        b=y9t+us9+Ze0DrAFn5B4TQgdGCd35xpWwXrxN8KYRJLVeDccOQF1k7HytH+albgXseq
         F5QhHAprZaLpP/jqX5RZ8CH1n8ZiVDf4faob3lyGXuAAYPOPubLIP1jVhdZKbODkyOTU
         mAaX3rVxMJFxpU+xDfy5pev2bXEtx77mrGBg+B5nV1j9FfEHS++mg9o25XolFVHIMqGm
         iiFH9LBlKrubtmwwzNPIktfaGI04t6M2la2gserznuQS7fpt7WZYvqoM87te7uwXDRaO
         LuNmBIj5EJqmdqxh6g85bZ7mFCGkZRbyvMMt5DLTXaCw+35iI1LQAsLBW1x0NmT0AAHA
         /jPQ==
X-Gm-Message-State: AFqh2kqMChH3/8BOYQ64/cQf522K91a+gHTYI6749mgpP14/PqA8dpGk
	humIqz69jZ7qg50KnCnq0YyPAKTBfbOeow==
X-Google-Smtp-Source: AMrXdXuNA2GBxPxOegJkaId0Bz79NtHQ3Hr1vZksUzQpsgoW6pbF8TyawebhZ89Hk8aquzOyM1ZiXA==
X-Received: by 2002:a5d:6e90:0:b0:2bd:f388:841c with SMTP id k16-20020a5d6e90000000b002bdf388841cmr285685wrz.42.1673683383033;
        Sat, 14 Jan 2023 00:03:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm17867731wrv.113.2023.01.14.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 00:03:02 -0800 (PST)
Date: Sat, 14 Jan 2023 11:02:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] clk: qcom: gdsc: Disable HW control until supported
Message-ID: <202301140659.K71haT7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112135224.3837820-1-quic_bjorande@quicinc.com>
Message-ID: <20230114080256.xL9gg-MFlTmxbqOTi2XxJKv_yE84IPUBXV6bIGZk9VM@z>

Hi Bjorn,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bjorn-Andersson/clk-qcom-gdsc-Disable-HW-control-until-supported/20230112-215454
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230112135224.3837820-1-quic_bjorande%40quicinc.com
patch subject: [PATCH] clk: qcom: gdsc: Disable HW control until supported
config: riscv-randconfig-m041-20230113
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/clk/qcom/gdsc.c:405 gdsc_init() warn: missing unwind goto?

vim +405 drivers/clk/qcom/gdsc.c

45dd0e55317ccb Stephen Boyd    2015-08-06  331  static int gdsc_init(struct gdsc *sc)
45dd0e55317ccb Stephen Boyd    2015-08-06  332  {
45dd0e55317ccb Stephen Boyd    2015-08-06  333  	u32 mask, val;
45dd0e55317ccb Stephen Boyd    2015-08-06  334  	int on, ret;
45dd0e55317ccb Stephen Boyd    2015-08-06  335  
45dd0e55317ccb Stephen Boyd    2015-08-06  336  	/*
45dd0e55317ccb Stephen Boyd    2015-08-06  337  	 * Disable HW trigger: collapse/restore occur based on registers writes.
45dd0e55317ccb Stephen Boyd    2015-08-06  338  	 * Disable SW override: Use hardware state-machine for sequencing.
45dd0e55317ccb Stephen Boyd    2015-08-06  339  	 * Configure wait time between states.
45dd0e55317ccb Stephen Boyd    2015-08-06  340  	 */
45dd0e55317ccb Stephen Boyd    2015-08-06  341  	mask = HW_CONTROL_MASK | SW_OVERRIDE_MASK |
45dd0e55317ccb Stephen Boyd    2015-08-06  342  	       EN_REST_WAIT_MASK | EN_FEW_WAIT_MASK | CLK_DIS_WAIT_MASK;
4e7c4d3652f96f Taniya Das      2022-02-24  343  
4e7c4d3652f96f Taniya Das      2022-02-24  344  	if (!sc->en_rest_wait_val)
4e7c4d3652f96f Taniya Das      2022-02-24  345  		sc->en_rest_wait_val = EN_REST_WAIT_VAL;
4e7c4d3652f96f Taniya Das      2022-02-24  346  	if (!sc->en_few_wait_val)
4e7c4d3652f96f Taniya Das      2022-02-24  347  		sc->en_few_wait_val = EN_FEW_WAIT_VAL;
4e7c4d3652f96f Taniya Das      2022-02-24  348  	if (!sc->clk_dis_wait_val)
4e7c4d3652f96f Taniya Das      2022-02-24  349  		sc->clk_dis_wait_val = CLK_DIS_WAIT_VAL;
4e7c4d3652f96f Taniya Das      2022-02-24  350  
4e7c4d3652f96f Taniya Das      2022-02-24  351  	val = sc->en_rest_wait_val << EN_REST_WAIT_SHIFT |
4e7c4d3652f96f Taniya Das      2022-02-24  352  		sc->en_few_wait_val << EN_FEW_WAIT_SHIFT |
4e7c4d3652f96f Taniya Das      2022-02-24  353  		sc->clk_dis_wait_val << CLK_DIS_WAIT_SHIFT;
4e7c4d3652f96f Taniya Das      2022-02-24  354  
45dd0e55317ccb Stephen Boyd    2015-08-06  355  	ret = regmap_update_bits(sc->regmap, sc->gdscr, mask, val);
45dd0e55317ccb Stephen Boyd    2015-08-06  356  	if (ret)
45dd0e55317ccb Stephen Boyd    2015-08-06  357  		return ret;
45dd0e55317ccb Stephen Boyd    2015-08-06  358  
3c53f5e2179874 Rajendra Nayak  2015-08-06  359  	/* Force gdsc ON if only ON state is supported */
3c53f5e2179874 Rajendra Nayak  2015-08-06  360  	if (sc->pwrsts == PWRSTS_ON) {
88051f55de5028 Stephen Boyd    2018-05-01  361  		ret = gdsc_toggle_logic(sc, GDSC_ON);
3c53f5e2179874 Rajendra Nayak  2015-08-06  362  		if (ret)
3c53f5e2179874 Rajendra Nayak  2015-08-06  363  			return ret;
3c53f5e2179874 Rajendra Nayak  2015-08-06  364  	}
3c53f5e2179874 Rajendra Nayak  2015-08-06  365  
88051f55de5028 Stephen Boyd    2018-05-01  366  	on = gdsc_check_status(sc, GDSC_ON);
45dd0e55317ccb Stephen Boyd    2015-08-06  367  	if (on < 0)
45dd0e55317ccb Stephen Boyd    2015-08-06  368  		return on;
45dd0e55317ccb Stephen Boyd    2015-08-06  369  
9711759a87a041 Bjorn Andersson 2021-07-21  370  	if (on) {
9711759a87a041 Bjorn Andersson 2021-07-21  371  		/* The regulator must be on, sync the kernel state */
9711759a87a041 Bjorn Andersson 2021-07-21  372  		if (sc->rsupply) {
9711759a87a041 Bjorn Andersson 2021-07-21  373  			ret = regulator_enable(sc->rsupply);
9711759a87a041 Bjorn Andersson 2021-07-21  374  			if (ret < 0)
9711759a87a041 Bjorn Andersson 2021-07-21  375  				return ret;
9711759a87a041 Bjorn Andersson 2021-07-21  376  		}
9711759a87a041 Bjorn Andersson 2021-07-21  377  
a823bb9fbefbac Rajendra Nayak  2015-12-01  378  		/*
a823bb9fbefbac Rajendra Nayak  2015-12-01  379  		 * Votable GDSCs can be ON due to Vote from other masters.
a823bb9fbefbac Rajendra Nayak  2015-12-01  380  		 * If a Votable GDSC is ON, make sure we have a Vote.
a823bb9fbefbac Rajendra Nayak  2015-12-01  381  		 */
9711759a87a041 Bjorn Andersson 2021-07-21  382  		if (sc->flags & VOTABLE) {
e73cb8527c5975 Johan Hovold    2022-05-20  383  			ret = gdsc_update_collapse_bit(sc, false);
9711759a87a041 Bjorn Andersson 2021-07-21  384  			if (ret)
4cc47e8add6354 Stephen Boyd    2022-11-03  385  				goto err_disable_supply;
9711759a87a041 Bjorn Andersson 2021-07-21  386  		}
9711759a87a041 Bjorn Andersson 2021-07-21  387  
fda48bf5c86d88 Stephen Boyd    2020-10-16  388  		/*
9711759a87a041 Bjorn Andersson 2021-07-21  389  		 * Make sure the retain bit is set if the GDSC is already on,
9711759a87a041 Bjorn Andersson 2021-07-21  390  		 * otherwise we end up turning off the GDSC and destroying all
9711759a87a041 Bjorn Andersson 2021-07-21  391  		 * the register contents that we thought we were saving.
fda48bf5c86d88 Stephen Boyd    2020-10-16  392  		 */
9711759a87a041 Bjorn Andersson 2021-07-21  393  		if (sc->flags & RETAIN_FF_ENABLE)
fda48bf5c86d88 Stephen Boyd    2020-10-16  394  			gdsc_retain_ff_on(sc);
9711759a87a041 Bjorn Andersson 2021-07-21  395  	} else if (sc->flags & ALWAYS_ON) {
fb55bea1fe436b Rajendra Nayak  2018-03-23  396  		/* If ALWAYS_ON GDSCs are not ON, turn them ON */
fb55bea1fe436b Rajendra Nayak  2018-03-23  397  		gdsc_enable(&sc->pd);
fb55bea1fe436b Rajendra Nayak  2018-03-23  398  		on = true;
fb55bea1fe436b Rajendra Nayak  2018-03-23  399  	}
fb55bea1fe436b Rajendra Nayak  2018-03-23  400  
d02f1b6ec32c40 Bjorn Andersson 2023-01-12  401  	/* Disable HW trigger mode until propertly supported */
d02f1b6ec32c40 Bjorn Andersson 2023-01-12  402  	if (sc->flags & HW_CTRL) {
d02f1b6ec32c40 Bjorn Andersson 2023-01-12  403  		ret = gdsc_hwctrl(sc, false);
d02f1b6ec32c40 Bjorn Andersson 2023-01-12  404  		if (ret < 0)
d02f1b6ec32c40 Bjorn Andersson 2023-01-12 @405  			return ret;

goto err_disable_supply;?

d02f1b6ec32c40 Bjorn Andersson 2023-01-12  406  	}
d02f1b6ec32c40 Bjorn Andersson 2023-01-12  407  
014e193ccd197d Rajendra Nayak  2015-08-06  408  	if (on || (sc->pwrsts & PWRSTS_RET))
014e193ccd197d Rajendra Nayak  2015-08-06  409  		gdsc_force_mem_on(sc);
014e193ccd197d Rajendra Nayak  2015-08-06  410  	else
014e193ccd197d Rajendra Nayak  2015-08-06  411  		gdsc_clear_mem_on(sc);
014e193ccd197d Rajendra Nayak  2015-08-06  412  
9711759a87a041 Bjorn Andersson 2021-07-21  413  	if (sc->flags & ALWAYS_ON)
9711759a87a041 Bjorn Andersson 2021-07-21  414  		sc->pd.flags |= GENPD_FLAG_ALWAYS_ON;
7895861a963cfa Jordan Crouse   2018-11-26  415  	if (!sc->pd.power_off)
45dd0e55317ccb Stephen Boyd    2015-08-06  416  		sc->pd.power_off = gdsc_disable;
7895861a963cfa Jordan Crouse   2018-11-26  417  	if (!sc->pd.power_on)
45dd0e55317ccb Stephen Boyd    2015-08-06  418  		sc->pd.power_on = gdsc_enable;
eab4c1ebdd6579 Johan Hovold    2022-09-29  419  
eab4c1ebdd6579 Johan Hovold    2022-09-29  420  	ret = pm_genpd_init(&sc->pd, NULL, !on);
eab4c1ebdd6579 Johan Hovold    2022-09-29  421  	if (ret)
4cc47e8add6354 Stephen Boyd    2022-11-03  422  		goto err_disable_supply;
45dd0e55317ccb Stephen Boyd    2015-08-06  423  
45dd0e55317ccb Stephen Boyd    2015-08-06  424  	return 0;
eab4c1ebdd6579 Johan Hovold    2022-09-29  425  
eab4c1ebdd6579 Johan Hovold    2022-09-29  426  err_disable_supply:
eab4c1ebdd6579 Johan Hovold    2022-09-29  427  	if (on && sc->rsupply)
eab4c1ebdd6579 Johan Hovold    2022-09-29  428  		regulator_disable(sc->rsupply);
eab4c1ebdd6579 Johan Hovold    2022-09-29  429  
eab4c1ebdd6579 Johan Hovold    2022-09-29  430  	return ret;
45dd0e55317ccb Stephen Boyd    2015-08-06  431  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

