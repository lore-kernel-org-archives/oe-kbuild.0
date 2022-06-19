Content-Type: multipart/mixed; boundary="===============3998327868256803931=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ufs/core/ufs_bsg.c:41:28: warning: dereference of NULL '0' [CWE-476]
Date: Mon, 20 Jun 2022 01:36:45 +0800
Message-ID: <202206200127.gi8QQOSP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3998327868256803931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/u=
fs/core/ufs_bsg.c:41:28: warning: dereference of NULL '0' [CWE-476] [-Wanal=
yzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drive=
rs/scsi/ufs directory
date:   4 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206200127.gi8QQOSP-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddd11376b9f1b73aca3f8c6eb541486bbb6996f05
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
       |drivers/ufs/core/ufs_bsg.c:90:31:
       |   40 |         if (min_req_len > request_len || min_rsp_len > repl=
y_len) {
       |      |            ~                   =

       |      |            |
       |      |            (7) following 'false' branch...
       |......
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (6) returning to 'ufs_bsg_req=
uest' from 'dev_to_shost'
       |......
       |  101 |         if (ret)
       |      |         ~~                     =

       |      |         |
       |      |         (8) ...to here
       |
     'ufs_bsg_request': event 9
       |
       |drivers/ufs/core/ufshcd-priv.h:256:40:
       |  256 |         return pm_runtime_get_sync(&hba->ufs_device_wlun->s=
dev_gendev);
       |      |                                     ~~~^~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (9) dereference of N=
ULL 'dev_to_shost(*job_35(D)->dev.parent)'
       |
   drivers/ufs/core/ufshcd-priv.h:261:40: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     261 |         return pm_runtime_put_sync(&hba->ufs_device_wlun->sdev_g=
endev);
         |                                     ~~~^~~~~~~~~~~~~~~~~
     'ufs_bsg_request': events 1-2
       |
       |drivers/ufs/core/ufs_bsg.c:86:12:
       |   86 | static int ufs_bsg_request(struct bsg_job *job)
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ufs_bsg_request'
       |......
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (2) calling 'dev_to_shost' fr=
om 'ufs_bsg_request'
       |
       +--> 'dev_to_shost': events 3-5
              |
              |include/scsi/scsi_host.h:726:33:
              |  726 | static inline struct Scsi_Host *dev_to_shost(struct =
device *dev)
              |      |                                 ^~~~~~~~~~~~
              |      |                                 |
              |      |                                 (3) entry to 'dev_to=
_shost'
              |  727 | {
              |  728 |         while (!scsi_is_host_device(dev)) {
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (4) following 'true' branch...
              |  729 |                 if (!dev->parent)
              |      |                 ~~               =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'ufs_bsg_request': events 6-10
       |
       |drivers/ufs/core/ufs_bsg.c:90:31:
       |   40 |         if (min_req_len > request_len || min_rsp_len > repl=
y_len) {
       |      |            ~                   =

       |      |            |
       |      |            (7) following 'false' branch...
       |......
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (6) returning to 'ufs_bsg_req=
uest' from 'dev_to_shost'
       |......
       |  101 |         if (ret)
       |      |         ~~                     =

       |      |         |
       |      |         (8) ...to here
       |......
       |  125 |                 if (ret)
       |      |                    ~           =

       |      |                    |
       |      |                    (9) following 'false' branch (when 'ret =
=3D=3D 0')...
       |......
       |  147 |         ufshcd_rpm_put_sync(hba);
       |      |         ~~~~~~~~~~~~~~~~~~~    =

       |      |         |
       |      |         (10) ...to here
       |
     'ufs_bsg_request': event 11
       |
       |drivers/ufs/core/ufshcd-priv.h:261:40:
       |  261 |         return pm_runtime_put_sync(&hba->ufs_device_wlun->s=
dev_gendev);
       |      |                                     ~~~^~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (11) dereference of =
NULL 'dev_to_shost(*job_35(D)->dev.parent)'
       |
   In file included from include/linux/device.h:15,
                    from include/linux/blk_types.h:11,
                    from include/linux/blkdev.h:9,
                    from include/linux/bsg-lib.h:12,
                    from drivers/ufs/core/ufs_bsg.c:8:
>> drivers/ufs/core/ufs_bsg.c:41:28: warning: dereference of NULL '0' [CWE-=
476] [-Wanalyzer-null-dereference]
      41 |                 dev_err(hba->dev, "not enough space assigned\n");
         |                         ~~~^~~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_pri=
ntk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                         ^~~
   drivers/ufs/core/ufs_bsg.c:41:17: note: in expansion of macro 'dev_err'
      41 |                 dev_err(hba->dev, "not enough space assigned\n");
         |                 ^~~~~~~
     'ufs_bsg_request': events 1-2
       |
       |   86 | static int ufs_bsg_request(struct bsg_job *job)
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ufs_bsg_request'
       |......
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (2) calling 'dev_to_shost' fr=
om 'ufs_bsg_request'
       |
       +--> 'dev_to_shost': events 3-5
              |
              |include/scsi/scsi_host.h:726:33:
              |  726 | static inline struct Scsi_Host *dev_to_shost(struct =
device *dev)
              |      |                                 ^~~~~~~~~~~~
              |      |                                 |
              |      |                                 (3) entry to 'dev_to=
_shost'
              |  727 | {
              |  728 |         while (!scsi_is_host_device(dev)) {
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (4) following 'true' branch...
              |  729 |                 if (!dev->parent)
              |      |                 ~~               =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |
     'ufs_bsg_request': event 6
       |
       |drivers/ufs/core/ufs_bsg.c:90:31:
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (6) returning to 'ufs_bsg_req=
uest' from 'dev_to_shost'
       |
     'ufs_bsg_request': event 7
       |
       |   41 |                 dev_err(hba->dev, "not enough space assigne=
d\n");
       |      |                         ~~~^~~~~
       |      |                            |
       |      |                            (7) dereference of NULL 'dev_to_=
shost(*job_35(D)->dev.parent)'
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_pri=
ntk_index_wrap'
       |  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
       |      |                         ^~~
   drivers/ufs/core/ufs_bsg.c:41:17: note: in expansion of macro 'dev_err'
       |   41 |                 dev_err(hba->dev, "not enough space assigne=
d\n");
       |      |                 ^~~~~~~
       |
   drivers/ufs/core/ufs_bsg.c:126:36: warning: dereference of NULL '0' [CWE=
-476] [-Wanalyzer-null-dereference]
     126 |                         dev_err(hba->dev,
         |                                 ~~~^~~~~
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_pri=
ntk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                         ^~~
   drivers/ufs/core/ufs_bsg.c:126:25: note: in expansion of macro 'dev_err'
     126 |                         dev_err(hba->dev,
         |                         ^~~~~~~
     'ufs_bsg_request': events 1-2
       |
       |   86 | static int ufs_bsg_request(struct bsg_job *job)
       |      |            ^~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ufs_bsg_request'
       |......
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (2) calling 'dev_to_shost' fr=
om 'ufs_bsg_request'
       |
       +--> 'dev_to_shost': events 3-5
              |
              |include/scsi/scsi_host.h:726:33:
              |  726 | static inline struct Scsi_Host *dev_to_shost(struct =
device *dev)
              |      |                                 ^~~~~~~~~~~~
              |      |                                 |
              |      |                                 (3) entry to 'dev_to=
_shost'
              |  727 | {
              |  728 |         while (!scsi_is_host_device(dev)) {
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (4) following 'true' branch...
              |  729 |                 if (!dev->parent)
              |      |                 ~~               =

              |      |                 |
              |      |                 (5) ...to here
              |
       <------+
       |

vim +/0 +41 drivers/ufs/core/ufs_bsg.c

95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  32  =

95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  33  stati=
c int ufs_bsg_verify_query_size(struct ufs_hba *hba,
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  34  				 =
    unsigned int request_len,
4eaa329e331343 drivers/scsi/ufs/ufs_bsg.c Avri Altman 2019-02-20  35  				 =
    unsigned int reply_len)
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  36  {
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  37  	int =
min_req_len =3D sizeof(struct ufs_bsg_request);
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  38  	int =
min_rsp_len =3D sizeof(struct ufs_bsg_reply);
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  39  =

95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  40  	if (=
min_req_len > request_len || min_rsp_len > reply_len) {
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07 @41  		dev=
_err(hba->dev, "not enough space assigned\n");
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  42  		ret=
urn -EINVAL;
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  43  	}
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  44  =

95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  45  	retu=
rn 0;
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  46  }
95e34bf930eaee drivers/scsi/ufs/ufs_bsg.c Avri Altman 2018-10-07  47  =


:::::: The code at line 41 was first introduced by commit
:::::: 95e34bf930eaee51dab23495342b148cd0ee2ba1 scsi: ufs-bsg: Add support =
for raw upiu in ufs_bsg_request()

:::::: TO: Avri Altman <avri.altman@wdc.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3998327868256803931==--

