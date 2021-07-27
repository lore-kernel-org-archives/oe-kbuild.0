Content-Type: multipart/mixed; boundary="===============2293758403371802030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [plbossart-sound:merge/sound-upstream-20210726 3819/4059] sound/soc/soc-topology.c:1480:2: warning: Value stored to 'control_hdr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 27 Jul 2021 15:18:42 +0800
Message-ID: <202107271532.hIatJMJF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2293758403371802030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Kai Vehmanen <kai.vehmanen@intel.com>

tree:   https://github.com/plbossart/sound merge/sound-upstream-20210726
head:   2ae2cb25898106cd8d67d797300b219a7ddcf2f9
commit: 7c60d06634530437de78a92ef8c6cd4782d72440 [3819/4059] ASoC: soc-topo=
logy: Move template info print soc_tplg_dapm_widget_create()
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-c001-20210726 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project c63dbd=
850182797bc4b76124d08e1c320ab2365d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # https://github.com/plbossart/sound/commit/7c60d06634530437de78a92=
ef8c6cd4782d72440
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound merge/sound-upstream-20210726
        git checkout 7c60d06634530437de78a92ef8c6cd4782d72440
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/iio/frequency/adf4350.c:33:8: warning: Excessive padding in 'str=
uct adf4350_state' (116 padding bytes, where 52 is optimal). =

   Optimal fields order: =

   val, =

   r0_fract, =

   spi, =

   reg, =

   lock_detect_gpiod, =

   pdata, =

   clk, =

   clkin, =

   chspc, =

   fpfd, =

   min_out_freq, =

   freq_req, =

   regs, =

   regs_hw, =

   lock, =

   r0_int, =

   r1_mod, =

   r4_rf_div_sel, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct adf4350_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   drivers/iio/frequency/adf4350.c:33:8: note: Excessive padding in 'struct=
 adf4350_state' (116 padding bytes, where 52 is optimal). Optimal fields or=
