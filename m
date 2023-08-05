Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DF1FA5;
	Sat,  5 Aug 2023 06:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FCEC433C8;
	Sat,  5 Aug 2023 06:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691218515;
	bh=CWuiwNpYaagDLL/LrQOC3RkL/Tw83UVKw2ZR/aOcvKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0Zy+XPZZso7N5yfqEPNfN0WQiLnvUCJ0C8WUrGQiCcewD2skHPlxqugoIQ4PMGxP
	 y60ozeZVrBJfTfPkJCM+8Yx8+RNsRyjUSkQiGXA+yhZsJFaFnw2qR64kNyTKQVgidi
	 h+FPHrNRHVSSAZ0ld5iF6hwNqvjdBWBL1MC3WpxJ6Rw+yABo5oRiEm1mJfAC1bdSSI
	 VXNe2f/jBrjStGYqZ4V6g3zGwHtzEzBD49wVd5uyw8O6MyoA15paHTDkl4tdzTToEY
	 6o33PqgLZzntfmA0kEG/ydJn7D3Tc72RLVsQeiKJiuFg/L60mCzkik1w5ZPx1LrzEi
	 U9iLz803jJdfA==
Date: Sat, 5 Aug 2023 12:25:10 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	Md Sadre Alam <quic_mdalam@quicinc.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Message-ID: <20230805065510.GA18650@thinkpad>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
 <20230804184550.0cb12369@xps-13>
 <3604e2ed-8d30-4f7b-9e56-7af5b23b2ac5@kadam.mountain>
 <20230804190750.3367a044@xps-13>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804190750.3367a044@xps-13>

On Fri, Aug 04, 2023 at 07:07:50PM +0200, Miquel Raynal wrote:
> Hi Dan,
> 
> dan.carpenter@linaro.org wrote on Fri, 4 Aug 2023 19:52:50 +0300:
> 
> > On Fri, Aug 04, 2023 at 06:45:50PM +0200, Miquel Raynal wrote:
> > > Hi Sadre, Sricharan & Manivannan,
> > > 
> > > A couple of questions for you below.
> > > 
> > > dan.carpenter@linaro.org wrote on Thu, 3 Aug 2023 15:20:56 +0300:
> > >   
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
> > > > commit: 89550beb098e04b951df079483fb064eafc0e5fa [1937/6910] mtd: rawnand: qcom: Implement exec_op()
> > > > config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/config)
> > > > compiler: riscv64-linux-gcc (GCC) 12.3.0
> > > > reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022.SnXkKyFs-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > | Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
> > > > 
> > > > New smatch warnings:
> > > > drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.
> > > > drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && intended here instead of ||?
> > > > 
> > > > Old smatch warnings:
> > > > drivers/mtd/nand/raw/qcom_nandc.c:3076 qcom_read_status_exec() warn: inconsistent indenting
> > > > 
> > > > vim +/ret +2941 drivers/mtd/nand/raw/qcom_nandc.c
> > > > 
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2909  static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 cmd,
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2910  			       struct qcom_op *q_op)
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2911  {
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2912  	int ret;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2913  
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2914  	switch (cmd) {
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2915  	case NAND_CMD_RESET:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2916  		ret = OP_RESET_DEVICE;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2917  		break;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2918  	case NAND_CMD_READID:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2919  		ret = OP_FETCH_ID;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2920  		break;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2921  	case NAND_CMD_PARAM:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2922  		if (nandc->props->qpic_v2)
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2923  			ret = OP_PAGE_READ_ONFI_READ;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2924  		else
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2925  			ret = OP_PAGE_READ;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2926  		break;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2927  	case NAND_CMD_ERASE1:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2928  	case NAND_CMD_ERASE2:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2929  		ret = OP_BLOCK_ERASE;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2930  		break;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2931  	case NAND_CMD_STATUS:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2932  		ret = OP_CHECK_STATUS;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2933  		break;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2934  	case NAND_CMD_PAGEPROG:
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2935  		ret = OP_PROGRAM_PAGE;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2936  		q_op->flag = OP_PROGRAM_PAGE;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2937  		nandc->exec_opwrite = true;
> > > > 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10  2938  		break;
> > > > 
> > > > No default case.  I'm more concerned about the && vs || warning, but
> > > > the zero day bot doesn't include that code into the email.  
> > > 
> > > The default case here is in theory not possible, as long as
> > > qcom_check_op() is properly implemented. We should however silence the
> > > warning by handling it. Maybe a WARN_ON_ONCE() + ret = <anything that
> > > will produce an error when executing the command> would work.
> > >   
> > 
> > The kbuild-bot runs without the cross function database so it has a lot
> > of false positives that you wouldn't see if you had the DB.  (There
> > isn't really a way to build with the cross function DB.  It takes way
> > way way too long.  Also it sometimes finds bug which are complicated to
> > explain or to assign blame for in an automated way).  But these false
> > positives are frustrating to me.
> 
> I understand.
> 
> > In real life, GCC is going to automatically initialize stack variables
> > to zero on production systems.
> 
> Well, we must silence this by setting reg in all cases, but here the
> variable is badly named, it should be s/ret/cmd/. That's why, if we
> silence it properly, I would go for a runtime warning if we ever
> encounter the situation because this is a purely software bug.
> 

I agree, it is better to add a default case for sanity. Regarding the variable
naming, I agree it should be improved. Something like,

s/cmd/opcode
s/ret/cmd

Also, I do not want to add WARN_ON_ONCE() here, but rather a dev_err().

> > > However I doubt the following piece of code has been successfully
> > > tested:
> > > 
> > >         for (op_id = 0; op_id < op->ninstrs; op_id++) {
> > >                 instr = &op->instrs[op_id];
> > > 
> > >                 switch (instr->type) {
> > >                 case NAND_OP_CMD_INSTR:
> > >                         if (instr->ctx.cmd.opcode != NAND_CMD_RESET ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_READID ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_PARAM ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_ERASE1 ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_ERASE2 ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_STATUS ||
> > >                             instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
> > >                                 return -ENOTSUPP;
> > >                         break;
> > > 
> > > The || should be &&, otherwise it cannot work, or am I missing
> > > something?  
> > 
> > Yeah.  That's how this bug normally looks like.  NAND_OP_CMD_INSTR
> > always returns -ENOTSUPP.
> > 

Yes, this is a bug.

I didn't get a chance to review the exec_op conversion series (blame myself).
Now I see scope for a cleaup series :/

Let me spin something by the end of today.

- Mani

> > regards,
> > dan carpenter
> > 
> 
> 
> Thanks,
> Miquèl

-- 
மணிவண்ணன் சதாசிவம்
