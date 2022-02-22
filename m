Content-Type: multipart/mixed; boundary="===============3393222833188902262=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kvalo-ath:pending 33/42] drivers/net/wireless/ath/ath11k/hal_rx.c:1246:3: warning: Value stored to 'he_stbc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 23 Feb 2022 07:10:14 +0800
Message-ID: <202202230731.bSpDCarB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3393222833188902262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
TO: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Miles Hu <milehu@codeaurora.org>
CC: Anilkumar Kolli <akolli@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   4136ddcfda28450e2d01173e37300b95c8687d9b
commit: 20168f00578862c259f02f179971f71c51a2a7a4 [33/42] ath11k: translate =
HE status to radiotap format
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20223/202202230731.bSpDCarB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/com=
mit/?id=3D20168f00578862c259f02f179971f71c51a2a7a4
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kerne=
l/git/kvalo/ath.git
        git fetch --no-tags kvalo-ath pending
        git checkout 20168f00578862c259f02f179971f71c51a2a7a4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/cache.c:1081:4: note: Taking false branch
                           if (test_bit(CACHE_PENDING, &ch->flags))
                           ^
   net/sunrpc/cache.c:1084:8: note: Assuming field 'readers' is equal to 0
                           if (cr->readers !=3D 0)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/cache.c:1084:4: note: Taking false branch
                           if (cr->readers !=3D 0)
                           ^
   net/sunrpc/cache.c:1076:2: note: Loop condition is false. Execution cont=
