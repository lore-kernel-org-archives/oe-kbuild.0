Content-Type: multipart/mixed; boundary="===============0551841685991260480=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] mm: adds NOSIGBUS extension for out-of-band shmem read
Date: Wed, 02 Jun 2021 08:16:42 +0800
Message-ID: <202106020821.wQc8ZPil-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0551841685991260480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1622589753-9206-3-git-send-email-mlin@kernel.org>
References: <1622589753-9206-3-git-send-email-mlin@kernel.org>
TO: "Ming Lin-SSI" <mlin@kernel.org>
TO: Linus Torvalds <torvalds@linux-foundation.org>
CC: LKML <linux-kernel@vger.kernel.org>
TO: Hugh Dickins <hughd@google.com>
TO: Simon Ser <contact@emersion.fr>
CC: linux-mm(a)kvack.org
CC: "Ming Lin-SSI" <mlin@kernel.org>

Hi Ming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on arm64/for-next/core powerpc/next asm-generic/ma=
ster linus/master v5.13-rc4]
[cannot apply to hnaz-linux-mm/master tip/x86/core next-20210601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ming-Lin/mm-adds-MAP_NOSIG=
BUS-extension-for-shmem-read/20210602-072403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
dd860052c99b1e088352bdd4fb7aef46f8d2ef47
:::::: branch date: 52 minutes ago
:::::: commit date: 52 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/asm-generic/mman-commo=
n.h' differs from latest version at 'include/uapi/asm-generic/mman-common.h=
':   32> #define MAP_NOSIGBUS		0x200000	/* do not SIGBUS on out-of-band shm=
em read */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0551841685991260480==--

