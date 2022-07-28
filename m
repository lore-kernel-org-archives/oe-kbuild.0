Content-Type: multipart/mixed; boundary="===============1738678581658632241=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] LoongArch: Support modules with new relocation types
Date: Thu, 28 Jul 2022 14:21:14 +0800
Message-ID: <202207281410.U2YZjgJz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1738678581658632241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/loon=
garch/kernel/module-sections.c:92:17: sparse: sparse: statement expected af=
ter case label"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <4007f3ef167f93ffd9fcae841e144a0fc89f0117.camel@xry111.site>
References: <4007f3ef167f93ffd9fcae841e144a0fc89f0117.camel@xry111.site>
TO: Xi Ruoyao <xry111@xry111.site>
TO: loongarch(a)lists.linux.dev
CC: linux-kernel(a)vger.kernel.org
CC: WANG Xuerui <kernel@xen0n.name>
CC: Huacai Chen <chenhuacai@kernel.org>

Hi Xi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linus/master v5.19-rc8 next-20220727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Ruoyao/LoongArch-=
Support-new-relocation-types/20220728-004805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/execve
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-s051-20220727 (https://download.01.org/0day-ci=
/archive/20220728/202207281410.U2YZjgJz-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/befc276145cba2e7aaf=
88a302986cb3882f75aec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xi-Ruoyao/LoongArch-Support-new-re=
location-types/20220728-004805
        git checkout befc276145cba2e7aaf88a302986cb3882f75aec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/module-sections.c:92:17: sparse: sparse: statement=
 expected after case label

vim +92 arch/loongarch/kernel/module-sections.c

fcdfe9d22bed084 Huacai Chen 2022-05-31  71  =

8e6c412c34a1a98 Xi Ruoyao   2022-07-28  72  static void count_max_entries(E=
lf_Rela *relas, int num,
8e6c412c34a1a98 Xi Ruoyao   2022-07-28  73  			      unsigned int *plts, un=
signed int *gots)
fcdfe9d22bed084 Huacai Chen 2022-05-31  74  {
fcdfe9d22bed084 Huacai Chen 2022-05-31  75  	unsigned int i, type;
fcdfe9d22bed084 Huacai Chen 2022-05-31  76  =

fcdfe9d22bed084 Huacai Chen 2022-05-31  77  	for (i =3D 0; i < num; i++) {
fcdfe9d22bed084 Huacai Chen 2022-05-31  78  		type =3D ELF_R_TYPE(relas[i].=
r_info);
befc276145cba2e Xi Ruoyao   2022-07-28  79  		switch (type) {
befc276145cba2e Xi Ruoyao   2022-07-28  80  		case R_LARCH_SOP_PUSH_PLT_PCR=
EL:
befc276145cba2e Xi Ruoyao   2022-07-28  81  		case R_LARCH_B26:
fcdfe9d22bed084 Huacai Chen 2022-05-31  82  			if (!duplicate_rela(relas, i=
))
fcdfe9d22bed084 Huacai Chen 2022-05-31  83  				(*plts)++;
befc276145cba2e Xi Ruoyao   2022-07-28  84  			break;
befc276145cba2e Xi Ruoyao   2022-07-28  85  		case R_LARCH_SOP_PUSH_GPREL:
befc276145cba2e Xi Ruoyao   2022-07-28  86  		case R_LARCH_GOT_PC_HI20:
8e6c412c34a1a98 Xi Ruoyao   2022-07-28  87  			if (!duplicate_rela(relas, i=
))
8e6c412c34a1a98 Xi Ruoyao   2022-07-28  88  				(*gots)++;
befc276145cba2e Xi Ruoyao   2022-07-28  89  			break;
befc276145cba2e Xi Ruoyao   2022-07-28  90  		default:
befc276145cba2e Xi Ruoyao   2022-07-28  91  			/* Do nothing. */
befc276145cba2e Xi Ruoyao   2022-07-28 @92  		}
fcdfe9d22bed084 Huacai Chen 2022-05-31  93  	}
fcdfe9d22bed084 Huacai Chen 2022-05-31  94  }
fcdfe9d22bed084 Huacai Chen 2022-05-31  95  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1738678581658632241==--

