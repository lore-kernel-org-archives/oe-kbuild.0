Content-Type: multipart/mixed; boundary="===============4406150928926704404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/sh/rcar/ssiu.c:73 rsnd_ssiu_busif_err_irq_ctrl() error: uninitialized symbol 'offset'.
Date: Thu, 21 Apr 2022 16:40:55 +0800
Message-ID: <202204211602.hatl19fU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4406150928926704404==
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
commit: 0ab000e5e57e6dcb34605fbdee92a1b0947606e0 ASoC: rsnd: tidyup rsnd_ss=
iu_busif_err_irq_ctrl()
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: h8300-randconfig-m031-20220418 (https://download.01.org/0day-ci/arc=
hive/20220421/202204211602.hatl19fU-lkp(a)intel.com/config)
compiler: h8300-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/sh/rcar/ssiu.c:73 rsnd_ssiu_busif_err_irq_ctrl() error: uninitial=
ized symbol 'offset'.
sound/soc/sh/rcar/ssiu.c:74 rsnd_ssiu_busif_err_irq_ctrl() error: uninitial=
ized symbol 'shift'.

Old smatch warnings:
sound/soc/sh/rcar/ssiu.c:108 rsnd_ssiu_busif_err_status_clear() error: unin=
itialized symbol 'offset'.
sound/soc/sh/rcar/ssiu.c:110 rsnd_ssiu_busif_err_status_clear() error: unin=
itialized symbol 'shift'.

vim +/offset +73 sound/soc/sh/rcar/ssiu.c

4e7788fb8018af Kuninori Morimoto 2018-11-06  47  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  48  /* enable busif buffer ove=
r/under run interrupt. */
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  49  #define rsnd_ssiu_busif_er=
r_irq_enable(mod)  rsnd_ssiu_busif_err_irq_ctrl(mod, 1)
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  50  #define rsnd_ssiu_busif_er=
r_irq_disable(mod) rsnd_ssiu_busif_err_irq_ctrl(mod, 0)
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  51  static void rsnd_ssiu_busi=
f_err_irq_ctrl(struct rsnd_mod *mod, int enable)
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  52  {
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  53  	int id =3D rsnd_mod_id(mo=
d);
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  54  	int shift, offset;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  55  	int i;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  56  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  57  	switch (id) {
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  58  	case 0:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  59  	case 1:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  60  	case 2:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  61  	case 3:
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  62  	case 4:
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  63  		shift  =3D id;
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  64  		offset =3D 0;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  65  		break;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  66  	case 9:
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  67  		shift  =3D 1;
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  68  		offset =3D 1;
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  69  		break;
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  70  	}
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  71  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  72  	for (i =3D 0; i < 4; i++)=
 {
0ab000e5e57e6d Kuninori Morimoto 2021-05-27 @73  		enum rsnd_reg reg =3D SS=
I_SYS_INT_ENABLE((i * 2) + offset);
0ab000e5e57e6d Kuninori Morimoto 2021-05-27 @74  		u32 val =3D 0xf << (shif=
t * 4);
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  75  		u32 sys_int_enable =3D r=
snd_mod_read(mod, reg);
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  76  =

83b220cf8eb2aa Kuninori Morimoto 2021-05-27  77  		if (enable)
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  78  			sys_int_enable |=3D val;
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  79  		else
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  80  			sys_int_enable &=3D ~va=
l;
0ab000e5e57e6d Kuninori Morimoto 2021-05-27  81  		rsnd_mod_write(mod, reg,=
 sys_int_enable);
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  82  	}
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  83  }
83b220cf8eb2aa Kuninori Morimoto 2021-05-27  84  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4406150928926704404==--

