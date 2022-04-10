Content-Type: multipart/mixed; boundary="===============8819569645820173379=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/6] scsi_cmnd: reinstate support for cmd_len > 32
Date: Mon, 11 Apr 2022 04:50:23 +0800
Message-ID: <202204110445.hwqhxq5Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8819569645820173379==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220410173652.313016-2-dgilbert@interlog.com>
References: <20220410173652.313016-2-dgilbert@interlog.com>
TO: Douglas Gilbert <dgilbert@interlog.com>
TO: linux-scsi(a)vger.kernel.org
CC: martin.petersen(a)oracle.com
CC: jejb(a)linux.vnet.ibm.com
CC: hare(a)suse.de
CC: bvanassche(a)acm.org
CC: hch(a)lst.de

Hi Douglas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next v5.18-rc1 next-20220408]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Gilbert/scsi=
-fix-scsi_cmd-cmd_len/20220411-014001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220411/202204110445.hwqhxq5Y-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/ata/libata-scsi.c:2879 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 20

Old smatch warnings:
drivers/ata/libata-scsi.c:2880 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 22
drivers/ata/libata-scsi.c:2881 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 16
drivers/ata/libata-scsi.c:2888 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 21
drivers/ata/libata-scsi.c:2889 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 23
drivers/ata/libata-scsi.c:2890 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 19
drivers/ata/libata-scsi.c:2891 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 18
drivers/ata/libata-scsi.c:2892 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 17
drivers/ata/libata-scsi.c:2893 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 24
drivers/ata/libata-scsi.c:2894 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 25
drivers/ata/libata-scsi.c:2895 ata_scsi_pass_thru() error: buffer overflow =
'cdb' 16 <=3D 28

vim +/cdb +2879 drivers/ata/libata-scsi.c

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2780=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2781=
  /**
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2782=
   *	ata_scsi_pass_thru - convert ATA pass-thru CDB to taskfile
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2783=
   *	@qc: command structure to be initialized
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2784=
   *
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2785=
   *	Handles either 12, 16, or 32-byte versions of the CDB.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2786=
   *
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2787=
   *	RETURNS:
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2788=
   *	Zero on success, non-zero on failure.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2789=
   */
