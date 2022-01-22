Content-Type: multipart/mixed; boundary="===============0407830607729994227=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/lpass-rx-macro.c:1476 rx_macro_int_dem_inp_mux_put() error: uninitialized symbol 'look_ahead_dly_reg'.
Date: Sun, 23 Jan 2022 06:43:52 +0800
Message-ID: <202201230601.ctiviZ4q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0407830607729994227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 4f692926f562ff48abfcca6b16f36ff8d57473b6 ASoC: codecs: lpass-rx-mac=
ro: add dapm widgets and route
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220123/202201230601.ctiviZ4q-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/codecs/lpass-rx-macro.c:1476 rx_macro_int_dem_inp_mux_put() error=
: uninitialized symbol 'look_ahead_dly_reg'.
sound/soc/codecs/lpass-rx-macro.c:2187 rx_macro_hd2_control() error: uninit=
ialized symbol 'hd2_enable_reg'.
sound/soc/codecs/lpass-rx-macro.c:2188 rx_macro_hd2_control() error: uninit=
ialized symbol 'hd2_scale_reg'.

Old smatch warnings:
sound/soc/codecs/lpass-rx-macro.c:1480 rx_macro_int_dem_inp_mux_put() error=
: uninitialized symbol 'look_ahead_dly_reg'.
sound/soc/codecs/lpass-rx-macro.c:2197 rx_macro_hd2_control() error: uninit=
ialized symbol 'hd2_scale_reg'.
sound/soc/codecs/lpass-rx-macro.c:2655 rx_macro_enable_echo() error: uninit=
ialized symbol 'ec_tx'.

vim +/look_ahead_dly_reg +1476 sound/soc/codecs/lpass-rx-macro.c

af3d54b99764f0 Srinivas Kandagatla 2021-02-11  1457  =

4f692926f562ff Srinivas Kandagatla 2021-02-11  1458  static int rx_macro_in=
t_dem_inp_mux_put(struct snd_kcontrol *kcontrol,
4f692926f562ff Srinivas Kandagatla 2021-02-11  1459  					struct snd_ctl_el=
em_value *ucontrol)
4f692926f562ff Srinivas Kandagatla 2021-02-11  1460  {
4f692926f562ff Srinivas Kandagatla 2021-02-11  1461  	struct snd_soc_dapm_w=
idget *widget =3D snd_soc_dapm_kcontrol_widget(kcontrol);
4f692926f562ff Srinivas Kandagatla 2021-02-11  1462  	struct snd_soc_compon=
ent *component =3D snd_soc_dapm_to_component(widget->dapm);
4f692926f562ff Srinivas Kandagatla 2021-02-11  1463  	struct soc_enum *e =
=3D (struct soc_enum *)kcontrol->private_value;
4f692926f562ff Srinivas Kandagatla 2021-02-11  1464  	unsigned short look_a=
head_dly_reg;
4f692926f562ff Srinivas Kandagatla 2021-02-11  1465  	unsigned int val;
4f692926f562ff Srinivas Kandagatla 2021-02-11  1466  =

4f692926f562ff Srinivas Kandagatla 2021-02-11  1467  	val =3D ucontrol->val=
ue.enumerated.item[0];
4f692926f562ff Srinivas Kandagatla 2021-02-11  1468  =

4f692926f562ff Srinivas Kandagatla 2021-02-11  1469  	if (e->reg =3D=3D CDC=
_RX_RX0_RX_PATH_CFG1)
4f692926f562ff Srinivas Kandagatla 2021-02-11  1470  		look_ahead_dly_reg =
=3D CDC_RX_RX0_RX_PATH_CFG0;
4f692926f562ff Srinivas Kandagatla 2021-02-11  1471  	else if (e->reg =3D=
=3D CDC_RX_RX1_RX_PATH_CFG1)
4f692926f562ff Srinivas Kandagatla 2021-02-11  1472  		look_ahead_dly_reg =
=3D CDC_RX_RX1_RX_PATH_CFG0;
4f692926f562ff Srinivas Kandagatla 2021-02-11  1473  =

4f692926f562ff Srinivas Kandagatla 2021-02-11  1474  	/* Set Look Ahead Del=
ay */
4f692926f562ff Srinivas Kandagatla 2021-02-11  1475  	if (val)
4f692926f562ff Srinivas Kandagatla 2021-02-11 @1476  		snd_soc_component_up=
date_bits(component, look_ahead_dly_reg,
4f692926f562ff Srinivas Kandagatla 2021-02-11  1477  					      CDC_RX_DLY_=
ZN_EN_MASK,
4f692926f562ff Srinivas Kandagatla 2021-02-11  1478  					      CDC_RX_DLY_=
ZN_ENABLE);
4f692926f562ff Srinivas Kandagatla 2021-02-11  1479  	else
4f692926f562ff Srinivas Kandagatla 2021-02-11  1480  		snd_soc_component_up=
date_bits(component, look_ahead_dly_reg,
4f692926f562ff Srinivas Kandagatla 2021-02-11  1481  					      CDC_RX_DLY_=
ZN_EN_MASK, 0);
4f692926f562ff Srinivas Kandagatla 2021-02-11  1482  	/* Set DEM INP Select=
 */
4f692926f562ff Srinivas Kandagatla 2021-02-11  1483  	return snd_soc_dapm_p=
ut_enum_double(kcontrol, ucontrol);
4f692926f562ff Srinivas Kandagatla 2021-02-11  1484  }
4f692926f562ff Srinivas Kandagatla 2021-02-11  1485  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0407830607729994227==--

