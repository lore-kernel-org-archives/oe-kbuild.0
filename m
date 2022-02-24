Content-Type: multipart/mixed; boundary="===============0738087917275076508=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 4/5] drivers/pci/controller/dwc/pcie-keembay.c:255:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Thu, 24 Feb 2022 15:08:55 +0800
Message-ID: <202202241513.L4FXTbKd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0738087917275076508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Srikanth Thokala <srikanth.thokala@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   bd7cd165b2c6295f4614f5522d31f9b779e2333b
commit: 28f72667fffb64d777e6f3f3017995d7d4f9e558 [4/5] PCI: thunderbay: Add=
 support for Thunderbay Root Port
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220224/202202241513.L4FXTbKd-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/28f72667fffb64d77=
7e6f3f3017995d7d4f9e558
        git remote add intel-lts https://github.com/intel/linux-intel-lts.g=
it
        git fetch --no-tags intel-lts 5.15/linux
        git checkout 28f72667fffb64d777e6f3f3017995d7d4f9e558
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                        ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   crypto/drbg.c:1854:18: note: '__UNIQUE_ID___x307' is < '__UNIQUE_ID___y3=
08'
                   u32 cryptlen =3D min3(inlen, outlen, (u32)DRBG_OUTSCRATC=
HLEN);
                                  ^
   include/linux/minmax.h:60:23: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   crypto/drbg.c:1854:18: note: '?' condition is true
                   u32 cryptlen =3D min3(inlen, outlen, (u32)DRBG_OUTSCRATC=
HLEN);
                                  ^
   include/linux/minmax.h:60:23: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   crypto/drbg.c:1859:9: note: Calling 'crypto_wait_req'
                   ret =3D crypto_wait_req(crypto_skcipher_encrypt(drbg->ct=
r_req),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/crypto.h:593:2: note: 'Default' branch taken. Execution co=
ntinues on line 602
           switch (err) {
           ^
   include/linux/crypto.h:602:2: note: Returning value (loaded from 'err'),=
 which participates in a condition later
           return err;
           ^~~~~~~~~~
   crypto/drbg.c:1859:9: note: Returning from 'crypto_wait_req'
                   ret =3D crypto_wait_req(crypto_skcipher_encrypt(drbg->ct=
r_req),
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   crypto/drbg.c:1861:7: note: Assuming 'ret' is 0
                   if (ret)
                       ^~~
   crypto/drbg.c:1861:3: note: Taking false branch
                   if (ret)
                   ^
   crypto/drbg.c:1866:3: note: Null pointer passed as 1st argument to memor=
y copy function
                   memcpy(outbuf, drbg->outscratchpad, cryptlen);
                   ^      ~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/pci/controller/dwc/pci-keystone.c:1114:2: warning: Value stored =
to 'ep_ops' is never read [clang-analyzer-deadcode.DeadStores]
           ep_ops =3D data->ep_ops;
           ^        ~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-keystone.c:1114:2: note: Value stored to =
'ep_ops' is never read
           ep_ops =3D data->ep_ops;
           ^        ~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/pci/controller/dwc/pcie-keembay.c:255:2: warning: Undefined or g=
arbage value returned to caller [clang-analyzer-core.uninitialized.UndefRet=
urn]
           return ret;
           ^      ~~~
   drivers/pci/controller/dwc/pcie-keembay.c:226:6: note: 'ret' declared wi=
thout an initial value
           int ret, where_align;
               ^~~
   drivers/pci/controller/dwc/pcie-keembay.c:229:8: note: Left side of '&&'=
 is false
           pci =3D to_dw_pcie_from_pp(pp);
                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/pci/controller/dwc/pcie-keembay.c:229:8: note: Taking false bran=
ch
           pci =3D to_dw_pcie_from_pp(pp);
                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/pci/controller/dwc/pcie-keembay.c:229:8: note: Loop condition is=
 false.  Exiting loop
           pci =3D to_dw_pcie_from_pp(pp);
                 ^
   drivers/pci/controller/dwc/pcie-designware.h:280:34: note: expanded from=
 macro 'to_dw_pcie_from_pp'
   #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/pci/controller/dwc/pcie-keembay.c:232:6: note: Assuming field 'r=
c_dma' is true
           if (pcie->rc_dma) {
               ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-keembay.c:232:2: note: Taking true branch
           if (pcie->rc_dma) {
           ^
   drivers/pci/controller/dwc/pcie-keembay.c:234:7: note: Assuming the cond=
ition is false
                   if (thunderbay_pcie_rc_dma_rd(pp,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-keembay.c:234:3: note: Taking false bran=
ch
                   if (thunderbay_pcie_rc_dma_rd(pp,
                   ^
   drivers/pci/controller/dwc/pcie-keembay.c:243:7: note: Assuming 'size' i=
s equal to 4
                   if (size =3D=3D 4)
                       ^~~~~~~~~
   drivers/pci/controller/dwc/pcie-keembay.c:243:3: note: Taking true branch
                   if (size =3D=3D 4)
                   ^
   drivers/pci/controller/dwc/pcie-keembay.c:255:2: note: Undefined or garb=
age value returned to caller
           return ret;
           ^      ~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '64', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);

vim +255 drivers/pci/controller/dwc/pcie-keembay.c

28f72667fffb64 Srikanth Thokala 2021-09-16  219  =

28f72667fffb64 Srikanth Thokala 2021-09-16  220  static int
28f72667fffb64 Srikanth Thokala 2021-09-16  221  thunderbay_pcie_host_rd_ot=
her_conf(struct pci_bus *bus, unsigned int devfn,
28f72667fffb64 Srikanth Thokala 2021-09-16  222  				   int where, int size=
, u32 *val)
28f72667fffb64 Srikanth Thokala 2021-09-16  223  {
28f72667fffb64 Srikanth Thokala 2021-09-16  224  	struct pcie_port *pp =3D =
bus->sysdata;
28f72667fffb64 Srikanth Thokala 2021-09-16  225  	struct keembay_pcie *pcie;
28f72667fffb64 Srikanth Thokala 2021-09-16  226  	int ret, where_align;
28f72667fffb64 Srikanth Thokala 2021-09-16  227  	struct dw_pcie *pci;
28f72667fffb64 Srikanth Thokala 2021-09-16  228  =

28f72667fffb64 Srikanth Thokala 2021-09-16  229  	pci =3D to_dw_pcie_from_p=
p(pp);
28f72667fffb64 Srikanth Thokala 2021-09-16  230  	pcie =3D dev_get_drvdata(=
pci->dev);
28f72667fffb64 Srikanth Thokala 2021-09-16  231  =

28f72667fffb64 Srikanth Thokala 2021-09-16  232  	if (pcie->rc_dma) {
28f72667fffb64 Srikanth Thokala 2021-09-16  233  		where_align =3D where & =
~((typeof(where))(4) - 1);
28f72667fffb64 Srikanth Thokala 2021-09-16  234  		if (thunderbay_pcie_rc_d=
ma_rd(pp,
28f72667fffb64 Srikanth Thokala 2021-09-16  235  					      pcie->rd_dma_ch=
an,
28f72667fffb64 Srikanth Thokala 2021-09-16  236  					      pcie->rc_dma_me=
m_pa + where_align,
28f72667fffb64 Srikanth Thokala 2021-09-16  237  					      pp->cfg0_base +=
 where_align,
28f72667fffb64 Srikanth Thokala 2021-09-16  238  					      4))
28f72667fffb64 Srikanth Thokala 2021-09-16  239  			ret =3D PCIBIOS_BAD_REG=
ISTER_NUMBER;
28f72667fffb64 Srikanth Thokala 2021-09-16  240  =

28f72667fffb64 Srikanth Thokala 2021-09-16  241  		*val =3D *((int *)(pcie-=
>rc_dma_mem_va + where));
28f72667fffb64 Srikanth Thokala 2021-09-16  242  =

28f72667fffb64 Srikanth Thokala 2021-09-16  243  		if (size =3D=3D 4)
28f72667fffb64 Srikanth Thokala 2021-09-16  244  			*val &=3D 0xFFFFFFFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  245  		else if (size =3D=3D 2)
28f72667fffb64 Srikanth Thokala 2021-09-16  246  			*val &=3D 0xFFFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  247  		else if (size =3D=3D 1)
28f72667fffb64 Srikanth Thokala 2021-09-16  248  			*val &=3D 0xFF;
28f72667fffb64 Srikanth Thokala 2021-09-16  249  		else
28f72667fffb64 Srikanth Thokala 2021-09-16  250  			ret =3D PCIBIOS_BAD_REG=
ISTER_NUMBER;
28f72667fffb64 Srikanth Thokala 2021-09-16  251  	} else {
28f72667fffb64 Srikanth Thokala 2021-09-16  252  		ret =3D dw_pcie_read(pp-=
>va_cfg0_base + where, size, val);
28f72667fffb64 Srikanth Thokala 2021-09-16  253  	}
28f72667fffb64 Srikanth Thokala 2021-09-16  254  =

28f72667fffb64 Srikanth Thokala 2021-09-16 @255  	return ret;
28f72667fffb64 Srikanth Thokala 2021-09-16  256  }
28f72667fffb64 Srikanth Thokala 2021-09-16  257  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0738087917275076508==--

