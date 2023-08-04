Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B66C2CA
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 16:52:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so4012742e87.2
        for <oe-kbuild@lists.linux.dev>; Fri, 04 Aug 2023 09:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691167974; x=1691772774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnaCosAexdGAygEMqKp7KjQb9b47vUaddFUualtAX0w=;
        b=iVTGTZEBZCtC/nqh5uQDsnt9lMgfb2zfYh0yxe7vtDs9V7/SbcpNbqaK47hcTNENNz
         5TPUziv/zdtYo06k4vcCB0a0ul9Z8HOLK+zs8SKocPIlVcxmxlOiBwoX6O8oO9cGzvEv
         wz+f9xaVDPlVIlDUkRqJq0Mhsq7MRpdM1d7DvbMSoC7TZPDykTEtJGF96l4dghzCNpC7
         tfJIY6IkHzIlcuTFmJk8u5vPDB8AQdjcDEyFTDk2N60D9tnqbtwPDABG9xOCNvHmS3Gu
         cnocXuoq/+EdOW/8Ac49vS4t7A7Zg/alNEFDm1jA9MCKvAeVnHwmf54MceivEz5pHrAX
         3izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691167974; x=1691772774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnaCosAexdGAygEMqKp7KjQb9b47vUaddFUualtAX0w=;
        b=NXwzMvhxPNBKrw65yNLs+FHcrUK6SY27WX1kK5RYoyzUpgl5az1Lid6eejtyISb93i
         QU4U131e88h/HM2K91MY7pi/R+vBCK7ehDIAJ10qundAWdeaSap4EFwqCu6mCtAkeoqg
         NFlgzDgfDyZivJ3qGOcC9IgvxilLu5uppF4D4qwq2k3PEFeAHIJBKqt2Cy2w4lvvm0Kg
         NnmtFFBwqvzkqSYY2FnlKbKIRQmgmtZByI8reHaVrBw4r+mmQh3apa5CfX4j9wWDacUs
         u5S8gYz3RTNu3otaqnC42SHvBxMdQTafQ7seujq6FniVWptvXbIyZdN4laloeushI419
         jXHw==
X-Gm-Message-State: AOJu0YzXRvJFs6xkXM4T3LnXwhvPwGIpYwpKkQRPbD8RqWLAOJItscrC
	2FnweywB2G7bOi8moY1e/U99fg==
X-Google-Smtp-Source: AGHT+IEcTiwnzo+QgT2pIdD4HCLDKR2pZSc/Rapzz6vl/kltVHoTpSph39il3efrnL3YZtkQYfoQsg==
X-Received: by 2002:a05:6512:208c:b0:4fe:17d9:6755 with SMTP id t12-20020a056512208c00b004fe17d96755mr1465840lfr.25.1691167973564;
        Fri, 04 Aug 2023 09:52:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v13-20020a1cf70d000000b003fe17901fcdsm7209490wmh.32.2023.08.04.09.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 09:52:53 -0700 (PDT)
Date: Fri, 4 Aug 2023 19:52:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild@lists.linux.dev, Md Sadre Alam <quic_mdalam@quicinc.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Message-ID: <3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
 <20230804184550.0cb12369@xps-13>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804184550.0cb12369@xps-13>

On Fri, Aug 04, 2023 at 06:45:50PM +0200, Miquel Raynal wrote:
> Hi Sadre, Sricharan & Manivannan,
> 
> A couple of questions for you below.
> 
> dan.carpenter@linaro.org wrote on Thu, 3 Aug 2023 15:20:56 +0300:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
> > commit: 89550beb098e04b951df079483fb064eafc0e5fa [1937/6910] mtd: rawnand: qcom: Implement exec_op()
> > config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
> > 
> > New smatch warnings:
> > drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
> > drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && intended here instead of ||?
> > 
> > Old smatch warnings:
> > drivers/mtd/nand/raw/qcom_nandc.c:3076 qcom_read_status_exec() warn: inconsistent indenting
> > 
> > vim +/ret +2941 drivers/mtd/nand/raw/qcom_nandc.c
> > 
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2909  static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2910  			       struct qcom_op *q_op)
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2911  {
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2912  	int ret;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2913  
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2914  	switch (cmd) {
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2915  	case NAND_CMD_RESET:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2916  		ret = OP_RESET_DEVICE;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2917  		break;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2918  	case NAND_CMD_READID:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2919  		ret = OP_FETCH_ID;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2920  		break;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2921  	case NAND_CMD_PARAM:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2922  		if (nandc->props->qpic_v2)
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2923  			ret = OP_PAGE_READ_ONFI_READ;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2924  		else
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2925  			ret = OP_PAGE_READ;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2926  		break;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2927  	case NAND_CMD_ERASE1:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2928  	case NAND_CMD_ERASE2:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2929  		ret = OP_BLOCK_ERASE;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2930  		break;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2931  	case NAND_CMD_STATUS:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2932  		ret = OP_CHECK_STATUS;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2933  		break;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2934  	case NAND_CMD_PAGEPROG:
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2935  		ret = OP_PROGRAM_PAGE;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2936  		q_op->flag = OP_PROGRAM_PAGE;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2937  		nandc->exec_opwrite = true;
> > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2938  		break;
> > 
> > No default case.  I'm more concerned about the && vs || warning, but
> > the zero day bot doesn't include that code into the email.
> 
> The default case here is in theory not possible, as long as
> qcom_check_op() is properly implemented. We should however silence the
> warning by handling it. Maybe a WARN_ON_ONCE() + ret = <anything that
> will produce an error when executing the command> would work.
> 

The kbuild-bot runs without the cross function database so it has a lot
of false positives that you wouldn't see if you had the DB.  (There
isn't really a way to build with the cross function DB.  It takes way
way way too long.  Also it sometimes finds bug which are complicated to
explain or to assign blame for in an automated way).  But these false
positives are frustrating to me.

In real life, GCC is going to automatically initialize stack variables
to zero on production systems.

> However I doubt the following piece of code has been successfully
> tested:
> 
>         for (op_id = 0; op_id < op->ninstrs; op_id++) {
>                 instr = &op->instrs[op_id];
> 
>                 switch (instr->type) {
>                 case NAND_OP_CMD_INSTR:
>                         if (instr->ctx.cmd.opcode != NAND_CMD_RESET ||
>                             instr->ctx.cmd.opcode != NAND_CMD_READID ||
>                             instr->ctx.cmd.opcode != NAND_CMD_PARAM ||
>                             instr->ctx.cmd.opcode != NAND_CMD_ERASE1 ||
>                             instr->ctx.cmd.opcode != NAND_CMD_ERASE2 ||
>                             instr->ctx.cmd.opcode != NAND_CMD_STATUS ||
>                             instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
>                                 return -ENOTSUPP;
>                         break;
> 
> The || should be &&, otherwise it cannot work, or am I missing
> something?

Yeah.  That's how this bug normally looks like.  NAND_OP_CMD_INSTR
always returns -ENOTSUPP.

regards,
dan carpenter

