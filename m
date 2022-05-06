Content-Type: multipart/mixed; boundary="===============5638660103263107786=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 510/9759] drivers/net/wireless/ath/ath11k/peer.c:19:13: warning: Uninitialized variable: peer->peer_id [uninitvar]
Date: Sat, 07 May 2022 04:07:27 +0800
Message-ID: <202205070319.famiTomG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5638660103263107786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: 7b0c70d92a435913f6e11d6a248b935697e8a3eb [510/9759] ath11k: Add pee=
r rhash table support
:::::: branch date: 12 hours ago
:::::: commit date: 6 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7b0c70d92a435913f6e11d6a248b935697e8a3eb
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/wow.c:365:8: warning: Local variable 're=
t' shadows outer variable [shadowVariable]
      int ret;
          ^
   drivers/net/wireless/ath/ath11k/wow.c:332:6: note: Shadowed declaration
    int ret, i;
        ^
   drivers/net/wireless/ath/ath11k/wow.c:365:8: note: Shadow variable
      int ret;
          ^
   drivers/net/wireless/ath/ath11k/mac.c:2193:9: warning: Local variable 'i=
' shadows outer variable [shadowVariable]
       int i;
           ^
   drivers/net/wireless/ath/ath11k/mac.c:2086:6: note: Shadowed declaration
    int i, he_nss, nss_idx;
        ^
   drivers/net/wireless/ath/ath11k/mac.c:2193:9: note: Shadow variable
       int i;
           ^
   drivers/net/wireless/ath/ath11k/mac.c:3252:7: warning: Local variable 'p=
reamble' shadows outer variable [shadowVariable]
     u32 preamble;
         ^
   drivers/net/wireless/ath/ath11k/mac.c:3103:6: note: Shadowed declaration
    u32 preamble;
        ^
   drivers/net/wireless/ath/ath11k/mac.c:3252:7: note: Shadow variable
     u32 preamble;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/ath/wcn36xx/main.c:452:11: warning: Identical inner=
 'if' condition is always true. [identicalInnerCondition]
      if (wcn->sw_scan_channel)
             ^
   drivers/net/wireless/ath/wcn36xx/main.c:447:42: note: outer condition: w=
cn->sw_scan_channel
     if (wcn->sw_scan_opchannel =3D=3D ch && wcn->sw_scan_channel) {
                                            ^
   drivers/net/wireless/ath/wcn36xx/main.c:452:11: note: identical inner co=
ndition: wcn->sw_scan_channel
      if (wcn->sw_scan_channel)
             ^
>> drivers/net/wireless/ath/wcn36xx/main.c:382:29: warning: Uninitialized v=
ariables: tmp.list, tmp.dtim_period, tmp.encrypt_type, tmp.is_joining, tmp.=
sta_assoc, tmp.ssid, tmp.bss_type, tmp.pw_state, tmp.bss_index, tmp.self_st=
a_index, tmp.self_dpu_desc_index, tmp.self_ucast_dpu_sign, tmp.rekey_data, =
tmp.sta_list, tmp.bmps_fail_ct [uninitvar]
     vif =3D wcn36xx_priv_to_vif(tmp);
                               ^
   drivers/net/wireless/ath/wcn36xx/main.c:514:29: warning: Uninitialized v=
ariables: tmp.list, tmp.dtim_period, tmp.encrypt_type, tmp.is_joining, tmp.=
sta_assoc, tmp.ssid, tmp.bss_type, tmp.pw_state, tmp.bss_index, tmp.self_st=
a_index, tmp.self_dpu_desc_index, tmp.self_ucast_dpu_sign, tmp.rekey_data, =
tmp.sta_list, tmp.bmps_fail_ct [uninitvar]
     vif =3D wcn36xx_priv_to_vif(tmp);
                               ^
--
>> drivers/net/wireless/ath/ath11k/peer.c:19:13: warning: Uninitialized var=
iable: peer->peer_id [uninitvar]
     if (peer->peer_id !=3D peer_id)
               ^
   drivers/net/wireless/ath/ath11k/peer.c:36:13: warning: Uninitialized var=
iable: peer->vdev_id [uninitvar]
     if (peer->vdev_id !=3D vdev_id)
               ^
   drivers/net/wireless/ath/ath11k/peer.c:87:24: warning: Uninitialized var=
iable: peer->vdev_id [uninitvar]
     if (vdev_id =3D=3D peer->vdev_id) {
                          ^
   drivers/net/wireless/ath/ath11k/peer.c:250:13: warning: Uninitialized va=
riable: peer->vdev_id [uninitvar]
     if (peer->vdev_id !=3D vdev_id)
               ^
--
   drivers/net/wireless/ath/ath11k/mac.c:7982:33: warning: Parameter 'chann=
el' can be declared with const [constParameter]
         struct ieee80211_channel *channel)
                                   ^
   drivers/net/wireless/ath/ath11k/mac.c:2932:7: warning: Uninitialized var=
iable: ret [uninitvar]
    if (!ret)
         ^
>> drivers/net/wireless/ath/ath11k/mac.c:881:34: warning: Uninitialized var=
iables: peer.list, peer.sta, peer.vdev_id, peer.peer_id, peer.ast_hash, pee=
r.pdev_idx, peer.hw_peer_id, peer.rhash_id, peer.rhash_addr, peer.tfm_mmic,=
 peer.mcast_keyidx, peer.ucast_keyidx, peer.sec_type, peer.sec_type_grp, pe=
er.is_authorized [uninitvar]
     ath11k_peer_rx_tid_cleanup(ar, peer);
                                    ^
   drivers/net/wireless/ath/ath11k/mac.c:7769:13: warning: Uninitialized va=
riable: peer->sta [uninitvar]
     if (peer->sta) {
               ^
   drivers/net/wireless/ath/ath11k/mac.c:7760:22: note: Assuming condition =
is false
    if (!vht_fixed_rate && !he_fixed_rate)
                        ^
   drivers/net/wireless/ath/ath11k/mac.c:7769:13: note: Uninitialized varia=
ble: peer->sta
     if (peer->sta) {
               ^

vim +19 drivers/net/wireless/ath/ath11k/peer.c

d5c65159f28953 Kalle Valo             2019-11-23  10  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  11  static struct ath11k_=
peer *ath11k_peer_find_list_by_id(struct ath11k_base *ab,
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  12  						       int peer=
_id)
d5c65159f28953 Kalle Valo             2019-11-23  13  {
d5c65159f28953 Kalle Valo             2019-11-23  14  	struct ath11k_peer *=
peer;
d5c65159f28953 Kalle Valo             2019-11-23  15  =

d5c65159f28953 Kalle Valo             2019-11-23  16  	lockdep_assert_held(=
&ab->base_lock);
d5c65159f28953 Kalle Valo             2019-11-23  17  =

d5c65159f28953 Kalle Valo             2019-11-23  18  	list_for_each_entry(=
peer, &ab->peers, list) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23 @19  		if (peer->peer_id !=
=3D peer_id)
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  20  			continue;
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  21  =

1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  22  		return peer;
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  23  	}
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  24  =

1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  25  	return NULL;
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  26  }
1e744bf218b54d Karthikeyan Periyasamy 2020-04-08  27  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5638660103263107786==--

