Content-Type: multipart/mixed; boundary="===============3360871283570098974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7298/10218] init/initramfs.c:156:26: warning: Uninitialized variable: de->mtime [uninitvar]
Date: Tue, 10 May 2022 13:00:06 +0800
Message-ID: <202205101218.Rf8TWAaU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3360871283570098974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Disseldorp <ddiss@suse.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ab38272e99730375c5db3db1c4cebf691a0550ab
commit: 55230b38045d4ec286b62dc35ed8434f15b63511 [7298/10218] initramfs: ma=
ke dir_entry.name a flexible array member
:::::: branch date: 17 hours ago
:::::: commit date: 10 days ago
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 55230b38045d4ec286b62dc35ed8434f15b63511
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> init/initramfs.c:156:26: warning: Uninitialized variable: de->mtime [uni=
nitvar]
     do_utime(de->name, de->mtime);
                            ^

vim +156 init/initramfs.c

889d51a10712b6 Nye Liu 2008-10-15  150  =

889d51a10712b6 Nye Liu 2008-10-15  151  static void __init dir_utime(void)
889d51a10712b6 Nye Liu 2008-10-15  152  {
889d51a10712b6 Nye Liu 2008-10-15  153  	struct dir_entry *de, *tmp;
889d51a10712b6 Nye Liu 2008-10-15  154  	list_for_each_entry_safe(de, tmp, =
&dir_list, list) {
889d51a10712b6 Nye Liu 2008-10-15  155  		list_del(&de->list);
889d51a10712b6 Nye Liu 2008-10-15 @156  		do_utime(de->name, de->mtime);
889d51a10712b6 Nye Liu 2008-10-15  157  		kfree(de);
889d51a10712b6 Nye Liu 2008-10-15  158  	}
889d51a10712b6 Nye Liu 2008-10-15  159  }
889d51a10712b6 Nye Liu 2008-10-15  160  =


:::::: The code at line 156 was first introduced by commit
:::::: 889d51a10712b6fd6175196626de2116858394f4 initramfs: add option to pr=
eserve mtime from initramfs cpio images

:::::: TO: Nye Liu <nyet@nyet.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3360871283570098974==--

