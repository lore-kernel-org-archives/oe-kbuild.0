Content-Type: multipart/mixed; boundary="===============6174323796575308438=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/boot/compressed/../string.h:15:23: warning: '__builtin_memcpy' reading 52 bytes from a region of size 0
Date: Fri, 01 Apr 2022 03:37:34 +0800
Message-ID: <202204010318.cvt0HPzm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6174323796575308438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arvind Sankar <nivedita@alum.mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: 394b19d6cb58ae292c0e1ad6b893fed8ece477ce x86/boot/compressed: Use b=
uiltin mem functions for decompressor
date:   1 year, 7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
401/202204010318.cvt0HPzm-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D394b19d6cb58ae292c0e1ad6b893fed8ece477ce
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 394b19d6cb58ae292c0e1ad6b893fed8ece477ce
        # save the config file to linux build tree
         =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/boot/compressed/misc.c:18:
   In function 'parse_elf',
       inlined from 'extract_kernel' at arch/x86/boot/compressed/misc.c:442=
:2:
>> arch/x86/boot/compressed/../string.h:15:23: warning: '__builtin_memcpy' =
reading 52 bytes from a region of size 0 [-Wstringop-overread]
      15 | #define memcpy(d,s,l) __builtin_memcpy(d,s,l)
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/boot/compressed/misc.c:283:9: note: in expansion of macro 'memc=
py'
     283 |         memcpy(&ehdr, output, sizeof(ehdr));
         |         ^~~~~~


vim +/__builtin_memcpy +15 arch/x86/boot/compressed/../string.h

c041b5ad8640dd Vivek Goyal   2014-03-18  13  =

394b19d6cb58ae Arvind Sankar 2020-08-04  14  /* Access builtin version by d=
efault. */
c041b5ad8640dd Vivek Goyal   2014-03-18 @15  #define memcpy(d,s,l) __builti=
n_memcpy(d,s,l)
c041b5ad8640dd Vivek Goyal   2014-03-18  16  #define memset(d,c,l) __builti=
n_memset(d,c,l)
fb4cac573ef6dc Vivek Goyal   2014-03-18  17  #define memcmp	__builtin_memcmp
c041b5ad8640dd Vivek Goyal   2014-03-18  18  =


:::::: The code at line 15 was first introduced by commit
:::::: c041b5ad8640dd89ccf1411cd2636ef7c1cfee92 x86, boot: Create a separat=
e string.h file to provide standard string functions

:::::: TO: Vivek Goyal <vgoyal@redhat.com>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6174323796575308438==--

