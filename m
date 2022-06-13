Content-Type: multipart/mixed; boundary="===============3853662490303528339=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/libata-scsi.c:661:30: warning: dereference of NULL '0' [CWE-476]
Date: Tue, 14 Jun 2022 06:44:16 +0800
Message-ID: <202206140600.gXM82Q4L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3853662490303528339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/a=
ta/libata-scsi.c:661:30: warning: dereference of NULL '0' [CWE-476] [-Wanal=
yzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Garry <john.garry@huawei.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 4f1a22ee7b576a38dc5705837c9b0de0c7b5b064 libata: Improve ATA queued=
 command allocation
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220614/202206140600.gXM82Q4L-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4f1a22ee7b576a38dc5705837c9b0de0c7b5b064
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4f1a22ee7b576a38dc5705837c9b0de0c7b5b064
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
       |      |            (8) following 'false' branch...
       |
     'ata_scsi_qc_new': events 9-10
       |
       |drivers/ata/libata-scsi.c:661:30:
       |  661 |         qc->tag =3D qc->hw_tag =3D tag;
       |      |                   ~~~~~~~~~~~^~~~~
       |      |                              |
       |      |                              (9) ...to here
       |......
       |  665 |         ata_qc_reinit(qc);
       |      |         ~~~~~~~~~~~~~~~~~     =

       |      |         |
       |      |         (10) calling 'ata_qc_reinit' from 'ata_scsi_qc_new'
       |
       +--> 'ata_qc_reinit': events 11-12
              |
              |include/linux/libata.h:1781:20:
              | 1781 | static inline void ata_qc_reinit(struct ata_queued_c=
md *qc)
              |      |                    ^~~~~~~~~~~~~
              |      |                    |
              |      |                    (11) entry to 'ata_qc_reinit'
              |......
              | 1785 |         qc->flags =3D 0;
              |      |         ~~~~~~~~~~~~~
              |      |                   |
              |      |                   (12) dereference of NULL 'qc'
              |
   include/linux/libata.h:1787:23: warning: dereference of NULL 'qc' [CWE-4=
76] [-Wanalyzer-null-dereference]
    1787 |         qc->cursg_ofs =3D 0;
         |         ~~~~~~~~~~~~~~^~~
     'ata_scsi_qc_new': events 1-5
       |
       |drivers/ata/libata-scsi.c:638:31:
       |  638 | static struct ata_queued_cmd *ata_scsi_qc_new(struct ata_de=
vice *dev,
       |      |                               ^~~~~~~~~~~~~~~
       |      |                               |
       |      |                               (1) entry to 'ata_scsi_qc_new'
       |......
       |  645 |         if (unlikely(ap->pflags & ATA_PFLAG_FROZEN))
       |      |            ~                   =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  648 |         if (ap->flags & ATA_FLAG_SAS_HOST) {
       |      |             ~~~~~~~~~          =

       |      |               |
       |      |               (3) ...to here
       |......
       |  653 |                 if (WARN_ON_ONCE(cmd->budget_token >=3D ATA=
_MAX_QUEUE))
       |      |                    ~           =

       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       |  660 |         qc =3D __ata_qc_from_tag(ap, tag);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (5) ...to here
       |
     'ata_scsi_qc_new': events 6-8
       |
       |include/linux/libata.h:1553:36:
       | 1553 |         return tag < ATA_MAX_QUEUE || ata_tag_internal(tag);
       |      |                ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (6) following 'false' br=
anch...
       |      |                                    (7) ...to here
       |......
       | 1741 |         if (ata_tag_valid(tag))
       |      |            ~                        =

       |      |            |
       |      |            (8) following 'false' branch...
       |
     'ata_scsi_qc_new': events 9-10
       |
       |drivers/ata/libata-scsi.c:661:30:
       |  661 |         qc->tag =3D qc->hw_tag =3D tag;
       |      |                   ~~~~~~~~~~~^~~~~
       |      |                              |
       |      |                              (9) ...to here
       |......
       |  665 |         ata_qc_reinit(qc);
       |      |         ~~~~~~~~~~~~~~~~~     =

       |      |         |
       |      |         (10) calling 'ata_qc_reinit' from 'ata_scsi_qc_new'
       |
       +--> 'ata_qc_reinit': events 11-12
              |
              |include/linux/libata.h:1781:20:
              | 1781 | static inline void ata_qc_reinit(struct ata_queued_c=
md *qc)
              |      |                    ^~~~~~~~~~~~~
              |      |                    |
              |      |                    (11) entry to 'ata_qc_reinit'
              |......
              | 1787 |         qc->cursg_ofs =3D 0;
              |      |         ~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (12) dereference of NULL 'qc'
              |
   include/linux/libata.h: In function 'ata_scsi_qc_new':
>> drivers/ata/libata-scsi.c:661:30: warning: dereference of NULL '0' [CWE-=
476] [-Wanalyzer-null-dereference]
     661 |         qc->tag =3D qc->hw_tag =3D tag;
         |                   ~~~~~~~~~~~^~~~~
     'ata_scsi_qc_new': events 1-4
       |
       |  645 |         if (unlikely(ap->pflags & ATA_PFLAG_FROZEN))
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |......
       |  648 |         if (ap->flags & ATA_FLAG_SAS_HOST) {
       |      |             ~~~~~~~~~
       |      |               |
       |      |               (2) ...to here
       |......
       |  653 |                 if (WARN_ON_ONCE(cmd->budget_token >=3D ATA=
_MAX_QUEUE))
       |      |                    ~
       |      |                    |
       |      |                    (3) following 'false' branch...
       |......
       |  660 |         qc =3D __ata_qc_from_tag(ap, tag);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (4) ...to here
       |
     'ata_scsi_qc_new': events 5-7
       |
       |include/linux/libata.h:1553:36:
       | 1553 |         return tag < ATA_MAX_QUEUE || ata_tag_internal(tag);
       |      |                ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                    |
       |      |                                    (5) following 'false' br=
anch...
       |      |                                    (6) ...to here
       |......
       | 1741 |         if (ata_tag_valid(tag))
       |      |            ~                        =

       |      |            |
       |      |            (7) following 'false' branch...
       |
     'ata_scsi_qc_new': events 8-9
       |
       |drivers/ata/libata-scsi.c:661:30:
       |  661 |         qc->tag =3D qc->hw_tag =3D tag;
       |      |                   ~~~~~~~~~~~^~~~~
       |      |                              |
       |      |                              (8) ...to here
       |      |                              (9) dereference of NULL '<unkn=
own>'
       |

vim +/0 +661 drivers/ata/libata-scsi.c

^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  618  =

^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  619  =
/**
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  620  =
 *	ata_scsi_qc_new - acquire new ata_queued_cmd reference
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  621  =
 *	@dev: ATA device to which the new command is attached
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  622  =
 *	@cmd: SCSI command that originated this ATA command
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  623  =
 *
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  624  =
 *	Obtain a reference to an unused ata_queued_cmd structure,
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  625  =
 *	which is the basic libata structure representing a single
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  626  =
 *	ATA command sent to the hardware.
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  627  =
 *
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  628  =
 *	If a command was available, fill in the SCSI-specific
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  629  =
 *	portions of the structure with information on the
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  630  =
 *	current command.
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  631  =
 *
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  632  =
 *	LOCKING:
cca3974e48607c drivers/ata/libata-scsi.c  Jeff Garzik     2006-08-24  633  =
 *	spin_lock_irqsave(host lock)
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  634  =
 *
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  635  =
 *	RETURNS:
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  636  =
 *	Command allocated, or %NULL if none available.
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  637  =
 */
7102d230d6e8cf drivers/ata/libata-scsi.c  Adrian Bunk     2007-01-04  638  =
static struct ata_queued_cmd *ata_scsi_qc_new(struct ata_device *dev,
b27dcfb0670ea7 drivers/ata/libata-scsi.c  Jeff Garzik     2010-11-17  639  =
					      struct scsi_cmnd *cmd)
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  640  {
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  641  =
	struct ata_port *ap =3D dev->link->ap;
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  642  =
	struct ata_queued_cmd *qc;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  643  =
	int tag;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  644  =

4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  645  =
	if (unlikely(ap->pflags & ATA_PFLAG_FROZEN))
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  646  =
		goto fail;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  647  =

4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  648  =
	if (ap->flags & ATA_FLAG_SAS_HOST) {
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  649  =
		/*
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  650  =
		 * SAS hosts may queue > ATA_MAX_QUEUE commands so use
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  651  =
		 * unique per-device budget token as a tag.
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  652  =
		 */
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  653  =
		if (WARN_ON_ONCE(cmd->budget_token >=3D ATA_MAX_QUEUE))
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  654  =
			goto fail;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  655  =
		tag =3D cmd->budget_token;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  656  =
	} else {
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  657  =
		tag =3D scsi_cmd_to_rq(cmd)->tag;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  658  =
	}
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  659  =

4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  660  =
	qc =3D __ata_qc_from_tag(ap, tag);
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08 @661  =
	qc->tag =3D qc->hw_tag =3D tag;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  662  =
	qc->ap =3D ap;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  663  =
	qc->dev =3D dev;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  664  =

4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  665  =
	ata_qc_reinit(qc);
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  666  =

^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  667  =
	qc->scsicmd =3D cmd;
58bf201dfc032e drivers/ata/libata-scsi.c  Bart Van Assche 2021-10-07  668  =
	qc->scsidone =3D scsi_done;
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  669  =

ff2aeb1eb64c8a drivers/ata/libata-scsi.c  Tejun Heo       2007-12-05  670  =
	qc->sg =3D scsi_sglist(cmd);
7120165cf31e98 drivers/ata/libata-scsi.c  Boaz Harrosh    2007-09-18  671  =
	qc->n_elem =3D scsi_sg_count(cmd);
7eb49509dd6b2a drivers/ata/libata-scsi.c  Damien Le Moal  2018-05-09  672  =

c8329cd55bf4f2 drivers/ata/libata-scsi.c  Bart Van Assche 2021-08-09  673  =
	if (scsi_cmd_to_rq(cmd)->rq_flags & RQF_QUIET)
7eb49509dd6b2a drivers/ata/libata-scsi.c  Damien Le Moal  2018-05-09  674  =
		qc->flags |=3D ATA_QCFLAG_QUIET;
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  675  =

^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  676  =
	return qc;
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  677  =

4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  678  =
fail:
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  679  =
	set_host_byte(cmd, DID_OK);
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  680  =
	set_status_byte(cmd, SAM_STAT_TASK_SET_FULL);
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  681  =
	scsi_done(cmd);
4f1a22ee7b576a drivers/ata/libata-scsi.c  John Garry      2022-04-08  682  =
	return NULL;
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  683  }
^1da177e4c3f41 drivers/scsi/libata-scsi.c Linus Torvalds  2005-04-16  684  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3853662490303528339==--

