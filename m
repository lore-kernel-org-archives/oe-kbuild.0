Content-Type: multipart/mixed; boundary="===============3322491833789900314=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] scsi: ufs: Add Multi-Circular Queue support
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207231904.OkiLJTiT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3322491833789900314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1658214120-22772-2-git-send-email-quic_cang@quicinc.com>
References: <1658214120-22772-2-git-send-email-quic_cang@quicinc.com>
TO: Can Guo <quic_cang@quicinc.com>
TO: bvanassche(a)acm.org
TO: stanley.chu(a)mediatek.com
TO: adrian.hunter(a)intel.com
TO: alim.akhtar(a)samsung.com
TO: avri.altman(a)wdc.com
TO: beanhuo(a)micron.com
TO: quic_asutoshd(a)quicinc.com
TO: quic_nguyenb(a)quicinc.com
TO: quic_ziqichen(a)quicinc.com
TO: linux-scsi(a)vger.kernel.org
TO: kernel-team(a)android.com
TO: quic_cang(a)quicinc.com
CC: "James E.J. Bottomley" <jejb@linux.ibm.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Daejun Park <daejun7.park@samsung.com>
CC: Jinyoung Choi <j-young.choi@samsung.com>
CC: Kiwoong Kim <kwmad.kim@samsung.com>
CC: linux-kernel(a)vger.kernel.org

