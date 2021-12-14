Content-Type: multipart/mixed; boundary="===============7436447224168243770=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2] mmc: debugfs: add error statistics
Date: Wed, 15 Dec 2021 05:11:30 +0800
Message-ID: <202112150555.zkOS6PKM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7436447224168243770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1639492863-7053-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1639492863-7053-1-git-send-email-quic_c_sbhanu@quicinc.com>
TO: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
TO: adrian.hunter(a)intel.com
TO: riteshh(a)codeaurora.org
TO: asutoshd(a)quicinc.com
TO: ulf.hansson(a)linaro.org
TO: agross(a)kernel.org
TO: bjorn.andersson(a)linaro.org
TO: linux-mmc(a)vger.kernel.org
TO: linux-arm-msm(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: stummala(a)codeaurora.org

Hi Shaik,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.16-rc5 next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Shaik-Sajida-Bhanu/mmc-deb=
ugfs-add-error-statistics/20211214-224314
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-m021-20211214 (https://download.01.org/0day-ci/arch=
ive/20211215/202112150555.zkOS6PKM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/mmc/host/sdhci.c:3251 sdhci_cmd_irq() warn: was && intended here in=
stead of ||?
drivers/mmc/host/sdhci.c:3397 sdhci_data_irq() warn: was && intended here i=
nstead of ||?
drivers/mmc/host/sdhci.c:3927 sdhci_cqe_irq() warn: was && intended here in=
stead of ||?

Old smatch warnings:
drivers/mmc/host/sdhci.c:3940 sdhci_cqe_irq() warn: was && intended here in=
stead of ||?

vim +3251 drivers/mmc/host/sdhci.c

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  321=
2  =

4bf780996669280 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
3  static void sdhci_cmd_irq(struct sdhci_host *host, u32 intmask, u32 *int=
mask_p)
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  321=
4  {
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
5  	/* Handle auto-CMD12 error */
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
6  	if (intmask & SDHCI_INT_AUTO_CMD_ERR && host->data_cmd) {
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
7  		struct mmc_request *mrq =3D host->data_cmd->mrq;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
8  		u16 auto_cmd_status =3D sdhci_readw(host, SDHCI_AUTO_CMD_STATUS);
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  321=
9  		int data_err_bit =3D (auto_cmd_status & SDHCI_AUTO_CMD_TIMEOUT) ?
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
0  				   SDHCI_INT_DATA_TIMEOUT :
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
1  				   SDHCI_INT_DATA_CRC;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
2  =

af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
3  		/* Treat auto-CMD12 error the same as data error */
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
4  		if (!mrq->sbc && (host->flags & SDHCI_AUTO_CMD12)) {
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
5  			*intmask_p |=3D data_err_bit;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
6  			return;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
7  		}
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
8  	}
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  322=
9  =

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  323=
0  	if (!host->cmd) {
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
1  		/*
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
2  		 * SDHCI recovers from errors by resetting the cmd and data
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
3  		 * circuits.  Until that is done, there very well might be more
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
4  		 * interrupts, so ignore them in that case.
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
5  		 */
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
6  		if (host->pending_reset)
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  323=
7  			return;
2e4456f08fa81b9 drivers/mmc/host/sdhci.c Marek Vasut        2015-11-18  323=
8  		pr_err("%s: Got command interrupt 0x%08x even though no command operat=
ion was in progress.\n",
b67ac3f339c76df drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  323=
9  		       mmc_hostname(host->mmc), (unsigned)intmask);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  324=
0  		sdhci_dumpregs(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  324=
1  		return;
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  324=
2  	}
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  324=
3  =

ec014cbacf6229c drivers/mmc/host/sdhci.c Russell King       2016-01-26  324=
4  	if (intmask & (SDHCI_INT_TIMEOUT | SDHCI_INT_CRC |
ec014cbacf6229c drivers/mmc/host/sdhci.c Russell King       2016-01-26  324=
5  		       SDHCI_INT_END_BIT | SDHCI_INT_INDEX)) {
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  324=
6  		if (intmask & SDHCI_INT_TIMEOUT) {
17b0429dde9ab60 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-22  324=
7  			host->cmd->error =3D -ETIMEDOUT;
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  324=
8  			mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_CMD_TIMEOUT);
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  324=
9  		} else {
17b0429dde9ab60 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-22  325=
0  			host->cmd->error =3D -EILSEQ;
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14 @325=
1  			if (host->cmd->opcode !=3D MMC_SEND_TUNING_BLOCK ||
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  325=
2  					host->cmd->opcode !=3D MMC_SEND_TUNING_BLOCK_HS200)
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  325=
3  				mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_CMD_CRC);
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  325=
4  		}
4bf780996669280 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  325=
5  		/* Treat data command CRC error the same as data CRC error */
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  325=
6  		if (host->cmd->data &&
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  325=
7  		    (intmask & (SDHCI_INT_CRC | SDHCI_INT_TIMEOUT)) =3D=3D
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  325=
8  		     SDHCI_INT_CRC) {
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  325=
9  			host->cmd =3D NULL;
4bf780996669280 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  326=
0  			*intmask_p |=3D SDHCI_INT_DATA_CRC;
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  326=
1  			return;
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  326=
2  		}
71fcbda0fcddd08 drivers/mmc/host/sdhci.c Russell King       2016-01-26  326=
3  =

19d2f695f4e8279 drivers/mmc/host/sdhci.c Adrian Hunter      2019-04-05  326=
4  		__sdhci_finish_mrq(host, host->cmd->mrq);
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  326=
5  		return;
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  326=
6  	}
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  326=
7  =

af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  326=
8  	/* Handle auto-CMD23 error */
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  326=
9  	if (intmask & SDHCI_INT_AUTO_CMD_ERR) {
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
0  		struct mmc_request *mrq =3D host->cmd->mrq;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
1  		u16 auto_cmd_status =3D sdhci_readw(host, SDHCI_AUTO_CMD_STATUS);
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
2  		int err =3D (auto_cmd_status & SDHCI_AUTO_CMD_TIMEOUT) ?
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
3  			  -ETIMEDOUT :
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
4  			  -EILSEQ;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
5  =

53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  327=
6  		mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_AUTO_CMD);
38929d4f0d811df drivers/mmc/host/sdhci.c ChanWoo Lee        2021-08-25  327=
7  		if (sdhci_auto_cmd23(host, mrq)) {
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  327=
8  			mrq->sbc->error =3D err;
19d2f695f4e8279 drivers/mmc/host/sdhci.c Adrian Hunter      2019-04-05  327=
9  			__sdhci_finish_mrq(host, mrq);
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  328=
0  			return;
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  328=
1  		}
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  328=
2  	}
af849c86109d792 drivers/mmc/host/sdhci.c Adrian Hunter      2018-11-15  328=
3  =

e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  328=
4  	if (intmask & SDHCI_INT_RESPONSE)
43b58b36b7e6554 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-25  328=
5  		sdhci_finish_command(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  328=
6  }
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  328=
7  =

08621b18a15ee21 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  328=
8  static void sdhci_adma_show_error(struct sdhci_host *host)
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  328=
9  {
1c3d5f6ddcb915c drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  329=
0  	void *desc =3D host->adma_table;
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  329=
1  	dma_addr_t dma =3D host->adma_addr;
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  329=
2  =

6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  329=
3  	sdhci_dumpregs(host);
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  329=
4  =

6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  329=
5  	while (true) {
e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  329=
6  		struct sdhci_adma2_64_desc *dma_desc =3D desc;
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  329=
7  =

e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  329=
8  		if (host->flags & SDHCI_USE_64_BIT_DMA)
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  329=
9  			SDHCI_DUMP("%08llx: DMA 0x%08x%08x, LEN 0x%04x, Attr=3D0x%02x\n",
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  330=
0  			    (unsigned long long)dma,
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  330=
1  			    le32_to_cpu(dma_desc->addr_hi),
e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  330=
2  			    le32_to_cpu(dma_desc->addr_lo),
e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  330=
3  			    le16_to_cpu(dma_desc->len),
e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  330=
4  			    le16_to_cpu(dma_desc->cmd));
e57a5f61eae7e14 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  330=
5  		else
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  330=
6  			SDHCI_DUMP("%08llx: DMA 0x%08x, LEN 0x%04x, Attr=3D0x%02x\n",
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  330=
7  			    (unsigned long long)dma,
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  330=
8  			    le32_to_cpu(dma_desc->addr_lo),
0545230f1764bc6 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  330=
9  			    le16_to_cpu(dma_desc->len),
0545230f1764bc6 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  331=
0  			    le16_to_cpu(dma_desc->cmd));
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
1  =

76fe379acaeb857 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  331=
2  		desc +=3D host->desc_sz;
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  331=
3  		dma +=3D host->desc_sz;
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
4  =

0545230f1764bc6 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  331=
5  		if (dma_desc->cmd & cpu_to_le16(ADMA2_END))
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
6  			break;
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
7  	}
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
8  }
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  331=
9  =

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  332=
0  static void sdhci_data_irq(struct sdhci_host *host, u32 intmask)
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  332=
1  {
069c9f142822d55 drivers/mmc/host/sdhci.c Girish K S         2012-01-06  332=
2  	u32 command;
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  332=
3  =

f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
4  	/*
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
5  	 * CMD19 generates _only_ Buffer Read Ready interrupt if
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
6  	 * use sdhci_send_tuning.
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
7  	 * Need to exclude this case: PIO mode and use mmc_send_tuning,
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
8  	 * If not, sdhci_transfer_pio will never be called, make the
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  332=
9  	 * SDHCI_INT_DATA_AVAIL always there, stuck in irq storm.
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  333=
0  	 */
f4ff24f8a7c144e drivers/mmc/host/sdhci.c Haibo Chen         2021-08-13  333=
1  	if (intmask & SDHCI_INT_DATA_AVAIL && !host->data) {
069c9f142822d55 drivers/mmc/host/sdhci.c Girish K S         2012-01-06  333=
2  		command =3D SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND));
069c9f142822d55 drivers/mmc/host/sdhci.c Girish K S         2012-01-06  333=
3  		if (command =3D=3D MMC_SEND_TUNING_BLOCK ||
069c9f142822d55 drivers/mmc/host/sdhci.c Girish K S         2012-01-06  333=
4  		    command =3D=3D MMC_SEND_TUNING_BLOCK_HS200) {
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  333=
5  			host->tuning_done =3D 1;
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  333=
6  			wake_up(&host->buf_ready_int);
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  333=
7  			return;
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  333=
8  		}
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  333=
9  	}
b513ea250eb7c36 drivers/mmc/host/sdhci.c Arindam Nath       2011-05-05  334=
0  =

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  334=
1  	if (!host->data) {
7c89a3d9082c316 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  334=
2  		struct mmc_command *data_cmd =3D host->data_cmd;
7c89a3d9082c316 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  334=
3  =

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  334=
4  		/*
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  334=
5  		 * The "data complete" interrupt is also used to
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  334=
6  		 * indicate that a busy state has ended. See comment
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  334=
7  		 * above in sdhci_cmd_irq().
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  334=
8  		 */
7c89a3d9082c316 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  334=
9  		if (data_cmd && (data_cmd->flags & MMC_RSP_BUSY)) {
c5abd5e8998e20c drivers/mmc/host/sdhci.c Matthieu CASTET    2014-08-14  335=
0  			if (intmask & SDHCI_INT_DATA_TIMEOUT) {
69b962a65a54769 drivers/mmc/host/sdhci.c Adrian Hunter      2016-11-02  335=
1  				host->data_cmd =3D NULL;
7c89a3d9082c316 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  335=
2  				data_cmd->error =3D -ETIMEDOUT;
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  335=
3  				mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_CMD_TIMEOUT);
19d2f695f4e8279 drivers/mmc/host/sdhci.c Adrian Hunter      2019-04-05  335=
4  				__sdhci_finish_mrq(host, data_cmd->mrq);
c5abd5e8998e20c drivers/mmc/host/sdhci.c Matthieu CASTET    2014-08-14  335=
5  				return;
c5abd5e8998e20c drivers/mmc/host/sdhci.c Matthieu CASTET    2014-08-14  335=
6  			}
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  335=
7  			if (intmask & SDHCI_INT_DATA_END) {
69b962a65a54769 drivers/mmc/host/sdhci.c Adrian Hunter      2016-11-02  335=
8  				host->data_cmd =3D NULL;
e99783a45220a2c drivers/mmc/host/sdhci.c Chanho Min         2014-08-30  335=
9  				/*
e99783a45220a2c drivers/mmc/host/sdhci.c Chanho Min         2014-08-30  336=
0  				 * Some cards handle busy-end interrupt
e99783a45220a2c drivers/mmc/host/sdhci.c Chanho Min         2014-08-30  336=
1  				 * before the command completed, so make
e99783a45220a2c drivers/mmc/host/sdhci.c Chanho Min         2014-08-30  336=
2  				 * sure we do things in the proper order.
e99783a45220a2c drivers/mmc/host/sdhci.c Chanho Min         2014-08-30  336=
3  				 */
ea96802384cd062 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  336=
4  				if (host->cmd =3D=3D data_cmd)
ea96802384cd062 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  336=
5  					return;
ea96802384cd062 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  336=
6  =

19d2f695f4e8279 drivers/mmc/host/sdhci.c Adrian Hunter      2019-04-05  336=
7  				__sdhci_finish_mrq(host, data_cmd->mrq);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  336=
8  				return;
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  336=
9  			}
e809517f6fa5803 drivers/mmc/host/sdhci.c Pierre Ossman      2008-07-25  337=
0  		}
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  337=
1  =

ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
2  		/*
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
3  		 * SDHCI recovers from errors by resetting the cmd and data
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
4  		 * circuits. Until that is done, there very well might be more
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
5  		 * interrupts, so ignore them in that case.
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
6  		 */
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
7  		if (host->pending_reset)
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
8  			return;
ed1563de0bc90e0 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  337=
9  =

