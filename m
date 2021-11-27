Content-Type: multipart/mixed; boundary="===============2077957987591561604=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 17/23] cxl: Cache and pass DVSEC ranges
Date: Sun, 28 Nov 2021 02:35:40 +0800
Message-ID: <202111280254.IoqCZcvv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2077957987591561604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211120000250.1663391-18-ben.widawsky@intel.com>
References: <20211120000250.1663391-18-ben.widawsky@intel.com>
TO: Ben Widawsky <ben.widawsky@intel.com>
TO: linux-cxl(a)vger.kernel.org
TO: linux-pci(a)vger.kernel.org
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Alison Schofield <alison.schofield@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: Vishal Verma <vishal.l.verma@intel.com>

Hi Ben,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 53989fad1286e652ea3655ae3367ba698da8d2ff]

url:    https://github.com/0day-ci/linux/commits/Ben-Widawsky/Add-drivers-f=
or-CXL-ports-and-mem-devices/20211120-080513
base:   53989fad1286e652ea3655ae3367ba698da8d2ff
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-c007-20211118 (https://download.01.org/0day-ci/ar=
chive/20211128/202111280254.IoqCZcvv-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cfdf51e15fc8229a494ee59d0=
5bc7459ab5eecd8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ben-Widawsky/Add-drivers-for-CXL-p=
orts-and-mem-devices/20211120-080513
        git checkout cfdf51e15fc8229a494ee59d05bc7459ab5eecd8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/power/supply/bq256xx_charger.c:275:8: warning: Excessive padding=
 in 'struct bq256xx_chip_info' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   bq256xx_regmap_config, =

   bq256xx_get_ichg, =

   bq256xx_get_iindpm, =

   bq256xx_get_vbatreg, =

   bq256xx_get_iterm, =

   bq256xx_get_iprechg, =

   bq256xx_get_vindpm, =

   bq256xx_set_ichg, =

   bq256xx_set_iindpm, =

   bq256xx_set_vbatreg, =

   bq256xx_set_iterm, =

   bq256xx_set_iprechg, =

   bq256xx_set_vindpm, =

   model_id, =

   bq256xx_def_ichg, =

   bq256xx_def_iindpm, =

   bq256xx_def_vbatreg, =

   bq256xx_def_iterm, =

   bq256xx_def_iprechg, =

   bq256xx_def_vindpm, =

   bq256xx_max_ichg, =

   bq256xx_max_vbatreg, =

   has_usb_detect, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bq256xx_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq256xx_charger.c:275:8: note: Excessive padding in=
 'struct bq256xx_chip_info' (11 padding bytes, where 3 is optimal). Optimal=
 fields order: bq256xx_regmap_config, bq256xx_get_ichg, bq256xx_get_iindpm,=
 bq256xx_get_vbatreg, bq256xx_get_iterm, bq256xx_get_iprechg, bq256xx_get_v=
indpm, bq256xx_set_ichg, bq256xx_set_iindpm, bq256xx_set_vbatreg, bq256xx_s=
et_iterm, bq256xx_set_iprechg, bq256xx_set_vindpm, model_id, bq256xx_def_ic=
hg, bq256xx_def_iindpm, bq256xx_def_vbatreg, bq256xx_def_iterm, bq256xx_def=
_iprechg, bq256xx_def_vindpm, bq256xx_max_ichg, bq256xx_max_vbatreg, has_us=
b_detect, consider reordering the fields or adding explicit padding members
   struct bq256xx_chip_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq256xx_charger.c:1521:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_update_bits(bq->regmap, BQ256XX_CHARGER_CONTROL_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/bq256xx_charger.c:1521:2: note: Value stored to 're=
t' is never read
           ret =3D regmap_update_bits(bq->regmap, BQ256XX_CHARGER_CONTROL_1,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/hwmon/acpi_power_meter.c:879:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
           ^~~~~~
   drivers/hwmon/acpi_power_meter.c:879:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_POWER_METER_DEVICE_NAME);
           ^~~~~~
   drivers/hwmon/acpi_power_meter.c:880:2: warning: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strc=
py]
           strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
           ^~~~~~
   drivers/hwmon/acpi_power_meter.c:880:2: note: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
           ^~~~~~
   2 warnings generated.
   drivers/usb/storage/freecom.c:449:2: warning: Value stored to 'result' i=
s never read [clang-analyzer-deadcode.DeadStores]
           result =3D usb_stor_control_msg(us, us->recv_ctrl_pipe,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/storage/freecom.c:449:2: note: Value stored to 'result' is n=
ever read
           result =3D usb_stor_control_msg(us, us->recv_ctrl_pipe,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/storage/freecom.c:537:2: warning: Value stored to 'offset' i=
s never read [clang-analyzer-deadcode.DeadStores]
           offset =3D 0;
           ^        ~
   drivers/usb/storage/freecom.c:537:2: note: Value stored to 'offset' is n=
ever read
           offset =3D 0;
           ^        ~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/cxl/core/mbox.c:324:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:324:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:449:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:449:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:580:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
   drivers/cxl/core/mbox.c:580:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
   4 warnings generated.
   drivers/cxl/pci.c:42:16: warning: Value stored to 'end' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long end =3D start;
                         ^~~   ~~~~~
   drivers/cxl/pci.c:42:16: note: Value stored to 'end' during its initiali=
zation is never read
           unsigned long end =3D start;
                         ^~~   ~~~~~
   drivers/cxl/pci.c:64:17: warning: Value stored to 'dev' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
   drivers/cxl/pci.c:64:17: note: Value stored to 'dev' during its initiali=
zation is never read
           struct device *dev =3D cxlds->dev;
                          ^~~   ~~~~~~~~~~
>> drivers/cxl/pci.c:483:3: warning: Value stored to 'size' is never read [=
clang-analyzer-deadcode.DeadStores]
                   size |=3D temp & CXL_DVSEC_PCIE_DEVICE_MEM_SIZE_LOW_MASK;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/pci.c:483:3: note: Value stored to 'size' is never read
                   size |=3D temp & CXL_DVSEC_PCIE_DEVICE_MEM_SIZE_LOW_MASK;
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/cxl/acpi.c:142:17: warning: Value stored to 'dev' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/cxl/acpi.c:142:17: note: Value stored to 'dev' during its initia=
lization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/cxl/acpi.c:399:14: warning: 3rd function call argument is an uni=
nitialized value [clang-analyzer-core.CallAndMessage]
           root_port =3D devm_cxl_add_port(host, CXL_RESOURCE_NONE, root_po=
rt);
                       ^                                          ~~~~~~~~~
   drivers/cxl/acpi.c:386:2: note: 'root_port' declared without an initial =
value
           struct cxl_port *root_port;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/acpi.c:388:29: note: Assuming the condition is false
           struct acpi_device *adev =3D ACPI_COMPANION(host);
                                      ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/acpi.c:388:29: note: '?' condition is false
           struct acpi_device *adev =3D ACPI_COMPANION(host);
                                      ^
   include/linux/acpi.h:43:30: note: expanded from macro 'ACPI_COMPANION'
   #define ACPI_COMPANION(dev)             to_acpi_device_node((dev)->fwnod=
e)
                                           ^
   include/acpi/acpi_bus.h:418:3: note: expanded from macro 'to_acpi_device=
_node'
                   is_acpi_device_node(__to_acpi_device_node_fwnode) ?     \
                   ^
   drivers/cxl/acpi.c:392:2: note: Assuming 'rc' is 0
           if (rc)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/cxl/acpi.c:392:2: note: '?' condition is false
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/cxl/acpi.c:392:6: note: 'rc' is 0
           if (rc)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/cxl/acpi.c:392:2: note: '?' condition is false
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/cxl/acpi.c:392:2: note: Taking false branch
           if (rc)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/cxl/acpi.c:396:2: note: '?' condition is false
           if (rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/cxl/acpi.c:396:6: note: 'rc' is 0
           if (rc)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~

vim +/size +483 drivers/cxl/pci.c

1d5a4159074bde Ben Widawsky 2021-04-07  454  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  455  #define CDPD(cxlds, which)    =
                                                 \
cfdf51e15fc822 Ben Widawsky 2021-11-19  456  	cxlds->device_dvsec + CXL_DVS=
EC_PCIE_DEVICE_##which##_OFFSET
cfdf51e15fc822 Ben Widawsky 2021-11-19  457  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  458  #define CDPDR(cxlds, which, so=
rb, lohi)                                        \
cfdf51e15fc822 Ben Widawsky 2021-11-19  459  	cxlds->device_dvsec +        =
                                          \
cfdf51e15fc822 Ben Widawsky 2021-11-19  460  		CXL_DVSEC_PCIE_DEVICE_RANGE_=
##sorb##_##lohi##_OFFSET(which)
cfdf51e15fc822 Ben Widawsky 2021-11-19  461  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  462  static int wait_for_valid(stru=
ct cxl_dev_state *cxlds)
cfdf51e15fc822 Ben Widawsky 2021-11-19  463  {
cfdf51e15fc822 Ben Widawsky 2021-11-19  464  	struct pci_dev *pdev =3D to_p=
ci_dev(cxlds->dev);
cfdf51e15fc822 Ben Widawsky 2021-11-19  465  	const unsigned long timeout =
=3D jiffies + HZ;
cfdf51e15fc822 Ben Widawsky 2021-11-19  466  	bool valid;
cfdf51e15fc822 Ben Widawsky 2021-11-19  467  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  468  	do {
cfdf51e15fc822 Ben Widawsky 2021-11-19  469  		u64 size;
cfdf51e15fc822 Ben Widawsky 2021-11-19  470  		u32 temp;
cfdf51e15fc822 Ben Widawsky 2021-11-19  471  		int rc;
cfdf51e15fc822 Ben Widawsky 2021-11-19  472  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  473  		rc =3D pci_read_config_dword=
(pdev, CDPDR(cxlds, 0, SIZE, HIGH),
cfdf51e15fc822 Ben Widawsky 2021-11-19  474  					   &temp);
cfdf51e15fc822 Ben Widawsky 2021-11-19  475  		if (rc)
cfdf51e15fc822 Ben Widawsky 2021-11-19  476  			return -ENXIO;
cfdf51e15fc822 Ben Widawsky 2021-11-19  477  		size =3D (u64)temp << 32;
cfdf51e15fc822 Ben Widawsky 2021-11-19  478  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  479  		rc =3D pci_read_config_dword=
(pdev, CDPDR(cxlds, 0, SIZE, LOW),
cfdf51e15fc822 Ben Widawsky 2021-11-19  480  					   &temp);
cfdf51e15fc822 Ben Widawsky 2021-11-19  481  		if (rc)
cfdf51e15fc822 Ben Widawsky 2021-11-19  482  			return -ENXIO;
cfdf51e15fc822 Ben Widawsky 2021-11-19 @483  		size |=3D temp & CXL_DVSEC_P=
CIE_DEVICE_MEM_SIZE_LOW_MASK;
cfdf51e15fc822 Ben Widawsky 2021-11-19  484  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  485  		/*
cfdf51e15fc822 Ben Widawsky 2021-11-19  486  		 * Memory_Info_Valid: When s=
et, indicates that the CXL Range 1
cfdf51e15fc822 Ben Widawsky 2021-11-19  487  		 * Size high and Size Low re=
gisters are valid. Must be set
cfdf51e15fc822 Ben Widawsky 2021-11-19  488  		 * within 1 second of deasse=
rtion of reset to CXL device.
cfdf51e15fc822 Ben Widawsky 2021-11-19  489  		 */
cfdf51e15fc822 Ben Widawsky 2021-11-19  490  		valid =3D FIELD_GET(CXL_DVSE=
C_PCIE_DEVICE_MEM_INFO_VALID, temp);
cfdf51e15fc822 Ben Widawsky 2021-11-19  491  		if (valid)
cfdf51e15fc822 Ben Widawsky 2021-11-19  492  			break;
cfdf51e15fc822 Ben Widawsky 2021-11-19  493  		cpu_relax();
cfdf51e15fc822 Ben Widawsky 2021-11-19  494  	} while (!time_after(jiffies,=
 timeout));
cfdf51e15fc822 Ben Widawsky 2021-11-19  495  =

cfdf51e15fc822 Ben Widawsky 2021-11-19  496  	return valid ? 0 : -ETIMEDOUT;
cfdf51e15fc822 Ben Widawsky 2021-11-19  497  }
cfdf51e15fc822 Ben Widawsky 2021-11-19  498  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============2077957987591561604==--

