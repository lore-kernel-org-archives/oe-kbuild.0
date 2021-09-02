Content-Type: multipart/mixed; boundary="===============6157664475067125290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 3/147] sound/soc/codecs/arizona-jack.c:1380:4: warning: Value stored to 'mode' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 03 Sep 2021 07:09:52 +0800
Message-ID: <202109030744.todpT6Xc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6157664475067125290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   356d8dbe272e42cb06e2986dbb3d34ef04d08ae6
commit: 475ee9d3b4a21b8fe079b042d2ff7b67438217c9 [3/147] CHROMIUM: net: wwa=
n: t7xx: Device module init and registration
:::::: branch date: 5 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-c002-20210901 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b1fde=
8a2b681dad2ce0c082a5d6422caa06b0bc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add chrome-os https://chromium.googlesource.com/chromium=
os/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 475ee9d3b4a21b8fe079b042d2ff7b67438217c9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/codecs/wm8994.c:1450:28: warning: Value stored to 'component' =
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
   sound/soc/codecs/wm8994.c:3703:17: warning: Value stored to 'dev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8994.c:3703:17: note: Value stored to 'dev' during it=
s initialization is never read
           struct device *dev =3D wm8994->wm8994->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/usb/core/message.c:1705:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1705:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/usb/core/driver.c:1679:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1679:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync_autosuspend(&udev->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1741:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put_sync(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: warning: Value stored to 'status' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/driver.c:1769:2: note: Value stored to 'status' is neve=
r read
           status =3D pm_runtime_put(&intf->dev);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> sound/soc/codecs/arizona-jack.c:1380:4: warning: Value stored to 'mode' =
is never read [clang-analyzer-deadcode.DeadStores]
                           mode =3D GPIOD_OUT_HIGH;
                           ^      ~~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1380:4: note: Value stored to 'mode' is =
never read
                           mode =3D GPIOD_OUT_HIGH;
                           ^      ~~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1382:4: warning: Value stored to 'mode' =
is never read [clang-analyzer-deadcode.DeadStores]
                           mode =3D GPIOD_OUT_LOW;
                           ^      ~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1382:4: note: Value stored to 'mode' is =
never read
                           mode =3D GPIOD_OUT_LOW;
                           ^      ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-frontends/tda1004x.c:547:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda1004x.c:547:2: note: Value stored to 'ret=
' is never read
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/core/mmc.c:1707:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1707:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1812:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1812:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1841:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1841:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1861:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1861:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
--
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/dvb-frontends/tda1004x.c:547:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/tda1004x.c:547:2: note: Value stored to 'ret=
' is never read
           ret =3D tda1004x_do_upload(state, fw->data, fw->size, TDA10046H_=
CODE_CPT, TDA10046H_CODE_IN);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   net/netrom/nr_in.c:156:2: warning: Value stored to 'ns' is never read [c=
lang-analyzer-deadcode.DeadStores]
           ns =3D skb->data[17];
           ^    ~~~~~~~~~~~~~
   net/netrom/nr_in.c:156:2: note: Value stored to 'ns' is never read
           ns =3D skb->data[17];
           ^    ~~~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   10 warnings generated.
>> sound/soc/codecs/arizona-jack.c:1380:4: warning: Value stored to 'mode' =
is never read [clang-analyzer-deadcode.DeadStores]
                           mode =3D GPIOD_OUT_HIGH;
                           ^      ~~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1380:4: note: Value stored to 'mode' is =
never read
                           mode =3D GPIOD_OUT_HIGH;
                           ^      ~~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1382:4: warning: Value stored to 'mode' =
is never read [clang-analyzer-deadcode.DeadStores]
                           mode =3D GPIOD_OUT_LOW;
                           ^      ~~~~~~~~~~~~~
   sound/soc/codecs/arizona-jack.c:1382:4: note: Value stored to 'mode' is =
never read
                           mode =3D GPIOD_OUT_LOW;
                           ^      ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/wm2000.c:580:21: warning: Value stored to 'i2c' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *i2c =3D wm2000->i2c;
                              ^~~   ~~~~~~~~~~~
   sound/soc/codecs/wm2000.c:580:21: note: Value stored to 'i2c' during its=
 initialization is never read
           struct i2c_client *i2c =3D wm2000->i2c;
                              ^~~   ~~~~~~~~~~~
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   sound/soc/codecs/wm8903.c:434:3: warning: Value stored to 'best' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:434:3: note: Value stored to 'best' is never r=
ead
                   best =3D 0;
                   ^      ~
   sound/soc/codecs/wm8903.c:1552:2: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1552:2: note: Value stored to 'best_val' is ne=
ver read
           best_val =3D ((clk_sys * 10) / bclk_divs[0].ratio) - bclk;
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: warning: Value stored to 'best_val' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   sound/soc/codecs/wm8903.c:1559:3: note: Value stored to 'best_val' is ne=
ver read
                   best_val =3D cur_val;
                   ^          ~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/wm8996.c:1562:3: warning: Value stored to 'bclk_rate' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   bclk_rate =3D wm8996->sysclk / bclk_divs[best];
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/wm8996.c:1562:3: note: Value stored to 'bclk_rate' is n=
ever read
                   bclk_rate =3D wm8996->sysclk / bclk_divs[best];
                   ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   sound/soc/codecs/wm8955.c:648:22: warning: Although the value stored to =
'freq' is used in the enclosing expression, the value is never actually rea=
d from 'freq' [clang-analyzer-deadcode.DeadStores]
                           priv->mclk_rate =3D freq /=3D 2;
                                             ^       ~
   sound/soc/codecs/wm8955.c:648:22: note: Although the value stored to 'fr=
eq' is used in the enclosing expression, the value is never actually read f=
rom 'freq'
                           priv->mclk_rate =3D freq /=3D 2;
                                             ^       ~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/usb/host/xhci-dbgcap.c:828:4: warning: Value stored to 'ctrl' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           ctrl =3D readl(&dbc->regs->control);
                           ^
   drivers/usb/host/xhci-dbgcap.c:828:4: note: Value stored to 'ctrl' is ne=
ver read
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mmc/core/mmc.c:1707:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1707:4: note: Value stored to 'err' is never read
                           err =3D 0;
                           ^     ~
   drivers/mmc/core/mmc.c:1812:4: warning: Value stored to 'err' is never r=
ead [clang-analyzer-deadcode.DeadStores]

vim +/mode +1380 sound/soc/codecs/arizona-jack.c

9e86b2ad4c11fd drivers/extcon/extcon-arizona.c Inha Song          2015-05-0=
4  1293  =

b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1294  int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct=
 device *dev)
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1295  {
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1296  	struct arizona *arizona =3D info->arizona;
6ac6b475c56ce4 drivers/extcon/extcon-arizona.c Charles Keepax     2013-09-2=
8  1297  	struct arizona_pdata *pdata =3D &arizona->pdata;
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1298  	int ret, mode;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1299  =

9e86b2ad4c11fd drivers/extcon/extcon-arizona.c Inha Song          2015-05-0=
4  1300  	if (!dev_get_platdata(arizona->dev))
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1301  		arizona_extcon_device_get_pdata(dev, arizona);
9e86b2ad4c11fd drivers/extcon/extcon-arizona.c Inha Song          2015-05-0=
4  1302  =

b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1303  	info->micvdd =3D devm_regulator_get(dev, "MICVDD");
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1304  	if (IS_ERR(info->micvdd)) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1305  		ret =3D PTR_ERR(info->micvdd);
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1306  		dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
d88cc36704e758 drivers/extcon/extcon-arizona.c Sangjung Woo       2014-04-2=
1  1307  		return ret;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1308  	}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1309  =

f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1310  	mutex_init(&info->lock);
a3e2078d6a14bc drivers/extcon/extcon-arizona.c Mark Brown         2013-04-0=
1  1311  	info->last_jackdet =3D ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS=
);
0e27bd3137778a drivers/extcon/extcon-arizona.c Mark Brown         2013-02-0=
5  1312  	INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
cd59e79656f4e7 drivers/extcon/extcon-arizona.c Mark Brown         2013-04-0=
1  1313  	INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
939c5671d11d86 drivers/extcon/extcon-arizona.c Mark Brown         2013-04-0=
1  1314  	INIT_DELAYED_WORK(&info->micd_timeout_work, arizona_micd_timeout_=
work);
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1315  =

