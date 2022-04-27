Content-Type: multipart/mixed; boundary="===============4146625568599555456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6864/6873] sound/soc/intel/avs/path.c: sound/intel-nhlt.h is included more than once.
Date: Wed, 27 Apr 2022 13:37:37 +0800
Message-ID: <202204271303.yKyB5JCY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4146625568599555456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Stephen Rothwell <sfr@canb.auug.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   088fb7eff3496e0f61fdf68bda89b81a4d0a4434
commit: a607085a8dced023059e651d83b57e7ea227bedd [6864/6873] fixup for "ASo=
C: Intel: avs: Configure modules according to their type"
:::::: branch date: 20 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> sound/soc/intel/avs/path.c: sound/intel-nhlt.h is included more than onc=
e.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4146625568599555456==--

