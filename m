Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8FBE7C;
	Fri,  4 Aug 2023 16:46:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D37C1BF203;
	Fri,  4 Aug 2023 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691167553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ugXLElAAOKIEAnk0rKLdwh1BvZ5lkdepZXqjWfYBi5k=;
	b=YeTfnxEIi2KBO5Pm2Cksuk0Go2jOP+tP3reRouVRKO6aXfshamx2U2KecMWfcKHDCz9VtW
	0GNwfpg/CluISdTqVBDmF8MkgSP7I9vI+mDmeB2QvFvt1y43zvCukiHxuNQ3zHByDH4bKr
	ZMia7AZpCpSzdi9i/zge20lnhjZhqIN4zrS2Pq1AdZ8KOM9M1AapwkLT0LfrFWwJm6CzHV
	SnlcGzegx+fv4NgdgDDYc9/hVa3NzIAi0Z87ti0hajHODC10x5tesgWCsYIsUu9iUHiAKS
	IMClv+QYTAisyCzv2gnXzynU9ysTMmhe6mIVfdHVv4/snHuI6WxYHSKr35WEJA==
Date: Fri, 4 Aug 2023 18:45:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Md Sadre Alam <quic_mdalam@quicinc.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [linux-next:master 1937/6910]
 drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error:
 uninitialized symbol 'ret'.
Message-ID: <20230804184550.0cb12369@xps-13>
In-Reply-To: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
References: <7ad1160b-5f8c-47af-a1c5-51b34f656fab@kadam.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Sadre, Sricharan & Manivannan,

A couple of questions for you below.

dan.carpenter@linaro.org wrote on Thu, 3 Aug 2023 15:20:56 +0300:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb4327106e5250ee360d0d8b056c1eef7eeb9a98
> commit: 89550beb098e04b951df079483fb064eafc0e5fa [1937/6910] mtd: rawnand=
: qcom: Implement exec_op()
> config: riscv-randconfig-m031-20230730 (https://download.01.org/0day-ci/a=
rchive/20230803/202308032022.SnXkKyFs-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230803/202308032022=
.SnXkKyFs-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
>=20
> New smatch warnings:
> drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: unini=
tialized symbol 'ret'.
> drivers/mtd/nand/raw/qcom_nandc.c:3369 qcom_check_op() warn: was && inten=
ded here instead of ||?
>=20
> Old smatch warnings:
> drivers/mtd/nand/raw/qcom_nandc.c:3076 qcom_read_status_exec() warn: inco=
nsistent indenting
>=20
> vim +/ret +2941 drivers/mtd/nand/raw/qcom_nandc.c
>=20
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2909  static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, =
u8 cmd,
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2910  			       struct qcom_op *q_op)
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2911  {
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2912  	int ret;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2913 =20
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2914  	switch (cmd) {
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2915  	case NAND_CMD_RESET:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2916  		ret =3D OP_RESET_DEVICE;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2917  		break;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2918  	case NAND_CMD_READID:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2919  		ret =3D OP_FETCH_ID;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2920  		break;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2921  	case NAND_CMD_PARAM:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2922  		if (nandc->props->qpic_v2)
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2923  			ret =3D OP_PAGE_READ_ONFI_READ;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2924  		else
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2925  			ret =3D OP_PAGE_READ;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2926  		break;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2927  	case NAND_CMD_ERASE1:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2928  	case NAND_CMD_ERASE2:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2929  		ret =3D OP_BLOCK_ERASE;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2930  		break;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2931  	case NAND_CMD_STATUS:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2932  		ret =3D OP_CHECK_STATUS;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2933  		break;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2934  	case NAND_CMD_PAGEPROG:
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2935  		ret =3D OP_PROGRAM_PAGE;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2936  		q_op->flag =3D OP_PROGRAM_PAGE;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2937  		nandc->exec_opwrite =3D true;
> 89550beb098e04 drivers/mtd/nand/raw/qcom_nandc.c Md Sadre Alam 2023-07-10=
  2938  		break;
>=20
> No default case.  I'm more concerned about the && vs || warning, but
> the zero day bot doesn't include that code into the email.

The default case here is in theory not possible, as long as
qcom_check_op() is properly implemented. We should however silence the
warning by handling it. Maybe a WARN_ON_ONCE() + ret =3D <anything that
will produce an error when executing the command> would work.

However I doubt the following piece of code has been successfully
tested:

        for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
                instr =3D &op->instrs[op_id];

                switch (instr->type) {
                case NAND_OP_CMD_INSTR:
                        if (instr->ctx.cmd.opcode !=3D NAND_CMD_RESET ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_READID ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_PARAM ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_ERASE1 ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_ERASE2 ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_STATUS ||
                            instr->ctx.cmd.opcode !=3D NAND_CMD_PAGEPROG)
                                return -ENOTSUPP;
                        break;

The || should be &&, otherwise it cannot work, or am I missing
something?

Thanks,
Miqu=C3=A8l
