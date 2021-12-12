Content-Type: multipart/mixed; boundary="===============7251212255964320080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/codecs/wm8994.c:1450:28: warning: Value stored to 'component' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 15:38:57 +0800
Message-ID: <202112121549.X8ecd25k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7251212255964320080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: efd0b1660829a987354cea6a446179c7ac7cd0e6 ASoC: fsl-asoc-card: Add s=
upport for WM8958 codec
date:   9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211209 (https://download.01.org/0day-ci/archi=
ve/20211212/202112121549.X8ecd25k-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Defd0b1660829a987354cea6a446179c7ac7cd0e6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout efd0b1660829a987354cea6a446179c7ac7cd0e6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                          ^~~
   sound/soc/generic/audio-graph-card.c:634:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:634:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:653:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   sound/soc/generic/audio-graph-card.c:653:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D simple_priv_to_dev(priv);
                          ^~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/gadget/udc/pxa27x_udc.c:480:17: warning: Value stored to 'ep=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct pxa_ep *ep =3D &udc->pxa_ep[0];
                          ^~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:480:17: note: Value stored to 'ep' d=
uring its initialization is never read
           struct pxa_ep *ep =3D &udc->pxa_ep[0];
                          ^~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:481:8: warning: Value stored to 'old=
_stname' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           char *old_stname =3D EP0_STNAME(udc);
                 ^~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:481:8: note: Value stored to 'old_st=
name' during its initialization is never read
           char *old_stname =3D EP0_STNAME(udc);
                 ^~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1087:2: warning: Value stored to 'is=
_first_req' is never read [clang-analyzer-deadcode.DeadStores]
           is_first_req =3D list_empty(&ep->queue);
           ^              ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1087:2: note: Value stored to 'is_fi=
rst_req' is never read
           is_first_req =3D list_empty(&ep->queue);
           ^              ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2271:6: warning: Value stored to 'ud=
ccr' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 udccr =3D udc_readl(udc, UDCCR);
               ^~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2271:6: note: Value stored to 'udccr=
' during its initialization is never read
           u32 udccr =3D udc_readl(udc, UDCCR);
               ^~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/codecs/cs42l52.c:1165:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/cs42l52.c:1165:2: note: Value stored to 'ret' is never =
read
           ret =3D regmap_read(cs42l52->regmap, CS42L52_CHIP, &reg);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> sound/soc/codecs/wm8994.c:1450:28: warning: Value stored to 'component' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_component *component =3D snd_soc_dapm_to_componen=
t(w->dapm);
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/soc/codecs/wm8994.c:1450:28: note: Value stored to 'component' dur=
ing its initialization is never read
           struct snd_soc_component *component =3D snd_soc_dapm_to_componen=
t(w->dapm);
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   sound/soc/codecs/wm8994.c:3345:28: warning: Value stored to 'component' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_soc_component *component =3D wm8994->hubs.component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8994.c:3345:28: note: Value stored to 'component' dur=
ing its initialization is never read
           struct snd_soc_component *component =3D wm8994->hubs.component;
                                     ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/codecs/wm8994.c:3703:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8994.c:3703:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/v4l2-core/v4l2-async.c:448:17: warning: Value stored to 'd=
ev' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct device *dev =3D
                          ^~~
   drivers/media/v4l2-core/v4l2-async.c:448:17: note: Value stored to 'dev'=
 during its initialization is never read
           struct device *dev =3D
                          ^~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/v4l2-core/v4l2-mc.c:176:4: warning: Value stored to 'if_au=
d' is never read [clang-analyzer-deadcode.DeadStores]
                           if_aud =3D tuner;
                           ^        ~~~~~
   drivers/media/v4l2-core/v4l2-mc.c:176:4: note: Value stored to 'if_aud' =
is never read
                           if_aud =3D tuner;
                           ^        ~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   sound/usb/caiaq/audio.c:123:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:123:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:144:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:156:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D caiaqdev_to_dev(cdev);
                          ^~~
   sound/usb/caiaq/audio.c:191:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D caiaqdev_to_dev(cdev);

vim +/component +1450 sound/soc/codecs/wm8994.c

9e6e96a197a037 Mark Brown        2010-01-29  1445  =

9e6e96a197a037 Mark Brown        2010-01-29  1446  /* Debugging; dump chip =
status after DAPM transitions */
9e6e96a197a037 Mark Brown        2010-01-29  1447  static int post_ev(struc=
t snd_soc_dapm_widget *w,
9e6e96a197a037 Mark Brown        2010-01-29  1448  	    struct snd_kcontrol=
 *kcontrol, int event)
9e6e96a197a037 Mark Brown        2010-01-29  1449  {
00a6941c841205 Kuninori Morimoto 2018-01-29 @1450  	struct snd_soc_componen=
t *component =3D snd_soc_dapm_to_component(w->dapm);
00a6941c841205 Kuninori Morimoto 2018-01-29  1451  	dev_dbg(component->dev,=
 "SRC status: %x\n",
6d75dfc3e86500 Kuninori Morimoto 2020-06-16  1452  		snd_soc_component_read=
(component,
9e6e96a197a037 Mark Brown        2010-01-29  1453  			     WM8994_RATE_STAT=
US));
9e6e96a197a037 Mark Brown        2010-01-29  1454  	return 0;
9e6e96a197a037 Mark Brown        2010-01-29  1455  }
9e6e96a197a037 Mark Brown        2010-01-29  1456  =


:::::: The code at line 1450 was first introduced by commit
:::::: 00a6941c841205fbdade825219a828c81008149b ASoC: wm8993/wm8994/wm8958:=
 replace codec to component

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7251212255964320080==--

