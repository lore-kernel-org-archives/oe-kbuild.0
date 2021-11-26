Content-Type: multipart/mixed; boundary="===============4630147181587077365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/intel/skylake/skl-topology.c:2070:50: sparse: sparse: restricted __le32 degrades to integer
Date: Sat, 27 Nov 2021 06:50:49 +0800
Message-ID: <202111270657.QXpJYB4F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4630147181587077365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: 1b99d50b9709a2cddaba4a7faf1862b4f7bec865 ASoC: Intel: Skylake: Comp=
ile when any configuration is selected
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-s001-20211118 (https://download.01.org/0day-ci/arch=
ive/20211127/202111270657.QXpJYB4F-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1b99d50b9709a2cddaba4a7faf1862b4f7bec865
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1b99d50b9709a2cddaba4a7faf1862b4f7bec865
        # save the config file to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash sound/soc/intel/skylake/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> sound/soc/intel/skylake/skl-topology.c:2070:50: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2089:22: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] ppl_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2089:22: sparse:     expected uns=
igned char [usertype] ppl_id
   sound/soc/intel/skylake/skl-topology.c:2089:22: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2104:21: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2123:47: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected int module_id @=
@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2123:47: sparse:     expected int=
 module_id
   sound/soc/intel/skylake/skl-topology.c:2123:47: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2127:49: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] instance_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2127:49: sparse:     expected uns=
igned int [usertype] instance_id
   sound/soc/intel/skylake/skl-topology.c:2127:49: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2121:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2121:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2121:25: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2292:34: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] pin_index @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2292:34: sparse:     expected uns=
igned char [usertype] pin_index
   sound/soc/intel/skylake/skl-topology.c:2292:34: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2296:33: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] buf_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2296:33: sparse:     expected uns=
igned int [usertype] buf_size
   sound/soc/intel/skylake/skl-topology.c:2296:33: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2290:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2290:25: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2323:38: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] dma_buffer_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2323:38: sparse:     expected uns=
igned int [usertype] dma_buffer_size
   sound/soc/intel/skylake/skl-topology.c:2323:38: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2327:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] cpc @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2327:26: sparse:     expected uns=
igned int [usertype] cpc
   sound/soc/intel/skylake/skl-topology.c:2327:26: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2331:31: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] is_pages @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2331:31: sparse:     expected uns=
igned int [usertype] is_pages
   sound/soc/intel/skylake/skl-topology.c:2331:31: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2335:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] obs @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2335:26: sparse:     expected uns=
igned int [usertype] obs
   sound/soc/intel/skylake/skl-topology.c:2335:26: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2339:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] ibs @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2339:26: sparse:     expected uns=
igned int [usertype] ibs
   sound/soc/intel/skylake/skl-topology.c:2339:26: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2321:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2391:21: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2396:49: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] max_input_pins @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2396:49: sparse:     expected uns=
igned char [usertype] max_input_pins
   sound/soc/intel/skylake/skl-topology.c:2396:49: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2400:50: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] max_output_pins @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2400:50: sparse:     expected uns=
igned char [usertype] max_output_pins
   sound/soc/intel/skylake/skl-topology.c:2400:50: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2413:55: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] value @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2413:55: sparse:     expected uns=
igned int [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2413:55: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2426:55: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] value @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2426:55: sparse:     expected uns=
igned int [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2426:55: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2430:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] time_slot @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2430:36: sparse:     expected uns=
igned char [usertype] time_slot
   sound/soc/intel/skylake/skl-topology.c:2430:36: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2434:34: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] core_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2434:34: sparse:     expected uns=
igned char [usertype] core_id
   sound/soc/intel/skylake/skl-topology.c:2434:34: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2438:33: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um skl_module_type m_type @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2438:33: sparse:     expected uns=
igned int enum skl_module_type m_type
   sound/soc/intel/skylake/skl-topology.c:2438:33: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2442:35: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] dev_type @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2442:35: sparse:     expected uns=
igned char [usertype] dev_type
   sound/soc/intel/skylake/skl-topology.c:2442:35: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2446:39: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um skl_hw_conn_type hw_conn_type @@     got restricted __le32 [usertype] va=
lue @@
   sound/soc/intel/skylake/skl-topology.c:2446:39: sparse:     expected uns=
