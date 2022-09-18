Content-Type: multipart/mixed; boundary="===============5743436238091245790=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spi-cadence-xspi.c:488:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 18 Sep 2022 10:19:56 +0800
Message-ID: <202209181027.g7tKkCyL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5743436238091245790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/s=
pi/spi-cadence-xspi.c:488:22: warning: use of uninitialized value '<unknown=
>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Parshuram Thombare <pthombar@cadence.com>
CC: Mark Brown <broonie@kernel.org>
CC: Konrad Kociolek <konrad@cadence.com>
CC: Jayshri Pawar <jpawar@cadence.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a335366bad1364a07f49df9da1fdfa6d411a5f39
commit: a16cc807762730a6291762d4bedd7b00624a6426 spi: cadence: add support =
for Cadence XSPI controller
date:   12 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220915 (https://download.01.org/0day-ci/archi=
ve/20220918/202209181027.g7tKkCyL-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da16cc807762730a6291762d4bedd7b00624a6426
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a16cc807762730a6291762d4bedd7b00624a6426
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
                     |      |            (5) entry to 'cdns_xspi_send_stig_=
command'
                     |......
                     |  349 |         u32 cmd_regs[5];
                     |      |             ~~~~~~~~
                     |      |             |
                     |      |             (6) region created on stack here
                     |......
                     |  354 |         if (ret < 0)
                     |      |            ~
                     |      |            |
                     |      |            (7) following 'false' branch (when=
 'ret >=3D 0')...
                     |
                   'cdns_xspi_send_stig_command': event 8
                     |
                     |arch/arm/include/asm/barrier.h:20:21:
                     |   20 | #define dsb(option) __asm__ __volatile__ ("ds=
b " #option : : : "memory")
                     |      |                     ^~~~~~~
                     |      |                     |
                     |      |                     (8) ...to here
   arch/arm/include/asm/barrier.h:60:30: note: in expansion of macro 'dsb'
                     |   60 | #define __arm_heavy_mb(x...) dsb(x)
                     |      |                              ^~~
   arch/arm/include/asm/barrier.h:66:25: note: in expansion of macro '__arm=
_heavy_mb'
                     |   66 | #define wmb()           __arm_heavy_mb(st)
                     |      |                         ^~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:166:33: note: in expansion of macro 'wmb'
                     |  166 | #define __iowmb()               wmb()
                     |      |                                 ^~~
   arch/arm/include/asm/io.h:307:36: note: in expansion of macro '__iowmb'
                     |  307 | #define writel(v,c)             ({ __iowmb();=
 writel_relaxed(v,c); })
                     |      |                                    ^~~~~~~
   drivers/spi/spi-cadence-xspi.c:357:9: note: in expansion of macro 'write=