2e4456f08fa81b9 drivers/mmc/host/sdhci.c Marek Vasut        2015-11-18  338=
0  		pr_err("%s: Got data interrupt 0x%08x even though no data operation wa=
s in progress.\n",
b67ac3f339c76df drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  338=
1  		       mmc_hostname(host->mmc), (unsigned)intmask);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  338=
2  		sdhci_dumpregs(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  338=
3  =

d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  338=
4  		return;
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  338=
5  	}
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  338=
6  =

53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  338=
7  	if (intmask & SDHCI_INT_DATA_TIMEOUT) {
17b0429dde9ab60 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-22  338=
8  		host->data->error =3D -ETIMEDOUT;
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  338=
9  		mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_DAT_TIMEOUT);
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  339=
0  	}
22113efd0049131 drivers/mmc/host/sdhci.c Aries Lee          2010-12-15  339=
1  	else if (intmask & SDHCI_INT_DATA_END_BIT)
22113efd0049131 drivers/mmc/host/sdhci.c Aries Lee          2010-12-15  339=
2  		host->data->error =3D -EILSEQ;
22113efd0049131 drivers/mmc/host/sdhci.c Aries Lee          2010-12-15  339=
3  	else if ((intmask & SDHCI_INT_DATA_CRC) &&
22113efd0049131 drivers/mmc/host/sdhci.c Aries Lee          2010-12-15  339=
4  		SDHCI_GET_CMD(sdhci_readw(host, SDHCI_COMMAND))
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  339=
5  			!=3D MMC_BUS_TEST_R) {
17b0429dde9ab60 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-22  339=
6  		host->data->error =3D -EILSEQ;
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14 @339=
7  		if (host->cmd->opcode !=3D MMC_SEND_TUNING_BLOCK ||
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  339=
8  				host->cmd->opcode !=3D MMC_SEND_TUNING_BLOCK_HS200)
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  339=
9  			mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_DAT_CRC);
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  340=
0  	}
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  340=
1  	else if (intmask & SDHCI_INT_ADMA_ERROR) {
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  340=
2  		pr_err("%s: ADMA error: 0x%08x\n", mmc_hostname(host->mmc),
d1c536e3177390d drivers/mmc/host/sdhci.c Russell King       2019-09-22  340=
3  		       intmask);
08621b18a15ee21 drivers/mmc/host/sdhci.c Adrian Hunter      2014-11-04  340=
4  		sdhci_adma_show_error(host);
53118c31c49fbda drivers/mmc/host/sdhci.c Shaik Sajida Bhanu 2021-12-14  340=
5  		mmc_debugfs_err_stats_inc(host->mmc, MMC_ERR_ADMA);
2134a922c6e75c7 drivers/mmc/host/sdhci.c Pierre Ossman      2008-06-28  340=
6  		host->data->error =3D -EIO;
a4071fbbb9edbc5 drivers/mmc/host/sdhci.c Haijun Zhang       2012-12-04  340=
7  		if (host->ops->adma_workaround)
a4071fbbb9edbc5 drivers/mmc/host/sdhci.c Haijun Zhang       2012-12-04  340=
8  			host->ops->adma_workaround(host, intmask);
6882a8c071d609f drivers/mmc/host/sdhci.c Ben Dooks          2009-06-14  340=
9  	}
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  341=
0  =