f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1316  	switch (arizona->type) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1317  	case WM5102:
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1318  		switch (arizona->rev) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1319  		case 0:
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1320  			info->micd_reva =3D true;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1321  			break;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1322  		default:
dab63eb25ced75 drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1323  			info->micd_clamp =3D true;
d0fd5fbc09b17e drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-04-2=
8  1324  			info->hpdet_ip_version =3D 1;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1325  			break;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1326  		}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1327  		break;
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1328  	case WM5110:
2f2b6aa8c5172d drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-01-1=
7  1329  	case WM8280:
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1330  		switch (arizona->rev) {
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1331  		case 0 ... 2:
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1332  			break;
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1333  		default:
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1334  			info->micd_clamp =3D true;
d0fd5fbc09b17e drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-04-2=
8  1335  			info->hpdet_ip_version =3D 2;
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1336  			break;
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1337  		}
77438610ffd934 drivers/extcon/extcon-arizona.c Charles Keepax     2013-11-1=
4  1338  		break;
d8d09564b830c2 drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-09-2=
8  1339  	case WM8998:
d8d09564b830c2 drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-09-2=
8  1340  	case WM1814:
d8d09564b830c2 drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-09-2=
8  1341  		info->micd_clamp =3D true;
d8d09564b830c2 drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-09-2=
8  1342  		info->hpdet_ip_version =3D 2;
d8d09564b830c2 drivers/extcon/extcon-arizona.c Richard Fitzgerald 2015-09-2=
8  1343  		break;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1344  	default:
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1345  		break;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1346  	}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1347  =

