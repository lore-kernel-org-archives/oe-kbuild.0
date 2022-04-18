Content-Type: multipart/mixed; boundary="===============4665811926200343130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sh/rcar/ssiu.c:112 rsnd_ssiu_busif_err_status_clear() error: uninitialized symbol 'offset'.
Date: Mon, 18 Apr 2022 22:07:52 +0800
Message-ID: <202204182245.aZyKqEzi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4665811926200343130==
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
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: cfb7b8bf1e2d660583dd91d870cec2f6728cbdbc ASoC: rsnd: tidyup rsnd_ss=
iu_busif_err_status_clear()
date:   11 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 months ago
config: h8300-randconfig-m031-20220418 (https://download.01.org/0day-ci/arc=
hive/20220418/202204182245.aZyKqEzi-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/sh/rcar/ssiu.c:112 rsnd_ssiu_busif_err_status_clear() error: unin=
itialized symbol 'offset'.
sound/soc/sh/rcar/ssiu.c:114 rsnd_ssiu_busif_err_status_clear() error: unin=
itialized symbol 'shift'.

vim +/offset +112 sound/soc/sh/rcar/ssiu.c

83b220cf8eb2aa Kuninori Morimoto 2021-05-27   88  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27   89  bool rsnd_ssiu_busif_err_=
status_clear(struct rsnd_mod *mod)
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   90  {
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   91  	bool error =3D false;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   92  	int id =3D rsnd_mod_id(m=
od);
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27   93  	int shift, offset;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   94  	int i;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   95  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27   96  	switch (id) {
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   97  	case 0:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   98  	case 1:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27   99  	case 2:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  100  	case 3:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  101  	case 4:
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  102  		shift  =3D id;
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  103  		offset =3D 0;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  104  		break;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  105  	case 9:
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  106  		shift  =3D 1;
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  107  		offset =3D 1;
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  108  		break;
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  109  	}
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  110  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  111  	for (i =3D 0; i < 4; i++=
) {
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27 @112  		u32 reg =3D SSI_SYS_STA=
TUS(i * 2) + offset;
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  113  		u32 status =3D rsnd_mod=
_read(mod, reg);
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27 @114  		u32 val =3D 0xf << (shi=
ft * 4);
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  115  =

cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  116  		status &=3D val;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  117  		if (status) {
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  118  			struct rsnd_priv *priv=
 =3D rsnd_mod_to_priv(mod);
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  119  			struct device *dev =3D=
 rsnd_priv_to_dev(priv);
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  120  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  121  			rsnd_print_irq_status(=
dev, "%s err status : 0x%08x\n",
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  122  					      rsnd_mod_name(=
mod), status);
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  123  			error =3D true;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  124  		}
cfb7b8bf1e2d66 Kuninori Morimoto 2021-05-27  125  		rsnd_mod_write(mod, reg=
, val);
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  126  	}
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  127  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  128  	return error;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  129  }
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  130  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4665811926200343130==--

