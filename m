Content-Type: multipart/mixed; boundary="===============2540205090127080330=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/veth.c:1612:68: warning: Parameter 'tb' can be declared with const [constParameter]
Date: Fri, 06 May 2022 23:30:59 +0800
Message-ID: <202205062313.yYIbY2QZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2540205090127080330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fe27d189e3f42e31d3c8223d5daed7285e334c5e
commit: 9d3684c24a5232c2d7ea8f8a3e60fe235e6a9867 veth: create by default nr=
_possible_cpus queues
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9d3684c24a5232c2d7ea8f8a3e60fe235e6a9867
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath11k/mac.c:2253:7: warning: Local variable 'p=
reamble' shadows outer variable [shadowVariable]
     u32 preamble;
         ^
   drivers/net/wireless/ath/ath11k/mac.c:2112:6: note: Shadowed declaration
    u32 preamble;
        ^
   drivers/net/wireless/ath/ath11k/mac.c:2253:7: note: Shadow variable
     u32 preamble;
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/ath/ath11k/peer.c:18:13: warning: Uninitialized var=
iable: peer->vdev_id [uninitvar]
     if (peer->vdev_id !=3D vdev_id)
               ^
   drivers/net/wireless/ath/ath11k/peer.c:37:13: warning: Uninitialized var=
iable: peer->pdev_idx [uninitvar]
     if (peer->pdev_idx !=3D pdev_idx)
               ^
   drivers/net/wireless/ath/ath11k/peer.c:59:10: warning: Uninitialized var=
iables: peer.list, peer.sta, peer.vdev_id, peer.peer_id, peer.ast_hash, pee=
r.pdev_idx, peer.hw_peer_id, peer.tfm_mmic, peer.mcast_keyidx, peer.ucast_k=
eyidx, peer.sec_type, peer.sec_type_grp [uninitvar]
     return peer;
            ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:56:7: note: Assuming condition is=
 false
     if (!ether_addr_equal(peer->addr, addr))
         ^
   drivers/net/wireless/ath/ath11k/peer.c:59:10: note: Uninitialized variab=
les: peer.list, peer.sta, peer.vdev_id, peer.peer_id, peer.ast_hash, peer.p=
dev_idx, peer.hw_peer_id, peer.tfm_mmic, peer.mcast_keyidx, peer.ucast_keyi=
dx, peer.sec_type, peer.sec_type_grp
     return peer;
            ^
   drivers/net/wireless/ath/ath11k/peer.c:87:24: warning: Uninitialized var=
iable: peer->vdev_id [uninitvar]
     if (vdev_id =3D=3D peer->vdev_id) {
                          ^
   drivers/net/wireless/ath/ath11k/peer.c:179:13: warning: Uninitialized va=
riable: peer->vdev_id [uninitvar]
     if (peer->vdev_id !=3D vdev_id)
               ^
--
>> drivers/net/wireless/ath/ath11k/spectral.c:426:8: warning: %d in format =
string (no. 1) requires 'int' but the argument type is 'unsigned int'. [inv=
alidPrintfArgType_sint]
    len =3D sprintf(buf, "%dn", bins);
          ^
>> drivers/net/wireless/ath/ath11k/spectral.c:535:28: warning: Parameter 'b=
ins' can be declared with const [constParameter]
             int bin_len, u8 *bins)
                              ^
>> drivers/net/wireless/ath/ath11k/spectral.c:558:56: warning: Parameter 'i=
nbins' can be declared with const [constParameter]
   static void ath11k_spectral_parse_fft(u8 *outbins, u8 *inbins, int num_b=
ins, u8 fft_sz)
                                                          ^
--
   drivers/net/veth.c:1509:18: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
    if ((!!old_prog ^ !!prog) && peer)
                    ^
   drivers/net/veth.c:146:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
   drivers/net/veth.c:154:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
>> drivers/net/veth.c:1612:68: warning: Parameter 'tb' can be declared with=
 const [constParameter]
   static int veth_init_queues(struct net_device *dev, struct nlattr *tb[])
                                                                      ^
   drivers/net/veth.c:1630:40: warning: Parameter 'data' can be declared wi=
th const [constParameter]
      struct nlattr *tb[], struct nlattr *data[],
                                          ^
