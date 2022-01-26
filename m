Content-Type: multipart/mixed; boundary="===============5448170519424486842=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_atp867x.c:281:3: warning: Value stored to 'start' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 27 Jan 2022 00:59:50 +0800
Message-ID: <202201270026.KQFfVnQl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5448170519424486842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: f2f01a52f28121770c5cd48352a60b87e1fa204b ata: pata_atp867x: convert=
 printk() calls
date:   3 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220127/202201270026.KQFfVnQl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df2f01a52f28121770c5cd48352a60b87e1fa204b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f2f01a52f28121770c5cd48352a60b87e1fa204b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~~~~~~~
   drivers/misc/mei/client.c:73:3: note: Returning; memory was released
                   kref_put(&me_cl->refcnt, mei_me_cl_release);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mei/client.c:91:2: note: Returning; memory was released via=
 1st parameter
           mei_me_cl_put(me_cl);
           ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/mei/client.c:291:2: note: Returning; memory was released vi=
a 2nd parameter
           __mei_me_cl_del(dev, me_cl);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mei/client.c:292:2: note: Use of memory after it is freed
           mei_me_cl_put(me_cl);
           ^             ~~~~~
   drivers/misc/mei/client.c:577:2: warning: Value stored to 'dev' is never=
 read [clang-analyzer-deadcode.DeadStores]
           dev =3D cl->dev;
           ^     ~~~~~~~
   drivers/misc/mei/client.c:577:2: note: Value stored to 'dev' is never re=
ad
           dev =3D cl->dev;
           ^     ~~~~~~~
   drivers/misc/mei/client.c:766:21: warning: Value stored to 'dev' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mei_device *dev =3D cl->dev;
                              ^~~   ~~~~~~~
   drivers/misc/mei/client.c:766:21: note: Value stored to 'dev' during its=
 initialization is never read
           struct mei_device *dev =3D cl->dev;
                              ^~~   ~~~~~~~
   drivers/misc/mei/client.c:1593:2: warning: Value stored to 'dev' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           dev =3D cl->dev;
           ^     ~~~~~~~
   drivers/misc/mei/client.c:1593:2: note: Value stored to 'dev' is never r=
ead
           dev =3D cl->dev;
           ^     ~~~~~~~
   drivers/misc/mei/client.c:1990:3: warning: Value stored to 'rets' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   rets =3D buf_len;
                   ^      ~~~~~~~
   drivers/misc/mei/client.c:1990:3: note: Value stored to 'rets' is never =
read
                   rets =3D buf_len;
                   ^      ~~~~~~~
   drivers/misc/mei/client.c:1996:3: warning: Value stored to 'rets' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   rets =3D buf_len;
                   ^      ~~~~~~~
   drivers/misc/mei/client.c:1996:3: note: Value stored to 'rets' is never =
read
                   rets =3D buf_len;
                   ^      ~~~~~~~
   drivers/misc/mei/client.c:2002:3: warning: Value stored to 'rets' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   rets =3D -EOVERFLOW;
                   ^      ~~~~~~~~~~
   drivers/misc/mei/client.c:2002:3: note: Value stored to 'rets' is never =
read
                   rets =3D -EOVERFLOW;
                   ^      ~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/cxl/core/mbox.c:326:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:326:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:451:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:451:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D &cxlmd->dev;
                          ^~~   ~~~~~~~~~~~
   drivers/cxl/core/mbox.c:582:17: warning: Value stored to 'dev' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D cxlm->dev;
                          ^~~   ~~~~~~~~~
   drivers/cxl/core/mbox.c:582:17: note: Value stored to 'dev' during its i=
nitialization is never read
           struct device *dev =3D cxlm->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/cxl/pci.c:41:16: warning: Value stored to 'end' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long end =3D start;
                         ^~~   ~~~~~
   drivers/cxl/pci.c:41:16: note: Value stored to 'end' during its initiali=
zation is never read
           unsigned long end =3D start;
                         ^~~   ~~~~~
   drivers/cxl/pci.c:63:17: warning: Value stored to 'dev' during its initi=
