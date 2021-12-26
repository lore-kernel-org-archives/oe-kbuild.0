Content-Type: multipart/mixed; boundary="===============5277373375289679518=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/kvm/powerpc.c:2115:26: sparse: sparse: incorrect type in assignment (different base types)
Date: Sun, 26 Dec 2021 11:39:38 +0800
Message-ID: <202112261135.3ehyG5H6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5277373375289679518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "C=C3=A9dric Le Goater" <clg@kaod.org>
CC: Michael Ellerman <mpe@ellerman.id.au>

Hi C=C3=A9dric,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e2ae0d4a6b0ba461542f0fd0ba0b828658013e9f
commit: 9236f57a9e51c72ce426ccd2e53e123de7196a0f KVM: PPC: Make the VMX ins=
truction emulation routines static
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-s032-20211226 (https://download.01.org/0day-ci=
/archive/20211226/202112261135.3ehyG5H6-lkp(a)intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9236f57a9e51c72ce426ccd2e53e123de7196a0f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9236f57a9e51c72ce426ccd2e53e123de7196a0f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash arch/powerpc/kvm/ drivers/misc/ drivers/pinctrl/nu=
voton/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kvm/powerpc.c:2115:26: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   arch/powerpc/kvm/powerpc.c:2115:26: sparse:     expected unsigned int
   arch/powerpc/kvm/powerpc.c:2115:26: sparse:     got restricted __be32 [u=
sertype]
   arch/powerpc/kvm/powerpc.c:2116:26: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   arch/powerpc/kvm/powerpc.c:2116:26: sparse:     expected unsigned int
   arch/powerpc/kvm/powerpc.c:2116:26: sparse:     got restricted __be32 [u=
sertype]
   arch/powerpc/kvm/powerpc.c:2117:26: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   arch/powerpc/kvm/powerpc.c:2117:26: sparse:     expected unsigned int
   arch/powerpc/kvm/powerpc.c:2117:26: sparse:     got restricted __be32 [u=
sertype]
   arch/powerpc/kvm/powerpc.c:2118:26: sparse: sparse: incorrect type in as=
signment (different base types) @@     expected unsigned int @@     got res=
tricted __be32 [usertype] @@
   arch/powerpc/kvm/powerpc.c:2118:26: sparse:     expected unsigned int
   arch/powerpc/kvm/powerpc.c:2118:26: sparse:     got restricted __be32 [u=
sertype]
   arch/powerpc/kvm/powerpc.c: note: in included file:
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __be64
   arch/powerpc/include/asm/kvm_ppc.h:966:1: sparse: sparse: cast to restri=
cted __le64

vim +2115 arch/powerpc/kvm/powerpc.c

5b1c1493afe8d6 Carsten Otte   2012-01-04  2090  =

15711e9c927bfc Alexander Graf 2010-07-29  2091  static int kvm_vm_ioctl_get=
_pvinfo(struct kvm_ppc_pvinfo *pvinfo)
15711e9c927bfc Alexander Graf 2010-07-29  2092  {
784bafac79e764 Stuart Yoder   2012-07-03  2093  	u32 inst_nop =3D 0x6000000=
0;
784bafac79e764 Stuart Yoder   2012-07-03  2094  #ifdef CONFIG_KVM_BOOKE_HV
784bafac79e764 Stuart Yoder   2012-07-03  2095  	u32 inst_sc1 =3D 0x4400002=
2;
2743103f91e20d Alexander Graf 2014-04-24  2096  	pvinfo->hcall[0] =3D cpu_t=
o_be32(inst_sc1);
2743103f91e20d Alexander Graf 2014-04-24  2097  	pvinfo->hcall[1] =3D cpu_t=
o_be32(inst_nop);
2743103f91e20d Alexander Graf 2014-04-24  2098  	pvinfo->hcall[2] =3D cpu_t=
o_be32(inst_nop);
2743103f91e20d Alexander Graf 2014-04-24  2099  	pvinfo->hcall[3] =3D cpu_t=
o_be32(inst_nop);
784bafac79e764 Stuart Yoder   2012-07-03  2100  #else
15711e9c927bfc Alexander Graf 2010-07-29  2101  	u32 inst_lis =3D 0x3c00000=
0;
15711e9c927bfc Alexander Graf 2010-07-29  2102  	u32 inst_ori =3D 0x6000000=
0;
15711e9c927bfc Alexander Graf 2010-07-29  2103  	u32 inst_sc =3D 0x44000002;
15711e9c927bfc Alexander Graf 2010-07-29  2104  	u32 inst_imm_mask =3D 0xff=
ff;
15711e9c927bfc Alexander Graf 2010-07-29  2105  =

15711e9c927bfc Alexander Graf 2010-07-29  2106  	/*
15711e9c927bfc Alexander Graf 2010-07-29  2107  	 * The hypercall to get in=
to KVM from within guest context is as
15711e9c927bfc Alexander Graf 2010-07-29  2108  	 * follows:
15711e9c927bfc Alexander Graf 2010-07-29  2109  	 *
15711e9c927bfc Alexander Graf 2010-07-29  2110  	 *    lis r0, r0, KVM_SC_M=
AGIC_R0(a)h
15711e9c927bfc Alexander Graf 2010-07-29  2111  	 *    ori r0, KVM_SC_MAGIC=
_R0(a)l
15711e9c927bfc Alexander Graf 2010-07-29  2112  	 *    sc
15711e9c927bfc Alexander Graf 2010-07-29  2113  	 *    nop
15711e9c927bfc Alexander Graf 2010-07-29  2114  	 */
2743103f91e20d Alexander Graf 2014-04-24 @2115  	pvinfo->hcall[0] =3D cpu_t=
o_be32(inst_lis | ((KVM_SC_MAGIC_R0 >> 16) & inst_imm_mask));
2743103f91e20d Alexander Graf 2014-04-24  2116  	pvinfo->hcall[1] =3D cpu_t=
o_be32(inst_ori | (KVM_SC_MAGIC_R0 & inst_imm_mask));
2743103f91e20d Alexander Graf 2014-04-24  2117  	pvinfo->hcall[2] =3D cpu_t=
o_be32(inst_sc);
2743103f91e20d Alexander Graf 2014-04-24  2118  	pvinfo->hcall[3] =3D cpu_t=
o_be32(inst_nop);
784bafac79e764 Stuart Yoder   2012-07-03  2119  #endif
15711e9c927bfc Alexander Graf 2010-07-29  2120  =

9202e07636f0c4 Liu Yu-B13201  2012-07-03  2121  	pvinfo->flags =3D KVM_PPC_=
PVINFO_FLAGS_EV_IDLE;
9202e07636f0c4 Liu Yu-B13201  2012-07-03  2122  =

15711e9c927bfc Alexander Graf 2010-07-29  2123  	return 0;
15711e9c927bfc Alexander Graf 2010-07-29  2124  }
15711e9c927bfc Alexander Graf 2010-07-29  2125  =


:::::: The code at line 2115 was first introduced by commit
:::::: 2743103f91e20d4c4d4f1a8d00821289c4c6ff62 KVM: PPC: PR: Fill pvinfo h=
call instructions in big endian

:::::: TO: Alexander Graf <agraf@suse.de>
:::::: CC: Alexander Graf <agraf@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5277373375289679518==--

