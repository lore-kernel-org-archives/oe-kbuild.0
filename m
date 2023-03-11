Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D427B
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678515885; x=1710051885;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OIl9DRGpwzCak8XYKUpbmFvrxEMjnzFqGVenbpS6L7k=;
  b=WP606G6XHbDN6X2CIC+7eJ1pHE5bvhn/lEdTU9FTKF+xsHKFdcbjLW6S
   FY2+fh+9SZGhRQFZrHi6GtIX+N6muTh8+jPwbs+TdaPRi4NTVzMtgvmbK
   +WR1o99eWJhJk7suCbvt8hl+gVcCQxG+C1fI5/nXLE1zXItDgtdMZxv1h
   zCZ1RAz/NHZLIw19wbYwiajXdWM9hyzXGGue0ke1xUjzESD6yJTpbietM
   8PdnEnK1J+YnOULwB5UQUfi9EZGFH02qE9y/xioT8h3rPvlK4bZ+W0A0O
   KGYOfyHtFI2HhTd4D+7X9cQa5bUts9HeYPzBT9tp2aTOIm1tqBgaKBW1N
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401743305"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="401743305"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 22:24:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="1007381799"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="1007381799"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Mar 2023 22:24:43 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paseo-0004PB-2W;
	Sat, 11 Mar 2023 06:24:42 +0000
Date: Sat, 11 Mar 2023 14:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/include/asm/uaccess.h:566:9: warning: use of NULL 'key'
 where non-null expected [CWE-476]