17b0429dde9ab60 drivers/mmc/host/sdhci.c Pierre Ossman      2007-07-22  341=
1  	if (host->data->error)
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  341=
2  		sdhci_finish_data(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  341=
3  	else {
a406f5a3b68ee1d drivers/mmc/sdhci.c      Pierre Ossman      2006-07-02  341=
4  		if (intmask & (SDHCI_INT_DATA_AVAIL | SDHCI_INT_SPACE_AVAIL))
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  341=
5  			sdhci_transfer_pio(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  341=
6  =

6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  341=
7  		/*
6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  341=
8  		 * We currently don't do anything fancy with DMA
6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  341=
9  		 * boundaries, but as we can't disable the feature
6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  342=
0  		 * we need to at least restart the transfer.
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  342=
1  		 *
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  342=
2  		 * According to the spec sdhci_readl(host, SDHCI_DMA_ADDRESS)
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  342=
3  		 * should return a valid address to continue from, but as
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  342=
4  		 * some controllers are faulty, don't trust them.
6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  342=
5  		 */
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  342=
6  		if (intmask & SDHCI_INT_DMA_END) {
917a0c52d6c3b47 drivers/mmc/host/sdhci.c Chunyan Zhang      2018-08-30  342=
7  			dma_addr_t dmastart, dmanow;
bd9b902798ab14d drivers/mmc/host/sdhci.c Linus Walleij      2018-01-29  342=
8  =

bd9b902798ab14d drivers/mmc/host/sdhci.c Linus Walleij      2018-01-29  342=
9  			dmastart =3D sdhci_sdma_address(host);
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
0  			dmanow =3D dmastart + host->data->bytes_xfered;
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
1  			/*
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
2  			 * Force update to the next DMA block boundary.
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
3  			 */
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
4  			dmanow =3D (dmanow &
917a0c52d6c3b47 drivers/mmc/host/sdhci.c Chunyan Zhang      2018-08-30  343=
5  				~((dma_addr_t)SDHCI_DEFAULT_BOUNDARY_SIZE - 1)) +
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
6  				SDHCI_DEFAULT_BOUNDARY_SIZE;
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  343=
7  			host->data->bytes_xfered =3D dmanow - dmastart;
917a0c52d6c3b47 drivers/mmc/host/sdhci.c Chunyan Zhang      2018-08-30  343=
8  			DBG("DMA base %pad, transferred 0x%06x bytes, next %pad\n",
917a0c52d6c3b47 drivers/mmc/host/sdhci.c Chunyan Zhang      2018-08-30  343=
9  			    &dmastart, host->data->bytes_xfered, &dmanow);
917a0c52d6c3b47 drivers/mmc/host/sdhci.c Chunyan Zhang      2018-08-30  344=
0  			sdhci_set_sdma_addr(host, dmanow);
f6a03cbf43e5862 drivers/mmc/host/sdhci.c Mikko Vinni        2011-04-12  344=
1  		}
6ba736a10e4ae63 drivers/mmc/host/sdhci.c Pierre Ossman      2007-05-13  344=
2  =

e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
3  		if (intmask & SDHCI_INT_DATA_END) {
7c89a3d9082c316 drivers/mmc/host/sdhci.c Adrian Hunter      2016-06-29  344=
4  			if (host->cmd =3D=3D host->data_cmd) {
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
5  				/*
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
6  				 * Data managed to finish before the
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
7  				 * command completed. Make sure we do
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
8  				 * things in the proper order.
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  344=
9  				 */
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  345=
0  				host->data_early =3D 1;
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  345=
1  			} else {
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  345=
2  				sdhci_finish_data(host);
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  345=
3  			}
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  345=
4  		}
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  345=
5  	}
e538fbe83e374a3 drivers/mmc/host/sdhci.c Pierre Ossman      2007-08-12  345=
6  }
d129bceb1d44ed3 drivers/mmc/sdhci.c      Pierre Ossman      2006-03-24  345=
7  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7436447224168243770==--

