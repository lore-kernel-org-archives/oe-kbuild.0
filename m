Content-Type: multipart/mixed; boundary="===============5800410571051946988=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5027/7915] drivers/mmc/host/litex_mmc.c:424 litex_mmc_request() error: we previously assumed 'data' could be null (see line 418)
Date: Fri, 25 Feb 2022 03:10:11 +0800
Message-ID: <202202250221.FMMLnUdX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5800410571051946988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gabriel Somlo <gsomlo@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Kamil Rakoczy <krakoczy@antmicro.com>
CC: Maciej Dudek <mdudek@internships.antmicro.com>
CC: Paul Mackerras <paulus@ozlabs.org>
CC: Joel Stanley <joel@jms.id.au>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: 4576abc4dbd7041fbd06e787089a3102bbe8d059 [5027/7915] mmc: Add drive=
r for LiteX's LiteSDCard interface
:::::: branch date: 17 hours ago
:::::: commit date: 10 days ago
config: microblaze-randconfig-m031-20220224 (https://download.01.org/0day-c=
i/archive/20220225/202202250221.FMMLnUdX-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mmc/host/litex_mmc.c:424 litex_mmc_request() error: we previously a=
ssumed 'data' could be null (see line 418)

vim +/data +424 drivers/mmc/host/litex_mmc.c

4576abc4dbd704 Gabriel Somlo 2022-01-13  337  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  338  static void litex_mmc_request=
(struct mmc_host *mmc, struct mmc_request *mrq)
4576abc4dbd704 Gabriel Somlo 2022-01-13  339  {
4576abc4dbd704 Gabriel Somlo 2022-01-13  340  	struct litex_mmc_host *host =
=3D mmc_priv(mmc);
4576abc4dbd704 Gabriel Somlo 2022-01-13  341  	struct device *dev =3D mmc_d=
ev(mmc);
4576abc4dbd704 Gabriel Somlo 2022-01-13  342  	struct mmc_command *cmd =3D =
mrq->cmd;
4576abc4dbd704 Gabriel Somlo 2022-01-13  343  	struct mmc_command *sbc =3D =
mrq->sbc;
4576abc4dbd704 Gabriel Somlo 2022-01-13  344  	struct mmc_data *data =3D mr=
q->data;
4576abc4dbd704 Gabriel Somlo 2022-01-13  345  	struct mmc_command *stop =3D=
 mrq->stop;
4576abc4dbd704 Gabriel Somlo 2022-01-13  346  	unsigned int retries =3D cmd=
->retries;
4576abc4dbd704 Gabriel Somlo 2022-01-13  347  	unsigned int len =3D 0;
4576abc4dbd704 Gabriel Somlo 2022-01-13  348  	bool direct =3D false;
4576abc4dbd704 Gabriel Somlo 2022-01-13  349  	u32 response_len =3D litex_m=
mc_response_len(cmd);
4576abc4dbd704 Gabriel Somlo 2022-01-13  350  	u8 transfer =3D SD_CTL_DATA_=
XFER_NONE;
4576abc4dbd704 Gabriel Somlo 2022-01-13  351  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  352  	/* First check that the card=
 is still there */
4576abc4dbd704 Gabriel Somlo 2022-01-13  353  	if (!litex_mmc_get_cd(mmc)) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  354  		cmd->error =3D -ENOMEDIUM;
4576abc4dbd704 Gabriel Somlo 2022-01-13  355  		mmc_request_done(mmc, mrq);
4576abc4dbd704 Gabriel Somlo 2022-01-13  356  		return;
4576abc4dbd704 Gabriel Somlo 2022-01-13  357  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  358  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  359  	/* Send set-block-count comm=
and if needed */
4576abc4dbd704 Gabriel Somlo 2022-01-13  360  	if (sbc) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  361  		sbc->error =3D litex_mmc_se=
nd_cmd(host, sbc->opcode, sbc->arg,
4576abc4dbd704 Gabriel Somlo 2022-01-13  362  						litex_mmc_response_len(=
sbc),
4576abc4dbd704 Gabriel Somlo 2022-01-13  363  						SD_CTL_DATA_XFER_NONE);
4576abc4dbd704 Gabriel Somlo 2022-01-13  364  		if (sbc->error) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  365  			host->is_bus_width_set =3D=
 false;
4576abc4dbd704 Gabriel Somlo 2022-01-13  366  			mmc_request_done(mmc, mrq);
4576abc4dbd704 Gabriel Somlo 2022-01-13  367  			return;
4576abc4dbd704 Gabriel Somlo 2022-01-13  368  		}
4576abc4dbd704 Gabriel Somlo 2022-01-13  369  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  370  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  371  	if (data) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  372  		/*
4576abc4dbd704 Gabriel Somlo 2022-01-13  373  		 * LiteSDCard only supports=
 4-bit bus width; therefore, we MUST
4576abc4dbd704 Gabriel Somlo 2022-01-13  374  		 * inject a SET_BUS_WIDTH (=
acmd6) before the very first data
4576abc4dbd704 Gabriel Somlo 2022-01-13  375  		 * transfer, earlier than w=
hen the mmc subsystem would normally
4576abc4dbd704 Gabriel Somlo 2022-01-13  376  		 * get around to it!
4576abc4dbd704 Gabriel Somlo 2022-01-13  377  		 */
4576abc4dbd704 Gabriel Somlo 2022-01-13  378  		cmd->error =3D litex_mmc_se=
t_bus_width(host);
4576abc4dbd704 Gabriel Somlo 2022-01-13  379  		if (cmd->error) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  380  			dev_err(dev, "Can't set bu=
s width!\n");
4576abc4dbd704 Gabriel Somlo 2022-01-13  381  			mmc_request_done(mmc, mrq);
4576abc4dbd704 Gabriel Somlo 2022-01-13  382  			return;
4576abc4dbd704 Gabriel Somlo 2022-01-13  383  		}
4576abc4dbd704 Gabriel Somlo 2022-01-13  384  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  385  		litex_mmc_do_dma(host, data=
, &len, &direct, &transfer);
4576abc4dbd704 Gabriel Somlo 2022-01-13  386  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  387  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  388  	do {
4576abc4dbd704 Gabriel Somlo 2022-01-13  389  		cmd->error =3D litex_mmc_se=
nd_cmd(host, cmd->opcode, cmd->arg,
4576abc4dbd704 Gabriel Somlo 2022-01-13  390  						response_len, transfer);
4576abc4dbd704 Gabriel Somlo 2022-01-13  391  	} while (cmd->error && retri=
es-- > 0);
4576abc4dbd704 Gabriel Somlo 2022-01-13  392  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  393  	if (cmd->error) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  394  		/* Card may be gone; don't =
assume bus width is still set */
4576abc4dbd704 Gabriel Somlo 2022-01-13  395  		host->is_bus_width_set =3D =
false;
4576abc4dbd704 Gabriel Somlo 2022-01-13  396  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  397  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  398  	if (response_len =3D=3D SD_C=
TL_RESP_SHORT) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  399  		/* Pull short response fiel=
ds from appropriate host registers */
4576abc4dbd704 Gabriel Somlo 2022-01-13  400  		cmd->resp[0] =3D host->resp=
[3];
4576abc4dbd704 Gabriel Somlo 2022-01-13  401  		cmd->resp[1] =3D host->resp=
[2] & 0xFF;
4576abc4dbd704 Gabriel Somlo 2022-01-13  402  	} else if (response_len =3D=
=3D SD_CTL_RESP_LONG) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  403  		cmd->resp[0] =3D host->resp=
[0];
4576abc4dbd704 Gabriel Somlo 2022-01-13  404  		cmd->resp[1] =3D host->resp=
[1];
4576abc4dbd704 Gabriel Somlo 2022-01-13  405  		cmd->resp[2] =3D host->resp=
[2];
4576abc4dbd704 Gabriel Somlo 2022-01-13  406  		cmd->resp[3] =3D host->resp=
[3];
4576abc4dbd704 Gabriel Somlo 2022-01-13  407  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  408  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  409  	/* Send stop-transmission co=
mmand if required */
4576abc4dbd704 Gabriel Somlo 2022-01-13  410  	if (stop && (cmd->error || !=
sbc)) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  411  		stop->error =3D litex_mmc_s=
end_cmd(host, stop->opcode, stop->arg,
4576abc4dbd704 Gabriel Somlo 2022-01-13  412  						 litex_mmc_response_len=
(stop),
4576abc4dbd704 Gabriel Somlo 2022-01-13  413  						 SD_CTL_DATA_XFER_NONE);
4576abc4dbd704 Gabriel Somlo 2022-01-13  414  		if (stop->error)
4576abc4dbd704 Gabriel Somlo 2022-01-13  415  			host->is_bus_width_set =3D=
 false;
