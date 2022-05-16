Content-Type: multipart/mixed; boundary="===============3217975296391487647=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-4.4 6/10] drivers/hid/hid-nintendo.c:318:11-15: Move constant to right.
Date: Tue, 17 May 2022 05:05:45 +0800
Message-ID: <202205170506.hZQDiFfW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3217975296391487647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-4.4
head:   7dda0570f391f24b3a62963b89d8e252ab55bf95
commit: ec6866324231b225d800ccda7868d565c65c60af [6/10] UPSTREAM: HID: nint=
endo: add nintendo switch controller driver
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c002-20220516 (https://download.01.org/0day-ci/ar=
chive/20220517/202205170506.hZQDiFfW-lkp(a)intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/hid/hid-nintendo.c:318:11-15: Move constant to right.
   drivers/hid/hid-nintendo.c:319:11-15: Move constant to right.
   drivers/hid/hid-nintendo.c:320:11-15: Move constant to right.

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3217975296391487647==--

