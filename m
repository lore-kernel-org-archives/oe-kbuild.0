Content-Type: multipart/mixed; boundary="===============6320488565550003919=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 137/222] drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1979:15: sparse: sparse: memcpy with byte count of 123448
Date: Wed, 15 Jun 2022 06:31:36 +0800
Message-ID: <202206150601.83yQoZI9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6320488565550003919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1979:15: sparse: sparse=
: memcpy with byte count of 123448"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Lei, Jun" <Jun.Lei@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alvin Lee <Alvin.Lee2@amd.com>
CC: Jun Lei <jun.lei@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   225678ec43757ab8827df1963c5555b852f7a1d6
commit: d445dd7b39c56a66872386a3ce0c8a862e59be46 [137/222] drm/amd/display:=
 Extend soc BB capabilitiy
:::::: branch date: 5 hours ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-s031-20220613 (https://download.01.org/0day-c=
i/archive/20220615/202206150601.83yQoZI9-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout d445dd7b39c56a66872386a3ce0c8a862e59be46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
icroblaze SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:1979:15: sparse: spar=
se: memcpy with byte count of 123448
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2004:15: sparse: spar=
se: memcpy with byte count of 145232
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3386:23: sparse: spar=
se: memcpy with byte count of 123448
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3389:23: sparse: spar=
se: memset with byte count of 145232

vim +1979 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c

4562236b3bc0a28 Harry Wentland   2017-09-12  1972  =

e4863f118a7d58e Aric Cyr         2020-08-23  1973  static void init_state(s=
truct dc *dc, struct dc_state *context)
81c90ec0348002b Leo (Sunpeng  Li 2017-09-07  1974) {
813d20dccf93f84 Aidan Wood       2019-02-22  1975  	/* Each context must ha=
ve their own instance of VBA and in order to
813d20dccf93f84 Aidan Wood       2019-02-22  1976  	 * initialize and obtai=
n IP and SOC the base DML instance from DC is
813d20dccf93f84 Aidan Wood       2019-02-22  1977  	 * initially copied int=
o every context
813d20dccf93f84 Aidan Wood       2019-02-22  1978  	 */
813d20dccf93f84 Aidan Wood       2019-02-22 @1979  	memcpy(&context->bw_ctx=
.dml, &dc->dml, sizeof(struct display_mode_lib));
e4863f118a7d58e Aric Cyr         2020-08-23  1980  }
e4863f118a7d58e Aric Cyr         2020-08-23  1981  =


:::::: The code at line 1979 was first introduced by commit
:::::: 813d20dccf93f84f4c16236f7c037dc34db48f10 drm/amd/display: Fix multi-=
thread writing to 1 state

:::::: TO: Aidan Wood <Aidan.Wood@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6320488565550003919==--

