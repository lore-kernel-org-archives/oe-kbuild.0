Content-Type: multipart/mixed; boundary="===============2172400032376402663=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_pdc2027x.c:521:2: warning: Value stored to 'pll_ctl' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 25 Jan 2022 23:14:07 +0800
Message-ID: <202201252302.RWrXf0BG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2172400032376402663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: b5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347 ata: pata_pdc2027x: Replac=
e PDPRINTK() with standard ata logging
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220125/202201252302.RWrXf0BG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5a5fc8b0f8175e4b3aaf182c1b23de4ccdd3347
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/acpi/pci_link.c:88:14: warning: Value stored to 'handle' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:88:14: note: Value stored to 'handle' during its=
 initialization is never read
           acpi_handle handle =3D link->device->handle;
                       ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/pci_link.c:721:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:721:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_name(device), ACPI_PCI_LINK_DEVICE_NAME);
           ^~~~~~
   drivers/acpi/pci_link.c:722:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   drivers/acpi/pci_link.c:722:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(acpi_device_class(device), ACPI_PCI_LINK_CLASS);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/acpi/pci_irq.c:131:4: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
   drivers/acpi/pci_irq.c:131:4: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                           strcpy(prt->source, quirk->actual_source);
                           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   5 warnings generated.
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> drivers/ata/pata_pdc2027x.c:521:2: warning: Value stored to 'pll_ctl' is=
 never read [clang-analyzer-deadcode.DeadStores]
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_pdc2027x.c:521:2: note: Value stored to 'pll_ctl' is ne=
ver read
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_pdc2027x.c:570:2: warning: Value stored to 'pll_ctl' is=
 never read [clang-analyzer-deadcode.DeadStores]
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ata/pata_pdc2027x.c:570:2: note: Value stored to 'pll_ctl' is ne=
ver read
           pll_ctl =3D ioread16(mmio_base + PDC_PLL_CTL);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: warning: Call to function 's=
trcpy' is insecure as it does not provide bounding of the memory buffer. Re=
place unbounded copy functions with analogous functions that support length=
 arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.=
strcpy]
           strcpy(chan->adapter.name, name);
           ^~~~~~
   drivers/video/fbdev/riva/rivafb-i2c.c:94:2: note: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119
           strcpy(chan->adapter.name, name);
           ^~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/video/fbdev/nvidia/nvidia.c:124:4: warning: Value stored to 'tmp=
' is never read [clang-analyzer-deadcode.DeadStores]
                           tmp =3D 0;
                           ^     ~
   drivers/video/fbdev/nvidia/nvidia.c:124:4: note: Value stored to 'tmp' i=
s never read
                           tmp =3D 0;
                           ^     ~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/video/fbdev/nvidia/nv_hw.c:261:2: warning: Value stored to 'clwm=
' is never read [clang-analyzer-deadcode.DeadStores]
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:261:2: note: Value stored to 'clwm' i=
s never read
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:284:2: warning: Value stored to 'pclk=
s' is never read [clang-analyzer-deadcode.DeadStores]
           pclks +=3D 0;
           ^        ~
   drivers/video/fbdev/nvidia/nv_hw.c:284:2: note: Value stored to 'pclks' =
is never read
           pclks +=3D 0;
           ^        ~
   drivers/video/fbdev/nvidia/nv_hw.c:439:2: warning: Value stored to 'clwm=
' is never read [clang-analyzer-deadcode.DeadStores]
           clwm =3D 0;
           ^      ~
   drivers/video/fbdev/nvidia/nv_hw.c:439:2: note: Value stored to 'clwm' i=
s never read
           clwm =3D 0;
           ^      ~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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

vim +/pll_ctl +521 drivers/ata/pata_pdc2027x.c

669a5db411d85a Jeff Garzik     2006-08-29  492  =

