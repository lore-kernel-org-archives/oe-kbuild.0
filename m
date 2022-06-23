Content-Type: multipart/mixed; boundary="===============3828862774836150687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-common:android13-5.15-2022-06 11181/11215] include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more than once.
Date: Thu, 23 Jun 2022 15:49:31 +0800
Message-ID: <202206231501.0pGSvAuU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3828862774836150687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-2022-=
06
head:   f1bf82c3dacdcb078c472db50d538aa2cea69acf
commit: d5f809c84dc6c322e2650228fa60387f9fc38432 [11181/11215] ANDROID: GKI=
: use public type definitions in vendor hooks
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> include/trace/hooks/remoteproc.h: linux/remoteproc.h is included more th=
an once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3828862774836150687==--

