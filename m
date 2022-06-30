Content-Type: multipart/mixed; boundary="===============2915643589326861673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.15 3/63] sound/soc/sof/amd/acp-common.c: ../sof-audio.h is included more than once.
Date: Thu, 30 Jun 2022 08:51:41 +0800
Message-ID: <202206300842.MGGpR69i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2915643589326861673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.15
head:   dd04e927ac7a3637e375c92b3a6b4ceb3fc8e867
commit: ecc4093b35607454e588544176df93257b7b3459 [3/63] CHROMIUM: ASoC: SOF=
: amd: Make ACP core code generic for newer SOC transition
:::::: branch date: 27 hours ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> sound/soc/sof/amd/acp-common.c: ../sof-audio.h is included more than onc=
e.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2915643589326861673==--

