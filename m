Content-Type: multipart/mixed; boundary="===============6837694283277130257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4] thunderbolt: thunderbolt: add vendor's NVM formats
Date: Sun, 21 Aug 2022 00:54:54 +0800
Message-ID: <202208210009.yPNSc9D5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6837694283277130257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
hunderbolt/nvm.c:107:17: sparse: sparse: typename in expression"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220816105502.9059-1-chensiying21@gmail.com>
References: <20220816105502.9059-1-chensiying21@gmail.com>
TO: Szuying Chen <chensiying21@gmail.com>
TO: gregkh(a)linuxfoundation.org
TO: mario.limonciello(a)amd.com
TO: mika.westerberg(a)linux.intel.com
TO: andreas.noever(a)gmail.com
TO: michael.jamet(a)intel.com
TO: YehezkelShB(a)gmail.com
TO: linux-usb(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Yd_Tseng(a)asmedia.com.tw
CC: Chloe_Chen(a)asmedia.com.tw
CC: Richard_Hsu(a)asmedia.com.tw

Hi Szuying,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/thunder=
bolt-thunderbolt-add-vendor-s-NVM-formats/20220816-193757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: alpha-randconfig-s051-20220820 (https://download.01.org/0day-ci/arc=
hive/20220821/202208210009.yPNSc9D5-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/16b15f1135451c01b61=
6a6a2bacf2f54a1082a08
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Szuying-Chen/thunderbolt-thunderbo=
lt-add-vendor-s-NVM-formats/20220816-193757
        git checkout 16b15f1135451c01b616a6a2bacf2f54a1082a08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/nvm.c:107:17: sparse: sparse: typename in expression
   drivers/thunderbolt/nvm.c:107:23: sparse: sparse: Expected ; at end of s=
tatement
   drivers/thunderbolt/nvm.c:107:23: sparse: sparse: got u8
   drivers/thunderbolt/nvm.c:107:17: sparse: sparse: undefined identifier '=
const'
   drivers/thunderbolt/nvm.c:109:22: sparse: sparse: undefined identifier '=
buf'
   drivers/thunderbolt/nvm.c:118:52: sparse: sparse: undefined identifier '=
buf'

vim +107 drivers/thunderbolt/nvm.c

16b15f1135451c Szuying Chen 2022-08-16   61  =

16b15f1135451c Szuying Chen 2022-08-16   62  static int asmedia_nvm_validat=
e(struct tb_switch *sw, unsigned int mode)
16b15f1135451c Szuying Chen 2022-08-16   63  {
16b15f1135451c Szuying Chen 2022-08-16   64  	struct tb_nvm *nvm;
16b15f1135451c Szuying Chen 2022-08-16   65  	u32 val;
16b15f1135451c Szuying Chen 2022-08-16   66  	u32 nvm_size;
16b15f1135451c Szuying Chen 2022-08-16   67  	int ret =3D 0;
16b15f1135451c Szuying Chen 2022-08-16   68  	unsigned int image_size;
16b15f1135451c Szuying Chen 2022-08-16   69  =

16b15f1135451c Szuying Chen 2022-08-16   70  	switch (mode) {
16b15f1135451c Szuying Chen 2022-08-16   71  	case NVM_UPGRADE:
16b15f1135451c Szuying Chen 2022-08-16   72  		if (sw->no_nvm_upgrade)
16b15f1135451c Szuying Chen 2022-08-16   73  			sw->no_nvm_upgrade =3D fals=
e;
16b15f1135451c Szuying Chen 2022-08-16   74  =

16b15f1135451c Szuying Chen 2022-08-16   75  		break;
16b15f1135451c Szuying Chen 2022-08-16   76  =

16b15f1135451c Szuying Chen 2022-08-16   77  	case NVM_ADD:
16b15f1135451c Szuying Chen 2022-08-16   78  		nvm =3D tb_nvm_alloc(&sw->de=
v);
16b15f1135451c Szuying Chen 2022-08-16   79  		if (IS_ERR(nvm)) {
16b15f1135451c Szuying Chen 2022-08-16   80  			ret =3D PTR_ERR(nvm);
16b15f1135451c Szuying Chen 2022-08-16   81  			break;
16b15f1135451c Szuying Chen 2022-08-16   82  		}
16b15f1135451c Szuying Chen 2022-08-16   83  =

16b15f1135451c Szuying Chen 2022-08-16   84  		ret =3D usb4_switch_nvm_read=
(sw, ASMEDIA_NVM_VERSION, &val, sizeof(val));
16b15f1135451c Szuying Chen 2022-08-16   85  		if (ret)
16b15f1135451c Szuying Chen 2022-08-16   86  			break;
16b15f1135451c Szuying Chen 2022-08-16   87  =

16b15f1135451c Szuying Chen 2022-08-16   88  		nvm->nvm_asm.major =3D (((u8=
)val) << 0x10 | ((u8)(val >> 0x8)) << 0x8 | (u8)(val >> 0x10));
16b15f1135451c Szuying Chen 2022-08-16   89  		ret =3D usb4_switch_nvm_read=
(sw, ASMEDIA_NVM_DATE, &val, sizeof(val));
16b15f1135451c Szuying Chen 2022-08-16   90  		if (ret)
16b15f1135451c Szuying Chen 2022-08-16   91  			break;
16b15f1135451c Szuying Chen 2022-08-16   92  =

16b15f1135451c Szuying Chen 2022-08-16   93  		nvm->nvm_asm.minor =3D (((u8=
)val) << 0x10 | ((u8)(val >> 0x8)) << 0x8 | (u8)(val >> 0x10));
16b15f1135451c Szuying Chen 2022-08-16   94  		nvm_size =3D SZ_512K;
16b15f1135451c Szuying Chen 2022-08-16   95  		ret =3D tb_nvm_add_active(nv=
m, nvm_size, tb_switch_nvm_read);
16b15f1135451c Szuying Chen 2022-08-16   96  		if (ret)
16b15f1135451c Szuying Chen 2022-08-16   97  			break;
16b15f1135451c Szuying Chen 2022-08-16   98  =

16b15f1135451c Szuying Chen 2022-08-16   99  		ret =3D tb_nvm_add_non_activ=
e(nvm, NVM_MAX_SIZE, tb_switch_nvm_write);
16b15f1135451c Szuying Chen 2022-08-16  100  		if (ret)
16b15f1135451c Szuying Chen 2022-08-16  101  			break;
16b15f1135451c Szuying Chen 2022-08-16  102  =

16b15f1135451c Szuying Chen 2022-08-16  103  		sw->nvm =3D nvm;
16b15f1135451c Szuying Chen 2022-08-16  104  		break;
16b15f1135451c Szuying Chen 2022-08-16  105  =

16b15f1135451c Szuying Chen 2022-08-16  106  	case NVM_WRITE:
16b15f1135451c Szuying Chen 2022-08-16 @107  		const u8 *buf =3D sw->nvm->b=
uf;
16b15f1135451c Szuying Chen 2022-08-16  108  =

16b15f1135451c Szuying Chen 2022-08-16  109  		if (!buf) {
16b15f1135451c Szuying Chen 2022-08-16  110  			ret =3D -EINVAL;
16b15f1135451c Szuying Chen 2022-08-16  111  			break;
16b15f1135451c Szuying Chen 2022-08-16  112  		}
16b15f1135451c Szuying Chen 2022-08-16  113  		image_size =3D sw->nvm->buf_=
data_size;
16b15f1135451c Szuying Chen 2022-08-16  114  		if (image_size < NVM_MIN_SIZ=
E || image_size > NVM_MAX_SIZE) {
16b15f1135451c Szuying Chen 2022-08-16  115  			ret =3D -EINVAL;
16b15f1135451c Szuying Chen 2022-08-16  116  			break;
16b15f1135451c Szuying Chen 2022-08-16  117  		}
16b15f1135451c Szuying Chen 2022-08-16  118  		ret =3D usb4_switch_nvm_writ=
e(sw, 0, buf, image_size);
16b15f1135451c Szuying Chen 2022-08-16  119  		if (!ret)
16b15f1135451c Szuying Chen 2022-08-16  120  			sw->nvm->flushed =3D true;
16b15f1135451c Szuying Chen 2022-08-16  121  =

16b15f1135451c Szuying Chen 2022-08-16  122  		break;
16b15f1135451c Szuying Chen 2022-08-16  123  =

16b15f1135451c Szuying Chen 2022-08-16  124  	default:
16b15f1135451c Szuying Chen 2022-08-16  125  		break;
16b15f1135451c Szuying Chen 2022-08-16  126  	}
16b15f1135451c Szuying Chen 2022-08-16  127  =

16b15f1135451c Szuying Chen 2022-08-16  128  	if ((mode =3D=3D NVM_ADD) && =
(ret !=3D 0))
16b15f1135451c Szuying Chen 2022-08-16  129  		tb_nvm_free(sw->nvm);
16b15f1135451c Szuying Chen 2022-08-16  130  =

16b15f1135451c Szuying Chen 2022-08-16  131  	return ret;
16b15f1135451c Szuying Chen 2022-08-16  132  }
16b15f1135451c Szuying Chen 2022-08-16  133  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6837694283277130257==--

