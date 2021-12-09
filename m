Content-Type: multipart/mixed; boundary="===============2627424578594051494=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4406/5842] drivers/gpu/drm/i915/display/intel_fbc.c:1715:0-23: WARNING: intel_fbc_debugfs_false_color_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Date: Thu, 09 Dec 2021 21:19:27 +0800
Message-ID: <202112092122.JmAXmYU0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2627424578594051494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4eee8d0b64ecc3231040fa68ba750317ffca5c52
commit: d2de8ccfb29909272fce4eb5cb2bca4fd878df39 [4406/5842] drm/i915/fbc: =
Move FBC debugfs stuff into intel_fbc.c
:::::: branch date: 30 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-c001-20211207 (https://download.01.org/0day-ci/arch=
ive/20211209/202112092122.JmAXmYU0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fbc.c:1715:0-23: WARNING: intel_fbc_d=
ebugfs_false_color_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2627424578594051494==--

