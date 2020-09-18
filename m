Content-Type: multipart/mixed; boundary="===============8163941477701550011=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [morimoto-linux:fw-cleanup-2020-09-18-v1 37/78] sound/soc/soc-dapm.c:1423:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Fri, 18 Sep 2020 19:06:12 +0800
Message-ID: <202009181904.dZowTTMf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8163941477701550011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux fw-cleanup-2020-09-18-v1
head:   4f9e6f32d18a2f52dbb9fe4a1e29823f8d0612df
commit: bb3112f1e929c6fedf37fb16911b273a92ca2364 [37/78] ASoC: soc-dapm: in=
dicate error message at all functions
:::::: branch date: 4 hours ago
:::::: commit date: 4 days ago
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/soc-dapm.c:1423:6: warning: Variable 'ret' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    ret =3D pinctrl_select_state(p, s);
        ^
   sound/soc/soc-dapm.c:1408:0: note: Variable 'ret' is reassigned a value =
before the old one has been used.
    int ret =3D -EIO;
   ^
   sound/soc/soc-dapm.c:1423:6: note: Variable 'ret' is reassigned a value =
before the old one has been used.
    ret =3D pinctrl_select_state(p, s);
        ^
   sound/soc/soc-dapm.c:1443:7: warning: Variable 'ret' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     ret =3D clk_prepare_enable(w->clk);
         ^
   sound/soc/soc-dapm.c:1435:0: note: Variable 'ret' is reassigned a value =
before the old one has been used.
    int ret =3D -EIO;
   ^
   sound/soc/soc-dapm.c:1443:7: note: Variable 'ret' is reassigned a value =
before the old one has been used.
     ret =3D clk_prepare_enable(w->clk);
         ^

# https://github.com/morimoto/linux/commit/bb3112f1e929c6fedf37fb16911b273a=
92ca2364
git remote add morimoto-linux https://github.com/morimoto/linux
git fetch --no-tags morimoto-linux fw-cleanup-2020-09-18-v1
git checkout bb3112f1e929c6fedf37fb16911b273a92ca2364
vim +/ret +1423 sound/soc/soc-dapm.c

62ea874abc11f02 Mark Brown          2012-01-21  1398  =

5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1399  /*
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1400   * Handler for pinctr=
l widget.
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1401   */
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1402  int dapm_pinctrl_even=
t(struct snd_soc_dapm_widget *w,
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1403  		       struct snd_k=
control *kcontrol, int event)
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1404  {
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1405  	struct snd_soc_dapm_=
pinctrl_priv *priv =3D w->priv;
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1406  	struct pinctrl *p =
=3D w->pinctrl;
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1407  	struct pinctrl_state=
 *s;
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1408  	int ret =3D -EIO;
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1409  =

5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1410  	if (!p || !priv)
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1411  		goto out;
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1412  =

5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1413  	if (SND_SOC_DAPM_EVE=
NT_ON(event))
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1414  		s =3D pinctrl_looku=
p_state(p, priv->active_state);
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1415  	else
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1416  		s =3D pinctrl_looku=
p_state(p, priv->sleep_state);
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1417  =

bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1418  	if (IS_ERR(s)) {
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1419  		ret =3D PTR_ERR(s);
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1420  		goto out;
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1421  	}
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1422  =

bb3112f1e929c6f Kuninori Morimoto   2019-09-27 @1423  	ret =3D pinctrl_sele=
ct_state(p, s);
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1424  out:
bb3112f1e929c6f Kuninori Morimoto   2019-09-27  1425  	return soc_dapm_ret(=
w->dapm->dev, ret);
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1426  }
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1427  EXPORT_SYMBOL_GPL(dap=
m_pinctrl_event);
5b2d15bbd1eeb3d Srinivas Kandagatla 2018-03-10  1428  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8163941477701550011==--

