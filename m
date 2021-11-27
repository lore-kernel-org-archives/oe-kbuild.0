Content-Type: multipart/mixed; boundary="===============5624862269181911203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/intel/skylake/skl-topology.c:2578:38: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 27 Nov 2021 08:33:57 +0800
Message-ID: <202111270849.KeW4CcjJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5624862269181911203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kareem Shaik <kareem.m.shaik@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c5c17547b778975b3d83a73c8d84e8fb5ecf3ba5
commit: a4ad42d28618eef83bee02e0a19af0d467bd9722 ASoC: Intel: Skylake: Supp=
ort multiple format configs
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-s001-20211118 (https://download.01.org/0day-ci/arch=
ive/20211127/202111270849.KeW4CcjJ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da4ad42d28618eef83bee02e0a19af0d467bd9722
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a4ad42d28618eef83bee02e0a19af0d467bd9722
        # save the config file to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash sound/soc/intel/skylake/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   sound/soc/intel/skylake/skl-topology.c:2297:33: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2291:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2291:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2324:38: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] dma_buffer_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2324:38: sparse:     expected uns=
igned int [usertype] dma_buffer_size
   sound/soc/intel/skylake/skl-topology.c:2324:38: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2328:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] cpc @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2328:26: sparse:     expected uns=
igned int [usertype] cpc
   sound/soc/intel/skylake/skl-topology.c:2328:26: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2332:31: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] is_pages @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2332:31: sparse:     expected uns=
igned int [usertype] is_pages
   sound/soc/intel/skylake/skl-topology.c:2332:31: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2336:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] obs @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2336:26: sparse:     expected uns=
igned int [usertype] obs
   sound/soc/intel/skylake/skl-topology.c:2336:26: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2340:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] ibs @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2340:26: sparse:     expected uns=
igned int [usertype] ibs
   sound/soc/intel/skylake/skl-topology.c:2340:26: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2322:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2392:21: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2397:49: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] max_input_pins @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2397:49: sparse:     expected uns=
igned char [usertype] max_input_pins
   sound/soc/intel/skylake/skl-topology.c:2397:49: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2401:50: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] max_output_pins @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2401:50: sparse:     expected uns=
igned char [usertype] max_output_pins
   sound/soc/intel/skylake/skl-topology.c:2401:50: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2414:55: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] value @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2414:55: sparse:     expected uns=
igned int [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2414:55: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2427:55: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] value @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2427:55: sparse:     expected uns=
igned int [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2427:55: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2431:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] time_slot @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2431:36: sparse:     expected uns=
igned char [usertype] time_slot
   sound/soc/intel/skylake/skl-topology.c:2431:36: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2435:34: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] core_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2435:34: sparse:     expected uns=
igned char [usertype] core_id
   sound/soc/intel/skylake/skl-topology.c:2435:34: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2439:33: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um skl_module_type m_type @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2439:33: sparse:     expected uns=
igned int enum skl_module_type m_type
   sound/soc/intel/skylake/skl-topology.c:2439:33: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2443:35: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] dev_type @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2443:35: sparse:     expected uns=
igned char [usertype] dev_type
   sound/soc/intel/skylake/skl-topology.c:2443:35: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2447:39: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um skl_hw_conn_type hw_conn_type @@     got restricted __le32 [usertype] va=
lue @@
   sound/soc/intel/skylake/skl-topology.c:2447:39: sparse:     expected uns=
igned int enum skl_hw_conn_type hw_conn_type
   sound/soc/intel/skylake/skl-topology.c:2447:39: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2451:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] instance_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2451:41: sparse:     expected uns=
igned int [usertype] instance_id
   sound/soc/intel/skylake/skl-topology.c:2451:41: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2466:34: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] vbus_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2466:34: sparse:     expected uns=
igned int [usertype] vbus_id
   sound/soc/intel/skylake/skl-topology.c:2466:34: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2470:39: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] params_fixup @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2470:39: sparse:     expected uns=
igned int [usertype] params_fixup
   sound/soc/intel/skylake/skl-topology.c:2470:39: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2474:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] converter @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2474:36: sparse:     expected uns=
