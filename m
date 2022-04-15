Content-Type: multipart/mixed; boundary="===============5597966129997542773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3730/4328] mm/memory.c: linux/mm_inline.h is included more than once.
Date: Sat, 16 Apr 2022 01:45:23 +0800
Message-ID: <202204160134.WOzqtdZH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5597966129997542773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Peter Xu <peterx@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   40354149f4d738dc3492d9998e45b3f02950369a
commit: d2d293faec99124d95590e88030ae3c8382fac7f [3730/4328] mm/shmem: pers=
ist uffd-wp bit across zapping for file-backed
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> mm/memory.c: linux/mm_inline.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5597966129997542773==--

