Content-Type: multipart/mixed; boundary="===============1514992385953930235=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sh/rcar/dma.c:806:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Tue, 20 Jul 2021 11:38:22 +0800
Message-ID: <202107201111.XEh5Wnrd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1514992385953930235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2734d6c1b1a089fb593ef6a23d4b70903526fe0c
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
compiler: csky-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> sound/soc/sh/rcar/dma.c:806:2: warning: Address of local auto-variable a=
ssigned to a function parameter. [autoVariables]
    *dma_mod =3D rsnd_mod_get(dma);
    ^

vim +806 sound/soc/sh/rcar/dma.c

bfe834be9525a8 Kuninori Morimoto 2015-02-20  753  =

81cb71240e202a Kuninori Morimoto 2017-09-20  754  static int rsnd_dma_alloc=
(struct rsnd_dai_stream *io, struct rsnd_mod *mod,
b99305d2012217 Kuninori Morimoto 2016-10-25  755  			  struct rsnd_mod **dm=
a_mod)
3c68565b6cb68b Kuninori Morimoto 2015-02-20  756  {
7dfb49194557cc Kuninori Morimoto 2015-07-15  757  	struct rsnd_mod *mod_fro=
m =3D NULL;
7dfb49194557cc Kuninori Morimoto 2015-07-15  758  	struct rsnd_mod *mod_to =
=3D NULL;
9b99e9a7c50576 Kuninori Morimoto 2015-06-15  759  	struct rsnd_priv *priv =
=3D rsnd_io_to_priv(io);
8537483a17038f Kuninori Morimoto 2015-03-10  760  	struct rsnd_dma_ctrl *dm=
ac =3D rsnd_priv_to_dmac(priv);
ddea1b2e83c379 Kuninori Morimoto 2015-07-15  761  	struct device *dev =3D r=
snd_priv_to_dev(priv);
81cb71240e202a Kuninori Morimoto 2017-09-20  762  	struct rsnd_dma *dma;
497debaa803e25 Kuninori Morimoto 2015-10-26  763  	struct rsnd_mod_ops *ops;
497debaa803e25 Kuninori Morimoto 2015-10-26  764  	enum rsnd_mod_type type;
b99305d2012217 Kuninori Morimoto 2016-10-25  765  	int (*attach)(struct rsn=
d_dai_stream *io, struct rsnd_dma *dma,
81ecbb654e1015 Kuninori Morimoto 2015-10-26  766  		      struct rsnd_mod *=
mod_from, struct rsnd_mod *mod_to);
3c68565b6cb68b Kuninori Morimoto 2015-02-20  767  	int is_play =3D rsnd_io_=
is_play(io);
940e947926cab8 Kuninori Morimoto 2015-10-26  768  	int ret, dma_id;
3c68565b6cb68b Kuninori Morimoto 2015-02-20  769  =

8537483a17038f Kuninori Morimoto 2015-03-10  770  	/*
8537483a17038f Kuninori Morimoto 2015-03-10  771  	 * DMA failed. try to PI=
O mode
8537483a17038f Kuninori Morimoto 2015-03-10  772  	 * see
8537483a17038f Kuninori Morimoto 2015-03-10  773  	 *	rsnd_ssi_fallback()
8537483a17038f Kuninori Morimoto 2015-03-10  774  	 *	rsnd_rdai_continuance=
_probe()
8537483a17038f Kuninori Morimoto 2015-03-10  775  	 */
8537483a17038f Kuninori Morimoto 2015-03-10  776  	if (!dmac)
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  777  		return -EAGAIN;
232c00b6e55558 Kuninori Morimoto 2015-10-26  778  =

940e947926cab8 Kuninori Morimoto 2015-10-26  779  	rsnd_dma_of_path(mod, io=
, is_play, &mod_from, &mod_to);
3c68565b6cb68b Kuninori Morimoto 2015-02-20  780  =

d188e140ad9723 Kuninori Morimoto 2018-04-11  781  	/* for Gen2 or later */
81ecbb654e1015 Kuninori Morimoto 2015-10-26  782  	if (mod_from && mod_to) {
497debaa803e25 Kuninori Morimoto 2015-10-26  783  		ops	=3D &rsnd_dmapp_ops;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  784  		attach	=3D rsnd_dmapp_a=
ttach;
940e947926cab8 Kuninori Morimoto 2015-10-26  785  		dma_id	=3D dmac->dmapp_=
num;
497debaa803e25 Kuninori Morimoto 2015-10-26  786  		type	=3D RSND_MOD_AUDMA=
PP;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  787  	} else {
497debaa803e25 Kuninori Morimoto 2015-10-26  788  		ops	=3D &rsnd_dmaen_ops;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  789  		attach	=3D rsnd_dmaen_a=
ttach;
940e947926cab8 Kuninori Morimoto 2015-10-26  790  		dma_id	=3D dmac->dmaen_=
num;
497debaa803e25 Kuninori Morimoto 2015-10-26  791  		type	=3D RSND_MOD_AUDMA;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  792  	}
288f392e729dd4 Kuninori Morimoto 2015-02-20  793  =

288f392e729dd4 Kuninori Morimoto 2015-02-20  794  	/* for Gen1, overwrite */
81ecbb654e1015 Kuninori Morimoto 2015-10-26  795  	if (rsnd_is_gen1(priv)) {
497debaa803e25 Kuninori Morimoto 2015-10-26  796  		ops	=3D &rsnd_dmaen_ops;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  797  		attach	=3D rsnd_dmaen_a=
ttach;
940e947926cab8 Kuninori Morimoto 2015-10-26  798  		dma_id	=3D dmac->dmaen_=
num;
497debaa803e25 Kuninori Morimoto 2015-10-26  799  		type	=3D RSND_MOD_AUDMA;
81ecbb654e1015 Kuninori Morimoto 2015-10-26  800  	}
3c68565b6cb68b Kuninori Morimoto 2015-02-20  801  =

355cb84fbe1f09 Kuninori Morimoto 2016-01-21  802  	dma =3D devm_kzalloc(dev=
, sizeof(*dma), GFP_KERNEL);
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  803  	if (!dma)
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  804  		return -ENOMEM;
940e947926cab8 Kuninori Morimoto 2015-10-26  805  =

355cb84fbe1f09 Kuninori Morimoto 2016-01-21 @806  	*dma_mod =3D rsnd_mod_ge=
t(dma);
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  807  =

355cb84fbe1f09 Kuninori Morimoto 2016-01-21  808  	ret =3D rsnd_mod_init(pr=
iv, *dma_mod, ops, NULL,
7e7fe06de376e9 Kuninori Morimoto 2018-10-30  809  			    type, dma_id);
940e947926cab8 Kuninori Morimoto 2015-10-26  810  	if (ret < 0)
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  811  		return ret;
940e947926cab8 Kuninori Morimoto 2015-10-26  812  =

c0ea089dbad47a Kuninori Morimoto 2018-10-30  813  	dev_dbg(dev, "%s %s -> %=
s\n",
c0ea089dbad47a Kuninori Morimoto 2018-10-30  814  		rsnd_mod_name(*dma_mod),
9b6ea25066b05c Kuninori Morimoto 2017-11-01  815  		rsnd_mod_name(mod_from =
? mod_from : &mem),
c0ea089dbad47a Kuninori Morimoto 2018-10-30  816  		rsnd_mod_name(mod_to   =
? mod_to   : &mem));
c90269c1fbfcb3 Kuninori Morimoto 2015-12-17  817  =

b99305d2012217 Kuninori Morimoto 2016-10-25  818  	ret =3D attach(io, dma, =
mod_from, mod_to);
232c00b6e55558 Kuninori Morimoto 2015-10-26  819  	if (ret < 0)
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  820  		return ret;
edce5c496c6af3 Kuninori Morimoto 2016-11-14  821  =

edce5c496c6af3 Kuninori Morimoto 2016-11-14  822  	dma->src_addr =3D rsnd_d=
ma_addr(io, mod_from, is_play, 1);
edce5c496c6af3 Kuninori Morimoto 2016-11-14  823  	dma->dst_addr =3D rsnd_d=
ma_addr(io, mod_to,   is_play, 0);
edce5c496c6af3 Kuninori Morimoto 2016-11-14  824  	dma->mod_from =3D mod_fr=
om;
edce5c496c6af3 Kuninori Morimoto 2016-11-14  825  	dma->mod_to   =3D mod_to;
81cb71240e202a Kuninori Morimoto 2017-09-20  826  =

81cb71240e202a Kuninori Morimoto 2017-09-20  827  	return 0;
355cb84fbe1f09 Kuninori Morimoto 2016-01-21  828  }
232c00b6e55558 Kuninori Morimoto 2015-10-26  829  =


:::::: The code at line 806 was first introduced by commit
:::::: 355cb84fbe1f098f80c17dad9027ad2c6aec3fa0 ASoC: rsnd: attach Audio-DM=
AC-periperi correctly

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1514992385953930235==--

