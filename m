Content-Type: multipart/mixed; boundary="===============0474008433717983400=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/sdio.c:349 mt76s_alloc_tx() warn: passing a valid pointer to 'PTR_ERR'
Date: Tue, 10 May 2022 20:31:43 +0800
Message-ID: <202205102011.VT0C7FpM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0474008433717983400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Sean,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9be9ed2612b5aedb52a2c240edb1630b6b743cb6
commit: 48fab5bbef4092d925ab3214773ad12e68807223 mt76: mt7921: introduce mt=
7921s support
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: sh-randconfig-m031-20220509 (https://download.01.org/0day-ci/archiv=
e/20220510/202205102011.VT0C7FpM-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/mediatek/mt76/sdio.c:349 mt76s_alloc_tx() warn: passin=
g a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/sdio.c:357 mt76s_alloc_tx() warn: passin=
g a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +349 drivers/net/wireless/mediatek/mt76/sdio.c

a2a93548db88b7 Lorenzo Bianconi 2020-11-11  340  =

d512b008fafb62 Lorenzo Bianconi 2021-10-13  341  int mt76s_alloc_tx(struct =
mt76_dev *dev)
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  342  {
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  343  	struct mt76_queue *q;
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  344  	int i;
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  345  =

a2a93548db88b7 Lorenzo Bianconi 2020-11-11  346  	for (i =3D 0; i <=3D MT_T=
XQ_PSD; i++) {
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  347  		q =3D mt76s_alloc_tx_que=
ue(dev);
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  348  		if (IS_ERR(q))
a2a93548db88b7 Lorenzo Bianconi 2020-11-11 @349  			return PTR_ERR(q);
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  350  =

a2a93548db88b7 Lorenzo Bianconi 2020-11-11  351  		q->qid =3D i;
91990519298e23 Lorenzo Bianconi 2020-11-11  352  		dev->phy.q_tx[i] =3D q;
d39b52e31aa641 Sean Wang        2020-07-15  353  	}
d39b52e31aa641 Sean Wang        2020-07-15  354  =

a2a93548db88b7 Lorenzo Bianconi 2020-11-11  355  	q =3D mt76s_alloc_tx_queu=
e(dev);
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  356  	if (IS_ERR(q))
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  357  		return PTR_ERR(q);
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  358  =

e637763b606b7a Lorenzo Bianconi 2020-11-11  359  	q->qid =3D MT_MCUQ_WM;
e637763b606b7a Lorenzo Bianconi 2020-11-11  360  	dev->q_mcu[MT_MCUQ_WM] =
=3D q;
a2a93548db88b7 Lorenzo Bianconi 2020-11-11  361  =

d39b52e31aa641 Sean Wang        2020-07-15  362  	return 0;
d39b52e31aa641 Sean Wang        2020-07-15  363  }
d512b008fafb62 Lorenzo Bianconi 2021-10-13  364  EXPORT_SYMBOL_GPL(mt76s_al=
loc_tx);
d39b52e31aa641 Sean Wang        2020-07-15  365  =


:::::: The code at line 349 was first introduced by commit
:::::: a2a93548db88b73f5781f4c3df3c757656d50c67 mt76: sdio: introduce mt76s=
_alloc_tx_queue

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0474008433717983400==--