be87cb72bf7513 drivers/extcon/extcon-arizona.c Charles Keepax     2019-12-0=
9  1348  	if (!pdata->micd_timeout)
be87cb72bf7513 drivers/extcon/extcon-arizona.c Charles Keepax     2019-12-0=
9  1349  		pdata->micd_timeout =3D DEFAULT_MICD_TIMEOUT;
be87cb72bf7513 drivers/extcon/extcon-arizona.c Charles Keepax     2019-12-0=
9  1350  =

f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1351  	if (pdata->num_micd_configs) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1352  		info->micd_modes =3D pdata->micd_configs;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1353  		info->micd_num_modes =3D pdata->num_micd_configs;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1354  	} else {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1355  		info->micd_modes =3D micd_default_modes;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1356  		info->micd_num_modes =3D ARRAY_SIZE(micd_default_modes);
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1357  	}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1358  =

6772a5ab4f5367 drivers/extcon/extcon-arizona.c Charles Keepax     2015-09-1=
6  1359  	if (arizona->pdata.gpsw > 0)
6772a5ab4f5367 drivers/extcon/extcon-arizona.c Charles Keepax     2015-09-1=
6  1360  		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
6772a5ab4f5367 drivers/extcon/extcon-arizona.c Charles Keepax     2015-09-1=
6  1361  				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
6772a5ab4f5367 drivers/extcon/extcon-arizona.c Charles Keepax     2015-09-1=
6  1362  =

