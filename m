Content-Type: multipart/mixed; boundary="===============8731301684804090670=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [arm-integrator:ixp4xx-test 17/23] drivers/net/ethernet/xscale/ptp_ixp46x.c:283 ixp46x_ptp_find() warn: variable dereferenced before check 'ixp_clock.ptp_clock' (see line 281)
Date: Fri, 11 Oct 2019 13:32:34 +0300
Message-ID: <20191011103234.GQ13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8731301684804090670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integr=
ator.git ixp4xx-test
head:   1b826e686b390fd1eeb347def38185fefcbd5140
commit: 7ac6c27d7ee1cdef95314be43e4c3854d8f80240 [17/23] ixp4xx_eth: enable=
 compile testing

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/xscale/ptp_ixp46x.c:283 ixp46x_ptp_find() warn: variab=
le dereferenced before check 'ixp_clock.ptp_clock' (see line 281)

# https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.g=
it/commit/?id=3D7ac6c27d7ee1cdef95314be43e4c3854d8f80240
git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/g=
it/linusw/linux-integrator.git
git remote update arm-integrator
git checkout 7ac6c27d7ee1cdef95314be43e4c3854d8f80240
vim +283 drivers/net/ethernet/xscale/ptp_ixp46x.c

768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  278  int ixp46x_ptp_find(struct ixp46x_ts_regs *__iomem *regs, int=
 *phc_index)
32bd93e8f924c2 drivers/ptp/ptp_ixp46x.c                 Richard Cochran 201=
1-04-22  279  {
768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  280  	*regs =3D ixp_clock.regs;
768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26 @281  	*phc_index =3D ptp_clock_index(ixp_clock.ptp_clock);
                                                                           =
                                                  ^^^^^^^^^^^^^^^^^^^
Dereferenced inside function

768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  282  =

768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26 @283  	if (!ixp_clock.ptp_clock)
                                                                           =
                         ^^^^^^^^^^^^^^^^^^^^
Too late.

768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  284  		return -EPROBE_DEFER;
768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  285  =

768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  286  	return 0;
32bd93e8f924c2 drivers/ptp/ptp_ixp46x.c                 Richard Cochran 201=
1-04-22  287  }
768672ff6ea477 drivers/net/ethernet/xscale/ptp_ixp46x.c Arnd Bergmann   201=
9-08-26  288  EXPORT_SYMBOL_GPL(ixp46x_ptp_find);

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============8731301684804090670==--

