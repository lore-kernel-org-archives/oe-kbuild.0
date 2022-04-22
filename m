Content-Type: multipart/mixed; boundary="===============6550709780262110357=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 460/5845] drivers/net/wireless/ath/ath11k/peer.c:520 ath11k_peer_rhash_id_tbl_init() warn: missing error code 'ret'
Date: Fri, 22 Apr 2022 19:48:53 +0800
Message-ID: <202204221911.YI4xDtgU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6550709780262110357==
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
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: 7b0c70d92a435913f6e11d6a248b935697e8a3eb [460/5845] ath11k: Add pee=
r rhash table support
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220422/202204221911.YI4xDtgU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/ath/ath11k/peer.c:520 ath11k_peer_rhash_id_tbl_init() =
warn: missing error code 'ret'
drivers/net/wireless/ath/ath11k/peer.c:575 ath11k_peer_rhash_addr_tbl_init(=
) warn: missing error code 'ret'

vim +/ret +520 drivers/net/wireless/ath/ath11k/peer.c

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  479  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  480  static int ath11k_pe=
er_rhash_id_tbl_init(struct ath11k_base *ab)
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  481  {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  482  	struct rhashtable_p=
arams *param;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  483  	struct rhashtable *=
rhash_id_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  484  	int ret;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  485  	size_t size;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  486  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  487  	lockdep_assert_held=
(&ab->tbl_mtx_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  488  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  489  	if (ab->rhead_peer_=
id)
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  490  		return 0;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  491  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  492  	size =3D sizeof(*ab=
->rhead_peer_id);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  493  	rhash_id_tbl =3D kz=
alloc(size, GFP_KERNEL);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  494  	if (!rhash_id_tbl) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  495  		ath11k_warn(ab, "f=
ailed to init rhash id table due to no mem (size %zu)\n",
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  496  			    size);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  497  		return -ENOMEM;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  498  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  499  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  500  	param =3D &ab->rhas=
h_peer_id_param;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  501  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  502  	param->key_offset =
=3D offsetof(struct ath11k_peer, peer_id);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  503  	param->head_offset =
=3D offsetof(struct ath11k_peer, rhash_id);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  504  	param->key_len =3D =
sizeof_field(struct ath11k_peer, peer_id);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  505  	param->automatic_sh=
rinking =3D true;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  506  	param->nelem_hint =
=3D ab->num_radios * TARGET_NUM_PEERS_PDEV(ab);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  507  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  508  	ret =3D rhashtable_=
init(rhash_id_tbl, param);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  509  	if (ret) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  510  		ath11k_warn(ab, "f=
ailed to init peer id rhash table %d\n", ret);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  511  		goto err_free;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  512  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  513  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  514  	spin_lock_bh(&ab->b=
ase_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  515  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  516  	if (!ab->rhead_peer=
_id) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  517  		ab->rhead_peer_id =
=3D rhash_id_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  518  	} else {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  519  		spin_unlock_bh(&ab=
->base_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23 @520  		goto cleanup_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  521  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  522  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  523  	spin_unlock_bh(&ab-=
>base_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  524  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  525  	return 0;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  526  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  527  cleanup_tbl:
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  528  	rhashtable_destroy(=
rhash_id_tbl);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  529  err_free:
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  530  	kfree(rhash_id_tbl);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  531  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  532  	return ret;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  533  }
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  534  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  535  static int ath11k_pe=
er_rhash_addr_tbl_init(struct ath11k_base *ab)
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  536  {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  537  	struct rhashtable_p=
arams *param;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  538  	struct rhashtable *=
rhash_addr_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  539  	int ret;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  540  	size_t size;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  541  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  542  	lockdep_assert_held=
(&ab->tbl_mtx_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  543  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  544  	if (ab->rhead_peer_=
addr)
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  545  		return 0;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  546  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  547  	size =3D sizeof(*ab=
->rhead_peer_addr);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  548  	rhash_addr_tbl =3D =
kzalloc(size, GFP_KERNEL);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  549  	if (!rhash_addr_tbl=
) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  550  		ath11k_warn(ab, "f=
ailed to init rhash addr table due to no mem (size %zu)\n",
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  551  			    size);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  552  		return -ENOMEM;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  553  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  554  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  555  	param =3D &ab->rhas=
h_peer_addr_param;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  556  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  557  	param->key_offset =
=3D offsetof(struct ath11k_peer, addr);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  558  	param->head_offset =
=3D offsetof(struct ath11k_peer, rhash_addr);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  559  	param->key_len =3D =
sizeof_field(struct ath11k_peer, addr);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  560  	param->automatic_sh=
rinking =3D true;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  561  	param->nelem_hint =
=3D ab->num_radios * TARGET_NUM_PEERS_PDEV(ab);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  562  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  563  	ret =3D rhashtable_=
init(rhash_addr_tbl, param);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  564  	if (ret) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  565  		ath11k_warn(ab, "f=
ailed to init peer addr rhash table %d\n", ret);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  566  		goto err_free;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  567  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  568  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  569  	spin_lock_bh(&ab->b=
ase_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  570  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  571  	if (!ab->rhead_peer=
_addr) {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  572  		ab->rhead_peer_add=
r =3D rhash_addr_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  573  	} else {
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  574  		spin_unlock_bh(&ab=
->base_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23 @575  		goto cleanup_tbl;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  576  	}
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  577  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  578  	spin_unlock_bh(&ab-=
>base_lock);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  579  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  580  	return 0;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  581  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  582  cleanup_tbl:
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  583  	rhashtable_destroy(=
rhash_addr_tbl);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  584  err_free:
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  585  	kfree(rhash_addr_tb=
l);
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  586  =

7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  587  	return ret;
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  588  }
7b0c70d92a4359 Karthikeyan Periyasamy 2022-03-23  589  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6550709780262110357==--

