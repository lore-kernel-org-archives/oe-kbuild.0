Content-Type: multipart/mixed; boundary="===============1019777439473920080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 9/9] powerpc: Simplify and move arch_randomize_brk()
Date: Sat, 27 Nov 2021 15:18:42 +0800
Message-ID: <202111271503.Gh4zrHvS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1019777439473920080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.chris=
tophe.leroy@csgroup.eu>
References: <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.christ=
ophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
TO: Paul Mackerras <paulus@samba.org>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: alex(a)ghiti.fr
CC: linux-mm(a)kvack.org
CC: linuxppc-dev(a)lists.ozlabs.org
CC: linux-kernel(a)vger.kernel.org

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on hnaz-mm/master linus/master v5.16-rc2 next-2021=
1126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-p=
owerpc-to-default-topdown-mmap-layout/20211125-162916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-s032-20211126 (https://download.01.org/0day-ci=
/archive/20211127/202111271503.Gh4zrHvS-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/554c475dfb73dc352708dff35=
89b55845b3dd751
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Convert-powerpc-t=
o-default-topdown-mmap-layout/20211125-162916
        git checkout 554c475dfb73dc352708dff3589b55845b3dd751
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/clk/ drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/pci/controller/pci-xgene.c:52:9: sparse: sparse: preprocessor to=
ken SZ_1T redefined
   drivers/pci/controller/pci-xgene.c: note: in included file (through arch=
/powerpc/include/asm/book3s/64/pgtable.h, arch/powerpc/include/asm/book3s/6=
4/mmu-hash.h, ...):
>> include/linux/sizes.h:51:9: sparse: this was the original definition

vim +51 include/linux/sizes.h

554c475dfb73dc Christophe Leroy 2021-11-25  50  =

554c475dfb73dc Christophe Leroy 2021-11-25 @51  #define SZ_1T				_AC(0x1000=
0000000, ULL)
8ff80fbe7e9870 Baoquan He       2019-05-24  52  #define SZ_64T				_AC(0x400=
000000000, ULL)
f2b9ba871beb92 Ard Biesheuvel   2018-03-06  53  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1019777439473920080==--

