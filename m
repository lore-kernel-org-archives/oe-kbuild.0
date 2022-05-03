Content-Type: multipart/mixed; boundary="===============8115581885908957050=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 408/8237] drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn: inconsistent returns '&ar->conf_mutex'.
Date: Tue, 03 May 2022 22:36:28 +0800
Message-ID: <202205032236.kofEquX3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8115581885908957050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Carl Huang <quic_cjhuang@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44a2f39e611ac0bc1f17c288a583d7f2e5684aa7
commit: 90bf5c8d0f7ecddf96fc1cd9434af4e157b51970 [408/8237] ath11k: purge r=
x pktlog when entering WoW
:::::: branch date: 7 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-m021-20220502 (https://download.01.org/0day-ci/arch=
ive/20220503/202205032236.kofEquX3-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/wow.c:712 ath11k_wow_op_resume() warn: inco=
nsistent returns '&ar->conf_mutex'.

vim +712 drivers/net/wireless/ath/ath11k/wow.c

ba9177fcef21fa Carl Huang 2022-03-14  652  =

ba9177fcef21fa Carl Huang 2022-03-14  653  int ath11k_wow_op_resume(struct =
ieee80211_hw *hw)
ba9177fcef21fa Carl Huang 2022-03-14  654  {
ba9177fcef21fa Carl Huang 2022-03-14  655  	struct ath11k *ar =3D hw->priv;
ba9177fcef21fa Carl Huang 2022-03-14  656  	int ret;
ba9177fcef21fa Carl Huang 2022-03-14  657  =

ba9177fcef21fa Carl Huang 2022-03-14  658  	mutex_lock(&ar->conf_mutex);
ba9177fcef21fa Carl Huang 2022-03-14  659  =

ba9177fcef21fa Carl Huang 2022-03-14  660  	ret =3D ath11k_hif_resume(ar->a=
b);
ba9177fcef21fa Carl Huang 2022-03-14  661  	if (ret) {
ba9177fcef21fa Carl Huang 2022-03-14  662  		ath11k_warn(ar->ab, "failed to=
 resume hif: %d\n", ret);
ba9177fcef21fa Carl Huang 2022-03-14  663  		goto exit;
ba9177fcef21fa Carl Huang 2022-03-14  664  	}
ba9177fcef21fa Carl Huang 2022-03-14  665  =

ba9177fcef21fa Carl Huang 2022-03-14  666  	ath11k_hif_ce_irq_enable(ar->ab=
);
ba9177fcef21fa Carl Huang 2022-03-14  667  	ath11k_hif_irq_enable(ar->ab);
ba9177fcef21fa Carl Huang 2022-03-14  668  =

90bf5c8d0f7ecd Carl Huang 2022-03-14  669  	ret =3D ath11k_dp_rx_pktlog_sta=
rt(ar->ab);
90bf5c8d0f7ecd Carl Huang 2022-03-14  670  	if (ret) {
90bf5c8d0f7ecd Carl Huang 2022-03-14  671  		ath11k_warn(ar->ab, "failed to=
 start rx pktlog from wow: %d\n", ret);
90bf5c8d0f7ecd Carl Huang 2022-03-14  672  		return ret;
90bf5c8d0f7ecd Carl Huang 2022-03-14  673  	}
90bf5c8d0f7ecd Carl Huang 2022-03-14  674  =

ba9177fcef21fa Carl Huang 2022-03-14  675  	ret =3D ath11k_wow_wakeup(ar->a=
b);
fec4b898f369a9 Carl Huang 2022-03-14  676  	if (ret) {
ba9177fcef21fa Carl Huang 2022-03-14  677  		ath11k_warn(ar->ab, "failed to=
 wakeup from wow: %d\n", ret);
fec4b898f369a9 Carl Huang 2022-03-14  678  		goto exit;
fec4b898f369a9 Carl Huang 2022-03-14  679  	}
fec4b898f369a9 Carl Huang 2022-03-14  680  =

fec4b898f369a9 Carl Huang 2022-03-14  681  	ret =3D ath11k_wow_nlo_cleanup(=
ar);
fec4b898f369a9 Carl Huang 2022-03-14  682  	if (ret) {
fec4b898f369a9 Carl Huang 2022-03-14  683  		ath11k_warn(ar->ab, "failed to=
 cleanup nlo: %d\n", ret);
fec4b898f369a9 Carl Huang 2022-03-14  684  		goto exit;
fec4b898f369a9 Carl Huang 2022-03-14  685  	}
ba9177fcef21fa Carl Huang 2022-03-14  686  =

c417b247ba0421 Carl Huang 2022-03-14  687  	ret =3D ath11k_wow_clear_hw_fil=
ter(ar);
c417b247ba0421 Carl Huang 2022-03-14  688  	if (ret) {
c417b247ba0421 Carl Huang 2022-03-14  689  		ath11k_warn(ar->ab, "failed to=
 clear hw filter: %d\n", ret);
c417b247ba0421 Carl Huang 2022-03-14  690  		goto exit;
c417b247ba0421 Carl Huang 2022-03-14  691  	}
c417b247ba0421 Carl Huang 2022-03-14  692  =

ba9177fcef21fa Carl Huang 2022-03-14  693  exit:
ba9177fcef21fa Carl Huang 2022-03-14  694  	if (ret) {
ba9177fcef21fa Carl Huang 2022-03-14  695  		switch (ar->state) {
ba9177fcef21fa Carl Huang 2022-03-14  696  		case ATH11K_STATE_ON:
ba9177fcef21fa Carl Huang 2022-03-14  697  			ar->state =3D ATH11K_STATE_RE=
STARTING;
ba9177fcef21fa Carl Huang 2022-03-14  698  			ret =3D 1;
ba9177fcef21fa Carl Huang 2022-03-14  699  			break;
ba9177fcef21fa Carl Huang 2022-03-14  700  		case ATH11K_STATE_OFF:
ba9177fcef21fa Carl Huang 2022-03-14  701  		case ATH11K_STATE_RESTARTING:
ba9177fcef21fa Carl Huang 2022-03-14  702  		case ATH11K_STATE_RESTARTED:
ba9177fcef21fa Carl Huang 2022-03-14  703  		case ATH11K_STATE_WEDGED:
ba9177fcef21fa Carl Huang 2022-03-14  704  			ath11k_warn(ar->ab, "encounte=
red unexpected device state %d on resume, cannot recover\n",
ba9177fcef21fa Carl Huang 2022-03-14  705  				    ar->state);
ba9177fcef21fa Carl Huang 2022-03-14  706  			ret =3D -EIO;
ba9177fcef21fa Carl Huang 2022-03-14  707  			break;
ba9177fcef21fa Carl Huang 2022-03-14  708  		}
ba9177fcef21fa Carl Huang 2022-03-14  709  	}
ba9177fcef21fa Carl Huang 2022-03-14  710  =

ba9177fcef21fa Carl Huang 2022-03-14  711  	mutex_unlock(&ar->conf_mutex);
ba9177fcef21fa Carl Huang 2022-03-14 @712  	return ret;
ba9177fcef21fa Carl Huang 2022-03-14  713  }
ba9177fcef21fa Carl Huang 2022-03-14  714  =


:::::: The code at line 712 was first introduced by commit
:::::: ba9177fcef21fa98406e73c472b5ac2eb4ec5f31 ath11k: Add basic WoW funct=
ionalities

:::::: TO: Carl Huang <quic_cjhuang@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8115581885908957050==--