4576abc4dbd704 Gabriel Somlo 2022-01-13  416  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  417  =

4576abc4dbd704 Gabriel Somlo 2022-01-13 @418  	if (data) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  419  		dma_unmap_sg(dev, data->sg,=
 data->sg_len,
4576abc4dbd704 Gabriel Somlo 2022-01-13  420  			     mmc_get_dma_dir(data)=
);
4576abc4dbd704 Gabriel Somlo 2022-01-13  421  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  422  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  423  	if (!cmd->error && transfer =
!=3D SD_CTL_DATA_XFER_NONE) {
4576abc4dbd704 Gabriel Somlo 2022-01-13 @424  		data->bytes_xfered =3D min(=
len, mmc->max_req_size);
4576abc4dbd704 Gabriel Somlo 2022-01-13  425  		if (transfer =3D=3D SD_CTL_=
DATA_XFER_READ && !direct) {
4576abc4dbd704 Gabriel Somlo 2022-01-13  426  			sg_copy_from_buffer(data->=
sg, sg_nents(data->sg),
4576abc4dbd704 Gabriel Somlo 2022-01-13  427  					    host->buffer, data->=
bytes_xfered);
4576abc4dbd704 Gabriel Somlo 2022-01-13  428  		}
4576abc4dbd704 Gabriel Somlo 2022-01-13  429  	}
4576abc4dbd704 Gabriel Somlo 2022-01-13  430  =

4576abc4dbd704 Gabriel Somlo 2022-01-13  431  	mmc_request_done(mmc, mrq);
4576abc4dbd704 Gabriel Somlo 2022-01-13  432  }
4576abc4dbd704 Gabriel Somlo 2022-01-13  433  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5800410571051946988==--

