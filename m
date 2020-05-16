Content-Type: multipart/mixed; boundary="===============6717576161232262815=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [dhowells-fs:fscache-iter 37/61] fs/fscache/read_helper.c:82:2-5: WARNING: Use BUG_ON instead of if condition followed by BUG.
Date: Sat, 16 May 2020 23:11:19 +0800
Message-ID: <202005162307.aNuapYqj%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6717576161232262815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it fscache-iter
head:   59f33c90ef6c1a75d4af75e5f60d98c0d965b6a2
commit: 6c92415d2d3a9828ec57bd41203f248822ab0b22 [37/61] fscache: Add read =
helper
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> fs/fscache/read_helper.c:82:2-5: WARNING: Use BUG_ON instead of if condi=
tion followed by BUG.
   Please make sure the condition has no side effects (see conditional BUG_=
ON definition in include/asm-generic/bug.h)

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6717576161232262815==--

