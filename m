Content-Type: multipart/mixed; boundary="===============2407980494801279391=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9124/10638] sound/soc/intel/skylake/skl-topology.c:2578:38: sparse: sparse: incorrect type in assignment (different base types)
Date: Thu, 26 Aug 2021 23:32:02 +0800
Message-ID: <202108262352.2NBPzYeO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2407980494801279391==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kareem Shaik <kareem.m.shaik@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
CC: Cezary Rojewski <cezary.rojewski@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   88fac11862d38306dd0d2398015744877140390d
commit: a4ad42d28618eef83bee02e0a19af0d467bd9722 [9124/10638] ASoC: Intel: =
Skylake: Support multiple format configs
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: i386-allyesconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-348-gf0e6938b-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da4ad42d28618eef83bee02e0a19af0d467bd9722
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a4ad42d28618eef83bee02e0a19af0d467bd9722
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


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

db6ed55de6da11 Shreyas NC          2017-08-23  2365  =

6277e83292a2d4 Shreyas NC          2016-08-12  2366  /*
6277e83292a2d4 Shreyas NC          2016-08-12  2367   * Parse tokens to fil=
l up the module private data
6277e83292a2d4 Shreyas NC          2016-08-12  2368   */
6277e83292a2d4 Shreyas NC          2016-08-12  2369  static int skl_tplg_ge=
t_token(struct device *dev,
6277e83292a2d4 Shreyas NC          2016-08-12  2370  		struct snd_soc_tplg_=
vendor_value_elem *tkn_elem,
bcc2a2dc3ba8c3 Cezary Rojewski     2019-07-23  2371  		struct skl_dev *skl,=
 struct skl_module_cfg *mconfig)
