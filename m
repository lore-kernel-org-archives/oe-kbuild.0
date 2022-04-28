Content-Type: multipart/mixed; boundary="===============5252654362036149141=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [usb:usb-testing 74/77] drivers/usb/gadget/udc/core.c:1558:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 28 Apr 2022 10:00:40 +0800
Message-ID: <202204280931.JsMbnaIV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5252654362036149141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-usb(a)vger.kernel.org
TO: Alan Stern <stern@rowland.harvard.edu>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   c40b62216c1aecc0dc00faf33d71bd71cb440337
commit: fc274c1e997314bf47f6a62c79b5d7e554ed59c4 [74/77] USB: gadget: Add a=
 new bus for gadgets
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220425 (https://download.01.org/0day-ci/archi=
ve/20220428/202204280931.JsMbnaIV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/co=
mmit/?id=3Dfc274c1e997314bf47f6a62c79b5d7e554ed59c4
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/=
gregkh/usb.git
        git fetch --no-tags usb usb-testing
        git checkout fc274c1e997314bf47f6a62c79b5d7e554ed59c4
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/i2c/busses/i2c-mv64xxx.c:448:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg->buf, buf, msg->len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:448:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(msg->buf, buf, msg->len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:603:2: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, msg->buf, msg->len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:603:2: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
           memcpy(buf, msg->buf, msg->len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:982:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&drv_data->reg_offsets, &mv64xxx_i2c_regs_mv64xxx=
, sizeof(drv_data->reg_offsets));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mv64xxx.c:982:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&drv_data->reg_offsets, &mv64xxx_i2c_regs_mv64xxx=
, sizeof(drv_data->reg_offsets));
                   ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
>> drivers/usb/gadget/udc/core.c:1558:4: warning: Value stored to 'ret' is =
never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D -EBUSY;
                           ^     ~~~~~~
   drivers/usb/gadget/udc/core.c:1558:4: note: Value stored to 'ret' is nev=
er read
                           ret =3D -EBUSY;
                           ^     ~~~~~~
   drivers/usb/gadget/udc/core.c:1635:9: warning: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   drivers/usb/gadget/udc/core.c:1635:9: note: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11
           return sprintf(buf, "%s\n", usb_state_string(gadget->state));
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   57 warnings generated.
   drivers/usb/gadget/udc/pxa27x_udc.c:478:17: warning: Value stored to 'ep=
' during its initialization is never read [clang-analyzer-deadcode.DeadStor=
es]
           struct pxa_ep *ep =3D &udc->pxa_ep[0];
                          ^~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:478:17: note: Value stored to 'ep' d=
uring its initialization is never read
           struct pxa_ep *ep =3D &udc->pxa_ep[0];
                          ^~   ~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:479:8: warning: Value stored to 'old=
_stname' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           char *old_stname =3D EP0_STNAME(udc);
                 ^~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:479:8: note: Value stored to 'old_st=
name' during its initialization is never read
           char *old_stname =3D EP0_STNAME(udc);
                 ^~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1085:2: warning: Value stored to 'is=
_first_req' is never read [clang-analyzer-deadcode.DeadStores]
           is_first_req =3D list_empty(&ep->queue);
           ^              ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1085:2: note: Value stored to 'is_fi=
rst_req' is never read
           is_first_req =3D list_empty(&ep->queue);
           ^              ~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1706:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&udc->stats, 0, sizeof(udc->stats));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:1706:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&udc->stats, 0, sizeof(udc->stats));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2251:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&udc->stats, 0, sizeof udc->stats);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2251:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(&udc->stats, 0, sizeof udc->stats);
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2270:6: warning: Value stored to 'ud=
ccr' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           u32 udccr =3D udc_readl(udc, UDCCR);
               ^~~~~
   drivers/usb/gadget/udc/pxa27x_udc.c:2270:6: note: Value stored to 'udccr=
' during its initialization is never read
           u32 udccr =3D udc_readl(udc, UDCCR);
               ^~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   Suppressed 35 warnings (35 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/input/misc/ati_remote2.c:71:9: warning: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buffer, "0x%04x\n", *(unsigned int *)kp->arg);

vim +/ret +1558 drivers/usb/gadget/udc/core.c

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1534  =

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1535  int usb_gadget_register_driver_owner(struct usb_gadget_dr=
iver *driver,
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1536  		struct module *owner, const char *mod_name)
4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1537  {
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1538  	int ret;
4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1539  =

4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1540  	if (!driver || !driver->bind || !driver->setup)
4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1541  		return -EINVAL;
4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1542  =

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1543  	driver->driver.bus =3D &gadget_bus_type;
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1544  	driver->driver.owner =3D owner;
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1545  	driver->driver.mod_name =3D mod_name;
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1546  	ret =3D driver_register(&driver->driver);
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1547  	if (ret) {
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1548  		pr_warn("%s: driver registration failed: %d\n",
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1549  				driver->function, ret);
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1550  		return ret;
2284b29d3d9dd1 drivers/usb/gadget/udc/udc-core.c Ruslan Bilovol            =
2015-11-23  1551  	}
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1552  =

fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1553  	mutex_lock(&udc_lock);
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1554  	if (!driver->is_bound) {
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1555  		if (driver->match_existing_only) {
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1556  			pr_warn("%s: couldn't find an available UDC or it's bu=
sy\n",
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1557  					driver->function);
7b01738112608c drivers/usb/gadget/udc/core.c     Felix H=C3=A4dicke        =
     2016-12-29 @1558  			ret =3D -EBUSY;
2284b29d3d9dd1 drivers/usb/gadget/udc/udc-core.c Ruslan Bilovol            =
2015-11-23  1559  		} else {
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1560  			pr_info("%s: couldn't find an available UDC\n",
855ed04a3758b2 drivers/usb/gadget/udc/udc-core.c Ruslan Bilovol            =
2015-11-23  1561  					driver->function);
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1562  		}
f1bddbb3de6087 drivers/usb/gadget/udc/udc-core.c Krzysztof Opasiak         =
2016-05-05  1563  		ret =3D 0;
f1bddbb3de6087 drivers/usb/gadget/udc/udc-core.c Krzysztof Opasiak         =
2016-05-05  1564  	}
4c49a5f0ef1bc6 drivers/usb/gadget/udc-core.c     Sebastian Andrzej Siewior =
2012-12-23  1565  	mutex_unlock(&udc_lock);
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1566  =

1d039a80613dd8 drivers/usb/gadget/udc/core.c     Dejin Zheng               =
2020-01-04  1567  	if (ret)
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1568  		driver_unregister(&driver->driver);
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi              =
2011-06-28  1569  	return ret;
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi              =
2011-06-28  1570  }
fc274c1e997314 drivers/usb/gadget/udc/core.c     Alan Stern                =
2022-04-23  1571  EXPORT_SYMBOL_GPL(usb_gadget_register_driver_owner);
2ccea03a8f7ec9 drivers/usb/gadget/udc-core.c     Felipe Balbi              =
2011-06-28  1572  =


:::::: The code at line 1558 was first introduced by commit
:::::: 7b01738112608ce47083178ae2b9ebadf02d32cc usb: gadget: udc: core: fix=
 return code of usb_gadget_probe_driver()

:::::: TO: Felix H=C3=A4dicke <felixhaedicke@web.de>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5252654362036149141==--

