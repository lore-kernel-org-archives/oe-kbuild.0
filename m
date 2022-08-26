Content-Type: multipart/mixed; boundary="===============4450805030731926760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 57/57] drivers/gpu/arm/mali/tl/mali_kbase_tracepoints.c: mali_kbase_mipe_gen_header.h is included more than once.
Date: Fri, 26 Aug 2022 11:59:33 +0800
Message-ID: <202208261159.Pn2jZVLi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4450805030731926760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

Hi Fei,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   050f5765755549f992e2cb52fd504aa82dcd612f
commit: 62c8f0ef54f519e80ccb82f9698073947c04db55 [57/57] CHROMIUM: gpu: mal=
i: Rename driver path
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/arm/mali/tl/mali_kbase_tracepoints.c: mali_kbase_mipe_gen_he=
ader.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4450805030731926760==--