der: val, r0_fract, spi, reg, lock_detect_gpiod, pdata, clk, clkin, chspc, =
fpfd, min_out_freq, freq_req, regs, regs_hw, lock, r0_int, r1_mod, r4_rf_di=
v_sel, consider reordering the fields or adding explicit padding members
   struct adf4350_state {
   ~~~~~~~^~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> sound/soc/soc-topology.c:1480:2: warning: Value stored to 'control_hdr' =
is never read [clang-analyzer-deadcode.DeadStores]
           control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-topology.c:1480:2: note: Value stored to 'control_hdr' is =
never read
           control_hdr =3D (struct snd_soc_tplg_ctl_hdr *)tplg->pos;
           ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   sound/soc/sof/pcm.c:505:2: warning: Value stored to 'dai' is never read =
[clang-analyzer-deadcode.DeadStores]
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/pcm.c:505:2: note: Value stored to 'dai' is never read
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/control_hdr +1480 sound/soc/soc-topology.c

8a9782346dccd8 Liam Girdwood        2015-05-29  1419  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1420  static int soc_tplg_d=
apm_widget_create(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood        2015-05-29  1421  	struct snd_soc_tplg_=
dapm_widget *w)
8a9782346dccd8 Liam Girdwood        2015-05-29  1422  {
8a9782346dccd8 Liam Girdwood        2015-05-29  1423  	struct snd_soc_dapm_=
context *dapm =3D &tplg->comp->dapm;
8a9782346dccd8 Liam Girdwood        2015-05-29  1424  	struct snd_soc_dapm_=
widget template, *widget;
8a9782346dccd8 Liam Girdwood        2015-05-29  1425  	struct snd_soc_tplg_=
ctl_hdr *control_hdr;
8a9782346dccd8 Liam Girdwood        2015-05-29  1426  	struct snd_soc_card =
*card =3D tplg->comp->card;
b9c035aa43b8c0 Jaska Uimonen        2021-05-19  1427  	unsigned int *kcontr=
ol_type =3D NULL;
434aeb3af21570 Jaska Uimonen        2020-09-08  1428  	struct snd_kcontrol_=
new *kc;
434aeb3af21570 Jaska Uimonen        2020-09-08  1429  	int mixer_count =3D =
0;
434aeb3af21570 Jaska Uimonen        2020-09-08  1430  	int bytes_count =3D =
0;
434aeb3af21570 Jaska Uimonen        2020-09-08  1431  	int enum_count =3D 0;
8a9782346dccd8 Liam Girdwood        2015-05-29  1432  	int ret =3D 0;
434aeb3af21570 Jaska Uimonen        2020-09-08  1433  	int i;
8a9782346dccd8 Liam Girdwood        2015-05-29  1434  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1435  	if (strnlen(w->name,=
 SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
8a9782346dccd8 Liam Girdwood        2015-05-29  1436  		SNDRV_CTL_ELEM_ID_N=
AME_MAXLEN)
8a9782346dccd8 Liam Girdwood        2015-05-29  1437  		return -EINVAL;
8a9782346dccd8 Liam Girdwood        2015-05-29  1438  	if (strnlen(w->sname=
, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) =3D=3D
8a9782346dccd8 Liam Girdwood        2015-05-29  1439  		SNDRV_CTL_ELEM_ID_N=
AME_MAXLEN)
8a9782346dccd8 Liam Girdwood        2015-05-29  1440  		return -EINVAL;
8a9782346dccd8 Liam Girdwood        2015-05-29  1441  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1442  	dev_dbg(tplg->dev, "=
ASoC: creating DAPM widget %s id %d\n",
8a9782346dccd8 Liam Girdwood        2015-05-29  1443  		w->name, w->id);
8a9782346dccd8 Liam Girdwood        2015-05-29  1444  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1445  	memset(&template, 0,=
 sizeof(template));
8a9782346dccd8 Liam Girdwood        2015-05-29  1446  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1447  	/* map user to kerne=
l widget ID */
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1448  	template.id =3D get_=
widget_id(le32_to_cpu(w->id));
752c938a5c14b8 Dan Carpenter        2019-09-25  1449  	if ((int)template.id=
 < 0)
8a9782346dccd8 Liam Girdwood        2015-05-29  1450  		return template.id;
8a9782346dccd8 Liam Girdwood        2015-05-29  1451  =

c3421a6a65abc6 Liam Girdwood        2017-06-06  1452  	/* strings are alloc=
ated here, but used and freed by the widget */
8a9782346dccd8 Liam Girdwood        2015-05-29  1453  	template.name =3D ks=
trdup(w->name, GFP_KERNEL);
8a9782346dccd8 Liam Girdwood        2015-05-29  1454  	if (!template.name)
8a9782346dccd8 Liam Girdwood        2015-05-29  1455  		return -ENOMEM;
8a9782346dccd8 Liam Girdwood        2015-05-29  1456  	template.sname =3D k=
strdup(w->sname, GFP_KERNEL);
8a9782346dccd8 Liam Girdwood        2015-05-29  1457  	if (!template.sname)=
 {
8a9782346dccd8 Liam Girdwood        2015-05-29  1458  		ret =3D -ENOMEM;
8a9782346dccd8 Liam Girdwood        2015-05-29  1459  		goto err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1460  	}
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1461  	template.reg =3D le3=
2_to_cpu(w->reg);
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1462  	template.shift =3D l=
e32_to_cpu(w->shift);
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1463  	template.mask =3D le=
32_to_cpu(w->mask);
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1464  	template.subseq =3D =
le32_to_cpu(w->subseq);
8a9782346dccd8 Liam Girdwood        2015-05-29  1465  	template.on_val =3D =
w->invert ? 0 : 1;
8a9782346dccd8 Liam Girdwood        2015-05-29  1466  	template.off_val =3D=
 w->invert ? 1 : 0;
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1467  	template.ignore_susp=
end =3D le32_to_cpu(w->ignore_suspend);
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1468  	template.event_flags=
 =3D le16_to_cpu(w->event_flags);
8a9782346dccd8 Liam Girdwood        2015-05-29  1469  	template.dobj.index =
=3D tplg->index;
8a9782346dccd8 Liam Girdwood        2015-05-29  1470  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1471  	tplg->pos +=3D
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1472  		(sizeof(struct snd_=
soc_tplg_dapm_widget) +
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1473  		 le32_to_cpu(w->pri=
v.size));
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1474  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1475  	if (w->num_kcontrols=
 =3D=3D 0) {
8a9782346dccd8 Liam Girdwood        2015-05-29  1476  		template.num_kcontr=
ols =3D 0;
8a9782346dccd8 Liam Girdwood        2015-05-29  1477  		goto widget;
8a9782346dccd8 Liam Girdwood        2015-05-29  1478  	}
8a9782346dccd8 Liam Girdwood        2015-05-29  1479  =

8a9782346dccd8 Liam Girdwood        2015-05-29 @1480  	control_hdr =3D (str=
uct snd_soc_tplg_ctl_hdr *)tplg->pos;
8a9782346dccd8 Liam Girdwood        2015-05-29  1481  =

434aeb3af21570 Jaska Uimonen        2020-09-08  1482  	template.num_kcontro=
ls =3D le32_to_cpu(w->num_kcontrols);
d29d41e28eea65 Jaska Uimonen        2021-05-07  1483  	kc =3D devm_kcalloc(=
tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(*kc), GFP_KERNEL);
434aeb3af21570 Jaska Uimonen        2020-09-08  1484  	if (!kc)
434aeb3af21570 Jaska Uimonen        2020-09-08  1485  		goto err;
434aeb3af21570 Jaska Uimonen        2020-09-08  1486  =

d29d41e28eea65 Jaska Uimonen        2021-05-07  1487  	kcontrol_type =3D de=
vm_kcalloc(tplg->dev, le32_to_cpu(w->num_kcontrols), sizeof(unsigned int),
d29d41e28eea65 Jaska Uimonen        2021-05-07  1488  				     GFP_KERNEL);
434aeb3af21570 Jaska Uimonen        2020-09-08  1489  	if (!kcontrol_type)
434aeb3af21570 Jaska Uimonen        2020-09-08  1490  		goto err;
434aeb3af21570 Jaska Uimonen        2020-09-08  1491  =

434aeb3af21570 Jaska Uimonen        2020-09-08  1492  	for (i =3D 0; i < w-=
>num_kcontrols; i++) {
434aeb3af21570 Jaska Uimonen        2020-09-08  1493  		control_hdr =3D (st=
ruct snd_soc_tplg_ctl_hdr *)tplg->pos;
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1494  		switch (le32_to_cpu=
(control_hdr->ops.info)) {
8a9782346dccd8 Liam Girdwood        2015-05-29  1495  		case SND_SOC_TPLG_C=
TL_VOLSW:
8a9782346dccd8 Liam Girdwood        2015-05-29  1496  		case SND_SOC_TPLG_C=
TL_STROBE:
8a9782346dccd8 Liam Girdwood        2015-05-29  1497  		case SND_SOC_TPLG_C=
TL_VOLSW_SX:
8a9782346dccd8 Liam Girdwood        2015-05-29  1498  		case SND_SOC_TPLG_C=
TL_VOLSW_XR_SX:
8a9782346dccd8 Liam Girdwood        2015-05-29  1499  		case SND_SOC_TPLG_C=
TL_RANGE:
8a9782346dccd8 Liam Girdwood        2015-05-29  1500  		case SND_SOC_TPLG_D=
APM_CTL_VOLSW:
434aeb3af21570 Jaska Uimonen        2020-09-08  1501  			/* volume mixer */
434aeb3af21570 Jaska Uimonen        2020-09-08  1502  			kc[i].index =3D mi=
xer_count;
434aeb3af21570 Jaska Uimonen        2020-09-08  1503  			kcontrol_type[i] =
=3D SND_SOC_TPLG_TYPE_MIXER;
434aeb3af21570 Jaska Uimonen        2020-09-08  1504  			mixer_count++;
434aeb3af21570 Jaska Uimonen        2020-09-08  1505  			ret =3D soc_tplg_d=
apm_widget_dmixer_create(tplg, &kc[i]);
434aeb3af21570 Jaska Uimonen        2020-09-08  1506  			if (ret < 0)
8a9782346dccd8 Liam Girdwood        2015-05-29  1507  				goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1508  			break;
8a9782346dccd8 Liam Girdwood        2015-05-29  1509  		case SND_SOC_TPLG_C=
TL_ENUM:
8a9782346dccd8 Liam Girdwood        2015-05-29  1510  		case SND_SOC_TPLG_C=
TL_ENUM_VALUE:
8a9782346dccd8 Liam Girdwood        2015-05-29  1511  		case SND_SOC_TPLG_D=
APM_CTL_ENUM_DOUBLE:
8a9782346dccd8 Liam Girdwood        2015-05-29  1512  		case SND_SOC_TPLG_D=
APM_CTL_ENUM_VIRT:
8a9782346dccd8 Liam Girdwood        2015-05-29  1513  		case SND_SOC_TPLG_D=
APM_CTL_ENUM_VALUE:
434aeb3af21570 Jaska Uimonen        2020-09-08  1514  			/* enumerated mixe=
r */
434aeb3af21570 Jaska Uimonen        2020-09-08  1515  			kc[i].index =3D en=
um_count;
434aeb3af21570 Jaska Uimonen        2020-09-08  1516  			kcontrol_type[i] =
=3D SND_SOC_TPLG_TYPE_ENUM;
434aeb3af21570 Jaska Uimonen        2020-09-08  1517  			enum_count++;
434aeb3af21570 Jaska Uimonen        2020-09-08  1518  			ret =3D soc_tplg_d=
apm_widget_denum_create(tplg, &kc[i]);
434aeb3af21570 Jaska Uimonen        2020-09-08  1519  			if (ret < 0)
8a9782346dccd8 Liam Girdwood        2015-05-29  1520  				goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1521  			break;
8a9782346dccd8 Liam Girdwood        2015-05-29  1522  		case SND_SOC_TPLG_C=
TL_BYTES:
434aeb3af21570 Jaska Uimonen        2020-09-08  1523  			/* bytes control */
434aeb3af21570 Jaska Uimonen        2020-09-08  1524  			kc[i].index =3D by=
tes_count;
434aeb3af21570 Jaska Uimonen        2020-09-08  1525  			kcontrol_type[i] =
=3D SND_SOC_TPLG_TYPE_BYTES;
434aeb3af21570 Jaska Uimonen        2020-09-08  1526  			bytes_count++;
434aeb3af21570 Jaska Uimonen        2020-09-08  1527  			ret =3D soc_tplg_d=
apm_widget_dbytes_create(tplg, &kc[i]);
434aeb3af21570 Jaska Uimonen        2020-09-08  1528  			if (ret < 0)
8a9782346dccd8 Liam Girdwood        2015-05-29  1529  				goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1530  			break;
8a9782346dccd8 Liam Girdwood        2015-05-29  1531  		default:
8a9782346dccd8 Liam Girdwood        2015-05-29  1532  			dev_err(tplg->dev,=
 "ASoC: invalid widget control type %d:%d:%d\n",
8a9782346dccd8 Liam Girdwood        2015-05-29  1533  				control_hdr->ops.=
get, control_hdr->ops.put,
5aebe7c7f9c20e Pierre-Louis Bossart 2019-04-04  1534  				le32_to_cpu(contr=
ol_hdr->ops.info));
8a9782346dccd8 Liam Girdwood        2015-05-29  1535  			ret =3D -EINVAL;
8a9782346dccd8 Liam Girdwood        2015-05-29  1536  			goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1537  		}
434aeb3af21570 Jaska Uimonen        2020-09-08  1538  	}
434aeb3af21570 Jaska Uimonen        2020-09-08  1539  =

434aeb3af21570 Jaska Uimonen        2020-09-08  1540  	template.kcontrol_ne=
ws =3D kc;
7c60d066345304 Peter Ujfalusi       2021-06-11  1541  	dev_dbg(tplg->dev, "=
ASoC: template %s with %d/%d/%d (mixer/enum/bytes) control\n",
7c60d066345304 Peter Ujfalusi       2021-06-11  1542  		w->name, mixer_coun=
t, enum_count, bytes_count);
8a9782346dccd8 Liam Girdwood        2015-05-29  1543  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1544  widget:
8a9782346dccd8 Liam Girdwood        2015-05-29  1545  	ret =3D soc_tplg_wid=
get_load(tplg, &template, w);
8a9782346dccd8 Liam Girdwood        2015-05-29  1546  	if (ret < 0)
8a9782346dccd8 Liam Girdwood        2015-05-29  1547  		goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1548  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1549  	/* card dapm mutex i=
s held by the core if we are loading topology
8a9782346dccd8 Liam Girdwood        2015-05-29  1550  	 * data during sound=
 card init. */
8a9782346dccd8 Liam Girdwood        2015-05-29  1551  	if (card->instantiat=
ed)
8a9782346dccd8 Liam Girdwood        2015-05-29  1552  		widget =3D snd_soc_=
dapm_new_control(dapm, &template);
8a9782346dccd8 Liam Girdwood        2015-05-29  1553  	else
8a9782346dccd8 Liam Girdwood        2015-05-29  1554  		widget =3D snd_soc_=
dapm_new_control_unlocked(dapm, &template);
37e1df8c95e2c8 Linus Walleij        2017-01-13  1555  	if (IS_ERR(widget)) {
37e1df8c95e2c8 Linus Walleij        2017-01-13  1556  		ret =3D PTR_ERR(wid=
get);
8a9782346dccd8 Liam Girdwood        2015-05-29  1557  		goto hdr_err;
8a9782346dccd8 Liam Girdwood        2015-05-29  1558  	}
8a9782346dccd8 Liam Girdwood        2015-05-29  1559  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1560  	widget->dobj.type =
=3D SND_SOC_DOBJ_WIDGET;
eea3dd4f1247aa Mengdong Lin         2016-11-25  1561  	widget->dobj.widget.=
kcontrol_type =3D kcontrol_type;
8a9782346dccd8 Liam Girdwood        2015-05-29  1562  	widget->dobj.ops =3D=
 tplg->ops;
8a9782346dccd8 Liam Girdwood        2015-05-29  1563  	widget->dobj.index =
=3D tplg->index;
8a9782346dccd8 Liam Girdwood        2015-05-29  1564  	list_add(&widget->do=
bj.list, &tplg->comp->dobj_list);
ebd259d33a900b Liam Girdwood        2017-06-09  1565  =

ebd259d33a900b Liam Girdwood        2017-06-09  1566  	ret =3D soc_tplg_wid=
get_ready(tplg, widget, w);
ebd259d33a900b Liam Girdwood        2017-06-09  1567  	if (ret < 0)
ebd259d33a900b Liam Girdwood        2017-06-09  1568  		goto ready_err;
ebd259d33a900b Liam Girdwood        2017-06-09  1569  =

7620fe9161cec2 Bard liao            2019-01-25  1570  	kfree(template.sname=
);
7620fe9161cec2 Bard liao            2019-01-25  1571  	kfree(template.name);
7620fe9161cec2 Bard liao            2019-01-25  1572  =

8a9782346dccd8 Liam Girdwood        2015-05-29  1573  	return 0;
8a9782346dccd8 Liam Girdwood        2015-05-29  1574  =

ebd259d33a900b Liam Girdwood        2017-06-09  1575  ready_err:
841fb1096713bd Amadeusz S=C5=82awi=C5=84ski   2020-10-30  1576  	remove_wid=
get(widget->dapm->component, &widget->dobj, SOC_TPLG_PASS_WIDGET);
ebd259d33a900b Liam Girdwood        2017-06-09  1577  	snd_soc_dapm_free_wi=
dget(widget);
8a9782346dccd8 Liam Girdwood        2015-05-29  1578  hdr_err:
8a9782346dccd8 Liam Girdwood        2015-05-29  1579  	kfree(template.sname=
);
8a9782346dccd8 Liam Girdwood        2015-05-29  1580  err:
8a9782346dccd8 Liam Girdwood        2015-05-29  1581  	kfree(template.name);
8a9782346dccd8 Liam Girdwood        2015-05-29  1582  	return ret;
8a9782346dccd8 Liam Girdwood        2015-05-29  1583  }
8a9782346dccd8 Liam Girdwood        2015-05-29  1584  =


:::::: The code at line 1480 was first introduced by commit
:::::: 8a9782346dccd82cf912552735bda619de4efd8c ASoC: topology: Add topolog=
y core

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2293758403371802030==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
eB8ZAgA=
--===============2293758403371802030==--

