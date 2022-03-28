Content-Type: multipart/mixed; boundary="===============4136641933426794795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/generic/simple-card-utils.c:367 asoc_simple_set_tdm() warn: variable dereferenced before check 'simple_dai' (see line 363)
Date: Tue, 29 Mar 2022 03:22:58 +0800
Message-ID: <202203290343.9cbKTLxo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4136641933426794795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: 1e974e5b82b3d75069b50445cd248cee0199654e ASoC: audio_graph_card2: A=
dd support for variable slot widths
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-m031-20220327 (https://download.01.org/0day-ci/arc=
hive/20220329/202203290343.9cbKTLxo-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/generic/simple-card-utils.c:367 asoc_simple_set_tdm() warn: varia=
ble dereferenced before check 'simple_dai' (see line 363)

vim +/simple_dai +367 sound/soc/generic/simple-card-utils.c

f48dcbb6d47d87 Kuninori Morimoto  2019-03-20  357  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  358  static int asoc_simple_s=
et_tdm(struct snd_soc_dai *dai,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  359  				struct asoc_simple_d=
ai *simple_dai,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  360  				struct snd_pcm_hw_pa=
rams *params)
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  361  {
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  362  	int sample_bits =3D par=
ams_width(params);
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28 @363  	int slot_width =3D simp=
le_dai->slot_width;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  364  	int slot_count =3D simp=
le_dai->slots;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  365  	int i, ret;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  366  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28 @367  	if (!simple_dai || !sim=
ple_dai->tdm_width_map)
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  368  		return 0;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  369  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  370  	if (slot_width =3D=3D 0)
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  371  		slot_width =3D sample_=
bits;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  372  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  373  	for (i =3D 0; i < simpl=
e_dai->n_tdm_widths; ++i) {
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  374  		if (simple_dai->tdm_wi=
dth_map[i].sample_bits =3D=3D sample_bits) {
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  375  			slot_width =3D simple=
_dai->tdm_width_map[i].slot_width;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  376  			slot_count =3D simple=
_dai->tdm_width_map[i].slot_count;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  377  			break;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  378  		}
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  379  	}
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  380  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  381  	ret =3D snd_soc_dai_set=
_tdm_slot(dai,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  382  				       simple_dai->t=
x_slot_mask,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  383  				       simple_dai->r=
x_slot_mask,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  384  				       slot_count,
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  385  				       slot_width);
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  386  	if (ret && ret !=3D -EN=
OTSUPP) {
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  387  		dev_err(dai->dev, "sim=
ple-card: set_tdm_slot error: %d\n", ret);
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  388  		return ret;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  389  	}
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  390  =

1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  391  	return 0;
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  392  }
1e974e5b82b3d7 Richard Fitzgerald 2022-02-28  393  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4136641933426794795==--

