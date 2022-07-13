Content-Type: multipart/mixed; boundary="===============5557123038516349954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/target/target_core_device.c:846:47: warning: shift by negative count ('-10')
Date: Wed, 13 Jul 2022 11:02:58 +0800
Message-ID: <202207131039.g45Ubajt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5557123038516349954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/t=
arget/target_core_device.c:846:47: warning: shift by negative count ('-10')=
 [-Wanalyzer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Chaitanya Kulkarni <kch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: 817e8b51eb3d927ce6d56ecf9f48bc3c5b26168b target: pass a block_devic=
e to target_configure_unmap_from_queue
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220712 (https://download.01.org/0day-ci/archi=
ve/20220713/202207131039.g45Ubajt-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D817e8b51eb3d927ce6d56ecf9f48bc3c5b26168b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 817e8b51eb3d927ce6d56ecf9f48bc3c5b26168b
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/target/target_core_device.c: In function 'target_configure_unmap=
_from_queue':
>> drivers/target/target_core_device.c:846:47: warning: shift by negative c=
ount ('-10') [-Wanalyzer-shift-count-negative]
     846 |                 q->limits.max_discard_sectors >> (ilog2(block_si=
ze) - 9);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~=
~~~~~~~~
     'target_configure_unmap_from_queue': events 1-3
       |
       |  842 |         if (!blk_queue_discard(q))
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  846 |                 q->limits.max_discard_sectors >> (ilog2(blo=
ck_size) - 9);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    ~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                          |                                 =
         |
       |      |                          (2) ...to here                    =
         (3) following 'false' branch...
       |
     'target_configure_unmap_from_queue': events 4-5
       |
       |include/asm-generic/bitops/fls.h:17:12:
       |   17 |         if (!x)
       |      |            ^
       |      |            |
       |      |            (4) ...to here
       |      |            (5) following 'true' branch...
       |
     'target_configure_unmap_from_queue': events 6-7
       |
       |drivers/target/target_core_device.c:846:69:
       |  846 |                 q->limits.max_discard_sectors >> (ilog2(blo=
ck_size) - 9);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~
       |      |                                               |            =
         |
       |      |                                               |            =
         (6) ...to here
       |      |                                               (7) shift by =
negative amount here ('-10')
       |

vim +846 drivers/target/target_core_device.c

0fd97ccf45be26 Christoph Hellwig 2012-10-08  830  =

8a9ebe717a133b Mike Christie     2016-01-18  831  /*
8a9ebe717a133b Mike Christie     2016-01-18  832   * Check if the underlyin=
g struct block_device request_queue supports
8a9ebe717a133b Mike Christie     2016-01-18  833   * the QUEUE_FLAG_DISCARD=
 bit for UNMAP/WRITE_SAME in SCSI + TRIM
8a9ebe717a133b Mike Christie     2016-01-18  834   * in ATA and we need to =
set TPE=3D1
8a9ebe717a133b Mike Christie     2016-01-18  835   */
8a9ebe717a133b Mike Christie     2016-01-18  836  bool target_configure_unm=
ap_from_queue(struct se_dev_attrib *attrib,
817e8b51eb3d92 Christoph Hellwig 2022-04-15  837  				       struct block_d=
evice *bdev)
8a9ebe717a133b Mike Christie     2016-01-18  838  {
817e8b51eb3d92 Christoph Hellwig 2022-04-15  839  	struct request_queue *q =
=3D bdev_get_queue(bdev);
817e8b51eb3d92 Christoph Hellwig 2022-04-15  840  	int block_size =3D bdev_=
logical_block_size(bdev);
ea263c7fada4af Mike Christie     2016-06-02  841  =

8a9ebe717a133b Mike Christie     2016-01-18  842  	if (!blk_queue_discard(q=
))
8a9ebe717a133b Mike Christie     2016-01-18  843  		return false;
8a9ebe717a133b Mike Christie     2016-01-18  844  =

ea263c7fada4af Mike Christie     2016-06-02  845  	attrib->max_unmap_lba_co=
unt =3D
ea263c7fada4af Mike Christie     2016-06-02 @846  		q->limits.max_discard_s=
ectors >> (ilog2(block_size) - 9);
8a9ebe717a133b Mike Christie     2016-01-18  847  	/*
8a9ebe717a133b Mike Christie     2016-01-18  848  	 * Currently hardcoded t=
o 1 in Linux/SCSI code..
8a9ebe717a133b Mike Christie     2016-01-18  849  	 */
8a9ebe717a133b Mike Christie     2016-01-18  850  	attrib->max_unmap_block_=
desc_count =3D 1;
8a9ebe717a133b Mike Christie     2016-01-18  851  	attrib->unmap_granularit=
y =3D q->limits.discard_granularity / block_size;
8a9ebe717a133b Mike Christie     2016-01-18  852  	attrib->unmap_granularit=
y_alignment =3D q->limits.discard_alignment /
8a9ebe717a133b Mike Christie     2016-01-18  853  								block_size;
8a9ebe717a133b Mike Christie     2016-01-18  854  	return true;
8a9ebe717a133b Mike Christie     2016-01-18  855  }
8a9ebe717a133b Mike Christie     2016-01-18  856  EXPORT_SYMBOL(target_conf=
igure_unmap_from_queue);
8a9ebe717a133b Mike Christie     2016-01-18  857  =


:::::: The code at line 846 was first introduced by commit
:::::: ea263c7fada4af8ec7fe5fcfd6e7d7705a89351b target: Fix max_unmap_lba_c=
ount calc overflow

:::::: TO: Mike Christie <mchristi@redhat.com>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5557123038516349954==--

