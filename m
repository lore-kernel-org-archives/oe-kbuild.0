Content-Type: multipart/mixed; boundary="===============3350726923669398894=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arnd-playground:to-build 7/7] arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be declared with const [constParameter]
Date: Thu, 28 Apr 2022 09:59:57 +0800
Message-ID: <202204280421.d5sJs79q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3350726923669398894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git=
 to-build
head:   78e0e09340fa7778055d35fc32d88a6b6d699c6a
commit: 78e0e09340fa7778055d35fc32d88a6b6d699c6a [7/7] ARM: use dma-direct =
unconditionally
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 78e0e09340fa7778055d35fc32d88a6b6d699c6a
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm/mm/ioremap.c:72:46: warning: Parameter 'vaddr' can be declared =
with const [constParameter]
   struct static_vm *find_static_vm_vaddr(void *vaddr)
                                                ^
>> arch/arm/mm/ioremap.c:85:11: warning: Uninitialized variables: svm.vm, s=
vm.list [uninitvar]
      return svm;
             ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:81:16: note: Assuming condition is false
     if (vm->addr > vaddr)
                  ^
   arch/arm/mm/ioremap.c:85:11: note: Uninitialized variables: svm.vm, svm.=
list
      return svm;
             ^
--
>> arch/arm/mm/dma-mapping.c:77:57: warning: Parameter 'virt' can be declar=
ed with const [constParameter]
   static struct arm_dma_buffer *arm_dma_buffer_find(void *virt)
                                                           ^
>> arch/arm/mm/dma-mapping.c:84:12: warning: Uninitialized variable: buf->v=
irt [uninitvar]
     if (buf->virt =3D=3D virt) {
              ^

vim +/virt +77 arch/arm/mm/dma-mapping.c

19e6e5e5392bd64 Rabin Vincent 2016-03-03  76  =

19e6e5e5392bd64 Rabin Vincent 2016-03-03 @77  static struct arm_dma_buffer =
*arm_dma_buffer_find(void *virt)
19e6e5e5392bd64 Rabin Vincent 2016-03-03  78  {
19e6e5e5392bd64 Rabin Vincent 2016-03-03  79  	struct arm_dma_buffer *buf, =
*found =3D NULL;
19e6e5e5392bd64 Rabin Vincent 2016-03-03  80  	unsigned long flags;
19e6e5e5392bd64 Rabin Vincent 2016-03-03  81  =

19e6e5e5392bd64 Rabin Vincent 2016-03-03  82  	spin_lock_irqsave(&arm_dma_b=
ufs_lock, flags);
19e6e5e5392bd64 Rabin Vincent 2016-03-03  83  	list_for_each_entry(buf, &ar=
m_dma_bufs, list) {
19e6e5e5392bd64 Rabin Vincent 2016-03-03 @84  		if (buf->virt =3D=3D virt) {
19e6e5e5392bd64 Rabin Vincent 2016-03-03  85  			list_del(&buf->list);
19e6e5e5392bd64 Rabin Vincent 2016-03-03  86  			found =3D buf;
19e6e5e5392bd64 Rabin Vincent 2016-03-03  87  			break;
19e6e5e5392bd64 Rabin Vincent 2016-03-03  88  		}
19e6e5e5392bd64 Rabin Vincent 2016-03-03  89  	}
19e6e5e5392bd64 Rabin Vincent 2016-03-03  90  	spin_unlock_irqrestore(&arm_=
dma_bufs_lock, flags);
19e6e5e5392bd64 Rabin Vincent 2016-03-03  91  	return found;
19e6e5e5392bd64 Rabin Vincent 2016-03-03  92  }
19e6e5e5392bd64 Rabin Vincent 2016-03-03  93  =


:::::: The code at line 77 was first introduced by commit
:::::: 19e6e5e5392bd646c93d9e2c7b2b58c8558cb041 ARM: 8547/1: dma-mapping: s=
tore buffer information

:::::: TO: Rabin Vincent <rabin@rab.in>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3350726923669398894==--