Message-ID: <202303111428.ic2TILDg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/include/asm/uaccess.h:566:9: warning: use of NULL 'key' where non=
-null expected [CWE-476] [-Wanalyzer-null-argument]"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: Christoph Hellwig <hch@lst.de>
CC: "Christian Brauner (Microsoft)" <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef5f68cc1f829b492b19cd4df5af4454aa816b93
commit: 0e3c3b901c00364198d31482fa2552ccf2d5c899 No need of likely/unlikely=
 on calls of check_copy_size()
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20230310 (https://download.01.org/0day-ci/archi=
ve/20230311/202303111428.ic2TILDg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0e3c3b901c00364198d31482fa2552ccf2d5c899
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0e3c3b901c00364198d31482fa2552ccf2d5c899
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error'=20

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303111428.ic2TILDg-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
                            | 1270 | static void *___bpf_copy_key(bpfptr_t =
ukey, u64 key_size)
                            |      |              ^~~~~~~~~~~~~~~
                            |      |              |
                            |      |              (44) entry to '___bpf_cop=
y_key'
                            | 1271 | {
                            | 1272 |         if (key_size)
                            |      |            ~ =20
                            |      |            |
                            |      |            (45) following 'true' branc=
h (when 'key_size !=3D 0')...
                            | 1273 |                 return kvmemdup_bpfptr=
(ukey, key_size);
                            |      |                        ~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
                            |      |                        |
                            |      |                        (46) ...to here
                            |      |                        (47) calling 'k=
vmemdup_bpfptr' from '___bpf_copy_key'
                            |
                            +--> 'kvmemdup_bpfptr': events 48-51
                                   |
                                   |include/linux/bpfptr.h:66:21:
                                   |   66 | static inline void *kvmemdup_bp=
fptr(bpfptr_t src, size_t len)
                                   |      |                     ^~~~~~~~~~~=
~~~~
                                   |      |                     |
                                   |      |                     (48) entry =
to 'kvmemdup_bpfptr'
                                   |......
                                   |   70 |         if (!p)
                                   |      |            ~        =20
                                   |      |            |
                                   |      |            (49) following 'fals=
e' branch...
                                   |   71 |                 return ERR_PTR(=
-ENOMEM);
                                   |   72 |         if (copy_from_bpfptr(p,=
 src, len)) {
                                   |      |             ~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |      |             |
                                   |      |             (50) ...to here
                                   |      |             (51) calling 'copy_=
=66rom_bpfptr' from 'kvmemdup_bpfptr'
                                   |
                                   +--> 'copy_from_bpfptr': events 52-53
                                          |
                                          |   52 |         return copy_from=
_sockptr_offset(dst, (sockptr_t) src, offset, size);
                                          |      |                ~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |                |
                                          |      |                (53) call=
ing 'copy_from_sockptr_offset' from 'copy_from_bpfptr'
                                          |......
                                          |   55 | static inline int copy_f=
rom_bpfptr(void *dst, bpfptr_t src, size_t size)
                                          |      |                   ^~~~~~=
~~~~~~~~~~
                                          |      |                   |
                                          |      |                   (52) e=
ntry to 'copy_from_bpfptr'
                                          |
                                          +--> 'copy_from_sockptr_offset': =
event 54
                                                 |
                                                 |include/linux/sockptr.h:4=
4:19:
                                                 |   44 | static inline int=
 copy_from_sockptr_offset(void *dst, sockptr_t src,
                                                 |      |                  =
 ^~~~~~~~~~~~~~~~~~~~~~~~
                                                 |      |                  =
 |
                                                 |      |                  =
 (54) entry to 'copy_from_sockptr_offset'
                                                 |
                                               'copy_from_sockptr_offset': =
event 55
                                                 |
                                                 |cc1:
                                                 | (55): '=1B[01m=1B[Ksrc.<=
U7098>.kernel=1B[m=1B[K' is NULL
                                                 |
                                               'copy_from_sockptr_offset': =
events 56-58
                                                 |
                                                 |   47 |         if (!sock=
ptr_is_kernel(src))
                                                 |      |            ^
                                                 |      |            |
                                                 |      |            (56) f=
ollowing 'false' branch (when '<unknown> =3D=3D 0')...
                                                 |   48 |                 r=
eturn copy_from_user(dst, src.user + offset, size);
                                                 |      |                  =
                          ~~~~~~~~~~~~~~~~~
                                                 |      |                  =
                                   |
                                                 |      |                  =
                                   (57) ...to here
                                                 |      |                  =
                                   (58) 'src.<U7098>.user' is NULL
                                                 |
                                               'copy_from_sockptr_offset': =
events 59-60
                                                 |
                                                 |include/linux/thread_info=
=2Eh:233:12:
                                                 |  198 |         if (!__bu=
iltin_constant_p(n))
                                                 |      |              ~~~~=
~~~~~~~~~~~~~~~~~~~
                                                 |      |              |
                                                 |      |              (60)=
 ...to here
                                                 |......
                                                 |  233 |         if (WARN_=
ON_ONCE(bytes > INT_MAX))
                                                 |      |            ^
                                                 |      |            |
                                                 |      |            (59) f=
ollowing 'false' branch...
                                                 |
                                               'copy_from_sockptr_offset': =
event 61
                                                 |
                                                 |arch/arm/include/asm/uacc=
ess.h:560:9:
                                                 |  560 |         memcpy(to=
, (const void __force *)from, n);
                                                 |      |         ^~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                 |      |         |
                                                 |      |         (61) argu=
ment 2 ('src.<U7098>.user + offset') NULL where non-null expected
                                                 |
   arch/arm/include/asm/string.h: In function 'copy_from_sockptr_offset':
   arch/arm/include/asm/string.h:20:15: note: argument 2 of 'memcpy' must b=
e non-null
      20 | extern void * memcpy(void *, const void *, __kernel_size_t);
         |               ^~~~~~
   In function 'raw_copy_to_user',
       inlined from '_copy_to_user' at include/linux/uaccess.h:139:7,
       inlined from 'copy_to_user' at include/linux/uaccess.h:160:7,
       inlined from 'map_get_next_key' at kernel/bpf/syscall.c:1525:6:
>> arch/arm/include/asm/uaccess.h:566:9: warning: use of NULL 'key' where n=
on-null expected [CWE-476] [-Wanalyzer-null-argument]
     566 |         memcpy((void __force *)to, from, n);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     '__se_sys_bpf': event 1
       |
       |include/linux/syscalls.h:247:25:
       |  247 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__=
VA_ARGS__))  \
       |      |                         ^~~~~~~~
       |      |                         |
       |      |                         (1) entry to '__se_sys_bpf'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
       |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
       |  219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##na=
me, __VA_ARGS__)
       |      |                                    ^~~~~~~~~~~~~~~
   kernel/bpf/syscall.c:5019:1: note: in expansion of macro 'SYSCALL_DEFINE=
3'
       | 5019 | SYSCALL_DEFINE3(bpf, int, cmd, union bpf_attr __user *, uat=
tr, unsigned int, size)
       |      | ^~~~~~~~~~~~~~~
       |
     '__se_sys_bpf': event 2
       |
       | 5021 |         return __sys_bpf(cmd, USER_BPFPTR(uattr), size);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling '__sys_bpf' from '__se_sys_bpf'
       |
       +--> '__sys_bpf': events 3-4
              |
              | 4863 | static int __sys_bpf(int cmd, bpfptr_t uattr, unsign=
ed int size)
              |      |            ^~~~~~~~~
              |      |            |
              |      |            (3) entry to '__sys_bpf'
              |......
              | 4883 |         err =3D bpf_check_uarg_tail_zero(uattr, size=
of(attr), size);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |               |
              |      |               (4) calling 'bpf_check_uarg_tail_zero'=
 from '__sys_bpf'
              |
              +--> 'bpf_check_uarg_tail_zero': events 5-7
                     |
                     |   80 | int bpf_check_uarg_tail_zero(bpfptr_t uaddr,
                     |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (5) entry to 'bpf_check_uarg_tail_zero'
                     |......
                     |   86 |         if (unlikely(actual_size > PAGE_SIZE)=
)  /* silly large */
                     |      |            ~
                     |      |            |
                     |      |            (6) following 'false' branch...
                     |......
                     |   89 |         if (actual_size <=3D expected_size)
                     |      |            ~
                     |      |            |
                     |      |            (7) ...to here
                     |
              <------+
              |
            '__sys_bpf': events 8-9
              |
              | 4883 |         err =3D bpf_check_uarg_tail_zero(uattr, size=
of(attr), size);
              |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
              |      |               |
              |      |               (8) returning to '__sys_bpf' from 'bpf=
_check_uarg_tail_zero'
              | 4884 |         if (err)
              |      |            ~  =20
              |      |            |
              |      |            (9) following 'false' branch (when 'err =
=3D=3D 0')...
              |
            '__sys_bpf': event 10
              |
              |include/linux/minmax.h:28:43:
              |   28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
              |      |                         ~~~~~~~~~~~~~~~~~~^~~~~~
              |      |                                           |
              |      |                                           (10) ...to=
 here
   include/linux/minmax.h:33:17: note: in expansion of macro '__cmp'
              |   33 |                 __cmp(unique_x, unique_y, op); })
              |      |                 ^~~~~
   include/linux/minmax.h:38:17: note: in expansion of macro '__cmp_once'
              |   38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), _=
_UNIQUE_ID(__y), op))
              |      |                 ^~~~~~~~~~
   include/linux/minmax.h:104:33: note: in expansion of macro '__careful_cm=
