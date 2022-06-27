Content-Type: multipart/mixed; boundary="===============2502327280878220418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ufs/core/ufshcd.c:7851:5: warning: Variable 'gran_to_us_table' can be declared with const [constVariable]
Date: Mon, 27 Jun 2022 03:04:32 +0000
Message-ID: <202206261409.32WwjKkz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2502327280878220418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/u=
fs/core/ufshcd.c:7851:5: warning: Variable 'gran_to_us_table' can be declar=
ed with const [constVariable]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Bean Huo <beanhuo@micron.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0840a7914caa14315a3191178a9f72c742477860
commit: dd11376b9f1b73aca3f8c6eb541486bbb6996f05 scsi: ufs: Split the drive=
rs/scsi/ufs directory
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout dd11376b9f1b73aca3f8c6eb541486bbb6996f05
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/ufs/core/ufshcd.c:7851:5: warning: Variable 'gran_to_us_table' c=
an be declared with const [constVariable]
    u8 gran_to_us_table[] =3D {1, 4, 8, 16, 32, 100};
       ^
>> drivers/ufs/core/ufshcd.c:5421:67: warning: Parameter 'other_mask' can b=
e declared with const [constParameter]
   int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask, u16 *other_=
mask,
                                                                     ^

vim +/gran_to_us_table +7851 drivers/ufs/core/ufshcd.c

371131065de99b drivers/scsi/ufs/ufshcd.c Yaniv Gardi      2016-03-10  7833  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7834 =
 /**
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7835 =
  * ufshcd_quirk_tune_host_pa_tactivate - Ensures that host PA_TACTIVATE is
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7836 =
  * less than device PA_TACTIVATE time.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7837 =
  * @hba: per-adapter instance
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7838 =
  *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7839 =
  * Some UFS devices require host PA_TACTIVATE to be lower than device
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7840 =
  * PA_TACTIVATE, we need to enable UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE quirk
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7841 =
  * for such devices.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7842 =
  *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7843 =
  * Returns zero on success, non-zero error value on failure.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7844 =
  */
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7845 =
 static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7846 =
 {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7847 =
 	int ret =3D 0;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7848 =
 	u32 granularity, peer_granularity;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7849 =
 	u32 pa_tactivate, peer_pa_tactivate;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7850 =
 	u32 pa_tactivate_us, peer_pa_tactivate_us;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23 @7851 =
 	u8 gran_to_us_table[] =3D {1, 4, 8, 16, 32, 100};
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7852  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7853 =
 	ret =3D ufshcd_dme_get(hba, UIC_ARG_MIB(PA_GRANULARITY),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7854 =
 				  &granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7855 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7856 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7857  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7858 =
 	ret =3D ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_GRANULARITY),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7859 =
 				  &peer_granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7860 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7861 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7862  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7863 =
 	if ((granularity < PA_GRANULARITY_MIN_VAL) ||
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7864 =
 	    (granularity > PA_GRANULARITY_MAX_VAL)) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7865 =
 		dev_err(hba->dev, "%s: invalid host PA_GRANULARITY %d",
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7866 =
 			__func__, granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7867 =
 		return -EINVAL;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7868 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7869  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7870 =
 	if ((peer_granularity < PA_GRANULARITY_MIN_VAL) ||
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7871 =
 	    (peer_granularity > PA_GRANULARITY_MAX_VAL)) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7872 =
 		dev_err(hba->dev, "%s: invalid device PA_GRANULARITY %d",
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7873 =
 			__func__, peer_granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7874 =
 		return -EINVAL;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7875 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7876  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7877 =
 	ret =3D ufshcd_dme_get(hba, UIC_ARG_MIB(PA_TACTIVATE), &pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7878 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7879 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7880  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7881 =
 	ret =3D ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_TACTIVATE),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7882 =
 				  &peer_pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7883 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7884 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7885  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7886 =
 	pa_tactivate_us =3D pa_tactivate * gran_to_us_table[granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7887 =
 	peer_pa_tactivate_us =3D peer_pa_tactivate *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7888 =
 			     gran_to_us_table[peer_granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7889  =

9008661e19606b drivers/scsi/ufs/ufshcd.c SEO HOYOUNG      2022-01-07  7890 =
 	if (pa_tactivate_us >=3D peer_pa_tactivate_us) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7891 =
 		u32 new_peer_pa_tactivate;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7892  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7893 =
 		new_peer_pa_tactivate =3D pa_tactivate_us /
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7894 =
 				      gran_to_us_table[peer_granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7895 =
 		new_peer_pa_tactivate++;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7896 =
 		ret =3D ufshcd_dme_peer_set(hba, UIC_ARG_MIB(PA_TACTIVATE),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7897 =
 					  new_peer_pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7898 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7899  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7900 =
 out:
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7901 =
 	return ret;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7902 =
 }
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7903  =


:::::: The code at line 7851 was first introduced by commit
:::::: c6a6db439868c7ba5cc90d4c461d9697ec731fa1 scsi: ufs: ensure that host=
 pa_tactivate is higher than device

:::::: TO: subhashj(a)codeaurora.org <subhashj@codeaurora.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2502327280878220418==--