6c467a106f4c93 drivers/extcon/extcon-arizona.c Charles Keepax     2016-11-2=
5  1363  	if (pdata->micd_pol_gpio > 0) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1364  		if (info->micd_modes[0].gpio)
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1365  			mode =3D GPIOF_OUT_INIT_HIGH;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1366  		else
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1367  			mode =3D GPIOF_OUT_INIT_LOW;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1368  =

b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1369  		ret =3D devm_gpio_request_one(dev, pdata->micd_pol_gpio,
6c467a106f4c93 drivers/extcon/extcon-arizona.c Charles Keepax     2016-11-2=
5  1370  					    mode, "MICD polarity");
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1371  		if (ret !=3D 0) {
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1372  			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
6c467a106f4c93 drivers/extcon/extcon-arizona.c Charles Keepax     2016-11-2=
5  1373  				pdata->micd_pol_gpio, ret);
b2e5575a8d0402 drivers/extcon/extcon-arizona.c Dinghao Liu        2020-05-2=
3  1374  			return ret;
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1375  		}
6c467a106f4c93 drivers/extcon/extcon-arizona.c Charles Keepax     2016-11-2=
5  1376  =

6c467a106f4c93 drivers/extcon/extcon-arizona.c Charles Keepax     2016-11-2=
5  1377  		info->micd_pol_gpio =3D gpio_to_desc(pdata->micd_pol_gpio);
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1378  	} else {
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1379  		if (info->micd_modes[0].gpio)
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9 @1380  			mode =3D GPIOD_OUT_HIGH;
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1381  		else
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1382  			mode =3D GPIOD_OUT_LOW;
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1383  =

8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1384  		/* We can't use devm here because we need to do the get
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1385  		 * against the MFD device, as that is where the of_node
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1386  		 * will reside, but if we devm against that the GPIO
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1387  		 * will not be freed if the extcon driver is unloaded.
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1388  		 */
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1389  		info->micd_pol_gpio =3D gpiod_get_optional(arizona->dev,
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1390  							 "wlf,micd-pol",
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1391  							 GPIOD_OUT_LOW);
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1392  		if (IS_ERR(info->micd_pol_gpio)) {
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1393  			ret =3D PTR_ERR(info->micd_pol_gpio);
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1394  			dev_err(arizona->dev,
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1395  				"Failed to get microphone polarity GPIO: %d\n",
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1396  				ret);
b2e5575a8d0402 drivers/extcon/extcon-arizona.c Dinghao Liu        2020-05-2=
3  1397  			return ret;
8e5838dd7b8c22 drivers/extcon/extcon-arizona.c Charles Keepax     2015-06-1=
9  1398  		}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1399  	}
f2c32a882d2c1c drivers/extcon/extcon-arizona.c Mark Brown         2012-06-2=
4  1400  =

1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1401  	if (arizona->pdata.hpdet_id_gpio > 0) {
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1402  		ret =3D devm_gpio_request_one(dev, arizona->pdata.hpdet_id_gpio,
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1403  					    GPIOF_OUT_INIT_LOW,
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1404  					    "HPDET");
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1405  		if (ret !=3D 0) {
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1406  			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1407  				arizona->pdata.hpdet_id_gpio, ret);
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1408  			gpiod_put(info->micd_pol_gpio);
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1409  			return ret;
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1410  		}
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1411  	}
1eda6aa7ce101b drivers/extcon/extcon-arizona.c Mark Brown         2013-01-1=
1  1412  =

b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1413  	return 0;
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1414  }
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1415  EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
b10945bca354de sound/soc/codecs/arizona-jack.c Hans de Goede      2021-03-0=
7  1416  =


:::::: The code at line 1380 was first introduced by commit
:::::: 8e5838dd7b8c226cca235aa64c2f210517ef9b64 extcon: arizona: Use gpiod =
inteface to handle micd_pol_gpio gpio

:::::: TO: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
:::::: CC: Chanwoo Choi <cw00.choi@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6157664475067125290==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
XVVWlCx3OPvX/wNATLRfiCsCAA==
--===============6157664475067125290==--

