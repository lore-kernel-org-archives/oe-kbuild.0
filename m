Content-Type: multipart/mixed; boundary="===============3205723848833837821=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ufs/core/ufshcd-priv.h:256:40: warning: dereference of NULL '0' [CWE-476]
Date: Tue, 14 Jun 2022 18:15:08 +0800
Message-ID: <202206141805.xMuPl1Az-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3205723848833837821==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/u=
fs/core/ufshcd-priv.h:256:40: warning: dereference of NULL '0' [CWE-476] [-=
Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drive=
rs/scsi/ufs directory
date:   4 weeks ago
:::::: branch date: 35 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-c001-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206141805.xMuPl1Az-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
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
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from drivers/ufs/core/ufs_bsg.c:13:
   drivers/ufs/core/ufs_bsg.c: In function 'ufs_bsg_request':
>> drivers/ufs/core/ufshcd-priv.h:256:40: warning: dereference of NULL '0' =
[CWE-476] [-Wanalyzer-null-dereference]
     256 |         return pm_runtime_get_sync(&hba->ufs_device_wlun->sdev_g=
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
              |      |                      ~~~~~~~~~~~ =

              |      |                         |
              |      |                         (5) ...to here
              |
       <------+
       |
     'ufs_bsg_request': events 6-8
       |
       |drivers/ufs/core/ufs_bsg.c:90:31:
       |   90 |         struct ufs_hba *hba =3D shost_priv(dev_to_shost(job=
->dev->parent));
       |      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
       |      |                               |
       |      |                               (6) returning to 'ufs_bsg_req=
uest' from 'dev_to_shost'
       |......
       |  101 |         if (ret)
       |      |            ~                   =

       |      |            |
       |      |            (7) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       |  104 |         bsg_reply->reply_payload_rcv_len =3D 0;
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                          |
       |      |                                          (8) ...to here
       |
     'ufs_bsg_request': event 9
       |
       |drivers/ufs/core/ufshcd-priv.h:256:40:
       |  256 |         return pm_runtime_get_sync(&hba->ufs_device_wlun->s=
dev_gendev);
       |      |                                     ~~~^~~~~~~~~~~~~~~~~
       |      |                                        |
       |      |                                        (9) dereference of N=
ULL 'dev_to_shost(*job_39(D)->dev.parent)'
       |

vim +/0 +256 drivers/ufs/core/ufshcd-priv.h

4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19  2=
53  =

4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19  2=
54  static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19  2=
55  {
4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19 @2=
56  	return pm_runtime_get_sync(&hba->ufs_device_wlun->sdev_gendev);
4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19  2=
57  }
4bc26113c60307 drivers/scsi/ufs/ufshcd-priv.h Bart Van Assche 2022-04-19  2=
58  =


:::::: The code at line 256 was first introduced by commit
:::::: 4bc26113c603073363ac96f6f1c7d6389bc0b243 scsi: ufs: Split the ufshcd=
.h header file

:::::: TO: Bart Van Assche <bvanassche@acm.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3205723848833837821==--

