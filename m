Content-Type: multipart/mixed; boundary="===============3422537734678275974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ntfs3/ntfs_fs.h:1004:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Thu, 17 Mar 2022 06:12:39 +0800
Message-ID: <202203170622.pdtj92Ml-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3422537734678275974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/=
Kconfig and fs/Makefile
date:   7 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 7 months ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/ntfs3/fsntfs.c:
>> fs/ntfs3/ntfs_fs.h:1004:2: warning: Non-boolean value returned from func=
tion returning bool [returnNonBoolInBooleanFunction]
    return ni->ni_flags & NI_FLAG_DEDUPLICATED;
    ^
>> fs/ntfs3/fsntfs.c:1289:2: warning: Possible null pointer dereference: nb=
 [nullPointer]
    nb->nbufs =3D 0;
    ^
   fs/ntfs3/fsntfs.c:2049:31: note: Calling function 'ntfs_read_run_nb', 6t=
h argument 'NULL' value is 0
             sizeof(d_security), NULL);
                                 ^
   fs/ntfs3/fsntfs.c:1289:2: note: Null pointer dereference
    nb->nbufs =3D 0;
    ^

vim +1004 fs/ntfs3/ntfs_fs.h

4534a70b7056fd4 Konstantin Komarov 2021-08-13  1001  =

4534a70b7056fd4 Konstantin Komarov 2021-08-13  1002  static inline bool is_=
dedup(const struct ntfs_inode *ni)
4534a70b7056fd4 Konstantin Komarov 2021-08-13  1003  {
4534a70b7056fd4 Konstantin Komarov 2021-08-13 @1004  	return ni->ni_flags &=
 NI_FLAG_DEDUPLICATED;
4534a70b7056fd4 Konstantin Komarov 2021-08-13  1005  }
4534a70b7056fd4 Konstantin Komarov 2021-08-13  1006  =


:::::: The code at line 1004 was first introduced by commit
:::::: 4534a70b7056fd4b9a1c6db5a4ce3c98546b291e fs/ntfs3: Add headers and m=
isc files

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3422537734678275974==--

