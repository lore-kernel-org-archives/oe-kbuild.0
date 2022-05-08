Content-Type: multipart/mixed; boundary="===============6243192024350421358=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sh/rcar/adg.c:396 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'
Date: Sun, 08 May 2022 21:22:48 +0800
Message-ID: <202205082129.QlxhGCvM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6243192024350421358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: cc64c390b215b404524725a94857d6fb58d9a62a ASoC: rsnd: adg: clearly h=
andle clock error / NULL case
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220508/202205082129.QlxhGCvM-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/sh/rcar/adg.c:396 rsnd_adg_create_null_clk() warn: passing zero t=
o 'ERR_CAST'

vim +/ERR_CAST +396 sound/soc/sh/rcar/adg.c

c2d3171847611e8 Kuninori Morimoto 2016-12-07  385  =

cb2f97d89f383da Kuninori Morimoto 2021-06-02  386  static struct clk *rsnd_=
adg_create_null_clk(struct rsnd_priv *priv,
cb2f97d89f383da Kuninori Morimoto 2021-06-02  387  					    const char * co=
nst name,
cb2f97d89f383da Kuninori Morimoto 2021-06-02  388  					    const char *par=
ent)
d6956a7dde6fbf8 Kuninori Morimoto 2021-05-24  389  {
d6956a7dde6fbf8 Kuninori Morimoto 2021-05-24  390  	struct device *dev =3D =
rsnd_priv_to_dev(priv);
cb2f97d89f383da Kuninori Morimoto 2021-06-02  391  	struct clk *clk;
d6956a7dde6fbf8 Kuninori Morimoto 2021-05-24  392  =

cb2f97d89f383da Kuninori Morimoto 2021-06-02  393  	clk =3D clk_register_fi=
xed_rate(dev, name, parent, 0, 0);
cc64c390b215b40 Kuninori Morimoto 2021-08-20  394  	if (IS_ERR_OR_NULL(clk)=
) {
cb2f97d89f383da Kuninori Morimoto 2021-06-02  395  		dev_err(dev, "create n=
ull clk error\n");
cc64c390b215b40 Kuninori Morimoto 2021-08-20 @396  		return ERR_CAST(clk);
cb2f97d89f383da Kuninori Morimoto 2021-06-02  397  	}
d6956a7dde6fbf8 Kuninori Morimoto 2021-05-24  398  =

cb2f97d89f383da Kuninori Morimoto 2021-06-02  399  	return clk;
cb2f97d89f383da Kuninori Morimoto 2021-06-02  400  }
d6956a7dde6fbf8 Kuninori Morimoto 2021-05-24  401  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6243192024350421358==--

