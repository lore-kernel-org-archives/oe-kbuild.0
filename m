Content-Type: multipart/mixed; boundary="===============0039149269238288515=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sh/rcar/adg.c:396 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'
Date: Thu, 21 Apr 2022 21:12:01 +0800
Message-ID: <202204212118.Gg6rhRDQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0039149269238288515==
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
head:   b253435746d9a4a701b5f09211b9c14d3370d0da
commit: cc64c390b215b404524725a94857d6fb58d9a62a ASoC: rsnd: adg: clearly h=
andle clock error / NULL case
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: h8300-randconfig-m031-20220418 (https://download.01.org/0day-ci/arc=
hive/20220421/202204212118.Gg6rhRDQ-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/sh/rcar/adg.c:396 rsnd_adg_create_null_clk() warn: passing zero t=
o 'ERR_CAST'

vim +/ERR_CAST +396 sound/soc/sh/rcar/adg.c

c2d3171847611e Kuninori Morimoto 2016-12-07  385  =

cb2f97d89f383d Kuninori Morimoto 2021-06-02  386  static struct clk *rsnd_a=
dg_create_null_clk(struct rsnd_priv *priv,
cb2f97d89f383d Kuninori Morimoto 2021-06-02  387  					    const char * con=
st name,
cb2f97d89f383d Kuninori Morimoto 2021-06-02  388  					    const char *pare=
nt)
d6956a7dde6fbf Kuninori Morimoto 2021-05-24  389  {
d6956a7dde6fbf Kuninori Morimoto 2021-05-24  390  	struct device *dev =3D r=
snd_priv_to_dev(priv);
cb2f97d89f383d Kuninori Morimoto 2021-06-02  391  	struct clk *clk;
d6956a7dde6fbf Kuninori Morimoto 2021-05-24  392  =

cb2f97d89f383d Kuninori Morimoto 2021-06-02  393  	clk =3D clk_register_fix=
ed_rate(dev, name, parent, 0, 0);
cc64c390b215b4 Kuninori Morimoto 2021-08-20  394  	if (IS_ERR_OR_NULL(clk))=
 {
cb2f97d89f383d Kuninori Morimoto 2021-06-02  395  		dev_err(dev, "create nu=
ll clk error\n");
cc64c390b215b4 Kuninori Morimoto 2021-08-20 @396  		return ERR_CAST(clk);
cb2f97d89f383d Kuninori Morimoto 2021-06-02  397  	}
d6956a7dde6fbf Kuninori Morimoto 2021-05-24  398  =

cb2f97d89f383d Kuninori Morimoto 2021-06-02  399  	return clk;
cb2f97d89f383d Kuninori Morimoto 2021-06-02  400  }
d6956a7dde6fbf Kuninori Morimoto 2021-05-24  401  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0039149269238288515==--

