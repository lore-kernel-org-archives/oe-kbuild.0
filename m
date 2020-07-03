Content-Type: multipart/mixed; boundary="===============2626305144913765342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [broonie-misc:asoc-5.9 57/73] sound/soc/codecs/tas2562.c:200:4: warning: Assignment of function parameter has no effect outside the function.
Date: Fri, 03 Jul 2020 10:27:59 +0800
Message-ID: <202007031047.rU8yhhgJ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2626305144913765342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dan Murphy <dmurphy@ti.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git as=
oc-5.9
head:   c950e9fcc79b8fedd3126ede4dcd70add8ea5339
commit: d7bd40ae55ce339a3c9be7fc2087c671d3d80894 [57/73] ASoC: tas2562: Add=
 right and left channel slot programming
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
compiler: gcc-9 (Debian 9.3.0-14) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> sound/soc/codecs/tas2562.c:200:4: warning: Assignment of function parame=
ter has no effect outside the function. [uselessAssignmentArg]
      tx_mask &=3D ~(1 << right_slot);
      ^
   sound/soc/codecs/tas2562.c:518:9: warning: Identical condition 'ret', se=
cond condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   sound/soc/codecs/tas2562.c:513:6: note: first condition
    if (ret)
        ^
   sound/soc/codecs/tas2562.c:518:9: note: second condition
    return ret;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git/commit/?=
id=3Dd7bd40ae55ce339a3c9be7fc2087c671d3d80894
git remote add broonie-misc https://git.kernel.org/pub/scm/linux/kernel/git=
/broonie/misc.git
git remote update broonie-misc
git checkout d7bd40ae55ce339a3c9be7fc2087c671d3d80894
vim +200 sound/soc/codecs/tas2562.c

c173dba44c2d2e Dan Murphy 2019-10-08  171  =

