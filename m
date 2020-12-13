Content-Type: multipart/mixed; boundary="===============6390257894808757893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/wcn36xx/smd.c:750:9: warning: Identical condition 'ret', second condition is always false
Date: Sun, 13 Dec 2020 08:23:50 +0800
Message-ID: <202012130838.7PCH6x1S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6390257894808757893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Govind Singh <govinds@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bff9bb8a292668e7da3e740394b061e5201f683
commit: 1ff8ed786d5d8ed6d109affe6d732dfc85a45b2e ath11k: use remoteproc onl=
y with AHB devices
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wireless/ath/wcn36xx/smd.c:750:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:745:6: note: first condition
    if (ret)
        ^
   drivers/net/wireless/ath/wcn36xx/smd.c:750:9: note: second condition
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:807:9: warning: Identical conditi=
on 'ret', second condition is always false [identicalConditionAfterEarlyExi=
t]
    return ret;
           ^
   drivers/net/wireless/ath/wcn36xx/smd.c:791:6: note: first condition
    if (ret)
        ^
   drivers/net/wireless/ath/wcn36xx/smd.c:807:9: note: second condition
    return ret;
           ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:657:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg_body), WCN36XX_HAL_START_SCAN_OFFLOAD_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:688:2: warning: Redundant pointer=
 operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1276:2: warning: Redundant pointe=
r operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg_body), WCN36XX_HAL_CONFIG_BSS_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1364:2: warning: Redundant pointe=
r operation on 'msg_body' - it's already a pointer. [redundantPointerOp]
    PREPARE_HAL_BUF(wcn->hal_buf, (*msg_body));
    ^
>> drivers/net/wireless/ath/wcn36xx/smd.c:1443:2: warning: Redundant pointe=
r operation on 'msg' - it's already a pointer. [redundantPointerOp]
    INIT_HAL_MSG((*msg), WCN36XX_HAL_CONFIG_BSS_REQ);
    ^
   drivers/net/wireless/ath/wcn36xx/smd.c:1542:3: warning: Redundant pointe=
r operation on 'msg' - it's already a pointer. [redundantPointerOp]
     PREPARE_HAL_BUF(wcn->hal_buf, (*msg));
     ^
>> drivers/net/wireless/ath/ath11k/htc.c:694:9: warning: Identical conditio=
n 'status', second condition is always false [identicalConditionAfterEarlyE=
xit]
    return status;
           ^
   drivers/net/wireless/ath/ath11k/htc.c:679:6: note: first condition
    if (status)
        ^
   drivers/net/wireless/ath/ath11k/htc.c:694:9: note: second condition
    return status;
           ^

vim +/ret +750 drivers/net/wireless/ath/wcn36xx/smd.c

8e84c25821698bd Eugene Krasnikov 2013-10-08  639  =

