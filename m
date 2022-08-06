Content-Type: multipart/mixed; boundary="===============5434321268514614572=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] thunderbolt: thunderbolt: add vendor's NVM formats
Date: Sat, 06 Aug 2022 08:06:00 +0800
Message-ID: <202208060712.imnSSzbl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5434321268514614572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/t=
hunderbolt/nvm.c:75:17: sparse: sparse: typename in expression"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220805092224.2536-1-Chloe_Chen@asmedia.com.tw>
References: <20220805092224.2536-1-Chloe_Chen@asmedia.com.tw>
TO: Szuying Chen <chensiying21@gmail.com>
TO: andreas.noever(a)gmail.com
TO: michael.jamet(a)intel.com
TO: mika.westerberg(a)linux.intel.com
TO: YehezkelShB(a)gmail.com
TO: linux-usb(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Yd_Tseng(a)asmedia.com.tw
CC: Richard_Hsu(a)asmedia.com.tw
CC: Chloe_Chen(a)asmedia.com.tw

Hi Szuying,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19 next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Szuying-Chen/thunder=
bolt-thunderbolt-add-vendor-s-NVM-formats/20220805-172732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b2a88c212e652e94f1e4b635910972ac57ba4e97
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
806/202208060712.imnSSzbl-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/cc64350d27db3b30e5c=
eef2b5d6a3c48b9a4d989
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Szuying-Chen/thunderbolt-thunderbo=
lt-add-vendor-s-NVM-formats/20220805-172732
        git checkout cc64350d27db3b30e5ceef2b5d6a3c48b9a4d989
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/thunderbolt/nvm.c:75:17: sparse: sparse: typename in expression
   drivers/thunderbolt/nvm.c:75:24: sparse: sparse: Expected ; at end of st=
atement
   drivers/thunderbolt/nvm.c:75:24: sparse: sparse: got tb_nvm
   drivers/thunderbolt/nvm.c:109:17: sparse: sparse: typename in expression
   drivers/thunderbolt/nvm.c:109:26: sparse: sparse: Expected ; at end of s=
tatement
   drivers/thunderbolt/nvm.c:109:26: sparse: sparse: got int
   drivers/thunderbolt/nvm.c:75:17: sparse: sparse: undefined identifier 's=
truct'
   drivers/thunderbolt/nvm.c:79:17: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:80:28: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:81:39: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:89:17: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:94:17: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:95:17: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:97:41: sparse: sparse: undefined identifier 'n=
vm'
   drivers/thunderbolt/nvm.c:101:45: sparse: sparse: undefined identifier '=
nvm'
   drivers/thunderbolt/nvm.c:105:27: sparse: sparse: undefined identifier '=
nvm'
   drivers/thunderbolt/nvm.c:109:17: sparse: sparse: undefined identifier '=
unsigned'
   drivers/thunderbolt/nvm.c:116:17: sparse: sparse: undefined identifier '=
image_size'
   drivers/thunderbolt/nvm.c:117:21: sparse: sparse: undefined identifier '=
image_size'
   drivers/thunderbolt/nvm.c:121:57: sparse: sparse: undefined identifier '=
image_size'

vim +75 drivers/thunderbolt/nvm.c

cc64350d27db3b Szuying Chen 2022-08-05   62  =

cc64350d27db3b Szuying Chen 2022-08-05   63  static int tb_nvm_vendor_apply=
(struct tb_switch *sw, unsigned int handle)
cc64350d27db3b Szuying Chen 2022-08-05   64  {
cc64350d27db3b Szuying Chen 2022-08-05   65  	int ret =3D 0;
cc64350d27db3b Szuying Chen 2022-08-05   66  =

cc64350d27db3b Szuying Chen 2022-08-05   67  	switch (handle) {
cc64350d27db3b Szuying Chen 2022-08-05   68  	case 0:
cc64350d27db3b Szuying Chen 2022-08-05   69  		if (sw->no_nvm_upgrade)
cc64350d27db3b Szuying Chen 2022-08-05   70  			sw->no_nvm_upgrade =3D fals=
e;
cc64350d27db3b Szuying Chen 2022-08-05   71  =

cc64350d27db3b Szuying Chen 2022-08-05   72  		break;
cc64350d27db3b Szuying Chen 2022-08-05   73  =

cc64350d27db3b Szuying Chen 2022-08-05   74  	case 1:
cc64350d27db3b Szuying Chen 2022-08-05  @75  		struct tb_nvm *nvm;
cc64350d27db3b Szuying Chen 2022-08-05   76  		u32 val;
cc64350d27db3b Szuying Chen 2022-08-05   77  		u32 nvm_size;
cc64350d27db3b Szuying Chen 2022-08-05   78  =

cc64350d27db3b Szuying Chen 2022-08-05   79  		nvm =3D tb_nvm_alloc(&sw->de=
v);
cc64350d27db3b Szuying Chen 2022-08-05   80  		if (IS_ERR(nvm)) {
cc64350d27db3b Szuying Chen 2022-08-05   81  			ret =3D PTR_ERR(nvm);
cc64350d27db3b Szuying Chen 2022-08-05   82  			break;
cc64350d27db3b Szuying Chen 2022-08-05   83  		}
cc64350d27db3b Szuying Chen 2022-08-05   84  =

cc64350d27db3b Szuying Chen 2022-08-05   85  		ret =3D usb4_switch_nvm_read=
(sw, NVM_Date, &val, sizeof(val));
cc64350d27db3b Szuying Chen 2022-08-05   86  		if (ret)
cc64350d27db3b Szuying Chen 2022-08-05   87  			break;
cc64350d27db3b Szuying Chen 2022-08-05   88  =

cc64350d27db3b Szuying Chen 2022-08-05   89  		nvm->vendor.date =3D (((u8)v=
al) << 0x10 | ((u8)(val >> 0x8)) << 0x8 | (u8)(val >> 0x10));
cc64350d27db3b Szuying Chen 2022-08-05   90  		ret =3D usb4_switch_nvm_read=
(sw, NVM_CUSTOMER_ID, &val, sizeof(val));
cc64350d27db3b Szuying Chen 2022-08-05   91  		if (ret)
cc64350d27db3b Szuying Chen 2022-08-05   92  			break;
cc64350d27db3b Szuying Chen 2022-08-05   93  =

cc64350d27db3b Szuying Chen 2022-08-05   94  		nvm->vendor.customerID =3D (=
((u8)val) << 0x8 | ((u8)(val >> 0x8)));
cc64350d27db3b Szuying Chen 2022-08-05   95  		nvm->vendor.version =3D (u8)=
(val >> 0x10);
cc64350d27db3b Szuying Chen 2022-08-05   96  		nvm_size =3D SZ_512K;
cc64350d27db3b Szuying Chen 2022-08-05   97  		ret =3D tb_nvm_add_active(nv=
m, nvm_size, tb_switch_nvm_read);
cc64350d27db3b Szuying Chen 2022-08-05   98  		if (ret)
cc64350d27db3b Szuying Chen 2022-08-05   99  			break;
cc64350d27db3b Szuying Chen 2022-08-05  100  =

cc64350d27db3b Szuying Chen 2022-08-05  101  		ret =3D tb_nvm_add_non_activ=
e(nvm, NVM_MAX_SIZE, tb_switch_nvm_write);
cc64350d27db3b Szuying Chen 2022-08-05  102  		if (ret)
cc64350d27db3b Szuying Chen 2022-08-05  103  			break;
cc64350d27db3b Szuying Chen 2022-08-05  104  =

cc64350d27db3b Szuying Chen 2022-08-05  105  		sw->nvm =3D nvm;
cc64350d27db3b Szuying Chen 2022-08-05  106  		break;
cc64350d27db3b Szuying Chen 2022-08-05  107  =

cc64350d27db3b Szuying Chen 2022-08-05  108  	case 2:
cc64350d27db3b Szuying Chen 2022-08-05  109  		unsigned int image_size;
cc64350d27db3b Szuying Chen 2022-08-05  110  		const u8 *buf =3D sw->nvm->b=
uf;
cc64350d27db3b Szuying Chen 2022-08-05  111  =

cc64350d27db3b Szuying Chen 2022-08-05  112  		if (!buf) {
cc64350d27db3b Szuying Chen 2022-08-05  113  			ret =3D -EINVAL;
cc64350d27db3b Szuying Chen 2022-08-05  114  			break;
cc64350d27db3b Szuying Chen 2022-08-05  115  		}
cc64350d27db3b Szuying Chen 2022-08-05  116  		image_size =3D sw->nvm->buf_=
data_size;
cc64350d27db3b Szuying Chen 2022-08-05  117  		if (image_size < NVM_MIN_SIZ=
E || image_size > NVM_MAX_SIZE) {
cc64350d27db3b Szuying Chen 2022-08-05  118  			ret =3D -EINVAL;
cc64350d27db3b Szuying Chen 2022-08-05  119  			break;
cc64350d27db3b Szuying Chen 2022-08-05  120  		}
cc64350d27db3b Szuying Chen 2022-08-05  121  		ret =3D usb4_switch_nvm_writ=
e(sw, 0, buf, image_size);
cc64350d27db3b Szuying Chen 2022-08-05  122  		if (!ret)
cc64350d27db3b Szuying Chen 2022-08-05  123  			sw->nvm->flushed =3D true;
cc64350d27db3b Szuying Chen 2022-08-05  124  =

cc64350d27db3b Szuying Chen 2022-08-05  125  		break;
cc64350d27db3b Szuying Chen 2022-08-05  126  =

cc64350d27db3b Szuying Chen 2022-08-05  127  	default:
cc64350d27db3b Szuying Chen 2022-08-05  128  		break;
cc64350d27db3b Szuying Chen 2022-08-05  129  	}
cc64350d27db3b Szuying Chen 2022-08-05  130  =

cc64350d27db3b Szuying Chen 2022-08-05  131  	if ((handle =3D=3D 1) && (ret=
 !=3D 0))
cc64350d27db3b Szuying Chen 2022-08-05  132  		tb_nvm_free(sw->nvm);
cc64350d27db3b Szuying Chen 2022-08-05  133  =

cc64350d27db3b Szuying Chen 2022-08-05  134  	return ret;
cc64350d27db3b Szuying Chen 2022-08-05  135  }
cc64350d27db3b Szuying Chen 2022-08-05  136  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5434321268514614572==--