p'
              |  104 | #define min_t(type, x, y)       __careful_cmp((type)=
(x), (type)(y), <)
              |      |                                 ^~~~~~~~~~~~~
   kernel/bpf/syscall.c:4886:16: note: in expansion of macro 'min_t'
              | 4886 |         size =3D min_t(u32, size, sizeof(attr));
              |      |                ^~~~~
              |
            '__sys_bpf': event 11
              |
              | 4890 |         if (copy_from_bpfptr(&attr, uattr, size) !=
=3D 0)
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (11) calling 'copy_from_bpfptr' from '__=
sys_bpf'
              |
              +--> 'copy_from_bpfptr': events 12-13
                     |
                     |include/linux/bpfptr.h:55:19:
                     |   52 |         return copy_from_sockptr_offset(dst, =
(sockptr_t) src, offset, size);
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/key +566 arch/arm/include/asm/uaccess.h

3fba7e23f754a9 arch/arm/include/asm/uaccess.h Russell King   2015-08-19  55=
5 =20
9641c7cc5a7f6d include/asm-arm/uaccess.h      Russell King   2006-06-21  55=
6  #else
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  55=
7  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  55=
8  raw_copy_from_user(void *to, const void __user *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  55=
9  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
0  	memcpy(to, (const void __force *)from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
1  	return 0;
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  56=
2  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
3  static inline unsigned long
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
4  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
32b143637e8180 arch/arm/include/asm/uaccess.h Kees Cook      2017-02-16  56=
5  {
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21 @56=
6  	memcpy((void __force *)to, from, n);
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
7  	return 0;
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  56=
8  }
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  56=
9  #define __clear_user(addr, n)		(memset((void __force *)addr, 0, n), 0)
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
0  #endif
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
1  #define INLINE_COPY_TO_USER
4de5b63e76b2e6 arch/arm/include/asm/uaccess.h Al Viro        2017-03-21  57=
2  #define INLINE_COPY_FROM_USER
^1da177e4c3f41 include/asm-arm/uaccess.h      Linus Torvalds 2005-04-16  57=
3 =20

:::::: The code at line 566 was first introduced by commit
:::::: 4de5b63e76b2e672478e49622dabe2666b7f727f arm: switch to RAW_COPY_USER

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
