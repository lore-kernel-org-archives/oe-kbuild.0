Content-Type: multipart/mixed; boundary="===============7096335476448726892=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/sata_fsl.c:333:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 14 Aug 2022 23:28:03 +0800
Message-ID: <202208142356.3JFxrCpc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7096335476448726892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/ata/sata_fsl.c:333:22: warning: use of uninitialized value '<unkno=
wn>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 87924c5b4094f195507bebcab96e141e48c947d7 ata: sata_fsl: add compile=
 test support
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220807 (https://download.01.org/0day-ci/archi=
ve/20220814/202208142356.3JFxrCpc-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D87924c5b4094f195507bebcab96e141e48c947d7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 87924c5b4094f195507bebcab96e141e48c947d7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/ata/sata_fsl.c:1384:22: warning: initialized field overwritten [=
-Woverride-init]
    1384 |         .can_queue =3D SATA_FSL_QUEUE_DEPTH,
         |                      ^~~~~~~~~~~~~~~~~~~~
   drivers/ata/sata_fsl.c:1384:22: note: (near initialization for 'sata_fsl=
_sht.can_queue')
   drivers/ata/sata_fsl.c: In function 'fsl_sata_intr_coalescing_store':
>> drivers/ata/sata_fsl.c:333:22: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     333 |         unsigned int coalescing_count,  coalescing_ticks;
         |                      ^~~~~~~~~~~~~~~~
     'fsl_sata_intr_coalescing_store': event 1
       |
       |  333 |         unsigned int coalescing_count,  coalescing_ticks;
       |      |                      ^~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/ata/sata_fsl.c:333:41: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     333 |         unsigned int coalescing_count,  coalescing_ticks;
         |                                         ^~~~~~~~~~~~~~~~
     'fsl_sata_intr_coalescing_store': event 1
       |
       |  333 |         unsigned int coalescing_count,  coalescing_ticks;
       |      |                                         ^~~~~~~~~~~~~~~~
       |      |                                         |
       |      |                                         (1) use of uninitia=
lized value '<unknown>' here
       |
   drivers/ata/sata_fsl.c: In function 'fsl_sata_rx_watermark_store':
   drivers/ata/sata_fsl.c:369:22: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     369 |         unsigned int rx_watermark;
         |                      ^~~~~~~~~~~~
     'fsl_sata_rx_watermark_store': event 1
       |
       |  369 |         unsigned int rx_watermark;
       |      |                      ^~~~~~~~~~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/ata/sata_fsl.c: In function 'sata_fsl_port_start':
   drivers/ata/sata_fsl.c:707:20: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     707 |         dma_addr_t mem_dma;
         |                    ^~~~~~~
     'sata_fsl_port_start': event 1
       |
       |  707 |         dma_addr_t mem_dma;
       |      |                    ^~~~~~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown=
>' here
       |
   drivers/ata/sata_fsl.c: In function 'sata_fsl_softreset':
   drivers/ata/sata_fsl.c:929:13: warning: use of uninitialized value '<unk=
nown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     929 |         u32 Serror;
         |             ^~~~~~
     'sata_fsl_softreset': event 1
       |
       |  929 |         u32 Serror;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/ata/sata_fsl.c: In function 'sata_fsl_host_intr':
   drivers/ata/sata_fsl.c:1188:13: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1188 |         u32 SError;
         |             ^~~~~~
     'sata_fsl_host_intr': event 1
       |
       | 1188 |         u32 SError;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +333 drivers/ata/sata_fsl.c

6b4b8fc87dc5cb Qiang Liu 2012-02-15  328  =

6b4b8fc87dc5cb Qiang Liu 2012-02-15  329  static ssize_t fsl_sata_intr_coal=
escing_store(struct device *dev,
6b4b8fc87dc5cb Qiang Liu 2012-02-15  330  		struct device_attribute *attr,
6b4b8fc87dc5cb Qiang Liu 2012-02-15  331  		const char *buf, size_t count)
6b4b8fc87dc5cb Qiang Liu 2012-02-15  332  {
6b4b8fc87dc5cb Qiang Liu 2012-02-15 @333  	unsigned int coalescing_count,	c=
oalescing_ticks;
6b4b8fc87dc5cb Qiang Liu 2012-02-15  334  =

6b4b8fc87dc5cb Qiang Liu 2012-02-15  335  	if (sscanf(buf, "%d%d",
6b4b8fc87dc5cb Qiang Liu 2012-02-15  336  				&coalescing_count,
6b4b8fc87dc5cb Qiang Liu 2012-02-15  337  				&coalescing_ticks) !=3D 2) {
6b4b8fc87dc5cb Qiang Liu 2012-02-15  338  		printk(KERN_ERR "fsl-sata: wron=
g parameter format.\n");
6b4b8fc87dc5cb Qiang Liu 2012-02-15  339  		return -EINVAL;
6b4b8fc87dc5cb Qiang Liu 2012-02-15  340  	}
6b4b8fc87dc5cb Qiang Liu 2012-02-15  341  =

6b4b8fc87dc5cb Qiang Liu 2012-02-15  342  	fsl_sata_set_irq_coalescing(dev_=
get_drvdata(dev),
6b4b8fc87dc5cb Qiang Liu 2012-02-15  343  			coalescing_count, coalescing_t=
icks);
6b4b8fc87dc5cb Qiang Liu 2012-02-15  344  =

6b4b8fc87dc5cb Qiang Liu 2012-02-15  345  	return strlen(buf);
6b4b8fc87dc5cb Qiang Liu 2012-02-15  346  }
6b4b8fc87dc5cb Qiang Liu 2012-02-15  347  =


:::::: The code at line 333 was first introduced by commit
:::::: 6b4b8fc87dc5cbfcfb5c749dc200906471fb854c sata_fsl: add support for i=
nterrupt coalsecing feature

:::::: TO: Qiang Liu <qiang.liu@freescale.com>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7096335476448726892==--