inues on line 1088
           list_for_each_entry_safe(cq, tmp, &detail->queue, list)
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   net/sunrpc/cache.c:1089:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&dequeued)) {
           ^
   net/sunrpc/cache.c:1094:3: note: Memory is released
                   kfree(cr);
                   ^~~~~~~~~
   net/sunrpc/cache.c:1089:2: note: Loop condition is true.  Entering loop =
body
           while (!list_empty(&dequeued)) {
           ^
   net/sunrpc/cache.c:1091:3: note: Calling 'list_del'
                   list_del(&cr->q.list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/net/wireless/ath/ath11k/hal_rx.c:1246:3: warning: Value stored t=
o 'he_stbc' is never read [clang-analyzer-deadcode.DeadStores]
                   he_stbc =3D value;
                   ^         ~~~~~
   drivers/net/wireless/ath/ath11k/hal_rx.c:1246:3: note: Value stored to '=
he_stbc' is never read
                   he_stbc =3D value;
                   ^         ~~~~~
>> drivers/net/wireless/ath/ath11k/hal_rx.c:1415:3: warning: Value stored t=
o 'he_dcm' is never read [clang-analyzer-deadcode.DeadStores]
                   he_dcm =3D value;
                   ^        ~~~~~
   drivers/net/wireless/ath/ath11k/hal_rx.c:1415:3: note: Value stored to '=
he_dcm' is never read
                   he_dcm =3D value;
                   ^        ~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/net/wireless/ath/ath11k/wmi.c:953:2: warning: Value stored to 'p=
tr' is never read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:953:2: note: Value stored to 'ptr'=
 is never read
           ptr +=3D sizeof(*tlv);
           ^      ~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/wmi.c:6617:7: warning: 2nd function call=
 argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           ar =3D ath11k_mac_get_ar_by_vdev_id(ab, peer_del_resp.vdev_id);
                ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:62:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Taking false branch
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/wmi.c:7774:7: note: Loop condition is fa=
lse.  Exiting loop
           id =3D FIELD_GET(WMI_CMD_HDR_CMD_ID, (cmd_hdr->cmd_id));
                ^
   include/linux/bitfield.h:125:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:64:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG((_mask) =3D=3D 0, _pfx "mask is zero");=
    \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \

vim +/he_stbc +1246 drivers/net/wireless/ath/ath11k/hal_rx.c

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   867  =

d5c65159f28953 Kalle Valo             2019-11-23   868  static enum hal_rx_=
mon_status
d5c65159f28953 Kalle Valo             2019-11-23   869  ath11k_hal_rx_parse=
_mon_status_tlv(struct ath11k_base *ab,
d5c65159f28953 Kalle Valo             2019-11-23   870  				   struct hal_r=
x_mon_ppdu_info *ppdu_info,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   871  				   u32 tlv_tag,=
 u8 *tlv_data, u32 userid)
d5c65159f28953 Kalle Valo             2019-11-23   872  {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   873  	u32 info0, info1, =
value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   874  	u8 he_dcm =3D 0, h=
e_stbc =3D 0;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   875  	u16 he_gi =3D 0, h=
e_ltf =3D 0;
d5c65159f28953 Kalle Valo             2019-11-23   876  =

d5c65159f28953 Kalle Valo             2019-11-23   877  	switch (tlv_tag) {
d5c65159f28953 Kalle Valo             2019-11-23   878  	case HAL_RX_PPDU_S=
TART: {
d5c65159f28953 Kalle Valo             2019-11-23   879  		struct hal_rx_ppd=
u_start *ppdu_start =3D
d5c65159f28953 Kalle Valo             2019-11-23   880  			(struct hal_rx_p=
pdu_start *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23   881  =

d5c65159f28953 Kalle Valo             2019-11-23   882  		ppdu_info->ppdu_i=
d =3D
d5c65159f28953 Kalle Valo             2019-11-23   883  			FIELD_GET(HAL_RX=
_PPDU_START_INFO0_PPDU_ID,
d5c65159f28953 Kalle Valo             2019-11-23   884  				  __le32_to_cpu=
(ppdu_start->info0));
d5c65159f28953 Kalle Valo             2019-11-23   885  		ppdu_info->chan_n=
um =3D __le32_to_cpu(ppdu_start->chan_num);
d5c65159f28953 Kalle Valo             2019-11-23   886  		ppdu_info->ppdu_t=
s =3D __le32_to_cpu(ppdu_start->ppdu_start_ts);
d5c65159f28953 Kalle Valo             2019-11-23   887  		break;
d5c65159f28953 Kalle Valo             2019-11-23   888  	}
d5c65159f28953 Kalle Valo             2019-11-23   889  	case HAL_RX_PPDU_E=
ND_USER_STATS: {
d5c65159f28953 Kalle Valo             2019-11-23   890  		struct hal_rx_ppd=
u_end_user_stats *eu_stats =3D
d5c65159f28953 Kalle Valo             2019-11-23   891  			(struct hal_rx_p=
pdu_end_user_stats *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23   892  =

d5c65159f28953 Kalle Valo             2019-11-23   893  		info0 =3D __le32_=
to_cpu(eu_stats->info0);
d5c65159f28953 Kalle Valo             2019-11-23   894  		info1 =3D __le32_=
to_cpu(eu_stats->info1);
d5c65159f28953 Kalle Valo             2019-11-23   895  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   896  		ppdu_info->ast_in=
dex =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   897  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO2_AST_INDEX,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   898  				  __le32_to_cpu=
(eu_stats->info2));
d5c65159f28953 Kalle Valo             2019-11-23   899  		ppdu_info->tid =
=3D
d5c65159f28953 Kalle Valo             2019-11-23   900  			ffs(FIELD_GET(HA=
L_RX_PPDU_END_USER_STATS_INFO6_TID_BITMAP,
d5c65159f28953 Kalle Valo             2019-11-23   901  				      __le32_to=
_cpu(eu_stats->info6))) - 1;
d5c65159f28953 Kalle Valo             2019-11-23   902  		ppdu_info->tcp_ms=
du_count =3D
d5c65159f28953 Kalle Valo             2019-11-23   903  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO4_TCP_MSDU_CNT,
d5c65159f28953 Kalle Valo             2019-11-23   904  				  __le32_to_cpu=
(eu_stats->info4));
d5c65159f28953 Kalle Valo             2019-11-23   905  		ppdu_info->udp_ms=
du_count =3D
d5c65159f28953 Kalle Valo             2019-11-23   906  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO4_UDP_MSDU_CNT,
d5c65159f28953 Kalle Valo             2019-11-23   907  				  __le32_to_cpu=
(eu_stats->info4));
d5c65159f28953 Kalle Valo             2019-11-23   908  		ppdu_info->other_=
msdu_count =3D
d5c65159f28953 Kalle Valo             2019-11-23   909  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO5_OTHER_MSDU_CNT,
d5c65159f28953 Kalle Valo             2019-11-23   910  				  __le32_to_cpu=
(eu_stats->info5));
d5c65159f28953 Kalle Valo             2019-11-23   911  		ppdu_info->tcp_ac=
k_msdu_count =3D
d5c65159f28953 Kalle Valo             2019-11-23   912  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO5_TCP_ACK_MSDU_CNT,
d5c65159f28953 Kalle Valo             2019-11-23   913  				  __le32_to_cpu=
(eu_stats->info5));
d5c65159f28953 Kalle Valo             2019-11-23   914  		ppdu_info->preamb=
le_type =3D
d5c65159f28953 Kalle Valo             2019-11-23   915  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO1_PKT_TYPE, info1);
d5c65159f28953 Kalle Valo             2019-11-23   916  		ppdu_info->num_mp=
du_fcs_ok =3D
d5c65159f28953 Kalle Valo             2019-11-23   917  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO1_MPDU_CNT_FCS_OK,
d5c65159f28953 Kalle Valo             2019-11-23   918  				  info1);
d5c65159f28953 Kalle Valo             2019-11-23   919  		ppdu_info->num_mp=
du_fcs_err =3D
d5c65159f28953 Kalle Valo             2019-11-23   920  			FIELD_GET(HAL_RX=
_PPDU_END_USER_STATS_INFO0_MPDU_CNT_FCS_ERR,
d5c65159f28953 Kalle Valo             2019-11-23   921  				  info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   922  		switch (ppdu_info=
->preamble_type) {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   923  		case HAL_RX_PREAM=
BLE_11N:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   924  			ppdu_info->ht_fl=
ags =3D 1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   925  			break;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   926  		case HAL_RX_PREAM=
BLE_11AC:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   927  			ppdu_info->vht_f=
lags =3D 1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   928  			break;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   929  		case HAL_RX_PREAM=
BLE_11AX:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   930  			ppdu_info->he_fl=
ags =3D 1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   931  			break;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   932  		default:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   933  			break;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   934  		}
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   935  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   936  		if (userid < HAL_=
MAX_UL_MU_USERS) {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   937  			struct hal_rx_us=
er_status *rxuser_stats =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   938  				&ppdu_info->use=
rstats;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   939  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   940  			ath11k_hal_rx_ha=
ndle_ofdma_info(tlv_data, rxuser_stats);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   941  			ath11k_hal_rx_po=
pulate_mu_user_info(tlv_data, ppdu_info,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   942  							    rxuser_s=
tats);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   943  		}
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   944  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[0] =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   945  					__le32_to_cpu(=
eu_stats->rsvd1[0]);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   946  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[1] =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   947  					__le32_to_cpu(=
eu_stats->rsvd1[1]);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   948  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   949  		break;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   950  	}
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   951  	case HAL_RX_PPDU_E=
ND_USER_STATS_EXT: {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   952  		struct hal_rx_ppd=
u_end_user_stats_ext *eu_stats =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   953  			(struct hal_rx_p=
pdu_end_user_stats_ext *)tlv_data;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   954  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[2] =3D eu_stats->info1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   955  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[3] =3D eu_stats->info2;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   956  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[4] =3D eu_stats->info3;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   957  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[5] =3D eu_stats->info4;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   958  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[6] =3D eu_stats->info5;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16   959  		ppdu_info->userst=
ats.mpdu_fcs_ok_bitmap[7] =3D eu_stats->info6;
d5c65159f28953 Kalle Valo             2019-11-23   960  		break;
d5c65159f28953 Kalle Valo             2019-11-23   961  	}
d5c65159f28953 Kalle Valo             2019-11-23   962  	case HAL_PHYRX_HT_=
SIG: {
d5c65159f28953 Kalle Valo             2019-11-23   963  		struct hal_rx_ht_=
sig_info *ht_sig =3D
d5c65159f28953 Kalle Valo             2019-11-23   964  			(struct hal_rx_h=
t_sig_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23   965  =

d5c65159f28953 Kalle Valo             2019-11-23   966  		info0 =3D __le32_=
to_cpu(ht_sig->info0);
d5c65159f28953 Kalle Valo             2019-11-23   967  		info1 =3D __le32_=
to_cpu(ht_sig->info1);
d5c65159f28953 Kalle Valo             2019-11-23   968  =

d5c65159f28953 Kalle Valo             2019-11-23   969  		ppdu_info->mcs =
=3D FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_MCS, info0);
d5c65159f28953 Kalle Valo             2019-11-23   970  		ppdu_info->bw =3D=
 FIELD_GET(HAL_RX_HT_SIG_INFO_INFO0_BW, info0);
d5c65159f28953 Kalle Valo             2019-11-23   971  		ppdu_info->is_stb=
c =3D FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_STBC,
d5c65159f28953 Kalle Valo             2019-11-23   972  					       info1);
d5c65159f28953 Kalle Valo             2019-11-23   973  		ppdu_info->ldpc =
=3D FIELD_GET(HAL_RX_HT_SIG_INFO_INFO1_FEC_CODING, info1);
d5c65159f28953 Kalle Valo             2019-11-23   974  		ppdu_info->gi =3D=
 info1 & HAL_RX_HT_SIG_INFO_INFO1_GI;
d5c65159f28953 Kalle Valo             2019-11-23   975  =

d5c65159f28953 Kalle Valo             2019-11-23   976  		switch (ppdu_info=
->mcs) {
d5c65159f28953 Kalle Valo             2019-11-23   977  		case 0 ... 7:
d5c65159f28953 Kalle Valo             2019-11-23   978  			ppdu_info->nss =
=3D 1;
d5c65159f28953 Kalle Valo             2019-11-23   979  			break;
d5c65159f28953 Kalle Valo             2019-11-23   980  		case 8 ... 15:
d5c65159f28953 Kalle Valo             2019-11-23   981  			ppdu_info->nss =
=3D 2;
d5c65159f28953 Kalle Valo             2019-11-23   982  			break;
d5c65159f28953 Kalle Valo             2019-11-23   983  		case 16 ... 23:
d5c65159f28953 Kalle Valo             2019-11-23   984  			ppdu_info->nss =
=3D 3;
d5c65159f28953 Kalle Valo             2019-11-23   985  			break;
d5c65159f28953 Kalle Valo             2019-11-23   986  		case 24 ... 31:
d5c65159f28953 Kalle Valo             2019-11-23   987  			ppdu_info->nss =
=3D 4;
d5c65159f28953 Kalle Valo             2019-11-23   988  			break;
d5c65159f28953 Kalle Valo             2019-11-23   989  		}
d5c65159f28953 Kalle Valo             2019-11-23   990  =

d5c65159f28953 Kalle Valo             2019-11-23   991  		if (ppdu_info->ns=
s > 1)
d5c65159f28953 Kalle Valo             2019-11-23   992  			ppdu_info->mcs =
=3D ppdu_info->mcs % 8;
d5c65159f28953 Kalle Valo             2019-11-23   993  =

d5c65159f28953 Kalle Valo             2019-11-23   994  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_SU;
d5c65159f28953 Kalle Valo             2019-11-23   995  		break;
d5c65159f28953 Kalle Valo             2019-11-23   996  	}
d5c65159f28953 Kalle Valo             2019-11-23   997  	case HAL_PHYRX_L_S=
IG_B: {
d5c65159f28953 Kalle Valo             2019-11-23   998  		struct hal_rx_lsi=
g_b_info *lsigb =3D
d5c65159f28953 Kalle Valo             2019-11-23   999  			(struct hal_rx_l=
sig_b_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1000  =

d5c65159f28953 Kalle Valo             2019-11-23  1001  		ppdu_info->rate =
=3D FIELD_GET(HAL_RX_LSIG_B_INFO_INFO0_RATE,
d5c65159f28953 Kalle Valo             2019-11-23  1002  					    __le32_to_=
cpu(lsigb->info0));
d5c65159f28953 Kalle Valo             2019-11-23  1003  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_SU;
d5c65159f28953 Kalle Valo             2019-11-23  1004  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1005  	}
d5c65159f28953 Kalle Valo             2019-11-23  1006  	case HAL_PHYRX_L_S=
IG_A: {
d5c65159f28953 Kalle Valo             2019-11-23  1007  		struct hal_rx_lsi=
g_a_info *lsiga =3D
d5c65159f28953 Kalle Valo             2019-11-23  1008  			(struct hal_rx_l=
sig_a_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1009  =

d5c65159f28953 Kalle Valo             2019-11-23  1010  		ppdu_info->rate =
=3D FIELD_GET(HAL_RX_LSIG_A_INFO_INFO0_RATE,
d5c65159f28953 Kalle Valo             2019-11-23  1011  					    __le32_to_=
cpu(lsiga->info0));
d5c65159f28953 Kalle Valo             2019-11-23  1012  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_SU;
d5c65159f28953 Kalle Valo             2019-11-23  1013  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1014  	}
d5c65159f28953 Kalle Valo             2019-11-23  1015  	case HAL_PHYRX_VHT=
_SIG_A: {
d5c65159f28953 Kalle Valo             2019-11-23  1016  		struct hal_rx_vht=
_sig_a_info *vht_sig =3D
d5c65159f28953 Kalle Valo             2019-11-23  1017  			(struct hal_rx_v=
ht_sig_a_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1018  		u32 nsts;
d5c65159f28953 Kalle Valo             2019-11-23  1019  		u32 group_id;
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1020  		u8 gi_setting;
d5c65159f28953 Kalle Valo             2019-11-23  1021  =

d5c65159f28953 Kalle Valo             2019-11-23  1022  		info0 =3D __le32_=
to_cpu(vht_sig->info0);
d5c65159f28953 Kalle Valo             2019-11-23  1023  		info1 =3D __le32_=
to_cpu(vht_sig->info1);
d5c65159f28953 Kalle Valo             2019-11-23  1024  =

d5c65159f28953 Kalle Valo             2019-11-23  1025  		ppdu_info->ldpc =
=3D FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_SU_MU_CODING,
d5c65159f28953 Kalle Valo             2019-11-23  1026  					    info0);
d5c65159f28953 Kalle Valo             2019-11-23  1027  		ppdu_info->mcs =
=3D FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_MCS,
d5c65159f28953 Kalle Valo             2019-11-23  1028  					   info1);
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1029  		gi_setting =3D FI=
ELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO1_GI_SETTING,
d5c65159f28953 Kalle Valo             2019-11-23  1030  				       info1);
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1031  		switch (gi_settin=
g) {
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1032  		case HAL_RX_VHT_S=
IG_A_NORMAL_GI:
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1033  			ppdu_info->gi =
=3D HAL_RX_GI_0_8_US;
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1034  			break;
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1035  		case HAL_RX_VHT_S=
IG_A_SHORT_GI:
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1036  		case HAL_RX_VHT_S=
IG_A_SHORT_GI_AMBIGUITY:
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1037  			ppdu_info->gi =
=3D HAL_RX_GI_0_4_US;
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1038  			break;
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1039  		}
28dee8ef7645cd Manikanta Pubbisetty   2019-11-28  1040  =

d5c65159f28953 Kalle Valo             2019-11-23  1041  		ppdu_info->is_stb=
c =3D info0 & HAL_RX_VHT_SIG_A_INFO_INFO0_STBC;
d5c65159f28953 Kalle Valo             2019-11-23  1042  		nsts =3D FIELD_GE=
T(HAL_RX_VHT_SIG_A_INFO_INFO0_NSTS, info0);
d5c65159f28953 Kalle Valo             2019-11-23  1043  		if (ppdu_info->is=
_stbc && nsts > 0)
d5c65159f28953 Kalle Valo             2019-11-23  1044  			nsts =3D ((nsts =
+ 1) >> 1) - 1;
d5c65159f28953 Kalle Valo             2019-11-23  1045  =

d5c65159f28953 Kalle Valo             2019-11-23  1046  		ppdu_info->nss =
=3D (nsts & VHT_SIG_SU_NSS_MASK) + 1;
d5c65159f28953 Kalle Valo             2019-11-23  1047  		ppdu_info->bw =3D=
 FIELD_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_BW,
d5c65159f28953 Kalle Valo             2019-11-23  1048  					  info0);
d5c65159f28953 Kalle Valo             2019-11-23  1049  		ppdu_info->beamfo=
rmed =3D info1 &
d5c65159f28953 Kalle Valo             2019-11-23  1050  					HAL_RX_VHT_SIG=
_A_INFO_INFO1_BEAMFORMED;
d5c65159f28953 Kalle Valo             2019-11-23  1051  		group_id =3D FIEL=
D_GET(HAL_RX_VHT_SIG_A_INFO_INFO0_GROUP_ID,
d5c65159f28953 Kalle Valo             2019-11-23  1052  				     info0);
d5c65159f28953 Kalle Valo             2019-11-23  1053  		if (group_id =3D=
=3D 0 || group_id =3D=3D 63)
d5c65159f28953 Kalle Valo             2019-11-23  1054  			ppdu_info->recep=
tion_type =3D HAL_RX_RECEPTION_TYPE_SU;
d5c65159f28953 Kalle Valo             2019-11-23  1055  		else
d5c65159f28953 Kalle Valo             2019-11-23  1056  			ppdu_info->recep=
tion_type =3D
d5c65159f28953 Kalle Valo             2019-11-23  1057  				HAL_RX_RECEPTIO=
N_TYPE_MU_MIMO;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1058  		ppdu_info->vht_fl=
ag_values5 =3D group_id;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1059  		ppdu_info->vht_fl=
ag_values3[0] =3D (((ppdu_info->mcs) << 4) |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1060  						   ppdu_info-=
>nss);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1061  		ppdu_info->vht_fl=
ag_values2 =3D ppdu_info->bw;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1062  		ppdu_info->vht_fl=
ag_values4 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1063  			FIELD_GET(HAL_RX=
_VHT_SIG_A_INFO_INFO1_SU_MU_CODING, info1);
d5c65159f28953 Kalle Valo             2019-11-23  1064  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1065  	}
d5c65159f28953 Kalle Valo             2019-11-23  1066  	case HAL_PHYRX_HE_=
SIG_A_SU: {
d5c65159f28953 Kalle Valo             2019-11-23  1067  		struct hal_rx_he_=
sig_a_su_info *he_sig_a =3D
d5c65159f28953 Kalle Valo             2019-11-23  1068  			(struct hal_rx_h=
e_sig_a_su_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1069  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1070  		ppdu_info->he_fla=
gs =3D 1;
d5c65159f28953 Kalle Valo             2019-11-23  1071  		info0 =3D __le32_=
to_cpu(he_sig_a->info0);
d5c65159f28953 Kalle Valo             2019-11-23  1072  		info1 =3D __le32_=
to_cpu(he_sig_a->info1);
d5c65159f28953 Kalle Valo             2019-11-23  1073  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1074  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_FORMAT_IND, info0);
d5c65159f28953 Kalle Valo             2019-11-23  1075  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1076  		if (value =3D=3D =
0)
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1077  			ppdu_info->he_da=
ta1 =3D IEEE80211_RADIOTAP_HE_DATA1_FORMAT_TRIG;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1078  		else
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1079  			ppdu_info->he_da=
ta1 =3D IEEE80211_RADIOTAP_HE_DATA1_FORMAT_SU;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1080  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1081  		ppdu_info->he_dat=
a1 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1082  			IEEE80211_RADIOT=
AP_HE_DATA1_BSS_COLOR_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1083  			IEEE80211_RADIOT=
AP_HE_DATA1_BEAM_CHANGE_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1084  			IEEE80211_RADIOT=
AP_HE_DATA1_UL_DL_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1085  			IEEE80211_RADIOT=
AP_HE_DATA1_DATA_MCS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1086  			IEEE80211_RADIOT=
AP_HE_DATA1_DATA_DCM_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1087  			IEEE80211_RADIOT=
AP_HE_DATA1_CODING_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1088  			IEEE80211_RADIOT=
AP_HE_DATA1_LDPC_XSYMSEG_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1089  			IEEE80211_RADIOT=
AP_HE_DATA1_STBC_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1090  			IEEE80211_RADIOT=
AP_HE_DATA1_BW_RU_ALLOC_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1091  			IEEE80211_RADIOT=
AP_HE_DATA1_DOPPLER_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1092  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1093  		ppdu_info->he_dat=
a2 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1094  			IEEE80211_RADIOT=
AP_HE_DATA2_GI_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1095  			IEEE80211_RADIOT=
AP_HE_DATA2_TXBF_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1096  			IEEE80211_RADIOT=
AP_HE_DATA2_PE_DISAMBIG_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1097  			IEEE80211_RADIOT=
AP_HE_DATA2_TXOP_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1098  			IEEE80211_RADIOT=
AP_HE_DATA2_NUM_LTF_SYMS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1099  			IEEE80211_RADIOT=
AP_HE_DATA2_PRE_FEC_PAD_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1100  			IEEE80211_RADIOT=
AP_HE_DATA2_MIDAMBLE_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1101  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1102  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_BSS_COLOR, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1103  		ppdu_info->he_dat=
a3 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1104  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_BSS_COLOR, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1105  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_BEAM_CHANGE, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1106  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1107  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_BEAM_CHANGE, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1108  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_DL_UL_FLAG, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1109  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1110  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_UL_DL, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1111  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_MCS, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1112  		ppdu_info->mcs =
=3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1113  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1114  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_DATA_MCS, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1115  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1116  		he_dcm =3D FIELD_=
GET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_DCM, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1117  		ppdu_info->dcm =
=3D he_dcm;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1118  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1119  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_DATA_DCM, he_dcm);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1120  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_CODING, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1121  		ppdu_info->ldpc =
=3D (value =3D=3D HAL_RX_SU_MU_CODING_LDPC) ? 1 : 0;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1122  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1123  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_CODING, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1124  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_LDPC_EXTRA, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1125  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1126  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_LDPC_XSYMSEG, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1127  		he_stbc =3D FIELD=
_GET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_STBC, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1128  		ppdu_info->is_stb=
c =3D he_stbc;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1129  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1130  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_STBC, he_stbc);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1131  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1132  		/* data4 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1133  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_SPATIAL_REUSE, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1134  		ppdu_info->he_dat=
a4 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1135  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA4_SU_MU_SPTL_REUSE, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1136  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1137  		/* data5 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1138  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_TRANSMIT_BW, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1139  		ppdu_info->bw =3D=
 value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1140  		ppdu_info->he_dat=
a5 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1141  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1142  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_CP_LTF_SIZE, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1143  		switch (value) {
d5c65159f28953 Kalle Valo             2019-11-23  1144  		case 0:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1145  				he_gi =3D HE_GI=
_0_8;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1146  				he_ltf =3D HE_L=
TF_1_X;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1147  				break;
d5c65159f28953 Kalle Valo             2019-11-23  1148  		case 1:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1149  				he_gi =3D HE_GI=
_0_8;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1150  				he_ltf =3D HE_L=
TF_2_X;
d5c65159f28953 Kalle Valo             2019-11-23  1151  				break;
d5c65159f28953 Kalle Valo             2019-11-23  1152  		case 2:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1153  				he_gi =3D HE_GI=
_1_6;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1154  				he_ltf =3D HE_L=
TF_2_X;
d5c65159f28953 Kalle Valo             2019-11-23  1155  				break;
d5c65159f28953 Kalle Valo             2019-11-23  1156  		case 3:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1157  				if (he_dcm && h=
e_stbc) {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1158  					he_gi =3D HE_G=
I_0_8;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1159  					he_ltf =3D HE_=
LTF_4_X;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1160  				} else {
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1161  					he_gi =3D HE_G=
I_3_2;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1162  					he_ltf =3D HE_=
LTF_4_X;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1163  				}
d5c65159f28953 Kalle Valo             2019-11-23  1164  				break;
d5c65159f28953 Kalle Valo             2019-11-23  1165  		}
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1166  		ppdu_info->gi =3D=
 he_gi;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1167  		he_gi =3D (he_gi =
!=3D 0) ? he_gi - 1 : 0;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1168  		ppdu_info->he_dat=
a5 |=3D FIELD_PREP(IEEE80211_RADIOTAP_HE_DATA5_GI, he_gi);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1169  		ppdu_info->ltf_si=
ze =3D he_ltf;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1170  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1171  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_LTF_SIZE,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1172  				   (he_ltf =3D=
=3D HE_LTF_4_X) ? he_ltf - 1 : he_ltf);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1173  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1174  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1175  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1176  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_NUM_LTF_SYMS, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1177  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1178  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_FACTOR, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1179  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1180  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_PRE_FEC_PAD, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1181  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1182  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXBF, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1183  		ppdu_info->beamfo=
rmed =3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1184  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1185  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_TXBF, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1186  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_PKT_EXT_PE_DISAM, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1187  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1188  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_PE_DISAMBIG, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1189  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1190  		/* data6 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1191  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO0_NSTS, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1192  		value++;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1193  		ppdu_info->nss =
=3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1194  		ppdu_info->he_dat=
a6 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1195  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA6_NSTS, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1196  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_DOPPLER_IND, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1197  		ppdu_info->he_dat=
a6 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1198  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA6_DOPPLER, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1199  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_SU_INFO_INFO1_TXOP_DURATION, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1200  		ppdu_info->he_dat=
a6 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1201  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA6_TXOP, value);
d5c65159f28953 Kalle Valo             2019-11-23  1202  =

d5c65159f28953 Kalle Valo             2019-11-23  1203  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_SU;
d5c65159f28953 Kalle Valo             2019-11-23  1204  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1205  	}
d5c65159f28953 Kalle Valo             2019-11-23  1206  	case HAL_PHYRX_HE_=
SIG_A_MU_DL: {
d5c65159f28953 Kalle Valo             2019-11-23  1207  		struct hal_rx_he_=
sig_a_mu_dl_info *he_sig_a_mu_dl =3D
d5c65159f28953 Kalle Valo             2019-11-23  1208  			(struct hal_rx_h=
e_sig_a_mu_dl_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1209  =

d5c65159f28953 Kalle Valo             2019-11-23  1210  		info0 =3D __le32_=
to_cpu(he_sig_a_mu_dl->info0);
d5c65159f28953 Kalle Valo             2019-11-23  1211  		info1 =3D __le32_=
to_cpu(he_sig_a_mu_dl->info1);
d5c65159f28953 Kalle Valo             2019-11-23  1212  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1213  		ppdu_info->he_mu_=
flags =3D 1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1214  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1215  		ppdu_info->he_dat=
a1 =3D IEEE80211_RADIOTAP_HE_DATA1_FORMAT_MU;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1216  		ppdu_info->he_dat=
a1 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1217  			IEEE80211_RADIOT=
AP_HE_DATA1_BSS_COLOR_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1218  			IEEE80211_RADIOT=
AP_HE_DATA1_UL_DL_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1219  			IEEE80211_RADIOT=
AP_HE_DATA1_LDPC_XSYMSEG_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1220  			IEEE80211_RADIOT=
AP_HE_DATA1_STBC_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1221  			IEEE80211_RADIOT=
AP_HE_DATA1_BW_RU_ALLOC_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1222  			IEEE80211_RADIOT=
AP_HE_DATA1_DOPPLER_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1223  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1224  		ppdu_info->he_dat=
a2 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1225  			IEEE80211_RADIOT=
AP_HE_DATA2_GI_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1226  			IEEE80211_RADIOT=
AP_HE_DATA2_NUM_LTF_SYMS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1227  			IEEE80211_RADIOT=
AP_HE_DATA2_PRE_FEC_PAD_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1228  			IEEE80211_RADIOT=
AP_HE_DATA2_PE_DISAMBIG_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1229  			IEEE80211_RADIOT=
AP_HE_DATA2_TXOP_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1230  			IEEE80211_RADIOT=
AP_HE_DATA2_MIDAMBLE_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1231  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1232  		/*data3*/
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1233  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_BSS_COLOR, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1234  		ppdu_info->he_dat=
a3 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1235  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_BSS_COLOR, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1236  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1237  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_UL_FLAG, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1238  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1239  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_UL_DL, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1240  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1241  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_LDPC_EXTRA, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1242  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1243  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_LDPC_XSYMSEG, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1244  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1245  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_STBC, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16 @1246  		he_stbc =3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1247  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1248  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_STBC, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1249  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1250  		/*data4*/
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1251  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_SPATIAL_REUSE, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1252  		ppdu_info->he_dat=
a4 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1253  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA4_SU_MU_SPTL_REUSE, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1254  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1255  		/*data5*/
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1256  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_TRANSMIT_BW, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1257  		ppdu_info->bw =3D=
 value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1258  		ppdu_info->he_dat=