669a5db411d85a Jeff Garzik     2006-08-29  493  /**
1906cf27fcc070 Lee Jones       2021-02-01  494   * pdc_adjust_pll - Adjust =
the PLL input clock in Hz.
669a5db411d85a Jeff Garzik     2006-08-29  495   *
5d728824efeda6 Tejun Heo       2007-04-17  496   * @host: target ATA host
669a5db411d85a Jeff Garzik     2006-08-29  497   * @pll_clock: The input of=
 PLL in HZ
1906cf27fcc070 Lee Jones       2021-02-01  498   * @board_idx: board identi=
fier
669a5db411d85a Jeff Garzik     2006-08-29  499   */
5d728824efeda6 Tejun Heo       2007-04-17  500  static void pdc_adjust_pll(=
struct ata_host *host, long pll_clock, unsigned int board_idx)
669a5db411d85a Jeff Garzik     2006-08-29  501  {
5d728824efeda6 Tejun Heo       2007-04-17  502  	void __iomem *mmio_base =
=3D host->iomap[PDC_MMIO_BAR];
669a5db411d85a Jeff Garzik     2006-08-29  503  	u16 pll_ctl;
669a5db411d85a Jeff Garzik     2006-08-29  504  	long pll_clock_khz =3D pll=
_clock / 1000;
669a5db411d85a Jeff Garzik     2006-08-29  505  	long pout_required =3D boa=
rd_idx? PDC_133_MHZ:PDC_100_MHZ;
669a5db411d85a Jeff Garzik     2006-08-29  506  	long ratio =3D pout_requir=
ed / pll_clock_khz;
669a5db411d85a Jeff Garzik     2006-08-29  507  	int F, R;
669a5db411d85a Jeff Garzik     2006-08-29  508  =

669a5db411d85a Jeff Garzik     2006-08-29  509  	/* Sanity check */
669a5db411d85a Jeff Garzik     2006-08-29  510  	if (unlikely(pll_clock_khz=
 < 5000L || pll_clock_khz > 70000L)) {
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  511  		dev_err(host->dev, "Inval=
id PLL input clock %ldkHz, give up!\n",
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  512  			pll_clock_khz);
669a5db411d85a Jeff Garzik     2006-08-29  513  		return;
669a5db411d85a Jeff Garzik     2006-08-29  514  	}
669a5db411d85a Jeff Garzik     2006-08-29  515  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  516  	dev_dbg(host->dev, "pout_r=
equired is %ld\n", pout_required);
669a5db411d85a Jeff Garzik     2006-08-29  517  =

669a5db411d85a Jeff Garzik     2006-08-29  518  	/* Show the current clock =
value of PLL control register
669a5db411d85a Jeff Garzik     2006-08-29  519  	 * (maybe already configur=
ed by the firmware)
669a5db411d85a Jeff Garzik     2006-08-29  520  	 */
d2a84f47899d1e Alan Cox        2007-09-20 @521  	pll_ctl =3D ioread16(mmio_=
base + PDC_PLL_CTL);
669a5db411d85a Jeff Garzik     2006-08-29  522  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  523  	dev_dbg(host->dev, "pll_ct=
l[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  524  =

669a5db411d85a Jeff Garzik     2006-08-29  525  	/*
669a5db411d85a Jeff Garzik     2006-08-29  526  	 * Calculate the ratio of =
F, R and OD
669a5db411d85a Jeff Garzik     2006-08-29  527  	 * POUT =3D (F + 2) / (( R=
 + 2) * NO)
669a5db411d85a Jeff Garzik     2006-08-29  528  	 */
669a5db411d85a Jeff Garzik     2006-08-29  529  	if (ratio < 8600L) { /* 8.=
6x */
669a5db411d85a Jeff Garzik     2006-08-29  530  		/* Using NO =3D 0x01, R =
=3D 0x0D */
669a5db411d85a Jeff Garzik     2006-08-29  531  		R =3D 0x0d;
669a5db411d85a Jeff Garzik     2006-08-29  532  	} else if (ratio < 12900L)=
 { /* 12.9x */
669a5db411d85a Jeff Garzik     2006-08-29  533  		/* Using NO =3D 0x01, R =
=3D 0x08 */
669a5db411d85a Jeff Garzik     2006-08-29  534  		R =3D 0x08;
669a5db411d85a Jeff Garzik     2006-08-29  535  	} else if (ratio < 16100L)=
 { /* 16.1x */
669a5db411d85a Jeff Garzik     2006-08-29  536  		/* Using NO =3D 0x01, R =
=3D 0x06 */
669a5db411d85a Jeff Garzik     2006-08-29  537  		R =3D 0x06;
669a5db411d85a Jeff Garzik     2006-08-29  538  	} else if (ratio < 64000L)=
 { /* 64x */
669a5db411d85a Jeff Garzik     2006-08-29  539  		R =3D 0x00;
669a5db411d85a Jeff Garzik     2006-08-29  540  	} else {
669a5db411d85a Jeff Garzik     2006-08-29  541  		/* Invalid ratio */
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  542  		dev_err(host->dev, "Inval=
id ratio %ld, give up!\n", ratio);
669a5db411d85a Jeff Garzik     2006-08-29  543  		return;
669a5db411d85a Jeff Garzik     2006-08-29  544  	}
669a5db411d85a Jeff Garzik     2006-08-29  545  =

669a5db411d85a Jeff Garzik     2006-08-29  546  	F =3D (ratio * (R+2)) / 10=
00 - 2;
669a5db411d85a Jeff Garzik     2006-08-29  547  =

669a5db411d85a Jeff Garzik     2006-08-29  548  	if (unlikely(F < 0 || F > =
127)) {
669a5db411d85a Jeff Garzik     2006-08-29  549  		/* Invalid F */
b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  550  		dev_err(host->dev, "F[%d]=
 invalid!\n", F);
669a5db411d85a Jeff Garzik     2006-08-29  551  		return;
669a5db411d85a Jeff Garzik     2006-08-29  552  	}
669a5db411d85a Jeff Garzik     2006-08-29  553  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  554  	dev_dbg(host->dev, "F[%d] =
R[%d] ratio*1000[%ld]\n", F, R, ratio);
669a5db411d85a Jeff Garzik     2006-08-29  555  =

669a5db411d85a Jeff Garzik     2006-08-29  556  	pll_ctl =3D (R << 8) | F;
669a5db411d85a Jeff Garzik     2006-08-29  557  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  558  	dev_dbg(host->dev, "Writin=
g pll_ctl[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  559  =

d2a84f47899d1e Alan Cox        2007-09-20  560  	iowrite16(pll_ctl, mmio_ba=
se + PDC_PLL_CTL);
d2a84f47899d1e Alan Cox        2007-09-20  561  	ioread16(mmio_base + PDC_P=
LL_CTL); /* flush */
669a5db411d85a Jeff Garzik     2006-08-29  562  =

669a5db411d85a Jeff Garzik     2006-08-29  563  	/* Wait the PLL circuit to=
 be stable */
b3506c7ed216dd Jia-Ju Bai      2018-01-25  564  	msleep(30);
669a5db411d85a Jeff Garzik     2006-08-29  565  =

669a5db411d85a Jeff Garzik     2006-08-29  566  	/*
669a5db411d85a Jeff Garzik     2006-08-29  567  	 *  Show the current clock=
 value of PLL control register
669a5db411d85a Jeff Garzik     2006-08-29  568  	 * (maybe configured by th=
e firmware)
669a5db411d85a Jeff Garzik     2006-08-29  569  	 */
d2a84f47899d1e Alan Cox        2007-09-20  570  	pll_ctl =3D ioread16(mmio_=
base + PDC_PLL_CTL);
669a5db411d85a Jeff Garzik     2006-08-29  571  =

b5a5fc8b0f8175 Hannes Reinecke 2021-12-21  572  	dev_dbg(host->dev, "pll_ct=
l[%X]\n", pll_ctl);
669a5db411d85a Jeff Garzik     2006-08-29  573  =

669a5db411d85a Jeff Garzik     2006-08-29  574  	return;
669a5db411d85a Jeff Garzik     2006-08-29  575  }
669a5db411d85a Jeff Garzik     2006-08-29  576  =


:::::: The code at line 521 was first introduced by commit
:::::: d2a84f47899d1efc24fa610696f7b793692279c7 pdc2027x: Switch properly t=
o ioread/iowrite

:::::: TO: Alan Cox <alan@lxorguk.ukuu.org.uk>
:::::: CC: Jeff Garzik <jeff@garzik.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2172400032376402663==--

