Content-Type: multipart/mixed; boundary="===============1738274251127271727=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:838 bnxt_ptp_init() warn: missing error code 'rc'
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207240423.JHbakhcu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1738274251127271727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Pavan Chebbi <pavan.chebbi@broadcom.com>
CC: Somnath Kotur <somnath.kotur@broadcom.com>
CC: Michael Chan <michael.chan@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 24ac1ecd524065cdcf8c27dc85ae37eccce8f2f6 bnxt_en: Add driver suppor=
t to use Real Time Counter for PTP
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: arc-randconfig-m041-20220718 (https://download.01.org/0day-ci/archi=
ve/20220724/202207240423.JHbakhcu-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:838 bnxt_ptp_init() warn: mis=
sing error code 'rc'

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.

vim +/rc +838 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c

740c342e399981 Pavan Chebbi 2022-01-25  796  =

24ac1ecd524065 Pavan Chebbi 2022-01-25  797  int bnxt_ptp_init(struct bnxt =
*bp, bool phc_cfg)
118612d519d83b Michael Chan 2021-06-27  798  {
118612d519d83b Michael Chan 2021-06-27  799  	struct bnxt_ptp_cfg *ptp =3D =
bp->ptp_cfg;
118612d519d83b Michael Chan 2021-06-27  800  	int rc;
118612d519d83b Michael Chan 2021-06-27  801  =

118612d519d83b Michael Chan 2021-06-27  802  	if (!ptp)
118612d519d83b Michael Chan 2021-06-27  803  		return 0;
118612d519d83b Michael Chan 2021-06-27  804  =

118612d519d83b Michael Chan 2021-06-27  805  	rc =3D bnxt_map_ptp_regs(bp);
118612d519d83b Michael Chan 2021-06-27  806  	if (rc)
118612d519d83b Michael Chan 2021-06-27  807  		return rc;
118612d519d83b Michael Chan 2021-06-27  808  =

24ac1ecd524065 Pavan Chebbi 2022-01-25  809  	if (bp->fw_cap & BNXT_FW_CAP_=
PTP_RTC) {
24ac1ecd524065 Pavan Chebbi 2022-01-25  810  		bnxt_ptp_timecounter_init(bp=
, false);
24ac1ecd524065 Pavan Chebbi 2022-01-25  811  		rc =3D bnxt_ptp_init_rtc(bp,=
 phc_cfg);
24ac1ecd524065 Pavan Chebbi 2022-01-25  812  		if (rc)
24ac1ecd524065 Pavan Chebbi 2022-01-25  813  			goto out;
24ac1ecd524065 Pavan Chebbi 2022-01-25  814  	}
24ac1ecd524065 Pavan Chebbi 2022-01-25  815  =

caf3eedbcd8d32 Pavan Chebbi 2021-07-28  816  	if (ptp->ptp_clock && bnxt_pp=
s_config_ok(bp))
a521c8a01d267b Michael Chan 2021-07-28  817  		return 0;
a521c8a01d267b Michael Chan 2021-07-28  818  =

740c342e399981 Pavan Chebbi 2022-01-25  819  	bnxt_ptp_free(bp);
740c342e399981 Pavan Chebbi 2022-01-25  820  =

118612d519d83b Michael Chan 2021-06-27  821  	atomic_set(&ptp->tx_avail, BN=
XT_MAX_TX_TS);
118612d519d83b Michael Chan 2021-06-27  822  	spin_lock_init(&ptp->ptp_lock=
);
118612d519d83b Michael Chan 2021-06-27  823  =

24ac1ecd524065 Pavan Chebbi 2022-01-25  824  	if (!(bp->fw_cap & BNXT_FW_CA=
P_PTP_RTC))
740c342e399981 Pavan Chebbi 2022-01-25  825  		bnxt_ptp_timecounter_init(bp=
, true);
118612d519d83b Michael Chan 2021-06-27  826  =

118612d519d83b Michael Chan 2021-06-27  827  	ptp->ptp_info =3D bnxt_ptp_ca=
ps;
caf3eedbcd8d32 Pavan Chebbi 2021-07-28  828  	if ((bp->fw_cap & BNXT_FW_CAP=
_PTP_PPS)) {
caf3eedbcd8d32 Pavan Chebbi 2021-07-28  829  		if (bnxt_ptp_pps_init(bp))
caf3eedbcd8d32 Pavan Chebbi 2021-07-28  830  			netdev_err(bp->dev, "1pps n=
ot initialized, continuing without 1pps support\n");
caf3eedbcd8d32 Pavan Chebbi 2021-07-28  831  	}
118612d519d83b Michael Chan 2021-06-27  832  	ptp->ptp_clock =3D ptp_clock_=
register(&ptp->ptp_info, &bp->pdev->dev);
118612d519d83b Michael Chan 2021-06-27  833  	if (IS_ERR(ptp->ptp_clock)) {
118612d519d83b Michael Chan 2021-06-27  834  		int err =3D PTR_ERR(ptp->ptp=
_clock);
118612d519d83b Michael Chan 2021-06-27  835  =

118612d519d83b Michael Chan 2021-06-27  836  		ptp->ptp_clock =3D NULL;
24ac1ecd524065 Pavan Chebbi 2022-01-25  837  		rc =3D err;
24ac1ecd524065 Pavan Chebbi 2022-01-25 @838  		goto out;
118612d519d83b Michael Chan 2021-06-27  839  	}
d7859afb688024 Michael Chan 2021-07-18  840  	if (bp->flags & BNXT_FLAG_CHI=
P_P5) {
d7859afb688024 Michael Chan 2021-07-18  841  		spin_lock_bh(&ptp->ptp_lock);
30e96f487f64c6 Michael Chan 2021-07-28  842  		bnxt_refclk_read(bp, NULL, &=
ptp->current_time);
d7859afb688024 Michael Chan 2021-07-18  843  		WRITE_ONCE(ptp->old_time, pt=
p->current_time);
d7859afb688024 Michael Chan 2021-07-18  844  		spin_unlock_bh(&ptp->ptp_loc=
k);
d7859afb688024 Michael Chan 2021-07-18  845  		ptp_schedule_worker(ptp->ptp=
_clock, 0);
d7859afb688024 Michael Chan 2021-07-18  846  	}
118612d519d83b Michael Chan 2021-06-27  847  	return 0;
24ac1ecd524065 Pavan Chebbi 2022-01-25  848  =

24ac1ecd524065 Pavan Chebbi 2022-01-25  849  out:
24ac1ecd524065 Pavan Chebbi 2022-01-25  850  	bnxt_ptp_free(bp);
24ac1ecd524065 Pavan Chebbi 2022-01-25  851  	bnxt_unmap_ptp_regs(bp);
24ac1ecd524065 Pavan Chebbi 2022-01-25  852  	return rc;
118612d519d83b Michael Chan 2021-06-27  853  }
118612d519d83b Michael Chan 2021-06-27  854  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1738274251127271727==--

