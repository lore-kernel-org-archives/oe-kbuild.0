Content-Type: multipart/mixed; boundary="===============6252102991344630987=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:590:37: warning: shift by negative count ('-1')
Date: Thu, 23 Jun 2022 17:01:27 +0800
Message-ID: <202206231632.NknwME76-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6252102991344630987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd.c:590:37: warning: shift by negative count =
('-1') [-Wanalyzer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Kim <jonathan.kim@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Felix Kuehling <felix.kuehling@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   de5c208d533a46a074eb46ea17f672cc005a7269
commit: 933048103837710b6996d5487e5fcbc320b81503 drm/amdkfd: report pcie ba=
ndwidth to the kfd
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220622 (https://download.01.org/0day-ci/archi=
ve/20220623/202206231632.NknwME76-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D933048103837710b6996d5487e5fcbc320b81503
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 933048103837710b6996d5487e5fcbc320b81503
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c: In function 'amdgpu_amdkfd_g=
et_pcie_bandwidth_mbytes':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:590:37: warning: shift by neg=
ative count ('-1') [-Wanalyzer-shift-count-negative]
     590 |         uint32_t num_lanes_mask =3D 1 << num_lanes_shift;
         |                                   ~~^~~~~~~~~~~~~~~~~~
     'amdgpu_amdkfd_get_pcie_bandwidth_mbytes': events 1-4
       |
       |  581 | int amdgpu_amdkfd_get_pcie_bandwidth_mbytes(struct kgd_dev =
*dev, bool is_min)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'amdgpu_amdkfd_get_pcie_bandwidth_mbytes'
       |......
       |  584 |         int num_lanes_shift =3D (is_min ? ffs(adev->pm.pcie=
_mlw_mask) :
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
       |      |                                         |           |
       |      |                                         |           (3) ...=
to here
       |      |                                         (4) calling 'ffs' f=
rom 'amdgpu_amdkfd_get_pcie_bandwidth_mbytes'
       |  585 |                                                         fls=
(adev->pm.pcie_mlw_mask)) - 1;
       |      |                                                         ~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                                            =
                          |
       |      |                                                            =
                          (2) following 'true' branch (when 'is_min !=3D 0'=
)...
       |
       +--> 'ffs': events 5-6
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (5) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       =

              |      |            |
              |      |            (6) following 'true' branch (when 'x =3D=
=3D 0')...
              |
            'ffs': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'amdgpu_amdkfd_get_pcie_bandwidth_mbytes': events 8-11
       |
       |drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:584:41:
       |  584 |         int num_lanes_shift =3D (is_min ? ffs(adev->pm.pcie=
_mlw_mask) :
       |      |                                         ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       |      |                                         |
       |      |                                         (8) returning to 'a=
mdgpu_amdkfd_get_pcie_bandwidth_mbytes' from 'ffs'
       |  585 |                                                         fls=
(adev->pm.pcie_mlw_mask)) - 1;
       |  586 |         int gen_speed_shift =3D (is_min ? ffs(adev->pm.pcie=
_gen_mask &
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                                         |           |
       |      |                                         |           (10) ..=
.to here
       |      |                                         (11) calling 'ffs' =
from 'amdgpu_amdkfd_get_pcie_bandwidth_mbytes'
       |  587 |                                                 CAIL_PCIE_L=
INK_SPEED_SUPPORT_MASK) :
       |      |                                                 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~
       |  588 |                                         fls(adev->pm.pcie_g=
en_mask &
       |      |                                         ~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |  589 |                                                 CAIL_PCIE_L=
INK_SPEED_SUPPORT_MASK)) - 1;
       |      |                                                 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                                            =
                         |
       |      |                                                            =
                         (9) following 'true' branch (when 'is_min !=3D 0')=
...
       |
       +--> 'ffs': events 12-13
              |
              |include/asm-generic/bitops/ffs.h:13:19:
              |   13 | static inline int ffs(int x)
              |      |                   ^~~
              |      |                   |
              |      |                   (12) entry to 'ffs'
              |......
              |   17 |         if (!x)
              |      |            ~       =

              |      |            |
              |      |            (13) following 'true' branch (when 'x =3D=
=3D 0')...
              |
            'ffs': event 14
              |
              |cc1:
              | (14): ...to here
              |
       <------+
       |
     'amdgpu_amdkfd_get_pcie_bandwidth_mbytes': events 15-16
       |
       |drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:586:41:
       |  586 |         int gen_speed_shift =3D (is_min ? ffs(adev->pm.pcie=
_gen_mask &
       |      |                                         ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                                         |
       |      |                                         (15) returning to '=
amdgpu_amdkfd_get_pcie_bandwidth_mbytes' from 'ffs'
       |  587 |                                                 CAIL_PCIE_L=
INK_SPEED_SUPPORT_MASK) :
       |      |                                                 ~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
       |......
       |  590 |         uint32_t num_lanes_mask =3D 1 << num_lanes_shift;
       |      |                                   ~~~~~~~~~~~~~~~~~~~~
       |      |                                     |
       |      |                                     (16) shift by negative =
amount here ('-1')
       |
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:591:37: warning: shift by neg=
ative count ('-1') [-Wanalyzer-shift-count-negative]
     591 |         uint32_t gen_speed_mask =3D 1 << gen_speed_shift;
         |                                   ~~^~~~~~~~~~~~~~~~~~
     'amdgpu_amdkfd_get_pcie_bandwidth_mbytes': events 1-4

vim +590 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

93304810383771 Jonathan Kim 2021-06-02  580  =

93304810383771 Jonathan Kim 2021-06-02  581  int amdgpu_amdkfd_get_pcie_ban=
dwidth_mbytes(struct kgd_dev *dev, bool is_min)
93304810383771 Jonathan Kim 2021-06-02  582  {
93304810383771 Jonathan Kim 2021-06-02  583  	struct amdgpu_device *adev =
=3D (struct amdgpu_device *)dev;
93304810383771 Jonathan Kim 2021-06-02  584  	int num_lanes_shift =3D (is_m=
in ? ffs(adev->pm.pcie_mlw_mask) :
93304810383771 Jonathan Kim 2021-06-02  585  							fls(adev->pm.pcie_mlw_m=
ask)) - 1;
93304810383771 Jonathan Kim 2021-06-02  586  	int gen_speed_shift =3D (is_m=
in ? ffs(adev->pm.pcie_gen_mask &
93304810383771 Jonathan Kim 2021-06-02  587  						CAIL_PCIE_LINK_SPEED_SUP=
PORT_MASK) :
93304810383771 Jonathan Kim 2021-06-02  588  					fls(adev->pm.pcie_gen_mas=
k &
93304810383771 Jonathan Kim 2021-06-02  589  						CAIL_PCIE_LINK_SPEED_SUP=
PORT_MASK)) - 1;
93304810383771 Jonathan Kim 2021-06-02 @590  	uint32_t num_lanes_mask =3D 1=
 << num_lanes_shift;
93304810383771 Jonathan Kim 2021-06-02  591  	uint32_t gen_speed_mask =3D 1=
 << gen_speed_shift;
93304810383771 Jonathan Kim 2021-06-02  592  	int num_lanes_factor =3D 0, g=
en_speed_mbits_factor =3D 0;
93304810383771 Jonathan Kim 2021-06-02  593  =

93304810383771 Jonathan Kim 2021-06-02  594  	switch (num_lanes_mask) {
93304810383771 Jonathan Kim 2021-06-02  595  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X1:
93304810383771 Jonathan Kim 2021-06-02  596  		num_lanes_factor =3D 1;
93304810383771 Jonathan Kim 2021-06-02  597  		break;
93304810383771 Jonathan Kim 2021-06-02  598  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X2:
93304810383771 Jonathan Kim 2021-06-02  599  		num_lanes_factor =3D 2;
93304810383771 Jonathan Kim 2021-06-02  600  		break;
93304810383771 Jonathan Kim 2021-06-02  601  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X4:
93304810383771 Jonathan Kim 2021-06-02  602  		num_lanes_factor =3D 4;
93304810383771 Jonathan Kim 2021-06-02  603  		break;
93304810383771 Jonathan Kim 2021-06-02  604  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X8:
93304810383771 Jonathan Kim 2021-06-02  605  		num_lanes_factor =3D 8;
93304810383771 Jonathan Kim 2021-06-02  606  		break;
93304810383771 Jonathan Kim 2021-06-02  607  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X12:
93304810383771 Jonathan Kim 2021-06-02  608  		num_lanes_factor =3D 12;
93304810383771 Jonathan Kim 2021-06-02  609  		break;
93304810383771 Jonathan Kim 2021-06-02  610  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X16:
93304810383771 Jonathan Kim 2021-06-02  611  		num_lanes_factor =3D 16;
93304810383771 Jonathan Kim 2021-06-02  612  		break;
93304810383771 Jonathan Kim 2021-06-02  613  	case CAIL_PCIE_LINK_WIDTH_SUP=
PORT_X32:
93304810383771 Jonathan Kim 2021-06-02  614  		num_lanes_factor =3D 32;
93304810383771 Jonathan Kim 2021-06-02  615  		break;
93304810383771 Jonathan Kim 2021-06-02  616  	}
93304810383771 Jonathan Kim 2021-06-02  617  =

93304810383771 Jonathan Kim 2021-06-02  618  	switch (gen_speed_mask) {
93304810383771 Jonathan Kim 2021-06-02  619  	case CAIL_PCIE_LINK_SPEED_SUP=
PORT_GEN1:
93304810383771 Jonathan Kim 2021-06-02  620  		gen_speed_mbits_factor =3D 2=
500;
93304810383771 Jonathan Kim 2021-06-02  621  		break;
93304810383771 Jonathan Kim 2021-06-02  622  	case CAIL_PCIE_LINK_SPEED_SUP=
PORT_GEN2:
93304810383771 Jonathan Kim 2021-06-02  623  		gen_speed_mbits_factor =3D 5=
000;
93304810383771 Jonathan Kim 2021-06-02  624  		break;
93304810383771 Jonathan Kim 2021-06-02  625  	case CAIL_PCIE_LINK_SPEED_SUP=
PORT_GEN3:
93304810383771 Jonathan Kim 2021-06-02  626  		gen_speed_mbits_factor =3D 8=
000;
93304810383771 Jonathan Kim 2021-06-02  627  		break;
93304810383771 Jonathan Kim 2021-06-02  628  	case CAIL_PCIE_LINK_SPEED_SUP=
PORT_GEN4:
93304810383771 Jonathan Kim 2021-06-02  629  		gen_speed_mbits_factor =3D 1=
6000;
93304810383771 Jonathan Kim 2021-06-02  630  		break;
93304810383771 Jonathan Kim 2021-06-02  631  	case CAIL_PCIE_LINK_SPEED_SUP=
PORT_GEN5:
93304810383771 Jonathan Kim 2021-06-02  632  		gen_speed_mbits_factor =3D 3=
2000;
93304810383771 Jonathan Kim 2021-06-02  633  		break;
93304810383771 Jonathan Kim 2021-06-02  634  	}
93304810383771 Jonathan Kim 2021-06-02  635  =

93304810383771 Jonathan Kim 2021-06-02  636  	return (num_lanes_factor * ge=
n_speed_mbits_factor)/BITS_PER_BYTE;
3f46c4e9ce25bb Jonathan Kim 2021-05-12  637  }
3f46c4e9ce25bb Jonathan Kim 2021-05-12  638  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6252102991344630987==--

