Content-Type: multipart/mixed; boundary="===============4887669051736067833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [bvanassche:ufs-for-next 29/29] drivers/ufs/core/ufshcd.c:7850:5: warning: Variable 'gran_to_us_table' can be declared with const [constVariable]
Date: Mon, 04 Apr 2022 19:41:22 +0800
Message-ID: <202204041922.Oipl6J3n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4887669051736067833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   e0dc8a56abf3821882754095939d9c03b0e005bc
commit: e0dc8a56abf3821882754095939d9c03b0e005bc [29/29] scsi: ufs: Split t=
he drivers/scsi/ufs directory
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/ufs/core/ufshcd.c:7850:5: warning: Variable 'gran_to_us_table' c=
an be declared with const [constVariable]
    u8 gran_to_us_table[] =3D {1, 4, 8, 16, 32, 100};
       ^
>> drivers/ufs/core/ufshcd.c:5420:67: warning: Parameter 'other_mask' can b=
e declared with const [constParameter]
   int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask, u16 *other_=
mask,
                                                                     ^

vim +/gran_to_us_table +7850 drivers/ufs/core/ufshcd.c

371131065de99b drivers/scsi/ufs/ufshcd.c Yaniv Gardi      2016-03-10  7832  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7833 =
 /**
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7834 =
  * ufshcd_quirk_tune_host_pa_tactivate - Ensures that host PA_TACTIVATE is
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7835 =
  * less than device PA_TACTIVATE time.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7836 =
  * @hba: per-adapter instance
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7837 =
  *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7838 =
  * Some UFS devices require host PA_TACTIVATE to be lower than device
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7839 =
  * PA_TACTIVATE, we need to enable UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE quirk
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7840 =
  * for such devices.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7841 =
  *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7842 =
  * Returns zero on success, non-zero error value on failure.
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7843 =
  */
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7844 =
 static int ufshcd_quirk_tune_host_pa_tactivate(struct ufs_hba *hba)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7845 =
 {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7846 =
 	int ret =3D 0;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7847 =
 	u32 granularity, peer_granularity;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7848 =
 	u32 pa_tactivate, peer_pa_tactivate;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7849 =
 	u32 pa_tactivate_us, peer_pa_tactivate_us;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23 @7850 =
 	u8 gran_to_us_table[] =3D {1, 4, 8, 16, 32, 100};
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7851  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7852 =
 	ret =3D ufshcd_dme_get(hba, UIC_ARG_MIB(PA_GRANULARITY),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7853 =
 				  &granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7854 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7855 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7856  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7857 =
 	ret =3D ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_GRANULARITY),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7858 =
 				  &peer_granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7859 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7860 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7861  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7862 =
 	if ((granularity < PA_GRANULARITY_MIN_VAL) ||
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7863 =
 	    (granularity > PA_GRANULARITY_MAX_VAL)) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7864 =
 		dev_err(hba->dev, "%s: invalid host PA_GRANULARITY %d",
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7865 =
 			__func__, granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7866 =
 		return -EINVAL;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7867 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7868  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7869 =
 	if ((peer_granularity < PA_GRANULARITY_MIN_VAL) ||
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7870 =
 	    (peer_granularity > PA_GRANULARITY_MAX_VAL)) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7871 =
 		dev_err(hba->dev, "%s: invalid device PA_GRANULARITY %d",
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7872 =
 			__func__, peer_granularity);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7873 =
 		return -EINVAL;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7874 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7875  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7876 =
 	ret =3D ufshcd_dme_get(hba, UIC_ARG_MIB(PA_TACTIVATE), &pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7877 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7878 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7879  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7880 =
 	ret =3D ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_TACTIVATE),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7881 =
 				  &peer_pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7882 =
 	if (ret)
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7883 =
 		goto out;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7884  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7885 =
 	pa_tactivate_us =3D pa_tactivate * gran_to_us_table[granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7886 =
 	peer_pa_tactivate_us =3D peer_pa_tactivate *
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7887 =
 			     gran_to_us_table[peer_granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7888  =

9008661e19606b drivers/scsi/ufs/ufshcd.c SEO HOYOUNG      2022-01-07  7889 =
 	if (pa_tactivate_us >=3D peer_pa_tactivate_us) {
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7890 =
 		u32 new_peer_pa_tactivate;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7891  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7892 =
 		new_peer_pa_tactivate =3D pa_tactivate_us /
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7893 =
 				      gran_to_us_table[peer_granularity - 1];
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7894 =
 		new_peer_pa_tactivate++;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7895 =
 		ret =3D ufshcd_dme_peer_set(hba, UIC_ARG_MIB(PA_TACTIVATE),
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7896 =
 					  new_peer_pa_tactivate);
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7897 =
 	}
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7898  =

c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7899 =
 out:
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7900 =
 	return ret;
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7901 =
 }
c6a6db439868c7 drivers/scsi/ufs/ufshcd.c Subhash Jadavani 2016-11-23  7902  =


:::::: The code at line 7850 was first introduced by commit
:::::: c6a6db439868c7ba5cc90d4c461d9697ec731fa1 scsi: ufs: ensure that host=
 pa_tactivate is higher than device

:::::: TO: subhashj(a)codeaurora.org <subhashj@codeaurora.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4887669051736067833==--

