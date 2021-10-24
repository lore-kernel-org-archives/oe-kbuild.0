Content-Type: multipart/mixed; boundary="===============7750057681963441778=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vgupta-arc:topic-zol-remove 70/187] arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Sun, 24 Oct 2021 18:03:19 +0800
Message-ID: <202110241811.suBINOtO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7750057681963441778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vineet Gupta <vgupta@synopsys.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git topi=
c-zol-remove
head:   f2709e461ce51e131e57d07a45a634f3b79b5298
commit: 0ce72856d001ca4a343064d9d909d454aba4a597 [70/187] ARCv3: 64-bit io =
accesses
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arc-randconfig-s032-20211019 (attached as .config)
compiler: arceb-elf-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/co=
mmit/?id=3D0ce72856d001ca4a343064d9d909d454aba4a597
        git remote add vgupta-arc https://git.kernel.org/pub/scm/linux/kern=
el/git/vgupta/arc.git
        git fetch --no-tags vgupta-arc topic-zol-remove
        git checkout 0ce72856d001ca4a343064d9d909d454aba4a597
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/goldfishfb.c: note: in included file (through includ=
e/linux/scatterlist.h, include/linux/dma-mapping.h):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
   drivers/video/fbdev/goldfishfb.c:275:34: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/video/fbdev/goldfishfb.c:295:51: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/gxt4500.c: note: in included file (through include/l=
inux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/s1d13xxxfb.c: note: in included file (through includ=
e/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/ocfb.c:327:24: sparse: sparse: incorrect type in ass=
ignment (different address spaces) @@     expected void [noderef] __iomem *=
fb_virt @@     got void * @@
   drivers/video/fbdev/ocfb.c:327:24: sparse:     expected void [noderef] _=
_iomem *fb_virt
   drivers/video/fbdev/ocfb.c:327:24: sparse:     got void *
   drivers/video/fbdev/ocfb.c:367:64: sparse: sparse: incorrect type in arg=
ument 3 (different address spaces) @@     expected void *cpu_addr @@     go=
t void [noderef] __iomem *fb_virt @@
   drivers/video/fbdev/ocfb.c:367:64: sparse:     expected void *cpu_addr
   drivers/video/fbdev/ocfb.c:367:64: sparse:     got void [noderef] __iome=
m *fb_virt
   drivers/video/fbdev/ocfb.c:380:32: sparse: sparse: incorrect type in arg=
ument 3 (different address spaces) @@     expected void *cpu_addr @@     go=
t void [noderef] __iomem *fb_virt @@
   drivers/video/fbdev/ocfb.c:380:32: sparse:     expected void *cpu_addr
   drivers/video/fbdev/ocfb.c:380:32: sparse:     got void [noderef] __iome=
m *fb_virt
   drivers/video/fbdev/ocfb.c: note: in included file (through include/linu=
x/scatterlist.h, include/linux/dma-mapping.h):
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
--
   drivers/video/fbdev/sm501fb.c: note: in included file (through include/l=
inux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
   arch/arc/include/asm/io.h:176:43: sparse: sparse: too many warnings
--
   drivers/i2c/busses/i2c-designware-common.c: note: in included file (thro=
ugh include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h,=
 ...):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:67:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned short const vola=
tile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr=
 @@
   arch/arc/include/asm/io.h:67:43: sparse:     expected unsigned short con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:67:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:67:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned short const vola=
tile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr=
 @@
   arch/arc/include/asm/io.h:67:43: sparse:     expected unsigned short con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:67:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:67:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned short const vola=
tile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr=
 @@
   arch/arc/include/asm/io.h:67:43: sparse:     expected unsigned short con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:67:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:67:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned short const vola=
tile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr=
 @@
   arch/arc/include/asm/io.h:67:43: sparse:     expected unsigned short con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:67:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
--
   drivers/i2c/busses/i2c-designware-platdrv.c: note: in included file (thr=
ough include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h=
, ...):
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/i2c/busses/i2c-rk3x.c: note: in included file (through include/l=
inux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/i2c/busses/i2c-simtec.c: note: in included file (through include=
/linux/io.h):
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
--
   drivers/i2c/busses/i2c-xiic.c: note: in included file (through include/l=
inux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:52:42: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned char const volat=
ile [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr =
@@
   arch/arc/include/asm/io.h:52:42: sparse:     expected unsigned char cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:52:42: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:152:42: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned char const vola=
tile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:152:42: sparse:     expected unsigned char con=
st volatile [usertype] *ptr
   arch/arc/include/asm/io.h:152:42: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:164:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned short const vol=
atile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:164:43: sparse:     expected unsigned short co=
nst volatile [usertype] *ptr
   arch/arc/include/asm/io.h:164:43: sparse:     got void volatile [noderef=
] __iomem *addr
   arch/arc/include/asm/io.h:82:43: sparse: sparse: too many warnings
--
   drivers/i2c/busses/i2c-brcmstb.c: note: in included file (through includ=
e/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c: note: in included file (through =
include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...=
):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/core/cfbcopyarea.c: note: in included file (through =
include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...=
):
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
--
   drivers/video/fbdev/core/cfbimgblt.c: note: in included file (through in=
clude/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr
>> arch/arc/include/asm/io.h:82:43: sparse: sparse: incorrect type in initi=
alizer (different address spaces) @@     expected unsigned int const volati=
le [usertype] *ptr @@     got void const volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:82:43: sparse:     expected unsigned int const=
 volatile [usertype] *ptr
   arch/arc/include/asm/io.h:82:43: sparse:     got void const volatile [no=
deref] __iomem *addr
>> arch/arc/include/asm/io.h:176:43: sparse: sparse: incorrect type in init=
ializer (different address spaces) @@     expected unsigned int const volat=
ile [usertype] *ptr @@     got void volatile [noderef] __iomem *addr @@
   arch/arc/include/asm/io.h:176:43: sparse:     expected unsigned int cons=
t volatile [usertype] *ptr
   arch/arc/include/asm/io.h:176:43: sparse:     got void volatile [noderef=
] __iomem *addr

vim +82 arch/arc/include/asm/io.h

1162b0701b14ba Vineet Gupta 2013-01-18   48  =

1162b0701b14ba Vineet Gupta 2013-01-18   49  #define __raw_readb __raw_readb
1162b0701b14ba Vineet Gupta 2013-01-18   50  static inline u8 __raw_readb(c=
onst volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18   51  {
0ce72856d001ca Vineet Gupta 2020-06-29  @52  	const volatile u8 __force *pt=
r =3D addr;
1162b0701b14ba Vineet Gupta 2013-01-18   53  	u8 b;
1162b0701b14ba Vineet Gupta 2013-01-18   54  =

1162b0701b14ba Vineet Gupta 2013-01-18   55  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18   56  	"	ldb%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18   57  	: "=3Dr" (b)
0ce72856d001ca Vineet Gupta 2020-06-29   58  	: "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18   59  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18   60  =

1162b0701b14ba Vineet Gupta 2013-01-18   61  	return b;
1162b0701b14ba Vineet Gupta 2013-01-18   62  }
1162b0701b14ba Vineet Gupta 2013-01-18   63  =

1162b0701b14ba Vineet Gupta 2013-01-18   64  #define __raw_readw __raw_readw
1162b0701b14ba Vineet Gupta 2013-01-18   65  static inline u16 __raw_readw(=
const volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18   66  {
0ce72856d001ca Vineet Gupta 2020-06-29  @67  	const volatile u16 __force *p=
tr =3D addr;
1162b0701b14ba Vineet Gupta 2013-01-18   68  	u16 s;
1162b0701b14ba Vineet Gupta 2013-01-18   69  =

1162b0701b14ba Vineet Gupta 2013-01-18   70  	__asm__ __volatile__(
d0b43ecbbd1ef0 Vineet Gupta 2020-06-25   71  	"	ldh%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18   72  	: "=3Dr" (s)
0ce72856d001ca Vineet Gupta 2020-06-29   73  	: "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18   74  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18   75  =

1162b0701b14ba Vineet Gupta 2013-01-18   76  	return s;
1162b0701b14ba Vineet Gupta 2013-01-18   77  }
1162b0701b14ba Vineet Gupta 2013-01-18   78  =

1162b0701b14ba Vineet Gupta 2013-01-18   79  #define __raw_readl __raw_readl
1162b0701b14ba Vineet Gupta 2013-01-18   80  static inline u32 __raw_readl(=
const volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18   81  {
0ce72856d001ca Vineet Gupta 2020-06-29  @82  	const volatile u32 __force *p=
tr =3D addr;
1162b0701b14ba Vineet Gupta 2013-01-18   83  	u32 w;
1162b0701b14ba Vineet Gupta 2013-01-18   84  =

1162b0701b14ba Vineet Gupta 2013-01-18   85  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18   86  	"	ld%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18   87  	: "=3Dr" (w)
0ce72856d001ca Vineet Gupta 2020-06-29   88  	: "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18   89  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18   90  =

1162b0701b14ba Vineet Gupta 2013-01-18   91  	return w;
1162b0701b14ba Vineet Gupta 2013-01-18   92  }
1162b0701b14ba Vineet Gupta 2013-01-18   93  =

0ce72856d001ca Vineet Gupta 2020-06-29   94  #ifdef CONFIG_64BIT
0ce72856d001ca Vineet Gupta 2020-06-29   95  =

0ce72856d001ca Vineet Gupta 2020-06-29   96  #define __raw_readq __raw_readq
0ce72856d001ca Vineet Gupta 2020-06-29   97  static inline u32 __raw_readq(=
const volatile void __iomem *addr)
0ce72856d001ca Vineet Gupta 2020-06-29   98  {
0ce72856d001ca Vineet Gupta 2020-06-29   99  	const volatile u64 __force *p=
tr =3D addr;
0ce72856d001ca Vineet Gupta 2020-06-29  100  	u64 q;
0ce72856d001ca Vineet Gupta 2020-06-29  101  =

0ce72856d001ca Vineet Gupta 2020-06-29  102  	__asm__ __volatile__(
0ce72856d001ca Vineet Gupta 2020-06-29  103  	"	ldl%U1 %0, %1	\n"
0ce72856d001ca Vineet Gupta 2020-06-29  104  	: "=3Dr" (q)
0ce72856d001ca Vineet Gupta 2020-06-29  105  	: "m" (*ptr)
0ce72856d001ca Vineet Gupta 2020-06-29  106  	: "memory");
0ce72856d001ca Vineet Gupta 2020-06-29  107  =

0ce72856d001ca Vineet Gupta 2020-06-29  108  	return q;
0ce72856d001ca Vineet Gupta 2020-06-29  109  }
0ce72856d001ca Vineet Gupta 2020-06-29  110  =

0ce72856d001ca Vineet Gupta 2020-06-29  111  #endif
0ce72856d001ca Vineet Gupta 2020-06-29  112  =

10d443431dc2bb Jose Abreu   2018-11-30  113  /*
10d443431dc2bb Jose Abreu   2018-11-30  114   * {read,write}s{b,w,l}() repe=
atedly access the same IO address in
10d443431dc2bb Jose Abreu   2018-11-30  115   * native endianness in 8-, 16=
-, 32-bit chunks {into,from} memory,
10d443431dc2bb Jose Abreu   2018-11-30  116   * @count times
10d443431dc2bb Jose Abreu   2018-11-30  117   */
10d443431dc2bb Jose Abreu   2018-11-30  118  #define __raw_readsx(t,f) \
10d443431dc2bb Jose Abreu   2018-11-30  119  static inline void __raw_reads=
##f(const volatile void __iomem *addr,	\
10d443431dc2bb Jose Abreu   2018-11-30  120  				  void *ptr, unsigned int =
count)	\
10d443431dc2bb Jose Abreu   2018-11-30  121  {									\
10d443431dc2bb Jose Abreu   2018-11-30  122  	bool is_aligned =3D ((unsigne=
d long)ptr % ((t) / 8)) =3D=3D 0;	\
10d443431dc2bb Jose Abreu   2018-11-30  123  	u##t *buf =3D ptr;						\
10d443431dc2bb Jose Abreu   2018-11-30  124  									\
10d443431dc2bb Jose Abreu   2018-11-30  125  	if (!count)							\
10d443431dc2bb Jose Abreu   2018-11-30  126  		return;							\
10d443431dc2bb Jose Abreu   2018-11-30  127  									\
10d443431dc2bb Jose Abreu   2018-11-30  128  	/* Some ARC CPU's don't suppo=
rt unaligned accesses */		\
10d443431dc2bb Jose Abreu   2018-11-30  129  	if (is_aligned) {						\
10d443431dc2bb Jose Abreu   2018-11-30  130  		do {							\
10d443431dc2bb Jose Abreu   2018-11-30  131  			u##t x =3D __raw_read##f(ad=
dr);			\
10d443431dc2bb Jose Abreu   2018-11-30  132  			*buf++ =3D x;					\
10d443431dc2bb Jose Abreu   2018-11-30  133  		} while (--count);					\
10d443431dc2bb Jose Abreu   2018-11-30  134  	} else {							\
10d443431dc2bb Jose Abreu   2018-11-30  135  		do {							\
10d443431dc2bb Jose Abreu   2018-11-30  136  			u##t x =3D __raw_read##f(ad=
dr);			\
10d443431dc2bb Jose Abreu   2018-11-30  137  			put_unaligned(x, buf++);			\
10d443431dc2bb Jose Abreu   2018-11-30  138  		} while (--count);					\
10d443431dc2bb Jose Abreu   2018-11-30  139  	}								\
10d443431dc2bb Jose Abreu   2018-11-30  140  }
10d443431dc2bb Jose Abreu   2018-11-30  141  =

10d443431dc2bb Jose Abreu   2018-11-30  142  #define __raw_readsb __raw_rea=
dsb
10d443431dc2bb Jose Abreu   2018-11-30  143  __raw_readsx(8, b)
10d443431dc2bb Jose Abreu   2018-11-30  144  #define __raw_readsw __raw_rea=
dsw
10d443431dc2bb Jose Abreu   2018-11-30  145  __raw_readsx(16, w)
10d443431dc2bb Jose Abreu   2018-11-30  146  #define __raw_readsl __raw_rea=
dsl
10d443431dc2bb Jose Abreu   2018-11-30  147  __raw_readsx(32, l)
10d443431dc2bb Jose Abreu   2018-11-30  148  =

1162b0701b14ba Vineet Gupta 2013-01-18  149  #define __raw_writeb __raw_wri=
teb
1162b0701b14ba Vineet Gupta 2013-01-18  150  static inline void __raw_write=
b(u8 b, volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18  151  {
0ce72856d001ca Vineet Gupta 2020-06-29 @152  	const volatile u8 __force *pt=
r =3D addr;
0ce72856d001ca Vineet Gupta 2020-06-29  153  =

1162b0701b14ba Vineet Gupta 2013-01-18  154  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18  155  	"	stb%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18  156  	:
0ce72856d001ca Vineet Gupta 2020-06-29  157  	: "r" (b), "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18  158  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18  159  }
1162b0701b14ba Vineet Gupta 2013-01-18  160  =

1162b0701b14ba Vineet Gupta 2013-01-18  161  #define __raw_writew __raw_wri=
tew
1162b0701b14ba Vineet Gupta 2013-01-18  162  static inline void __raw_write=
w(u16 s, volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18  163  {
0ce72856d001ca Vineet Gupta 2020-06-29 @164  	const volatile u16 __force *p=
tr =3D addr;
0ce72856d001ca Vineet Gupta 2020-06-29  165  =

1162b0701b14ba Vineet Gupta 2013-01-18  166  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18  167  	"	stw%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18  168  	:
0ce72856d001ca Vineet Gupta 2020-06-29  169  	: "r" (s), "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18  170  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18  171  }
1162b0701b14ba Vineet Gupta 2013-01-18  172  =

1162b0701b14ba Vineet Gupta 2013-01-18  173  #define __raw_writel __raw_wri=
tel
1162b0701b14ba Vineet Gupta 2013-01-18  174  static inline void __raw_write=
l(u32 w, volatile void __iomem *addr)
1162b0701b14ba Vineet Gupta 2013-01-18  175  {
0ce72856d001ca Vineet Gupta 2020-06-29 @176  	const volatile u32 __force *p=
tr =3D addr;
0ce72856d001ca Vineet Gupta 2020-06-29  177  =

1162b0701b14ba Vineet Gupta 2013-01-18  178  	__asm__ __volatile__(
1162b0701b14ba Vineet Gupta 2013-01-18  179  	"	st%U1 %0, %1	\n"
1162b0701b14ba Vineet Gupta 2013-01-18  180  	:
0ce72856d001ca Vineet Gupta 2020-06-29  181  	: "r" (w), "m" (*ptr)
1162b0701b14ba Vineet Gupta 2013-01-18  182  	: "memory");
1162b0701b14ba Vineet Gupta 2013-01-18  183  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7750057681963441778==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICLEodWEAAy5jb25maWcAnFzdj9u2sn/vXyEkwEX7kMZf+4WLfaApymYtiopI2d59EZyNkxrd
L9jenva/PzOUZJEStc69B2jW5gyH5HA485shfT7+8jEgb8eXp81x97B5fPw3+LF93u43x+234Pvu
cfu/QSiDROqAhVz/Dszx7vntn8+b/UNw8fvw4vfBp/3DZbDY7p+3jwF9ef6++/EGvXcvz798/IXK
JOKzgtJiyTLFZVJotta3H6D39uun7eP3Tz8eHoJfZ5T+FgyHv49+H3yw+nBVAOX237pp1si5HQ4H
o8HgxByTZHainZqJMjKSvJEBTTXbaHzVSIhDZJ1GYcMKTX5WizCwpjsH2USJYia1bKS0CIXMdZpr
L50nMU9Yh5TIIs1kxGNWRElBtM4aFp59KVYyWzQt05zHoeaCFZpMoYuSGY4Gm/ExmJmdfQwO2+Pb
a7M9POG6YMmyIBmsjguub8ej0ySkSHFozRTK+RhU7SuWZTILdofg+eWIEk/qkZTEtX4+fHDmVSgS
a6txTpasWLAsYXExu+dpswybEt8L0lBc9tN8LF7PpEIWkTzWZqnW+HXzXCqdEMFuP/z6/PK8/e3E
oO7UkqeWDVYN+JfquGlfEU3nxZec5fYGZlKpQjAhszvcOELnDTFXLObTemtgI4PD29fDv4fj9qnZ
mhlLWMap2Wc1lyvrMFSUlCUhT4wluGYRSkF44msr5pxlJKPzO1vfSQi7XDGUwk66tWcRsmk+i5St
44/B9vlb8PK9tYj2TClYxoItWaJVM66x1EWOFlhZmFGH3j1t9wefRub3sOSMy5BTe4pwSIDCYQ3u
zGyylzLns3mRMWVmkvnX1ZnNyajTqJ4xfPRNF5qNrZA4tqeLzXmSZnx5skEZRd7BXcG13DRjTKQa
FmY8xklw3b6UcZ5okt15F11xeQ5K3Z9K6F6vjab5Z705/BUcQRHBBuZ1OG6Oh2Dz8PDy9nzcPf9o
Fqw5XRTQoSDUyADbbHY7Vdz5clp8yBV6q9AspVr4T4zarAhH5ErGRIPbsddlFpDRPFDdzdGw2AJo
zZzgS8HWYGCWh1YOh+nTaiJqoUzXytQ9pE5THjJfu84I9cxJaTAg9MVCJi4lYQzcKpvRacyVdmkR
SSDcWM68aSxiRqLbUaNAI0vSKWrSYxet2cGJIWEhpvZ+uUpuJPNF+cFriXwxB0mtg3eKJBg24PzM
eaRvh1d2O+63IGubPmpsmCd6AbEmYm0ZY/sMGC6ehGztGbz2WorOQcHGd9XHQT38uf329rjdB9+3
m+PbfnswzZUaPNRTPJhlMk+VfV4hOFC/Zkrmcvz3GFIe+pRXUbPQxM52pwis+J75wjcoVjGtXJ8i
KQ5T0foHC9mSU+YZDjqCO3inZ+lI290EV/S90SASWcdUouOpSERbiAE0SBephO1GR69l5kyx3GCS
a2n6elUNHjxSMCB4R0p0z35kLCZ3nulO4wVqxmCPzMKX5jsRIFjJPAO9AS5phIUG4fgHCosp0Eae
sYBUoSWbe33fx2oBVfN90up5r3ToW5KUGCLws7NttJApxFF+D1BVZhio4Y8gCWW+beznLuT4PbkK
PngEtjHZyZE3pw1iDQcb9hm+mjEtwMtZ4drZfU8Uj0rU5A+xUvG1B1Q43seBBLnfD0yJglXnceyR
EuWQTzUTNV/hpLZgdNlMRbqmc2e/WCq9YhWfJSSOQpvXrCTyW74BdZHPUNQcHJyVfXFpy+SyyEEP
M09HEi45rLtSettlTkmWce8uLpD7TlgIs24pnD09tRr14tHVfGlBdzQSA03sjHABOnT0J6YsDJlv
4UbxaNHFCfE2pkGHg0kHo1QpdLrdf3/ZP22eH7YB+3v7DICHQGChCHkAhJZ4rJLTiPcix5+UWE95
KUphJfYDs3WOIKSBRBfTbOF3kDGZ9hDyqc8uYjl1nDD0h43NZqyGhH5p8zyKIE1JCTDCDkKqqb1J
KNiNZsLEAczVecSpQYatsAZJtd/8DNAxIUPZEMdNoE+2mlmID4ECBIpC5WkqHRhp4oyE7BqiL+Sa
hRHPrGT+lCip3D4zkKgVEdgn2D1k6QiTG6IQFlCEJIdLHBSQUeoRSyDfzCB8gYohUnUZ5isGyZA9
ZchYFyXma5ZjLBAmFZD9w5+74/YBMU6n8nPiSh83RzS/z+qFfp6+bPbfbBMGjiKFtRV6OhysvXt+
YiFr1eGp9qVnoFOkVQTFoAlTJx5UhOXIO3JNHXfOKo6HOLmn3oVTRoB6dTVw9rHQecIKASSrBoGM
U3QmkMcTC9wrYe1hkhnwdTtx9QI84GkweUwQ2jD/qTHTIWB+vVQsM3FKxbsMYYvBIoMZFksnZJtd
w1OKsbq4XvR0bFiGl4v+/hNf/3RWVrhi8FoQIUa23AiUqtAFN4CvtRpw/7TbqlYkZfaJ9+/06bDz
JF/jvwsTR24H/1wPyv+5HHDeOwxOBQLOdo+GFksShiXkuR1dXDomlmcZoEhY46ytOgZIp8ghiEMk
98en+9thM0uzh0yTFclYMcf1uKoJp50RwtUIBlhB+tQzcSz4QfZfhHpalLW1D65a3/EfJ0AjAReb
PO9eJkxmkCjeDoeWCxedo1m76I0l/dO37SsMDKEveHnFAQ7NWYVDU0Q2XICwMGV2Q8Z0u81Edw52
BY4W44hukTpCylaPpNK78uwLePiZ6kYN09GEAMM5l3LRddzoBrD0Veg55uWt2DEeTbkpLxWW3FjL
unZkjyRkWHZSKaMYNa1QI8M8ZgqRUcHiyGAmK8eKQRjYOF2ADYXWAivgUE4CQaRFSrHkULAIxuEI
PCJ7IzCQ2oBEnarYVC4/fd0ctt+Cv0qE87p/+b57LMtQTdES2KqqsDdmvCumHfDPWNMph4LQi2Db
3mEDMJVA9Dl0dYk4uzApj+6oud1QHYVY2ttbkfLE21z2OBEb/CzDqjzvS0zqqUHcq65sHNzczNzX
Vo7ppfRIAUhHhq3ZWaTRaOKNSS2ui8uf4Bpf/4ysi6Evr7Z4IEzMbz8c/twMP7SoaOoQb1SnKNum
92b2bca1v2bdZuvJ0is2xMkrrKUovCdAV6xS43QEuhrX0ox7gsCrYYmfD193z5+fXr7Bufi6/dD2
A6YQGoM/yp2caIrn1hetiVuUISoZWulWUl5+gd+BkIE2SxctN1a5RsjjNIBoWmTCug0xp67sDBYr
V4mNq7OVAujcQzRupk0zfoT9s314O26+Pm7NRWhgkqijk4FNeRIJje7QVyQpiYpmPNW3T61mrG25
CVbGwlykXl/VNxUzF7F9etn/G4jN8+bH9skb5Kr0wdJXeSd1qphbsDONwVGn2uilwpxupykalJtK
VdC6VXo/7fwMcRhunnMZIPgsaw0Of3TpK6QVeRbKmnl9YyAw9ArYNoRHt5PBzaU1nZiRpIN4a6J9
mQhfTnXEpnvd2L7msuimJuSXDubKiLo9lavvUymdstH9NPfXUe7HkYx9J/nexA/QyVO7BXM0N6UJ
6/wYAcOip7qCBwrxrlFSUZ48RJh2eswyDNAo37fQWZ7WN3ZtoalmJX4gcX2Wws1xE5CHh+3hEIiX
593xZd8K1yERrvWcjL+vb03vt3/r/s9Njco5bf/ePWyDcL/7u11YoRRAjB9a7h6qHoFsnzKSr3nM
CR6R3Cme5CWMmbM49RatQrbUIrXBT90C3ra8h2sy8iQkcffSzwwQcXCKCOHNZXtn/tFu//SfDYDt
x5fNt+3ecg8rAyxst3hqMrYU4h2KXVgF2zqNZuWyTS+sn1ULdiqmPoYiAlNG6Og9FE2XOt55raS9
uHpKKwKKwfJ77WAtgzWB0U/rawWvUIQZX7rLqtrZEqbnXUTJgOel6g0OUcilzz+lovgilXsnXicL
2J+ou4TWUky8brxC3cq83SFPdApD5feCj2inTcVcoBE/tdvt4nLVthp22ITgsjuO/UKhlkfp1DdI
QZbCdvrocedga8YQI9tQkRQxvDMwCVKnWtc9r+V1/dsh+GYcwMGtR+EzHM0wMsmsiP0VkakeFiT1
FzwNbc29cGytGQIBK/NX4DDgSxGn1CsN5xIXfJ1O1uuC+Uf8AucCaNxfxBJzju7I/7TAUoLrIRqn
WNW7RKDMvS4m6sf9y6O5j7dcLsda8vcN+NN0/3J8eXh5bKtVUcFNriyp9F06NDxyBTZ8er5i1Qz+
H5Nwpacd6bWTqT0nYJzyjDQbSsXkCrSfLDPiN4eZlDPMtyoZHb+rtz/2GwBulW6/Gd3aV8Y9DB3X
Vu/KKQYnyjqi+K0Ar4ph120UeBteE5ppG36eRRXNF+SRJZ+uO2KFdlNKHRpfozprTzf74w7PXfC6
2R9Kk7I6kewKAkzm3o8gAbR+OQatG6LvMAEPFaFBLqWAJ1eAjLp9HQagYgjiAuKbJv67N4tPZ/7y
NLKga0pV/O5kwXeZW9N6sh5SyDNGtYHYJv/5NOwVYGp75vqD2Yl/hw3LQTKJ7+xz1N0Ss1M5fAR8
hU8Xygsivd88Hx5NQS6IN/929k7KVLlj45gcET34aUGUbnIpODqfMyk+R4+bw5/Bw5+718rKWzJp
xNsb+QcLGTVxrkezM5ac4qDTE4ThPaK5O+4pdmicaAopTbIoVjzU82LoLqlFHb1LnbhUHJ8PPW0j
Txs6enwb+9SmEBFCet9tByhIuq255nHLuohoWYgU7dNGpgrwozdGvLNzZfa5eX0FOF43Ympacm0M
Ym9tLyA4WCXqDTLuWdt85nfKAShWY1VH9NNAFZluaus+lphZj3VtAm6f2b3mAsEmy6itq1NHCPSg
mB6rqrmwiAZJrnNnZ5FnDFJY3jfELOXS5Lf9nodejAY07KkmAQMkPoanl0Gri4vBoG8VMcEnKuZg
1dnWmf0uX0jh0+4HCNKb3fMWQrQOK5zhP/VYGYpirKu1FHEiFKuMQ1ZprnJ9b2xcZqnTtiRB5+lo
vGhVClsMk+v4cjJwdwoSWZIVSvBWs9Kji7jVFpdnrbWXfbDBjKrDFrlMTXeHvz7J508UFdvJU+01
SzobW7UlyMDhI2QJ4nY46bZqc4FYP1Q7u0lmLglknO6g2GKSo/ZawfEjrS8CkpXpevtUxYTNfz5D
BNo8Pm4fzSjB99LHlODusbNYM27I8FbLdXEWoQi1h0YEvt6KNWmHCEMFLJj2gOeapYrw7zNhje0M
iyDZksVnmFRMMSEYj9b9kKOU9rOM04yK9s549LBOSD9eMiwRoBwe+XOVE9MyuhwOiuQcm1ifYVD4
7oHqM9oKyZInlL/PpNfrmySMxJkRI3WOQ+XJ+sxYmNVdDHruGmomTNrOqEf7yuiW9jj1WrNJXs8s
QovxqABtnLF6wZS3ontiwADlOW4YNvBey0OiJMRk3XdGM6JI4iGUOXA8E7XjELvDg8cz4D+KC69S
Qq4WMqFz997FcfO8dE518Z9S8JM/wDMGh7fX15f90TMio7TtAuv2Qq2KORHCX39tc07p3EbovsFr
mnHHZopxisjgf8q/oyClIngqS6HeIGvYXPV+4UkkLexcDXFecEdzMmtHTdNoLosnmHxiXtNJ8mou
tUrrXwD0I50uL97YLM0FRtyXG9i9Fow5sMCUmSC84/v5nmOPLHicC9XjzIz8tSlZRd6aD8whn7aw
AzQUq9hc1qu5jMPy9qLFMGXT6rdYo4GrCaRGkF1B1OrVFvLM4pxN+33V/C5lWasyVJFDbVUEXQQs
8XcrXGOy75UMdPylQqinPsFAxasovDq0BygAYsV3ftJCTv9wGsK7hAjuTNBgZKaU0+aUG2Vk3kdB
8EWvJtoEGS/dUSUgzfKNXFNkBwQgs+41QrIULFAnH9EcVLv95LesomNtQixRcDZgs9U4Xg5Goe3A
SHgxulgXYSp9j+fDXIg7s9DTseZU3YxHajJwLtUNMgHM6ntND+44lirPGBZ58P2+c0xnbE4LQud+
8zelRyoh/vaBGsOB1pqlvsFJGqqb68GIuE98uYpHN4PB2NOjJI0slF4rUAMFchnniFek6Xx4deXP
gWoWM5Obge+nIHNBL8cXI3tfQjW8vPZHTzRi0CK49nRcvZH3D9yXF+AlUrIuVBgxn8qMP5rzBbsD
72oVz+nIfqAJvg6T007sKtvBIEaTpmvTeNFpjNmMUOuxaNUsyPry+qrLfjOm60tP63o9ubQVWBEg
8S6ub+YpUz7FV0yMDQeDiR2hWqurqqz/bA4Bfz4c929P5pXz4c/NHhKbI9axkC94xIj6DU7h7hU/
uiXY/3Nv3wE2FyRPXgpes9gnO9YsI1i6SP0nh9G59DtvrmiRabXG/fdypMuUJLx1ZOv83XZCZbJO
Fa8zv469IBGffNjwxNeh/BErYywYjm8mwa/Rbr9dwX+/WSKbKz2esRXPmHeC7woph3l+fTv2zpgn
+PtqS9OmAezY+zOpkhhFGBViZpfTS4oy5d8FlqU6IgXRGV8vWnH4VEx9xNuJXX0l4VwzVf0lwKOQ
LXun9Ye8A3J7SmzpbcRHDE+2gvrvt8su4EGmsnXP7ZvhO3SYoMIffPauwLzQdd4nlC1ouhBWGKQD
nr42D081W9i6t4hzkqyI//1+w7SYwpdGXRYlBdemcuURXl53FCsC0WvSvziZ07migFismySrsbi+
TsX15WBtjW5RSaiurl2v6JKvrq+ufGtrM928K+IGPc9PiXGdl0unPYRsOBgNK9/moxvgIda6d4o1
Q6HHZxebQ7LC15Rn/sGm+Wg4GI7fIY5u/ERMDPH9KqfJ9Xh43cN0d00BdA8ng77FlByz4dAPNVxW
rVVqqmhnVl1yTsqCW8/ESo7eXagZevc3JDeD8aSfZsCPjwZYHCKxnwjpb6rmPGN96mJM+3Imh2VG
YtJzfkqa52LTYVrT8cBb37a5ovwPrlXuH2cmZch75jDnIWaVftodNMK/k8t1T28AemCU6765Axl8
31lT4vj73DMLVJfq7upy2DfSLE/u/X7e0eVCR6Ph6Oo8Y0x8ZSOXpcdqjM8tVteDwfA9hl5bB2A6
HF73dRZUXYA59OlBCDUc+it3DhuLIaUBIJb6goPDqWajy/F173jmyxkZXKwv8xjSm54V84SteY82
xeJq2HN2U5aUj8v8hwuAeaQv1oPe+JQRlU5Zlt2lvIhW53XGZ9J/j2Vzmc8Z/grt51hXPDnPiHeo
4zGk0dqbANu8OZ2Cfx/0aOyd2LMK9TW+Eum1y5WAyNJ71Ffi5mrtS4GcyQFmwWtQqcAv9Nn3cHx1
Pe4bBiWUbvMnhoIcAryiH9kgfSz6aVy/Q2Q6z6ayn268UT85FBR3cuhk+p0JZJ2j1c8bMszGznta
Mzn8zQ1gw58Xj/+3T76yc5vvj/8ydmVdcuJK+q/4ceahp9khH+aBBDKTLkgoICuxXzh17Zp7+1wv
fWz3TPe/H4XEoiVC5INdVfo+tC8hKSIEGhOZpdoqS50VXkmDH94PXXMtbXEPTADLghBOFEiSmGfo
ONL+PQ+j2oX/Xg6e6++P2T5InH0pinUDvv43O9XLeJ7jjBYZSjAIEUiAoQ2MqSE3w1NZ4rt5ZYLJ
0r2O0tWTquukrPJlVeAbKoXU07NUP7ieTywY/VCfZNUlDWtJOa+/XYM9Qa+/dSe2H/RpGbUfkyik
Gqjto9CJCTHrQzFEnkfsCz4IkyUU65pLPW8ciK/L5z4cyVn9A7j4KLG5dt5el7INqghb9oxTc2Ub
dH2bzzZqbjDiofoJk4KxarXs49OuZLuw9t4db8OAXvnNvCHz5Lzp0fDNHOvElFgjaEe2iQod8/PC
H51pJwdMvItj1tZ49Qj04LO9RzuUGQInh0NMoWLt3KrBINRpEmAZ53o6R7YRQLX7JU5eZA2o2X9B
sBcwzjdalgkvoCk+FJ4OseL3bImeYTNTT+Pw28HS5lwRtk4HbP8pGO/ZsgimwFrCWe06BzO9rjjf
Kq41LaqXjLZj679SyVpEfDB7boL3R73Lja3HOmRLrN5zjPcqcHzngQ6+MJfGMCOKnGCGLQne+A8y
lTatarCToTpam51CJ/JZV6xvCJaEcWDmrb3Xe30QKGg3654SJ4T8IGOKd86uAV9ycFeE9d88jb3E
mdvdOEIVBwjUnMHRUKBkxoEU+fiYF4L1hNUidmib5mPlB7i+jGCUNWuaDHOCNuPPvRcdkN7BgMiL
MPeTy8BJfW3zqQDEQd1cBd0Ln3qpSgY4Cu1wLMFaFvitEp8SbO3QgY1439pGLxN3YB+0N0L6oa3L
zCXbvavL9chr/ZQH4pXEIUV2ECH1UQs5Ob5khTKHCCFSY3r5fIGj813XCPH0EF/Zncxh2GnBDKUm
PcQPImYwNO4cLq/fP3EzgfLX5h3ciSiXzJ3qeokHTFV5bHv8GlMQuhTf2Qt0vsPSolAoDAOnW/Jt
Lf8S3Hv0ypXqDLQ7OWqqNmOsnnDUxjlc4LRmi09qIgNz+G2povnvc1oX84Xqdhk+h03XPgwTJPKV
UAXyhRnWMut1F3aZJS5r/vX6/fXjz7fvmKHSMGCjZr63AOM1xXqrZINtdvEqOw+GUO5aZzbN3sYo
R+AOUXhgwCYEoAiHf1xDi4vvWoq9oswvgvoSs5XmGPehmzdnLRY+KzUnRQ1l1tt5ynrBORIKPNc2
q2E62iXOER4HO42BR6PU2CX9nQ2da65q2q+Bwpla2eBeXzbaMQ186SBzA4RB2NaSG/JSdoM8k0nf
1OPUXc8Z9hVXCMQArgGIAsMTFlyM769NjyHQElg4iLGD6ohkxbJsYDnGCjOW7YVNPYq9ptDr2UZI
xv61WAWPZVW9Z+MD3IbLSkNLuBkCSlBflECherFNynO7drd+4N4RhckqesFtjmtxacvWNfMyW7bN
ZH9M/MYW1PbUYN06goddGFW5KWaB9W1cVETqPz///P2Pz29/sZxA4lzZHLmth8/S7ijmTBZpVRXX
M3ErLFLgVGyUr7DIhhZcDVngO5GRYZDkDmHgUsBfZlRteWV9pzIB4StJCswLmW+kUFdj1la5rHxi
rTf5+9m6GVyLqmn2qm0tr+Dq3BzLVX0H4l1XDTDTJNrlUo7hJfcMWYB3JmEr+Q8w8pyNNf7jy7cf
Pz///e7tyz/ePn16+/Tu15n1y7evv4AVx38aDc+XeLKxxbRJw8PBpcFxLOmYj1ntJX5ow82bL4Px
1FxReRzgLqv74aiNGRjsXKv5bzUyRMtc6UTgMpMbkGaKtzEN7Kv0hUZXtWk97fJcZk1FXJ8Ao6gL
yocdoHxSDom8zzrcyhd8qC8e83/jyrtk7OC+rGLTnz7bKZSeOH1iYFkTnqE5xmaFVpP4VUbT+oT1
A8C/fQjiBD9HBvipqNuK7r5M1PSIcwWYHnTteBUdotCSsXqII48eG/VLxBZ4y+cjbqgB2CzzkHgD
XZT+vKH0ijl4x5XVAGOT8dqFadKVzlg70tOB0DQlzDyA0JX4kRNAT/6oj6nez7yA0NPg+GWq2YSM
KpZzvKzFZY36VUupUwGI32kKiMlfJ3y/t+H4xTvHb9eICcrena6f/v31+caEVXqU0oYjKzodW91D
kUS5XZlUVlpSWAjTiaSs9pIk416j2xGGCMVZvU3Gis7QWLUHy0jpslT5dnYLxUS3r6+fYY39la3k
bHl9/fT6B5fnEFU7Pn83bIKcbvjpDqw6rRe5oZ7xrjk2w+n24cPUEJsmaJbyuugB82Sbn/8SYsmc
NWn117M1izZk6U+WSVtsM1DxlhRdlOEz3I6qAIQsjTxoVgLGEDBCAGMEfUEFVyu6eeKGgKRFlktQ
KH8Zsogufedj7ap4SgEzEd1dPQtabeTlML6LEYq5bfmufv0BPStbbSIxfU5uyUILahts6JupnO5A
nYxyeLjE+IWC+LhO83SCh5IsMVAGkis6sUkqpy6rOGss+U+2BymvdFls4qOEpze6vLMLij18uvS2
/IIU+qwRZLgcjulV6xeLkZxmrDQH71ZRVrV97LrYvaPoiIvEuY1AHn6fctk32hzGffl8UVNgwccB
l15427QHW8VRE4vAKiZ22UoHjL0a4KfZT7drW1wJ4wvJsGt68VHVm8W261QVo6rWzwB9jwBhTJJl
P090tpg4S2K/WYdm1SZJ4E7dQEw1ot7Ko5pJCBQ5N2rQWn1csoXfMtrqbeVYLOMsMrCASRlYwE9g
u0fiIOdOp/JmJ1j7EluWh/KZMIwCQiNWWL0GucV4YCnaUBqD3ohgch2H8KYPjK4kdheAsqbxiVPy
BZ36Zzp9JmpTRuMAs231k24sixKshpGdrQaeqadWGMaE8yggx2SfuUnZR46njz+Q2fuywYVLQbBA
bB4nZ2kmf4nXIdRvKGl/Aac0pyuAy/R21N6H+gE6Lr5p4LiudqOjkQW17hb46BxLuuX5ZsFzHT5R
21mUvu0WjcM6Gbj12KeBtgLJwnYnEjzC41rq9DnvJ7Sxz/YMZBrjUFz7lP04tWdaFvvAKtcmEwBe
t9P52ZAh0zpXhEPpJNK03IJGuo3LxgD4i1e0War8oZLZPzguVhKsmqYFz4zCk6BSO0NVRN7oGIMC
RHNK8lhNd6VParwXXgghoW0RJ2ND++7j528f/23WAoMmN0wS8YLX7Apq80tafOVOddvLe7Z4cndy
12KABzXBBw+/pumHtAZfRe9+fmMJvr1j+yu23/vEHWixTSBP9sd/yaaEZm7WzOin0usjjgKY1vfB
tg+Uk3KJD4fTp9uVO91Vv4Df8CQUQGx1tixtNTxnJu392MNnqJUC2jf4nmClDAeXyUr4IF9JNT5L
LPixdhPiGG+h5GkSOlN7a+0xVS1bPYiVb+HUbD/u905iJWFLpEYBf9uy46c1fHRDZ8SqvC3hyZUL
enmyfj3Up9GMVKi+eQ4aLdc3shaHZbXQTEb1AoOOkDwZLkCTFVWDn22tmSszVl9cXtCvhszoiCPG
rVvym9rzTo+aWfgOUGfh7uPX3gd7RXen09g2nBIn8l17v+Ic7wFO+AAnsg9fwXkkPzskfhFj3PoZ
tOz9+XrrYVWy0q72rnrt2/2krr33QDrtLgcmQfvEcyw6JiZMx3OQ2QeB7Vx+HalMLg/3KfHOBNbj
B/ALzg/T+/7I9gE1IcVt82Xa93AHYyy63dvXtx+vP9798fvXjz+/f8ZOGdepg61B/c4E1J5s11gy
q0vSOD4c7ENtI9rnCSlCezOvROIMzIzwwfgO4cNEfK9s5tA+WLcIcTsMk/dguofo0TaJHi1y9GjS
j3abHSliI+6M+o2YPkgMHuP5qb3Ddh9Se50wgr0yug9nz77Ebnl+tBaCB1s+eLCdgge7ZvDg6A6y
RwtSPNjjgp1m2IjHvfa67sfUX2LP2a8ToEX7VcJp+9MYo8WE51CDtt+uQPMfylsc4jedOi3Z73Sc
ZpfuZpr/wDjmJX2oFWLi3SKVNmpxLS53iZXVjEZodlhT4hfdO1IHct5mcuA8q88Oyc7cPV9le/bu
NbN2OuF87R3YG3BmPRLXZW9i4ay6dXcE+YW201GHciqbnHgWeiEt51LYxm29MK9ye39aiUwQf5DZ
V7ldTpDjtFfHxhwJ3W2kQBHhu8hkuvb5UWLuzFZyPs1HPeu3T7+/Dm//RiTaOZ4CnhBXNF9XiVt9
y3kL9mLHnnt+CWLvlJxi7931kOz1WaAQvhvk7Lr2BqyHKN4R84CyIyQD5bCXF1bovbwkbrQXS+LG
e7WbuMk+ZUfC5JTdBvB3qy4JXcxDtVRx/iGWbQvIXmseEOWKxvS6Ke+DuOLaJxiQUMDBoQAPGwlD
3b7ElG7Aupw930p4o7i8YWrbsOeHK86/tQDuXhCerJv9ZYbu6sm9OS0XtdonZfcMx1FyTsV5KKG5
zBUi+ZtfalxTphyZr0HTi6uFzuewWiic2vnOppIt3Kx+ef3jj7dP73hekG01/zKGF2Hgbp7KrdD4
kA/sRDCtsSvhlnM6wSJ1QYS5oOQbpBjx+xJhNIvo6JqM8dxbdH0FTWjz0oRZecJCoLUmhO3uPW2P
RnUWpUXrTzCIR2O4iu0APxwX808k9xpZNViBO117lwfr+rYKVt1z44MSdVDBoao5l9lLZnxiO0hf
CLpjcqXnH5Ooj5VTcBFeXD9Q65QgtFlCqcYKAq1WIHDC7/gM4uK0MBiDdyf3W5zSYxVDQ9Mp1NDc
9il95SDmp7ROw9xj02lzlOyGBWbcYIvga9tPWVfgWjKCYi0rm3mn8Y4KuMucmalmojyY1jXdYJfY
uAkG7SCE41Zd1NneHnKGeiDj+D3LQR3OyPoIY3JSPW8quHFrLIIrst3SOp9OqtsUMSrzwfcCH3/y
3rJUrBYgPPTtrz9ev35S5Nj5XZE2DJPEXCDyq2XCPt8nSmdUWtDI+YzD3qh1Tm7G44/a5DaHqo6c
NyR2jFjAMl6PZWjLzEtcx+yCfXDQe5Ck56nVnVieT7m9To957IReomWMhbqJGxo54OHqVY8Ks0K6
9f3F+FBY1JMLFbeo1/IgLB20uqla/xD4GrNqkziMzNwK+dHWsPz68QsSHBpNxS8kzdmo8hJdJVmd
bMDLjNa+mR8mB3MdES5hEkyY3nDPTfAPk4hcuDh+cB09H8JzhBkKDiO00M3LmJq0cGVATkh1cjgo
bpCR/rjqelj7KRMe3ShAmnj03QOdAzG4dcm2znw/SfQytmXf9J1Ru2MHDjQxx94iru2NxMXZsFkW
4WGXzcBGGdevEJTDL79///nn62ddtFbmv/OZrYfgyMSsH7YAE2pr85JCasWjCS/p3t1lA+D+8n+/
z2rzho7O3Z0Vxqe89wJ5/6UiiWJWv2GU3CN/7d5xaXXjEBukjdCfS7n9kBLJJe0/v/6vatnOYprV
+y9Fh+0DV0IPuvJfkC+hFhzM3k1lJEoNygB/Nw/0ngiG69PpYjOOwpB9SckAqFf8TcTqYyuqynDx
WAOfSI4BTPLLiBL6CZWXEPWRLzPixMFjjRMik0nhBPgnSeEqxx1qt5GOEPiznvDGA2YdJFB4Qb5S
33SQwsUBwM7H0+Veq0+ft3kqGNiUNu/e0jybjunARoeiSTx7roF+dsOEwxnnsSsuxuAZYCPNFZ5T
Wj2JoSQwDj+DcTKTAh31llWLJs2G5BCEks+gBcnuniMfHC3h0NKRY/LXrmFkVfQNSyY4QZnXFqQq
zmyP/YKtKAulP0qnNkvBIXB7DCe9pkbg8vnxGTzajFjiM6T7pCF5l/zZyuN+mLGhLhNCyVPD4v5K
7yILH7zhxk5gi3KmeGbBOeK5aMkXR1lMKsSUxpZaXjxZYVF0Y4g1+fJp2beQL/nLBeJ+3Ijr0IUz
Z9DKAVGXOGqQKQkmoi+E+QDGyCHvUFjmq8GPrAUHNwhu5FVYrKMbhHFsInkxcCttQYnCSB5l0udc
GLcWeHGht0cCR3qWQghGgpRhiPzIwbIntJLqI7azXjhsIAVuOJrRckCWiWTAC2OsJQCKfUxOkBgh
lRzbdeDJhYfEwb+IZJ8t60RUH/0gNsPFBgZLY966xOaIPae3cwEdyDsELjbmzk2Vn8oe8824Dssh
dGSZYUm1G9gqEGINBy6/fPzA7XQrqjlXwjGYtVvdst51HPyiZa3H/HA4hJgnrWVplv9kInmuB80G
ouL4Xzzh9PqTCeTmfmB9Gyhn5VNmIgkJXCwzCkGRpTakhrcTrN8CI8TTBQgTNVWG9N6BAvguFauL
vjkhMQ5egDy+lOZDPLoE4LsOlo+BVQ3xReC6xBeRRwAxlUaM1+BlQI/dVxzsX5q6vfGNUXhV3mZe
SaAdigVncASNACM83XaFZ6GGrqmwL+H2BamTYWzRJoNXiNsXTOZdGBn7Ly27KVMeatDRVn79YAHz
XlMo3wA3snbd2ecjvBtilGU+n0Kihcd2RsJmd6acYpftkzBreJmReKezmfApDv047LFqPPeEMdOM
L75hNWnHjKcK3aTHdq0Sw3P62qzsM5OZUzPTLNhDQvntUXo1kUt5iVwfGVblsU4LJF0W3hYjVikl
XBfBlGktcjkkuAi1EH7LAuyscoGZ7Nq5nocMo6q8FkyKMosiFriQAmISUP1p6aBuKivDhDavyrEV
k0t1ITInAOC5eGECz0OmOw4QxQ+8yCEKwSDbkOUPZ7joJAMQISfLlMgh1BsUkkv4EJA5ESZxy4wD
0sb89DL2kNEiEGxQwDN2MFPjgI8snxwIkFbhQEilcYjRL1i2DkjPr7PWdzwXmyOHLEKlnxVve89P
IqxIxfXkucc6myUlM9UuZnOTjy2jmfyEzdqn6gghVzW2JLJQH+mwdYx14zrGhnAdJ1hoglQ5C0Vz
lqCpJWhqB3wc1YQikETA904SIfRQV7AKI0BHooCwLcs6nWZJLDZYCBB4MdanrkMmTlvLnvL0tVKz
gY1O7LRFZsS4zMWgOHFss+RsI4Nmsk99Qr9vpXwYh+mpS5+Kq72Rmiyb2oQ8ttmq7JSElPVDbXiJ
0b++w8un9sVTVpTZX2ot92Mr5Tj0yAuU/ZE1LhLMhGBcErsMVvmO4f5faHwBHpwhE1JeF2xWRibG
golbATYRMcBzHWQiYUAEp5FI2nWfBXGNJL8gB2TFENhx0bXT0WHoY8IaZ4uhjiLbQGWTqusleeIm
2FDhjwMSZoAKJ7buIFm1JNhGpLymnurEX0Zw1wsbwfewJXPI4gAJvdRZiCwIQ926DlLzPNxHVz5A
bIIBI2jvHsuItT8zQugiHe5lcD0XKes98ePYP5sfAJC4OQ4c3BzLHYc826jmDCR7PBwdwAKB+Qc0
K+1RV3ESDj1aSAZFV7yYkRdfTuhHDClQSDyBZe5MrgO8Aek60yacrCS+LqWKgfocBG/nDiW8P4o9
7LqQirrozsU1e7/6kZ64Rv5U9//t6GQ8be0J9CX03pX8udBp6MoWXwoWal4IZ5rn5oXlumine0m8
q4p9cYINen9J8acikQ/AlzlsprPCLIsaIY6vWcSKDQRwWcX/s2SIykjW3rBGzYuXU1c8L5C1cooa
Xhop0Xc8Fg53W7Wd/IGvJyRVcDBqS5HhSV1bKU8+Bs/gohazpi3NuM9NV9rL27dF2tkZt2tSWhmr
px4rKdtJhxPYMELLulVF2T3dmya3kvJmudsnCLMnOWsc8B6IZ6v34Ulq7vlR5J9vn8F9x/cvr7Jt
BwfTrC3fsXnID5wR4azXz3be5tMfS4rHc/z+7fXTx29f0ETmzIMrgdh1rTUwuxuwc4RO9F48TLLe
pfRE95gLTJaKeJndUvihnPoms6a2H5/Qgnr98uPPr/+0JSbs56yJUbGIi4OXMi9TlqF/fn+1Foo7
T2XlMnRaNAr4V7VPgUDz2XwiFk80y9ZcLSNE1k3YJiee6ec/Xz+zxsT76JwGydmyulpb2ae4zj5d
LI9CYCIMPFLZ9H15lL2s9PIThkDJu/JluajddBWyOkU+hmCNdGnA0VajeC3iwBxvrS3+MkU4rqK+
PNdpNmU1tooptFZ1NSgwXVllc+n/P39+/QjeiZZHRYxrrfqUa27KIWTV85CSgnDxmMq5xS/6+Ze9
H8tC8hLmqZZANe9tbRgSu3j+WTp4SezQfko5aTi4TLRIO9zfhqCAL1Hw3Jg1+HjbWJcqI4vG6jo8
OPK1LQ+VNHPl6LgyBhamPrgI4bo11hamP+MnIbjLMN6cqxGX8h0PRm+4V1Q+ElsD5VvnLdDTo0/7
MsOOgnhTc10W2VHREijrr0As812R4uxMCleO7Ndwo6hCJCBKKt4PQz5xCW0IDlfEKRKAYAPwdPQP
hIYJp4jFhXtQIfJ1TocCvI3xCyitM2SuP45ab5oD1YeuZMDsZ60XeQejP40sXx11mSUYHhMuehvl
UkZsU/3/lD3bctw6jr/STztnanfqSNT9YR7UkrpbsW4R1bKcF5VP0mfiKsedsp2Zk/36BalL8wJ2
Zx8cxwBI8QoCIAiYQ8jMNJ43aDSLVN4lY8MXkTg1DAr9MD0zYNXyTGuYkYIhV1d3qQj3hjO8GLng
TVtl8aVTN6zqjzNDl0hcGlTOHnmBo37qF3TkIJWFrg4NIzkT7Qompp7NrjxITVGoABfPHQUWqf1f
7hku4OzTMKXjU/mTmvFWwvZ5k7U84Y2h7VU3ZMp6Z8kl5SYKLmgLJ1rSK7LraR0qe3TNvvpaLjpe
dam+RBNb0rmhY6s9nrxrjF1uE6/zUPM6x96FVqjVWHmdb2N2MX56ZwnadJq7gT9cP2evmJs5uvRE
g+sKUiQtDr97CGGnEK0VU7JAIwuJt4Nn6dKAWMP8JGSS+Lvy6fPr+fR8+vz+en55+vy24XiukL3+
+QjCUKr5+DCC+ZC5SKUcqAVfXVSCX/+M1NQpSUMr5sHi8OmJnASTctZLXhQMq77bmWDMUVFdHFBP
UWKpLPnyXV7hLLpFQ33b8gYZAjMqZ1qfcy0bKl3e3cit053ZVujkyKa1GrrjGL+RC6+U9PpC5Cuh
PyDQSO6aACfGyyGJyCyRAQkcN44gFi8us7rovWDiYyolWJ+zzeoF7gubBI6SzpyvgtLxHOVYQF5I
cfDHcjC8sOQ11cmhiveGx6pc+mvzT3UVXx2ohcYUx5h3pgxd9MXgjJxsxmoR5hmPpwIVCCaZUivq
mVKtzgTLMyuJz9y7oY27L3IuzFOFswd95gNhJpFfCMqFSah+eMaBwjGURzy09cwHHQK7gmcWvEHF
aUwi6ZyYVWFRcsxRPkzr81hJoeL5wRVVcE4arvBYLqod4jRm7g54EPdJLWWvFNgpkJlmjDsOc+lO
2PlLqlp9j0jXDXJTW1oedYWDQxfnIDEJnEnTXtuwpMQW+33Jk216cHKh2OVDBnJQXXSTHxRSCXtz
dowL5lJIj6a5v5Azizw3yKMFNHKQe/cS65RQTCQOMByzJYQid5ZRs5lBx6WeE4V4P+MKfuGyokA0
s5sirbHbPp0Qljp72CNuOoGI2zVufdIcJVkgmrbALSpuK7hBtFgkrnYPeXGsINFnxyIN8vZYWLlc
t79aw6rpG4p7mEIik8gau4Sz0dtciYSITscKxsYwu7jyHE+2LChYJQi1RiSrDhd4TovIsdD9ACif
BDa6H5icF9j4FHDcrXXHH7hcnycuSBn6PAtZN8uHIdr6SfAwofzAx3u2aNVXP8uIQKjD271o4Ldq
UJ6mS7jQd9Gmc5TsYykjwwhT32SaSUvHUaZNw5HBL9QdmeuOQmO7NSOEkczg36aQ4X5eKhHx0bbO
1iz57JbxgejhJ6PCiOCoxob5JoYhaDwXDb0lkoShF6FVAwY/JcvmYxAR03LpfMe+zsgYCcF72rEY
4EYM3k7FhCNjogBv5pXw8QLRNr9Nk8Rw9F/fltxMhDRdN+MIuF04WOhGbnbHT5ltWfiWanpg6IZ4
lgqVIW6wQhXd6Nt9iTeES7BtU+I5ThQ6Y8oMhe5It2OvOClqlKIDYlcfkwNN2iyrQGKZ8x7pJbgR
CkOApoIvIGYKM4RBlIkMr8hEIt++OWFAhPvIiiQfie24puaW/Y3DA8r7gWdgJZSUTWxd39eMhtqG
s516ZRgYIhsKVNqzO53kYnfTccXeg51hYE2TpritaxbT4VZDOG3fZrutQUNVaZv723VyNfQmFdfK
x74scRuEQAojYflY/BqJJiSiTqugggpDdQ31bODS+NZejGpXP8yIiOOjLGwyneFnwGKLwzi6YIgz
NMuzDK9aFDLbkKdKISP2rRW72OdujoVnmAXBlGeqPkJf9UlEk10Oq36N4YNpzub8UYI2zrwtsdmY
7VjIR3V7k8LHi3ibo4+i20SVkBIQq4TTs8hbyeTSsgSnSZ0q1h8Z3+dJhp0ZyXKT8FOEVHWX75To
xWWW5jHHMt26brHXiRPNjJdsXiJi3OVFhw75QrZN236Mj11NsyJLun/+FGL5LmaZ95/fT6L7w9S8
uORX6nMLfsrYuIqLej92vYmA5WTv4uIKRRunLGQVjqRpa0ItoR5NeB7944KTA8HKXRaG4vP59aRn
x+rzNKvZnAsWsml0av5AtRCz06b99nKVJH1UqnyOs/TldHaLp5cff23O35mN7E39au8Wwrl0gcn2
NwHOJjuDyZZtuhNBnPa6OU2hmYxpZV5xsafaG3Kg829xv52xAPqkwK/vJ7L7CnaT0AsGjOlDlYiD
hA2GNDVrbl9tqNTZYJOgTzpSA68/ffrX0/vj86br9ZrZbJYlv5IVIfEAYxk3sOnoP23/MioMOadv
m4YQHzxOlrHcZDTjqcnGomb5Y2p8Yhj5sciwqZs7iHRB3OC6q900Ykz2RZjPhdPxzbn0FJtetmRA
nCEKi73AkfXL4WVW1g1FS5RxUdSScw9Uctnwk7+XcVWymgn8XKVjI3qtwpmM8R+VTN9V3OsXsJJQ
Nw1/mfxOYQg38L0l/bmckrqkIyOA4r2xQ5yV3eqNmUhmfKJf5gR6fPn89Pz8+PoTcYGbuHzHsq2t
DsItD/w40W4ef7yf//HG73hPXzZ//Nz8LQbIBNBr/pvK3fJ29sWZ3It/fHk6A2/+fGah6P5n8/31
/Pn09nZ+feM5B789/aUM31RJ1/MbQdPyHLs0DlxH0kJWRBQaEs6sFHYUobe4M0EW+67tJSqL5nDZ
oDEhSto4+D3ehE+o41ihXi6hnoNqaxd04ZBYa0fRO8SK84Q4WxV3hM45rna6gKQ1PUzUoE6kt6tv
SEDLxjxCtK4exm23G4FIZPe/NtlTDq2UroTqCqJx7C/xWZfEICL55ZwVq9DPRRYwwdiHCe+oY8LA
bjhgYJ+HZMLATOJTD26GCvWZmMFzCaXNWxZK/8rSBbyHGepWrO/rs3lHLdMT9nn5FqEP3TBo3euU
BDaqX4j4AdmPzBJuyj2y7PXGs90r+5HhRWv1Cg4sSxvg7p6EcuysBR6ZAmcJBLgd+EJwZQj6ZnAI
yh7iISKyhVlYwWxjPEr7BtkOgR1oSzIZiAecThO30H1yejHtE147wa4cBHzo6d3iGyi4scECQ0HH
xcz5Aj5y8IIeajVe8JETRhpPjO/CEF2aBxoSQxxkZdSEkXz6Blzt3yf2+mLz+evTd2RIj03qgzZt
YyYXkSJ09MnTq78co79PJJ/PQANslV2/Ly3Q+GfgkQPVeLOxhsmJLG037z9eQATQOsakJljHBCYU
dwxTik6yyNPb5xMICy+n84+3zdfT83es6nUyAgeNjjtvIo9I8SJmWYNopzSITGXe5Ol827FISuam
TG15/HZ6fYTPvsBpNauS2riCyJxXTE0t9MV0yL0rrDkvB4JJAAxuyAIuEERX6xVvQi7QAGGBDI7a
6Ve0Y0dIZY6DV+ag/vUXtKdJHAB1bY1l171FYlub3LonvovwUwb3rh2TjMBwayEQ4AFbVoIADR25
oL2pZTpU6zKHBlgvfFNAwktBQxJCgcA8AwwdIey37gNieMG/EuBX5ysa7XzgBxg0wGhDkGOwlsE5
id2drmj0w5HiW77CTUn3FgLbCT3MIjuf59T3iSbxlV1UWpatf48jHHPrGd4W3S9WcCPZZFdwZ1ko
2NY3EIB7y8Yb1d9oVG9jBWlrOVaTGN54TDRVXVeWrVEpbLusC9UkMElEgT2ynEbap9s0Tkr0EkrE
a0PTfvDcSoNS786PNQ2KQzXRH6Buluw1QQvg3jbeIfob+vx+wmVdmN1pnJl6SeCU0rGPnzz8UCoA
pivwi6zjhUTbDPFd4Oh6XnofBba2khnU11oI0NAKxj4pxUZKLeFt2z0/vn01HpQp8zdAJDjmpOub
pxbQvuuLH5Y/s4b4vy5L7Kntq/m/hZj6+uk/GU0YLr4YdOYqkyElYWgxL0hm0dFNwFIxxWB9rHgk
3KmJP97ez9+e/vfELHpcVtKsMpx+pHnZFKLnpoBjxouQiMqQgg1JdA0pqhF6vYFtxEZhGBiQWewF
vqkkRxpKljSXeJyE64g1GBrLcL6hlxznGHFE1pAVrG24hRfJPnY2nrVKJBoSYkmuzhLOsyxD64fE
NeLKoYCCHr2GDToDNnFdGlqmcWGCvfSiQFsZtqEzu8SybMMUchy5gjM0Z/6ioWRmHqFdAsKwafTC
sKU+FDWMUHeMI+NipDmxPcMizrvIdgbTomqBSZsvAdepcyy73eH1fyzt1IbRcg3jwfFb6JiUHwVj
NiIXejtx+/Xu9fzyDkXWaBDcufvt/fHly+Prl81vb4/voDU9vZ/+vvlTIJ2bwWzUtNtaYSRoDTPQ
t8VZmoC9FVl/IUBbp/RtGyH1JQGK39rAshfZBIeFYUodm692rFOfH/94Pm3+ewMMG5Tg99enx2dj
99J2uJNrXzhlQlIpmxxvYs72ETLdvFlVGLoBUctMYD0nK+D+QX9lBpKBuLY6hBxIHO1jnWPIcsqw
nwqYNAfTYi9Ydaa9g63YxJdpJSEew2tZIJbhSepaPsL0XmF9YB+NUDP8PG+hJdp7l8m0FE+RhViJ
GSrh+4zaA+rtykvPjCFVnYwuyGnScHPkpQG4R/xUS8x2mBE/1W+aygkbYEtGH1VY06jPPW8GhXNO
WXqw9yx177OUh7HtY4PPZY51xXeb335lW9IGxJFBaz8J1A9PQIIsWkcBwk5PZUgBentoY212lU9X
Q+frfe4cT9vtbBM5nmnhpPmWjV25VZo2gxMNHDAwCm00aIQtxqk7mBLM0PEukk5pBssSW6+HbT3H
x4zI0ySACE2sVp0agLp2poDbriChY2FAbTRnMLNOmlkJ48lmTvQpteHwZTf3Nf7ofm2qbFFaV2wy
HyjGtcp4RahukmngCbq6iDLiEzMMlm0SdxS+WZ1f379uYtAdnz4/vvx+d349Pb5susve+T3hx1za
9caWwbIllqWs5br1bKIeswxoqztmm4A2px48xT7tHEetdIZ6KNSPVTDMmL7E2Ka1TEdCfAw9orRv
go0wAmpdM6Z3sQBa68cQWcPn/vXTnTlNf51dRepMw34Mkf3I+SSxqLbS+NdkceC//l9N6BL2KEkZ
IS57uFx6lbxmhAo355fnn7ME+XtTFHKtkylcO92gd8DYDUcfR0b6ZqJZsrjzLAr/5s/z6yQIaVKZ
Ew0PH9QPFNX2gIZ7WJGK+AKwhthINQ3BjGYMyV4tuZanluFg9GnWBavsa6araxJasafhvsBt0yve
kEyEV9ptQf5FLXIzh/F9T5Gs84F4lqftEq4yEcsoUbHTwVH6dKjbI3VibcPRpO4IFsmAF8qKrMpW
O8n527fzixBR4Les8ixC7L+L3l6I/9PCqS2z4NhIl0ImXWgK3XY+P79t3tl16r9Pz+fvm5fTf4xa
wrEsH8Yd4h+oO+Lwyvevj9+/sugJF7/EtRssMGPeHHvHFPwhFZNhwx/8vmtMtzkGpQo0bYD7DeP2
KNgRBDjLNSPldec4njamLDEozYod81OSa7srKZvVRnKiXMvAt0rajV3d1EW9fxjbTEwuz+h23N9x
DXaJIes+ayenMjgyhUWwEhRZfDc2hwfKsyXi4zgWdZyOoE2n4y5vy/tYdPKdh0Xy7WCwfVaOPDwa
0kHWcROOlaMH5saGYWly4OlP1hTG8+XzBligydzJygEpzBqIfKiwPxPQvJiynirwami4cS8KJQuG
hlYvqoRswaZmTrJKWwo2Yqn+Q1okBomLLd64gMWb06ZAE2zzoa7LLI1Fl1Dxa3J1d+X2Rm09zI48
IT3Mpeiiw2BTYCtjq48pKlAAZvInvIdel8qG5JiiT5X9OCVUHffNUSZv4ipbA3umT2/fnx9/bprH
l9OzyJMWwjHeduODBfLYYPlBrHZnpmGfy1oKW60w8JuFkh7p+MmyYO+WXuONFag4XuSrS2ci3tbZ
eMjZ40sSRFgkHZm0623Lvj+WY1X48lBMNMDJxqREBmMaPASeFXkaj3ep43W2GBnkQrHL8iGvxjv4
MrBdso3FsNwS2QML+7t7AKGGuGlO/NixUrzbeZF32R38ihzD43iENo8cF5UdMNIwtBN8JvOqqgvg
4tkHmPIKzzKvUzdWEH1KMGeVC+2HNB+LDrpfZpZsvr7QzCEtOmqJuUAEfF7t500Is2JFQcpTnyIt
A9adst4W3R3UdXBs17+/0RmhCLTvkILKhUoBawEal/QIk1qk0ZSmGqsU0FvQ1z+iL3plur3rBQ42
LBV7K1KEoGUfCkmluFDUfczazreTYtfCiHw/ILcmVyAHHd50Nky0ZVx1+TCWRbyzvOA+82y8CXWR
l9kwAt9m/62OsHcwD12hQJtTlp7xMNYdC1ISxdi6qGnKfmATdsQLg9FzOooNE/wb07rKk7HvB9va
WY5bWYaZMzzuvNraNn5Ic2BAbekHdoTOlEDCXMcM366rbT22W9gtKS6Ia4sw3Qaug26qhYL6qe2n
6L66kGTOISb43AlEvvPBGgyukIYC5a91A2jDMLZG+NP1SLaTUxLg9HH8i3XXO6gQH6Msv6tH17nv
d/YeHSGQapux+AhLrLXpYBnW90xGLSfog/QefceKULtOZxeZsdK8gwUB24t2QXCrSokWPbIkkjDq
URrmnh0ng0vc+K65RuH5XnxXYmPapczRHJbwPT04BpbUNcyb3iJhB3vcYCxXiV2n7LL4l4ibPe5x
LJC1x+JhlkKC8f7jsI+xvvQ5BSWiHti2jUgUYSNyn6cZCxZPx3uWyhzd/cDvmgyW4tA0luclJCCi
9KkIY2LxbZun+wz77IqR5LmL7rt9ffryr5Mi2iVpRWfNTho71v66ysY8qXyC+slOVLCAWBwopjXI
+Yk5uq3pCEdWXA2Bb7rCYZrRfJIDqOIJeI0aFhwuwDKLLoxsslXbfEFHvrHJMtFx0MQfkI3gx/fx
4Di8ChASR/YAVCtbZvt4mnnapc3Aom/ss3Ebehao4Lt7Q33VfWHQsJnS1HSV4/oas2rjNBsbGvoE
4dIrEnU85CpizvZ/HvpEqRmAkUUGtWcMjOfbmrDMzeSyAqWi3SGvWK6CxHdg5GyQeo0LoavpId/G
s6c/GogYIXPVAVDw6F2CThZerwZ1j+RkIBbsGtfWjnAWhL/yPZhVNBapQqJoKqzWJrUJteQIVAw3
vasFxg0by8ef/ahkQShdbYvYtDEg+LYlnq7qz87z8loVEGsIRs0KsBAkaBi6lSGVh7QJPVcZEgk1
fgiIrVpYMKV4Bo7xYYu3ayHICR1NL8VEuuW5jcKrdUardL/aZyBwGtd+75hNGH1i2nlZV8V9rhzd
MxBNEMO41EB32Et4Pvlt0uyPaol9aZOjKW/chQGkpqwMefXA7TRD6HgB3s2FhmmlhOBGa5EGV3JF
ClfcUguizEHGcD4K78EXTJs1cSPeIC4IkI48rComNTleq3Ff0MzMMknXZ9o7EfFoyUuzNjalNR73
O4PJnnUvSfFIxBNLSdFH2HyGj6m8hgp2lD0o62qYwgmwIA8Z7VBLCehpWdVxU+v48Zi3dwpVkW/Z
u/G0LhdJZff6+O20+ePHn3+eXjep6gW6245JmbIktpd6AMYjJjyIIHEeFgMsN8ciPWaVws8uL4qW
xTv4piCSunmA4rGGgOnZZ9sil4vQB4rXxRBoXQwh1nVp+ZYNb5bvqzGr0jzG1Mzli9ID6R17Mr4D
NRVWiBj+FuDbOLkr8v1BblsJAsxsPZZsk4BixjvWMFjpenYMabq+Pr5++c/j6wm7Q2FDVjSUveVD
lyQfTiMKGJEJ1fQtJhkApgaZmt10yONC7XTJAiB9geWtMH5jiE1X/YC9N/nLsK8dYGi3MIKjmhFD
GuJSPmekGhzscGQIOVY4h9DkuBsk2DEtpL/zLWzvoXP/j7Nra3LbVtLv+ytU52EreUiFF1Eiz9Z5
gEhKYsSbCUrD8QtrYivOVMYen/G4cvzvFw3wgkuDmt2qJBP11wSBRqPRAIHuQF7xMvqhypN9Ro+a
WBISWr4JMnCIk4pXr0hhPVkVqVbirqlIQo9pip1ehEZoh5SBROEsxVYrqCpIbUkmUdR8FYF+WkAN
jMgj9fDhr6fHT3++rv57BZ8QhrgfRoQP2KbiISyGyC7z8AIkX+8d5tV6rbzM5kBB2WRz2DtKZEiO
tBc/cN7hl/qBQUyD2FmpEfXl3AhAZMtsby0twIF2ORy8te+RtV6BMWyB5QWkoP4m2h8cZUN+aBNT
wtPesukDLGKat8IVBK/yAmyTeLJUFmnP+KlNvECJbDpjInz3YvFaDLkZsMZkVVnkYGAzwgMN3eVp
gtV4ymRgIHpGxxkhCYREdLB3cUg9FzGDY6INtA8kKQzRABebCxcpfIdg1eNQhNUuZz560FmQbRhi
SA1eQYO+CMt8MKNY3CxTXiK9EvJeIzPUXNdL4DnbvF4seJdsXNVSSS9t4i4u8XTEkmaIINs3uJha
odbthg0bK8yvs2hz/gANa6Z5kFaHCn2VcdRgLIFW51JSeqr9ELHSZ9kDqZY/wA2EPs0Tk5ilcRSE
Kj0pSFoeYF+hjgu1YJq+G+2GQv+NSVJuJdAqSuFgACr58fX2WPC8Irej+fBKDZG42JQLoZfsL2yq
uN/by7lAKhfKWt1kZXuy18oSE50XURCIRqjKkwntzFynVFnNTNKEIymW0kgcbYe9MO1JJNgMn3OP
yS/8/ricB2+iyUUfE8LamfKDGcxHeJ/+a7NW6qyGsALSmWLrWs5cxZqasEJ55eH4yg8dGfP6qXpm
sJEkQ0pNsp50fD/BDtI6yfaGsIGhAKFiJoeLm+dao5Uh7QkQMye+xlYZ68SWMEblY+2wC5Up/qmp
QCGrttIrVcTHeiyC/bC/bGLkYmnxectkbOyMY2ZPpAGGyOP7Q4kGeB0K2vg8Jxjt744ZbXNzkKR1
BCysrIURSdmajq9JteqIA4vP8RDxBo4p7l+u128fHp6uq7g+T/dphsNsM+sQygt55J9KvIWhmXsK
py4abG0hs1CC6DQAxTuKKSwv9sx0CU13LhdMLQWPYwGBUnttspgtuXGsiy+mIZur6h3bW3Vt6oIe
zMLhPB209dzpxQNi9P94UXSpc+VXgI4ds43nOoPxUF7x2/v1du3c1OgpffCSOorG2KYIjvLvOlSc
rcvTS5rrxnbmOqVpsUOPQ6l8hYgTZimFp7new/ZRkt/Dd5pDz+ZWNIrmZHzaU79r4wtNsO4uIARS
YIw1Av0xeDC8R8jnp+dPjx9WX58eXtnvz9/00cMqUZU9yfD8KhJHx5apTWK5QaDytdUb+djIwh1I
g68642H6VEbuq/Wxlg/OxgxD843lAuubqsomnhtch+7t1Ty4HmHSJNwJeRsvOLwLkwzXHc7fRo6L
B6l5gxJpFejo4oisO+LdmEOgXu9smVhHhjFT+SLTcBBiYRqSm9Zcv1y/PXwD1BgavLTjmhlNu1PL
qxVbcmBNDO9v2E5rjXSjQKv9os0CnGcgX5QQY6rwMNwyiziEzJyf3aKdEqysPlWdNkrYWYRxXzVx
KsrsIa0p88zP+Ka+/FRZ8QGwECxY5qYt827Z+nSX9fExjU/UVhl7OFiZSxjwUejL7PXCiOYMbWbq
JZor0PdWMFweZPVA9ZNHS2eexI33AtctX3EoC/M+F/MaonUV09HT09+PXyDclaHrRmN4EullQ8d4
wv8Dz/C1d4k1cN7Ou86WJcg5uPRwq7ogC7MveBZ3c3o3rIWZ6X6wZOJyhoEmTFOk51FnOiGXrIwz
+Ca3qC8jXxG/lfMS68LRGGEXvF9cu01cRby78daBTZuSLYL8/fnh5eO31d+Pr3/ahYq+wh+jwt+u
DGFmb8jZeJsZZvJFLn5KoE8vBa5vb9UVs2AskL3B1GV5VnY3jcrAxg8fgPkvSIvHa9cesCycunZf
Hwi+/8APYQybJ+MlKW4rkA9405ZEngsDsDTFKRtBxqYHOffnNsvRDRFydv2tZ0fUyHwGqmTxVtCt
/LFMRTorsllA9KTyBm5L0CkzQqDRJTkCiyvHSNGR/ni3AOLCOq1dOeKsTEdfdVqvA5weBGtUBKf1
xhKDQGZZLzb9FPhq/AQJCdDwarOKxsFGvhQ5ArvEC3Gg7WlcmfSY+kGuXg9XIexricqBCkhA+LkW
lQc7YD9zrL18jQwWDgSI7g4ArhcCtBaH9gWH0AxqMoePaBvQ5dBAMl2O96fQLU3aLrRo6055RhG0
60Jrsl2Jz3fR8/Yyxxqvm7+OMDoE4HbQSnWeowVJNKcxsfdzw60bGL1g90bOzVuL3L6FMSFssl1S
DHBaTNGIQ3XYJwRAU7p1LbEXJRYPPQ02M4S+HDFEpqu5glXEkt9YY7Lo2qEtNpZ0XdNkzLUFjak4
b42VVd+cfMdHByNEPwwdy9FqhckPtvjJMoUrcLCDhgqLHIFNASLPhvhbxACPCD6OBRohVkFUAh1J
BS3CyN1AVmVkrbLAPOShMV9Wx4W7CV3sZQBtw+iGjnCuqMNLZgDe+hG0qBbA4cbI3G3lw/OrS1y+
EgNPA2xezwjfLp2JkNhKAOy2DAUb6uoxNHAdObWBgnj/sQILDePwcsPYoLQYj+YUWpJ4TRxtsHHx
+PAyiyWEoMxyY5EELAF2eXHazzi0uXoJc0KyQ0ESWtsRXHcntEkPIo+WuYkirgsQ9l+e9mqpfoIV
+eLCUX0nQcdp4SmhYmQgcNHeA2jjeDd9+ZFvWXcZ1zrATCZtie/hjWIImt5zZsh6SpC1VEuoF2Du
HAc2FmC7QXw1DmxRK8sgyIi3KBzg2bpLX9k4h4foHQPYMgH1oXmmFjSE+cSxJ1G4jdCHAYoWqzQn
Q0GqNYM2uyGzLNuOidN3O2RumGGvw/pGhvFBqLKgdnNmQbVQgm+ouMxpmbAGliTu3BsGq6U+8bwt
FjtgZhFuPNIkQAJEYjyVDb4uY9N/5N9Yl3EeNKvIxFGESvgqmY5pE6fj9WEImmpGYlAOssl0D1mz
88w8Fn5/a6nCdtGfBoYAb+1WDdUsI2h+D4UBdXEBQSO5Swwhtrkh6Pj4GDB0YEAqScfWishZXosA
iyW1rsJyo0HRFm9QtMV7OFKzqozI+9zXUzMj3vQ2QBasPP016viKlNmLX+U3G8yfLMmZrcPQigIU
oJcVZY7QRSckDqFBtlQOzJTWZMMW+gSZGvMaTiDfUQLHFhpkp0gwXG7gTTfhRsUFRztwoDvU6uas
8grhGcEXcnRvdYZVQOwyHxpSH0dUqZiIFoMIczotN+wbH7PEPCnPiHKB7Ge/47vZ9/DNMS0PLZ6d
mzE2BA/McT5m+BdDKHw4qGd+Mfx6/QAh5+BZI+w9PEjWEExiFg2nxfGZR3jQm8C654yZf47V4vKC
+gAQM/zjAMcpeuCMQ2c486hWbJfmp6zUaW1V9/u9Ie7ssEtLBlhfHh8hmoXl9fExY7/u9VLjqqEk
wzx1gZ4PpFHrx3Sa5LlRUN1USXZK7/EvIrwwHpLa9iYmnDaD89I7J5AzeHDwvm5SSlUi06tDVUL0
kJk+00CAP2T2tKBCqDItJ6VOSeOq0GmVRnjP2qmSDmmxy+QRyYn7RivqkFdNVp21lhyrvE1PikA5
Retr6YlLdiG5fEaVF95uQl/rLFbRUfFl6n2qEs4x3AyO9T69IznTRWsd0jseakWrxX0j4rEp1Cwm
ifbOrNUIv5FdQ1RSe5eVR72PTmlJM2Zw9HfkcV3dpZoA4NKG1qo8LasLfkmLw0wSYEIszS4IE1TB
+tCwDQWTVlPhB6UEfs8T51oZmlTor+3NGcRdqPatNh6rkpnh1BiQxTlvM975lvLKVlOgsm2yg15M
1TBNtJRQkxKuIjOlVoQskZfMVZ2WTI4ldqRFwC3J78tOrWPNrFgeG306kHv1/jPKMt28sL134IO3
/ECBVI4lJiNxpmT65hAzMTwaC/qRdeC4p602ZiSisGSarYWYaZbyGritpw+2popj0upSY5bf3rnD
WTK1HJoWmbBVMlGbV3jkmIWO59ed86y0vrlNSWHUtU3TnDKfAD2QxTnOZZ3rtrUpMr2kA0R5IjTD
t815SQVp2t+qeyjO8jI2V2mzArOUNE21KQBiZBwKndacaTvc1pDqJtOXxHcGj6qvKfZFhuPe/n2q
OqbCmGtHDGUsy4qqNSxal7ERaq0HvESXkMpwn4D/a7NnlNnxqumP552uY5weM2FUxfBL8+fyWuvm
Iq49b4jSO57XQjxF7kLCZRLUx4W02MLPVcZ2Ig+/gSdJlSueSrm7Z0atX55fnz9AmGLdSYUSTjvF
ggGJTynoUuFGuTqbcggNdnjQtsJ5EW7eJZdopvWHinlzSt5evST9oSER+Hz1B+GFdlbHOOvhDjpb
xIib8LMtlfKSq0SmuQUP8aqIDBLQw5SF6BfA57zOhnWN8hj735JfDrQ8R5r42B8J7Y/yDMAQ/f2k
LNn8Fad9md4NV9PMGyBqVknopDnZvFJaku4Jm7J7uMOXUWx2Aq49e1VWZi0388wWqnJSb62pWNXy
A63JOW5zVr7eGICTjJId9EvHTFBJchib+NJNSJ9y8R+YuWIEy+lULii2+mILIzbhw4UZNrX9y/sv
RfXLMWYEV+Lnb6+reA7jnGAjKN5sO8fhXfRZpnegXji1Zv+ylWqqbLHP6HBxWtcWUSATmF0SnKWw
XNubGS7pDr9oMLFYD1MDx66JC60WEpqO7da6ldObqmqhL/vW1kOcrW1Bk8cgw2Yxe4ofAZbf35d1
XGwtgQYURlgJ4c6ywsa0ZkEoM1uLf9VRmEgb4V/eJi6Ldz7hC8F9J54Cv/3PtbakELCC893oSFkh
5WHanT3XOdaDjiulZ7R23U0HkLUGwONvPJ1HtjDMEsBNJd36wZaiv/Zcc3RVFt2r3taH1Vv6cGby
Y2+NxvxT2PIaPpF01iotqsLExY+43mYbjvi+ofLUbkWqG/pXvUH/Rv2q7PpVGfqlTr956Lpm309k
pkCVCjUhpAuItphGwgO72BL6aGRYEgrgEJKIR7VBPS4R92MVPz18QxJhQhn8TrW8LwDEu0QbWG0R
j5NQyVzhf654s9uKrcjT1cfrV4jov4JrmjHNVr9/f13t8hNM+j1NVp8ffoynzh+evj2vfr+uvlyv
H68f/4fV9aqUdLw+feUHkj8/v1xXj1/+eB6fhMZknx8+PX75ZObM5OMviUM1HQjvcgiehlwOUZ3L
9oytFjjExZw0sSoOQa64n8CrVw/3n1aHp+/XVf7w4/qiezD8mYTWdv3kHOcusETZmVj4TqG2NBXe
FO9yplCfnz9epdSYvJ+zqq/K/F5zie5iX20aULhzaDIutFh4ISuKLRr4o5U4FKGTxYhFANgrbasy
RaD5Upve2+JN++ErgKVLOZOcbmEivlM2NydyVnRhYVbeMymKgA4PHz9dX39Nvj88/cJ8tSvvlNXL
9d/fH1+uwtcVLNNJ/Fc+Nq5fIO3QR0OGnriVZHSLN4ZHQJC2IfGJ+buUprARsae6xZ/LBc86Y8sa
/GwVH0tHyAqfYnvU49y5lT+ASUTTZE4AkxjzwPJU9nG5NGZrNdHV1QJydp+7CEWGfmccMG+j1pAk
5/bcqTSaXmh6MBdUh6qFPVRL4bnexmFjnv3dxhtfx3iYQk1aidg61V68b5OM78Zbu4Z/eLGnZ+Bw
X+yZk0poCxlKDtrAYmsq9uciR//lTdJaxPSJregu2a4hzGJrPVrdkYapkDaV8NQmCmN6pGkr5q19
1rXnJtVVA/Yf93e6GO4ZJ7atx8t8zwXVeWpR4NWzv17gdjsNoWwhyP7HDxwfR9YbZ60bGNiW65mM
UxEK0FIZJuCKwkcQObwOW5+I+TYrmSlEJ+v6zx/fHj88PIn5wzJdH5ViRzM5YkiNyqoWa6g45REz
p2dJ4ftBB08BbmkL7AT0FyVaSEuOl4qv+OXtuZEoRvTuflyxL1gLX41uLrTl0BC9IQoHTE0oOBzY
Np6VNoAsAlZfcCDJAY3Z1t7XauxjTujbuLbE/xQwhGmKQkxxBcMx8Sn1PTVvpIBoyyrk2iJaCR4e
favW7sVNKtX++Hr9JRb5W78+Xf9zffk1uUq/VvTvx9cPf5o7YKLwApJbZD6MEyfwlWDd/5/S9WqR
p9fry5eH1+uqgLnRUHhRCUislLfg4ko6yJHykkEa3xH9jNbO8hLFSWfzT0/vslb+FFjI2SLruwZi
AqUY0cg2XsT9kNBJeGVF/CtN2D9ZtbB7M3UrPG6/fwwoTY6W5RSgYyyBGwwQuYOV8xYuS8xGzlV1
xOJZAyxuK+IeL2+nuTSU26keq+Mk315ja3DJQWZ2kWG3GuVa3qmdm9yx5WG7LwzqLj+n+wzCeemI
7ucO5GPmb6MwvnjqymVAT/jimjfnCH/QU8AAX86Q71Qv8kwX+vsMEtqwkYAvPvhLz2Vn66v4HdNJ
/YVH+s5a2BCqyFJc0Z70wqo7LABnkRa0zdQYZyPNHEZiPF7Z6vIHfX388JdpcqZnzyUl+7RnDty5
mJxT+dGbG7Gw761+DeWbwjxS1awJM63n37/lZksY/14dVzmaJYDz7Rpwm0pwOI934IOUhzkdGoTR
Q/xl/iAWNlHGSek7XhARo2akyVKsTwR45ymZb0UdIayUfFxzpgY6NW4cB1KIrjV6mruB56gZkjnA
A2CiRA8j+kZ7ILAjelVzQiOv04qCY4GeWRTfh7Ps84rWVTs2bfXvzjs8yAVnqmMSBT4e+5Uz6N9p
tPbUfrTGbjZNqBpbciAHDpqtekSDrhu/OH02MDUV6EzG9lcmdIPVIgzQVC8jKqJpGg+F6LHPWZhB
Zzw10G3fvCaeja/3vYhgCjcX2rM+okVEVYSIiDwhseutqRNi1lC8/64wnmrSAyR3XDAIiRc6huq3
fhDpw7KIXX8b6tSS6g+XadvtsoNGbWOyCZytTs3jIHI7U94F6bbbDXrVY8TDKNKLgyHLs66qhVWt
h2ZXFSWl5d5zd7LLxukZ9d197ruR3j8DIE7Za3ZThIJ4evzy10/uz9y/bA671RCe9PsXSOCIfFNf
/TSfc/jZsLw7WE/iiwfRgLxjvWxrHkQO0xpA4ZvuvXx0TPRFxuR3nketafYiLIyseJatX1wHGTdZ
bYlrIQo9mKE19k8P3/5cPTAPvX1+YcsCdVJSJg/Sul6k23JCmX0OzHkIoiIz07xQGdZCB72XI2mk
MSoaCB4emOOuDQPXOlLpofBdfkJz0p/25fHTJ7ONw8dh3T0YvxmL4LE4xhb89FgpH6kVvGjxT1wK
0zFlnvsuJbj3rrAuHQpTGOP6bK0UidvskrX4yl7hXLLEI894HmD+OP749RU2Tr+tXoW853FZXl//
eIRVIKQ//uPx0+on6JbXh5dP19ef8V7hO10UcjpYuiAmrHuItbE10ZKe4ExwRNwckJPE9LQs89ZN
HDM/L9tBTktsz6dpY0g5MdcdCMLxlGoMxGPcVvQeO8cFKIXdpWOsljMQx3DD/3h5/eD8Qy3VFol3
qFd/OsMhDXVrELDyUqRThgxGWD2O6WUUtxVYs7LdQ1UsYYMnFogtvMyhnVZSG9JcjJ2+6egQVNCw
X+NTo1c9G5URIbtd8D6lvt4VAkur99hVv5mhCx3FGI+I/QTE9Cz1t3IC+5GeUD3rgIr0MRsHZ/Ts
vMwoX96R6JuthxV9vC/CYIP5hSOHHjN9pDNzvYnU1a0EhZGDzWUKR4SXqrodEsBmh3CDdVdzCh08
CsHEQYOYSX2hRhnNXc9BaiQAD5XegGFBU0aWjjEEZql1vOeX85DWcMhZ7BPO4ssfMxRk41teGCJA
sXbbEO9GjvR3CTbhTPqebJkzjcht9873TiZ5CMWFva8meUFsNpA/C5u44aYzmy22d10HRULHke8g
jghlq89Izi0wAvsC4q+Y9IaNefmepUQPQhfn95C+Twu2kkcHenNhCHa7TWbwUVVsLmHoLOkMDQpE
BgkzLOFo6uHe8KI1BY2ILDoU4XbHl1NRK/TAZurW+IabwrJkXIAhcrChxW2WJfbBJMgIz2469+oa
720wMevQBISh9CxD3XPRVfn0cFxvI02H5DBqUs+BR39zPkyo7/no5AP0/ninHWFVa7okda67UWxR
TsBE6Yui3bju5LRPRxtuNMj1+Kxg0gMXGfVADxAVhikyDPo9KTL5dIYKY5LhSHRLY7deiF/zlnn+
l7Sna25UR/av5HG36p49fIMfMWCbEzAEYcczL1Q28ZlxbRJPJZm6Z/bXX7UksATdOHv3ZSbubvSt
VqvVH94naCJUPWGUgk5BCtlgMS3UQCC1ItOeAxzfqxwze0yx9tYO2xg75r2oxc9ywKD6aJ1A9xke
4KwMHA/dZss7L0Lj3g0Lr/YTC1kssGwRhj/kzJnUxBInRNV2AwFYGaLHtkiGM63r65ftXVljw79t
D9n0ufH8+hu//o32zFTAZeXCIVzFL9NLGwwONPl6qg6fUEFQ+1VbdnERE0kah0mE567rFN1e3Epm
yKrR6/50pognrOGQFmkVZkn2jWdfIQELzoYPNWFLppOxuJznIoi38bRJbUTZrQ0d322D+UmdPDBN
J2H+qsZnOU5jN5ofG/C23CaYfdiwblr+l2WjwiJry/kJrpMY8wq9HKyTtHw9Ssa7my28qOmHBY0G
dJjzjSyjwxWSSaDh6Wwc5hcFx3d7XC83jOZ2T1/gRRn0C/NA0jqhPcdl4ZFmgcq9ZRsGznwLD7D8
51h4OLJj0RYK8XYzfNqmtr24spGFP+CE24KOmR1f3yEs/DzH1ZzGQKc4v9NVckSkuynfWdKJR+/r
BUo8toI16iS7KQd2MsHQ5UACmMqzKB4vt1nBTGyl+azHRZs1MT961xxjGDUdciAmEg7zUmCPRfge
AzSLbfswgx7zsB53P9Sst0alyEkJG2+R64VC5uUajJrJj2X0+ZyjAzw4iyKo6i6myrh1yeLLZEW3
jYuqyyzetRDFkhjrgeRAk5Q1ZMUgquDIlkTybUkc/ZBxgvpsu6xXappQvAxzfxVb7oiwpYKgJL+v
m5QuXD4Y02tXcGPH6uJ6SRYiaWyLnnDOAejPezMY0QXCDrgnoWdV8MtxHT1ORvCWomWX1qPNC4lt
NoycdI5N7iissIOLU8yHV6A2sFO6cl0azyYXFL6poZfSefPXCGqkjlhN1nHPWKVHXSc72pNvRIa1
bhmbtr4KjnPoJG7oxdFXI0y6SaKvE9ywKsRWH7FbsNjX8oULIMRYYMvYcOSXfKYYDcDA/ZPnE0SU
v3D/mH3ZJhD/Z1ylMpqbHBJdE+eDJQsHL3crzU20HzwodJUX5ojeCzi+lFVJBKvnKC577DOVcxs/
EYFoZJWvoCwrVuNs4RKzyeJ6ChUvGcKUYHy+Dt+Ih5cMD+k/GhXtPNwdaLvwnZ4ym//gq1iK+3lz
p1lxc0RaZiWKqJud+ai0XxFvVnC4d0h6RA2tN0f+hjf83QS4hOyI1XYCz7f1zgjj0BdSog+KCivO
9U0MKcT5GK4yY3HvhTkztGKyuEXCk/fznx83m18/jm+/7W++/Ty+fxhpTNT0XCO91Ldusi9LImoA
51VZigZYbGO+T9b9Fsl5b98/lK+U6UURPz4en49v55fjx0hcjPkysQMH1eQqnGfpJrajomTxrw/P
52/gyPJ0+nb6eHiGF1de/7SyMLKxxwuOcCKzmrki9Up79D9Pvz2d3o6PsBPI6tvQHWtjzfqulSaL
e/jx8MjJXh+Pn+pz6OF1Xi9Hsj7REP6fRLNfrx/fj+8nnbWmi0hXsorfnj6cZBnSt+/48b/nt3+J
Qfj17+Pb/9zkLz+OT6Jhid6roXx/oQzpVPmfLEEtxg++OPmXx7dvv27EOoIlmyd6BVkYmbkXFIgI
z9lje9vhYbFSVcmn5uP7+RmMfKhZHEp3mO3YxgK99u0QIgLZlbrsKLZwN4kCppb409v59KSzlB40
LWJZUenj1qyDHCnLqiKcIbc5P2NYTbgjS/uhLiluu0PBxTj+x/3XBvOUXi27dmVwYgnp4nVpO4F3
260ww1FFtEyDwPVCD/kekqx71hLX1Ok0Id0smand1Yy0dXg4hUPeeVt/2tTgrq6mNeA+DvcIej2t
ggb3IgoeIMNTJylf/JiyXRE0cRSF05axILWc2EZK5Bibr3i6RJbVzHd87NONbVsYk+/xLLWdaDFt
DIcb4asNONZtgXHnGgkE/nQkWRuGrt+g8Gixn8DbfPulSKYrpC1Y5OjRWBV8l9iBjQ0rR4REmoSe
ok75tyEReFUR3QsLogoNXFGC4MK3bF1ts22r+x4AQiRGH8HSvHRGICOM7DIp5XfqQjS0pk87vE82
OW7xDyE2EYt/TVDjxc74BNS552pGB/weCfoWzs7yldYL4XvBpScw6blANyXYsINUxVTAm56bN8lB
YSDsTdtURWFEyOMf1k214lcQ7V7S68gurekhvJW1MS7JpuEi2xBLgPCDyYoi3laHgQylqoo66Q6V
HWKjs4n5PYVzYy3umoJAKnHOzrXr64WJGy29sHb5xjQ5gpLn8+AvIVN/8pY2xz+Pb0c425+4EPFN
v4/liW7cBQWzOrIt3YXsk0VqrSyEfgCLjFaUt5ZnyD5alzATHhO98NDXTY1ImProO1nDbfLA93Gd
kEbFEiJrm0GDRlDXKXJfnhXo5xzpY3zQpLE9bD0AxvPokkNcLaoRLUs7QqN4azRJmmShFaDzBLiF
46ONS5hjWVaX1MQkiqe+IjtQCQxGpFReTI1snZX59irVVD+PDJ5T1sw8BwCM5PtDyj/k8D+/e48/
v6sagtsCtmC25UQx5ypFmuO+hLo8RzxyaCTSSIoY/foeZ1saSXXYojZWGsk+8aktWtbOjD2svgbT
0I6Ily19DeQHft8fKwaMEQSD5WpLXMWhpji/jYuuxY9xQcHPs9C2u3SPvxj2NNSpqPBdQD0I6wTd
Om5x3WFPdVttcd1pT5B8WW8p3YMi2TT4k1aP3xKZNy/4+e8ZcfUADsy32hJiOF/f4Zucs8Eg2bvE
k/SYFH//HlH5C2L0DLKAMG4YUV1npppv6HXSwHGId+MMgi1sciJRtb5xKogkQLypgPU4HsENPhUR
UggG0KPxkgc0vWoE2uBzUsn1+u34enoUiUqx509+E862OW/3ejf3rj4mc3w83NKYjpjlMRkxzWMy
4kFSJzvYFrEQTKqI8MrpqdpkN53LXkWBjSm6WPq4E8QjE6iqE0l6XZAsj0+nh/b4L6hWn0Gd/bcO
dV0aUdkEe9GpgjAg+K1JFV5lC0C1wJNeGVSkkcGY6hM1RjZ1WphUwSfaFdkhbvI6ooo+RUW4YJlU
PqF3nV8W2srR8xbHL8/nb3zB/lAWm++6huwz5BqPY23c8H8T13a7kktN1/pS5/wLfuG9KpHcjSIL
G9xNzDotQaiHvavXBhmNGr96y5CAGvkMmfMpMs+9RiavDKt8T0sk8tmQVQmoJPG64MEcr0ivBozG
RjdNAPG/quSWYZgagvEIU445bDSLXeTGQ6OsMcFDmGozxXljnJKrq7idz7AtBPt1CaweGQ31ur5P
doQULd/d0ZI39/zitIURIxg2O/98e8RitICfomGbIyF1Uy1RJZFAo23oZdQZkj5d/AxFbxg6R3Mv
zChoglXblo3FNw1Nkh9qsNegCYS9aDBDUN0XM9gmnRsHvt68uVHgeD/vNoymkJGWaLw06JwhUKFs
ZyiUnWXXtskMlbIIniunuGVN0qVLCI0oNiCxzYqa8evW7KQc2FyX+B5osrlJ34pha/nqiuvrLb5y
REgizhFch+SiQCHtigpSRAaasjYvVv3gNmrojYv7BdoF3jLHH4PiplRbmdURoYbmNPuwFIYJeYL3
IW5LzuZrqhKBZTiy77483EgdQ2/kPbPTQPXQNfXc3IN10cx+gqPo6nz/AYpxsq9so8YzKa8QlO2O
MBxVdj78qoaPxVBES+yRbJhUIpyw6gpYacRtXpDnt1jfByJLBL+E8A1dNrhv5IAmHKIUvsZ7IJuf
Q2SqL6xL2tkZYS1YQxNLL+EzZc/yuOHSdJWCt6UilnFPQuFF5hoIrgkrh+/HGfF4dAhrZcR5saxw
JVHOBYAdFgRXPX2/nD+OP97Oj6gRcQaZL6Y+1MPb9+RjWeiPl/dviOtUXTLNVEr85Ex3DBlMgS71
GOVpy73abdN7zrMn3eJy5c3f2K/3j+PLTfV6k3w//fj7zTsE6PiTXwDSkVWMuhfwmwY2CNLzI4m3
e0ISVwQgzmcx2zX4pukDs4HMm29XRKyyIewaRtS//SPtlR2RymiiHxILGwK2DS6CajRsW1X4maOI
aie+WtBsN6at1bfnwpa54HFbhgHPVs1k9pdv54enx/MLNRK9LFqPw7lqKyuRcakIzavATz3uDVm2
LvG9jLZO2t8c6t9Xb8fj++PD8/Hm7vyW31FduNvlSaIMJJGDP63jGC5zW1Ypk8jeQOdKFTKWxj/K
A1WxmBPQyaF9m3wplXVcWP7rL6pEJUrfletZUXtb4xlgkMJF6ZkIpHxTnD6OsknLn6dniAcysIFp
8Jm8zTQnb/FTdJgD+udhbSw/X4OKHnfRaKB8Bgycy5SImdeKgOoxcZoBmm+0Jk5WROBITgBhQrv7
hnBQAwqW1IxIUgjospxgewtHrG+ic3c/H575Yif3ojDBhksqeBan+G4SNHCKduMsQAYBW+IyjcAW
RYIPncDykwdPLiCwrEyBgia4T7aMIcxQjQ46BuaWmtP08OP3VggI6wa3Vx4I8iqtuCyAK9sFt5zT
FEFqWOVmsK+KNl5nkOOyLmZ4pKB3Z+l1akNpIkLdIzxerI7D6fn0OmUZakAx7JDa6lNH/2BZUsK2
WjXZ3WBhLn/erM+c8PWs8weF6tbVvk81W23TDJauYbWtkdVZA0YdMe5waFDCYcTifUYVBQG/WB1f
LyhmLN9nvTt73x8k1izc8WRo0k6ZzQhK6joIQvdn6KRuAaGajHmX7WWMpUmHBaJv3LZKcJ6FUtc1
cfkxqYdNk64wm4vs0CaX6FLZXx+P59c+nwYylJK8i1N+DYwTTFmpKFYsXnhm3BOFIeJeKWwZH2zP
D7UINReE6/o+Bh+FNdMRkYcizBg4Cq6e/ifgduvbvhHvQmEk0+THDeQewMx0FV3TRovQ1bxAFJyV
vq+HLlTgPiA5UiNHcfYCgaodzKCi5PeYxoicrjQPaROX1P0QCDLiSFGyH5ezVviJtGztruASWIuL
x6AHzsocZ+fgj0PhREjldU00WqTRgnVO+RCAsgS0FNus7RK8BiDJV3j58rGy22ZU/SBDEGZOaRyB
g1vaUGPSazeaOiE6LzVhqzJxyInptUUl6ugkGFOpBTTrz7tsAnQxoO14CmoqUsHpLkOrzHPNQDEH
55Xex2QC65IlRir8pAi48qLFsBAEmIv/u1I3aQT8LRhNApUJVlHnLl4wBlb+uWLoN2Zn+loZnH0D
iaOTsD4joFkcB/fkGnc0Gyd490RamPi19JtYebVopr89aKGDDoXr+ROAaf7aA0dhyQU4dDrK8KzH
j/wVLoyijB2UZ3GEpwc5lr9HJrkSJps0wBLOlUWMwAKHjsvQMKOSciuKpiVdoCZ9GjvmwZbGro0/
bvK126SodbjEaLMjAHr4q9WhYNEicOIVBjM7p8GNpmpe8bIjbjpec6ztUWBqjLT09sBSrZ3ip1mL
BBkNuj0kf9zaMjT2hW0mruOi51YZh55+tiuAWWYPNOoGYBCMgsDHkedj7wQcs/B9u89TakLHAE1w
KA8JX3++AQgcvcEsic1Y3QBwDUB7G7m2YwKWsf/fepsN+4+L6usS5FF+RdG3c2gt7MbY9SHn7+bv
heFNFTqB4X8AkAVmbysQzoQUi7DGEV4YGLUE1uQ3P5G54M8lsSYuCrEb9ZIvBAy1Hwbfs8AsMwyi
zh4VQ9khAYpICChQuM9gGEXhqIKFgxuSAMrDbV8AtcACG8XpwgtCvU+5MJblErhRq9RDciitRpxF
coEi9lOHJjrUjnUYozUk8EqzTaAczEGpThaaJGDuNWlZL/Nu91lR1Rlf0m2WtJVxXKpLEFXyJueS
P25AtDmENraY823sHA7jTvTPGlRF/LIYTsZd4WRoz3GJRZ2A6S5ZooprQ5XZJo4XasxKACIzgDOA
Fvirk8ThRlNw97LQIHSAse1Rrg0Bw9++AOd42CgDxtW9zMAtIdAjyZVJzW83RuQgAHkOytE5ZmF8
rbIGimg4gTUefB3Nb5ngOE7NQ5ltu6+2nL+ZRwzGeRVFUDuBsyAmchvvQhm4fqAHWwOCWt5N+Y1o
1B8RMGH9panIVg73/5mGNl/XTkGWIIOu0WgIuUZjxeaA1J3TMP6jCw/Qwck8Q5KuWFp+jggfRwhr
lalFoUDCVimxItsY2B5KxDbq0R6zULdBibcd242mpdpWBG4LM59FTGZQMMGBzQInmJTHy0IjtUtk
uPCtUUkscj1vAgv0KMSqYJGvAanQtTMLO+UBLfOtjYe4LRLPNz16AMrXluVh8rGKY8vZg7nghTcJ
h4udgE7NfhWI2DDY9CvbsUNf6H/qfb96O79+3GSvT+bLDhejm4xLfGM7ArN47WP1Hvvj+fTnaeJA
H7kBYTFQJp7j41Vcyvp/+ezbvoWW+0mf/eT78UWknJPBunS5tC0436o36hqiCTICkX2tJphlmQWR
Nf49vs0JmHEVSBIWme5HeXw35hU9Py1ZaFnG7YQlqWvN8BbeyhzSlXdsTeWEMGhQlydWMz15j/ip
eqYxVACyrMljXIO0/xqNw6n10zWeBxlF7fTUR1ED9/zk/PJyfr1MkXZJlIoNM+vNCK2rLlStePm6
yqNkqgimOjtE8BDugpdVY8QRMHDS3oHVfU1DL8zbLKuHmmRHsCutSbnZLfXeTOswPmtHPcFxxsIc
4dTtUwW7kBuK760HySWoLepbAebxzhGuef0FCHnD8T30uAKEZ9yc+G9DdeT7C6eRsZzMugCOl+gv
3MYswjKunX7geI05UgCMgvHvKc0iGCut/NAMoisguHAKqIAYhTAwmzi6T3KR0TL7xG+MxoXTtVz9
dxTpSrm0rlrIg6RBmOc5hjdqfz1IifhWXIC3Azz/ExftAzN6eRk4LiHBcLnbtwlZ348cUyAHjyET
sDAj9ivJi4q7xRFW5EDuJ0Mo4GDfD8dCAYeGLnpFU8jANuqWB/5kvIZQMDM7bGBDTz9fXn6pR9YJ
T5FPoOmuLPGkq5MCZB4gSIJ9fH38NYSf+TekSkpT9ntdFL1RlrR4W0PIloeP89vv6en94+30z58Q
iceIeOM7RgSa2e9kfO/vD+/H3wpOdny6Kc7nHzd/4/X+/ebPoV3vWrtMZrPil2eKhXBcaKPj8J/W
2H93ZaQMRvnt19v5/fH848irvhwaQ+NA6W2R3A+wNqqB7HHGbhca9DFzPTTMWeBFcJTnG4LL2g4m
v8eCjIAZHG51iJnDb9umhreHjTW/A5zS/IrroR4Ipqx3rqU3VAHQE01+DbphHAXR8mfQkKtrjG7X
bp8KdLRJp7MrBZjjw/PHd01M6KFvHzeNzHn7evoYL4ZV5nl4oC+BMbguvC5bNppkTaEcQ+LBqtaQ
emtlW3++nJ5OH7+0Vds3pnRc2zi60k2Lcr8N3Bz1VDsc4IzCN2vTvtmVeUplotq0zEElgU2703k/
y0ND8Q2/HWPqJj1Tfqucw0KWuJfjw/vPt+PLkV99fvKRQvarhw67wo23nwCi4UEUzrw55KMNmF82
oPY0lastiJS6OlQsCi3jXUZCxvtQQc2XkfIQaKOZb/ddnpQeZypGt3Q4EfHLIDGlS47hGzgQG9h4
htURxs7WEJigWrAySNmBgqNsoseNng0v2EXK8CvmzFLR64DpFdm+XjDo5b1ZJqQ7ffv+gZ8Qf/AN
gksXcboD/ac21XHhGhlp+G/OuYzUfHGdsgXlgC+QC1RYi1noOrricrmxQ99YFQDB44xwWcvWI2YB
wAgKU7oyXevld6DvYvgd+Ibcta6duLZQpZRE8X5b1sqY2zsWODYfFNwGY7gmsYIfmDamLjJJ9CxH
AmLrQqf+lFkwFF43lbZo/2Cx7ZiSYlM3lk/4ofZtkVlzUfG68XVhvtjzteElbHSM8JOFOkYApV2q
tlVsRgCr6pavJK2KmvdAJAE2porlto22EBD6+z5rb13XNt4gu90+Z46PgMxdfQEbDKJNmOvpuYoF
INRfNdUwtnwCjURZAhCNAfrtCQChXhYHeL6eWmrHfDtyNElmn2wLz3h3lRDXOFD3WSmUhrgyRSBD
bMr2RWCbL/1f+RTxGcHFX5PpSFvoh2+vxw/5nIsc/bfRwoz/JyD4s1V8ay0WKN9Slg1lvNa0NhoQ
tYMQCPMlPV67tr5atJ0F1FlblVmbNaYoWSau7+jR/hTHF+XjcmHfpjk0Ijb2K2tTJr4065vsXYUi
jtAxldH7HtmUrm082xvwiarOxOIixJe4jDcx/4/5riE6oatDrpufzx+nH8/Hv4w3fqFJ2x2MInRC
JXk9Pp9eqSWnK/O2SZFvkTnVaKT5UtdUbQxRgvSa0Xr0lkJc6P+r7MmW28h1/RVXnu6tysxYsrw9
5IHqpqSOenMvkpyXLsfWJKqJl/Jyz8n5+guAvXAB2z4vcQSguYIEQIJAQ07BVSeWuxyxR39gjNCH
OzDHH/a2ub0q2rd96qDRc3yHb1SLos4rny9V95zUWxhD/ZGKK8wQG2dZ7q2YYlyzFbZDxw9Dq7g8
gGlBucZuHn68/YL/Pz2+HCguL6POkAieNXnGi2BtJoO6hPXbhiPARM38VcVH6jfs8afHV9DXDmyo
5VPYTnwncNNz/lgqLCd8nj08lprpSg4BdC1IATRfCTynAsXDBExOrKOtUxswMXS+Ko9t68/Td3Zc
YIL1qPBxkl9Ojnnj1/xEneE8719QJ2ZV2Xl+fHaccAlo50k+Ne0g/G3LAYKZnm3xCmShthWEeXni
EQl5IUtdDcvN25QoyCc+gzqPJxP9OJF+21trC/X5GwIapBVnByblqRWNVEE8UqFFmqIQYCfnjmSy
uqxDWZtIYUwF6nSmHxCv8unxmdHtb7kAVZ4PHuNww2DrPGC8ZY5JypNL2w9GV1eM71qWe/z34R4N
etwE7g4v6vLPkSSkoZsKcRSKgl6TNRt9nc4nhnGSYwx3XSlfYMhw1vIoi4V+ZVDuLk/M4w6AnLI8
hl9qCx+1QjPX3CY+PYmPdz3X9UM82vuPhdHW9rlp6TkrxAjb5jbwTrFKgO7vn/DA17MlkDg4Fphz
2hMABe8ILj1xjmD/jJKmWskiydQDJ+58SMuzJClxXvd1vLs8PtNtAwXRp75KwMQ8s36fG78nE8Ob
rgJpyqYLJYRuCuAx3eTi9EwfUm64ejbcJoNDN/xQctsEdUkv+uYgkF5McFfKHQ6MorneB0T0vnDs
yHcU3tCFLYE3hCLhZRF7nsQReuQZL+K7sCJegpGMfYhu41N48atovuEjAyA2SvjHegq34032Fjnl
vdlaLAhwf6PapC7LEQq1pLz4kaB7iF5LmcwFfwaL+Dg/ufTk41VodRlYBv6hG8uDp/AghEajLiOV
PzMkYfFZbuQJeqk+V351foIdr6Iizsm0aWDpKVCYOMEpNJI8EJdW+lgCewJ3IE4LswnqM+/yQXSB
J00AIdunPL4gHkTT+t95CcbeqhLeH2CM0PH0IshjPnwAEaB/3gjWk0WBkJ7oKQrny/vXY61gPiba
jCFOQIz25C3Rn6eRsJEMPA++W/SqsCLr6Oit9vCjBTSxDO0WbiKM9zgyKG5+UGWTF1dHtz8PT1rS
nE5iF1fIHMaTPdhHI1ZTFSFmA8TkRBr5V4rGIyKPZ2fLobDRBfhl7pEQPR20Z5Sg+CYmfqqOGak+
lqIqZxd4jlLw72r1+J0+mq4pq4vSXw98PKRxE1EoPVFrQEAAaVlJ3+EAEqSVLxle64aOtQVZMo9S
TzGYyGmJ7sJ5gAH0Pf7CmIrA7nR33GKzkNbEXATrxnoK2Y8VBsZFptXiOhg4Ua08EUBb/K6cHHuS
dxIBxQ+ZeTJrKwq/ZtISjOgmBkXrZjlCaAfOt9Dorj+GJn1guR0hWU89hxoKHQvYH3x8SwRKpI9Q
JMEqbzA9zW5sUEdSOQ94FUy8EcXY2KLb+Qh6PLybolFpCbPSE9hhoMl9HuhE8l7s65aKvNXrcp6v
rv2ReRStnY3ARJJjj7skxqJ1thT+FM6E72MDj9CMhsA0SZplXHsSJhIdRrxk0W1UzC489nthuzs6
O862OhhYXR+Vb99fKOTEIMHatNkNoLVcIQOwSSJQsUKFHoQlIDrlFt+7Z5VHAQK6ngGR0kvlxPbv
sVg+hhPFDvi+DkTaVIVIy0Bi6j4vnYpIOdYOCrg6dHqM7vLdkk6PicRjIODg4iq/mCORRxnriJrl
Lv4Q2WQq/hu6ExBpkUc97YnFbvlRMho5pG1EKuLMzxbWJ6OD3ca4wvby8W+IBygvwHg7VfB+77T1
sV1xAEcZTmUJGB/otJyqXKc+FR3LoUC9ovKoxh3FGJ+1fbL7bayONsRpVhQYyOSeQ9ISv7eXlcKV
sIn5tHedTMQbXswgFUVsoDD5o91Joh3I8Pd5Qm1zo0WpHfNdkvP3SFBzQfVwvDllBPpHmo3zRKcg
j1WodJBmU+ymGEl2jJ9b0gLUbW+1ogDLQ5ycn1L4kbgu8cJwlLdJ33uHKxWN1Q19GinGB1QLXair
JLKlR4e/2FH6r5HmKMogn0xUSZ4K851ophdpAipkFJgs3qNwjOyGIHKUH5P85H0CrNRPgVFbR7sI
BPXCc8LS4nfleyWsQk9Mk45ALSpPkg0SWaS14tuVUHLmCC32HCx1HBBzjBOR56sslZiW+wz9437r
2CyQcVa1BZsoMmCoPGtiSOGM8qvZ8eRydAKUZgrLxL/siMQXVXwgsNeQTYC7+aq0d8keVaZ52Sxk
UmXN5gPlRIG3pFVJDDveXKrSzzTd+F0cn+3GGZii++MIekkKAat9PVqKesoq05NxjWeIZ0W/dp6z
V52SdtVR5jZJRzdgkzQoo1EhY1KHH6Ue3bN7quo6952bAll7NBHmKu3ge3S0tj9EOdq4LjDR2G7U
0/hXi6qKJA5oPzab93bR6EzpVH5+6qlGuzUcJa1GuBwfeeFp6+QERA0M6Jj635PO3ieNVrPj83Fb
gc5blU3sZwkV3Oly1uRTz4E1EKkAVmOVhcnF5J0tQSRnmJ7YkQMG0dfz6UQ22+gbS0Hn/oE6ufKq
G2BoYzpKzmGEOgxt7DMZG1oUnvO0lzONTDxxvlzSsT73l0mk6/mX0UA3WnH7VpnLZtFdVhsWufY1
hli0jsNbVBLMB+kJP9AI1wJTU+Y7JxdzpwemYZHZcYq9eZpDwYUzSTeJ1O5d6Wd/89p/q8B09Brx
MmygyIKs4sVyG8VNLmpPOFVVSHcMITEA+FhtHaGvPkWFuRf8bUIt6r0GpcggaZh5K1K6xsLb3F5A
+GvqScY7g6ahvzPt7NHWgylg+db0W+d7/Vbv+EbGrgsa/l5BZbopYbaWOXdfWGDO2DJvp9twJlFx
LvylU3qE9yovfOPQjiha4+mmEAaReiO0PXp9vrklj5z+nmiovOJur9ReUq301dPBmmW1GvmkASGs
vwlpoXmlJQTqoYMnRPfsx23s0AL79LQDl/ojNzB3U0kR8po0C7XcvYhJBFmZFAbznkGoN9suXMVB
MlFlQPOsQ+ayTak8NBnAmSd0ciW5g5Gkjqsoj+VueHaieeO6UbeTGqNiLM8vp0KfrRZcTmZsRA1E
28FAEebm9HQ9gocYzJ1ggNWcG5eNZZRx23QZR4lKIj1QAqiNYm0duWu8UsD/UxlUNjt2cNyx2SE2
iKiWrIQdl1fbDGLm+rwlC7IaCQ2vxN5rOEg92Uk0R+Bxms612EeF4U2vJCeEMY3LVS3CUJoej32G
jAoEM8jvqmZjV2DKcs3vCROYk8kXGruZSowOq8tTAiYrN7xQzZi/6gnz4df+SKkXGiNvBHr6VRLW
DEZqK/XImAjKyghYOoj1eLeYlGNhxNZVkGaOybiAKzWjfhHFskEwOgrqJcs0KK5zckTnwY2Il6WB
28giqq4ZUL+jOYh5HcHCTjGcXipwCgzVJEyzKlrwymikcBTBmiVYiJGvr+qs4nZNUVfZopw1+vAp
mAFCsdSYalRgSapu/ijxSKM7u2XQ91hcqwIHDbyHNoUMowKXG/xhiuQoRbwV19DGLI6zrd4sjThK
Q8lvCBpRIisRZPm1IzCDm9ufe8MBclEGIljxru0ttbrLetm/3T0e/Q387bA3RawzB5JAa18oGUTi
bV+lcTwBcwwVn2RphLHrTBQs8zgspMbIa1mk+pRY7ohVkpttIsCw2JiGKYqdqCqtdtBBFmETFBIW
sJ6BHP90HDUYGO4w9eVEZUArFbNiycRoWlaIdCmpNHZuJa1XH/brYlFOLWSnSs4j1UY9vH4LAyG6
wfDzlEuR1fx6yvhbNnS9h37Dx6UMuKxCtz6Bez+Xbcj+vBt+t72lDOrC9z576FVdrWRaRQE9wOGk
HKiSOqOo32BoGK0GVdeZj44fywoD0vw2f8P+uBCg4TRrzFU0v65gG5wcT2fH2qroCWOUBjTs0nee
qGhh5Fk6m2rWUxmWe49eBR8o5mI2HYqxu4fT6sd6EXrTuiEydgq36o5sbFyM1nAf8M3rW/Dp139m
nxyiLiuOCTezU7VAYBrNKo9L48dQzeHl8eLi9PKPyScdHYD6TnvdTH80YWDOAaMb+AaOfc5vkFyY
8fctHHeIaJEY70EtHBcExyQ5OzbHQ8NMvJipF3Pibwwb48kiOfUPhSdwnEV0+V4dl3ocFBOjhw2x
vpl6u2VFvWVbdT4zxysqM2S15sIzjJOp+VreRnKPBpBGlEEUmX3oqprwLZjy4BMePLNnp0P4mLzD
n/GNOrc72SF4pz2jP9yxqEHgGfPJqQlfZ9FFU5jtI1ht0iUiQEkjUpMUwYEEpTqw+6IwYJTVBX9e
2hMVGQhAwQnAnuS6iOJYv7rtMEshEe40dVlIubanCxERtFakvNNFT5PWngyYxkhYbXaIwMBYRyV3
ToMUdbW4MJSHNEIeZ/Vbw1hT0fL2t2/P+Jbp8QkfcGo6Lia211XPa9Tbr2p8sUsKtCHSZFFGoOOl
FRIWYJRxMrc1wkD9orK1eYbfTbgCE08WpMPwCgJSkXHUajpcHZ3G1ISJLMn3rSoiOmywCAw9Gp8u
B2STJTB0KxnnusHKokFzr1ZfPv318v3w8Nfby/75/vFu/8fP/a+n/XMv+ToFaWiV0HgsLhOQyjcP
dxin6zP+c/f4r4fPv2/ub+DXzd3T4eHzy83fe+je4e7z4eF1/wOn6vP3p78/qdlb758f9r+Oft48
3+3pmd4wi22etfvH599Hh4cDRk85/OfGDBkWgdmBvQPrOs1STQ0gBNnKYGP3vdBt6o5iAeuDJQiC
ZiVANZYFqHNQDg5fCPOxNDRzBs2fWPEd6dD+cegjNtp8PujCwJJZdzoXPP9+en08un183h89Ph+p
6dStR0UOVk3OcV+LFfFS5HrOdB08deFShCzQJS3XQZSvdOa0EO4nMAsrFuiSFvphygBjCTXN1mq4
tyXC1/h1nrvUazqFtEpArdYlhT1ULJlyW7jhjmOi8MWSmMeSIhHwu471gdxVmC3cJjeJl4vJ9CKp
Y6dFaR3zQLdTOf1lmk5/whHuI3MwcArENn9pY4rmb99/HW7/+Gf/++iWWP7H883Tz9/D1tBNdCmY
FoScLGpxMnBrlkHosiAAS8FACwTf2+ydTB0YbKkbOT09nVx2vRJvrz/xefztzev+7kg+UNcwLMG/
Dq8/j8TLy+PtgVDhzeuN09cgSJw6lkHiNDFYgfgT0+M8i68pOI+7dJdRCQzAjFwpryLutLXv/UrA
zrrptqM5RXBEyfLiNnfuDnSwmLvDVLkLI6hKZuTnTIPjYutvbsZUl2O7bOCOqQ+kOSbgdGjTVT+w
NkqEoCpVtTtNEtP8dYO2unn52Y+Zs3gSNv5oty0mwh3UHdejjaLs4jnsX17dCSqCk2nALuDghLNH
u/p27JY9j8VaTo1XwwZmZDuCCqvJcRgtnEKXbFVezk7CmTMSScjQRcDI5GHrDmeRhEbAvW5lrMTE
oQXg9PSMA59OGOG4EifMzsHAKtBa5pkr7La5KlcxzuHpp3E71y/vkplUgDYV5zfaT1K2XUTsvCpE
F1Sb4ReRSLBauIP/ngK18u57F+fOEELPnIFBx0kbtujkEL8LurMgi1w5gDubX8KdXHTSaZuxw9PC
h96puXm8f8JIF4Y623eCDhudkowj3RZ2MXPZKP4242Arl5Xbc18V8QH0+Mf7o/Tt/vv+uQu6yzVP
pGXUBDmna4XFnHKK1DyG3Z0UhlvFhOF2f0Q4wK9RVUn03C+y/NrBYgWYVdlWlH8dvj/fgGL+/Pj2
enhgpBTGXRTS3f0pHqPat7qXQGM0LE6xoPa5I7x6Ij/fEU2vSYy2RVM4ODS3eBDe7aagTEXf5JfJ
GMlY9ZpY9Hd0UEvGu+zZWVdbZhjR/QJMtG2U+p6uaoStA2jhea2uUZanvA+PXivFyhAe/0CHsPJ5
EjqU5RhLDGRGxB4Hi6quH4sjfDwTzGwhzVXAOwgZJJiN+/1xjJJlJcna5t8taaTKUfAjA6ougMfH
qBQLuQvMFGwaOggK+W4n6UlL6XFR1sc0ibNlFOALtXf5Skzrd4k6Z80sKEl0W7LpvU9WQc2MjSiv
k0TigROdVaHv9bDCNGRez+OWpqznJtnu9PiyCWTRHnPJwX1iOG1bB+VFkxfRBvFYiqLhLoOA9By9
4ko88rY9MRSWgvBBKYYnT7RMZdjkUnlaoNvDgrlfVKIAY/P+TUbXy9Hfj89HL4cfDyqgzu3P/e0/
h4cfmocTJnnCx150nPfl0y18/PIXfgFkDdijfz7t7z/pLio6PQ0pGqWsw4pLadmY6h66qQp8nxR2
R5Vj+PLLJ60xLV4dAWhzxHsASfhPKIpruz7u1FIVDMIuWMdRWXmbNlCQRMb/cS0s5CZTs0UkvK/D
B6atq30epdgRYLm0WnzpAyj7ZH8cpZjvi6749ftRYfnrzCNQxIG3So3/u2fBoKOnQX7dLAp6haKz
rU4Sy9SDXURpCP8UMFZQjybpsiLUJSx0KpFNWidzaMiwn6uDaBG7BedB1EToea5LzwC2O9CgdHkQ
TM5MitYG00maqKob86sTQyOFn8BJ8YIObwzRTBjYRuT8mnMKNAhmzKei2PpYV1HMPXcXgGWvIAFu
KM6BdtELKkdrDutd1e7tbKMXeCfMErPzLYq/s0doKF04umyg5mqaBN+UwmZBddcDE8qVbLgg6FDN
88CkZtvHOxkQmKPffWssn0AFaXYX/MVuiyaH/5yXsy1JJM54IdjihSc21ICuVrCMxmjw8R+bdE2h
2yPKFjh0H0Yv0fZxA5F54DN35dJ1hjA8rQpMiVpmcWaYzjoUr60uPCioUEPNA42BRVlmQQSbyEbC
yBRCs6nwXiTKjEcOCAr1LqZYDUDwzSNdQGlsGlIK3yAW5MGxIqtNq7gIVlReKas6J2LDdXLAX6cB
oRd9FN/3qIK8ZkgQC6OeM41BVJqlHQLTJucmtkflWRabqEI61K3fYIcZXC4BJ/DhKXpsMvzVjeQc
JhPM6GKtSdZlrBjD2CPzOhHluskWC7ofY4pcxpnmC4a/hr3q3uG8Kksi2Da1/TH+1lTCOHLFCEFg
vXF+ekkeGa5n8GMRauOcRXR5BrK+0BiNmh7KPKssmNIeQBBiOnrdXQvfcfOX0dn8q1guWU3CUQTM
u8lOAyTo0/Ph4fUfFTnzfv/yw713JiVjTe7VhpBGIN4UWjezwRqUsUCSS27YRPpFmnJuasBwiEHL
iPsbq3MvxVUdyerLrB/1Vm92Sugp5llWdY0LZSyMACbhdSpg1l2m5CmcvIK9TpfMM7QXZFEAubp4
b4feO5z9Kdnh1/6P18N9q9S9EOmtgj+7g78ooIJmK4qUPPk0xRIMFzAcS3yJlfhC+IiQ7tKAiiVY
SYxOhh69MG8sm6txAM2ZVNckKhNR6ZuqjaGWNlkaa0yvyoDdCphiUadB6/QNBk1zNjPW2yYBRRXf
SbDP4PRytlKs0cmh3QAHHfqjA0zTQYeCh9tuZYT7728/fuBtdfTw8vr8hklNjCuLRKDFCyq9Ge/L
bJ/ped7CaEPbNmODDER490l0Cb6CGCkHnQOYglaCZBtMw3oZapuT+6tZZWlWF8qTn4wWE03XqRwM
XQxwjbE4WnzImGBTfNpMFpPjY80UIsJ1yKsj9bxkHYWoS2AVi5R0sqgLh9bO94dm0Bxn9NmWsc2e
6Brd2VGtb0NfmLYV4uYD1iamDDVvBlQpiCfRxVn++G22Ta2jAzoGyKIyS3lLdCgY1vPCrRLEAKxB
7q6Jhq7tM+g2MSwZ9/MO41/7JJ5q3Ha1ZR+sUOkilASrDn4GmgQfFBEqYpM0+bLCncge9U3itgio
8S7PfRJgUxVcFBKtRrAl9IclTFusMmEosuKaPGn8E6H2HNyitLK1oaZBwYcQC/WCwh1MF9m65myz
As1xWN3A7lEVfcOk12FrbdieNwN32t0oV1Y8QnUnivRH2ePTy+cjzPb39qR2xtXNww9jk8sFhqqB
ZZ5lrEuNgcd3RbX8cmwiUVXI6moA4y6Dqq+sgFd1bb/MFpUXidsJKEAi0cmoho/QtE2b6MODNTQr
DGNQgTLJdG57BRIM5FiYGSGk6UROFc4qXOODq/z6QBrdvaEI0veVQZzTivJpywrbXvfoMDREDO7g
qjF5ECdnLWWuDn7UwRE6NQx75/+8PB0e0NEBenP/9rr/9x7+s3+9/fPPP/9XO1PCN2BU5BKZtn1W
oWuIwOjakzD9Yc4Gnde3qogUxpbf+giNPbSXUQF2S13JnXSWdwndws+c7Z0n324VpilhPZL/oF3T
tlTvZAwoNawzUbTGgmbvAPDUpvwyObXB5FhSttgzG6u21laRJpLLMRKyHhTdzKkoKoIaTFPQpWXd
lTZ1O6Qab+0lykyC4ZGSvxsavkcmQIuvs7m4vYMGDtY4vtCzzhaGqXDOl8pgYX80mDr/Bet25akx
g02SlRAufDBqBhjpueQmmZZShugqSQdkjIRVEtqzIf+jFJe7m9ebI9RYbvG8V9P/2/GNSkYdzO2j
ZHMpLO2eKVddPFQdtk/UINImFBUa/vTKtlNsjK3N00y7RUEBQ5FWkZVeTt3HBzWrUqndIKiZLSKo
ndPybgp1dhiOguADDDXLwf1fgFrl/QpFPdlGvUybToxSTa5AkLwq7Xeq1C5ye26WxHugRURZqA+z
OTr2uIJYUnZPQdoHt7IEKKXBdZVpO1BK+Y6gPk2mKt4PzD0SFfYhGWMLBPs6rYjeuCKAP7BKQc3f
Rmjv2eXnhZQJMFFxpVCg2qa6JeGU1wI0+TE8DKUS+LscgVFgXSa7eb41mEw/+Kj2L6+4R6BgDh7/
b/9882OvedfXqX4pQT/V6OuO6Qps8omCyR01icUR/5gWVbcW8QyB8np9VZa08ZR3Abw5Rs8OjfL8
7gvk7gWUuglKZpBtWo7IjdO2AsxPvISplGwmFxhW8Rkb2qE42izBwiqxrDALaijP49yr9tV5pPrJ
+55bB1n/DxdkmGbrYQIA
--===============7750057681963441778==--