ad706991f4f0d1 drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2790=
  static unsigned int ata_scsi_pass_thru(struct ata_queued_cmd *qc)
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2791=
  {
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2792=
  	struct ata_taskfile *tf =3D &(qc->tf);
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2793=
  	struct scsi_cmnd *scmd =3D qc->scsicmd;
f79d409fae879d drivers/scsi/libata-scsi.c Alan Cox         2006-05-22  2794=
  	struct ata_device *dev =3D qc->dev;
ad706991f4f0d1 drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2795=
  	const u8 *cdb =3D scmd->cmnd;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2796=
  	u16 fp;
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2797=
  	u16 cdb_offset =3D 0;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2798=
  =

b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2799=
  	/* 7Fh variable length cmd means a ata pass-thru(32) */
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2800=
  	if (cdb[0] =3D=3D VARIABLE_LENGTH_CMD)
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2801=
  		cdb_offset =3D 9;
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2802=
  =

b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2803=
  	tf->protocol =3D ata_scsi_map_proto(cdb[1 + cdb_offset]);
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2804=
  	if (tf->protocol =3D=3D ATA_PROT_UNKNOWN) {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2805=
  		fp =3D 1;
9a40525788a1b6 drivers/scsi/libata-scsi.c Tejun Heo        2005-12-02  2806=
  		goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2807=
  	}
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2808=
  =

5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2809=
  	if ((cdb[2 + cdb_offset] & 0x3) =3D=3D 0) {
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2810=
  		/*
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2811=
  		 * When T_LENGTH is zero (No data is transferred), dir should
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2812=
  		 * be DMA_NONE.
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2813=
  		 */
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2814=
  		if (scmd->sc_data_direction !=3D DMA_NONE) {
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2815=
  			fp =3D 2 + cdb_offset;
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2816=
  			goto invalid_fld;
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2817=
  		}
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2818=
  =

5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2819=
  		if (ata_is_ncq(tf->protocol))
5b844b63ddfb65 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-07-14  2820=
  			tf->protocol =3D ATA_PROT_NCQ_NODATA;
5da5231bb47864 drivers/ata/libata-scsi.c  George Kennedy   2021-12-14  2821=
  	}
5b844b63ddfb65 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-07-14  2822=
  =

5f8e7f17f6f547 drivers/ata/libata-scsi.c  Vinayak Kale     2015-10-27  2823=
  	/* enable LBA */
5f8e7f17f6f547 drivers/ata/libata-scsi.c  Vinayak Kale     2015-10-27  2824=
  	tf->flags |=3D ATA_TFLAG_LBA;
5f8e7f17f6f547 drivers/ata/libata-scsi.c  Vinayak Kale     2015-10-27  2825=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2826=
  	/*
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2827=
  	 * 12 and 16 byte CDBs use different offsets to
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2828=
  	 * provide the various register values.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2829=
  	 */
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2830=
  	switch (cdb[0]) {
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2831=
  	case ATA_16:
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2832=
  		/*
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2833=
  		 * 16-byte CDB - may contain extended commands.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2834=
  		 *
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2835=
  		 * If that is the case, copy the upper byte register values.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2836=
  		 */
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2837=
  		if (cdb[1] & 0x01) {
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2838=
  			tf->hob_feature =3D cdb[3];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2839=
  			tf->hob_nsect =3D cdb[5];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2840=
  			tf->hob_lbal =3D cdb[7];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2841=
  			tf->hob_lbam =3D cdb[9];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2842=
  			tf->hob_lbah =3D cdb[11];
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2843=
  			tf->flags |=3D ATA_TFLAG_LBA48;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2844=
  		} else
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2845=
  			tf->flags &=3D ~ATA_TFLAG_LBA48;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2846=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2847=
  		/*
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2848=
  		 * Always copy low byte, device and command registers.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2849=
  		 */
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2850=
  		tf->feature =3D cdb[4];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2851=
  		tf->nsect =3D cdb[6];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2852=
  		tf->lbal =3D cdb[8];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2853=
  		tf->lbam =3D cdb[10];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2854=
  		tf->lbah =3D cdb[12];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2855=
  		tf->device =3D cdb[13];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2856=
  		tf->command =3D cdb[14];
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2857=
  		break;
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2858=
  	case ATA_12:
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2859=
  		/*
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2860=
  		 * 12-byte CDB - incapable of extended commands.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2861=
  		 */
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2862=
  		tf->flags &=3D ~ATA_TFLAG_LBA48;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2863=
  =

542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2864=
  		tf->feature =3D cdb[3];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2865=
  		tf->nsect =3D cdb[4];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2866=
  		tf->lbal =3D cdb[5];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2867=
  		tf->lbam =3D cdb[6];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2868=
  		tf->lbah =3D cdb[7];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2869=
  		tf->device =3D cdb[8];
542b1444c5639e drivers/ata/libata-scsi.c  Tejun Heo        2006-12-17  2870=
  		tf->command =3D cdb[9];
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2871=
  		break;
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2872=
  	default:
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2873=
  		/*
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2874=
  		 * 32-byte CDB - may contain extended command fields.
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2875=
  		 *
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2876=
  		 * If that is the case, copy the upper byte register values.
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2877=
  		 */
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2878=
  		if (cdb[10] & 0x01) {
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24 @2879=
  			tf->hob_feature =3D cdb[20];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2880=
  			tf->hob_nsect =3D cdb[22];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2881=
  			tf->hob_lbal =3D cdb[16];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2882=
  			tf->hob_lbam =3D cdb[15];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2883=
  			tf->hob_lbah =3D cdb[14];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2884=
  			tf->flags |=3D ATA_TFLAG_LBA48;
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2885=
  		} else
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2886=
  			tf->flags &=3D ~ATA_TFLAG_LBA48;
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2887=
  =

b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2888=
  		tf->feature =3D cdb[21];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2889=
  		tf->nsect =3D cdb[23];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2890=
  		tf->lbal =3D cdb[19];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2891=
  		tf->lbam =3D cdb[18];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2892=
  		tf->lbah =3D cdb[17];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2893=
  		tf->device =3D cdb[24];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2894=
  		tf->command =3D cdb[25];
b1ffbf854e0887 drivers/ata/libata-scsi.c  Minwoo Im        2017-06-24  2895=
  		tf->auxiliary =3D get_unaligned_be32(&cdb[28]);
59b0040475ee5d drivers/ata/libata-scsi.c  Sergey Shtylyov  2022-02-14  2896=
  		break;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2897=
  	}
fa4453c4c94a61 drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2898=
  =

179b310ae77ea4 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-07-14  2899=
  	/* For NCQ commands copy the tag value */
179b310ae77ea4 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-07-14  2900=
  	if (ata_is_ncq(tf->protocol))
4e5b6260cc9ba8 drivers/ata/libata-scsi.c  Jens Axboe       2018-05-11  2901=
  		tf->nsect =3D qc->hw_tag << 3;
ee7fb331c3ac64 drivers/ata/libata-scsi.c  Vinayak Kale     2015-10-27  2902=
  =

fa4453c4c94a61 drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2903=
  	/* enforce correct master/slave bit */
fa4453c4c94a61 drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2904=
  	tf->device =3D dev->devno ?
dcc2d1e7f0acf7 drivers/scsi/libata-scsi.c Mark Lord        2005-11-13  2905=
  		tf->device | ATA_DEV1 : tf->device & ~ATA_DEV1;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  2906=
  =

bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2907=
  	switch (tf->command) {
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2908=
  	/* READ/WRITE LONG use a non-standard sect_size */
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2909=
  	case ATA_CMD_READ_LONG:
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2910=
  	case ATA_CMD_READ_LONG_ONCE:
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2911=
  	case ATA_CMD_WRITE_LONG:
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2912=
  	case ATA_CMD_WRITE_LONG_ONCE:
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2913=
  		if (tf->protocol !=3D ATA_PROT_PIO || tf->nsect !=3D 1) {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2914=
  			fp =3D 1;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2915=
  			goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2916=
  		}
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2917=
  		qc->sect_size =3D scsi_bufflen(scmd);
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2918=
  		break;
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2919=
  =

295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2920=
  	/* commands using reported Logical Block size (e.g. 512 or 4K) */
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2921=
  	case ATA_CMD_CFA_WRITE_NE:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2922=
  	case ATA_CMD_CFA_TRANS_SECT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2923=
  	case ATA_CMD_CFA_WRITE_MULT_NE:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2924=
  	/* XXX: case ATA_CMD_CFA_WRITE_SECTORS_WITHOUT_ERASE: */
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2925=
  	case ATA_CMD_READ:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2926=
  	case ATA_CMD_READ_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2927=
  	case ATA_CMD_READ_QUEUED:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2928=
  	/* XXX: case ATA_CMD_READ_QUEUED_EXT: */
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2929=
  	case ATA_CMD_FPDMA_READ:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2930=
  	case ATA_CMD_READ_MULTI:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2931=
  	case ATA_CMD_READ_MULTI_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2932=
  	case ATA_CMD_PIO_READ:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2933=
  	case ATA_CMD_PIO_READ_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2934=
  	case ATA_CMD_READ_STREAM_DMA_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2935=
  	case ATA_CMD_READ_STREAM_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2936=
  	case ATA_CMD_VERIFY:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2937=
  	case ATA_CMD_VERIFY_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2938=
  	case ATA_CMD_WRITE:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2939=
  	case ATA_CMD_WRITE_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2940=
  	case ATA_CMD_WRITE_FUA_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2941=
  	case ATA_CMD_WRITE_QUEUED:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2942=
  	case ATA_CMD_WRITE_QUEUED_FUA_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2943=
  	case ATA_CMD_FPDMA_WRITE:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2944=
  	case ATA_CMD_WRITE_MULTI:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2945=
  	case ATA_CMD_WRITE_MULTI_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2946=
  	case ATA_CMD_WRITE_MULTI_FUA_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2947=
  	case ATA_CMD_PIO_WRITE:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2948=
  	case ATA_CMD_PIO_WRITE_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2949=
  	case ATA_CMD_WRITE_STREAM_DMA_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2950=
  	case ATA_CMD_WRITE_STREAM_EXT:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2951=
  		qc->sect_size =3D scmd->device->sector_size;
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2952=
  		break;
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2953=
  =

295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2954=
  	/* Everything else uses 512 byte "sectors" */
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2955=
  	default:
295124dce4ddfd drivers/ata/libata-scsi.c  Grant Grundler   2010-08-17  2956=
  		qc->sect_size =3D ATA_SECT_SIZE;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2957=
  	}
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2958=
  =

bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2959=
  	/*
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2960=
  	 * Set flags so that all registers will be written, pass on
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2961=
  	 * write indication (used for PIO/DMA setup), result TF is
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2962=
  	 * copied back and we don't whine too much about its failure.
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2963=
  	 */
bc496ed00ab141 drivers/ata/libata-scsi.c  Douglas Gilbert  2010-02-01  2964=
  	tf->flags |=3D ATA_TFLAG_ISADDR | ATA_TFLAG_DEVICE;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2965=
  	if (scmd->sc_data_direction =3D=3D DMA_TO_DEVICE)
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2966=
  		tf->flags |=3D ATA_TFLAG_WRITE;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2967=
  =

bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2968=
  	qc->flags |=3D ATA_QCFLAG_RESULT_TF | ATA_QCFLAG_QUIET;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2969=
  =

bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2970=
  	/*
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2971=
  	 * Set transfer length.
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2972=
  	 *
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2973=
  	 * TODO: find out if we need to do more here to
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2974=
  	 *       cover scatter/gather case.
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2975=
  	 */
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2976=
  	ata_qc_set_pc_nbytes(qc);
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2977=
  =

bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2978=
  	/* We may not issue DMA commands if no DMA mode is set */
6ac586f2e71692 drivers/ata/libata-scsi.c  Reimar D=C3=B6ffinger 2021-10-12 =
 2979  	if (tf->protocol =3D=3D ATA_PROT_DMA && !ata_dma_enabled(dev)) {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2980=
  		fp =3D 1;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2981=
  		goto invalid_fld;
2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2982=
  	}
2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2983=
  =

2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2984=
  	/* We may not issue NCQ commands to devices not supporting NCQ */
2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2985=
  	if (ata_is_ncq(tf->protocol) && !ata_ncq_enabled(dev)) {
2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2986=
  		fp =3D 1;
2c1ec6fda2d070 drivers/ata/libata-scsi.c  Eric Biggers     2018-02-03  2987=
  		goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2988=
  	}
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  2989=
  =

1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2990=
  	/* sanity check for pio multi commands */
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2991=
  	if ((cdb[1] & 0xe0) && !is_multi_taskfile(tf)) {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2992=
  		fp =3D 1;
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2993=
  		goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  2994=
  	}
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2995=
  =

1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2996=
  	if (is_multi_taskfile(tf)) {
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2997=
  		unsigned int multi_count =3D 1 << (cdb[1] >> 5);
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2998=
  =

1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  2999=
  		/* compare the passed through multi_count
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3000=
  		 * with the cached multi_count of libata
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3001=
  		 */
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3002=
  		if (multi_count !=3D dev->multi_count)
a9a79dfec23956 drivers/ata/libata-scsi.c  Joe Perches      2011-04-15  3003=
  			ata_dev_warn(dev, "invalid multi_count %u ignored\n",
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3004=
  				     multi_count);
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3005=
  	}
1dce589c38c36a drivers/ata/libata-scsi.c  Albert Lee       2007-06-07  3006=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3007=
  	/*
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3008=
  	 * Filter SET_FEATURES - XFER MODE command -- otherwise,
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3009=
  	 * SET_FEATURES - XFER MODE must be preceded/succeeded
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3010=
  	 * by an update to hardware-specific registers for each
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3011=
  	 * controller (i.e. the reason for ->set_piomode(),
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3012=
  	 * ->set_dmamode(), and ->post_set_mode() hooks).
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3013=
  	 */
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3014=
  	if (tf->command =3D=3D ATA_CMD_SET_FEATURES &&
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3015=
  	    tf->feature =3D=3D SETFEATURES_XFER) {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3016=
  		fp =3D (cdb[0] =3D=3D ATA_16) ? 4 : 3;
9a40525788a1b6 drivers/scsi/libata-scsi.c Tejun Heo        2005-12-02  3017=
  		goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3018=
  	}
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3019=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3020=
  	/*
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3021=
  	 * Filter TPM commands by default. These provide an
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3022=
  	 * essentially uncontrolled encrypted "back door" between
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3023=
  	 * applications and the disk. Set libata.allow_tpm=3D1 if you
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3024=
  	 * have a real reason for wanting to use them. This ensures
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3025=
  	 * that installed software cannot easily mess stuff up without
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3026=
  	 * user intent. DVR type users will probably ship with this enabled
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3027=
  	 * for movie content management.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3028=
  	 *
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3029=
  	 * Note that for ATA8 we can issue a DCS change and DCS freeze lock
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3030=
  	 * for this and should do in future but that it is not sufficient as
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3031=
  	 * DCS is an optional feature set. Thus we also do the software filter
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3032=
  	 * so that we comply with the TC consortium stated goal that the user
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3033=
  	 * can turn off TC features of their system.
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3034=
  	 */
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3035=
  	if (tf->command >=3D 0x5C && tf->command <=3D 0x5F && !libata_allow_tpm)=
 {
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3036=
  		fp =3D (cdb[0] =3D=3D ATA_16) ? 14 : 9;
bd30add88cea83 drivers/ata/libata-scsi.c  Tejun Heo        2009-09-03  3037=
  		goto invalid_fld;
bcfc867d467c98 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3038=
  	}
e61e067227bc76 drivers/scsi/libata-scsi.c Tejun Heo        2006-05-15  3039=
  =

b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3040=
  	return 0;
9a40525788a1b6 drivers/scsi/libata-scsi.c Tejun Heo        2005-12-02  3041=
  =

9a40525788a1b6 drivers/scsi/libata-scsi.c Tejun Heo        2005-12-02  3042=
   invalid_fld:
0df10b84af88a4 drivers/ata/libata-scsi.c  Hannes Reinecke  2016-04-04  3043=
  	ata_scsi_set_invalid_field(dev, scmd, fp, 0xff);
9a40525788a1b6 drivers/scsi/libata-scsi.c Tejun Heo        2005-12-02  3044=
  	return 1;
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3045=
  }
b095518ef51c37 drivers/scsi/libata-scsi.c Jeff Garzik      2005-05-12  3046=
  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8819569645820173379==--