igned int enum skl_hw_conn_type hw_conn_type
   sound/soc/intel/skylake/skl-topology.c:2446:39: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2450:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] instance_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2450:41: sparse:     expected uns=
igned int [usertype] instance_id
   sound/soc/intel/skylake/skl-topology.c:2450:41: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2465:34: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] vbus_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2465:34: sparse:     expected uns=
igned int [usertype] vbus_id
   sound/soc/intel/skylake/skl-topology.c:2465:34: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2469:39: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] params_fixup @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2469:39: sparse:     expected uns=
igned int [usertype] params_fixup
   sound/soc/intel/skylake/skl-topology.c:2469:39: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2473:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] converter @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2473:36: sparse:     expected uns=
igned int [usertype] converter
   sound/soc/intel/skylake/skl-topology.c:2473:36: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2477:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um d0i3_capability d0i3_caps @@     got restricted __le32 [usertype] value =
@@
   sound/soc/intel/skylake/skl-topology.c:2477:36: sparse:     expected uns=
igned int enum d0i3_capability d0i3_caps
   sound/soc/intel/skylake/skl-topology.c:2477:36: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2495:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected int static conf=
_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2495:26: sparse:     expected int=
 static conf_idx
   sound/soc/intel/skylake/skl-topology.c:2495:26: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2506:49: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2506:49: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2506:49: sparse:     got restrict=
ed __le32 [usertype] token
>> sound/soc/intel/skylake/skl-topology.c:2506:66: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] tkn_val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2506:66: sparse:     expected uns=
igned int [usertype] tkn_val
   sound/soc/intel/skylake/skl-topology.c:2506:66: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2519:49: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2519:49: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2519:49: sparse:     got restrict=
ed __le32 [usertype] token
   sound/soc/intel/skylake/skl-topology.c:2519:66: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] tkn_val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2519:66: sparse:     expected uns=
igned int [usertype] tkn_val
   sound/soc/intel/skylake/skl-topology.c:2519:66: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2527:52: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] res_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2527:52: sparse:     expected uns=
igned char [usertype] res_idx
   sound/soc/intel/skylake/skl-topology.c:2527:52: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2531:52: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] fmt_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2531:52: sparse:     expected uns=
igned char [usertype] fmt_idx
   sound/soc/intel/skylake/skl-topology.c:2531:52: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2540:31: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2541:38: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2554:68: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2554:68: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2554:68: sparse:     got restrict=
ed __le32 [usertype] token
>> sound/soc/intel/skylake/skl-topology.c:2555:41: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2555:41: sparse:     expected uns=
igned int [usertype] val
   sound/soc/intel/skylake/skl-topology.c:2555:41: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2574:51: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] caps_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2574:51: sparse:     expected uns=
igned int [usertype] caps_size
   sound/soc/intel/skylake/skl-topology.c:2574:51: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2580:52: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] set_params @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2580:52: sparse:     expected uns=
igned int [usertype] set_params
   sound/soc/intel/skylake/skl-topology.c:2580:52: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2585:50: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] param_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2585:50: sparse:     expected uns=
igned int [usertype] param_id
   sound/soc/intel/skylake/skl-topology.c:2585:50: sparse:     got restrict=
ed __le32 [usertype] value
>> sound/soc/intel/skylake/skl-topology.c:2590:33: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] domain @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2590:33: sparse:     expected uns=
igned char [usertype] domain
   sound/soc/intel/skylake/skl-topology.c:2590:33: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2596:42: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] dma_buffer_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2596:42: sparse:     expected uns=
igned int [usertype] dma_buffer_size
   sound/soc/intel/skylake/skl-topology.c:2596:42: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2394:25: sparse: sparse: too many=
 warnings

vim +2070 sound/soc/intel/skylake/skl-topology.c