6277e83292a2d4 Shreyas NC          2016-08-12  2372  {
6277e83292a2d4 Shreyas NC          2016-08-12  2373  	int tkn_count =3D 0;
6277e83292a2d4 Shreyas NC          2016-08-12  2374  	int ret;
6277e83292a2d4 Shreyas NC          2016-08-12  2375  	static int is_pipe_ex=
ists;
f6fa56e22559ad Ramesh Babu         2017-08-23  2376  	static int pin_index,=
 dir, conf_idx;
f6fa56e22559ad Ramesh Babu         2017-08-23  2377  	struct skl_module_ifa=
ce *iface =3D NULL;
f6fa56e22559ad Ramesh Babu         2017-08-23  2378  	struct skl_module_res=
 *res =3D NULL;
f6fa56e22559ad Ramesh Babu         2017-08-23  2379  	int res_idx =3D mconf=
ig->res_idx;
f6fa56e22559ad Ramesh Babu         2017-08-23  2380  	int fmt_idx =3D mconf=
ig->fmt_idx;
f6fa56e22559ad Ramesh Babu         2017-08-23  2381  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2382  	/*
f6fa56e22559ad Ramesh Babu         2017-08-23  2383  	 * If the manifest st=
ructure contains no modules, fill all
f6fa56e22559ad Ramesh Babu         2017-08-23  2384  	 * the module data to=
 0th index.
f6fa56e22559ad Ramesh Babu         2017-08-23  2385  	 * res_idx and fmt_id=
x are default set to 0.
f6fa56e22559ad Ramesh Babu         2017-08-23  2386  	 */
f6fa56e22559ad Ramesh Babu         2017-08-23  2387  	if (skl->nr_modules =
=3D=3D 0) {
f6fa56e22559ad Ramesh Babu         2017-08-23  2388  		res =3D &mconfig->mo=
dule->resources[res_idx];
f6fa56e22559ad Ramesh Babu         2017-08-23  2389  		iface =3D &mconfig->=
module->formats[fmt_idx];
f6fa56e22559ad Ramesh Babu         2017-08-23  2390  	}
6277e83292a2d4 Shreyas NC          2016-08-12  2391  =

6277e83292a2d4 Shreyas NC          2016-08-12  2392  	if (tkn_elem->token >=
 SKL_TKN_MAX)
6277e83292a2d4 Shreyas NC          2016-08-12  2393  		return -EINVAL;
6277e83292a2d4 Shreyas NC          2016-08-12  2394  =

6277e83292a2d4 Shreyas NC          2016-08-12  2395  	switch (tkn_elem->tok=
en) {
6277e83292a2d4 Shreyas NC          2016-08-12  2396  	case SKL_TKN_U8_IN_QU=
EUE_COUNT:
f6fa56e22559ad Ramesh Babu         2017-08-23  2397  		mconfig->module->max=
_input_pins =3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2398  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2399  =

6277e83292a2d4 Shreyas NC          2016-08-12  2400  	case SKL_TKN_U8_OUT_Q=
UEUE_COUNT:
f6fa56e22559ad Ramesh Babu         2017-08-23  2401  		mconfig->module->max=
_output_pins =3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2402  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2403  =

6277e83292a2d4 Shreyas NC          2016-08-12  2404  	case SKL_TKN_U8_DYN_I=
N_PIN:
f6fa56e22559ad Ramesh Babu         2017-08-23  2405  		if (!mconfig->m_in_p=
in)
a86854d0c599b3 Kees Cook           2018-06-12  2406  			mconfig->m_in_pin =
=3D
a86854d0c599b3 Kees Cook           2018-06-12  2407  				devm_kcalloc(dev, =
MAX_IN_QUEUE,
a86854d0c599b3 Kees Cook           2018-06-12  2408  					     sizeof(*mcon=
fig->m_in_pin),
a86854d0c599b3 Kees Cook           2018-06-12  2409  					     GFP_KERNEL);
6277e83292a2d4 Shreyas NC          2016-08-12  2410  		if (!mconfig->m_in_p=
in)
6277e83292a2d4 Shreyas NC          2016-08-12  2411  			return -ENOMEM;
6277e83292a2d4 Shreyas NC          2016-08-12  2412  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2413  		skl_tplg_fill_pin_dy=
namic_val(mconfig->m_in_pin, MAX_IN_QUEUE,
f6fa56e22559ad Ramesh Babu         2017-08-23  2414  					      tkn_elem->v=
alue);
6277e83292a2d4 Shreyas NC          2016-08-12  2415  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2416  =

6277e83292a2d4 Shreyas NC          2016-08-12  2417  	case SKL_TKN_U8_DYN_O=
UT_PIN:
f6fa56e22559ad Ramesh Babu         2017-08-23  2418  		if (!mconfig->m_out_=
pin)
a86854d0c599b3 Kees Cook           2018-06-12  2419  			mconfig->m_out_pin =
=3D
a86854d0c599b3 Kees Cook           2018-06-12  2420  				devm_kcalloc(dev, =
MAX_IN_QUEUE,
a86854d0c599b3 Kees Cook           2018-06-12  2421  					     sizeof(*mcon=
fig->m_in_pin),
a86854d0c599b3 Kees Cook           2018-06-12  2422  					     GFP_KERNEL);
6277e83292a2d4 Shreyas NC          2016-08-12  2423  		if (!mconfig->m_out_=
pin)
6277e83292a2d4 Shreyas NC          2016-08-12  2424  			return -ENOMEM;
6277e83292a2d4 Shreyas NC          2016-08-12  2425  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2426  		skl_tplg_fill_pin_dy=
namic_val(mconfig->m_out_pin, MAX_OUT_QUEUE,
f6fa56e22559ad Ramesh Babu         2017-08-23  2427  					      tkn_elem->v=
alue);
6277e83292a2d4 Shreyas NC          2016-08-12  2428  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2429  =

6277e83292a2d4 Shreyas NC          2016-08-12  2430  	case SKL_TKN_U8_TIME_=
SLOT:
6277e83292a2d4 Shreyas NC          2016-08-12  2431  		mconfig->time_slot =
=3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2432  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2433  =

6277e83292a2d4 Shreyas NC          2016-08-12  2434  	case SKL_TKN_U8_CORE_=
ID:
6277e83292a2d4 Shreyas NC          2016-08-12  2435  		mconfig->core_id =3D=
 tkn_elem->value;
9c80c5a8831471 Takashi Iwai        2018-10-03  2436  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2437  =

6277e83292a2d4 Shreyas NC          2016-08-12  2438  	case SKL_TKN_U8_MOD_T=
YPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2439  		mconfig->m_type =3D =
tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2440  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2441  =

6277e83292a2d4 Shreyas NC          2016-08-12  2442  	case SKL_TKN_U8_DEV_T=
YPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2443  		mconfig->dev_type =
=3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2444  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2445  =

6277e83292a2d4 Shreyas NC          2016-08-12  2446  	case SKL_TKN_U8_HW_CO=
NN_TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2447  		mconfig->hw_conn_typ=
e =3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2448  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2449  =

6277e83292a2d4 Shreyas NC          2016-08-12  2450  	case SKL_TKN_U16_MOD_=
INST_ID:
6277e83292a2d4 Shreyas NC          2016-08-12  2451  		mconfig->id.instance=
_id =3D
6277e83292a2d4 Shreyas NC          2016-08-12  2452  		tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2453  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2454  =

6277e83292a2d4 Shreyas NC          2016-08-12  2455  	case SKL_TKN_U32_MEM_=
PAGES:
6277e83292a2d4 Shreyas NC          2016-08-12  2456  	case SKL_TKN_U32_MAX_=
MCPS:
6277e83292a2d4 Shreyas NC          2016-08-12  2457  	case SKL_TKN_U32_OBS:
6277e83292a2d4 Shreyas NC          2016-08-12  2458  	case SKL_TKN_U32_IBS:
2b79b15c258a90 Colin Ian King      2017-09-20  2459  		ret =3D skl_tplg_fil=
l_res_tkn(dev, tkn_elem, res, pin_index, dir);
f6fa56e22559ad Ramesh Babu         2017-08-23  2460  		if (ret < 0)
f6fa56e22559ad Ramesh Babu         2017-08-23  2461  			return ret;
f6fa56e22559ad Ramesh Babu         2017-08-23  2462  =

6277e83292a2d4 Shreyas NC          2016-08-12  2463  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2464  =

6277e83292a2d4 Shreyas NC          2016-08-12  2465  	case SKL_TKN_U32_VBUS=
_ID:
6277e83292a2d4 Shreyas NC          2016-08-12  2466  		mconfig->vbus_id =3D=
 tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2467  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2468  =

6277e83292a2d4 Shreyas NC          2016-08-12  2469  	case SKL_TKN_U32_PARA=
MS_FIXUP:
6277e83292a2d4 Shreyas NC          2016-08-12  2470  		mconfig->params_fixu=
p =3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2471  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2472  =

6277e83292a2d4 Shreyas NC          2016-08-12  2473  	case SKL_TKN_U32_CONV=
ERTER:
6277e83292a2d4 Shreyas NC          2016-08-12  2474  		mconfig->converter =
=3D tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2475  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2476  =

c0116be3d19139 Subhransu S. Prusty 2017-05-04  2477  	case SKL_TKN_U32_D0I3=
_CAPS:
6bd9dcf339ebb2 Vinod Koul          2016-11-03  2478  		mconfig->d0i3_caps =
=3D tkn_elem->value;
6bd9dcf339ebb2 Vinod Koul          2016-11-03  2479  		break;
6bd9dcf339ebb2 Vinod Koul          2016-11-03  2480  =

6277e83292a2d4 Shreyas NC          2016-08-12  2481  	case SKL_TKN_U32_PIPE=
_ID:
6277e83292a2d4 Shreyas NC          2016-08-12  2482  		ret =3D skl_tplg_add=
_pipe(dev,
6277e83292a2d4 Shreyas NC          2016-08-12  2483  				mconfig, skl, tkn_=
elem);
6277e83292a2d4 Shreyas NC          2016-08-12  2484  =

081dc8ab46df85 Guneshwor Singh     2017-04-27  2485  		if (ret < 0) {
081dc8ab46df85 Guneshwor Singh     2017-04-27  2486  			if (ret =3D=3D -EEX=
IST) {
6277e83292a2d4 Shreyas NC          2016-08-12  2487  				is_pipe_exists =3D=
 1;
081dc8ab46df85 Guneshwor Singh     2017-04-27  2488  				break;
081dc8ab46df85 Guneshwor Singh     2017-04-27  2489  			}
081dc8ab46df85 Guneshwor Singh     2017-04-27  2490  			return is_pipe_exis=
ts;
081dc8ab46df85 Guneshwor Singh     2017-04-27  2491  		}
6277e83292a2d4 Shreyas NC          2016-08-12  2492  =

6277e83292a2d4 Shreyas NC          2016-08-12  2493  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2494  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2495  	case SKL_TKN_U32_PIPE=
_CONFIG_ID:
f6fa56e22559ad Ramesh Babu         2017-08-23  2496  		conf_idx =3D tkn_ele=
m->value;
f6fa56e22559ad Ramesh Babu         2017-08-23  2497  		break;
f6fa56e22559ad Ramesh Babu         2017-08-23  2498  =

6277e83292a2d4 Shreyas NC          2016-08-12  2499  	case SKL_TKN_U32_PIPE=
_CONN_TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2500  	case SKL_TKN_U32_PIPE=
_PRIORITY:
6277e83292a2d4 Shreyas NC          2016-08-12  2501  	case SKL_TKN_U32_PIPE=
_MEM_PGS:
8a0cb2360ddb94 Vinod Koul          2016-11-03  2502  	case SKL_TKN_U32_PMOD=
E:
f6fa56e22559ad Ramesh Babu         2017-08-23  2503  	case SKL_TKN_U32_PIPE=
_DIRECTION:
f6fa56e22559ad Ramesh Babu         2017-08-23  2504  	case SKL_TKN_U32_NUM_=
CONFIGS:
6277e83292a2d4 Shreyas NC          2016-08-12  2505  		if (is_pipe_exists) {
6277e83292a2d4 Shreyas NC          2016-08-12  2506  			ret =3D skl_tplg_fi=
ll_pipe_tkn(dev, mconfig->pipe,
6277e83292a2d4 Shreyas NC          2016-08-12  2507  					tkn_elem->token, =
tkn_elem->value);
6277e83292a2d4 Shreyas NC          2016-08-12  2508  			if (ret < 0)
6277e83292a2d4 Shreyas NC          2016-08-12  2509  				return ret;
6277e83292a2d4 Shreyas NC          2016-08-12  2510  		}
6277e83292a2d4 Shreyas NC          2016-08-12  2511  =

6277e83292a2d4 Shreyas NC          2016-08-12  2512  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2513  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2514  	case SKL_TKN_U32_PATH=
_MEM_PGS:
f6fa56e22559ad Ramesh Babu         2017-08-23  2515  	case SKL_TKN_U32_CFG_=
FREQ:
f6fa56e22559ad Ramesh Babu         2017-08-23  2516  	case SKL_TKN_U8_CFG_C=
HAN:
f6fa56e22559ad Ramesh Babu         2017-08-23  2517  	case SKL_TKN_U8_CFG_B=
PS:
f6fa56e22559ad Ramesh Babu         2017-08-23  2518  		if (mconfig->pipe->n=
r_cfgs) {
f6fa56e22559ad Ramesh Babu         2017-08-23  2519  			ret =3D skl_tplg_fi=
ll_pipe_cfg(dev, mconfig->pipe,
f6fa56e22559ad Ramesh Babu         2017-08-23  2520  					tkn_elem->token, =
tkn_elem->value,
f6fa56e22559ad Ramesh Babu         2017-08-23  2521  					conf_idx, dir);
f6fa56e22559ad Ramesh Babu         2017-08-23  2522  			if (ret < 0)
f6fa56e22559ad Ramesh Babu         2017-08-23  2523  				return ret;
f6fa56e22559ad Ramesh Babu         2017-08-23  2524  		}
f6fa56e22559ad Ramesh Babu         2017-08-23  2525  		break;
f6fa56e22559ad Ramesh Babu         2017-08-23  2526  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2527  	case SKL_TKN_CFG_MOD_=
RES_ID:
f6fa56e22559ad Ramesh Babu         2017-08-23  2528  		mconfig->mod_cfg[con=
f_idx].res_idx =3D tkn_elem->value;
f6fa56e22559ad Ramesh Babu         2017-08-23  2529  		break;
f6fa56e22559ad Ramesh Babu         2017-08-23  2530  =

f6fa56e22559ad Ramesh Babu         2017-08-23  2531  	case SKL_TKN_CFG_MOD_=
FMT_ID:
f6fa56e22559ad Ramesh Babu         2017-08-23  2532  		mconfig->mod_cfg[con=
f_idx].fmt_idx =3D tkn_elem->value;
f6fa56e22559ad Ramesh Babu         2017-08-23  2533  		break;
f6fa56e22559ad Ramesh Babu         2017-08-23  2534  =

6277e83292a2d4 Shreyas NC          2016-08-12  2535  	/*
6277e83292a2d4 Shreyas NC          2016-08-12  2536  	 * SKL_TKN_U32_DIR_PI=
N_COUNT token has the value for both
6277e83292a2d4 Shreyas NC          2016-08-12  2537  	 * direction and the =
pin count. The first four bits represent
6277e83292a2d4 Shreyas NC          2016-08-12  2538  	 * direction and next=
 four the pin count.
6277e83292a2d4 Shreyas NC          2016-08-12  2539  	 */
6277e83292a2d4 Shreyas NC          2016-08-12  2540  	case SKL_TKN_U32_DIR_=
PIN_COUNT:
6277e83292a2d4 Shreyas NC          2016-08-12  2541  		dir =3D tkn_elem->va=
lue & SKL_IN_DIR_BIT_MASK;
6277e83292a2d4 Shreyas NC          2016-08-12  2542  		pin_index =3D (tkn_e=
lem->value &
6277e83292a2d4 Shreyas NC          2016-08-12  2543  			SKL_PIN_COUNT_MASK)=
 >> 4;
6277e83292a2d4 Shreyas NC          2016-08-12  2544  =

6277e83292a2d4 Shreyas NC          2016-08-12  2545  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2546  =

6277e83292a2d4 Shreyas NC          2016-08-12  2547  	case SKL_TKN_U32_FMT_=
CH:
6277e83292a2d4 Shreyas NC          2016-08-12  2548  	case SKL_TKN_U32_FMT_=
FREQ:
6277e83292a2d4 Shreyas NC          2016-08-12  2549  	case SKL_TKN_U32_FMT_=
BIT_DEPTH:
6277e83292a2d4 Shreyas NC          2016-08-12  2550  	case SKL_TKN_U32_FMT_=
SAMPLE_SIZE:
6277e83292a2d4 Shreyas NC          2016-08-12  2551  	case SKL_TKN_U32_FMT_=
CH_CONFIG:
6277e83292a2d4 Shreyas NC          2016-08-12  2552  	case SKL_TKN_U32_FMT_=
INTERLEAVE:
6277e83292a2d4 Shreyas NC          2016-08-12  2553  	case SKL_TKN_U32_FMT_=
SAMPLE_TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2554  	case SKL_TKN_U32_FMT_=
CH_MAP:
f6fa56e22559ad Ramesh Babu         2017-08-23  2555  		ret =3D skl_tplg_wid=
get_fill_fmt(dev, iface, tkn_elem->token,
6277e83292a2d4 Shreyas NC          2016-08-12  2556  				tkn_elem->value, d=
ir, pin_index);
6277e83292a2d4 Shreyas NC          2016-08-12  2557  =

6277e83292a2d4 Shreyas NC          2016-08-12  2558  		if (ret < 0)
6277e83292a2d4 Shreyas NC          2016-08-12  2559  			return ret;
6277e83292a2d4 Shreyas NC          2016-08-12  2560  =

6277e83292a2d4 Shreyas NC          2016-08-12  2561  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2562  =

6277e83292a2d4 Shreyas NC          2016-08-12  2563  	case SKL_TKN_U32_PIN_=
MOD_ID:
6277e83292a2d4 Shreyas NC          2016-08-12  2564  	case SKL_TKN_U32_PIN_=
INST_ID:
d956147473ec18 Sriram Periyasamy   2017-11-07  2565  	case SKL_TKN_UUID:
6277e83292a2d4 Shreyas NC          2016-08-12  2566  		ret =3D skl_tplg_fil=
l_pins_info(dev,
6277e83292a2d4 Shreyas NC          2016-08-12  2567  				mconfig, tkn_elem,=
 dir,
6277e83292a2d4 Shreyas NC          2016-08-12  2568  				pin_index);
6277e83292a2d4 Shreyas NC          2016-08-12  2569  		if (ret < 0)
6277e83292a2d4 Shreyas NC          2016-08-12  2570  			return ret;
6277e83292a2d4 Shreyas NC          2016-08-12  2571  =

6277e83292a2d4 Shreyas NC          2016-08-12  2572  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2573  =

a4ad42d28618ee Kareem Shaik        2021-08-18  2574  	case SKL_TKN_U32_FMT_=
CFG_IDX:
a4ad42d28618ee Kareem Shaik        2021-08-18  2575  		if (tkn_elem->value =
> SKL_MAX_PARAMS_TYPES)
a4ad42d28618ee Kareem Shaik        2021-08-18  2576  			return -EINVAL;
a4ad42d28618ee Kareem Shaik        2021-08-18  2577  =

a4ad42d28618ee Kareem Shaik        2021-08-18 @2578  		mconfig->fmt_cfg_idx=
 =3D tkn_elem->value;
a4ad42d28618ee Kareem Shaik        2021-08-18  2579  		break;
a4ad42d28618ee Kareem Shaik        2021-08-18  2580  =

6277e83292a2d4 Shreyas NC          2016-08-12  2581  	case SKL_TKN_U32_CAPS=
_SIZE:
a4ad42d28618ee Kareem Shaik        2021-08-18  2582  		mconfig->formats_con=
fig[mconfig->fmt_cfg_idx].caps_size =3D
6277e83292a2d4 Shreyas NC          2016-08-12  2583  			tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2584  =

6277e83292a2d4 Shreyas NC          2016-08-12  2585  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2586  =

133e6e5c27340f Shreyas NC          2017-05-15  2587  	case SKL_TKN_U32_CAPS=
_SET_PARAMS:
a4ad42d28618ee Kareem Shaik        2021-08-18  2588  		mconfig->formats_con=
fig[mconfig->fmt_cfg_idx].set_params =3D
133e6e5c27340f Shreyas NC          2017-05-15  2589  				tkn_elem->value;
133e6e5c27340f Shreyas NC          2017-05-15  2590  		break;
133e6e5c27340f Shreyas NC          2017-05-15  2591  =

133e6e5c27340f Shreyas NC          2017-05-15  2592  	case SKL_TKN_U32_CAPS=
_PARAMS_ID:
a4ad42d28618ee Kareem Shaik        2021-08-18  2593  		mconfig->formats_con=
fig[mconfig->fmt_cfg_idx].param_id =3D
133e6e5c27340f Shreyas NC          2017-05-15  2594  				tkn_elem->value;
133e6e5c27340f Shreyas NC          2017-05-15  2595  		break;
133e6e5c27340f Shreyas NC          2017-05-15  2596  =

6277e83292a2d4 Shreyas NC          2016-08-12  2597  	case SKL_TKN_U32_PROC=
_DOMAIN:
6277e83292a2d4 Shreyas NC          2016-08-12  2598  		mconfig->domain =3D
6277e83292a2d4 Shreyas NC          2016-08-12  2599  			tkn_elem->value;
6277e83292a2d4 Shreyas NC          2016-08-12  2600  =

6277e83292a2d4 Shreyas NC          2016-08-12  2601  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2602  =

939df3ada789cc Ramesh Babu         2017-06-19  2603  	case SKL_TKN_U32_DMA_=
BUF_SIZE:
939df3ada789cc Ramesh Babu         2017-06-19  2604  		mconfig->dma_buffer_=
size =3D tkn_elem->value;
939df3ada789cc Ramesh Babu         2017-06-19  2605  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2606  =

6277e83292a2d4 Shreyas NC          2016-08-12  2607  	case SKL_TKN_U8_IN_PI=
N_TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2608  	case SKL_TKN_U8_OUT_P=
IN_TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2609  	case SKL_TKN_U8_CONN_=
TYPE:
6277e83292a2d4 Shreyas NC          2016-08-12  2610  		break;
6277e83292a2d4 Shreyas NC          2016-08-12  2611  =

6277e83292a2d4 Shreyas NC          2016-08-12  2612  	default:
6277e83292a2d4 Shreyas NC          2016-08-12  2613  		dev_err(dev, "Token =
%d not handled\n",
6277e83292a2d4 Shreyas NC          2016-08-12  2614  				tkn_elem->token);
6277e83292a2d4 Shreyas NC          2016-08-12  2615  		return -EINVAL;
6277e83292a2d4 Shreyas NC          2016-08-12  2616  	}
6277e83292a2d4 Shreyas NC          2016-08-12  2617  =

6277e83292a2d4 Shreyas NC          2016-08-12  2618  	tkn_count++;
6277e83292a2d4 Shreyas NC          2016-08-12  2619  =

6277e83292a2d4 Shreyas NC          2016-08-12  2620  	return tkn_count;
6277e83292a2d4 Shreyas NC          2016-08-12  2621  }
6277e83292a2d4 Shreyas NC          2016-08-12  2622  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2407980494801279391==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
JAQA
--===============2407980494801279391==--