alization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D cxlm->dev;
                          ^~~   ~~~~~~~~~
   drivers/cxl/pci.c:63:17: note: Value stored to 'dev' during its initiali=
zation is never read
           struct device *dev =3D cxlm->dev;
                          ^~~   ~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/cxl/acpi.c:213:17: warning: Value stored to 'dev' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/cxl/acpi.c:213:17: note: Value stored to 'dev' during its initia=
lization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (1 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/ata/pata_atp867x.c:281:3: warning: Value stored to 'start' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   start =3D pci_resource_start(pdev, i);
                   ^
   drivers/ata/pata_atp867x.c:281:3: note: Value stored to 'start' is never=
 read
>> drivers/ata/pata_atp867x.c:282:3: warning: Value stored to 'len' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   len   =3D pci_resource_len(pdev, i);
                   ^
   drivers/ata/pata_atp867x.c:282:3: note: Value stored to 'len' is never r=
ead
>> drivers/ata/pata_atp867x.c:290:22: warning: Value stored to 'ioaddr' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ata_ioports *ioaddr =3D &ap->ioaddr;
                               ^~~~~~   ~~~~~~~~~~~
   drivers/ata/pata_atp867x.c:290:22: note: Value stored to 'ioaddr' during=
 its initialization is never read
           struct ata_ioports *ioaddr =3D &ap->ioaddr;
                               ^~~~~~   ~~~~~~~~~~~
>> drivers/ata/pata_atp867x.c:291:23: warning: Value stored to 'dp' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct atp867x_priv *dp =3D ap->private_data;
                                ^~   ~~~~~~~~~~~~~~~~
   drivers/ata/pata_atp867x.c:291:23: note: Value stored to 'dp' during its=
 initialization is never read
           struct atp867x_priv *dp =3D ap->private_data;
                                ^~   ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/hwmon/lm75.h:30:29: warning: The result of the left shift is und=
efined because the left operand is negative [clang-analyzer-core.UndefinedB=
inaryOperatorResult]
           return (u16)((ntemp / 500) << 7);
                                      ^
   drivers/hwmon/ad7418.c:166:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/hwmon/ad7418.c:166:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/hwmon/ad7418.c:170:28: note: Calling 'LM75_TEMP_TO_REG'
           data->temp[attr->index] =3D LM75_TEMP_TO_REG(temp);
                                     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm75.h:27:14: note: Assuming '__UNIQUE_ID___x298' is <=3D =
'__UNIQUE_ID___y299'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/minmax.h:104:48: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   drivers/hwmon/lm75.h:27:14: note: '?' condition is false
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:48: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                                  ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
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
   drivers/hwmon/lm75.h:27:14: note: '__UNIQUE_ID___x300' is < '__UNIQUE_ID=
___y301'
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'
   #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, lo), hi)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/hwmon/lm75.h:27:14: note: '?' condition is true
           int ntemp =3D clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
                       ^
   include/linux/minmax.h:137:32: note: expanded from macro 'clamp_val'
   #define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
                                  ^
   include/linux/minmax.h:124:36: note: expanded from macro 'clamp_t'

vim +/start +281 drivers/ata/pata_atp867x.c

d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  272) =

d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  273) =

d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  274) static void atp867x_check=
_res(struct pci_dev *pdev)
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  275) {
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  276) 	int i;
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  277) 	unsigned long start, len;
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  278) =

d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  279) 	/* Check the PCI resourc=
es for this channel are enabled */
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  280) 	for (i =3D 0; i < DEVICE=
_COUNT_RESOURCE; i++) {
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14 @281) 		start =3D pci_resource_=
start(pdev, i);
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14 @282) 		len   =3D pci_resource_=
len(pdev, i);
f2f01a52f28121 Hannes Reinecke   2021-12-21  283  		dev_dbg(&pdev->dev, "AT=
P867X: resource start:len=3D%lx:%lx\n",
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  284) 			start, len);
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  285) 	}
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  286) }
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  287) =

