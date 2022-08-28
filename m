Content-Type: multipart/mixed; boundary="===============1046568040732411369=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/8] LoongArch: Support R_LARCH_ABS* in modules
Date: Sun, 28 Aug 2022 10:11:02 +0800
Message-ID: <202208281009.Pem2tkYy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1046568040732411369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/loon=
garch/kernel/module.c:333:9: sparse: sparse: statement expected after case =
label"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220827175436.156464-6-xry111@xry111.site>
References: <20220827175436.156464-6-xry111@xry111.site>
TO: Xi Ruoyao <xry111@xry111.site>
TO: loongarch(a)lists.linux.dev
CC: linux-kernel(a)vger.kernel.org
CC: WANG Xuerui <kernel@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: Youling Tang <tangyouling@loongson.cn>
CC: Jinyang He <hejinyang@loongson.cn>
CC: Xi Ruoyao <xry111@xry111.site>

Hi Xi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc2 next-20220826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Ruoyao/LoongArch-=
Support-toolchain-with-new-relocation-types/20220828-015829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
89b749d8552d78c4dd86dea86e2e6ba8aafab9fe
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: loongarch-randconfig-s033-20220828 (https://download.01.org/0day-ci=
/archive/20220828/202208281009.Pem2tkYy-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/836638b14db86042263=
5b57cce655aa93959f851
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xi-Ruoyao/LoongArch-Support-toolch=
ain-with-new-relocation-types/20220828-015829
        git checkout 836638b14db860422635b57cce655aa93959f851
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/module.c:333:9: sparse: sparse: statement expected=
 after case label

vim +333 arch/loongarch/kernel/module.c

2549c77adeaf1b Xi Ruoyao   2022-08-28  315  =

836638b14db860 Xi Ruoyao   2022-08-28  316  static int apply_r_larch_abs(st=
ruct module *mod, u32 *location, Elf_Addr v,
836638b14db860 Xi Ruoyao   2022-08-28  317  			s64 *rela_stack, size_t *rel=
a_stack_top, unsigned int type)
836638b14db860 Xi Ruoyao   2022-08-28  318  {
836638b14db860 Xi Ruoyao   2022-08-28  319  	union loongarch_instruction *i=
nsn =3D (union loongarch_instruction *)location;
836638b14db860 Xi Ruoyao   2022-08-28  320  =

836638b14db860 Xi Ruoyao   2022-08-28  321  	switch (type) {
836638b14db860 Xi Ruoyao   2022-08-28  322  	case R_LARCH_ABS_HI20:
836638b14db860 Xi Ruoyao   2022-08-28  323  		v >>=3D 12;
836638b14db860 Xi Ruoyao   2022-08-28  324  		break;
836638b14db860 Xi Ruoyao   2022-08-28  325  	case R_LARCH_ABS64_LO20:
836638b14db860 Xi Ruoyao   2022-08-28  326  		v >>=3D 32;
836638b14db860 Xi Ruoyao   2022-08-28  327  		break;
836638b14db860 Xi Ruoyao   2022-08-28  328  	case R_LARCH_ABS64_HI12:
836638b14db860 Xi Ruoyao   2022-08-28  329  		v >>=3D 52;
836638b14db860 Xi Ruoyao   2022-08-28  330  		break;
836638b14db860 Xi Ruoyao   2022-08-28  331  	default:
836638b14db860 Xi Ruoyao   2022-08-28  332  		/* Do nothing. */
836638b14db860 Xi Ruoyao   2022-08-28 @333  	}
836638b14db860 Xi Ruoyao   2022-08-28  334  =

836638b14db860 Xi Ruoyao   2022-08-28  335  	switch (type) {
836638b14db860 Xi Ruoyao   2022-08-28  336  	case R_LARCH_ABS_HI20:
836638b14db860 Xi Ruoyao   2022-08-28  337  	case R_LARCH_ABS64_LO20:
836638b14db860 Xi Ruoyao   2022-08-28  338  		insn->reg1i20_format.immediat=
e =3D v & 0xfffff;
836638b14db860 Xi Ruoyao   2022-08-28  339  		break;
836638b14db860 Xi Ruoyao   2022-08-28  340  	case R_LARCH_ABS_LO12:
836638b14db860 Xi Ruoyao   2022-08-28  341  	case R_LARCH_ABS64_HI12:
836638b14db860 Xi Ruoyao   2022-08-28  342  		insn->reg2i12_format.immediat=
e =3D v & 0xfff;
836638b14db860 Xi Ruoyao   2022-08-28  343  		break;
836638b14db860 Xi Ruoyao   2022-08-28  344  	default:
836638b14db860 Xi Ruoyao   2022-08-28  345  		pr_err("%s: Unsupport relocat=
ion type %u\n", mod->name, type);
836638b14db860 Xi Ruoyao   2022-08-28  346  		return -EINVAL;
836638b14db860 Xi Ruoyao   2022-08-28  347  	}
836638b14db860 Xi Ruoyao   2022-08-28  348  =

836638b14db860 Xi Ruoyao   2022-08-28  349  	return 0;
836638b14db860 Xi Ruoyao   2022-08-28  350  }
fcdfe9d22bed08 Huacai Chen 2022-05-31  351  /*
fcdfe9d22bed08 Huacai Chen 2022-05-31  352   * reloc_handlers_rela() - Appl=
y a particular relocation to a module
fcdfe9d22bed08 Huacai Chen 2022-05-31  353   * @mod: the module to apply th=
e reloc to
fcdfe9d22bed08 Huacai Chen 2022-05-31  354   * @location: the address at wh=
ich the reloc is to be applied
fcdfe9d22bed08 Huacai Chen 2022-05-31  355   * @v: the value of the reloc, =
with addend for RELA-style
fcdfe9d22bed08 Huacai Chen 2022-05-31  356   * @rela_stack: the stack used =
for store relocation info, LOCAL to THIS module
fcdfe9d22bed08 Huacai Chen 2022-05-31  357   * @rela_stac_top: where the st=
ack operation(pop/push) applies to
fcdfe9d22bed08 Huacai Chen 2022-05-31  358   *
fcdfe9d22bed08 Huacai Chen 2022-05-31  359   * Return: 0 upon success, else=
 -ERRNO
fcdfe9d22bed08 Huacai Chen 2022-05-31  360   */
fcdfe9d22bed08 Huacai Chen 2022-05-31  361  typedef int (*reloc_rela_handle=
r)(struct module *mod, u32 *location, Elf_Addr v,
fcdfe9d22bed08 Huacai Chen 2022-05-31  362  			s64 *rela_stack, size_t *rel=
a_stack_top, unsigned int type);
fcdfe9d22bed08 Huacai Chen 2022-05-31  363  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1046568040732411369==--

