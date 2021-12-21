Content-Type: multipart/mixed; boundary="===============8396428674375039946=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 3/3] mmc: Add driver for LiteX's LiteSDCard interface
Date: Tue, 21 Dec 2021 18:46:16 +0800
Message-ID: <202112211815.CYSR6MVP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8396428674375039946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211215130711.111186-4-gsomlo@gmail.com>
References: <20211215130711.111186-4-gsomlo@gmail.com>
TO: Gabriel Somlo <gsomlo@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: robh+dt(a)kernel.org
CC: devicetree(a)vger.kernel.org
CC: ulf.hansson(a)linaro.org
CC: linux-mmc(a)vger.kernel.org
CC: kgugala(a)antmicro.com
CC: mholenko(a)antmicro.com
CC: krakoczy(a)antmicro.com
CC: mdudek(a)internships.antmicro.com
CC: paulus(a)ozlabs.org

Hi Gabriel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linux/master ulf-hansson-mmc-mirror/next linus/=
master v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gabriel-Somlo/mmc-Add-Lite=
SDCard-mmc-driver/20211215-211022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-m021-20211219 (https://download.01.org/0day-ci/arch=
ive/20211221/202112211815.CYSR6MVP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mmc/host/litex_mmc.c:416 litex_mmc_request() error: we previously a=
ssumed 'data' could be null (see line 410)

vim +/data +416 drivers/mmc/host/litex_mmc.c

e5f0016daf4739 Gabriel Somlo 2021-12-15  330  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  331  static void litex_mmc_request=
(struct mmc_host *mmc, struct mmc_request *mrq)
e5f0016daf4739 Gabriel Somlo 2021-12-15  332  {
e5f0016daf4739 Gabriel Somlo 2021-12-15  333  	struct litex_mmc_host *host =
=3D mmc_priv(mmc);
e5f0016daf4739 Gabriel Somlo 2021-12-15  334  	struct device *dev =3D mmc_d=
ev(mmc);
e5f0016daf4739 Gabriel Somlo 2021-12-15  335  	struct mmc_command *cmd =3D =
mrq->cmd;
e5f0016daf4739 Gabriel Somlo 2021-12-15  336  	struct mmc_command *sbc =3D =
mrq->sbc;
e5f0016daf4739 Gabriel Somlo 2021-12-15  337  	struct mmc_data *data =3D mr=
q->data;
e5f0016daf4739 Gabriel Somlo 2021-12-15  338  	struct mmc_command *stop =3D=
 mrq->stop;
e5f0016daf4739 Gabriel Somlo 2021-12-15  339  	unsigned int retries =3D cmd=
->retries;
e5f0016daf4739 Gabriel Somlo 2021-12-15  340  	unsigned int len =3D 0;
e5f0016daf4739 Gabriel Somlo 2021-12-15  341  	bool direct =3D false;
e5f0016daf4739 Gabriel Somlo 2021-12-15  342  	u32 response_len =3D litex_m=
mc_response_len(cmd);
e5f0016daf4739 Gabriel Somlo 2021-12-15  343  	u8 transfer =3D SD_CTL_DATA_=
XFER_NONE;
e5f0016daf4739 Gabriel Somlo 2021-12-15  344  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  345  	/* First check that the card=
 is still there */
e5f0016daf4739 Gabriel Somlo 2021-12-15  346  	if (!litex_mmc_get_cd(mmc)) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  347  		cmd->error =3D -ENOMEDIUM;
e5f0016daf4739 Gabriel Somlo 2021-12-15  348  		mmc_request_done(mmc, mrq);
e5f0016daf4739 Gabriel Somlo 2021-12-15  349  		return;
e5f0016daf4739 Gabriel Somlo 2021-12-15  350  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  351  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  352  	/* Send set-block-count comm=
and if needed */
e5f0016daf4739 Gabriel Somlo 2021-12-15  353  	if (sbc) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  354  		sbc->error =3D litex_mmc_se=
nd_cmd(host, sbc->opcode, sbc->arg,
e5f0016daf4739 Gabriel Somlo 2021-12-15  355  						litex_mmc_response_len(=
sbc),
e5f0016daf4739 Gabriel Somlo 2021-12-15  356  						SD_CTL_DATA_XFER_NONE);
e5f0016daf4739 Gabriel Somlo 2021-12-15  357  		if (sbc->error) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  358  			host->is_bus_width_set =3D=
 false;
e5f0016daf4739 Gabriel Somlo 2021-12-15  359  			mmc_request_done(mmc, mrq);
e5f0016daf4739 Gabriel Somlo 2021-12-15  360  			return;
e5f0016daf4739 Gabriel Somlo 2021-12-15  361  		}
e5f0016daf4739 Gabriel Somlo 2021-12-15  362  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  363  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  364  	if (data) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  365  		/* LiteSDCard only supports=
 4-bit bus width; therefore, we MUST
e5f0016daf4739 Gabriel Somlo 2021-12-15  366  		 * inject a SET_BUS_WIDTH (=
acmd6) before the very first data
e5f0016daf4739 Gabriel Somlo 2021-12-15  367  		 * transfer, earlier than w=
hen the mmc subsystem would normally
e5f0016daf4739 Gabriel Somlo 2021-12-15  368  		 * get around to it!
e5f0016daf4739 Gabriel Somlo 2021-12-15  369  		 */
e5f0016daf4739 Gabriel Somlo 2021-12-15  370  		cmd->error =3D litex_mmc_se=
t_bus_width(host);
e5f0016daf4739 Gabriel Somlo 2021-12-15  371  		if (cmd->error) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  372  			dev_err(dev, "Can't set bu=
s width!\n");
e5f0016daf4739 Gabriel Somlo 2021-12-15  373  			mmc_request_done(mmc, mrq);
e5f0016daf4739 Gabriel Somlo 2021-12-15  374  			return;
e5f0016daf4739 Gabriel Somlo 2021-12-15  375  		}
e5f0016daf4739 Gabriel Somlo 2021-12-15  376  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  377  		litex_mmc_do_dma(host, data=
, &len, &direct, &transfer);
e5f0016daf4739 Gabriel Somlo 2021-12-15  378  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  379  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  380  	do {
e5f0016daf4739 Gabriel Somlo 2021-12-15  381  		cmd->error =3D litex_mmc_se=
nd_cmd(host, cmd->opcode, cmd->arg,
e5f0016daf4739 Gabriel Somlo 2021-12-15  382  						response_len, transfer);
e5f0016daf4739 Gabriel Somlo 2021-12-15  383  	} while (cmd->error && retri=
es-- > 0);
e5f0016daf4739 Gabriel Somlo 2021-12-15  384  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  385  	if (cmd->error) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  386  		/* card may be gone; don't =
assume bus width is still set */
e5f0016daf4739 Gabriel Somlo 2021-12-15  387  		host->is_bus_width_set =3D =
false;
e5f0016daf4739 Gabriel Somlo 2021-12-15  388  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  389  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  390  	if (response_len =3D=3D SD_C=
TL_RESP_SHORT) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  391  		/* pull short response fiel=
ds from appropriate host registers */
e5f0016daf4739 Gabriel Somlo 2021-12-15  392  		cmd->resp[0] =3D host->resp=
[3];
e5f0016daf4739 Gabriel Somlo 2021-12-15  393  		cmd->resp[1] =3D host->resp=
[2] & 0xFF;
e5f0016daf4739 Gabriel Somlo 2021-12-15  394  	} else if (response_len =3D=
=3D SD_CTL_RESP_LONG) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  395  		cmd->resp[0] =3D host->resp=
[0];
e5f0016daf4739 Gabriel Somlo 2021-12-15  396  		cmd->resp[1] =3D host->resp=
[1];
e5f0016daf4739 Gabriel Somlo 2021-12-15  397  		cmd->resp[2] =3D host->resp=
[2];
e5f0016daf4739 Gabriel Somlo 2021-12-15  398  		cmd->resp[3] =3D host->resp=
[3];
e5f0016daf4739 Gabriel Somlo 2021-12-15  399  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  400  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  401  	/* Send stop-transmission co=
mmand if required */
e5f0016daf4739 Gabriel Somlo 2021-12-15  402  	if (stop && (cmd->error || !=
sbc)) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  403  		stop->error =3D litex_mmc_s=
end_cmd(host, stop->opcode, stop->arg,
e5f0016daf4739 Gabriel Somlo 2021-12-15  404  						 litex_mmc_response_len=
(stop),
e5f0016daf4739 Gabriel Somlo 2021-12-15  405  						 SD_CTL_DATA_XFER_NONE);
e5f0016daf4739 Gabriel Somlo 2021-12-15  406  		if (stop->error)
e5f0016daf4739 Gabriel Somlo 2021-12-15  407  			host->is_bus_width_set =3D=
 false;
