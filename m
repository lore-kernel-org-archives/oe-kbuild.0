Content-Type: multipart/mixed; boundary="===============7931836799997364714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvalo-ath:pending 52/56] drivers/net/wireless/ath/ath11k/wmi.c:5651 ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol 'len'.
Date: Sat, 11 Dec 2021 04:16:15 +0800
Message-ID: <202112110427.o6xDAKfE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7931836799997364714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
TO: Wen Gong <quic_wgong@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   34cbb4043dca455fca888e1ced323e588912b6a2
commit: bc5c448b70ff141f8a2b5cbbab79fba08d7a1be0 [52/56] ath11k: report rss=
i of each chain to mac80211 for QCA6390/WCN6855
:::::: branch date: 26 hours ago
:::::: commit date: 33 hours ago
config: riscv-randconfig-m031-20211210 (https://download.01.org/0day-ci/arc=
hive/20211211/202112110427.o6xDAKfE-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/wmi.c:5651 ath11k_wmi_tlv_fw_stats_data_par=
se() error: uninitialized symbol 'len'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:317 arch_atomic_sub_if_positive() warn: inc=
onsistent indenting
drivers/net/wireless/ath/ath11k/wmi.c:5674 ath11k_wmi_tlv_fw_stats_data_par=
se() error: uninitialized symbol 'len'.
drivers/net/wireless/ath/ath11k/wmi.c:5695 ath11k_wmi_tlv_fw_stats_data_par=
se() error: uninitialized symbol 'len'.
drivers/net/wireless/ath/ath11k/wmi.c:6608 ath11k_mgmt_rx_event() warn: 'rx=
_ev.snr + -95' 4294967201 can't fit into 127 'status->signal'

vim +/len +5651 drivers/net/wireless/ath/ath11k/wmi.c

bc5c448b70ff14 Wen Gong   2021-12-08  5628  =

bc5c448b70ff14 Wen Gong   2021-12-08  5629  static int ath11k_wmi_tlv_fw_st=
ats_data_parse(struct ath11k_base *ab,
bc5c448b70ff14 Wen Gong   2021-12-08  5630  					      struct wmi_tlv_fw_st=
ats_parse *parse,
bc5c448b70ff14 Wen Gong   2021-12-08  5631  					      const void *ptr)
bc5c448b70ff14 Wen Gong   2021-12-08  5632  {
bc5c448b70ff14 Wen Gong   2021-12-08  5633  	struct ath11k_fw_stats *stats =
=3D parse->stats;
bc5c448b70ff14 Wen Gong   2021-12-08  5634  	const struct wmi_stats_event *=
ev =3D parse->ev;
bc5c448b70ff14 Wen Gong   2021-12-08  5635  	int i;
bc5c448b70ff14 Wen Gong   2021-12-08  5636  	const void *data =3D ptr;
bc5c448b70ff14 Wen Gong   2021-12-08  5637  	u32 len;
bc5c448b70ff14 Wen Gong   2021-12-08  5638  =

bc5c448b70ff14 Wen Gong   2021-12-08  5639  	if (!ev) {
bc5c448b70ff14 Wen Gong   2021-12-08  5640  		ath11k_warn(ab, "failed to fe=
tch update stats ev");
bc5c448b70ff14 Wen Gong   2021-12-08  5641  		return -EPROTO;
bc5c448b70ff14 Wen Gong   2021-12-08  5642  	}
d5c65159f28953 Kalle Valo 2019-11-23  5643  =

d5c65159f28953 Kalle Valo 2019-11-23  5644  	stats->stats_id =3D 0;
d5c65159f28953 Kalle Valo 2019-11-23  5645  =

d5c65159f28953 Kalle Valo 2019-11-23  5646  	for (i =3D 0; i < ev->num_pdev=
_stats; i++) {
d5c65159f28953 Kalle Valo 2019-11-23  5647  		const struct wmi_pdev_stats *=
src;
d5c65159f28953 Kalle Valo 2019-11-23  5648  		struct ath11k_fw_stats_pdev *=
dst;
d5c65159f28953 Kalle Valo 2019-11-23  5649  =

d5c65159f28953 Kalle Valo 2019-11-23  5650  		src =3D data;
bc5c448b70ff14 Wen Gong   2021-12-08 @5651  		if (len < sizeof(*src))
d5c65159f28953 Kalle Valo 2019-11-23  5652  			return -EPROTO;
d5c65159f28953 Kalle Valo 2019-11-23  5653  =

d5c65159f28953 Kalle Valo 2019-11-23  5654  		stats->stats_id =3D WMI_REQUE=
ST_PDEV_STAT;
d5c65159f28953 Kalle Valo 2019-11-23  5655  =

d5c65159f28953 Kalle Valo 2019-11-23  5656  		data +=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5657  		len -=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5658  =

d5c65159f28953 Kalle Valo 2019-11-23  5659  		dst =3D kzalloc(sizeof(*dst),=
 GFP_ATOMIC);
d5c65159f28953 Kalle Valo 2019-11-23  5660  		if (!dst)
d5c65159f28953 Kalle Valo 2019-11-23  5661  			continue;
d5c65159f28953 Kalle Valo 2019-11-23  5662  =

d5c65159f28953 Kalle Valo 2019-11-23  5663  		ath11k_wmi_pull_pdev_stats_ba=
se(&src->base, dst);
d5c65159f28953 Kalle Valo 2019-11-23  5664  		ath11k_wmi_pull_pdev_stats_tx=
(&src->tx, dst);
d5c65159f28953 Kalle Valo 2019-11-23  5665  		ath11k_wmi_pull_pdev_stats_rx=
(&src->rx, dst);
d5c65159f28953 Kalle Valo 2019-11-23  5666  		list_add_tail(&dst->list, &st=
ats->pdevs);
d5c65159f28953 Kalle Valo 2019-11-23  5667  	}
d5c65159f28953 Kalle Valo 2019-11-23  5668  =

d5c65159f28953 Kalle Valo 2019-11-23  5669  	for (i =3D 0; i < ev->num_vdev=
_stats; i++) {
d5c65159f28953 Kalle Valo 2019-11-23  5670  		const struct wmi_vdev_stats *=
src;
d5c65159f28953 Kalle Valo 2019-11-23  5671  		struct ath11k_fw_stats_vdev *=
dst;
d5c65159f28953 Kalle Valo 2019-11-23  5672  =

d5c65159f28953 Kalle Valo 2019-11-23  5673  		src =3D data;
bc5c448b70ff14 Wen Gong   2021-12-08  5674  		if (len < sizeof(*src))
d5c65159f28953 Kalle Valo 2019-11-23  5675  			return -EPROTO;
d5c65159f28953 Kalle Valo 2019-11-23  5676  =

d5c65159f28953 Kalle Valo 2019-11-23  5677  		stats->stats_id =3D WMI_REQUE=
ST_VDEV_STAT;
d5c65159f28953 Kalle Valo 2019-11-23  5678  =

d5c65159f28953 Kalle Valo 2019-11-23  5679  		data +=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5680  		len -=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5681  =

d5c65159f28953 Kalle Valo 2019-11-23  5682  		dst =3D kzalloc(sizeof(*dst),=
 GFP_ATOMIC);
d5c65159f28953 Kalle Valo 2019-11-23  5683  		if (!dst)
d5c65159f28953 Kalle Valo 2019-11-23  5684  			continue;
d5c65159f28953 Kalle Valo 2019-11-23  5685  =

d5c65159f28953 Kalle Valo 2019-11-23  5686  		ath11k_wmi_pull_vdev_stats(sr=
c, dst);
d5c65159f28953 Kalle Valo 2019-11-23  5687  		list_add_tail(&dst->list, &st=
ats->vdevs);
d5c65159f28953 Kalle Valo 2019-11-23  5688  	}
d5c65159f28953 Kalle Valo 2019-11-23  5689  =

d5c65159f28953 Kalle Valo 2019-11-23  5690  	for (i =3D 0; i < ev->num_bcn_=
stats; i++) {
d5c65159f28953 Kalle Valo 2019-11-23  5691  		const struct wmi_bcn_stats *s=
rc;
d5c65159f28953 Kalle Valo 2019-11-23  5692  		struct ath11k_fw_stats_bcn *d=
st;
d5c65159f28953 Kalle Valo 2019-11-23  5693  =

d5c65159f28953 Kalle Valo 2019-11-23  5694  		src =3D data;
bc5c448b70ff14 Wen Gong   2021-12-08  5695  		if (len < sizeof(*src))
d5c65159f28953 Kalle Valo 2019-11-23  5696  			return -EPROTO;
d5c65159f28953 Kalle Valo 2019-11-23  5697  =

d5c65159f28953 Kalle Valo 2019-11-23  5698  		stats->stats_id =3D WMI_REQUE=
ST_BCN_STAT;
d5c65159f28953 Kalle Valo 2019-11-23  5699  =

d5c65159f28953 Kalle Valo 2019-11-23  5700  		data +=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5701  		len -=3D sizeof(*src);
d5c65159f28953 Kalle Valo 2019-11-23  5702  =

d5c65159f28953 Kalle Valo 2019-11-23  5703  		dst =3D kzalloc(sizeof(*dst),=
 GFP_ATOMIC);
d5c65159f28953 Kalle Valo 2019-11-23  5704  		if (!dst)
d5c65159f28953 Kalle Valo 2019-11-23  5705  			continue;
d5c65159f28953 Kalle Valo 2019-11-23  5706  =

d5c65159f28953 Kalle Valo 2019-11-23  5707  		ath11k_wmi_pull_bcn_stats(src=
, dst);
d5c65159f28953 Kalle Valo 2019-11-23  5708  		list_add_tail(&dst->list, &st=
ats->bcn);
d5c65159f28953 Kalle Valo 2019-11-23  5709  	}
d5c65159f28953 Kalle Valo 2019-11-23  5710  =

d5c65159f28953 Kalle Valo 2019-11-23  5711  	return 0;
d5c65159f28953 Kalle Valo 2019-11-23  5712  }
d5c65159f28953 Kalle Valo 2019-11-23  5713  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7931836799997364714==--