3af36706ff6c4ea Vinod Koul        2015-10-07  2056  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2057  /*
6277e83292a2d4d Shreyas NC        2016-08-12  2058   * Add pipeline by pars=
ing the relevant tokens
6277e83292a2d4d Shreyas NC        2016-08-12  2059   * Return an existing p=
ipe if the pipe already exists.
3af36706ff6c4ea Vinod Koul        2015-10-07  2060   */
6277e83292a2d4d Shreyas NC        2016-08-12  2061  static int skl_tplg_add=
_pipe(struct device *dev,
bcc2a2dc3ba8c3a Cezary Rojewski   2019-07-23  2062  		struct skl_module_cfg=
 *mconfig, struct skl_dev *skl,
6277e83292a2d4d Shreyas NC        2016-08-12  2063  		struct snd_soc_tplg_v=
endor_value_elem *tkn_elem)
3af36706ff6c4ea Vinod Koul        2015-10-07  2064  {
3af36706ff6c4ea Vinod Koul        2015-10-07  2065  	struct skl_pipeline *p=
pl;
3af36706ff6c4ea Vinod Koul        2015-10-07  2066  	struct skl_pipe *pipe;
3af36706ff6c4ea Vinod Koul        2015-10-07  2067  	struct skl_pipe_params=
 *params;
3af36706ff6c4ea Vinod Koul        2015-10-07  2068  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2069  	list_for_each_entry(pp=
l, &skl->ppl_list, node) {
6277e83292a2d4d Shreyas NC        2016-08-12 @2070  		if (ppl->pipe->ppl_id=
 =3D=3D tkn_elem->value) {
6277e83292a2d4d Shreyas NC        2016-08-12  2071  			mconfig->pipe =3D pp=
l->pipe;
081dc8ab46df853 Guneshwor Singh   2017-04-27  2072  			return -EEXIST;
6277e83292a2d4d Shreyas NC        2016-08-12  2073  		}
3af36706ff6c4ea Vinod Koul        2015-10-07  2074  	}
3af36706ff6c4ea Vinod Koul        2015-10-07  2075  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2076  	ppl =3D devm_kzalloc(d=
ev, sizeof(*ppl), GFP_KERNEL);
3af36706ff6c4ea Vinod Koul        2015-10-07  2077  	if (!ppl)
6277e83292a2d4d Shreyas NC        2016-08-12  2078  		return -ENOMEM;
3af36706ff6c4ea Vinod Koul        2015-10-07  2079  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2080  	pipe =3D devm_kzalloc(=
dev, sizeof(*pipe), GFP_KERNEL);
3af36706ff6c4ea Vinod Koul        2015-10-07  2081  	if (!pipe)
6277e83292a2d4d Shreyas NC        2016-08-12  2082  		return -ENOMEM;
3af36706ff6c4ea Vinod Koul        2015-10-07  2083  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2084  	params =3D devm_kzallo=
c(dev, sizeof(*params), GFP_KERNEL);
3af36706ff6c4ea Vinod Koul        2015-10-07  2085  	if (!params)
6277e83292a2d4d Shreyas NC        2016-08-12  2086  		return -ENOMEM;
3af36706ff6c4ea Vinod Koul        2015-10-07  2087  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2088  	pipe->p_params =3D par=
ams;
6277e83292a2d4d Shreyas NC        2016-08-12 @2089  	pipe->ppl_id =3D tkn_e=
lem->value;
3af36706ff6c4ea Vinod Koul        2015-10-07  2090  	INIT_LIST_HEAD(&pipe->=
w_list);
3af36706ff6c4ea Vinod Koul        2015-10-07  2091  =

3af36706ff6c4ea Vinod Koul        2015-10-07  2092  	ppl->pipe =3D pipe;
3af36706ff6c4ea Vinod Koul        2015-10-07  2093  	list_add(&ppl->node, &=
skl->ppl_list);
3af36706ff6c4ea Vinod Koul        2015-10-07  2094  =

6277e83292a2d4d Shreyas NC        2016-08-12  2095  	mconfig->pipe =3D pipe;
6277e83292a2d4d Shreyas NC        2016-08-12  2096  	mconfig->pipe->state =
=3D SKL_PIPE_INVALID;
6277e83292a2d4d Shreyas NC        2016-08-12  2097  =

6277e83292a2d4d Shreyas NC        2016-08-12  2098  	return 0;
6277e83292a2d4d Shreyas NC        2016-08-12  2099  }
6277e83292a2d4d Shreyas NC        2016-08-12  2100  =