d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  288) static void atp867x_check=
_ports(struct ata_port *ap, int port)
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  289) {
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14 @290) 	struct ata_ioports *ioad=
dr =3D &ap->ioaddr;
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14 @291) 	struct atp867x_priv *dp =
=3D ap->private_data;
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  292) =

f2f01a52f28121 Hannes Reinecke   2021-12-21  293  	ata_port_dbg(ap, "ATP867=
X: port[%d] addresses\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  294  		"  cmd_addr	=3D0x%lx, 0=
x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  295  		"  ctl_addr	=3D0x%lx, 0=
x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  296  		"  bmdma_addr	=3D0x%lx,=
 0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  297  		"  data_addr	=3D0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  298  		"  error_addr	=3D0x%lx\=
n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  299  		"  feature_addr	=3D0x%l=
x\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  300  		"  nsect_addr	=3D0x%lx\=
n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  301  		"  lbal_addr	=3D0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  302  		"  lbam_addr	=3D0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  303  		"  lbah_addr	=3D0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  304  		"  device_addr	=3D0x%lx=
\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  305  		"  status_addr	=3D0x%lx=
\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  306  		"  command_addr	=3D0x%l=
x\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  307  		"  dp->dma_mode	=3D0x%l=
x\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  308  		"  dp->mstr_piospd	=3D0=
x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  309  		"  dp->slave_piospd	=3D=
0x%lx\n"
f2f01a52f28121 Hannes Reinecke   2021-12-21  310  		"  dp->eightb_piospd	=
=3D0x%lx\n"
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  311) 		"  dp->pci66mhz		=3D0x%=
lx\n",
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  312) 		port,
f2f01a52f28121 Hannes Reinecke   2021-12-21  313  		(unsigned long)ioaddr->=
cmd_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  314  		(unsigned long)ATP867X_=
IO_PORTBASE(ap, port),
f2f01a52f28121 Hannes Reinecke   2021-12-21  315  		(unsigned long)ioaddr->=
ctl_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  316  		(unsigned long)ATP867X_=
IO_ALTSTATUS(ap, port),
f2f01a52f28121 Hannes Reinecke   2021-12-21  317  		(unsigned long)ioaddr->=
bmdma_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  318  		(unsigned long)ATP867X_=
IO_DMABASE(ap, port),
f2f01a52f28121 Hannes Reinecke   2021-12-21  319  		(unsigned long)ioaddr->=
data_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  320  		(unsigned long)ioaddr->=
error_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  321  		(unsigned long)ioaddr->=
feature_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  322  		(unsigned long)ioaddr->=
nsect_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  323  		(unsigned long)ioaddr->=
lbal_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  324  		(unsigned long)ioaddr->=
lbam_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  325  		(unsigned long)ioaddr->=
lbah_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  326  		(unsigned long)ioaddr->=
device_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  327  		(unsigned long)ioaddr->=
status_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  328  		(unsigned long)ioaddr->=
command_addr,
f2f01a52f28121 Hannes Reinecke   2021-12-21  329  		(unsigned long)dp->dma_=
mode,
f2f01a52f28121 Hannes Reinecke   2021-12-21  330  		(unsigned long)dp->mstr=
_piospd,
f2f01a52f28121 Hannes Reinecke   2021-12-21  331  		(unsigned long)dp->slav=
e_piospd,
f2f01a52f28121 Hannes Reinecke   2021-12-21  332  		(unsigned long)dp->eigh=
tb_piospd,
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  333) 		(unsigned long)dp->pci6=
6mhz);
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  334) }
d15d6e6cc34056 John(Jung-Ik  Lee 2009-09-14  335) =


:::::: The code at line 281 was first introduced by commit
:::::: d15d6e6cc340566d53d953ffdec2c9e96816fa52 libata: Add pata_atp867x dr=
iver for Artop/Acard ATP867X controllers

:::::: TO: John(Jung-Ik) Lee <jilee@google.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5448170519424486842==--

