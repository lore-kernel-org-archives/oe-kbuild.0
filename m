Content-Type: multipart/mixed; boundary="===============5179045634928942821=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 27 Aug 2022 08:36:17 +0800
Message-ID: <202208270807.9mfYwDHv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5179045634928942821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Justin Stitt <jstitt007@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e022620b5d056e822e42eb9bc0f24fcb97389d86
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h:=
 move explicit cast outside ternary
date:   2 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 months ago
config: sparc-randconfig-s043-20220827 (https://download.01.org/0day-ci/arc=
hive/20220827/202208270807.9mfYwDHv-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc SHELL=3D/bin/bash drivers/staging/rtl8712/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to r=
estricted __le32
>> drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse: sparse: incorrect=
 type in assignment (different base types) @@     expected restricted __le3=
2 [usertype] Privacy @@     got unsigned int [usertype] @@
   drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse:     expected rest=
ricted __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse:     got unsigned =
int [usertype]
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: cast to r=
estricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: too many =
warnings
--
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse:     expected unsig=
ned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] SsidLength @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse:     expected unsig=
ned int [usertype] SsidLength
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: incorrect =
type in argument 1 (different base types) @@     expected unsigned int [use=
rtype] val @@     got restricted __le32 [usertype] Privacy @@
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse:     expected unsig=
ned int [usertype] val
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse:     got restricted=
 __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from =
restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from =
restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from =
restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from =
restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected signed int [usert=
ype] Rssi @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse:     expected signe=
d int [usertype] Rssi
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int enum=
 NDIS_802_11_NETWORK_TYPE NetworkTypeInUse @@     got restricted __le32 [us=
ertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse:     expected unsig=
ned int enum NDIS_802_11_NETWORK_TYPE NetworkTypeInUse
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] ATIMWindow @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse:     expected unsig=
ned int [usertype] ATIMWindow
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] BeaconPeriod @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse:     expected unsig=
ned int [usertype] BeaconPeriod
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] DSConfig @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse:     expected unsig=
ned int [usertype] DSConfig
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] DwellTime @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse:     expected unsig=
ned int [usertype] DwellTime
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] HopPattern @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse:     expected unsig=
ned int [usertype] HopPattern
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] HopSet @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse:     expected unsig=
ned int [usertype] HopSet
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse:     expected unsig=
ned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse:     expected unsig=
ned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int enum=
 NDIS_802_11_NETWORK_INFRASTRUCTURE InfrastructureMode @@     got restricte=
d __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse:     expected unsig=
ned int enum NDIS_802_11_NETWORK_INFRASTRUCTURE InfrastructureMode
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected unsigned int [use=
rtype] IELength @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse:     expected unsig=
ned int [usertype] IELength
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse:     got restricted=
 __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to re=