9e0784d00e35e05 Andy Shevchenko   2019-06-19  2101  static int skl_tplg_get=
_uuid(struct device *dev, guid_t *guid,
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2102  	      struct snd_soc_t=
plg_vendor_uuid_elem *uuid_tkn)
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2103  {
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2104  	if (uuid_tkn->token =
=3D=3D SKL_TKN_UUID) {
cade2f59e7ae3d1 Andy Shevchenko   2020-04-22  2105  		import_guid(guid, uui=
d_tkn->uuid);
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2106  		return 0;
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2107  	}
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2108  =

22ebd6666efd866 Sriram Periyasamy 2017-11-07  2109  	dev_err(dev, "Not an U=
UID token %d\n", uuid_tkn->token);
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2110  =

22ebd6666efd866 Sriram Periyasamy 2017-11-07  2111  	return -EINVAL;
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2112  }
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2113  =

22ebd6666efd866 Sriram Periyasamy 2017-11-07  2114  static int skl_tplg_fil=
l_pin(struct device *dev,
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2115  			struct snd_soc_tplg_=
vendor_value_elem *tkn_elem,
6277e83292a2d4d Shreyas NC        2016-08-12  2116  			struct skl_module_pi=
n *m_pin,
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2117  			int pin_index)
6277e83292a2d4d Shreyas NC        2016-08-12  2118  {
d956147473ec184 Sriram Periyasamy 2017-11-07  2119  	int ret;
d956147473ec184 Sriram Periyasamy 2017-11-07  2120  =

22ebd6666efd866 Sriram Periyasamy 2017-11-07  2121  	switch (tkn_elem->toke=
n) {
6277e83292a2d4d Shreyas NC        2016-08-12  2122  	case SKL_TKN_U32_PIN_M=
OD_ID:
22ebd6666efd866 Sriram Periyasamy 2017-11-07 @2123  		m_pin[pin_index].id.m=
odule_id =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC        2016-08-12  2124  		break;
6277e83292a2d4d Shreyas NC        2016-08-12  2125  =

6277e83292a2d4d Shreyas NC        2016-08-12  2126  	case SKL_TKN_U32_PIN_I=
NST_ID:
22ebd6666efd866 Sriram Periyasamy 2017-11-07 @2127  		m_pin[pin_index].id.i=
nstance_id =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC        2016-08-12  2128  		break;
6277e83292a2d4d Shreyas NC        2016-08-12  2129  =

d956147473ec184 Sriram Periyasamy 2017-11-07  2130  	case SKL_TKN_UUID:
9e0784d00e35e05 Andy Shevchenko   2019-06-19  2131  		ret =3D skl_tplg_get_=
uuid(dev, &m_pin[pin_index].id.mod_uuid,
d956147473ec184 Sriram Periyasamy 2017-11-07  2132  			(struct snd_soc_tplg=
_vendor_uuid_elem *)tkn_elem);
d956147473ec184 Sriram Periyasamy 2017-11-07  2133  		if (ret < 0)
d956147473ec184 Sriram Periyasamy 2017-11-07  2134  			return ret;
d956147473ec184 Sriram Periyasamy 2017-11-07  2135  =

6277e83292a2d4d Shreyas NC        2016-08-12  2136  		break;
6277e83292a2d4d Shreyas NC        2016-08-12  2137  =

6277e83292a2d4d Shreyas NC        2016-08-12  2138  	default:
22ebd6666efd866 Sriram Periyasamy 2017-11-07  2139  		dev_err(dev, "%d Not =
a pin token\n", tkn_elem->token);
6277e83292a2d4d Shreyas NC        2016-08-12  2140  		return -EINVAL;
6277e83292a2d4d Shreyas NC        2016-08-12  2141  	}
6277e83292a2d4d Shreyas NC        2016-08-12  2142  =

6277e83292a2d4d Shreyas NC        2016-08-12  2143  	return 0;
6277e83292a2d4d Shreyas NC        2016-08-12  2144  }
6277e83292a2d4d Shreyas NC        2016-08-12  2145  =


:::::: The code at line 2070 was first introduced by commit
:::::: 6277e83292a2d4d88d150c0eb3004bd714ad8728 ASoC: Intel: Skylake: Parse=
 vendor tokens to build module data

:::::: TO: Shreyas NC <shreyas.nc@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4630147181587077365==--

