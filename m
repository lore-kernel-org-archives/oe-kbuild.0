Content-Type: multipart/mixed; boundary="===============5044145422583015608=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declared with const [constParameter]
Date: Sat, 28 May 2022 04:46:19 +0800
Message-ID: <202205280402.50FJNHdt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5044145422583015608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7e284070abe53d448517b80493863595af4ab5f0
commit: c7ed509b21b6566990ff39a6744cd5e214b5dca9 s390/nmi: disable interrup=
ts on extended save area update
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout c7ed509b21b6566990ff39a6744cd5e214b5dca9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/s390/mm/mmap.c:74:51: warning: Parameter 'filp' can be declared wit=
h const [constParameter]
   unsigned long arch_get_unmapped_area(struct file *filp, unsigned long ad=
dr,
                                                     ^
   arch/s390/mm/mmap.c:113:59: warning: Parameter 'filp' can be declared wi=
th const [constParameter]
   unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned=
 long addr,
                                                             ^
--
>> arch/s390/kernel/vdso.c:177:30: warning: Subtracting pointers that point=
 to different objects [comparePointers]
     vdso_text_len =3D vdso32_end - vdso32_start;
                                ^
   arch/s390/kernel/vdso.c:23:29: note: Variable declared here.
   extern char vdso32_start[], vdso32_end[];
                               ^
   arch/s390/kernel/vdso.c:177:19: note: Array decayed to pointer here.
     vdso_text_len =3D vdso32_end - vdso32_start;
                     ^
   arch/s390/kernel/vdso.c:23:13: note: Variable declared here.
   extern char vdso32_start[], vdso32_end[];
               ^
   arch/s390/kernel/vdso.c:177:32: note: Array decayed to pointer here.
     vdso_text_len =3D vdso32_end - vdso32_start;
                                  ^
   arch/s390/kernel/vdso.c:177:30: note: Subtracting pointers that point to=
 different objects
     vdso_text_len =3D vdso32_end - vdso32_start;
                                ^
   arch/s390/kernel/vdso.c:180:30: warning: Subtracting pointers that point=
 to different objects [comparePointers]
     vdso_text_len =3D vdso64_end - vdso64_start;
                                ^
   arch/s390/kernel/vdso.c:22:29: note: Variable declared here.
   extern char vdso64_start[], vdso64_end[];
                               ^
   arch/s390/kernel/vdso.c:180:19: note: Array decayed to pointer here.
     vdso_text_len =3D vdso64_end - vdso64_start;
                     ^
   arch/s390/kernel/vdso.c:22:13: note: Variable declared here.
   extern char vdso64_start[], vdso64_end[];
               ^
   arch/s390/kernel/vdso.c:180:32: note: Array decayed to pointer here.
     vdso_text_len =3D vdso64_end - vdso64_start;
                                  ^
   arch/s390/kernel/vdso.c:180:30: note: Subtracting pointers that point to=
 different objects
     vdso_text_len =3D vdso64_end - vdso64_start;
                                ^
>> arch/s390/kernel/vdso.c:213:66: warning: Parameter 'end' can be declared=
 with const [constParameter]
   static struct page ** __init vdso_setup_pages(void *start, void *end)
                                                                    ^
>> arch/s390/lib/spinlock.c:80:11: warning: Uninitialized variable: owner [=
uninitvar]
     : "=3Dd" (owner) : "Q" (*lock) : "memory");
             ^
--
>> arch/s390/kernel/nmi.c:109:26: warning: Parameter 'mcesad' can be declar=
ed with const [constParameter]
   void nmi_free_mcesa(u64 *mcesad)
                            ^

vim +/mcesad +109 arch/s390/kernel/nmi.c

6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  108  =

c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10 @109  =
void nmi_free_mcesa(u64 *mcesad)
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  110  {
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  111  =
	if (!nmi_needs_mcesa())
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  112  =
		return;
c7ed509b21b656 arch/s390/kernel/nmi.c  Alexander Gordeev  2021-12-10  113  =
	kmem_cache_free(mcesa_cache, __va(*mcesad & MCESA_ORIGIN_MASK));
6c81511ca1f52a arch/s390/kernel/nmi.c  Martin Schwidefsky 2017-10-12  114  }
77fa22450de00d drivers/s390/s390mach.c Heiko Carstens     2005-06-25  115  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5044145422583015608==--

