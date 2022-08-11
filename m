Content-Type: multipart/mixed; boundary="===============1552710342269902943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/gaudi2/gaudi2.c:5458:24: warning: shift by count ('4294967292') >= precision of type ('64')
Date: Fri, 12 Aug 2022 05:00:48 +0800
Message-ID: <202208120449.xf3nESre-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1552710342269902943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
isc/habanalabs/gaudi2/gaudi2.c:5458:24: warning: shift by count ('429496729=
2') >=3D precision of type ('64') [-Wanalyzer-shift-count-overflow]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ae08b36c06ea8df73a79f6b80ff7964e006e9e3
commit: d7bb1ac89b2f5e230ec87659dabd2600897e49ef habanalabs: add gaudi2 asi=
c-specific code
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-c001 (https://download.01.org/0day-ci/archive/202=
20812/202208120449.xf3nESre-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd7bb1ac89b2f5e230ec87659dabd2600897e49ef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d7bb1ac89b2f5e230ec87659dabd2600897e49ef
        # save the config file
        make ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/misc/habanalabs/gaudi2/gaudi2.c: In function 'gaudi2_is_arc_enab=
led':
>> drivers/misc/habanalabs/gaudi2/gaudi2.c:5458:24: warning: shift by count=
 ('4294967292') >=3D precision of type ('64') [-Wanalyzer-shift-count-overf=
low]
    5458 |                 return !!(gaudi2->active_nic_arc & BIT_ULL(arc_i=
d - CPU_ID_NIC_QMAN_ARC0));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
     'gaudi2_non_hard_reset_late_init': events 1-2
       |
       | 5947 | static int gaudi2_non_hard_reset_late_init(struct hl_device=
 *hdev)
       |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'gaudi2_non_hard_reset_late_init'
       |......
       | 5955 |         gaudi2_init_arcs(hdev);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'gaudi2_init_arcs' from 'gaudi2_non_har=
d_reset_late_init'
       |
       +--> 'gaudi2_init_arcs': event 3
              |
              | 2587 | static void gaudi2_init_arcs(struct hl_device *hdev)
              |      |             ^~~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'gaudi2_init_arcs'
              |
            'gaudi2_init_arcs': events 4-6
              |
              | 2593 |         for (i =3D CPU_ID_SCHED_ARC0 ; i <=3D CPU_ID=
_SCHED_ARC3 ; i++) {
              | 2594 |                 if (gaudi2_is_arc_enabled(hdev, i))
              |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (5) ...to here
              |      |                     (6) calling 'gaudi2_is_arc_enabl=
ed' from 'gaudi2_init_arcs'
              |
              +--> 'gaudi2_is_arc_enabled': events 7-9
                     |
                     | 5445 | static bool gaudi2_is_arc_enabled(struct hl_d=
evice *hdev, u64 arc_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (7) entry to 'gaudi2_is_arc_enabl=
ed'
                     |......
                     | 5449 |         switch (arc_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (8) following 'case 0 ... 5:' branch.=
..
                     |......
                     | 5452 |                 return !!(gaudi2->active_hw_a=
rc & BIT_ULL(arc_id));
                     |      |                           ~~~~~~~~~~~~~~~~~~~=
~~
                     |      |                                 |
                     |      |                                 (9) ...to here
                     |
              <------+
              |
            'gaudi2_init_arcs': events 10-13
              |
              | 2594 |                 if (gaudi2_is_arc_enabled(hdev, i))
              |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (10) returning to 'gaudi2_init_a=
rcs' from 'gaudi2_is_arc_enabled'
              |......
              | 2600 |         for (i =3D GAUDI2_QUEUE_ID_PDMA_0_0 ; i < GA=
UDI2_QUEUE_ID_CPU_PQ ; i +=3D 4) {
              |      |                                             ~~~~~~~~=
~~~~~~~~~~~~~~~~~~
              |      |                                               |
              |      |                                               (11) f=
ollowing 'true' branch (when 'i !=3D 260')...
              | 2601 |                 if (!gaudi2_is_queue_enabled(hdev, i=
))
              |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                      |
              |      |                      (12) ...to here
              |      |                      (13) calling 'gaudi2_is_queue_e=
nabled' from 'gaudi2_init_arcs'
              |
              +--> 'gaudi2_is_queue_enabled': events 14-22
                     |
                     | 5340 | static bool gaudi2_is_queue_enabled(struct hl=
_device *hdev, u32 hw_queue_id)
                     |      |             ^~~~~~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (14) entry to 'gaudi2_is_queue_en=
abled'
                     |......
                     | 5348 |         switch (hw_queue_id) {
                     |      |         ~~~~~~
                     |      |         |
                     |      |         (15) following 'case 0 ... 5:' branch=
...
                     |......
                     | 5433 |         if (hw_tpc_cap_bit)
                     |      |            ~ =

                     |      |            |
                     |      |            (16) ...to here
                     |      |            (17) following 'false' branch (whe=
n 'hw_tpc_cap_bit =3D=3D 0')...
                     |......
                     | 5436 |         if (hw_nic_cap_bit)
                     |      |            ~ =

                     |      |            |
                     |      |            (18) ...to here
                     |      |            (19) following 'false' branch (whe=
n 'hw_nic_cap_bit =3D=3D 0')...
                     |......
                     | 5439 |         if (hw_test_cap_bit)
                     |      |            ~ =

                     |      |            |
                     |      |            (20) ...to here
                     |      |            (21) following 'false' branch (whe=
n 'hw_test_cap_bit =3D=3D 0')...
                     |......
                     | 5442 |         return !!(gaudi2->hw_cap_initialized =
& hw_cap_mask);
                     |      |                   ~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                         |
                     |      |                         (22) ...to here

vim +5458 drivers/misc/habanalabs/gaudi2/gaudi2.c

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5444  =

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5445  static bool gaudi2_is_arc_enab=
led(struct hl_device *hdev, u64 arc_id)
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5446  {
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5447  	struct gaudi2_device *gaudi2 =
=3D hdev->asic_specific;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5448  =

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5449  	switch (arc_id) {
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5450  	case CPU_ID_SCHED_ARC0 ... CP=
U_ID_SCHED_ARC5:
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5451  	case CPU_ID_MME_QMAN_ARC0...C=
PU_ID_ROT_QMAN_ARC1:
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5452  		return !!(gaudi2->active_hw_=
arc & BIT_ULL(arc_id));
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5453  =

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5454  	case CPU_ID_TPC_QMAN_ARC0...C=
PU_ID_TPC_QMAN_ARC24:
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5455  		return !!(gaudi2->active_tpc=
_arc & BIT_ULL(arc_id - CPU_ID_TPC_QMAN_ARC0));
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5456  =

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5457  	case CPU_ID_NIC_QMAN_ARC0...C=
PU_ID_NIC_QMAN_ARC23:
d7bb1ac89b2f5e Oded Gabbay 2022-06-26 @5458  		return !!(gaudi2->active_nic=
_arc & BIT_ULL(arc_id - CPU_ID_NIC_QMAN_ARC0));
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5459  =

d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5460  	default:
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5461  		return false;
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5462  	}
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5463  }
d7bb1ac89b2f5e Oded Gabbay 2022-06-26  5464  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1552710342269902943==--

