Content-Type: multipart/mixed; boundary="===============3819771119980443914=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 29520/30000] drivers/gpu/drm/i915/display/intel_fbc.c:1715:0-23: WARNING: intel_fbc_debugfs_false_color_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 26 Jul 2022 22:14:29 +0800
Message-ID: <202207262214.CxFFnI4r-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3819771119980443914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   a1733c958d33efb0e0b2d90d0bbbfc9b80c3f245
commit: a7a1ee4f38f6c7cd500bfad257d5f0a8d85d3b04 [29520/30000] UPSTREAM: dr=
m/i915/fbc: Move FBC debugfs stuff into intel_fbc.c
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20726/202207262214.CxFFnI4r-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fbc.c:1715:0-23: WARNING: intel_fbc_d=
ebugfs_false_color_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3819771119980443914==--