c173dba44c2d2e Dan Murphy 2019-10-08  172  static int tas2562_set_dai_tdm_s=
lot(struct snd_soc_dai *dai,
c173dba44c2d2e Dan Murphy 2019-10-08  173  		unsigned int tx_mask, unsigned=
 int rx_mask,
c173dba44c2d2e Dan Murphy 2019-10-08  174  		int slots, int slot_width)
c173dba44c2d2e Dan Murphy 2019-10-08  175  {
c173dba44c2d2e Dan Murphy 2019-10-08  176  	struct snd_soc_component *compo=
nent =3D dai->component;
c173dba44c2d2e Dan Murphy 2019-10-08  177  	struct tas2562_data *tas2562 =
=3D snd_soc_component_get_drvdata(component);
d7bd40ae55ce33 Dan Murphy 2020-06-26  178  	int left_slot, right_slot;
d7bd40ae55ce33 Dan Murphy 2020-06-26  179  	int slots_cfg;
d7bd40ae55ce33 Dan Murphy 2020-06-26  180  	int ret;
d7bd40ae55ce33 Dan Murphy 2020-06-26  181  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  182  	if (!tx_mask) {
d7bd40ae55ce33 Dan Murphy 2020-06-26  183  		dev_err(component->dev, "tx ma=
sks must not be 0\n");
d7bd40ae55ce33 Dan Murphy 2020-06-26  184  		return -EINVAL;
d7bd40ae55ce33 Dan Murphy 2020-06-26  185  	}
d7bd40ae55ce33 Dan Murphy 2020-06-26  186  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  187  	if (slots =3D=3D 1) {
d7bd40ae55ce33 Dan Murphy 2020-06-26  188  		if (tx_mask !=3D 1)
d7bd40ae55ce33 Dan Murphy 2020-06-26  189  			return -EINVAL;
d7bd40ae55ce33 Dan Murphy 2020-06-26  190  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  191  		left_slot =3D 0;
d7bd40ae55ce33 Dan Murphy 2020-06-26  192  		right_slot =3D 0;
d7bd40ae55ce33 Dan Murphy 2020-06-26  193  	} else {
d7bd40ae55ce33 Dan Murphy 2020-06-26  194  		left_slot =3D __ffs(tx_mask);
d7bd40ae55ce33 Dan Murphy 2020-06-26  195  		tx_mask &=3D ~(1 << left_slot);
d7bd40ae55ce33 Dan Murphy 2020-06-26  196  		if (tx_mask =3D=3D 0) {
d7bd40ae55ce33 Dan Murphy 2020-06-26  197  			right_slot =3D left_slot;
d7bd40ae55ce33 Dan Murphy 2020-06-26  198  		} else {
d7bd40ae55ce33 Dan Murphy 2020-06-26  199  			right_slot =3D __ffs(tx_mask);
d7bd40ae55ce33 Dan Murphy 2020-06-26 @200  			tx_mask &=3D ~(1 << right_slo=
t);
d7bd40ae55ce33 Dan Murphy 2020-06-26  201  		}
d7bd40ae55ce33 Dan Murphy 2020-06-26  202  	}
d7bd40ae55ce33 Dan Murphy 2020-06-26  203  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  204  	slots_cfg =3D (right_slot << TA=
S2562_RIGHT_SLOT_SHIFT) | left_slot;
d7bd40ae55ce33 Dan Murphy 2020-06-26  205  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  206  	ret =3D snd_soc_component_write=
(component, TAS2562_TDM_CFG3, slots_cfg);
d7bd40ae55ce33 Dan Murphy 2020-06-26  207  	if (ret < 0)
d7bd40ae55ce33 Dan Murphy 2020-06-26  208  		return ret;
c173dba44c2d2e Dan Murphy 2019-10-08  209  =

c173dba44c2d2e Dan Murphy 2019-10-08  210  	switch (slot_width) {
c173dba44c2d2e Dan Murphy 2019-10-08  211  	case 16:
c173dba44c2d2e Dan Murphy 2019-10-08  212  		ret =3D snd_soc_component_upda=
te_bits(component,
c173dba44c2d2e Dan Murphy 2019-10-08  213  						    TAS2562_TDM_CFG2,
c173dba44c2d2e Dan Murphy 2019-10-08  214  						    TAS2562_TDM_CFG2_RXLEN=
_MASK,
c173dba44c2d2e Dan Murphy 2019-10-08  215  						    TAS2562_TDM_CFG2_RXLEN=
_16B);
c173dba44c2d2e Dan Murphy 2019-10-08  216  		break;
c173dba44c2d2e Dan Murphy 2019-10-08  217  	case 24:
c173dba44c2d2e Dan Murphy 2019-10-08  218  		ret =3D snd_soc_component_upda=
te_bits(component,
c173dba44c2d2e Dan Murphy 2019-10-08  219  						    TAS2562_TDM_CFG2,
c173dba44c2d2e Dan Murphy 2019-10-08  220  						    TAS2562_TDM_CFG2_RXLEN=
_MASK,
c173dba44c2d2e Dan Murphy 2019-10-08  221  						    TAS2562_TDM_CFG2_RXLEN=
_24B);
c173dba44c2d2e Dan Murphy 2019-10-08  222  		break;
c173dba44c2d2e Dan Murphy 2019-10-08  223  	case 32:
c173dba44c2d2e Dan Murphy 2019-10-08  224  		ret =3D snd_soc_component_upda=
te_bits(component,
c173dba44c2d2e Dan Murphy 2019-10-08  225  						    TAS2562_TDM_CFG2,
c173dba44c2d2e Dan Murphy 2019-10-08  226  						    TAS2562_TDM_CFG2_RXLEN=
_MASK,
c173dba44c2d2e Dan Murphy 2019-10-08  227  						    TAS2562_TDM_CFG2_RXLEN=
_32B);
c173dba44c2d2e Dan Murphy 2019-10-08  228  		break;
c173dba44c2d2e Dan Murphy 2019-10-08  229  =

c173dba44c2d2e Dan Murphy 2019-10-08  230  	case 0:
c173dba44c2d2e Dan Murphy 2019-10-08  231  		/* Do not change slot width */
c173dba44c2d2e Dan Murphy 2019-10-08  232  		break;
c173dba44c2d2e Dan Murphy 2019-10-08  233  	default:
c173dba44c2d2e Dan Murphy 2019-10-08  234  		dev_err(tas2562->dev, "slot wi=
dth not supported");
c173dba44c2d2e Dan Murphy 2019-10-08  235  		ret =3D -EINVAL;
c173dba44c2d2e Dan Murphy 2019-10-08  236  	}
c173dba44c2d2e Dan Murphy 2019-10-08  237  =

c173dba44c2d2e Dan Murphy 2019-10-08  238  	if (ret < 0)
c173dba44c2d2e Dan Murphy 2019-10-08  239  		return ret;
c173dba44c2d2e Dan Murphy 2019-10-08  240  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  241  	ret =3D snd_soc_component_updat=
e_bits(component, TAS2562_TDM_CFG5,
d7bd40ae55ce33 Dan Murphy 2020-06-26  242  					    TAS2562_TDM_CFG5_VSNS_S=
LOT_MASK,
d7bd40ae55ce33 Dan Murphy 2020-06-26  243  					    tas2562->v_sense_slot);
d7bd40ae55ce33 Dan Murphy 2020-06-26  244  	if (ret < 0)
d7bd40ae55ce33 Dan Murphy 2020-06-26  245  		return ret;
d7bd40ae55ce33 Dan Murphy 2020-06-26  246  =

d7bd40ae55ce33 Dan Murphy 2020-06-26  247  	ret =3D snd_soc_component_updat=
e_bits(component, TAS2562_TDM_CFG6,
d7bd40ae55ce33 Dan Murphy 2020-06-26  248  					    TAS2562_TDM_CFG6_ISNS_S=
LOT_MASK,
d7bd40ae55ce33 Dan Murphy 2020-06-26  249  					    tas2562->i_sense_slot);
d7bd40ae55ce33 Dan Murphy 2020-06-26  250  	if (ret < 0)
d7bd40ae55ce33 Dan Murphy 2020-06-26  251  		return ret;
d7bd40ae55ce33 Dan Murphy 2020-06-26  252  =

c173dba44c2d2e Dan Murphy 2019-10-08  253  	return 0;
c173dba44c2d2e Dan Murphy 2019-10-08  254  }
c173dba44c2d2e Dan Murphy 2019-10-08  255  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2626305144913765342==--

