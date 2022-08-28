Content-Type: multipart/mixed; boundary="===============8156451666437071059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/8] LoongArch: Support R_LARCH_B26 in modules
Date: Sun, 28 Aug 2022 09:10:09 +0800
Message-ID: <202208280817.GPc0j3im-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8156451666437071059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/loon=
garch/kernel/module-sections.c:67:17: sparse: sparse: statement expected af=
ter case label"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220827175436.156464-5-xry111@xry111.site>
References: <20220827175436.156464-5-xry111@xry111.site>
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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: loongarch-randconfig-s033-20220828 (https://download.01.org/0day-ci=
/archive/20220828/202208280817.GPc0j3im-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2549c77adeaf1b87a35=
8d7a0d36c9beccec0eca1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xi-Ruoyao/LoongArch-Support-toolch=
ain-with-new-relocation-types/20220828-015829
        git checkout 2549c77adeaf1b87a358d7a0d36c9beccec0eca1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/module-sections.c:67:17: sparse: sparse: statement=
 expected after case label

vim +67 arch/loongarch/kernel/module-sections.c

fcdfe9d22bed08 Huacai Chen 2022-05-31  52  =

fcdfe9d22bed08 Huacai Chen 2022-05-31  53  static void count_max_entries(El=
f_Rela *relas, int num, unsigned int *plts)
fcdfe9d22bed08 Huacai Chen 2022-05-31  54  {
fcdfe9d22bed08 Huacai Chen 2022-05-31  55  	unsigned int i, type;
fcdfe9d22bed08 Huacai Chen 2022-05-31  56  =

fcdfe9d22bed08 Huacai Chen 2022-05-31  57  	for (i =3D 0; i < num; i++) {
fcdfe9d22bed08 Huacai Chen 2022-05-31  58  		type =3D ELF_R_TYPE(relas[i].r=
_info);
2549c77adeaf1b Xi Ruoyao   2022-08-28  59  		switch (type) {
2549c77adeaf1b Xi Ruoyao   2022-08-28  60  		case R_LARCH_SOP_PUSH_PLT_PCRE=
L:
2549c77adeaf1b Xi Ruoyao   2022-08-28  61  		case R_LARCH_B26:
fcdfe9d22bed08 Huacai Chen 2022-05-31  62  			if (!duplicate_rela(relas, i))
fcdfe9d22bed08 Huacai Chen 2022-05-31  63  				(*plts)++;
2549c77adeaf1b Xi Ruoyao   2022-08-28  64  			break;
2549c77adeaf1b Xi Ruoyao   2022-08-28  65  		default:
2549c77adeaf1b Xi Ruoyao   2022-08-28  66  			/* Do nothing. */
fcdfe9d22bed08 Huacai Chen 2022-05-31 @67  		}
fcdfe9d22bed08 Huacai Chen 2022-05-31  68  	}
fcdfe9d22bed08 Huacai Chen 2022-05-31  69  }
fcdfe9d22bed08 Huacai Chen 2022-05-31  70  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8156451666437071059==--

