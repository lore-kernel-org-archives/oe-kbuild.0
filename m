Content-Type: multipart/mixed; boundary="===============3704516226458727787=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/scsi_error.c:1008:30: warning: use of uninitialized value '*scmd.resid_len' [CWE-457]
Date: Sat, 03 Sep 2022 12:18:57 +0800
Message-ID: <202209031226.2Y38146k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3704516226458727787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/s=
csi/scsi_error.c:1008:30: warning: use of uninitialized value '*scmd.resid_=
len' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bart Van Assche <bvanassche@acm.org>
CC: John Garry <john.garry@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d895ec7938c431fe61a731939da76a6461bc6133
commit: a9a4ea1166d640d1b397f24afc1cd7e96c46cd03 scsi: core: Move the resid=
_len field from struct scsi_request to struct scsi_cmnd
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220903/202209031226.2Y38146k-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da9a4ea1166d640d1b397f24afc1cd7e96c46cd03
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a9a4ea1166d640d1b397f24afc1cd7e96c46cd03
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
                   'scsi_eh_get_sense': events 14-15
                     |
                     | 1268 |                 if ((scmd->eh_eflags & SCSI_E=
H_ABORT_SCHEDULED) ||
                     |      |                    ~ ~~~~^~~~~~~~~~~
                     |      |                    |     |
                     |      |                    |     (14) ...to here
                     |      |                    (15) following 'false' bra=
nch...
                     |
                   'scsi_eh_get_sense': event 16
                     |
                     |drivers/scsi/scsi_priv.h:27:17:
                     |   27 |         (((scmd)->sense_buffer[0] & 0x70) =3D=
=3D 0x70)
                     |      |           ~~~~~~^~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (16) ...to here
   drivers/scsi/scsi_error.c:1269:21: note: in expansion of macro 'SCSI_SEN=
SE_VALID'
                     | 1269 |                     SCSI_SENSE_VALID(scmd))
                     |      |                     ^~~~~~~~~~~~~~~~
                     |
                   'scsi_eh_get_sense': events 17-20
                     |
                     | 1268 |                 if ((scmd->eh_eflags & SCSI_E=
H_ABORT_SCHEDULED) ||
                     |......
                     | 1272 |                 shost =3D scmd->device->host;
                     |      |                         ~~~~~~~~~~~~         =
                    =

                     |      |                             |
                     |      |                             (18) ...to here
                     | 1273 |                 if (scsi_host_eh_past_deadlin=
e(shost)) {
                     |      |                    ~                         =
                    =

                     |      |                    |
                     |      |                    (19) following 'false' bra=
nch...
                     |......
                     | 1280 |                 if (!scsi_status_is_check_con=
dition(scmd->result))
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (20) ...to here
                     |
                   'scsi_eh_get_sense': events 21-22
                     |
                     |include/scsi/scsi.h:76:12:
                     |   76 |         if (status < 0)
                     |      |            ^
                     |      |            |
                     |      |            (21) following 'false' branch...
                     |   77 |                 return false;
                     |   78 |         status &=3D 0xfe;
                     |      |         ~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (22) ...to here
                     |
                   'scsi_eh_get_sense': events 23-25
                     |
                     |drivers/scsi/scsi_error.c:1280:20:
                     | 1280 |                 if (!scsi_status_is_check_con=
dition(scmd->result))
                     |      |                    ^
                     |      |                    |
                     |      |                    (23) following 'false' bra=
nch...
                     |......
                     | 1292 |                 rtn =3D scsi_request_sense(sc=
md);
                     |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (24) ...to here
                     |      |                       (25) calling 'scsi_requ=
est_sense' from 'scsi_eh_get_sense'
                     |
                     +--> 'scsi_request_sense': events 26-27
                            |
                            | 1202 | static enum scsi_disposition scsi_requ=
est_sense(struct scsi_cmnd *scmd)
                            |      |                              ^~~~~~~~~=
~~~~~~~~~
                            |      |                              |
                            |      |                              (26) entr=
y to 'scsi_request_sense'
                            | 1203 | {
                            | 1204 |         return scsi_send_eh_cmnd(scmd,=
 NULL, 0, scmd->device->eh_timeout, ~0);
                            |      |                ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (27) calling 'scsi_send=
_eh_cmnd' from 'scsi_request_sense'
                            |
                            +--> 'scsi_send_eh_cmnd': events 28-29
                                   |
                                   | 1093 | static enum scsi_disposition sc=
si_send_eh_cmnd(struct scsi_cmnd *scmd,
                                   |      |                              ^~=
~~~~~~~~~~~~~~~
                                   |      |                              |
                                   |      |                              (2=
8) entry to 'scsi_send_eh_cmnd'
                                   |......
                                   | 1105 |         scsi_eh_prep_cmnd(scmd,=
 &ses, cmnd, cmnd_size, sense_bytes);
                                   |      |         ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |         |
                                   |      |         (29) calling 'scsi_eh_p=
rep_cmnd' from 'scsi_send_eh_cmnd'
                                   |
                                   +--> 'scsi_eh_prep_cmnd': events 30-31
                                          |
                                          |  992 | void scsi_eh_prep_cmnd(s=
truct scsi_cmnd *scmd, struct scsi_eh_save *ses,
                                          |      |      ^~~~~~~~~~~~~~~~~
                                          |      |      |
                                          |      |      (30) entry to 'scsi=
_eh_prep_cmnd'
                                          |......
                                          | 1007 |         ses->result =3D =
scmd->result;
                                          |      |                       ~~=
~~~~~~~~~~
                                          |      |                         =
  |
                                          |      |                         =
  (31) use of uninitialized value '*scmd.result' here
                                          |
>> drivers/scsi/scsi_error.c:1008:30: warning: use of uninitialized value '=
*scmd.resid_len' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1008 |         ses->resid_len =3D scmd->resid_len;
         |                          ~~~~^~~~~~~~~~~
     'scsi_error_handler': events 1-6
       |
       | 2222 | int scsi_error_handler(void *data)
       |      |     ^~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'scsi_error_handler'
       |......
       | 2240 |                 if (kthread_should_stop())
       |      |                    ~
       |      |                    |
       |      |                    (2) following 'false' branch...
       |......
       | 2243 |                 if ((shost->host_failed =3D=3D 0 && shost->=
host_eh_scheduled =3D=3D 0) ||
       |      |                      ~~~~~~~~~~~~~~~~~~
       |      |                           |
       |      |                           (3) ...to here
       |......
       | 2274 |                 if (shost->transportt->eh_strategy_handler)
       |      |                    ~
       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       | 2277 |                         scsi_unjam_host(shost);
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (5) ...to here
       |      |                         (6) calling 'scsi_unjam_host' from =
'scsi_error_handler'
       |
       +--> 'scsi_unjam_host': event 7
              |
              | 2192 | static void scsi_unjam_host(struct Scsi_Host *shost)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'scsi_unjam_host'
              |
            'scsi_unjam_host': event 8
              |
              | 2195 |         LIST_HEAD(eh_work_q);
              |      |                   ^~~~~~~~~
              |      |                   |
              |      |                   (8) region created on stack here
   include/linux/list.h:26:26: note: in definition of macro 'LIST_HEAD'
              |   26 |         struct list_head name =3D LIST_HEAD_INIT(nam=
e)
              |      |                          ^~~~
              |
            'scsi_unjam_host': event 9
              |
              |  490 |         if (!list_empty(list)) {
              |      |            ^
              |      |            |
              |      |            (9) following 'false' branch...
              |
            'scsi_unjam_host': events 10-11
              |
              |drivers/scsi/scsi_error.c:2200:9:
              | 2200 |         spin_unlock_irqrestore(shost->host_lock, fla=
gs);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
              |      |         |
              |      |         (10) ...to here
              |......
              | 2204 |         if (!scsi_eh_get_sense(&eh_work_q, &eh_done_=
q))
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
              |      |              |
              |      |              (11) calling 'scsi_eh_get_sense' from '=
scsi_unjam_host'
              |
              +--> 'scsi_eh_get_sense': event 12
                     |
                     | 1256 | int scsi_eh_get_sense(struct list_head *work_=
q,
                     |      |     ^~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (12) entry to 'scsi_eh_get_sense'
                     |
                   'scsi_eh_get_sense': event 13
                     |
                     |include/linux/list.h:727:14:
                     |  727 |              !list_entry_is_head(pos, head, m=
ember);                    \
                     |      |              ^
                     |      |              |
                     |      |              (13) following 'true' branch...
   drivers/scsi/scsi_error.c:1267:9: note: in expansion of macro 'list_for_=
each_entry_safe'
                     | 1267 |         list_for_each_entry_safe(scmd, next, =
work_q, eh_entry) {
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
                     |
                   'scsi_eh_get_sense': events 14-15
                     |
                     | 1268 |                 if ((scmd->eh_eflags & SCSI_E=
H_ABORT_SCHEDULED) ||
                     |      |                    ~ ~~~~^~~~~~~~~~~
                     |      |                    |     |
                     |      |                    |     (14) ...to here
                     |      |                    (15) following 'false' bra=
nch...
                     |
                   'scsi_eh_get_sense': event 16
                     |
                     |drivers/scsi/scsi_priv.h:27:17:
                     |   27 |         (((scmd)->sense_buffer[0] & 0x70) =3D=
=3D 0x70)
                     |      |           ~~~~~~^~~~~~~~~~~~~~
                     |      |                 |
                     |      |                 (16) ...to here

vim +1008 drivers/scsi/scsi_error.c

292148f8bb2b5d Brian King         2007-01-30   977  =

^1da177e4c3f41 Linus Torvalds     2005-04-16   978  /**
3b729f76478756 Santosh Y          2012-04-08   979   * scsi_eh_prep_cmnd  -=
 Save a scsi command info as part of error recovery
2dc611de5a3fd9 Christoph Hellwig  2006-11-04   980   * @scmd:       SCSI co=
mmand structure to hijack
e1c234685c5080 Boaz Harrosh       2007-10-08   981   * @ses:        structu=
re to save restore information
55db6c1b8ed52b Boaz Harrosh       2007-10-08   982   * @cmnd:       CDB to =
send. Can be NULL if no new cmnd is needed
ce70fd9a551af7 Christoph Hellwig  2022-02-24   983   * @cmnd_size:  size in=
 bytes of @cmnd (must be <=3D MAX_COMMAND_SIZE)
55db6c1b8ed52b Boaz Harrosh       2007-10-08   984   * @sense_bytes: size o=
f sense data to copy. or 0 (if !=3D 0 @cmnd is ignored)
2dc611de5a3fd9 Christoph Hellwig  2006-11-04   985   *
e1c234685c5080 Boaz Harrosh       2007-10-08   986   * This function is use=
d to save a scsi command information before re-execution
55db6c1b8ed52b Boaz Harrosh       2007-10-08   987   * as part of the error=
 recovery process.  If @sense_bytes is 0 the command
55db6c1b8ed52b Boaz Harrosh       2007-10-08   988   * sent must be one tha=
t does not transfer any data.  If @sense_bytes !=3D 0
55db6c1b8ed52b Boaz Harrosh       2007-10-08   989   * @cmnd is ignored and=
 this functions sets up a REQUEST_SENSE command
55db6c1b8ed52b Boaz Harrosh       2007-10-08   990   * and cmnd buffers to =
read @sense_bytes into @scmd->sense_buffer.
dc8875e1078961 Randy Dunlap       2007-11-15   991   */
e1c234685c5080 Boaz Harrosh       2007-10-08   992  void scsi_eh_prep_cmnd(=
struct scsi_cmnd *scmd, struct scsi_eh_save *ses,
e1c234685c5080 Boaz Harrosh       2007-10-08   993  			unsigned char *cmnd,=
 int cmnd_size, unsigned sense_bytes)
^1da177e4c3f41 Linus Torvalds     2005-04-16   994  {
f59114b7b5dc67 Tejun Heo          2005-04-17   995  	struct scsi_device *sd=
ev =3D scmd->device;
^1da177e4c3f41 Linus Torvalds     2005-04-16   996  =

631c228cd09bd5 Christoph Hellwig  2006-07-08   997  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08   998  	 * We need saved copie=
s of a number of fields - this is because
631c228cd09bd5 Christoph Hellwig  2006-07-08   999  	 * error handling may =
need to overwrite these with different values
631c228cd09bd5 Christoph Hellwig  2006-07-08  1000  	 * to run different co=
mmands, and once error handling is complete,
631c228cd09bd5 Christoph Hellwig  2006-07-08  1001  	 * we will need to res=
tore these values prior to running the actual
631c228cd09bd5 Christoph Hellwig  2006-07-08  1002  	 * command.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1003  	 */
e1c234685c5080 Boaz Harrosh       2007-10-08  1004  	ses->cmd_len =3D scmd-=
>cmd_len;
e1c234685c5080 Boaz Harrosh       2007-10-08  1005  	ses->data_direction =
=3D scmd->sc_data_direction;
30b0c37b27485a Boaz Harrosh       2007-12-13  1006  	ses->sdb =3D scmd->sdb;
e1c234685c5080 Boaz Harrosh       2007-10-08  1007  	ses->result =3D scmd->=
result;
a9a4ea1166d640 Christoph Hellwig  2022-02-24 @1008  	ses->resid_len =3D scm=
d->resid_len;
12265709ac6e19 Alan Stern         2008-07-21  1009  	ses->underflow =3D scm=
d->underflow;
db007fc5e20c00 Martin K. Petersen 2008-07-17  1010  	ses->prot_op =3D scmd-=
>prot_op;
8e8c9d01c5ea33 Hannes Reinecke    2017-04-06  1011  	ses->eh_eflags =3D scm=
d->eh_eflags;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1012  =

db007fc5e20c00 Martin K. Petersen 2008-07-17  1013  	scmd->prot_op =3D SCSI=
_PROT_NORMAL;
c69e6f812bab0d James Bottomley    2014-04-10  1014  	scmd->eh_eflags =3D 0;
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1015  	memcpy(ses->cmnd, scmd=
->cmnd, sizeof(ses->cmnd));
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1016  	memset(scmd->cmnd, 0, =
sizeof(scmd->cmnd));
30b0c37b27485a Boaz Harrosh       2007-12-13  1017  	memset(&scmd->sdb, 0, =
sizeof(scmd->sdb));
644373a4219add Alan Stern         2014-03-28  1018  	scmd->result =3D 0;
a9a4ea1166d640 Christoph Hellwig  2022-02-24  1019  	scmd->resid_len =3D 0;
30b0c37b27485a Boaz Harrosh       2007-12-13  1020  =

55db6c1b8ed52b Boaz Harrosh       2007-10-08  1021  	if (sense_bytes) {
30b0c37b27485a Boaz Harrosh       2007-12-13  1022  		scmd->sdb.length =3D =
min_t(unsigned, SCSI_SENSE_BUFFERSIZE,
30b0c37b27485a Boaz Harrosh       2007-12-13  1023  					 sense_bytes);
e1c234685c5080 Boaz Harrosh       2007-10-08  1024  		sg_init_one(&ses->sen=
se_sgl, scmd->sense_buffer,
30b0c37b27485a Boaz Harrosh       2007-12-13  1025  			    scmd->sdb.length=
);
30b0c37b27485a Boaz Harrosh       2007-12-13  1026  		scmd->sdb.table.sgl =
=3D &ses->sense_sgl;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1027  		scmd->sc_data_directi=
on =3D DMA_FROM_DEVICE;
0c958ecc69c277 Tony Battersby     2015-07-16  1028  		scmd->sdb.table.nents=
 =3D scmd->sdb.table.orig_nents =3D 1;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1029  		scmd->cmnd[0] =3D REQ=
UEST_SENSE;
30b0c37b27485a Boaz Harrosh       2007-12-13  1030  		scmd->cmnd[4] =3D scm=
d->sdb.length;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1031  		scmd->cmd_len =3D COM=
MAND_SIZE(scmd->cmnd[0]);
631c228cd09bd5 Christoph Hellwig  2006-07-08  1032  	} else {
631c228cd09bd5 Christoph Hellwig  2006-07-08  1033  		scmd->sc_data_directi=
on =3D DMA_NONE;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1034  		if (cmnd) {
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1035  			BUG_ON(cmnd_size > s=
izeof(scmd->cmnd));
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1036  			memcpy(scmd->cmnd, c=
mnd, cmnd_size);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1037  			scmd->cmd_len =3D CO=
MMAND_SIZE(scmd->cmnd[0]);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1038  		}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1039  	}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1040  =

631c228cd09bd5 Christoph Hellwig  2006-07-08  1041  	scmd->underflow =3D 0;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1042  =

55db6c1b8ed52b Boaz Harrosh       2007-10-08  1043  	if (sdev->scsi_level <=
=3D SCSI_2 && sdev->scsi_level !=3D SCSI_UNKNOWN)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1044  		scmd->cmnd[1] =3D (sc=
md->cmnd[1] & 0x1f) |
f59114b7b5dc67 Tejun Heo          2005-04-17  1045  			(sdev->lun << 5 & 0x=
e0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1046  =

631c228cd09bd5 Christoph Hellwig  2006-07-08  1047  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08  1048  	 * Zero the sense buff=
er.  The scsi spec mandates that any
631c228cd09bd5 Christoph Hellwig  2006-07-08  1049  	 * untransferred sense=
 data should be interpreted as being zero.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1050  	 */
b80ca4f7ee36c2 FUJITA Tomonori    2008-01-13  1051  	memset(scmd->sense_buf=
fer, 0, SCSI_SENSE_BUFFERSIZE);
e1c234685c5080 Boaz Harrosh       2007-10-08  1052  }
e1c234685c5080 Boaz Harrosh       2007-10-08  1053  EXPORT_SYMBOL(scsi_eh_p=
rep_cmnd);
e1c234685c5080 Boaz Harrosh       2007-10-08  1054  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3704516226458727787==--

