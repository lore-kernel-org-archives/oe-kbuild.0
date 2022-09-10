Content-Type: multipart/mixed; boundary="===============4333738541301708459=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/dp_rx.c:4960:24: warning: use of uninitialized value 'prev_buf' [CWE-457]
Date: Sat, 10 Sep 2022 18:31:14 +0800
Message-ID: <202209101840.1b4T9xls-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4333738541301708459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/wireless/ath/ath11k/dp_rx.c:4960:24: warning: use of uninitialized value=
 'prev_buf' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce888220d5c7a805e0e155302a318d5d23e62950
commit: 7e2ea2e947046834a450295dfd328adb70a9f864 ath11k: Process full monit=
or mode rx support
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220908 (https://download.01.org/0day-ci/archi=
ve/20220910/202209101840.1b4T9xls-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D7e2ea2e947046834a450295dfd328adb70a9f864
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7e2ea2e947046834a450295dfd328adb70a9f864
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/net/wireless/ath/ath11k/dp_rx.c: In function 'ath11k_dp_rx_mon_m=
erg_msdus':
>> drivers/net/wireless/ath/ath11k/dp_rx.c:4960:24: warning: use of uniniti=
alized value 'prev_buf' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    4960 |                 dest =3D skb_put(prev_buf, HAL_RX_FCS_LEN);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'ath11k_dp_rx_pktlog_stop': events 1-2
       |
       | 5616 | int ath11k_dp_rx_pktlog_stop(struct ath11k_base *ab, bool s=
top_timer)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'ath11k_dp_rx_pktlog_stop'
       |......
       | 5624 |         ret =3D ath11k_dp_purge_mon_ring(ab);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'ath11k_dp_purge_mon_ring' from '=
ath11k_dp_rx_pktlog_stop'
       |
       +--> 'ath11k_dp_purge_mon_ring': events 3-6
              |
              |  313 | static int ath11k_dp_purge_mon_ring(struct ath11k_ba=
se *ab)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'ath11k_dp_purge_mon_ring'
              |......
              |  319 |                 for (i =3D 0; i < ab->hw_params.num_=
rxmda_per_pdev; i++)
              |      |                             ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
              |      |                               |
              |      |                               (4) following 'true' b=
ranch...
              |  320 |                         reaped +=3D ath11k_dp_rx_pro=
cess_mon_rings(ab, i,
              |      |                                   ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                                   |
              |      |                                   (5) ...to here
              |      |                                   (6) calling 'ath11=
k_dp_rx_process_mon_rings' from 'ath11k_dp_purge_mon_ring'
              |  321 |                                                     =
             NULL,
              |      |                                                     =
             ~~~~~
              |  322 |                                                     =
             DP_MON_SERVICE_BUDGET);
              |      |                                                     =
             ~~~~~~~~~~~~~~~~~~~~~~
              |
              +--> 'ath11k_dp_rx_process_mon_rings': events 7-9
                     |
                     | 5518 | int ath11k_dp_rx_process_mon_rings(struct ath=
11k_base *ab, int mac_id,
                     |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (7) entry to 'ath11k_dp_rx_process_mon_ri=
ngs'
                     |......
                     | 5524 |         if (test_bit(ATH11K_FLAG_MONITOR_STAR=
TED, &ar->monitor_flags) &&
                     |      |            ~
                     |      |            |
                     |      |            (8) following 'true' branch...
                     | 5525 |             ab->hw_params.full_monitor_mode)
                     |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (9) ...to here
                     |
                   'ath11k_dp_rx_process_mon_rings': events 10-12
                     |
                     | 5524 |         if (test_bit(ATH11K_FLAG_MONITOR_STAR=
TED, &ar->monitor_flags) &&
                     | 5525 |             ab->hw_params.full_monitor_mode)
                     | 5526 |                 ret =3D ath11k_dp_full_mon_pr=
ocess_rx(ab, mac_id, napi, budget);
                     |      |                       ~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                       |
                     |      |                       (11) ...to here
                     |      |                       (12) calling 'ath11k_dp=
_full_mon_process_rx' from 'ath11k_dp_rx_process_mon_rings'
                     |
                     +--> 'ath11k_dp_full_mon_process_rx': events 13-14
                            |
                            | 5418 | static int ath11k_dp_full_mon_process_=
rx(struct ath11k_base *ab, int mac_id,
                            |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
                            |      |            |
                            |      |            (13) entry to 'ath11k_dp_fu=
ll_mon_process_rx'
                            |......
                            | 5496 |         quota =3D ath11k_dp_rx_process=
_full_mon_status_ring(ab, mac_id,
                            |      |                 ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                 |
                            |      |                 (14) calling 'ath11k_d=
p_rx_process_full_mon_status_ring' from 'ath11k_dp_full_mon_process_rx'
                            | 5497 |                                       =
                    napi, budget);
                            |      |                                       =
                    ~~~~~~~~~~~~~
                            |
                            +--> 'ath11k_dp_rx_process_full_mon_status_ring=
': events 15-20
                                   |
                                   | 5376 | ath11k_dp_rx_process_full_mon_s=
tatus_ring(struct ath11k_base *ab, int mac_id,
                                   |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
                                   |      | |
                                   |      | (15) entry to 'ath11k_dp_rx_pro=
cess_full_mon_status_ring'
                                   |......
                                   | 5387 |         while (pmon->hold_mon_d=
st_ring) {
                                   |      |                ~~~~
                                   |      |                |
                                   |      |                (16) following '=
true' branch...
                                   | 5388 |                 quota =3D ath11=
k_dp_rx_process_mon_status(ab, mac_id,
                                   |      |                         ~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                         |
                                   |      |                         (17) ..=
.to here
                                   | 5389 |                                =
                         napi, 1);
                                   |      |                                =
                         ~~~~~~~~
                                   | 5390 |                 if (pmon->buf_s=
tate =3D=3D DP_MON_STATUS_MATCH) {
                                   |      |                    ~
                                   |      |                    |
                                   |      |                    (18) followi=
ng 'true' branch...
                                   | 5391 |                         count =
=3D sw_mon_entries->status_buf_count;
                                   |      |                                =
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                   |      |                                =
               |
                                   |      |                                =
               (19) ...to here

vim +/prev_buf +4960 drivers/net/wireless/ath/ath11k/dp_rx.c

d5c65159f28953 Kalle Valo             2019-11-23  4874  =

d5c65159f28953 Kalle Valo             2019-11-23  4875  static struct sk_bu=
ff *
d5c65159f28953 Kalle Valo             2019-11-23  4876  ath11k_dp_rx_mon_me=
rg_msdus(struct ath11k *ar,
d5c65159f28953 Kalle Valo             2019-11-23  4877  			    u32 mac_id, =
struct sk_buff *head_msdu,
d5c65159f28953 Kalle Valo             2019-11-23  4878  			    struct sk_bu=
ff *last_msdu,
787264893c69ed P Praneesh             2021-10-25  4879  			    struct ieee8=
0211_rx_status *rxs, bool *fcs_err)
d5c65159f28953 Kalle Valo             2019-11-23  4880  {
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4881  	struct ath11k_base=
 *ab =3D ar->ab;
7210b4b77fe476 Tim Gardner            2021-10-05  4882  	struct sk_buff *ms=
du, *prev_buf;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4883  	u32 wifi_hdr_len;
d5c65159f28953 Kalle Valo             2019-11-23  4884  	struct hal_rx_desc=
 *rx_desc;
d5c65159f28953 Kalle Valo             2019-11-23  4885  	char *hdr_desc;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4886  	u8 *dest, decap_fo=
rmat;
d5c65159f28953 Kalle Valo             2019-11-23  4887  	struct ieee80211_h=
dr_3addr *wh;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4888  	struct rx_attentio=
n *rx_attention;
787264893c69ed P Praneesh             2021-10-25  4889  	u32 err_bitmap;
d5c65159f28953 Kalle Valo             2019-11-23  4890  =

d5c65159f28953 Kalle Valo             2019-11-23  4891  	if (!head_msdu)
d5c65159f28953 Kalle Valo             2019-11-23  4892  		goto err_merge_fa=
il;
d5c65159f28953 Kalle Valo             2019-11-23  4893  =

d5c65159f28953 Kalle Valo             2019-11-23  4894  	rx_desc =3D (struc=
t hal_rx_desc *)head_msdu->data;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4895  	rx_attention =3D a=
th11k_dp_rx_get_attention(ab, rx_desc);
787264893c69ed P Praneesh             2021-10-25  4896  	err_bitmap =3D ath=
11k_dp_rx_h_attn_mpdu_err(rx_attention);
787264893c69ed P Praneesh             2021-10-25  4897  =

787264893c69ed P Praneesh             2021-10-25  4898  	if (err_bitmap & D=
P_RX_MPDU_ERR_FCS)
787264893c69ed P Praneesh             2021-10-25  4899  		*fcs_err =3D true;
d5c65159f28953 Kalle Valo             2019-11-23  4900  =

e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4901  	if (ath11k_dp_rxde=
sc_get_mpdulen_err(rx_attention))
d5c65159f28953 Kalle Valo             2019-11-23  4902  		return NULL;
d5c65159f28953 Kalle Valo             2019-11-23  4903  =

e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4904  	decap_format =3D a=
th11k_dp_rx_h_msdu_start_decap_type(ab, rx_desc);
d5c65159f28953 Kalle Valo             2019-11-23  4905  =

d5c65159f28953 Kalle Valo             2019-11-23  4906  	ath11k_dp_rx_h_ppd=
u(ar, rx_desc, rxs);
d5c65159f28953 Kalle Valo             2019-11-23  4907  =

d5c65159f28953 Kalle Valo             2019-11-23  4908  	if (decap_format =
=3D=3D DP_RX_DECAP_TYPE_RAW) {
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4909  		ath11k_dp_rx_msdu=
s_set_payload(ar, head_msdu);
d5c65159f28953 Kalle Valo             2019-11-23  4910  =

d5c65159f28953 Kalle Valo             2019-11-23  4911  		prev_buf =3D head=
_msdu;
d5c65159f28953 Kalle Valo             2019-11-23  4912  		msdu =3D head_msd=
u->next;
d5c65159f28953 Kalle Valo             2019-11-23  4913  =

d5c65159f28953 Kalle Valo             2019-11-23  4914  		while (msdu) {
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4915  			ath11k_dp_rx_msd=
us_set_payload(ar, msdu);
d5c65159f28953 Kalle Valo             2019-11-23  4916  =

d5c65159f28953 Kalle Valo             2019-11-23  4917  			prev_buf =3D msd=
u;
d5c65159f28953 Kalle Valo             2019-11-23  4918  			msdu =3D msdu->n=
ext;
d5c65159f28953 Kalle Valo             2019-11-23  4919  		}
d5c65159f28953 Kalle Valo             2019-11-23  4920  =

d5c65159f28953 Kalle Valo             2019-11-23  4921  		prev_buf->next =
=3D NULL;
d5c65159f28953 Kalle Valo             2019-11-23  4922  =

d5c65159f28953 Kalle Valo             2019-11-23  4923  		skb_trim(prev_buf=
, prev_buf->len - HAL_RX_FCS_LEN);
d5c65159f28953 Kalle Valo             2019-11-23  4924  	} else if (decap_f=
ormat =3D=3D DP_RX_DECAP_TYPE_NATIVE_WIFI) {
d5c65159f28953 Kalle Valo             2019-11-23  4925  		__le16 qos_field;
d5c65159f28953 Kalle Valo             2019-11-23  4926  		u8 qos_pkt =3D 0;
d5c65159f28953 Kalle Valo             2019-11-23  4927  =

d5c65159f28953 Kalle Valo             2019-11-23  4928  		rx_desc =3D (stru=
ct hal_rx_desc *)head_msdu->data;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4929  		hdr_desc =3D ath1=
1k_dp_rxdesc_get_80211hdr(ab, rx_desc);
d5c65159f28953 Kalle Valo             2019-11-23  4930  =

d5c65159f28953 Kalle Valo             2019-11-23  4931  		/* Base size */
d5c65159f28953 Kalle Valo             2019-11-23  4932  		wifi_hdr_len =3D =
sizeof(struct ieee80211_hdr_3addr);
d5c65159f28953 Kalle Valo             2019-11-23  4933  		wh =3D (struct ie=
ee80211_hdr_3addr *)hdr_desc;
d5c65159f28953 Kalle Valo             2019-11-23  4934  =

d5c65159f28953 Kalle Valo             2019-11-23  4935  		if (ieee80211_is_=
data_qos(wh->frame_control)) {
d5c65159f28953 Kalle Valo             2019-11-23  4936  			struct ieee80211=
_qos_hdr *qwh =3D
d5c65159f28953 Kalle Valo             2019-11-23  4937  					(struct ieee80=
211_qos_hdr *)hdr_desc;
d5c65159f28953 Kalle Valo             2019-11-23  4938  =

d5c65159f28953 Kalle Valo             2019-11-23  4939  			qos_field =3D qw=
h->qos_ctrl;
d5c65159f28953 Kalle Valo             2019-11-23  4940  			qos_pkt =3D 1;
d5c65159f28953 Kalle Valo             2019-11-23  4941  		}
d5c65159f28953 Kalle Valo             2019-11-23  4942  		msdu =3D head_msd=
u;
d5c65159f28953 Kalle Valo             2019-11-23  4943  =

d5c65159f28953 Kalle Valo             2019-11-23  4944  		while (msdu) {
d5c65159f28953 Kalle Valo             2019-11-23  4945  			rx_desc =3D (str=
uct hal_rx_desc *)msdu->data;
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4946  			hdr_desc =3D ath=
11k_dp_rxdesc_get_80211hdr(ab, rx_desc);
d5c65159f28953 Kalle Valo             2019-11-23  4947  =

d5c65159f28953 Kalle Valo             2019-11-23  4948  			if (qos_pkt) {
d5c65159f28953 Kalle Valo             2019-11-23  4949  				dest =3D skb_pu=
sh(msdu, sizeof(__le16));
d5c65159f28953 Kalle Valo             2019-11-23  4950  				if (!dest)
d5c65159f28953 Kalle Valo             2019-11-23  4951  					goto err_merge=
_fail;
d5c65159f28953 Kalle Valo             2019-11-23  4952  				memcpy(dest, hd=
r_desc, wifi_hdr_len);
d5c65159f28953 Kalle Valo             2019-11-23  4953  				memcpy(dest + w=
ifi_hdr_len,
d5c65159f28953 Kalle Valo             2019-11-23  4954  				       (u8 *)&q=
os_field, sizeof(__le16));
d5c65159f28953 Kalle Valo             2019-11-23  4955  			}
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4956  			ath11k_dp_rx_msd=
us_set_payload(ar, msdu);
d5c65159f28953 Kalle Valo             2019-11-23  4957  			prev_buf =3D msd=
u;
d5c65159f28953 Kalle Valo             2019-11-23  4958  			msdu =3D msdu->n=
ext;
d5c65159f28953 Kalle Valo             2019-11-23  4959  		}
d5c65159f28953 Kalle Valo             2019-11-23 @4960  		dest =3D skb_put(=
prev_buf, HAL_RX_FCS_LEN);
d5c65159f28953 Kalle Valo             2019-11-23  4961  		if (!dest)
d5c65159f28953 Kalle Valo             2019-11-23  4962  			goto err_merge_f=
ail;
d5c65159f28953 Kalle Valo             2019-11-23  4963  =

e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4964  		ath11k_dbg(ab, AT=
H11K_DBG_DATA,
d5c65159f28953 Kalle Valo             2019-11-23  4965  			   "mpdu_buf %pK=
 mpdu_buf->len %u",
d5c65159f28953 Kalle Valo             2019-11-23  4966  			   prev_buf, pre=
v_buf->len);
d5c65159f28953 Kalle Valo             2019-11-23  4967  	} else {
e678fbd401b9bd Karthikeyan Periyasamy 2021-02-16  4968  		ath11k_dbg(ab, AT=
H11K_DBG_DATA,
d5c65159f28953 Kalle Valo             2019-11-23  4969  			   "decap format=
 %d is not supported!\n",
d5c65159f28953 Kalle Valo             2019-11-23  4970  			   decap_format);
d5c65159f28953 Kalle Valo             2019-11-23  4971  		goto err_merge_fa=
il;
d5c65159f28953 Kalle Valo             2019-11-23  4972  	}
d5c65159f28953 Kalle Valo             2019-11-23  4973  =

d5c65159f28953 Kalle Valo             2019-11-23  4974  	return head_msdu;
d5c65159f28953 Kalle Valo             2019-11-23  4975  =

d5c65159f28953 Kalle Valo             2019-11-23  4976  err_merge_fail:
d5c65159f28953 Kalle Valo             2019-11-23  4977  	return NULL;
d5c65159f28953 Kalle Valo             2019-11-23  4978  }
d5c65159f28953 Kalle Valo             2019-11-23  4979  =


:::::: The code at line 4960 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4333738541301708459==--