a5 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1259  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_DATA_BW_RU_ALLOC, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1260  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1261  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_CP_LTF_SIZE, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1262  		switch (value) {
d5c65159f28953 Kalle Valo             2019-11-23  1263  		case 0:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1264  			he_gi =3D HE_GI_=
0_8;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1265  			he_ltf =3D HE_LT=
F_4_X;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1266  			break;
d5c65159f28953 Kalle Valo             2019-11-23  1267  		case 1:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1268  			he_gi =3D HE_GI_=
0_8;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1269  			he_ltf =3D HE_LT=
F_2_X;
d5c65159f28953 Kalle Valo             2019-11-23  1270  			break;
d5c65159f28953 Kalle Valo             2019-11-23  1271  		case 2:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1272  			he_gi =3D HE_GI_=
1_6;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1273  			he_ltf =3D HE_LT=
F_2_X;
d5c65159f28953 Kalle Valo             2019-11-23  1274  			break;
d5c65159f28953 Kalle Valo             2019-11-23  1275  		case 3:
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1276  			he_gi =3D HE_GI_=
3_2;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1277  			he_ltf =3D HE_LT=
F_4_X;
d5c65159f28953 Kalle Valo             2019-11-23  1278  			break;
d5c65159f28953 Kalle Valo             2019-11-23  1279  		}
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1280  		ppdu_info->gi =3D=
 he_gi;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1281  		he_gi =3D (he_gi =
!=3D 0) ? he_gi - 1 : 0;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1282  		ppdu_info->he_dat=
a5 |=3D FIELD_PREP(IEEE80211_RADIOTAP_HE_DATA5_GI, he_gi);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1283  		ppdu_info->ltf_si=
ze =3D he_ltf;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1284  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1285  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_LTF_SIZE,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1286  				   (he_ltf =3D=
=3D HE_LTF_4_X) ? he_ltf - 1 : he_ltf);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1287  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1288  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_NUM_LTF_SYMB, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1289  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1290  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_NUM_LTF_SYMS, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1291  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1292  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_PKT_EXT_FACTOR,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1293  				  info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1294  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1295  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_PRE_FEC_PAD, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1296  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1297  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_PKT_EXT_PE_DISAM,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1298  				  info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1299  		ppdu_info->he_dat=
a5 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1300  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA5_PE_DISAMBIG, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1301  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1302  		/*data6*/
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1303  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_DOPPLER_INDICATION,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1304  				  info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1305  		ppdu_info->he_dat=
a6 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1306  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA6_DOPPLER, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1307  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1308  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO1_TXOP_DURATION, info1);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1309  		ppdu_info->he_dat=
a6 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1310  				FIELD_PREP(IEEE=
80211_RADIOTAP_HE_DATA6_TXOP, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1311  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1312  		/* HE-MU Flags */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1313  		/* HE-MU-flags1 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1314  		ppdu_info->he_fla=
gs1 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1315  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS1_SIG_B_MCS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1316  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS1_SIG_B_DCM_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1317  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS1_SIG_B_COMP_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1318  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS1_SIG_B_SYMS_USERS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1319  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS1_CH1_RU_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1320  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1321  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_MCS_OF_SIGB, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1322  		ppdu_info->he_fla=
gs1 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1323  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_MU_FLAGS1_SIG_B_MCS_KNOWN,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1324  				   value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1325  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_DCM_OF_SIGB, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1326  		ppdu_info->he_fla=
gs1 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1327  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_MU_FLAGS1_SIG_B_DCM_KNOWN,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1328  				   value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1329  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1330  		/* HE-MU-flags2 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1331  		ppdu_info->he_fla=
gs2 =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1332  			IEEE80211_RADIOT=
AP_HE_MU_FLAGS2_BW_FROM_SIG_A_BW_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1333  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1334  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_TRANSMIT_BW, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1335  		ppdu_info->he_fla=
gs2 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1336  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_MU_FLAGS2_BW_FROM_SIG_A_BW,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1337  				   value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1338  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_COMP_MODE_SIGB, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1339  		ppdu_info->he_fla=
gs2 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1340  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_MU_FLAGS2_SIG_B_COMP, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1341  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_A_MU_DL_INFO_INFO0_NUM_SIGB_SYMB, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1342  		value =3D value -=
 1;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1343  		ppdu_info->he_fla=
gs2 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1344  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_MU_FLAGS2_SIG_B_SYMS_USERS,
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1345  				   value);
d5c65159f28953 Kalle Valo             2019-11-23  1346  =

d5c65159f28953 Kalle Valo             2019-11-23  1347  		ppdu_info->is_stb=
c =3D info1 &
d5c65159f28953 Kalle Valo             2019-11-23  1348  				     HAL_RX_HE_=
SIG_A_MU_DL_INFO_INFO1_STBC;
d5c65159f28953 Kalle Valo             2019-11-23  1349  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_MU_MIMO;
d5c65159f28953 Kalle Valo             2019-11-23  1350  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1351  	}
d5c65159f28953 Kalle Valo             2019-11-23  1352  	case HAL_PHYRX_HE_=
SIG_B1_MU: {
6a0c370259c76c John Crispin           2020-02-04  1353  		struct hal_rx_he_=
sig_b1_mu_info *he_sig_b1_mu =3D
6a0c370259c76c John Crispin           2020-02-04  1354  			(struct hal_rx_h=
e_sig_b1_mu_info *)tlv_data;
6a0c370259c76c John Crispin           2020-02-04  1355  		u16 ru_tones;
6a0c370259c76c John Crispin           2020-02-04  1356  =

6a0c370259c76c John Crispin           2020-02-04  1357  		info0 =3D __le32_=
to_cpu(he_sig_b1_mu->info0);
6a0c370259c76c John Crispin           2020-02-04  1358  =

6a0c370259c76c John Crispin           2020-02-04  1359  		ru_tones =3D FIEL=
D_GET(HAL_RX_HE_SIG_B1_MU_INFO_INFO0_RU_ALLOCATION,
6a0c370259c76c John Crispin           2020-02-04  1360  				     info0);
1b8bb94c0612cf Wen Gong               2021-12-20  1361  		ppdu_info->ru_all=
oc =3D
1b8bb94c0612cf Wen Gong               2021-12-20  1362  			ath11k_mac_phy_h=
e_ru_to_nl80211_he_ru_alloc(ru_tones);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1363  		ppdu_info->he_RU[=
0] =3D ru_tones;
d5c65159f28953 Kalle Valo             2019-11-23  1364  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_MU_MIMO;
d5c65159f28953 Kalle Valo             2019-11-23  1365  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1366  	}
d5c65159f28953 Kalle Valo             2019-11-23  1367  	case HAL_PHYRX_HE_=
SIG_B2_MU: {
d5c65159f28953 Kalle Valo             2019-11-23  1368  		struct hal_rx_he_=
sig_b2_mu_info *he_sig_b2_mu =3D
d5c65159f28953 Kalle Valo             2019-11-23  1369  			(struct hal_rx_h=
e_sig_b2_mu_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1370  =

d5c65159f28953 Kalle Valo             2019-11-23  1371  		info0 =3D __le32_=
to_cpu(he_sig_b2_mu->info0);
d5c65159f28953 Kalle Valo             2019-11-23  1372  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1373  		ppdu_info->he_dat=
a1 |=3D IEEE80211_RADIOTAP_HE_DATA1_DATA_MCS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1374  				       IEEE8021=
1_RADIOTAP_HE_DATA1_CODING_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1375  =

d5c65159f28953 Kalle Valo             2019-11-23  1376  		ppdu_info->mcs =
=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1377  			FIELD_GET(HAL_RX=
_HE_SIG_B2_MU_INFO_INFO0_STA_MCS, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1378  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1379  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_DATA_MCS, ppdu_info->mcs);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1380  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1381  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_CODING, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1382  		ppdu_info->ldpc =
=3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1383  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1384  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_CODING, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1385  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1386  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_B2_MU_INFO_INFO0_STA_ID, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1387  		ppdu_info->he_dat=
a4 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1388  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA4_MU_STA_ID, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1389  =

d5c65159f28953 Kalle Valo             2019-11-23  1390  		ppdu_info->nss =
=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1391  			FIELD_GET(HAL_RX=
_HE_SIG_B2_MU_INFO_INFO0_STA_NSTS, info0) + 1;
d5c65159f28953 Kalle Valo             2019-11-23  1392  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1393  	}
d5c65159f28953 Kalle Valo             2019-11-23  1394  	case HAL_PHYRX_HE_=
SIG_B2_OFDMA: {
d5c65159f28953 Kalle Valo             2019-11-23  1395  		struct hal_rx_he_=
sig_b2_ofdma_info *he_sig_b2_ofdma =3D
d5c65159f28953 Kalle Valo             2019-11-23  1396  			(struct hal_rx_h=
e_sig_b2_ofdma_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1397  =

d5c65159f28953 Kalle Valo             2019-11-23  1398  		info0 =3D __le32_=
to_cpu(he_sig_b2_ofdma->info0);
d5c65159f28953 Kalle Valo             2019-11-23  1399  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1400  		ppdu_info->he_dat=
a1 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1401  			IEEE80211_RADIOT=
AP_HE_DATA1_DATA_MCS_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1402  			IEEE80211_RADIOT=
AP_HE_DATA1_DATA_DCM_KNOWN |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1403  			IEEE80211_RADIOT=
AP_HE_DATA1_CODING_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1404  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1405  		/* HE-data2 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1406  		ppdu_info->he_dat=
a2 |=3D IEEE80211_RADIOTAP_HE_DATA2_TXBF_KNOWN;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1407  =

d5c65159f28953 Kalle Valo             2019-11-23  1408  		ppdu_info->mcs =
=3D
d5c65159f28953 Kalle Valo             2019-11-23  1409  			FIELD_GET(HAL_RX=
_HE_SIG_B2_OFDMA_INFO_INFO0_STA_MCS,
d5c65159f28953 Kalle Valo             2019-11-23  1410  				  info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1411  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1412  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_DATA_MCS, ppdu_info->mcs);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1413  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1414  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_DCM, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16 @1415  		he_dcm =3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1416  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1417  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_DATA_DCM, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1418  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1419  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_CODING, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1420  		ppdu_info->ldpc =
=3D value;
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1421  		ppdu_info->he_dat=
a3 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1422  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA3_CODING, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1423  =

20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1424  		/* HE-data4 */
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1425  		value =3D FIELD_G=
ET(HAL_RX_HE_SIG_B2_OFDMA_INFO_INFO0_STA_ID, info0);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1426  		ppdu_info->he_dat=
a4 |=3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1427  			FIELD_PREP(IEEE8=
0211_RADIOTAP_HE_DATA4_MU_STA_ID, value);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1428  =

d5c65159f28953 Kalle Valo             2019-11-23  1429  		ppdu_info->nss =
=3D
d5c65159f28953 Kalle Valo             2019-11-23  1430  			FIELD_GET(HAL_RX=
_HE_SIG_B2_OFDMA_INFO_INFO0_STA_NSTS,
d5c65159f28953 Kalle Valo             2019-11-23  1431  				  info0) + 1;
d5c65159f28953 Kalle Valo             2019-11-23  1432  		ppdu_info->beamfo=
rmed =3D
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1433  			info0 & HAL_RX_H=
E_SIG_B2_OFDMA_INFO_INFO0_STA_TXBF;
d5c65159f28953 Kalle Valo             2019-11-23  1434  		ppdu_info->recept=
ion_type =3D HAL_RX_RECEPTION_TYPE_MU_OFDMA;
d5c65159f28953 Kalle Valo             2019-11-23  1435  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1436  	}
d5c65159f28953 Kalle Valo             2019-11-23  1437  	case HAL_PHYRX_RSS=
I_LEGACY: {
b488c766442f7d Wen Gong               2021-12-17  1438  		int i;
b488c766442f7d Wen Gong               2021-12-17  1439  		bool db2dbm =3D t=
est_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
b488c766442f7d Wen Gong               2021-12-17  1440  				       ab->wmi_=
ab.svc_map);
d5c65159f28953 Kalle Valo             2019-11-23  1441  		struct hal_rx_phy=
rx_rssi_legacy_info *rssi =3D
d5c65159f28953 Kalle Valo             2019-11-23  1442  			(struct hal_rx_p=
hyrx_rssi_legacy_info *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1443  =

d5c65159f28953 Kalle Valo             2019-11-23  1444  		/* TODO: Please n=
ote that the combined rssi will not be accurate
d5c65159f28953 Kalle Valo             2019-11-23  1445  		 * in MU case. Rs=
si in MU needs to be retrieved from
d5c65159f28953 Kalle Valo             2019-11-23  1446  		 * PHYRX_OTHER_RE=
CEIVE_INFO TLV.
d5c65159f28953 Kalle Valo             2019-11-23  1447  		 */
d5c65159f28953 Kalle Valo             2019-11-23  1448  		ppdu_info->rssi_c=
omb =3D
d5c65159f28953 Kalle Valo             2019-11-23  1449  			FIELD_GET(HAL_RX=
_PHYRX_RSSI_LEGACY_INFO_INFO1_RSSI_COMB,
d5c65159f28953 Kalle Valo             2019-11-23  1450  				  __le32_to_cpu=
(rssi->info0));
b488c766442f7d Wen Gong               2021-12-17  1451  =

b488c766442f7d Wen Gong               2021-12-17  1452  		if (db2dbm) {
b488c766442f7d Wen Gong               2021-12-17  1453  			for (i =3D 0; i =
< ARRAY_SIZE(rssi->preamble); i++) {
b488c766442f7d Wen Gong               2021-12-17  1454  				ppdu_info->rssi=
_chain_pri20[i] =3D
b488c766442f7d Wen Gong               2021-12-17  1455  					le32_get_bits(=
rssi->preamble[i].rssi_2040,
b488c766442f7d Wen Gong               2021-12-17  1456  						      HAL_RX_=
PHYRX_RSSI_PREAMBLE_PRI20);
b488c766442f7d Wen Gong               2021-12-17  1457  			}
b488c766442f7d Wen Gong               2021-12-17  1458  		}
d5c65159f28953 Kalle Valo             2019-11-23  1459  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1460  	}
d5c65159f28953 Kalle Valo             2019-11-23  1461  	case HAL_RX_MPDU_S=
TART: {
d5c65159f28953 Kalle Valo             2019-11-23  1462  		u16 peer_id;
d5c65159f28953 Kalle Valo             2019-11-23  1463  =

8845fed1ad7b2f Baochen Qiang          2021-05-31  1464  		peer_id =3D ab->h=
w_params.hw_ops->mpdu_info_get_peerid(tlv_data);
d5c65159f28953 Kalle Valo             2019-11-23  1465  		if (peer_id)
d5c65159f28953 Kalle Valo             2019-11-23  1466  			ppdu_info->peer_=
id =3D peer_id;
d5c65159f28953 Kalle Valo             2019-11-23  1467  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1468  	}
d5c65159f28953 Kalle Valo             2019-11-23  1469  	case HAL_RXPCU_PPD=
U_END_INFO: {
d5c65159f28953 Kalle Valo             2019-11-23  1470  		struct hal_rx_ppd=
u_end_duration *ppdu_rx_duration =3D
d5c65159f28953 Kalle Valo             2019-11-23  1471  			(struct hal_rx_p=
pdu_end_duration *)tlv_data;
d5c65159f28953 Kalle Valo             2019-11-23  1472  		ppdu_info->rx_dur=
ation =3D
d5c65159f28953 Kalle Valo             2019-11-23  1473  			FIELD_GET(HAL_RX=
_PPDU_END_DURATION,
d5c65159f28953 Kalle Valo             2019-11-23  1474  				  __le32_to_cpu=
(ppdu_rx_duration->info0));
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1475  		ppdu_info->tsft =
=3D __le32_to_cpu(ppdu_rx_duration->rsvd0[1]);
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1476  		ppdu_info->tsft =
=3D (ppdu_info->tsft << 32) |
20168f00578862 Pradeep Kumar Chitrapu 2022-02-16  1477  					__le32_to_cpu(=
ppdu_rx_duration->rsvd0[0]);
d5c65159f28953 Kalle Valo             2019-11-23  1478  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1479  	}
d5c65159f28953 Kalle Valo             2019-11-23  1480  	case HAL_DUMMY:
d5c65159f28953 Kalle Valo             2019-11-23  1481  		return HAL_RX_MON=
_STATUS_BUF_DONE;
d5c65159f28953 Kalle Valo             2019-11-23  1482  	case HAL_RX_PPDU_E=
ND_STATUS_DONE:
d5c65159f28953 Kalle Valo             2019-11-23  1483  	case 0:
d5c65159f28953 Kalle Valo             2019-11-23  1484  		return HAL_RX_MON=
_STATUS_PPDU_DONE;
d5c65159f28953 Kalle Valo             2019-11-23  1485  	default:
d5c65159f28953 Kalle Valo             2019-11-23  1486  		break;
d5c65159f28953 Kalle Valo             2019-11-23  1487  	}
d5c65159f28953 Kalle Valo             2019-11-23  1488  =

d5c65159f28953 Kalle Valo             2019-11-23  1489  	return HAL_RX_MON_=
STATUS_PPDU_NOT_DONE;
d5c65159f28953 Kalle Valo             2019-11-23  1490  }
d5c65159f28953 Kalle Valo             2019-11-23  1491  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3393222833188902262==--