>> drivers/net/wireless/ath/ath9k/ar9003_paprd.c:249:3: warning: Shifting a=
 negative value is technically undefined behaviour [shiftNegativeLHS]
     REG_RMW_FIELD(ah, AR_PHY_PAPRD_TRAINER_CNTL3,
     ^
   drivers/net/wireless/ath/ath9k/ar9003_paprd.c:252:3: warning: Shifting a=
 negative value is technically undefined behaviour [shiftNegativeLHS]
     REG_RMW_FIELD(ah, AR_PHY_PAPRD_TRAINER_CNTL3,
     ^
   drivers/net/wireless/ath/ath9k/ar9003_paprd.c:260:2: warning: Shifting a=
 negative value is technically undefined behaviour [shiftNegativeLHS]
    REG_RMW_FIELD(ah, AR_PHY_PAPRD_TRAINER_CNTL3,
    ^
   drivers/net/wireless/ath/ath9k/ar9003_paprd.c:909:2: warning: Shifting a=
 negative value is technically undefined behaviour [shiftNegativeLHS]
    REG_RMW_FIELD(ah, AR_PHY_PAPRD_TRAINER_CNTL3,
    ^
>> drivers/net/wireless/ath/ath9k/ar9003_paprd.c:419:34: warning: Parameter=
 'data_L' can be declared with const [constParameter]
   static bool create_pa_curve(u32 *data_L, u32 *data_U, u32 *pa_table, u16=
 *gain)
                                    ^
>> drivers/net/wireless/ath/ath9k/ar9003_paprd.c:419:47: warning: Parameter=
 'data_U' can be declared with const [constParameter]
   static bool create_pa_curve(u32 *data_L, u32 *data_U, u32 *pa_table, u16=
 *gain)
                                                 ^
--
>> drivers/net/wireless/ath/ath6kl/htc_mbox.c:1095:9: warning: Parameter 's=
rvc_pri_order' can be declared with const [constParameter]
       u16 srvc_pri_order[], int list_len)
           ^
>> drivers/net/wireless/ath/ath6kl/htc_mbox.c:65:20: warning: Uninitialized=
 variable: cur_ep_dist->endpoint [uninitvar]
     if (cur_ep_dist->endpoint =3D=3D ENDPOINT_0)
                      ^
>> drivers/net/wireless/ath/ath6kl/htc_mbox.c:191:17: warning: Uninitialize=
d variable: cur_list->endpoint [uninitvar]
     if (cur_list->endpoint =3D=3D ENDPOINT_0)
                   ^
>> drivers/net/wireless/ath/ath6kl/htc_mbox.c:302:21: warning: Uninitialize=
d variable: curdist_list->endpoint [uninitvar]
     if (curdist_list->endpoint =3D=3D ENDPOINT_0)
                       ^
>> drivers/net/wireless/ath/ath6kl/trace.h:105:3: warning: syntax error: ke=
yword 'if' is not allowed in global scope [syntaxError]
     if (flags & HIF_WRITE)
     ^
--
        ^
>> drivers/net/wireless/ath/ath10k/sdio.c:1466:12: warning: Uninitialized v=
ariable: req->address [uninitvar]
     if (req->address >=3D mbox_info->htc_addr &&
              ^
>> drivers/net/wireless/ath/ath10k/sdio.c:1984:12: warning: Uninitialized v=
ariable: req->htc_msg [uninitvar]
     if (req->htc_msg) {
              ^
>> drivers/net/wireless/ath/ath10k/sdio.c:2228:9: warning: Uninitialized va=
riable: ret [uninitvar]
    return ret;
           ^
   drivers/net/wireless/ath/ath10k/sdio.c:2219:16: note: Assuming condition=
 is false
    for (i =3D 0; i < buf_len; i +=3D 4) {
                  ^
   drivers/net/wireless/ath/ath10k/sdio.c:2228:9: note: Uninitialized varia=
ble: ret
    return ret;
           ^
--
                          ^
>> drivers/net/wireless/ath/ath9k/ar9003_calib.c:1343:6: warning: Variable =
'cl_idx' can be declared with const [constVariable]
    u32 cl_idx[AR9300_MAX_CHAINS] =3D { AR_PHY_CL_TAB_0,
        ^
>> drivers/net/wireless/ath/ath10k/core.c:3040:28: warning: Shifting signed=
 64-bit value by 63 bits is implementation-defined behaviour. See condition=
 at line 3037. [shiftTooManyBitsSigned]
     ar->free_vdev_map =3D (1LL << ar->max_num_vdevs) - 1;
                              ^
   drivers/net/wireless/ath/ath10k/core.c:3037:24: note: Assuming that cond=
ition 'ar->max_num_vdevs>=3D64' is not redundant
    if (ar->max_num_vdevs >=3D 64)
                          ^
   drivers/net/wireless/ath/ath10k/core.c:3040:28: note: Shift
     ar->free_vdev_map =3D (1LL << ar->max_num_vdevs) - 1;
                              ^
--
>> drivers/net/wireless/ath/ath9k/xmit.c:997:5: warning: Redundant initiali=
zation for 'bf'. The initialized value is overwritten before it is read. [r=
edundantInitialization]
    bf =3D bf_first;
       ^
   drivers/net/wireless/ath/ath9k/xmit.c:988:21: note: bf is initialized
    struct ath_buf *bf =3D bf_first, *bf_prev =3D NULL;
                       ^
   drivers/net/wireless/ath/ath9k/xmit.c:997:5: note: bf is overwritten
    bf =3D bf_first;
       ^
>> drivers/net/wireless/ath/ath9k/common-spectral.h:112:46: warning: Parame=
ter 'bins' can be declared with const [constParameter]
   static inline u16 spectral_max_magnitude(u8 *bins)
                                                ^
   drivers/net/wireless/ath/ath9k/common-spectral.h:120:41: warning: Parame=
ter 'bins' can be declared with const [constParameter]
   static inline u8 spectral_max_index(u8 *bins, int num_bins)
                                           ^
   drivers/net/wireless/ath/ath9k/common-spectral.h:166:45: warning: Parame=
ter 'bins' can be declared with const [constParameter]
   static inline u8 spectral_bitmap_weight(u8 *bins)
                                               ^
>> drivers/net/wireless/ath/ath9k/xmit.c:431:28: warning: Shifting signed 3=
2-bit value by 31 bits is implementation-defined behaviour. See condition a=
t line 431. [shiftTooManyBitsSigned]
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
   drivers/net/wireless/ath/ath9k/xmit.c:431:28: note: Assuming that condit=
ion '(ba_index)<64' is not redundant
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
   drivers/net/wireless/ath/ath9k/xmit.c:431:28: note: Shift
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
>> drivers/net/wireless/ath/ath9k/xmit.c:431:28: warning: Either the condit=
ion '(ba_index)<64' is redundant or there is signed integer overflow for ex=
pression '1<<((ba_index)&31)'. [integerOverflowCond]
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
   drivers/net/wireless/ath/ath9k/xmit.c:431:28: note: Assuming that condit=
ion '(ba_index)<64' is not redundant
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
   drivers/net/wireless/ath/ath9k/xmit.c:431:28: note: Integer overflow
     if (!txok || (isaggr && !ATH_BA_ISSET(ba, ba_index)))
                              ^
>> drivers/net/wireless/ath/ath11k/mac.c:6059:33: warning: Parameter 'chann=
el' can be declared with const [constParameter]
         struct ieee80211_channel *channel)
                                   ^
>> drivers/net/wireless/ath/ath11k/mac.c:1941:7: warning: Uninitialized var=
iable: ret [uninitvar]
    if (!ret)
         ^
   drivers/net/wireless/ath/ath11k/mac.c:708:34: warning: Uninitialized var=
iables: peer.list, peer.sta, peer.vdev_id, peer.peer_id, peer.ast_hash, pee=
r.pdev_idx, peer.hw_peer_id, peer.tfm_mmic, peer.mcast_keyidx, peer.ucast_k=
eyidx, peer.sec_type, peer.sec_type_grp [uninitvar]
     ath11k_peer_rx_tid_cleanup(ar, peer);
                                    ^

vim +/tb +1612 drivers/net/veth.c

d3256efd8e8b23 Paolo Abeni 2021-04-09  1611  =

9d3684c24a5232 Paolo Abeni 2021-07-20 @1612  static int veth_init_queues(st=
ruct net_device *dev, struct nlattr *tb[])
9d3684c24a5232 Paolo Abeni 2021-07-20  1613  {
9d3684c24a5232 Paolo Abeni 2021-07-20  1614  	int err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1615  =

9d3684c24a5232 Paolo Abeni 2021-07-20  1616  	if (!tb[IFLA_NUM_TX_QUEUES] &=
& dev->num_tx_queues > 1) {
9d3684c24a5232 Paolo Abeni 2021-07-20  1617  		err =3D netif_set_real_num_t=
x_queues(dev, 1);
9d3684c24a5232 Paolo Abeni 2021-07-20  1618  		if (err)
9d3684c24a5232 Paolo Abeni 2021-07-20  1619  			return err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1620  	}
9d3684c24a5232 Paolo Abeni 2021-07-20  1621  	if (!tb[IFLA_NUM_RX_QUEUES] &=
& dev->num_rx_queues > 1) {
9d3684c24a5232 Paolo Abeni 2021-07-20  1622  		err =3D netif_set_real_num_r=
x_queues(dev, 1);
9d3684c24a5232 Paolo Abeni 2021-07-20  1623  		if (err)
9d3684c24a5232 Paolo Abeni 2021-07-20  1624  			return err;
9d3684c24a5232 Paolo Abeni 2021-07-20  1625  	}
9d3684c24a5232 Paolo Abeni 2021-07-20  1626  	return 0;
9d3684c24a5232 Paolo Abeni 2021-07-20  1627  }
9d3684c24a5232 Paolo Abeni 2021-07-20  1628  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2540205090127080330==--

