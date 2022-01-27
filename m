Content-Type: multipart/mixed; boundary="===============0959105463892230255=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/dp_rx.c:5372 ath11k_dp_rx_full_mon_deliver_ppdu() error: uninitialized symbol 'ret'.
Date: Thu, 27 Jan 2022 19:06:44 +0800
Message-ID: <202201271916.JALV74tL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0959105463892230255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 7e2ea2e947046834a450295dfd328adb70a9f864 ath11k: Process full monit=
or mode rx support
date:   7 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: microblaze-randconfig-m031-20220127 (https://download.01.org/0day-c=
i/archive/20220127/202201271916.JALV74tL-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/dp_rx.c:5372 ath11k_dp_rx_full_mon_deliver_=
ppdu() error: uninitialized symbol 'ret'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
drivers/net/wireless/ath/ath11k/dp_rx.c:1671 ath11k_htt_backpressure_event_=
handler() warn: potential spectre issue 'ab->soc_stats.bp_stats.umac_ring_b=
p_stats' [r]

vim +/ret +5372 drivers/net/wireless/ath/ath11k/dp_rx.c

7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5343  =

7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5344  static int ath11k_dp_rx_fu=
ll_mon_deliver_ppdu(struct ath11k *ar,
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5345  					      int mac_id,
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5346  					      struct ath11k_m=
on_data *pmon,
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5347  					      struct napi_str=
uct *napi)
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5348  {
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5349  	struct ath11k_pdev_mon_st=
ats *rx_mon_stats;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5350  	struct dp_full_mon_mpdu *=
tmp;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5351  	struct dp_full_mon_mpdu *=
mon_mpdu =3D pmon->mon_mpdu;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5352  	struct sk_buff *head_msdu=
, *tail_msdu;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5353  	struct ath11k_base *ab =
=3D ar->ab;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5354  	struct ath11k_dp *dp =3D =
&ab->dp;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5355  	int ret;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5356  =

7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5357  	rx_mon_stats =3D &pmon->r=
x_mon_stats;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5358  =

7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5359  	list_for_each_entry_safe(=
mon_mpdu, tmp, &dp->dp_full_mon_mpdu_list, list) {
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5360  		list_del(&mon_mpdu->list=
);
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5361  		head_msdu =3D mon_mpdu->=
head;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5362  		tail_msdu =3D mon_mpdu->=
tail;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5363  		if (head_msdu && tail_ms=
du) {
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5364  			ret =3D ath11k_dp_rx_mo=
n_deliver(ar, mac_id, head_msdu,
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5365  						       tail_msdu, na=
pi);
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5366  			rx_mon_stats->dest_mpdu=
_done++;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5367  			ath11k_dbg(ar->ab, ATH1=
1K_DBG_DATA, "full mon: deliver ppdu\n");
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5368  		}
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5369  		kfree(mon_mpdu);
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5370  	}
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5371  =

7e2ea2e9470468 Anilkumar Kolli 2021-12-08 @5372  	return ret;
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5373  }
7e2ea2e9470468 Anilkumar Kolli 2021-12-08  5374  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0959105463892230255==--

