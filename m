Content-Type: multipart/mixed; boundary="===============2697838550566314506=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 6663/7905] drivers/net/wireless/ath/ath11k/mac.c:3706:7: warning: Redundant initialization for 'info'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Sun, 10 May 2020 09:50:15 +0800
Message-ID: <202005100911.nORSVIw0%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2697838550566314506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: John Crispin <john@phrozen.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Shashidhar Lakkavalli <slakkavalli@datto.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   30e2206e11ce27ae910cc0dab21472429e400a87
commit: e7f33e0c52c0df42f817a8468bf55be6648f9b5f [6663/7905] ath11k: add tx=
 hw 802.11 encapsulation offloading support
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/wireless/ath/ath11k/mac.c:4480:2: warning: Assignment of fun=
ction parameter has no effect outside the function. [uselessAssignmentArg]
    changed_flags &=3D SUPPORTED_FILTERS;
    ^
>> drivers/net/wireless/ath/ath11k/mac.c:3706:7: warning: Redundant initial=
ization for 'info'. The initialized value is overwritten before it is read.=
 [redundantInitialization]
    info =3D IEEE80211_SKB_CB(msdu);
         ^
   drivers/net/wireless/ath/ath11k/mac.c:3696:33: note: info is initialized
    struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(msdu);
                                   ^
   drivers/net/wireless/ath/ath11k/mac.c:3706:7: note: info is overwritten
    info =3D IEEE80211_SKB_CB(msdu);
         ^
   drivers/net/wireless/ath/ath11k/mac.c:1876:7: warning: Local variable 'p=
reamble' shadows outer variable [shadowVariable]
     u32 preamble;
         ^
   drivers/net/wireless/ath/ath11k/mac.c:1745:6: note: Shadowed declaration
    u32 preamble;
        ^
   drivers/net/wireless/ath/ath11k/mac.c:1876:7: note: Shadow variable
     u32 preamble;
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3De7f33e0c52c0df42f817a8468bf55be6648f9b5f
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout e7f33e0c52c0df42f817a8468bf55be6648f9b5f
vim +/info +3706 drivers/net/wireless/ath/ath11k/mac.c

d5c65159f28953 Kalle Valo   2019-11-23  3692  =

d5c65159f28953 Kalle Valo   2019-11-23  3693  int ath11k_mac_tx_mgmt_pendin=
g_free(int buf_id, void *skb, void *ctx)
d5c65159f28953 Kalle Valo   2019-11-23  3694  {
e7f33e0c52c0df John Crispin 2020-05-05  3695  	struct sk_buff *msdu =3D skb;
e7f33e0c52c0df John Crispin 2020-05-05  3696  	struct ieee80211_tx_info *in=
fo =3D IEEE80211_SKB_CB(msdu);
d5c65159f28953 Kalle Valo   2019-11-23  3697  	struct ath11k *ar =3D ctx;
d5c65159f28953 Kalle Valo   2019-11-23  3698  	struct ath11k_base *ab =3D a=
r->ab;
d5c65159f28953 Kalle Valo   2019-11-23  3699  =

d5c65159f28953 Kalle Valo   2019-11-23  3700  	spin_lock_bh(&ar->txmgmt_idr=
_lock);
d5c65159f28953 Kalle Valo   2019-11-23  3701  	idr_remove(&ar->txmgmt_idr, =
buf_id);
d5c65159f28953 Kalle Valo   2019-11-23  3702  	spin_unlock_bh(&ar->txmgmt_i=
dr_lock);
d5c65159f28953 Kalle Valo   2019-11-23  3703  	dma_unmap_single(ab->dev, AT=
H11K_SKB_CB(msdu)->paddr, msdu->len,
d5c65159f28953 Kalle Valo   2019-11-23  3704  			 DMA_TO_DEVICE);
d5c65159f28953 Kalle Valo   2019-11-23  3705  =

d5c65159f28953 Kalle Valo   2019-11-23 @3706  	info =3D IEEE80211_SKB_CB(ms=
du);
d5c65159f28953 Kalle Valo   2019-11-23  3707  	memset(&info->status, 0, siz=
eof(info->status));
d5c65159f28953 Kalle Valo   2019-11-23  3708  =

d5c65159f28953 Kalle Valo   2019-11-23  3709  	ieee80211_free_txskb(ar->hw,=
 msdu);
d5c65159f28953 Kalle Valo   2019-11-23  3710  =

d5c65159f28953 Kalle Valo   2019-11-23  3711  	return 0;
d5c65159f28953 Kalle Valo   2019-11-23  3712  }
d5c65159f28953 Kalle Valo   2019-11-23  3713  =


:::::: The code at line 3706 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2697838550566314506==--