l'
                     |  357 |         writel(FIELD_PREP(CDNS_XSPI_CTRL_WORK=
_MODE, CDNS_XSPI_WORK_MODE_STIG),
                     |      |         ^~~~~~
                     |
                   'cdns_xspi_send_stig_command': event 9
                     |
                     |  360 |         cdns_xspi_set_interrupts(cdns_xspi, t=
rue);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
                     |      |         |
                     |      |         (9) calling 'cdns_xspi_set_interrupts=
' from 'cdns_xspi_send_stig_command'
                     |
                     +--> 'cdns_xspi_set_interrupts': events 10-11
                            |
                            |  288 | static void cdns_xspi_set_interrupts(s=
truct cdns_xspi_dev *cdns_xspi,
                            |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
                            |      |             |
                            |      |             (10) entry to 'cdns_xspi_s=
et_interrupts'
                            |......
                            |  294 |         if (enabled)
                            |      |            ~ =

                            |      |            |
                            |      |            (11) following 'true' branc=
h (when 'enabled !=3D 0')...
                            |
                          'cdns_xspi_set_interrupts': event 12
                            |
                            |  295 |                 intr_enable |=3D CDNS_=
XSPI_INTR_MASK;
                            |      |                             ^
                            |      |                             |
                            |      |                             (12) ...to=
 here
                            |
                     <------+
                     |
                   'cdns_xspi_send_stig_command': events 13-14
                     |
                     |  360 |         cdns_xspi_set_interrupts(cdns_xspi, t=
rue);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
                     |      |         |
                     |      |         (13) returning to 'cdns_xspi_send_sti=
g_command' from 'cdns_xspi_set_interrupts'
                     |......
                     |  370 |         cdns_xspi_trigger_command(cdns_xspi, =
cmd_regs);
                     |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
                     |      |         |
                     |      |         (14) calling 'cdns_xspi_trigger_comma=
nd' from 'cdns_xspi_send_stig_command'
                     |
                     +--> 'cdns_xspi_trigger_command': event 15
                            |
                            |  241 | static void cdns_xspi_trigger_command(=
struct cdns_xspi_dev *cdns_xspi,
                            |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |             |
                            |      |             (15) entry to 'cdns_xspi_t=
rigger_command'
                            |
                          'cdns_xspi_trigger_command': event 16
                            |
                            |arch/arm/include/asm/io.h:92:22:
                            |   92 | #define __raw_writel __raw_writel
                            |      |                      ^
                            |      |                      |
                            |      |                      (16) use of unini=
tialized value 'cmd_regs[5]' here
   arch/arm/include/asm/io.h:299:33: note: in expansion of macro '__raw_wri=
tel'
                            |  299 | #define writel_relaxed(v,c)     __raw_=
writel((__force u32) cpu_to_le32(v),c)
                            |      |                                 ^~~~~~=
~~~~~~
   arch/arm/include/asm/io.h:307:47: note: in expansion of macro 'writel_re=
laxed'
                            |  307 | #define writel(v,c)             ({ __i=
owmb(); writel_relaxed(v,c); })
                            |      |                                       =
        ^~~~~~~~~~~~~~
   drivers/spi/spi-cadence-xspi.c:244:9: note: in expansion of macro 'write=
l'
                            |  244 |         writel(cmd_regs[5], cdns_xspi-=
>iobase + CDNS_XSPI_CMD_REG_5);
                            |      |         ^~~~~~
                            |
   drivers/spi/spi-cadence-xspi.c: In function 'cdns_xspi_of_get_plat_data':
>> drivers/spi/spi-cadence-xspi.c:488:22: warning: use of uninitialized val=
ue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     488 |         unsigned int cs;
         |                      ^~
     'cdns_xspi_of_get_plat_data': event 1
       |
       |  488 |         unsigned int cs;
       |      |                      ^~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +488 drivers/spi/spi-cadence-xspi.c

a16cc807762730 Parshuram Thombare 2021-09-19  483  =

a16cc807762730 Parshuram Thombare 2021-09-19  484  static int cdns_xspi_of_=
get_plat_data(struct platform_device *pdev)
a16cc807762730 Parshuram Thombare 2021-09-19  485  {
a16cc807762730 Parshuram Thombare 2021-09-19  486  	struct device_node *nod=
e_prop =3D pdev->dev.of_node;
a16cc807762730 Parshuram Thombare 2021-09-19  487  	struct device_node *nod=
e_child;
a16cc807762730 Parshuram Thombare 2021-09-19 @488  	unsigned int cs;
a16cc807762730 Parshuram Thombare 2021-09-19  489  =

a16cc807762730 Parshuram Thombare 2021-09-19  490  	for_each_child_of_node(=
node_prop, node_child) {
a16cc807762730 Parshuram Thombare 2021-09-19  491  		if (!of_device_is_avai=
lable(node_child))
a16cc807762730 Parshuram Thombare 2021-09-19  492  			continue;
a16cc807762730 Parshuram Thombare 2021-09-19  493  =

a16cc807762730 Parshuram Thombare 2021-09-19  494  		if (of_property_read_u=
32(node_child, "reg", &cs)) {
a16cc807762730 Parshuram Thombare 2021-09-19  495  			dev_err(&pdev->dev, "=
Couldn't get memory chip select\n");
a16cc807762730 Parshuram Thombare 2021-09-19  496  			return -ENXIO;
a16cc807762730 Parshuram Thombare 2021-09-19  497  		} else if (cs >=3D CDN=
S_XSPI_MAX_BANKS) {
a16cc807762730 Parshuram Thombare 2021-09-19  498  			dev_err(&pdev->dev, "=
reg (cs) parameter value too large\n");
a16cc807762730 Parshuram Thombare 2021-09-19  499  			return -ENXIO;
a16cc807762730 Parshuram Thombare 2021-09-19  500  		}
a16cc807762730 Parshuram Thombare 2021-09-19  501  	}
a16cc807762730 Parshuram Thombare 2021-09-19  502  =

a16cc807762730 Parshuram Thombare 2021-09-19  503  	return 0;
a16cc807762730 Parshuram Thombare 2021-09-19  504  }
a16cc807762730 Parshuram Thombare 2021-09-19  505  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5743436238091245790==--

