Content-Type: multipart/mixed; boundary="===============7019697771791627996=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/tegra/tegra210_mvc.c:117:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 14 Aug 2022 06:39:24 +0800
Message-ID: <202208140639.wXmUnunb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7019697771791627996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: sound/soc=
/tegra/tegra210_mvc.c:117:13: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sameer Pujar <spujar@nvidia.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: e539891f968722d632234ac942c4749ad8ca189a ASoC: tegra: Add Tegra210 =
based MVC driver
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220814/202208140639.wXmUnunb-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De539891f968722d632234ac942c4749ad8ca189a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e539891f968722d632234ac942c4749ad8ca189a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   sound/soc/tegra/tegra210_mvc.c: In function 'tegra210_mvc_get_mute':
>> sound/soc/tegra/tegra210_mvc.c:117:13: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     117 |         u32 val;
         |             ^~~
     'tegra210_mvc_get_mute': event 1
       |
       |  117 |         u32 val;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   sound/soc/tegra/tegra210_mvc.c: In function 'tegra210_mvc_put_mute':
   sound/soc/tegra/tegra210_mvc.c:138:22: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     138 |         unsigned int value;
         |                      ^~~~~
     'tegra210_mvc_put_mute': event 1
       |
       |  138 |         unsigned int value;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   sound/soc/tegra/tegra210_mvc.c: In function 'tegra210_mvc_put_vol':
   sound/soc/tegra/tegra210_mvc.c:196:22: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     196 |         unsigned int value;
         |                      ^~~~~
     'tegra210_mvc_put_vol': event 1
       |
       |  196 |         unsigned int value;
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   sound/soc/tegra/tegra210_mvc.c: In function 'tegra210_mvc_put_curve_type=
':
   sound/soc/tegra/tegra210_mvc.c:288:13: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     288 |         int value;
         |             ^~~~~
     'tegra210_mvc_put_curve_type': event 1
       |
       |  288 |         int value;
       |      |             ^~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   sound/soc/tegra/tegra210_mvc.c: In function 'tegra210_mvc_hw_params':
   sound/soc/tegra/tegra210_mvc.c:345:18: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     345 |         int err, val;
         |                  ^~~
     'tegra210_mvc_hw_params': event 1
       |
       |  345 |         int err, val;
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
       |

vim +117 sound/soc/tegra/tegra210_mvc.c

e539891f968722 Sameer Pujar 2021-09-13  110  =

e539891f968722 Sameer Pujar 2021-09-13  111  static int tegra210_mvc_get_mu=
te(struct snd_kcontrol *kcontrol,
e539891f968722 Sameer Pujar 2021-09-13  112  				 struct snd_ctl_elem_value=
 *ucontrol)
e539891f968722 Sameer Pujar 2021-09-13  113  {
e539891f968722 Sameer Pujar 2021-09-13  114  	struct snd_soc_component *cmp=
nt =3D snd_soc_kcontrol_component(kcontrol);
e539891f968722 Sameer Pujar 2021-09-13  115  	struct tegra210_mvc *mvc =3D =
snd_soc_component_get_drvdata(cmpnt);
e539891f968722 Sameer Pujar 2021-09-13  116  	u8 mute_mask;
e539891f968722 Sameer Pujar 2021-09-13 @117  	u32 val;
e539891f968722 Sameer Pujar 2021-09-13  118  =

e539891f968722 Sameer Pujar 2021-09-13  119  	pm_runtime_get_sync(cmpnt->de=
v);
e539891f968722 Sameer Pujar 2021-09-13  120  	regmap_read(mvc->regmap, TEGR=
A210_MVC_CTRL, &val);
e539891f968722 Sameer Pujar 2021-09-13  121  	pm_runtime_put(cmpnt->dev);
e539891f968722 Sameer Pujar 2021-09-13  122  =

e539891f968722 Sameer Pujar 2021-09-13  123  	mute_mask =3D (val >>  TEGRA2=
10_MVC_MUTE_SHIFT) &
e539891f968722 Sameer Pujar 2021-09-13  124  		TEGRA210_MUTE_MASK_EN;
e539891f968722 Sameer Pujar 2021-09-13  125  =

e539891f968722 Sameer Pujar 2021-09-13  126  	ucontrol->value.integer.value=
[0] =3D mute_mask;
e539891f968722 Sameer Pujar 2021-09-13  127  =

e539891f968722 Sameer Pujar 2021-09-13  128  	return 0;
e539891f968722 Sameer Pujar 2021-09-13  129  }
e539891f968722 Sameer Pujar 2021-09-13  130  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7019697771791627996==--