igned int [usertype] converter
   sound/soc/intel/skylake/skl-topology.c:2474:36: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2478:36: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int en=
um d0i3_capability d0i3_caps @@     got restricted __le32 [usertype] value =
@@
   sound/soc/intel/skylake/skl-topology.c:2478:36: sparse:     expected uns=
igned int enum d0i3_capability d0i3_caps
   sound/soc/intel/skylake/skl-topology.c:2478:36: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2496:26: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected int static conf=
_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2496:26: sparse:     expected int=
 static conf_idx
   sound/soc/intel/skylake/skl-topology.c:2496:26: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2507:49: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2507:49: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2507:49: sparse:     got restrict=
ed __le32 [usertype] token
   sound/soc/intel/skylake/skl-topology.c:2507:66: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] tkn_val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2507:66: sparse:     expected uns=
igned int [usertype] tkn_val
   sound/soc/intel/skylake/skl-topology.c:2507:66: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2520:49: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2520:49: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2520:49: sparse:     got restrict=
ed __le32 [usertype] token
   sound/soc/intel/skylake/skl-topology.c:2520:66: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] tkn_val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2520:66: sparse:     expected uns=
igned int [usertype] tkn_val
   sound/soc/intel/skylake/skl-topology.c:2520:66: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2528:52: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] res_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2528:52: sparse:     expected uns=
igned char [usertype] res_idx
   sound/soc/intel/skylake/skl-topology.c:2528:52: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2532:52: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] fmt_idx @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2532:52: sparse:     expected uns=
igned char [usertype] fmt_idx
   sound/soc/intel/skylake/skl-topology.c:2532:52: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2541:31: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2542:38: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2555:68: sparse: sparse: incorrec=
t type in argument 3 (different base types) @@     expected unsigned int [u=
sertype] tkn @@     got restricted __le32 [usertype] token @@
   sound/soc/intel/skylake/skl-topology.c:2555:68: sparse:     expected uns=
igned int [usertype] tkn
   sound/soc/intel/skylake/skl-topology.c:2555:68: sparse:     got restrict=
ed __le32 [usertype] token
   sound/soc/intel/skylake/skl-topology.c:2556:41: sparse: sparse: incorrec=
t type in argument 4 (different base types) @@     expected unsigned int [u=
sertype] val @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2556:41: sparse:     expected uns=
igned int [usertype] val
   sound/soc/intel/skylake/skl-topology.c:2556:41: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2575:29: sparse: sparse: restrict=
ed __le32 degrades to integer
>> sound/soc/intel/skylake/skl-topology.c:2578:38: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected int fmt_cfg_idx=
 @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2578:38: sparse:     expected int=
 fmt_cfg_idx
   sound/soc/intel/skylake/skl-topology.c:2578:38: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2582:73: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] caps_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2582:73: sparse:     expected uns=
igned int [usertype] caps_size
   sound/soc/intel/skylake/skl-topology.c:2582:73: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2588:74: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] set_params @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2588:74: sparse:     expected uns=
igned int [usertype] set_params
   sound/soc/intel/skylake/skl-topology.c:2588:74: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2593:72: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] param_id @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2593:72: sparse:     expected uns=
igned int [usertype] param_id
   sound/soc/intel/skylake/skl-topology.c:2593:72: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2598:33: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned char [=
usertype] domain @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2598:33: sparse:     expected uns=
igned char [usertype] domain
   sound/soc/intel/skylake/skl-topology.c:2598:33: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2604:42: sparse: sparse: incorrec=
t type in assignment (different base types) @@     expected unsigned int [u=
sertype] dma_buffer_size @@     got restricted __le32 [usertype] value @@
   sound/soc/intel/skylake/skl-topology.c:2604:42: sparse:     expected uns=
igned int [usertype] dma_buffer_size
   sound/soc/intel/skylake/skl-topology.c:2604:42: sparse:     got restrict=
ed __le32 [usertype] value
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: restrict=
ed __le32 degrades to integer
   sound/soc/intel/skylake/skl-topology.c:2395:25: sparse: sparse: too many=
 warnings

vim +2578 sound/soc/intel/skylake/skl-topology.c

db6ed55de6da112 Shreyas NC          2017-08-23  2365  =