Hi Can,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next next-20220722]
[cannot apply to linus/master v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Guo/UFS-Multi-Ci=
rcular-Queue-MCQ/20220719-150436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-n=
ext
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arc-randconfig-m041-20220718 (https://download.01.org/0day-ci/archi=
ve/20220723/202207231904.OkiLJTiT-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/ufs/core/ufshcd.c:2887 ufshcd_queuecommand() error: uninitialized s=
ymbol 'hwq'.
drivers/ufs/core/ufs-mcq.c:315 ufshcd_mcq_config_resource() warn: passing z=
ero to 'PTR_ERR'
drivers/ufs/core/ufs-mcq.c:334 ufshcd_mcq_config_resource() error: potentia=
lly dereferencing uninitialized 'res_mem'.
drivers/ufs/core/ufs-mcq.c:330 ufshcd_mcq_config_resource() warn: missing e=
rror code 'ret'

Old smatch warnings:
arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitia=
lized symbol 'sp'.
drivers/ufs/core/ufshcd.c:5360 ufshcd_uic_cmd_compl() error: we previously =
assumed 'hba->active_uic_cmd' could be null (see line 5348)

vim +/hwq +2887 drivers/ufs/core/ufshcd.c

4d2b8d40dd754e drivers/scsi/ufs/ufshcd.c Bart Van Assche    2020-01-22  278=
4  =

7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  278=
5  /**
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  278=
6   * ufshcd_queuecommand - main entry point for SCSI requests
8aa29f192ca675 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2018-03-01  278=
7   * @host: SCSI host pointer
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  278=
8   * @cmd: command from SCSI Midlayer
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  278=
9   *
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
0   * Returns 0 for success, non-zero in case of failure
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
1   */
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
2  static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd =
*cmd)
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
3  {
4728ab4a8e6490 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  279=
4  	struct ufs_hba *hba =3D shost_priv(host);
3f2c1002e0fcb6 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-08-09  279=
5  	int tag =3D scsi_cmd_to_rq(cmd)->tag;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
6  	struct ufshcd_lrb *lrbp;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
7  	int err =3D 0;
2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19  279=
8  	struct ufs_hw_queue *hwq;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  279=
9  =

eaab9b57305496 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
0  	WARN_ONCE(tag < 0 || tag >=3D hba->nutrs, "Invalid tag %d\n", tag);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  280=
1  =

5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
2  	/*
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
3  	 * Allows the UFS error handler to wait for prior ufshcd_queuecommand()
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
4  	 * calls.
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
5  	 */
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
6  	rcu_read_lock();
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  280=
7  =

a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  280=
8  	switch (hba->ufshcd_state) {
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  280=
9  	case UFSHCD_STATE_OPERATIONAL:
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
0  		break;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  281=
1  	case UFSHCD_STATE_EH_SCHEDULED_NON_FATAL:
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
2  		/*
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
3  		 * SCSI error handler can call ->queuecommand() while UFS error
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
4  		 * handler is in progress. Error interrupts could change the
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
5  		 * state from UFSHCD_STATE_RESET to
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
6  		 * UFSHCD_STATE_EH_SCHEDULED_NON_FATAL. Prevent requests
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
7  		 * being issued in that case.
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
8  		 */
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  281=
9  		if (ufshcd_eh_in_progress(hba)) {
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  282=
0  			err =3D SCSI_MLQUEUE_HOST_BUSY;
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  282=
1  			goto out;
d489f18ad1fc33 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-10-08  282=
2  		}
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
3  		break;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
4  	case UFSHCD_STATE_EH_SCHEDULED_FATAL:
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
5  		/*
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
6  		 * pm_runtime_get_sync() is used at error handling preparation
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
7  		 * stage. If a scsi cmd, e.g. the SSU cmd, is sent from hba's
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
8  		 * PM ops, it can never be finished if we let SCSI layer keep
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  282=
9  		 * retrying it, which gets err handler stuck forever. Neither
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
0  		 * can we let the scsi cmd pass through, because UFS is in bad
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
1  		 * state, the scsi cmd may eventually time out, which will get
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
2  		 * err handler blocked for too long. So, just fail the scsi cmd
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
3  		 * sent from PM ops, err handler can recover PM error anyways.
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
4  		 */
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
5  		if (hba->pm_op_in_progress) {
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
6  			hba->force_reset =3D true;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
7  			set_host_byte(cmd, DID_BAD_TARGET);
35c3730a965722 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-10-07  283=
8  			scsi_done(cmd);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  283=
9  			goto out;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
0  		}
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
1  		fallthrough;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
2  	case UFSHCD_STATE_RESET:
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
3  		err =3D SCSI_MLQUEUE_HOST_BUSY;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
4  		goto out;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
5  	case UFSHCD_STATE_ERROR:
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
6  		set_host_byte(cmd, DID_ERROR);
35c3730a965722 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-10-07  284=
7  		scsi_done(cmd);
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
8  		goto out;
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  284=
9  	}
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  285=
0  =

7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  285=
1  	hba->req_abort_count =3D 0;
7fabb77b3aa016 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  285=
2  =

1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  285=
3  	err =3D ufshcd_hold(hba, true);
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  285=
4  	if (err) {
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  285=
5  		err =3D SCSI_MLQUEUE_HOST_BUSY;
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  285=
6  		goto out;
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  285=
7  	}
2dec9475a4028b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-09  285=
8  	WARN_ON(ufshcd_is_clkgating_allowed(hba) &&
2dec9475a4028b drivers/scsi/ufs/ufshcd.c Can Guo            2020-08-09  285=
9  		(hba->clk_gating.state !=3D CLKS_ON));
1ab27c9cf8b63d drivers/scsi/ufs/ufshcd.c Sahitya Tummala    2014-09-25  286=
0  =

2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19  286=
1  	if (is_mcq_enabled(hba))
2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19  286=
2  		lrbp =3D ufshcd_mcq_find_lrb(hba, scsi_cmd_to_rq(cmd), &hwq);
2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19  286=
3  	else
a45f937110fa6b drivers/scsi/ufs/ufshcd.c Can Guo            2021-05-24  286=
4  		lrbp =3D &hba->lrb[tag];
2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19  286=
5  =

5a0b0cb9bee767 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2013-07-30  286=
6  	WARN_ON(lrbp->cmd);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  286=
7  	lrbp->cmd =3D cmd;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  286=
8  	lrbp->task_tag =3D tag;
0ce147d48a3e33 drivers/scsi/ufs/ufshcd.c Subhash Jadavani   2014-09-25  286=
9  	lrbp->lun =3D ufshcd_scsi_to_upiu_lun(cmd->device->lun);
51d1628fc45727 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2022-04-19  287=
0  	lrbp->intr_cmd =3D !ufshcd_is_intr_aggr_allowed(hba);
df043c745ea149 drivers/scsi/ufs/ufshcd.c Satya Tangirala    2020-07-06  287=
1  =

3f2c1002e0fcb6 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-08-09  287=
2  	ufshcd_prepare_lrbp_crypto(scsi_cmd_to_rq(cmd), lrbp);
df043c745ea149 drivers/scsi/ufs/ufshcd.c Satya Tangirala    2020-07-06  287=
3  =

e0b299e36004f5 drivers/scsi/ufs/ufshcd.c Gilad Broner       2017-02-03  287=
4  	lrbp->req_abort_skip =3D false;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  287=
5  =

09d9e4d0418766 drivers/scsi/ufs/ufshcd.c Avri Altman        2021-10-30  287=
6  	ufshpb_prep(hba, lrbp);
2fff76f87542fa drivers/scsi/ufs/ufshcd.c Daejun Park        2021-07-12  287=
7  =

300bb13f5c7b1d drivers/scsi/ufs/ufshcd.c Joao Pinto         2016-05-11  287=
8  	ufshcd_comp_scsi_upiu(hba, lrbp);
300bb13f5c7b1d drivers/scsi/ufs/ufshcd.c Joao Pinto         2016-05-11  287=
9  =

75b1cc4ad63afa drivers/scsi/ufs/ufshcd.c Kiwoong Kim        2016-11-22  288=
0  	err =3D ufshcd_map_sg(hba, lrbp);
5a0b0cb9bee767 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2013-07-30  288=
1  	if (err) {
5a0b0cb9bee767 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2013-07-30  288=
2  		lrbp->cmd =3D NULL;
17c7d35f141ef6 drivers/scsi/ufs/ufshcd.c Can Guo            2019-12-05  288=
3  		ufshcd_release(hba);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  288=
4  		goto out;
5a0b0cb9bee767 drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2013-07-30  288=
5  	}
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  288=
6  =

2b7356bcd24efd drivers/ufs/core/ufshcd.c Asutosh Das        2022-07-19 @288=
7  	ufshcd_send_command(hba, lrbp, hwq);
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  288=
8  out:
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  288=
9  	rcu_read_unlock();
5675c381ea5136 drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-12-03  289=
0  =

88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
1  	if (ufs_trigger_eh()) {
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
2  		unsigned long flags;
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
3  =

88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
4  		spin_lock_irqsave(hba->host->host_lock, flags);
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
5  		ufshcd_schedule_eh_work(hba);
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
6  		spin_unlock_irqrestore(hba->host->host_lock, flags);
88b099006d83b0 drivers/scsi/ufs/ufshcd.c Adrian Hunter      2021-09-17  289=
7  	}
c11a1ae9b8f65e drivers/scsi/ufs/ufshcd.c Bart Van Assche    2021-07-21  289=
8  =

7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  289=
9  	return err;
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  290=
0  }
7a3e97b0dc4bba drivers/scsi/ufs/ufshcd.c Santosh Yaraganavi 2012-02-29  290=
1  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3322491833789900314==--