e5f0016daf4739 Gabriel Somlo 2021-12-15  408  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  409  =

e5f0016daf4739 Gabriel Somlo 2021-12-15 @410  	if (data) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  411  		dma_unmap_sg(dev, data->sg,=
 data->sg_len,
e5f0016daf4739 Gabriel Somlo 2021-12-15  412  			     mmc_get_dma_dir(data)=
);
e5f0016daf4739 Gabriel Somlo 2021-12-15  413  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  414  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  415  	if (!cmd->error && transfer =
!=3D SD_CTL_DATA_XFER_NONE) {
e5f0016daf4739 Gabriel Somlo 2021-12-15 @416  		data->bytes_xfered =3D min(=
len, mmc->max_req_size);
e5f0016daf4739 Gabriel Somlo 2021-12-15  417  		if (transfer =3D=3D SD_CTL_=
DATA_XFER_READ && !direct) {
e5f0016daf4739 Gabriel Somlo 2021-12-15  418  			sg_copy_from_buffer(data->=
sg, sg_nents(data->sg),
e5f0016daf4739 Gabriel Somlo 2021-12-15  419  					    host->buffer, data->=
bytes_xfered);
e5f0016daf4739 Gabriel Somlo 2021-12-15  420  		}
e5f0016daf4739 Gabriel Somlo 2021-12-15  421  	}
e5f0016daf4739 Gabriel Somlo 2021-12-15  422  =

e5f0016daf4739 Gabriel Somlo 2021-12-15  423  	mmc_request_done(mmc, mrq);
e5f0016daf4739 Gabriel Somlo 2021-12-15  424  }
e5f0016daf4739 Gabriel Somlo 2021-12-15  425  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8396428674375039946==--

