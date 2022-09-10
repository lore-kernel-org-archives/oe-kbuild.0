Content-Type: multipart/mixed; boundary="===============6656356039234442822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/mac.c:8412:12: warning: use of uninitialized value 'ret' [CWE-457]
Date: Sun, 11 Sep 2022 06:37:23 +0800
Message-ID: <202209110654.C3PVECn4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6656356039234442822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/wireless/ath/ath11k/mac.c:8412:12: warning: use of uninitialized value '=
ret' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: 3a5627b94222c3abc7e65486e2d2c0cc0a35c140 ath11k: Implement remain-o=
n-channel support
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220908 (https://download.01.org/0day-ci/archi=
ve/20220911/202209110654.C3PVECn4-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3a5627b94222c3abc7e65486e2d2c0cc0a35c140
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3a5627b94222c3abc7e65486e2d2c0cc0a35c140
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_op_remain=
_on_channel':
>> drivers/net/wireless/ath/ath11k/mac.c:8412:12: warning: use of uninitial=
ized value 'ret' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    8412 |         if (ret)
         |            ^
     'ath11k_mac_op_remain_on_channel': events 1-4
       |
       | 8386 |         int ret;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       | 8392 |         switch (ar->scan.state) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) following 'default:' branch...
       |......
       | 8410 |         spin_unlock_bh(&ar->data_lock);
       |      |         ~~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       | 8411 | =

       | 8412 |         if (ret)
       |      |            ~ =

       |      |            |
       |      |            (4) use of uninitialized value 'ret' here
       |

vim +/ret +8412 drivers/net/wireless/ath/ath11k/mac.c

