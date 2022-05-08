Content-Type: multipart/mixed; boundary="===============7841271926889937899=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/isp1760/isp1760-udc.c:1463:3: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argument...
Date: Sun, 08 May 2022 18:08:57 +0800
Message-ID: <202205081718.LO3dYHl6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7841271926889937899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   30c8e80f79329617012f07b09b70114592092ea4
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   8 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 weeks ago
config: riscv-randconfig-c006-20220508 (https://download.01.org/0day-ci/arc=
hive/20220508/202205081718.LO3dYHl6-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:138:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:138:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:142:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:142:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:146:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:146:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x524);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:154:4: warning: Value stored to 'tmp' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D bcma_read32(dev, 0x314);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:154:4: note: Value stored to 'tmp' is never =
read
                           tmp =3D bcma_read32(dev, 0x314);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/bcma-hcd.c:309:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hci_res, 0, sizeof(hci_res));
           ^~~~~~
   drivers/usb/host/bcma-hcd.c:309:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(hci_res, 0, sizeof(hci_res));
           ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/usb/host/max3421-hcd.c:354:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:354:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:380:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:380:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(&transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:404:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:404:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:430:2: warning: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:430:2: note: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11
           memset(transfer, 0, sizeof(transfer));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:637:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:637:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:772:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:772:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:852:21: warning: Value stored to 'spi' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:852:21: note: Value stored to 'spi' durin=
g its initialization is never read
           struct spi_device *spi =3D to_spi_device(hcd->self.controller);
                              ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/max3421-hcd.c:1636:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:1636:2: note: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11
           memset(desc, 0, sizeof(*desc));
           ^~~~~~
   drivers/usb/host/max3421-hcd.c:1719:4: warning: Value stored to 'retval'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   drivers/usb/host/max3421-hcd.c:1719:4: note: Value stored to 'retval' is=
 never read
                           retval =3D -EPIPE;
                           ^        ~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/usb/isp1760/isp1760-udc.c:1237:22: warning: Value stored to 'udc=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct isp1760_udc *udc =3D gadget_to_udc(gadget);
                               ^~~   ~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/isp1760/isp1760-udc.c:1237:22: note: Value stored to 'udc' d=
uring its initialization is never read
           struct isp1760_udc *udc =3D gadget_to_udc(gadget);
                               ^~~   ~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/isp1760/isp1760-udc.c:1463:3: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                   sprintf(ep->name, "ep%u%s", ep_num,
                   ^~~~~~~
   drivers/usb/isp1760/isp1760-udc.c:1463:3: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                   sprintf(ep->name, "ep%u%s", ep_num,
                   ^~~~~~~
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: warning: 3rd function call arg=
ument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   hpi_write_word(dev, COMM_R(i), data->regs[i]);
                   ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:324:7: note: Calling 'c67x00_comm_exe=
c_int'
           rc =3D c67x00_comm_exec_int(dev, HUSB_RESET_INT, &data);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < COMM_REGS; i++)
           ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:29: note: The value 2 is assigned=
 to 'i'
           for (i =3D 0; i < COMM_REGS; i++)
                                      ^~~
   drivers/usb/c67x00/c67x00-ll-hpi.c:287:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < COMM_REGS; i++)
           ^
   drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: note: 3rd function call argume=
nt is an uninitialized value
                   hpi_write_word(dev, COMM_R(i), data->regs[i]);
                   ^                              ~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   drivers/usb/c67x00/c67x00-hcd.c:80:3: warning: Value stored to 'len' is =
never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:80:3: note: Value stored to 'len' is nev=
er read
                   len =3D 4;                /* hub power */
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:108:3: note: Value stored to 'len' is ne=
ver read
                   len =3D 4;
                   ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:116:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:132:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:137:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:142:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:162:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:168:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:174:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:180:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:191:4: note: Value stored to 'len' is ne=
ver read
                           len =3D 0;
                           ^     ~
   drivers/usb/c67x00/c67x00-hcd.c:197:4: warning: Value stored to 'len' is=
 never read [clang-analyzer-deadcode.DeadStores]

vim +1463 drivers/usb/isp1760/isp1760-udc.c

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1439  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1440  /* ---------------------------------------------------------------=
--------------
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1441   * Registration
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1442   */
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1443  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1444  static void isp1760_udc_init_eps(struct isp1760_udc *udc)
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1445  {
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1446  	unsigned int i;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1447  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1448  	INIT_LIST_HEAD(&udc->gadget.ep_list);
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1449  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1450  	for (i =3D 0; i < ARRAY_SIZE(udc->ep); ++i) {
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1451  		struct isp1760_ep *ep =3D &udc->ep[i];
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1452  		unsigned int ep_num =3D (i + 1) / 2;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1453  		bool is_in =3D !(i & 1);
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1454  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1455  		ep->udc =3D udc;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1456  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1457  		INIT_LIST_HEAD(&ep->queue);
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1458  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1459  		ep->addr =3D (ep_num && is_in ? USB_DIR_IN : USB_DIR_OUT)
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1460  			 | ep_num;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1461  		ep->desc =3D NULL;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1462  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1 @1463  		sprintf(ep->name, "ep%u%s", ep_num,
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1464  			ep_num ? (is_in ? "in" : "out") : "");
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1465  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1466  		ep->ep.ops =3D &isp1760_ep_ops;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1467  		ep->ep.name =3D ep->name;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1468  =

0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1469  		/*
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1470  		 * Hardcode the maximum packet sizes for now, to 64 bytes for
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1471  		 * the control endpoint and 512 bytes for all other endpoints.
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1472  		 * This fits in the 8kB FIFO without double-buffering.
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1473  		 */
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1474  		if (ep_num =3D=3D 0) {
6fd82b69796cc8 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-1=
3  1475  			usb_ep_set_maxpacket_limit(&ep->ep, 64);
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1476  			ep->ep.caps.type_control =3D true;
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1477  			ep->ep.caps.dir_in =3D true;
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1478  			ep->ep.caps.dir_out =3D true;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1479  			ep->maxpacket =3D 64;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1480  			udc->gadget.ep0 =3D &ep->ep;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1481  		} else {
6fd82b69796cc8 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-1=
3  1482  			usb_ep_set_maxpacket_limit(&ep->ep, 512);
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1483  			ep->ep.caps.type_iso =3D true;
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1484  			ep->ep.caps.type_bulk =3D true;
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1485  			ep->ep.caps.type_int =3D true;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1486  			ep->maxpacket =3D 0;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1487  			list_add_tail(&ep->ep.ep_list, &udc->gadget.ep_list);
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1488  		}
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1489  =

eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1490  		if (is_in)
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1491  			ep->ep.caps.dir_in =3D true;
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1492  		else
eb4cbc19526d62 drivers/usb/isp1760/isp1760-udc.c Robert Baldyga   2015-07-3=
1  1493  			ep->ep.caps.dir_out =3D true;
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1494  	}
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1495  }
0316ca6319b98e drivers/usb/host/isp1760-udc.c    Laurent Pinchart 2015-01-2=
1  1496  =


:::::: The code at line 1463 was first introduced by commit
:::::: 0316ca6319b98e485325be98a47d08fed07ead43 usb: isp1760: Add device co=
ntroller support

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7841271926889937899==--

