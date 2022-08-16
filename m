Content-Type: multipart/mixed; boundary="===============8713806272780749692=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 33/33] drivers/gpu/arm/mali/tl/mali_kbase_tracepoints.c: mali_kbase_mipe_gen_header.h is included more than once.
Date: Wed, 17 Aug 2022 03:24:35 +0800
Message-ID: <202208170346.yclGFzyx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8713806272780749692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   88c551a87b8ae839bc75e0b1e98f87a04fa278c3
commit: 2542013a4879415917bc6db20170147df8f4ccba [33/33] CHROMIUM: gpu: mal=
i: Rename driver path
:::::: branch date: 8 hours ago
:::::: commit date: 4 days ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/arm/mali/tl/mali_kbase_tracepoints.c: mali_kbase_mipe_gen_he=
ader.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8713806272780749692==--

