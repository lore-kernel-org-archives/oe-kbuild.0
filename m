Content-Type: multipart/mixed; boundary="===============3908088770776379074=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [ath6kl:pending 90/99] drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding lock on line 4604
Date: Thu, 07 May 2020 20:37:55 +0800
Message-ID: <202005072051.VSgbRc4a%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3908088770776379074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k(a)lists.infradead.org
TO: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Miles Hu <milehu@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   d9e109721e24a6923a36ec88710086c3c23d3429
commit: a803b0a31d641cde3f7f2e68541ec318349b27a2 [90/99] ath11k: fix htt st=
ats module not handle multiple skbs
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/wireless/ath/ath11k/debug_htt_stats.c:4613:2-8: preceding lo=
ck on line 4604

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=
=3Da803b0a31d641cde3f7f2e68541ec318349b27a2
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo=
/ath.git
git remote update ath6kl
git checkout a803b0a31d641cde3f7f2e68541ec318349b27a2
vim +4613 drivers/net/wireless/ath/ath11k/debug_htt_stats.c

d5c65159f28953 Kalle Valo 2019-11-23  4586  =

d5c65159f28953 Kalle Valo 2019-11-23  4587  static ssize_t ath11k_write_htt=
_stats_reset(struct file *file,
d5c65159f28953 Kalle Valo 2019-11-23  4588  					    const char __user *use=
r_buf,
d5c65159f28953 Kalle Valo 2019-11-23  4589  					    size_t count, loff_t *=
ppos)
d5c65159f28953 Kalle Valo 2019-11-23  4590  {
d5c65159f28953 Kalle Valo 2019-11-23  4591  	struct ath11k *ar =3D file->pr=
ivate_data;
d5c65159f28953 Kalle Valo 2019-11-23  4592  	u8 type;
d5c65159f28953 Kalle Valo 2019-11-23  4593  	struct htt_ext_stats_cfg_param=
s cfg_params =3D { 0 };
d5c65159f28953 Kalle Valo 2019-11-23  4594  	int ret;
d5c65159f28953 Kalle Valo 2019-11-23  4595  =

d5c65159f28953 Kalle Valo 2019-11-23  4596  	ret =3D kstrtou8_from_user(use=
r_buf, count, 0, &type);
d5c65159f28953 Kalle Valo 2019-11-23  4597  	if (ret)
d5c65159f28953 Kalle Valo 2019-11-23  4598  		return ret;
d5c65159f28953 Kalle Valo 2019-11-23  4599  =

d5c65159f28953 Kalle Valo 2019-11-23  4600  	if (type >=3D ATH11K_DBG_HTT_N=
UM_EXT_STATS ||
d5c65159f28953 Kalle Valo 2019-11-23  4601  	    type =3D=3D ATH11K_DBG_HTT=
_EXT_STATS_RESET)
d5c65159f28953 Kalle Valo 2019-11-23  4602  		return -E2BIG;
d5c65159f28953 Kalle Valo 2019-11-23  4603  =

d5c65159f28953 Kalle Valo 2019-11-23 @4604  	mutex_lock(&ar->conf_mutex);
d5c65159f28953 Kalle Valo 2019-11-23  4605  	cfg_params.cfg0 =3D HTT_STAT_D=
EFAULT_RESET_START_OFFSET;
d5c65159f28953 Kalle Valo 2019-11-23  4606  	cfg_params.cfg1 =3D 1 << (cfg_=
params.cfg0 + type);
d5c65159f28953 Kalle Valo 2019-11-23  4607  	ret =3D ath11k_dp_tx_htt_h2t_e=
xt_stats_req(ar,
d5c65159f28953 Kalle Valo 2019-11-23  4608  						 ATH11K_DBG_HTT_EXT_STATS=
_RESET,
d5c65159f28953 Kalle Valo 2019-11-23  4609  						 &cfg_params,
d5c65159f28953 Kalle Valo 2019-11-23  4610  						 0ULL);
d5c65159f28953 Kalle Valo 2019-11-23  4611  	if (ret) {
d5c65159f28953 Kalle Valo 2019-11-23  4612  		ath11k_warn(ar->ab, "failed t=
o send htt stats request: %d\n", ret);
d5c65159f28953 Kalle Valo 2019-11-23 @4613  		return ret;
d5c65159f28953 Kalle Valo 2019-11-23  4614  	}
d5c65159f28953 Kalle Valo 2019-11-23  4615  =

d5c65159f28953 Kalle Valo 2019-11-23  4616  	ar->debug.htt_stats.reset =3D =
type;
d5c65159f28953 Kalle Valo 2019-11-23  4617  	mutex_unlock(&ar->conf_mutex);
d5c65159f28953 Kalle Valo 2019-11-23  4618  =

d5c65159f28953 Kalle Valo 2019-11-23  4619  	ret =3D count;
d5c65159f28953 Kalle Valo 2019-11-23  4620  =

d5c65159f28953 Kalle Valo 2019-11-23  4621  	return ret;
d5c65159f28953 Kalle Valo 2019-11-23  4622  }
d5c65159f28953 Kalle Valo 2019-11-23  4623  =


:::::: The code at line 4613 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3908088770776379074==--