6277e83292a2d4d Shreyas NC          2016-08-12  2366  /*
6277e83292a2d4d Shreyas NC          2016-08-12  2367   * Parse tokens to fi=
ll up the module private data
6277e83292a2d4d Shreyas NC          2016-08-12  2368   */
6277e83292a2d4d Shreyas NC          2016-08-12  2369  static int skl_tplg_g=
et_token(struct device *dev,
6277e83292a2d4d Shreyas NC          2016-08-12  2370  		struct snd_soc_tplg=
_vendor_value_elem *tkn_elem,
bcc2a2dc3ba8c3a Cezary Rojewski     2019-07-23  2371  		struct skl_dev *skl=
, struct skl_module_cfg *mconfig)
6277e83292a2d4d Shreyas NC          2016-08-12  2372  {
6277e83292a2d4d Shreyas NC          2016-08-12  2373  	int tkn_count =3D 0;
6277e83292a2d4d Shreyas NC          2016-08-12  2374  	int ret;
6277e83292a2d4d Shreyas NC          2016-08-12  2375  	static int is_pipe_e=
xists;
f6fa56e22559ade Ramesh Babu         2017-08-23  2376  	static int pin_index=
, dir, conf_idx;
f6fa56e22559ade Ramesh Babu         2017-08-23  2377  	struct skl_module_if=
ace *iface =3D NULL;
f6fa56e22559ade Ramesh Babu         2017-08-23  2378  	struct skl_module_re=
s *res =3D NULL;
f6fa56e22559ade Ramesh Babu         2017-08-23  2379  	int res_idx =3D mcon=
fig->res_idx;
f6fa56e22559ade Ramesh Babu         2017-08-23  2380  	int fmt_idx =3D mcon=
fig->fmt_idx;
f6fa56e22559ade Ramesh Babu         2017-08-23  2381  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2382  	/*
f6fa56e22559ade Ramesh Babu         2017-08-23  2383  	 * If the manifest s=
tructure contains no modules, fill all
f6fa56e22559ade Ramesh Babu         2017-08-23  2384  	 * the module data t=
o 0th index.
f6fa56e22559ade Ramesh Babu         2017-08-23  2385  	 * res_idx and fmt_i=
dx are default set to 0.
f6fa56e22559ade Ramesh Babu         2017-08-23  2386  	 */
f6fa56e22559ade Ramesh Babu         2017-08-23  2387  	if (skl->nr_modules =
=3D=3D 0) {
f6fa56e22559ade Ramesh Babu         2017-08-23  2388  		res =3D &mconfig->m=
odule->resources[res_idx];
f6fa56e22559ade Ramesh Babu         2017-08-23  2389  		iface =3D &mconfig-=
>module->formats[fmt_idx];
f6fa56e22559ade Ramesh Babu         2017-08-23  2390  	}
6277e83292a2d4d Shreyas NC          2016-08-12  2391  =

6277e83292a2d4d Shreyas NC          2016-08-12  2392  	if (tkn_elem->token =
> SKL_TKN_MAX)
6277e83292a2d4d Shreyas NC          2016-08-12  2393  		return -EINVAL;
6277e83292a2d4d Shreyas NC          2016-08-12  2394  =

6277e83292a2d4d Shreyas NC          2016-08-12  2395  	switch (tkn_elem->to=
ken) {
6277e83292a2d4d Shreyas NC          2016-08-12  2396  	case SKL_TKN_U8_IN_Q=
UEUE_COUNT:
f6fa56e22559ade Ramesh Babu         2017-08-23  2397  		mconfig->module->ma=
x_input_pins =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2398  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2399  =

6277e83292a2d4d Shreyas NC          2016-08-12  2400  	case SKL_TKN_U8_OUT_=
QUEUE_COUNT:
f6fa56e22559ade Ramesh Babu         2017-08-23  2401  		mconfig->module->ma=
x_output_pins =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2402  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2403  =

6277e83292a2d4d Shreyas NC          2016-08-12  2404  	case SKL_TKN_U8_DYN_=
IN_PIN:
f6fa56e22559ade Ramesh Babu         2017-08-23  2405  		if (!mconfig->m_in_=
pin)
a86854d0c599b32 Kees Cook           2018-06-12  2406  			mconfig->m_in_pin =
=3D
a86854d0c599b32 Kees Cook           2018-06-12  2407  				devm_kcalloc(dev,=
 MAX_IN_QUEUE,
a86854d0c599b32 Kees Cook           2018-06-12  2408  					     sizeof(*mco=
nfig->m_in_pin),
a86854d0c599b32 Kees Cook           2018-06-12  2409  					     GFP_KERNEL);
6277e83292a2d4d Shreyas NC          2016-08-12  2410  		if (!mconfig->m_in_=
pin)
6277e83292a2d4d Shreyas NC          2016-08-12  2411  			return -ENOMEM;
6277e83292a2d4d Shreyas NC          2016-08-12  2412  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2413  		skl_tplg_fill_pin_d=
ynamic_val(mconfig->m_in_pin, MAX_IN_QUEUE,
f6fa56e22559ade Ramesh Babu         2017-08-23  2414  					      tkn_elem->=
value);
6277e83292a2d4d Shreyas NC          2016-08-12  2415  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2416  =

6277e83292a2d4d Shreyas NC          2016-08-12  2417  	case SKL_TKN_U8_DYN_=
OUT_PIN:
f6fa56e22559ade Ramesh Babu         2017-08-23  2418  		if (!mconfig->m_out=
_pin)
a86854d0c599b32 Kees Cook           2018-06-12  2419  			mconfig->m_out_pin=
 =3D
a86854d0c599b32 Kees Cook           2018-06-12  2420  				devm_kcalloc(dev,=
 MAX_IN_QUEUE,
a86854d0c599b32 Kees Cook           2018-06-12  2421  					     sizeof(*mco=
nfig->m_in_pin),
a86854d0c599b32 Kees Cook           2018-06-12  2422  					     GFP_KERNEL);
6277e83292a2d4d Shreyas NC          2016-08-12  2423  		if (!mconfig->m_out=
_pin)
6277e83292a2d4d Shreyas NC          2016-08-12  2424  			return -ENOMEM;
6277e83292a2d4d Shreyas NC          2016-08-12  2425  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2426  		skl_tplg_fill_pin_d=
ynamic_val(mconfig->m_out_pin, MAX_OUT_QUEUE,
f6fa56e22559ade Ramesh Babu         2017-08-23  2427  					      tkn_elem->=
value);
6277e83292a2d4d Shreyas NC          2016-08-12  2428  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2429  =

6277e83292a2d4d Shreyas NC          2016-08-12  2430  	case SKL_TKN_U8_TIME=
_SLOT:
6277e83292a2d4d Shreyas NC          2016-08-12  2431  		mconfig->time_slot =
=3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2432  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2433  =

6277e83292a2d4d Shreyas NC          2016-08-12  2434  	case SKL_TKN_U8_CORE=
_ID:
6277e83292a2d4d Shreyas NC          2016-08-12  2435  		mconfig->core_id =
=3D tkn_elem->value;
9c80c5a8831471e Takashi Iwai        2018-10-03  2436  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2437  =

6277e83292a2d4d Shreyas NC          2016-08-12  2438  	case SKL_TKN_U8_MOD_=
TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2439  		mconfig->m_type =3D=
 tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2440  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2441  =

6277e83292a2d4d Shreyas NC          2016-08-12  2442  	case SKL_TKN_U8_DEV_=
TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2443  		mconfig->dev_type =
=3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2444  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2445  =

6277e83292a2d4d Shreyas NC          2016-08-12  2446  	case SKL_TKN_U8_HW_C=
ONN_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2447  		mconfig->hw_conn_ty=
pe =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2448  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2449  =

6277e83292a2d4d Shreyas NC          2016-08-12  2450  	case SKL_TKN_U16_MOD=
_INST_ID:
6277e83292a2d4d Shreyas NC          2016-08-12  2451  		mconfig->id.instanc=
e_id =3D
6277e83292a2d4d Shreyas NC          2016-08-12  2452  		tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2453  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2454  =

6277e83292a2d4d Shreyas NC          2016-08-12  2455  	case SKL_TKN_U32_MEM=
_PAGES:
6277e83292a2d4d Shreyas NC          2016-08-12  2456  	case SKL_TKN_U32_MAX=
_MCPS:
6277e83292a2d4d Shreyas NC          2016-08-12  2457  	case SKL_TKN_U32_OBS:
6277e83292a2d4d Shreyas NC          2016-08-12  2458  	case SKL_TKN_U32_IBS:
2b79b15c258a90c Colin Ian King      2017-09-20  2459  		ret =3D skl_tplg_fi=
ll_res_tkn(dev, tkn_elem, res, pin_index, dir);
f6fa56e22559ade Ramesh Babu         2017-08-23  2460  		if (ret < 0)
f6fa56e22559ade Ramesh Babu         2017-08-23  2461  			return ret;
f6fa56e22559ade Ramesh Babu         2017-08-23  2462  =

6277e83292a2d4d Shreyas NC          2016-08-12  2463  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2464  =

6277e83292a2d4d Shreyas NC          2016-08-12  2465  	case SKL_TKN_U32_VBU=
S_ID:
6277e83292a2d4d Shreyas NC          2016-08-12  2466  		mconfig->vbus_id =
=3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2467  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2468  =

6277e83292a2d4d Shreyas NC          2016-08-12  2469  	case SKL_TKN_U32_PAR=
AMS_FIXUP:
6277e83292a2d4d Shreyas NC          2016-08-12  2470  		mconfig->params_fix=
up =3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2471  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2472  =

6277e83292a2d4d Shreyas NC          2016-08-12  2473  	case SKL_TKN_U32_CON=
VERTER:
6277e83292a2d4d Shreyas NC          2016-08-12  2474  		mconfig->converter =
=3D tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2475  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2476  =

c0116be3d191393 Subhransu S. Prusty 2017-05-04  2477  	case SKL_TKN_U32_D0I=
3_CAPS:
6bd9dcf339ebb29 Vinod Koul          2016-11-03  2478  		mconfig->d0i3_caps =
=3D tkn_elem->value;
6bd9dcf339ebb29 Vinod Koul          2016-11-03  2479  		break;
6bd9dcf339ebb29 Vinod Koul          2016-11-03  2480  =

6277e83292a2d4d Shreyas NC          2016-08-12  2481  	case SKL_TKN_U32_PIP=
E_ID:
6277e83292a2d4d Shreyas NC          2016-08-12  2482  		ret =3D skl_tplg_ad=
d_pipe(dev,
6277e83292a2d4d Shreyas NC          2016-08-12  2483  				mconfig, skl, tkn=
_elem);
6277e83292a2d4d Shreyas NC          2016-08-12  2484  =

081dc8ab46df853 Guneshwor Singh     2017-04-27  2485  		if (ret < 0) {
081dc8ab46df853 Guneshwor Singh     2017-04-27  2486  			if (ret =3D=3D -EE=
XIST) {
6277e83292a2d4d Shreyas NC          2016-08-12  2487  				is_pipe_exists =
=3D 1;
081dc8ab46df853 Guneshwor Singh     2017-04-27  2488  				break;
081dc8ab46df853 Guneshwor Singh     2017-04-27  2489  			}
081dc8ab46df853 Guneshwor Singh     2017-04-27  2490  			return is_pipe_exi=
sts;
081dc8ab46df853 Guneshwor Singh     2017-04-27  2491  		}
6277e83292a2d4d Shreyas NC          2016-08-12  2492  =

6277e83292a2d4d Shreyas NC          2016-08-12  2493  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2494  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2495  	case SKL_TKN_U32_PIP=
E_CONFIG_ID:
f6fa56e22559ade Ramesh Babu         2017-08-23  2496  		conf_idx =3D tkn_el=
em->value;
f6fa56e22559ade Ramesh Babu         2017-08-23  2497  		break;
f6fa56e22559ade Ramesh Babu         2017-08-23  2498  =

6277e83292a2d4d Shreyas NC          2016-08-12  2499  	case SKL_TKN_U32_PIP=
E_CONN_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2500  	case SKL_TKN_U32_PIP=
E_PRIORITY:
6277e83292a2d4d Shreyas NC          2016-08-12  2501  	case SKL_TKN_U32_PIP=
E_MEM_PGS:
8a0cb2360ddb941 Vinod Koul          2016-11-03  2502  	case SKL_TKN_U32_PMO=
DE:
f6fa56e22559ade Ramesh Babu         2017-08-23  2503  	case SKL_TKN_U32_PIP=
E_DIRECTION:
f6fa56e22559ade Ramesh Babu         2017-08-23  2504  	case SKL_TKN_U32_NUM=
_CONFIGS:
6277e83292a2d4d Shreyas NC          2016-08-12  2505  		if (is_pipe_exists)=
 {
6277e83292a2d4d Shreyas NC          2016-08-12  2506  			ret =3D skl_tplg_f=
ill_pipe_tkn(dev, mconfig->pipe,
6277e83292a2d4d Shreyas NC          2016-08-12  2507  					tkn_elem->token,=
 tkn_elem->value);
6277e83292a2d4d Shreyas NC          2016-08-12  2508  			if (ret < 0)
6277e83292a2d4d Shreyas NC          2016-08-12  2509  				return ret;
6277e83292a2d4d Shreyas NC          2016-08-12  2510  		}
6277e83292a2d4d Shreyas NC          2016-08-12  2511  =

6277e83292a2d4d Shreyas NC          2016-08-12  2512  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2513  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2514  	case SKL_TKN_U32_PAT=
H_MEM_PGS:
f6fa56e22559ade Ramesh Babu         2017-08-23  2515  	case SKL_TKN_U32_CFG=
_FREQ:
f6fa56e22559ade Ramesh Babu         2017-08-23  2516  	case SKL_TKN_U8_CFG_=
CHAN:
f6fa56e22559ade Ramesh Babu         2017-08-23  2517  	case SKL_TKN_U8_CFG_=
BPS:
f6fa56e22559ade Ramesh Babu         2017-08-23  2518  		if (mconfig->pipe->=
nr_cfgs) {
f6fa56e22559ade Ramesh Babu         2017-08-23  2519  			ret =3D skl_tplg_f=
ill_pipe_cfg(dev, mconfig->pipe,
f6fa56e22559ade Ramesh Babu         2017-08-23  2520  					tkn_elem->token,=
 tkn_elem->value,
f6fa56e22559ade Ramesh Babu         2017-08-23  2521  					conf_idx, dir);
f6fa56e22559ade Ramesh Babu         2017-08-23  2522  			if (ret < 0)
f6fa56e22559ade Ramesh Babu         2017-08-23  2523  				return ret;
f6fa56e22559ade Ramesh Babu         2017-08-23  2524  		}
f6fa56e22559ade Ramesh Babu         2017-08-23  2525  		break;
f6fa56e22559ade Ramesh Babu         2017-08-23  2526  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2527  	case SKL_TKN_CFG_MOD=
_RES_ID:
f6fa56e22559ade Ramesh Babu         2017-08-23  2528  		mconfig->mod_cfg[co=
nf_idx].res_idx =3D tkn_elem->value;
f6fa56e22559ade Ramesh Babu         2017-08-23  2529  		break;
f6fa56e22559ade Ramesh Babu         2017-08-23  2530  =

f6fa56e22559ade Ramesh Babu         2017-08-23  2531  	case SKL_TKN_CFG_MOD=
_FMT_ID:
f6fa56e22559ade Ramesh Babu         2017-08-23  2532  		mconfig->mod_cfg[co=
nf_idx].fmt_idx =3D tkn_elem->value;
f6fa56e22559ade Ramesh Babu         2017-08-23  2533  		break;
f6fa56e22559ade Ramesh Babu         2017-08-23  2534  =

6277e83292a2d4d Shreyas NC          2016-08-12  2535  	/*
6277e83292a2d4d Shreyas NC          2016-08-12  2536  	 * SKL_TKN_U32_DIR_P=
IN_COUNT token has the value for both
6277e83292a2d4d Shreyas NC          2016-08-12  2537  	 * direction and the=
 pin count. The first four bits represent
6277e83292a2d4d Shreyas NC          2016-08-12  2538  	 * direction and nex=
t four the pin count.
6277e83292a2d4d Shreyas NC          2016-08-12  2539  	 */
6277e83292a2d4d Shreyas NC          2016-08-12  2540  	case SKL_TKN_U32_DIR=
_PIN_COUNT:
6277e83292a2d4d Shreyas NC          2016-08-12  2541  		dir =3D tkn_elem->v=
alue & SKL_IN_DIR_BIT_MASK;
6277e83292a2d4d Shreyas NC          2016-08-12  2542  		pin_index =3D (tkn_=
elem->value &
6277e83292a2d4d Shreyas NC          2016-08-12  2543  			SKL_PIN_COUNT_MASK=
) >> 4;
6277e83292a2d4d Shreyas NC          2016-08-12  2544  =

6277e83292a2d4d Shreyas NC          2016-08-12  2545  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2546  =

6277e83292a2d4d Shreyas NC          2016-08-12  2547  	case SKL_TKN_U32_FMT=
_CH:
6277e83292a2d4d Shreyas NC          2016-08-12  2548  	case SKL_TKN_U32_FMT=
_FREQ:
6277e83292a2d4d Shreyas NC          2016-08-12  2549  	case SKL_TKN_U32_FMT=
_BIT_DEPTH:
6277e83292a2d4d Shreyas NC          2016-08-12  2550  	case SKL_TKN_U32_FMT=
_SAMPLE_SIZE:
6277e83292a2d4d Shreyas NC          2016-08-12  2551  	case SKL_TKN_U32_FMT=
_CH_CONFIG:
6277e83292a2d4d Shreyas NC          2016-08-12  2552  	case SKL_TKN_U32_FMT=
_INTERLEAVE:
6277e83292a2d4d Shreyas NC          2016-08-12  2553  	case SKL_TKN_U32_FMT=
_SAMPLE_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2554  	case SKL_TKN_U32_FMT=
_CH_MAP:
f6fa56e22559ade Ramesh Babu         2017-08-23  2555  		ret =3D skl_tplg_wi=
dget_fill_fmt(dev, iface, tkn_elem->token,
6277e83292a2d4d Shreyas NC          2016-08-12  2556  				tkn_elem->value, =
dir, pin_index);
6277e83292a2d4d Shreyas NC          2016-08-12  2557  =

6277e83292a2d4d Shreyas NC          2016-08-12  2558  		if (ret < 0)
6277e83292a2d4d Shreyas NC          2016-08-12  2559  			return ret;
6277e83292a2d4d Shreyas NC          2016-08-12  2560  =

6277e83292a2d4d Shreyas NC          2016-08-12  2561  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2562  =

6277e83292a2d4d Shreyas NC          2016-08-12  2563  	case SKL_TKN_U32_PIN=
_MOD_ID:
6277e83292a2d4d Shreyas NC          2016-08-12  2564  	case SKL_TKN_U32_PIN=
_INST_ID:
d956147473ec184 Sriram Periyasamy   2017-11-07  2565  	case SKL_TKN_UUID:
6277e83292a2d4d Shreyas NC          2016-08-12  2566  		ret =3D skl_tplg_fi=
ll_pins_info(dev,
6277e83292a2d4d Shreyas NC          2016-08-12  2567  				mconfig, tkn_elem=
, dir,
6277e83292a2d4d Shreyas NC          2016-08-12  2568  				pin_index);
6277e83292a2d4d Shreyas NC          2016-08-12  2569  		if (ret < 0)
6277e83292a2d4d Shreyas NC          2016-08-12  2570  			return ret;
6277e83292a2d4d Shreyas NC          2016-08-12  2571  =

6277e83292a2d4d Shreyas NC          2016-08-12  2572  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2573  =

a4ad42d28618eef Kareem Shaik        2021-08-18  2574  	case SKL_TKN_U32_FMT=
_CFG_IDX:
a4ad42d28618eef Kareem Shaik        2021-08-18  2575  		if (tkn_elem->value=
 > SKL_MAX_PARAMS_TYPES)
a4ad42d28618eef Kareem Shaik        2021-08-18  2576  			return -EINVAL;
a4ad42d28618eef Kareem Shaik        2021-08-18  2577  =

a4ad42d28618eef Kareem Shaik        2021-08-18 @2578  		mconfig->fmt_cfg_id=
x =3D tkn_elem->value;
a4ad42d28618eef Kareem Shaik        2021-08-18  2579  		break;
a4ad42d28618eef Kareem Shaik        2021-08-18  2580  =

6277e83292a2d4d Shreyas NC          2016-08-12  2581  	case SKL_TKN_U32_CAP=
S_SIZE:
a4ad42d28618eef Kareem Shaik        2021-08-18  2582  		mconfig->formats_co=
nfig[mconfig->fmt_cfg_idx].caps_size =3D
6277e83292a2d4d Shreyas NC          2016-08-12  2583  			tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2584  =

6277e83292a2d4d Shreyas NC          2016-08-12  2585  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2586  =

133e6e5c27340fe Shreyas NC          2017-05-15  2587  	case SKL_TKN_U32_CAP=
S_SET_PARAMS:
a4ad42d28618eef Kareem Shaik        2021-08-18  2588  		mconfig->formats_co=
nfig[mconfig->fmt_cfg_idx].set_params =3D
133e6e5c27340fe Shreyas NC          2017-05-15  2589  				tkn_elem->value;
133e6e5c27340fe Shreyas NC          2017-05-15  2590  		break;
133e6e5c27340fe Shreyas NC          2017-05-15  2591  =

133e6e5c27340fe Shreyas NC          2017-05-15  2592  	case SKL_TKN_U32_CAP=
S_PARAMS_ID:
a4ad42d28618eef Kareem Shaik        2021-08-18  2593  		mconfig->formats_co=
nfig[mconfig->fmt_cfg_idx].param_id =3D
133e6e5c27340fe Shreyas NC          2017-05-15  2594  				tkn_elem->value;
133e6e5c27340fe Shreyas NC          2017-05-15  2595  		break;
133e6e5c27340fe Shreyas NC          2017-05-15  2596  =

6277e83292a2d4d Shreyas NC          2016-08-12  2597  	case SKL_TKN_U32_PRO=
C_DOMAIN:
6277e83292a2d4d Shreyas NC          2016-08-12  2598  		mconfig->domain =3D
6277e83292a2d4d Shreyas NC          2016-08-12  2599  			tkn_elem->value;
6277e83292a2d4d Shreyas NC          2016-08-12  2600  =

6277e83292a2d4d Shreyas NC          2016-08-12  2601  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2602  =

939df3ada789ccd Ramesh Babu         2017-06-19  2603  	case SKL_TKN_U32_DMA=
_BUF_SIZE:
939df3ada789ccd Ramesh Babu         2017-06-19  2604  		mconfig->dma_buffer=
_size =3D tkn_elem->value;
939df3ada789ccd Ramesh Babu         2017-06-19  2605  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2606  =

6277e83292a2d4d Shreyas NC          2016-08-12  2607  	case SKL_TKN_U8_IN_P=
IN_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2608  	case SKL_TKN_U8_OUT_=
PIN_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2609  	case SKL_TKN_U8_CONN=
_TYPE:
6277e83292a2d4d Shreyas NC          2016-08-12  2610  		break;
6277e83292a2d4d Shreyas NC          2016-08-12  2611  =

6277e83292a2d4d Shreyas NC          2016-08-12  2612  	default:
6277e83292a2d4d Shreyas NC          2016-08-12  2613  		dev_err(dev, "Token=
 %d not handled\n",
6277e83292a2d4d Shreyas NC          2016-08-12  2614  				tkn_elem->token);
6277e83292a2d4d Shreyas NC          2016-08-12  2615  		return -EINVAL;
6277e83292a2d4d Shreyas NC          2016-08-12  2616  	}
6277e83292a2d4d Shreyas NC          2016-08-12  2617  =

6277e83292a2d4d Shreyas NC          2016-08-12  2618  	tkn_count++;
6277e83292a2d4d Shreyas NC          2016-08-12  2619  =

6277e83292a2d4d Shreyas NC          2016-08-12  2620  	return tkn_count;
6277e83292a2d4d Shreyas NC          2016-08-12  2621  }
6277e83292a2d4d Shreyas NC          2016-08-12  2622  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5624862269181911203==--

