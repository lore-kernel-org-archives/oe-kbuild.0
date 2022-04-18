Content-Type: multipart/mixed; boundary="===============3207354286625651152=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:kvalo/ath/pending 36/40] drivers/net/wireless/ath/ath11k/mac.c:8293 ath11k_mac_op_set_bios_sar_specs() warn: variable dereferenced before check 'sar' (see line 8280)
Date: Mon, 18 Apr 2022 23:09:54 +0800
Message-ID: <202204182315.h96VPgso-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3207354286625651152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
head:   c9a8efc35304a89fc0751649945909caf03eeb29
commit: 5ad5b356e75f402fec930cf0d77b6c7862850b55 [36/40] ath11k: Add suppor=
t for SAR
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204182315.h96VPgso-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:8293 ath11k_mac_op_set_bios_sar_specs=
() warn: variable dereferenced before check 'sar' (see line 8280)

Old smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:2134 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath11k/mac.c:2134 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath11k/mac.c:2136 ath11k_peer_assoc_h_he() error: =
uninitialized symbol 'rx_mcs_80'.

vim +/sar +8293 drivers/net/wireless/ath/ath11k/mac.c

a16d9b50cfbaf1 Carl Huang    2022-03-14  8275  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8276  static int ath11k_mac_op_set=
_bios_sar_specs(struct ieee80211_hw *hw,
5ad5b356e75f40 Baochen Qiang 2022-04-12  8277  					    const struct cfg802=
11_sar_specs *sar)
5ad5b356e75f40 Baochen Qiang 2022-04-12  8278  {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8279  	struct ath11k *ar =3D hw->p=
riv;
5ad5b356e75f40 Baochen Qiang 2022-04-12 @8280  	const struct cfg80211_sar_s=
ub_specs *sspec =3D sar->sub_specs;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8281  	int ret, index;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8282  	u8 *sar_tbl;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8283  	u32 i;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8284  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8285  	mutex_lock(&ar->conf_mutex);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8286  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8287  	if (!test_bit(WMI_TLV_SERVI=
CE_BIOS_SAR_SUPPORT, ar->ab->wmi_ab.svc_map) ||
5ad5b356e75f40 Baochen Qiang 2022-04-12  8288  	    !ar->ab->hw_params.bios=
_sar_capa) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8289  		ret =3D -EOPNOTSUPP;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8290  		goto exit;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8291  	}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8292  =

5ad5b356e75f40 Baochen Qiang 2022-04-12 @8293  	if (!sar || sar->type !=3D =
NL80211_SAR_TYPE_POWER ||
5ad5b356e75f40 Baochen Qiang 2022-04-12  8294  	    sar->num_sub_specs =3D=
=3D 0) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8295  		ret =3D -EINVAL;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8296  		goto exit;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8297  	}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8298  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8299  	ret =3D ath11k_wmi_pdev_set=
_bios_geo_table_param(ar);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8300  	if (ret) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8301  		ath11k_warn(ar->ab, "faile=
d to set geo table: %d\n", ret);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8302  		goto exit;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8303  	}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8304  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8305  	sar_tbl =3D kzalloc(BIOS_SA=
R_TABLE_LEN, GFP_KERNEL);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8306  	if (!sar_tbl) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8307  		ret =3D -ENOMEM;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8308  		goto exit;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8309  	}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8310  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8311  	for (i =3D 0; i < sar->num_=
sub_specs; i++) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8312  		if (sspec->freq_range_inde=
x >=3D (BIOS_SAR_TABLE_LEN >> 1)) {
5ad5b356e75f40 Baochen Qiang 2022-04-12  8313  			ath11k_warn(ar->ab, "Igno=
re bad frequency index %u, max allowed %u\n",
5ad5b356e75f40 Baochen Qiang 2022-04-12  8314  				    sspec->freq_range_in=
dex, BIOS_SAR_TABLE_LEN >> 1);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8315  			continue;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8316  		}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8317  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8318  		/* chain0 and chain1 share=
 same power setting */
5ad5b356e75f40 Baochen Qiang 2022-04-12  8319  		sar_tbl[sspec->freq_range_=
index] =3D sspec->power;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8320  		index =3D sspec->freq_rang=
e_index + (BIOS_SAR_TABLE_LEN >> 1);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8321  		sar_tbl[index] =3D sspec->=
power;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8322  		ath11k_dbg(ar->ab, ATH11K_=
DBG_MAC, "sar tbl[%d] =3D %d\n",
5ad5b356e75f40 Baochen Qiang 2022-04-12  8323  			   sspec->freq_range_inde=
x, sar_tbl[sspec->freq_range_index]);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8324  		sspec++;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8325  	}
5ad5b356e75f40 Baochen Qiang 2022-04-12  8326  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8327  	ret =3D ath11k_wmi_pdev_set=
_bios_sar_table_param(ar, sar_tbl);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8328  	if (ret)
5ad5b356e75f40 Baochen Qiang 2022-04-12  8329  		ath11k_warn(ar->ab, "faile=
d to set sar power: %d", ret);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8330  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8331  	kfree(sar_tbl);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8332  exit:
5ad5b356e75f40 Baochen Qiang 2022-04-12  8333  	mutex_unlock(&ar->conf_mute=
x);
5ad5b356e75f40 Baochen Qiang 2022-04-12  8334  =

5ad5b356e75f40 Baochen Qiang 2022-04-12  8335  	return ret;
5ad5b356e75f40 Baochen Qiang 2022-04-12  8336  }
5ad5b356e75f40 Baochen Qiang 2022-04-12  8337  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3207354286625651152==--

