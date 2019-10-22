Content-Type: multipart/mixed; boundary="===============3625153567921714768=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 02/11] crypto: Add Allwinner sun8i-ce Crypto Engine
Date: Tue, 22 Oct 2019 12:23:12 +0300
Message-ID: <20191022092312.GC10833@kadam>
In-Reply-To: <20191012184852.28329-3-clabbe.montjoie@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3625153567921714768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Corentin,

url:    https://github.com/0day-ci/linux/commits/Corentin-Labbe/crypto-add-=
sun8i-ce-driver-for-Allwinner-crypto-engine/20191014-104401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c:371 sun8i_ce_allocate_cha=
nlist() error: uninitialized symbol 'err'.

# https://github.com/0day-ci/linux/commit/f113059e7b4f94c545994aeafdc809a3e=
4907ae4
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout f113059e7b4f94c545994aeafdc809a3e4907ae4
vim +/err +371 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c

f113059e7b4f94 Corentin Labbe 2019-10-12  334  static int sun8i_ce_allocate=
_chanlist(struct sun8i_ce_dev *ce)
f113059e7b4f94 Corentin Labbe 2019-10-12  335  {
f113059e7b4f94 Corentin Labbe 2019-10-12  336  	int i, err;
f113059e7b4f94 Corentin Labbe 2019-10-12  337  =

f113059e7b4f94 Corentin Labbe 2019-10-12  338  	ce->chanlist =3D devm_kcall=
oc(ce->dev, MAXFLOW,
f113059e7b4f94 Corentin Labbe 2019-10-12  339  				    sizeof(struct sun8i_=
ce_flow), GFP_KERNEL);
f113059e7b4f94 Corentin Labbe 2019-10-12  340  	if (!ce->chanlist)
f113059e7b4f94 Corentin Labbe 2019-10-12  341  		return -ENOMEM;
f113059e7b4f94 Corentin Labbe 2019-10-12  342  =

f113059e7b4f94 Corentin Labbe 2019-10-12  343  	for (i =3D 0; i < MAXFLOW; =
i++) {
f113059e7b4f94 Corentin Labbe 2019-10-12  344  		init_completion(&ce->chanl=
ist[i].complete);
f113059e7b4f94 Corentin Labbe 2019-10-12  345  =

f113059e7b4f94 Corentin Labbe 2019-10-12  346  		ce->chanlist[i].engine =3D=
 crypto_engine_alloc_init(ce->dev, true);
f113059e7b4f94 Corentin Labbe 2019-10-12  347  		if (!ce->chanlist[i].engin=
e) {
f113059e7b4f94 Corentin Labbe 2019-10-12  348  			dev_err(ce->dev, "Cannot =
allocate engine\n");
f113059e7b4f94 Corentin Labbe 2019-10-12  349  			i--;
f113059e7b4f94 Corentin Labbe 2019-10-12  350  			goto error_engine;

err =3D -ENOMEM;

f113059e7b4f94 Corentin Labbe 2019-10-12  351  		}
f113059e7b4f94 Corentin Labbe 2019-10-12  352  		err =3D crypto_engine_star=
t(ce->chanlist[i].engine);
f113059e7b4f94 Corentin Labbe 2019-10-12  353  		if (err) {
f113059e7b4f94 Corentin Labbe 2019-10-12  354  			dev_err(ce->dev, "Cannot =
start engine\n");
f113059e7b4f94 Corentin Labbe 2019-10-12  355  			goto error_engine;
f113059e7b4f94 Corentin Labbe 2019-10-12  356  		}
f113059e7b4f94 Corentin Labbe 2019-10-12  357  		ce->chanlist[i].tl =3D dma=
_alloc_coherent(ce->dev,
f113059e7b4f94 Corentin Labbe 2019-10-12  358  							sizeof(struct ce_task=
),
f113059e7b4f94 Corentin Labbe 2019-10-12  359  							&ce->chanlist[i].t_ph=
y,
f113059e7b4f94 Corentin Labbe 2019-10-12  360  							GFP_KERNEL);
f113059e7b4f94 Corentin Labbe 2019-10-12  361  		if (!ce->chanlist[i].tl) {
f113059e7b4f94 Corentin Labbe 2019-10-12  362  			dev_err(ce->dev, "Cannot =
get DMA memory for task %d\n",
f113059e7b4f94 Corentin Labbe 2019-10-12  363  				i);
f113059e7b4f94 Corentin Labbe 2019-10-12  364  			err =3D -ENOMEM;
f113059e7b4f94 Corentin Labbe 2019-10-12  365  			goto error_engine;
f113059e7b4f94 Corentin Labbe 2019-10-12  366  		}
f113059e7b4f94 Corentin Labbe 2019-10-12  367  	}
f113059e7b4f94 Corentin Labbe 2019-10-12  368  	return 0;
f113059e7b4f94 Corentin Labbe 2019-10-12  369  error_engine:
f113059e7b4f94 Corentin Labbe 2019-10-12  370  	sun8i_ce_free_chanlist(ce, =
i);
f113059e7b4f94 Corentin Labbe 2019-10-12 @371  	return err;
f113059e7b4f94 Corentin Labbe 2019-10-12  372  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3625153567921714768==--

