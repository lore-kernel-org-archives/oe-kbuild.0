Content-Type: multipart/mixed; boundary="===============4686823057663885252=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12185/12461] arch/parisc/kernel/toc.c:64:32: sparse: void extern [addressable] [noreturn] [toplevel] toc_intr( ... )
Date: Tue, 18 Jan 2022 22:16:51 +0800
Message-ID: <202201182205.RYtP0ybc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4686823057663885252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6f59bc242877fcb9c9a5136ea62d383fce5615df
commit: 3d3a5814228feedd46fbddbeab381ae9bc2996ba [12185/12461] parisc: Fix =
missing prototype for 'toc_intr' warning in toc.c
:::::: branch date: 11 hours ago
:::::: commit date: 29 hours ago
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/202201=
18/202201182205.RYtP0ybc-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D3d3a5814228feedd46fbddbeab381ae9bc2996ba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3d3a5814228feedd46fbddbeab381ae9bc2996ba
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash arch/parisc/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/parisc/kernel/toc.c:16:1: sparse: sparse: symbol '__pcpu_scope_toc_=
stack' was not declared. Should it be static?
   arch/parisc/kernel/toc.c:64:32: sparse: sparse: symbol 'toc_intr' redecl=
ared with different type (different modifiers):
>> arch/parisc/kernel/toc.c:64:32: sparse:    void extern [addressable] [no=
return] [toplevel] toc_intr( ... )
   arch/parisc/kernel/toc.c: note: in included file (through arch/parisc/in=
clude/asm/spinlock.h, arch/parisc/include/asm/atomic.h, include/linux/atomi=
c.h, ...):
   arch/parisc/include/asm/processor.h:292:13: sparse: note: previously dec=
lared as:
>> arch/parisc/include/asm/processor.h:292:13: sparse:    void extern [addr=
essable] [toplevel] toc_intr( ... )

vim +64 arch/parisc/kernel/toc.c

bc294838cc3443 Sven Schnelle 2021-10-14  63  =

bc294838cc3443 Sven Schnelle 2021-10-14 @64  void notrace __noreturn __cold=
 toc_intr(struct pt_regs *regs)
bc294838cc3443 Sven Schnelle 2021-10-14  65  {
bc294838cc3443 Sven Schnelle 2021-10-14  66  	struct pdc_toc_pim_20 pim_dat=
a20;
bc294838cc3443 Sven Schnelle 2021-10-14  67  	struct pdc_toc_pim_11 pim_dat=
a11;
bc294838cc3443 Sven Schnelle 2021-10-14  68  =

d6ab9fc74513ae Helge Deller  2022-01-07  69  	/* verify we wrote regs to th=
e correct stack */
d6ab9fc74513ae Helge Deller  2022-01-07  70  	BUG_ON(regs !=3D (struct pt_r=
egs *)&per_cpu(toc_stack, raw_smp_processor_id()));
bc294838cc3443 Sven Schnelle 2021-10-14  71  =

bc294838cc3443 Sven Schnelle 2021-10-14  72  	if (boot_cpu_data.cpu_type >=
=3D pcxu) {
bc294838cc3443 Sven Schnelle 2021-10-14  73  		if (pdc_pim_toc20(&pim_data2=
0))
bc294838cc3443 Sven Schnelle 2021-10-14  74  			panic("Failed to get PIM da=
ta");
bc294838cc3443 Sven Schnelle 2021-10-14  75  		toc20_to_pt_regs(regs, &pim_=
data20);
bc294838cc3443 Sven Schnelle 2021-10-14  76  	} else {
bc294838cc3443 Sven Schnelle 2021-10-14  77  		if (pdc_pim_toc11(&pim_data1=
1))
bc294838cc3443 Sven Schnelle 2021-10-14  78  			panic("Failed to get PIM da=
ta");
bc294838cc3443 Sven Schnelle 2021-10-14  79  		toc11_to_pt_regs(regs, &pim_=
data11);
bc294838cc3443 Sven Schnelle 2021-10-14  80  	}
bc294838cc3443 Sven Schnelle 2021-10-14  81  =


:::::: The code at line 64 was first introduced by commit
:::::: bc294838cc3443a2fbec58f8936ad4bd0a0b3055 parisc: add support for TOC=
 (transfer of control)

:::::: TO: Sven Schnelle <svens@stackframe.org>
:::::: CC: Helge Deller <deller@gmx.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4686823057663885252==--

