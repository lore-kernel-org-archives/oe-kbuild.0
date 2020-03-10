Content-Type: multipart/mixed; boundary="===============0992900988035939596=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending 32/34] drivers/net/wireless/ath/ath11k/mac.c:2431 ath11k_mac_op_set_key() error: we previously assumed 'peer' could be null (see line 2406)
Date: Tue, 10 Mar 2020 14:03:13 +0300
Message-ID: <20200310110313.GC11561@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0992900988035939596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng
head:   8098994ce0e3684547d874966af5d4c27c11f855
commit: a0ad1ebe9632f7077f8a827ea23fa1508383c6b0 [32/34] ath11k: Perform pe=
r-msdu rx processing

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/mac.c:2431 ath11k_mac_op_set_key() error: w=
e previously assumed 'peer' could be null (see line 2406)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=
=3Da0ad1ebe9632f7077f8a827ea23fa1508383c6b0
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo=
/ath.git
git remote update ath6kl
git checkout a0ad1ebe9632f7077f8a827ea23fa1508383c6b0
vim +/peer +2431 drivers/net/wireless/ath/ath11k/mac.c

5c65159f28953 Kalle Valo           2019-11-23  2320  static int ath11k_mac_=
op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
d5c65159f28953 Kalle Valo           2019-11-23  2321  				 struct ieee80211=
_vif *vif, struct ieee80211_sta *sta,
d5c65159f28953 Kalle Valo           2019-11-23  2322  				 struct ieee80211=
_key_conf *key)
d5c65159f28953 Kalle Valo           2019-11-23  2323  {
d5c65159f28953 Kalle Valo           2019-11-23  2324  	struct ath11k *ar =
=3D hw->priv;
d5c65159f28953 Kalle Valo           2019-11-23  2325  	struct ath11k_base *=
ab =3D ar->ab;
d5c65159f28953 Kalle Valo           2019-11-23  2326  	struct ath11k_vif *a=
rvif =3D ath11k_vif_to_arvif(vif);
d5c65159f28953 Kalle Valo           2019-11-23  2327  	struct ath11k_peer *=
peer;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2328  	struct ath11k_sta *a=
rsta;
d5c65159f28953 Kalle Valo           2019-11-23  2329  	const u8 *peer_addr;
d5c65159f28953 Kalle Valo           2019-11-23  2330  	int ret =3D 0;
d5c65159f28953 Kalle Valo           2019-11-23  2331  	u32 flags =3D 0;
d5c65159f28953 Kalle Valo           2019-11-23  2332  =

d5c65159f28953 Kalle Valo           2019-11-23  2333  	/* BIP needs to be d=
one in software */
d5c65159f28953 Kalle Valo           2019-11-23  2334  	if (key->cipher =3D=
=3D WLAN_CIPHER_SUITE_AES_CMAC ||
d5c65159f28953 Kalle Valo           2019-11-23  2335  	    key->cipher =3D=
=3D WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
d5c65159f28953 Kalle Valo           2019-11-23  2336  	    key->cipher =3D=
=3D WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
d5c65159f28953 Kalle Valo           2019-11-23  2337  	    key->cipher =3D=
=3D WLAN_CIPHER_SUITE_BIP_CMAC_256)
d5c65159f28953 Kalle Valo           2019-11-23  2338  		return 1;
d5c65159f28953 Kalle Valo           2019-11-23  2339  =

d5c65159f28953 Kalle Valo           2019-11-23  2340  	if (key->keyidx > WM=
I_MAX_KEY_INDEX)
d5c65159f28953 Kalle Valo           2019-11-23  2341  		return -ENOSPC;
d5c65159f28953 Kalle Valo           2019-11-23  2342  =

d5c65159f28953 Kalle Valo           2019-11-23  2343  	mutex_lock(&ar->conf=
_mutex);
d5c65159f28953 Kalle Valo           2019-11-23  2344  =

d5c65159f28953 Kalle Valo           2019-11-23  2345  	if (sta)
d5c65159f28953 Kalle Valo           2019-11-23  2346  		peer_addr =3D sta->=
addr;
d5c65159f28953 Kalle Valo           2019-11-23  2347  	else if (arvif->vdev=
_type =3D=3D WMI_VDEV_TYPE_STA)
d5c65159f28953 Kalle Valo           2019-11-23  2348  		peer_addr =3D vif->=
bss_conf.bssid;
d5c65159f28953 Kalle Valo           2019-11-23  2349  	else
d5c65159f28953 Kalle Valo           2019-11-23  2350  		peer_addr =3D vif->=
addr;
d5c65159f28953 Kalle Valo           2019-11-23  2351  =

d5c65159f28953 Kalle Valo           2019-11-23  2352  	key->hw_key_idx =3D =
key->keyidx;
d5c65159f28953 Kalle Valo           2019-11-23  2353  =

d5c65159f28953 Kalle Valo           2019-11-23  2354  	/* the peer should n=
ot disappear in mid-way (unless FW goes awry) since
d5c65159f28953 Kalle Valo           2019-11-23  2355  	 * we already hold c=
onf_mutex. we just make sure its there now.
d5c65159f28953 Kalle Valo           2019-11-23  2356  	 */
d5c65159f28953 Kalle Valo           2019-11-23  2357  	spin_lock_bh(&ab->ba=
se_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2358  	peer =3D ath11k_peer=
_find(ab, arvif->vdev_id, peer_addr);
d5c65159f28953 Kalle Valo           2019-11-23  2359  	spin_unlock_bh(&ab->=
base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2360  =

d5c65159f28953 Kalle Valo           2019-11-23  2361  	if (!peer) {
d5c65159f28953 Kalle Valo           2019-11-23  2362  		if (cmd =3D=3D SET_=
KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2363  			ath11k_warn(ab, "c=
annot install key for non-existent peer %pM\n",
d5c65159f28953 Kalle Valo           2019-11-23  2364  				    peer_addr);
d5c65159f28953 Kalle Valo           2019-11-23  2365  			ret =3D -EOPNOTSUP=
P;
d5c65159f28953 Kalle Valo           2019-11-23  2366  			goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2367  		} else {
d5c65159f28953 Kalle Valo           2019-11-23  2368  			/* if the peer doe=
sn't exist there is no key to disable
d5c65159f28953 Kalle Valo           2019-11-23  2369  			 * anymore
d5c65159f28953 Kalle Valo           2019-11-23  2370  			 */
d5c65159f28953 Kalle Valo           2019-11-23  2371  			goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2372  		}
d5c65159f28953 Kalle Valo           2019-11-23  2373  	}
d5c65159f28953 Kalle Valo           2019-11-23  2374  =

d5c65159f28953 Kalle Valo           2019-11-23  2375  	if (key->flags & IEE=
E80211_KEY_FLAG_PAIRWISE)
d5c65159f28953 Kalle Valo           2019-11-23  2376  		flags |=3D WMI_KEY_=
PAIRWISE;
d5c65159f28953 Kalle Valo           2019-11-23  2377  	else
d5c65159f28953 Kalle Valo           2019-11-23  2378  		flags |=3D WMI_KEY_=
GROUP;
d5c65159f28953 Kalle Valo           2019-11-23  2379  =

d5c65159f28953 Kalle Valo           2019-11-23  2380  	ret =3D ath11k_insta=
ll_key(arvif, key, cmd, peer_addr, flags);
d5c65159f28953 Kalle Valo           2019-11-23  2381  	if (ret) {
d5c65159f28953 Kalle Valo           2019-11-23  2382  		ath11k_warn(ab, "at=
h11k_install_key failed (%d)\n", ret);
d5c65159f28953 Kalle Valo           2019-11-23  2383  		goto exit;
d5c65159f28953 Kalle Valo           2019-11-23  2384  	}
d5c65159f28953 Kalle Valo           2019-11-23  2385  =

4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2386  	ret =3D ath11k_dp_pe=
er_rx_pn_replay_config(arvif, peer_addr, cmd, key);
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2387  	if (ret) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2388  		ath11k_warn(ab, "fa=
iled to offload PN replay detection %d\n", ret);
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2389  		goto exit;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2390  	}
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2391  =

d5c65159f28953 Kalle Valo           2019-11-23  2392  	spin_lock_bh(&ab->ba=
se_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2393  	peer =3D ath11k_peer=
_find(ab, arvif->vdev_id, peer_addr);
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2394  	if (peer && cmd =3D=
=3D SET_KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2395  		peer->keys[key->key=
idx] =3D key;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2396  		if (key->flags & IE=
EE80211_KEY_FLAG_PAIRWISE)
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2397  			peer->ucast_keyidx=
 =3D key->keyidx;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2398  		else
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2399  			peer->mcast_keyidx=
 =3D key->keyidx;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2400  	} else if (peer && c=
md =3D=3D DISABLE_KEY) {
d5c65159f28953 Kalle Valo           2019-11-23  2401  		peer->keys[key->key=
idx] =3D NULL;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2402  		if (key->flags & IE=
EE80211_KEY_FLAG_PAIRWISE)
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2403  			peer->ucast_keyidx=
 =3D 0;
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2404  		else
481e5890884c05 Manikanta Pubbisetty 2020-02-14  2405  			peer->mcast_keyidx=
 =3D 0;
481e5890884c05 Manikanta Pubbisetty 2020-02-14 @2406  	} else if (!peer)
d5c65159f28953 Kalle Valo           2019-11-23  2407  		/* impossible unles=
s FW goes crazy */
d5c65159f28953 Kalle Valo           2019-11-23  2408  		ath11k_warn(ab, "pe=
er %pM disappeared!\n", peer_addr);

return?

4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2409  =

4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2410  	if (sta) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2411  		arsta =3D (struct a=
th11k_sta *)sta->drv_priv;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2412  =

4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2413  		switch (key->cipher=
) {
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2414  		case WLAN_CIPHER_SU=
ITE_TKIP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2415  		case WLAN_CIPHER_SU=
ITE_CCMP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2416  		case WLAN_CIPHER_SU=
ITE_CCMP_256:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2417  		case WLAN_CIPHER_SU=
ITE_GCMP:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2418  		case WLAN_CIPHER_SU=
ITE_GCMP_256:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2419  			if (cmd =3D=3D SET=
_KEY)
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2420  				arsta->pn_type =
=3D HAL_PN_TYPE_WPA;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2421  			else
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2422  				arsta->pn_type =
=3D HAL_PN_TYPE_NONE;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2423  			break;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2424  		default:
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2425  			arsta->pn_type =3D=
 HAL_PN_TYPE_NONE;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2426  			break;
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2427  		}
4ba8cd524555a1 Manikanta Pubbisetty 2020-02-14  2428  	}
a0ad1ebe9632f7 Sriram R             2020-02-17  2429  =

a0ad1ebe9632f7 Sriram R             2020-02-17  2430  	if (key->flags & IEE=
E80211_KEY_FLAG_PAIRWISE)
a0ad1ebe9632f7 Sriram R             2020-02-17 @2431  		peer->sec_type =3D =
ath11k_dp_tx_get_encrypt_type(key->cipher);
                                                                ^^^^^^^^^^^=
^^^

a0ad1ebe9632f7 Sriram R             2020-02-17  2432  	else
a0ad1ebe9632f7 Sriram R             2020-02-17  2433  		peer->sec_type_grp =
=3D ath11k_dp_tx_get_encrypt_type(key->cipher);
a0ad1ebe9632f7 Sriram R             2020-02-17  2434  =

d5c65159f28953 Kalle Valo           2019-11-23  2435  	spin_unlock_bh(&ab->=
base_lock);
d5c65159f28953 Kalle Valo           2019-11-23  2436  =

d5c65159f28953 Kalle Valo           2019-11-23  2437  exit:
d5c65159f28953 Kalle Valo           2019-11-23  2438  	mutex_unlock(&ar->co=
nf_mutex);
d5c65159f28953 Kalle Valo           2019-11-23  2439  	return ret;
d5c65159f28953 Kalle Valo           2019-11-23  2440  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0992900988035939596==--