2f3bef4b247e484 Loic Poulain     2017-12-08  640  int wcn36xx_smd_start_hw_=
scan(struct wcn36xx *wcn, struct ieee80211_vif *vif,
2f3bef4b247e484 Loic Poulain     2017-12-08  641  			      struct cfg80211_=
scan_request *req)
2f3bef4b247e484 Loic Poulain     2017-12-08  642  {
5a425c8b78e5a3d Daniel Mack      2018-04-17  643  	struct wcn36xx_vif *vif_=
priv =3D wcn36xx_vif_to_priv(vif);
355cf31912014e6 Arnd Bergmann    2019-07-22  644  	struct wcn36xx_hal_start=
_scan_offload_req_msg *msg_body;
2f3bef4b247e484 Loic Poulain     2017-12-08  645  	int ret, i;
2f3bef4b247e484 Loic Poulain     2017-12-08  646  =

4836ec42b07433f Daniel Mack      2018-04-17  647  	if (req->ie_len > WCN36X=
X_MAX_SCAN_IE_LEN)
4836ec42b07433f Daniel Mack      2018-04-17  648  		return -EINVAL;
4836ec42b07433f Daniel Mack      2018-04-17  649  =

2f3bef4b247e484 Loic Poulain     2017-12-08  650  	mutex_lock(&wcn->hal_mut=
ex);
355cf31912014e6 Arnd Bergmann    2019-07-22  651  	msg_body =3D kzalloc(siz=
eof(*msg_body), GFP_KERNEL);
355cf31912014e6 Arnd Bergmann    2019-07-22  652  	if (!msg_body) {
355cf31912014e6 Arnd Bergmann    2019-07-22  653  		ret =3D -ENOMEM;
355cf31912014e6 Arnd Bergmann    2019-07-22  654  		goto out;
355cf31912014e6 Arnd Bergmann    2019-07-22  655  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  656  =

355cf31912014e6 Arnd Bergmann    2019-07-22 @657  	INIT_HAL_MSG((*msg_body)=
, WCN36XX_HAL_START_SCAN_OFFLOAD_REQ);
2f3bef4b247e484 Loic Poulain     2017-12-08  658  =

355cf31912014e6 Arnd Bergmann    2019-07-22  659  	msg_body->scan_type =3D =
WCN36XX_HAL_SCAN_TYPE_ACTIVE;
355cf31912014e6 Arnd Bergmann    2019-07-22  660  	msg_body->min_ch_time =
=3D 30;
355cf31912014e6 Arnd Bergmann    2019-07-22  661  	msg_body->max_ch_time =
=3D 100;
355cf31912014e6 Arnd Bergmann    2019-07-22  662  	msg_body->scan_hidden =
=3D 1;
355cf31912014e6 Arnd Bergmann    2019-07-22  663  	memcpy(msg_body->mac, vi=
f->addr, ETH_ALEN);
355cf31912014e6 Arnd Bergmann    2019-07-22  664  	msg_body->bss_type =3D v=
if_priv->bss_type;
355cf31912014e6 Arnd Bergmann    2019-07-22  665  	msg_body->p2p_search =3D=
 vif->p2p;
355cf31912014e6 Arnd Bergmann    2019-07-22  666  =

355cf31912014e6 Arnd Bergmann    2019-07-22  667  	msg_body->num_ssid =3D m=
in_t(u8, req->n_ssids, ARRAY_SIZE(msg_body->ssids));
355cf31912014e6 Arnd Bergmann    2019-07-22  668  	for (i =3D 0; i < msg_bo=
dy->num_ssid; i++) {
355cf31912014e6 Arnd Bergmann    2019-07-22  669  		msg_body->ssids[i].leng=
th =3D min_t(u8, req->ssids[i].ssid_len,
355cf31912014e6 Arnd Bergmann    2019-07-22  670  						sizeof(msg_body->ss=
ids[i].ssid));
355cf31912014e6 Arnd Bergmann    2019-07-22  671  		memcpy(msg_body->ssids[=
i].ssid, req->ssids[i].ssid,
355cf31912014e6 Arnd Bergmann    2019-07-22  672  		       msg_body->ssids[=
i].length);
2f3bef4b247e484 Loic Poulain     2017-12-08  673  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  674  =

355cf31912014e6 Arnd Bergmann    2019-07-22  675  	msg_body->num_channel =
=3D min_t(u8, req->n_channels,
355cf31912014e6 Arnd Bergmann    2019-07-22  676  				     sizeof(msg_body-=
>channels));
355cf31912014e6 Arnd Bergmann    2019-07-22  677  	for (i =3D 0; i < msg_bo=
dy->num_channel; i++)
355cf31912014e6 Arnd Bergmann    2019-07-22  678  		msg_body->channels[i] =
=3D req->channels[i]->hw_value;
2f3bef4b247e484 Loic Poulain     2017-12-08  679  =

355cf31912014e6 Arnd Bergmann    2019-07-22  680  	msg_body->header.len -=
=3D WCN36XX_MAX_SCAN_IE_LEN;
4836ec42b07433f Daniel Mack      2018-04-17  681  =

4836ec42b07433f Daniel Mack      2018-04-17  682  	if (req->ie_len > 0) {
355cf31912014e6 Arnd Bergmann    2019-07-22  683  		msg_body->ie_len =3D re=
q->ie_len;
355cf31912014e6 Arnd Bergmann    2019-07-22  684  		msg_body->header.len +=
=3D req->ie_len;
355cf31912014e6 Arnd Bergmann    2019-07-22  685  		memcpy(msg_body->ie, re=
q->ie, req->ie_len);
4836ec42b07433f Daniel Mack      2018-04-17  686  	}
4836ec42b07433f Daniel Mack      2018-04-17  687  =

355cf31912014e6 Arnd Bergmann    2019-07-22  688  	PREPARE_HAL_BUF(wcn->hal=
_buf, (*msg_body));
2f3bef4b247e484 Loic Poulain     2017-12-08  689  =

2f3bef4b247e484 Loic Poulain     2017-12-08  690  	wcn36xx_dbg(WCN36XX_DBG_=
HAL,
2f3bef4b247e484 Loic Poulain     2017-12-08  691  		    "hal start hw-scan =
(channels: %u; ssids: %u; p2p: %s)\n",
355cf31912014e6 Arnd Bergmann    2019-07-22  692  		    msg_body->num_chann=
el, msg_body->num_ssid,
355cf31912014e6 Arnd Bergmann    2019-07-22  693  		    msg_body->p2p_searc=
h ? "yes" : "no");
2f3bef4b247e484 Loic Poulain     2017-12-08  694  =

355cf31912014e6 Arnd Bergmann    2019-07-22  695  	ret =3D wcn36xx_smd_send=
_and_wait(wcn, msg_body->header.len);
2f3bef4b247e484 Loic Poulain     2017-12-08  696  	if (ret) {
2f3bef4b247e484 Loic Poulain     2017-12-08  697  		wcn36xx_err("Sending ha=
l_start_scan_offload failed\n");
2f3bef4b247e484 Loic Poulain     2017-12-08  698  		goto out;
2f3bef4b247e484 Loic Poulain     2017-12-08  699  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  700  	ret =3D wcn36xx_smd_rsp_=
status_check(wcn->hal_buf, wcn->hal_rsp_len);
2f3bef4b247e484 Loic Poulain     2017-12-08  701  	if (ret) {
2f3bef4b247e484 Loic Poulain     2017-12-08  702  		wcn36xx_err("hal_start_=
scan_offload response failed err=3D%d\n",
2f3bef4b247e484 Loic Poulain     2017-12-08  703  			    ret);
2f3bef4b247e484 Loic Poulain     2017-12-08  704  		goto out;
2f3bef4b247e484 Loic Poulain     2017-12-08  705  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  706  out:
355cf31912014e6 Arnd Bergmann    2019-07-22  707  	kfree(msg_body);
2f3bef4b247e484 Loic Poulain     2017-12-08  708  	mutex_unlock(&wcn->hal_m=
utex);
2f3bef4b247e484 Loic Poulain     2017-12-08  709  	return ret;
2f3bef4b247e484 Loic Poulain     2017-12-08  710  }
2f3bef4b247e484 Loic Poulain     2017-12-08  711  =

2f3bef4b247e484 Loic Poulain     2017-12-08  712  int wcn36xx_smd_stop_hw_s=
can(struct wcn36xx *wcn)
2f3bef4b247e484 Loic Poulain     2017-12-08  713  {
2f3bef4b247e484 Loic Poulain     2017-12-08  714  	struct wcn36xx_hal_stop_=
scan_offload_req_msg msg_body;
2f3bef4b247e484 Loic Poulain     2017-12-08  715  	int ret;
2f3bef4b247e484 Loic Poulain     2017-12-08  716  =

2f3bef4b247e484 Loic Poulain     2017-12-08  717  	mutex_lock(&wcn->hal_mut=
ex);
2f3bef4b247e484 Loic Poulain     2017-12-08  718  	INIT_HAL_MSG(msg_body, W=
CN36XX_HAL_STOP_SCAN_OFFLOAD_REQ);
2f3bef4b247e484 Loic Poulain     2017-12-08  719  	PREPARE_HAL_BUF(wcn->hal=
_buf, msg_body);
2f3bef4b247e484 Loic Poulain     2017-12-08  720  =

2f3bef4b247e484 Loic Poulain     2017-12-08  721  	wcn36xx_dbg(WCN36XX_DBG_=
HAL, "hal stop hw-scan\n");
2f3bef4b247e484 Loic Poulain     2017-12-08  722  =

2f3bef4b247e484 Loic Poulain     2017-12-08  723  	ret =3D wcn36xx_smd_send=
_and_wait(wcn, msg_body.header.len);
2f3bef4b247e484 Loic Poulain     2017-12-08  724  	if (ret) {
2f3bef4b247e484 Loic Poulain     2017-12-08  725  		wcn36xx_err("Sending ha=
l_stop_scan_offload failed\n");
2f3bef4b247e484 Loic Poulain     2017-12-08  726  		goto out;
2f3bef4b247e484 Loic Poulain     2017-12-08  727  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  728  	ret =3D wcn36xx_smd_rsp_=
status_check(wcn->hal_buf, wcn->hal_rsp_len);
2f3bef4b247e484 Loic Poulain     2017-12-08  729  	if (ret) {
2f3bef4b247e484 Loic Poulain     2017-12-08  730  		wcn36xx_err("hal_stop_s=
can_offload response failed err=3D%d\n",
2f3bef4b247e484 Loic Poulain     2017-12-08  731  			    ret);
2f3bef4b247e484 Loic Poulain     2017-12-08  732  		goto out;
2f3bef4b247e484 Loic Poulain     2017-12-08  733  	}
2f3bef4b247e484 Loic Poulain     2017-12-08  734  out:
2f3bef4b247e484 Loic Poulain     2017-12-08  735  	mutex_unlock(&wcn->hal_m=
utex);
2f3bef4b247e484 Loic Poulain     2017-12-08  736  	return ret;
2f3bef4b247e484 Loic Poulain     2017-12-08  737  }
2f3bef4b247e484 Loic Poulain     2017-12-08  738  =

8e84c25821698bd Eugene Krasnikov 2013-10-08  739  static int wcn36xx_smd_sw=
itch_channel_rsp(void *buf, size_t len)
8e84c25821698bd Eugene Krasnikov 2013-10-08  740  {
8e84c25821698bd Eugene Krasnikov 2013-10-08  741  	struct wcn36xx_hal_switc=
h_channel_rsp_msg *rsp;
f0eea2772a6baf0 Daniel Mack      2018-06-29  742  	int ret;
8e84c25821698bd Eugene Krasnikov 2013-10-08  743  =

8e84c25821698bd Eugene Krasnikov 2013-10-08  744  	ret =3D wcn36xx_smd_rsp_=
status_check(buf, len);
8e84c25821698bd Eugene Krasnikov 2013-10-08  745  	if (ret)
8e84c25821698bd Eugene Krasnikov 2013-10-08  746  		return ret;
8e84c25821698bd Eugene Krasnikov 2013-10-08  747  	rsp =3D (struct wcn36xx_=
hal_switch_channel_rsp_msg *)buf;
8e84c25821698bd Eugene Krasnikov 2013-10-08  748  	wcn36xx_dbg(WCN36XX_DBG_=
HAL, "channel switched to: %d, status: %d\n",
8e84c25821698bd Eugene Krasnikov 2013-10-08  749  		    rsp->channel_number=
, rsp->status);
8e84c25821698bd Eugene Krasnikov 2013-10-08 @750  	return ret;
8e84c25821698bd Eugene Krasnikov 2013-10-08  751  }
8e84c25821698bd Eugene Krasnikov 2013-10-08  752  =


:::::: The code at line 750 was first introduced by commit
:::::: 8e84c25821698bdef73c0329fb2022a4673b7adc wcn36xx: mac80211 driver fo=
r Qualcomm WCN3660/WCN3680 hardware

:::::: TO: Eugene Krasnikov <k.eugene.e@gmail.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6390257894808757893==--

