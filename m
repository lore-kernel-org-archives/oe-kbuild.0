Content-Type: multipart/mixed; boundary="===============4328909852374109059=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: rsnd: add interrupt support for SSI BUSIF buffer
Date: Sat, 09 May 2020 10:23:50 +0800
Message-ID: <202005091003.1jOO9ACo%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4328909852374109059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200508074753.10362-1-giraffesnn123@gmail.com>
References: <20200508074753.10362-1-giraffesnn123@gmail.com>
TO: Yongbo Zhang <giraffesnn123@gmail.com>
TO: broonie(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: alsa-devel(a)alsa-project.org
TO: linux-renesas-soc(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: Yongbo Zhang <giraffesnn123@gmail.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Chen Li <licheng0822@thundersoft.com>
TO: alsa-devel(a)alsa-project.org
TO: linux-renesas-soc(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: Yongbo Zhang <giraffesnn123@gmail.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Chen Li <licheng0822@thundersoft.com>
CC: alsa-devel(a)alsa-project.org
CC: linux-renesas-soc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Yongbo Zhang <giraffesnn123@gmail.com>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Hi Yongbo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on asoc/for-next]
[also build test WARNING on v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Yongbo-Zhang/ASoC-rsnd-add=
-interrupt-support-for-SSI-BUSIF-buffer/20200509-035713
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/sh/rcar/ssi.c:531:1: warning: Unmatched '{'. Configuration: ''=
. [syntaxError]
   {
   ^
>> sound/soc/sh/rcar/ssi.c:531:1: warning: Unmatched '{'. Configuration: 'D=
EBUG'. [syntaxError]
   {
   ^

# https://github.com/0day-ci/linux/commit/391d452251464b78f72ba3a1fd9b6091b=
3d4a942
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 391d452251464b78f72ba3a1fd9b6091b3d4a942
vim +531 sound/soc/sh/rcar/ssi.c

ae5c322303fff5 Kuninori Morimoto 2013-07-21  527  =

ae5c322303fff5 Kuninori Morimoto 2013-07-21  528  static int rsnd_ssi_quit(=
struct rsnd_mod *mod,
2c0fac19de2cd7 Kuninori Morimoto 2015-06-15  529  			 struct rsnd_dai_strea=
m *io,
690602fcd85385 Kuninori Morimoto 2015-01-15  530  			 struct rsnd_priv *pri=
v)
ae5c322303fff5 Kuninori Morimoto 2013-07-21 @531  {
ae5c322303fff5 Kuninori Morimoto 2013-07-21  532  	struct rsnd_ssi *ssi =3D=
 rsnd_mod_to_ssi(mod);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  533  	struct device *dev =3D r=
snd_priv_to_dev(priv);
391d452251464b Yongbo Zhang      2020-05-08  534  	int is_tdm, is_tdm_split;
391d452251464b Yongbo Zhang      2020-05-08  535  	int id =3D rsnd_mod_id(m=
od);
391d452251464b Yongbo Zhang      2020-05-08  536  	int i;
391d452251464b Yongbo Zhang      2020-05-08  537  	u32 sys_int_enable =3D 0;
391d452251464b Yongbo Zhang      2020-05-08  538  =

391d452251464b Yongbo Zhang      2020-05-08  539  	is_tdm		=3D rsnd_runtime=
_is_tdm(io);
391d452251464b Yongbo Zhang      2020-05-08  540  	is_tdm_split	=3D rsnd_ru=
ntime_is_tdm_split(io);
ae5c322303fff5 Kuninori Morimoto 2013-07-21  541  =

fd9adcfdc1434f Kuninori Morimoto 2016-02-18  542  	if (!rsnd_ssi_is_run_mod=
s(mod, io))
fd9adcfdc1434f Kuninori Morimoto 2016-02-18  543  		return 0;
fd9adcfdc1434f Kuninori Morimoto 2016-02-18  544  =

e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  545  	if (!ssi->usrcnt) {
c0ea089dbad47a Kuninori Morimoto 2018-10-30  546  		dev_err(dev, "%s usrcnt=
 error\n", rsnd_mod_name(mod));
e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  547  		return -EIO;
e5d9cfc6f5fe56 Andrzej Hajda     2015-12-24  548  	}
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  549  =

26d34b11af6a34 Kuninori Morimoto 2016-02-18  550  	rsnd_ssi_master_clk_stop=
(mod, io);
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  551  =

e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  552  	rsnd_mod_power_off(mod);
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  553  =

e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  554  	ssi->usrcnt--;
e7d850dd10f4e6 Kuninori Morimoto 2015-10-26  555  =

203cdf51f28820 Kuninori Morimoto 2018-06-12  556  	if (!ssi->usrcnt) {
203cdf51f28820 Kuninori Morimoto 2018-06-12  557  		ssi->cr_own	=3D 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  558  		ssi->cr_mode	=3D 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  559  		ssi->wsr	=3D 0;
203cdf51f28820 Kuninori Morimoto 2018-06-12  560  	}
203cdf51f28820 Kuninori Morimoto 2018-06-12  561  =

391d452251464b Yongbo Zhang      2020-05-08  562  	/* disable busif buffer =
over/under run interrupt. */
391d452251464b Yongbo Zhang      2020-05-08  563  	if (is_tdm || is_tdm_spl=
it) {
391d452251464b Yongbo Zhang      2020-05-08  564  		switch (id) {
391d452251464b Yongbo Zhang      2020-05-08  565  		case 0:
391d452251464b Yongbo Zhang      2020-05-08  566  		case 1:
391d452251464b Yongbo Zhang      2020-05-08  567  		case 2:
391d452251464b Yongbo Zhang      2020-05-08  568  		case 3:
391d452251464b Yongbo Zhang      2020-05-08  569  		case 4:
391d452251464b Yongbo Zhang      2020-05-08  570  			for (i =3D 0; i < 4; i=
++) {
391d452251464b Yongbo Zhang      2020-05-08  571  				sys_int_enable =3D rs=
nd_mod_read(mod,
391d452251464b Yongbo Zhang      2020-05-08  572  						SSI_SYS_INT_ENABLE(=
i * 2));
391d452251464b Yongbo Zhang      2020-05-08  573  				sys_int_enable &=3D ~=
(0xf << (id * 4));
391d452251464b Yongbo Zhang      2020-05-08  574  				rsnd_mod_write(mod,
391d452251464b Yongbo Zhang      2020-05-08  575  					       SSI_SYS_INT_E=
NABLE(i * 2),
391d452251464b Yongbo Zhang      2020-05-08  576  					       sys_int_enabl=
e);
391d452251464b Yongbo Zhang      2020-05-08  577  			}
391d452251464b Yongbo Zhang      2020-05-08  578  =

391d452251464b Yongbo Zhang      2020-05-08  579  			break;
391d452251464b Yongbo Zhang      2020-05-08  580  		case 9:
391d452251464b Yongbo Zhang      2020-05-08  581  			for (i =3D 0; i < 4; i=
++) {
391d452251464b Yongbo Zhang      2020-05-08  582  				sys_int_enable =3D rs=
nd_mod_read(mod,
391d452251464b Yongbo Zhang      2020-05-08  583  					SSI_SYS_INT_ENABLE((=
i * 2) + 1));
391d452251464b Yongbo Zhang      2020-05-08  584  				sys_int_enable &=3D ~=
(0xf << 4);
391d452251464b Yongbo Zhang      2020-05-08  585  				rsnd_mod_write(mod,
391d452251464b Yongbo Zhang      2020-05-08  586  					       SSI_SYS_INT_E=
NABLE((i * 2) + 1),
391d452251464b Yongbo Zhang      2020-05-08  587  					       sys_int_enabl=
e);
391d452251464b Yongbo Zhang      2020-05-08  588  			}
391d452251464b Yongbo Zhang      2020-05-08  589  =

391d452251464b Yongbo Zhang      2020-05-08  590  			break;
391d452251464b Yongbo Zhang      2020-05-08  591  		}
391d452251464b Yongbo Zhang      2020-05-08  592  =

ae5c322303fff5 Kuninori Morimoto 2013-07-21  593  	return 0;
ae5c322303fff5 Kuninori Morimoto 2013-07-21  594  }
ae5c322303fff5 Kuninori Morimoto 2013-07-21  595  =


:::::: The code@line 531 was first introduced by commit
:::::: ae5c322303fff50b93d60e34c6563f1264a5941b ASoC: add Renesas R-Car SSI=
 feature

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4328909852374109059==--

