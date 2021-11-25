Content-Type: multipart/mixed; boundary="===============2224175182515145045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/cqhci-crypto.c:176 cqhci_crypto_init() warn: missing error code 'err'
Date: Fri, 26 Nov 2021 05:53:08 +0800
Message-ID: <202111260548.dRrf36Vy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2224175182515145045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Satya Tangirala <satyat@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b501b85957deb17f1fe0a861fee820255519d526
commit: 1e80709bdbfc1e1f3cac0ba8ed9a58f5789bcf51 mmc: cqhci: add support fo=
r inline encryption
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m031-20211123 (https://download.01.org/0day-ci/=
archive/20211126/202111260548.dRrf36Vy-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mmc/host/cqhci-crypto.c:176 cqhci_crypto_init() warn: missing error=
 code 'err'

vim +/err +176 drivers/mmc/host/cqhci-crypto.c

1e80709bdbfc1e Eric Biggers 2021-01-25  149  =

1e80709bdbfc1e Eric Biggers 2021-01-25  150  /**
1e80709bdbfc1e Eric Biggers 2021-01-25  151   * cqhci_crypto_init - initial=
ize CQHCI crypto support
1e80709bdbfc1e Eric Biggers 2021-01-25  152   * @cq_host: a cqhci host
1e80709bdbfc1e Eric Biggers 2021-01-25  153   *
1e80709bdbfc1e Eric Biggers 2021-01-25  154   * If the driver previously se=
t MMC_CAP2_CRYPTO and the CQE declares
1e80709bdbfc1e Eric Biggers 2021-01-25  155   * CQHCI_CAP_CS, initialize th=
e crypto support.  This involves reading the
1e80709bdbfc1e Eric Biggers 2021-01-25  156   * crypto capability registers=
, initializing the keyslot manager, clearing all
1e80709bdbfc1e Eric Biggers 2021-01-25  157   * keyslots, and enabling 128-=
bit task descriptors.
1e80709bdbfc1e Eric Biggers 2021-01-25  158   *
1e80709bdbfc1e Eric Biggers 2021-01-25  159   * Return: 0 if crypto was ini=
tialized or isn't supported; whether
1e80709bdbfc1e Eric Biggers 2021-01-25  160   *	   MMC_CAP2_CRYPTO remains =
set indicates which one of those cases it is.
1e80709bdbfc1e Eric Biggers 2021-01-25  161   *	   Also can return a negati=
ve errno value on unexpected error.
1e80709bdbfc1e Eric Biggers 2021-01-25  162   */
1e80709bdbfc1e Eric Biggers 2021-01-25  163  int cqhci_crypto_init(struct c=
qhci_host *cq_host)
1e80709bdbfc1e Eric Biggers 2021-01-25  164  {
1e80709bdbfc1e Eric Biggers 2021-01-25  165  	struct mmc_host *mmc =3D cq_h=
ost->mmc;
1e80709bdbfc1e Eric Biggers 2021-01-25  166  	struct device *dev =3D mmc_de=
v(mmc);
1e80709bdbfc1e Eric Biggers 2021-01-25  167  	struct blk_keyslot_manager *k=
sm =3D &mmc->ksm;
1e80709bdbfc1e Eric Biggers 2021-01-25  168  	unsigned int num_keyslots;
1e80709bdbfc1e Eric Biggers 2021-01-25  169  	unsigned int cap_idx;
1e80709bdbfc1e Eric Biggers 2021-01-25  170  	enum blk_crypto_mode_num blk_=
mode_num;
1e80709bdbfc1e Eric Biggers 2021-01-25  171  	unsigned int slot;
1e80709bdbfc1e Eric Biggers 2021-01-25  172  	int err =3D 0;
1e80709bdbfc1e Eric Biggers 2021-01-25  173  =

1e80709bdbfc1e Eric Biggers 2021-01-25  174  	if (!(mmc->caps2 & MMC_CAP2_C=
RYPTO) ||
1e80709bdbfc1e Eric Biggers 2021-01-25  175  	    !(cqhci_readl(cq_host, CQ=
HCI_CAP) & CQHCI_CAP_CS))
1e80709bdbfc1e Eric Biggers 2021-01-25 @176  		goto out;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2224175182515145045==--