3a5627b94222c3 Baochen Qiang 2022-05-09  8376  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8377  static int ath11k_mac_op_rem=
ain_on_channel(struct ieee80211_hw *hw,
3a5627b94222c3 Baochen Qiang 2022-05-09  8378  					   struct ieee80211_vif=
 *vif,
3a5627b94222c3 Baochen Qiang 2022-05-09  8379  					   struct ieee80211_cha=
nnel *chan,
3a5627b94222c3 Baochen Qiang 2022-05-09  8380  					   int duration,
3a5627b94222c3 Baochen Qiang 2022-05-09  8381  					   enum ieee80211_roc_t=
ype type)
3a5627b94222c3 Baochen Qiang 2022-05-09  8382  {
3a5627b94222c3 Baochen Qiang 2022-05-09  8383  	struct ath11k *ar =3D hw->p=
riv;
3a5627b94222c3 Baochen Qiang 2022-05-09  8384  	struct ath11k_vif *arvif =
=3D (void *)vif->drv_priv;
3a5627b94222c3 Baochen Qiang 2022-05-09  8385  	struct scan_req_params arg;
3a5627b94222c3 Baochen Qiang 2022-05-09  8386  	int ret;
3a5627b94222c3 Baochen Qiang 2022-05-09  8387  	u32 scan_time_msec;
3a5627b94222c3 Baochen Qiang 2022-05-09  8388  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8389  	mutex_lock(&ar->conf_mutex);
3a5627b94222c3 Baochen Qiang 2022-05-09  8390  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8391  	spin_lock_bh(&ar->data_lock=
);
3a5627b94222c3 Baochen Qiang 2022-05-09  8392  	switch (ar->scan.state) {
3a5627b94222c3 Baochen Qiang 2022-05-09  8393  	case ATH11K_SCAN_IDLE:
3a5627b94222c3 Baochen Qiang 2022-05-09  8394  		reinit_completion(&ar->sca=
n.started);
3a5627b94222c3 Baochen Qiang 2022-05-09  8395  		reinit_completion(&ar->sca=
n.completed);
3a5627b94222c3 Baochen Qiang 2022-05-09  8396  		reinit_completion(&ar->sca=
n.on_channel);
3a5627b94222c3 Baochen Qiang 2022-05-09  8397  		ar->scan.state =3D ATH11K_=
SCAN_STARTING;
3a5627b94222c3 Baochen Qiang 2022-05-09  8398  		ar->scan.is_roc =3D true;
3a5627b94222c3 Baochen Qiang 2022-05-09  8399  		ar->scan.vdev_id =3D arvif=
->vdev_id;
3a5627b94222c3 Baochen Qiang 2022-05-09  8400  		ar->scan.roc_freq =3D chan=
->center_freq;
3a5627b94222c3 Baochen Qiang 2022-05-09  8401  		ar->scan.roc_notify =3D tr=
ue;
3a5627b94222c3 Baochen Qiang 2022-05-09  8402  		ret =3D 0;
3a5627b94222c3 Baochen Qiang 2022-05-09  8403  		break;
3a5627b94222c3 Baochen Qiang 2022-05-09  8404  	case ATH11K_SCAN_STARTING:
3a5627b94222c3 Baochen Qiang 2022-05-09  8405  	case ATH11K_SCAN_RUNNING:
3a5627b94222c3 Baochen Qiang 2022-05-09  8406  	case ATH11K_SCAN_ABORTING:
3a5627b94222c3 Baochen Qiang 2022-05-09  8407  		ret =3D -EBUSY;
3a5627b94222c3 Baochen Qiang 2022-05-09  8408  		break;
3a5627b94222c3 Baochen Qiang 2022-05-09  8409  	}
3a5627b94222c3 Baochen Qiang 2022-05-09  8410  	spin_unlock_bh(&ar->data_lo=
ck);
3a5627b94222c3 Baochen Qiang 2022-05-09  8411  =

3a5627b94222c3 Baochen Qiang 2022-05-09 @8412  	if (ret)
3a5627b94222c3 Baochen Qiang 2022-05-09  8413  		goto exit;
3a5627b94222c3 Baochen Qiang 2022-05-09  8414  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8415  	scan_time_msec =3D ar->hw->=
wiphy->max_remain_on_channel_duration * 2;
3a5627b94222c3 Baochen Qiang 2022-05-09  8416  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8417  	memset(&arg, 0, sizeof(arg)=
);
3a5627b94222c3 Baochen Qiang 2022-05-09  8418  	ath11k_wmi_start_scan_init(=
ar, &arg);
3a5627b94222c3 Baochen Qiang 2022-05-09  8419  	arg.num_chan =3D 1;
3a5627b94222c3 Baochen Qiang 2022-05-09  8420  	arg.chan_list =3D kcalloc(a=
rg.num_chan, sizeof(*arg.chan_list),
3a5627b94222c3 Baochen Qiang 2022-05-09  8421  				GFP_KERNEL);
3a5627b94222c3 Baochen Qiang 2022-05-09  8422  	if (!arg.chan_list) {
3a5627b94222c3 Baochen Qiang 2022-05-09  8423  		ret =3D -ENOMEM;
3a5627b94222c3 Baochen Qiang 2022-05-09  8424  		goto exit;
3a5627b94222c3 Baochen Qiang 2022-05-09  8425  	}
3a5627b94222c3 Baochen Qiang 2022-05-09  8426  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8427  	arg.vdev_id =3D arvif->vdev=
_id;
3a5627b94222c3 Baochen Qiang 2022-05-09  8428  	arg.scan_id =3D ATH11K_SCAN=
_ID;
3a5627b94222c3 Baochen Qiang 2022-05-09  8429  	arg.chan_list[0] =3D chan->=
center_freq;
3a5627b94222c3 Baochen Qiang 2022-05-09  8430  	arg.dwell_time_active =3D s=
can_time_msec;
3a5627b94222c3 Baochen Qiang 2022-05-09  8431  	arg.dwell_time_passive =3D =
scan_time_msec;
3a5627b94222c3 Baochen Qiang 2022-05-09  8432  	arg.max_scan_time =3D scan_=
time_msec;
3a5627b94222c3 Baochen Qiang 2022-05-09  8433  	arg.scan_flags |=3D WMI_SCA=
N_FLAG_PASSIVE;
3a5627b94222c3 Baochen Qiang 2022-05-09  8434  	arg.scan_flags |=3D WMI_SCA=
N_FILTER_PROBE_REQ;
3a5627b94222c3 Baochen Qiang 2022-05-09  8435  	arg.burst_duration =3D dura=
tion;
3a5627b94222c3 Baochen Qiang 2022-05-09  8436  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8437  	ret =3D ath11k_start_scan(a=
r, &arg);
3a5627b94222c3 Baochen Qiang 2022-05-09  8438  	if (ret) {
3a5627b94222c3 Baochen Qiang 2022-05-09  8439  		ath11k_warn(ar->ab, "faile=
d to start roc scan: %d\n", ret);
3a5627b94222c3 Baochen Qiang 2022-05-09  8440  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8441  		spin_lock_bh(&ar->data_loc=
k);
3a5627b94222c3 Baochen Qiang 2022-05-09  8442  		ar->scan.state =3D ATH11K_=
SCAN_IDLE;
3a5627b94222c3 Baochen Qiang 2022-05-09  8443  		spin_unlock_bh(&ar->data_l=
ock);
3a5627b94222c3 Baochen Qiang 2022-05-09  8444  		goto free_chan_list;
3a5627b94222c3 Baochen Qiang 2022-05-09  8445  	}
3a5627b94222c3 Baochen Qiang 2022-05-09  8446  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8447  	ret =3D wait_for_completion=
_timeout(&ar->scan.on_channel, 3 * HZ);
3a5627b94222c3 Baochen Qiang 2022-05-09  8448  	if (ret =3D=3D 0) {
3a5627b94222c3 Baochen Qiang 2022-05-09  8449  		ath11k_warn(ar->ab, "faile=
d to switch to channel for roc scan\n");
3a5627b94222c3 Baochen Qiang 2022-05-09  8450  		ret =3D ath11k_scan_stop(a=
r);
3a5627b94222c3 Baochen Qiang 2022-05-09  8451  		if (ret)
3a5627b94222c3 Baochen Qiang 2022-05-09  8452  			ath11k_warn(ar->ab, "fail=
ed to stop scan: %d\n", ret);
3a5627b94222c3 Baochen Qiang 2022-05-09  8453  		ret =3D -ETIMEDOUT;
3a5627b94222c3 Baochen Qiang 2022-05-09  8454  		goto free_chan_list;
3a5627b94222c3 Baochen Qiang 2022-05-09  8455  	}
3a5627b94222c3 Baochen Qiang 2022-05-09  8456  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8457  	ieee80211_queue_delayed_wor=
k(ar->hw, &ar->scan.timeout,
3a5627b94222c3 Baochen Qiang 2022-05-09  8458  				     msecs_to_jiffies(du=
ration));
3a5627b94222c3 Baochen Qiang 2022-05-09  8459  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8460  	ret =3D 0;
3a5627b94222c3 Baochen Qiang 2022-05-09  8461  =

3a5627b94222c3 Baochen Qiang 2022-05-09  8462  free_chan_list:
3a5627b94222c3 Baochen Qiang 2022-05-09  8463  	kfree(arg.chan_list);
3a5627b94222c3 Baochen Qiang 2022-05-09  8464  exit:
3a5627b94222c3 Baochen Qiang 2022-05-09  8465  	mutex_unlock(&ar->conf_mute=
x);
3a5627b94222c3 Baochen Qiang 2022-05-09  8466  	return ret;
3a5627b94222c3 Baochen Qiang 2022-05-09  8467  }
3a5627b94222c3 Baochen Qiang 2022-05-09  8468  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6656356039234442822==--

