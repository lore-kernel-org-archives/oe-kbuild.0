Content-Type: multipart/mixed; boundary="===============7897651817730410573=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [agd5f:drm-next 414/419] drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c: clk_mgr.h is included more than once.
Date: Sun, 10 Jul 2022 10:54:13 +0800
Message-ID: <202207101039.vIExRWIC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7897651817730410573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Roman Li <roman.li@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   e35cc9020f7b4540f5fbbff9fbe08808aab9addc
commit: 0629e353943a6d88b73ff6d4e9b3182f45de65e4 [414/419] drm/amd/display:=
 Add DCN314 DC resources
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c: clk_mgr.h is inclu=
ded more than once.
--
>> drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c: dcn314_optc.h is in=
cluded more than once.
--
>> drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c: dcn31/dcn31_dio=
_link_encoder.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7897651817730410573==--