stricted __le32
>> drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse: sparse: incorrect =
type in assignment (different base types) @@     expected restricted __le32=
 [usertype] Privacy @@     got unsigned int [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse:     expected restr=
icted __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse:     got unsigned i=
nt [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to re=
stricted __le32

vim +457 drivers/staging/rtl8712/rtl871x_mlme.c

2865d42c78a912 Larry Finger        2010-08-20  444  =

2865d42c78a912 Larry Finger        2010-08-20  445  void r8712_survey_event=
_callback(struct _adapter *adapter, u8 *pbuf)
2865d42c78a912 Larry Finger        2010-08-20  446  {
2865d42c78a912 Larry Finger        2010-08-20  447  	unsigned long flags;
2865d42c78a912 Larry Finger        2010-08-20  448  	u32 len;
44367877c6c504 Joshua Clayton      2015-08-05  449  	struct wlan_bssid_ex *=
pnetwork;
2865d42c78a912 Larry Finger        2010-08-20  450  	struct mlme_priv *pmlm=
epriv =3D &adapter->mlmepriv;
2865d42c78a912 Larry Finger        2010-08-20  451  =

44367877c6c504 Joshua Clayton      2015-08-05  452  	pnetwork =3D (struct w=
lan_bssid_ex *)pbuf;
2865d42c78a912 Larry Finger        2010-08-20  453  #ifdef __BIG_ENDIAN
2865d42c78a912 Larry Finger        2010-08-20  454  	/* endian_convert */
2865d42c78a912 Larry Finger        2010-08-20  455  	pnetwork->Length =3D l=
e32_to_cpu(pnetwork->Length);
2865d42c78a912 Larry Finger        2010-08-20  456  	pnetwork->Ssid.SsidLen=
gth =3D le32_to_cpu(pnetwork->Ssid.SsidLength);
2865d42c78a912 Larry Finger        2010-08-20 @457  	pnetwork->Privacy =3D =
le32_to_cpu(pnetwork->Privacy);
2865d42c78a912 Larry Finger        2010-08-20  458  	pnetwork->Rssi =3D le3=
2_to_cpu(pnetwork->Rssi);
2865d42c78a912 Larry Finger        2010-08-20  459  	pnetwork->NetworkTypeI=
nUse =3D le32_to_cpu(pnetwork->NetworkTypeInUse);
2865d42c78a912 Larry Finger        2010-08-20  460  	pnetwork->Configuratio=
n.ATIMWindow =3D
2865d42c78a912 Larry Finger        2010-08-20  461  		 le32_to_cpu(pnetwork=
->Configuration.ATIMWindow);
2865d42c78a912 Larry Finger        2010-08-20  462  	pnetwork->Configuratio=
n.BeaconPeriod =3D
2865d42c78a912 Larry Finger        2010-08-20  463  		 le32_to_cpu(pnetwork=
->Configuration.BeaconPeriod);
2865d42c78a912 Larry Finger        2010-08-20  464  	pnetwork->Configuratio=
n.DSConfig =3D
2865d42c78a912 Larry Finger        2010-08-20  465  		 le32_to_cpu(pnetwork=
->Configuration.DSConfig);
2865d42c78a912 Larry Finger        2010-08-20  466  	pnetwork->Configuratio=
n.FHConfig.DwellTime =3D
2865d42c78a912 Larry Finger        2010-08-20  467  		 le32_to_cpu(pnetwork=
->Configuration.FHConfig.DwellTime);
2865d42c78a912 Larry Finger        2010-08-20  468  	pnetwork->Configuratio=
n.FHConfig.HopPattern =3D
2865d42c78a912 Larry Finger        2010-08-20  469  		 le32_to_cpu(pnetwork=
->Configuration.FHConfig.HopPattern);
2865d42c78a912 Larry Finger        2010-08-20  470  	pnetwork->Configuratio=
n.FHConfig.HopSet =3D
2865d42c78a912 Larry Finger        2010-08-20  471  		 le32_to_cpu(pnetwork=
->Configuration.FHConfig.HopSet);
2865d42c78a912 Larry Finger        2010-08-20  472  	pnetwork->Configuratio=
n.FHConfig.Length =3D
2865d42c78a912 Larry Finger        2010-08-20  473  		 le32_to_cpu(pnetwork=
->Configuration.FHConfig.Length);
2865d42c78a912 Larry Finger        2010-08-20  474  	pnetwork->Configuratio=
n.Length =3D
2865d42c78a912 Larry Finger        2010-08-20  475  		 le32_to_cpu(pnetwork=
->Configuration.Length);
2865d42c78a912 Larry Finger        2010-08-20  476  	pnetwork->Infrastructu=
reMode =3D
2865d42c78a912 Larry Finger        2010-08-20  477  		 le32_to_cpu(pnetwork=
->InfrastructureMode);
2865d42c78a912 Larry Finger        2010-08-20  478  	pnetwork->IELength =3D=
 le32_to_cpu(pnetwork->IELength);
2865d42c78a912 Larry Finger        2010-08-20  479  #endif
986fc8e7410d65 Joshua Clayton      2015-08-05  480  	len =3D r8712_get_wlan=
_bssid_ex_sz(pnetwork);
2865d42c78a912 Larry Finger        2010-08-20  481  	if (len > sizeof(struc=
t wlan_bssid_ex))
2865d42c78a912 Larry Finger        2010-08-20  482  		return;
2865d42c78a912 Larry Finger        2010-08-20  483  	spin_lock_irqsave(&pml=
mepriv->lock2, flags);
2865d42c78a912 Larry Finger        2010-08-20  484  	/* update IBSS_network=
 's timestamp */
1ca96884b12dd2 Luis de Bethencourt 2015-10-19  485  	if (check_fwstate(pmlm=
epriv, WIFI_ADHOC_MASTER_STATE)) {
2865d42c78a912 Larry Finger        2010-08-20  486  		if (!memcmp(&(pmlmepr=
iv->cur_network.network.MacAddress),
2865d42c78a912 Larry Finger        2010-08-20  487  		    pnetwork->MacAddr=
ess, ETH_ALEN)) {
2865d42c78a912 Larry Finger        2010-08-20  488  			struct wlan_network =
*ibss_wlan =3D NULL;
2865d42c78a912 Larry Finger        2010-08-20  489  =

2865d42c78a912 Larry Finger        2010-08-20  490  			memcpy(pmlmepriv->cu=
r_network.network.IEs,
2865d42c78a912 Larry Finger        2010-08-20  491  				pnetwork->IEs, 8);
2865d42c78a912 Larry Finger        2010-08-20  492  			ibss_wlan =3D r8712_=
find_network(
2865d42c78a912 Larry Finger        2010-08-20  493  						&pmlmepriv->scann=
ed_queue,
2865d42c78a912 Larry Finger        2010-08-20  494  						pnetwork->MacAddr=
ess);
7c19c1e80d348a Julia Lawall        2011-10-29  495  			if (ibss_wlan) {
2865d42c78a912 Larry Finger        2010-08-20  496  				memcpy(ibss_wlan->n=
etwork.IEs,
2865d42c78a912 Larry Finger        2010-08-20  497  					pnetwork->IEs, 8);
2865d42c78a912 Larry Finger        2010-08-20  498  				goto exit;
2865d42c78a912 Larry Finger        2010-08-20  499  			}
2865d42c78a912 Larry Finger        2010-08-20  500  		}
2865d42c78a912 Larry Finger        2010-08-20  501  	}
2865d42c78a912 Larry Finger        2010-08-20  502  	/* lock pmlmepriv->loc=
k when you accessing network_q */
1ca96884b12dd2 Luis de Bethencourt 2015-10-19  503  	if (!check_fwstate(pml=
mepriv, _FW_UNDER_LINKING)) {
168a2c10288d78 Luis de Bethencourt 2015-10-19  504  		if (pnetwork->Ssid.Ss=
id[0] !=3D 0) {
2865d42c78a912 Larry Finger        2010-08-20  505  			rtl8711_add_network(=
adapter, pnetwork);
168a2c10288d78 Luis de Bethencourt 2015-10-19  506  		} else {
2865d42c78a912 Larry Finger        2010-08-20  507  			pnetwork->Ssid.SsidL=
ength =3D 8;
2865d42c78a912 Larry Finger        2010-08-20  508  			memcpy(pnetwork->Ssi=
d.Ssid, "<hidden>", 8);
2865d42c78a912 Larry Finger        2010-08-20  509  			rtl8711_add_network(=
adapter, pnetwork);
2865d42c78a912 Larry Finger        2010-08-20  510  		}
2865d42c78a912 Larry Finger        2010-08-20  511  	}
2865d42c78a912 Larry Finger        2010-08-20  512  exit:
2865d42c78a912 Larry Finger        2010-08-20  513  	spin_unlock_irqrestore=
(&pmlmepriv->lock2, flags);
2865d42c78a912 Larry Finger        2010-08-20  514  }
2865d42c78a912 Larry Finger        2010-08-20  515  =


:::::: The code at line 457 was first introduced by commit
:::::: 2865d42c78a9121caad52cb02d1fbb7f5cdbc4ef staging: r8712u: Add the ne=
w driver to the mainline kernel

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Larry Finger <Larry.Finger@lwfinger.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5179045634928942821==--

