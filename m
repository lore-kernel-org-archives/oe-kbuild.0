Content-Type: multipart/mixed; boundary="===============1567913636612306651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11646/13159] drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:550:31: sparse: sparse: context imbalance in 'chcr_ktls_dev_add' - unexpected unlock
Date: Mon, 05 Oct 2020 09:29:32 +0800
Message-ID: <202010050929.N4VK0hKY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1567913636612306651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Rohit Maheshwari <rohitm@chelsio.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2172e358cd1713c5b7c31361ac465edfe55e455c
commit: efca3878a5fbda8d847bd4afb7ccf48b62876d48 [11646/13159] ch_ktls: Iss=
ue if connection offload fails
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: ia64-randconfig-s032-20201005 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Defca3878a5fbda8d847bd4afb7ccf48b62876d48
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout efca3878a5fbda8d847bd4afb7ccf48b62876d48
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

	echo
	echo "sparse warnings: (new ones prefixed by >>)"
	echo
>> drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c:550:31: s=
parse: sparse: context imbalance in 'chcr_ktls_dev_add' - unexpected unlock

vim +/chcr_ktls_dev_add +550 drivers/net/ethernet/chelsio/inline_crypto/ch_=
ktls/chcr_ktls.c

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  370  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  371  /*
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  372   * chcr_ktls_dev_add:  call back for t=
ls_dev_add.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  373   * Create a tcb entry for TP. Also add=
 l2t entry for the connection. And
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  374   * generate keys & save those keys loc=
ally.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  375   * @netdev - net device.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  376   * @tls_cts - tls context.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  377   * @direction - TX/RX crypto direction
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  378   * return: SUCCESS/FAILURE.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  379   */
a8c16e8ed624f2 drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-10  380  static int chcr_ktls_dev_add(struct ne=
t_device *netdev, struct sock *sk,
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  381  			     enum tls_offload_ctx_dir direc=
tion,
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  382  			     struct tls_crypto_info *crypto=
_info,
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  383  			     u32 start_offload_tcp_sn)
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  384  {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  385  	struct tls_context *tls_ctx =3D tls_g=
et_ctx(sk);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  386  	struct chcr_ktls_ofld_ctx_tx *tx_ctx;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  387  	struct chcr_ktls_info *tx_info;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  388  	struct dst_entry *dst;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  389  	struct adapter *adap;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  390  	struct port_info *pi;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  391  	struct neighbour *n;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  392  	u8 daaddr[16];
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  393  	int ret =3D -1;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  394  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  395  	tx_ctx =3D chcr_get_ktls_tx_context(t=
ls_ctx);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  396  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  397  	pi =3D netdev_priv(netdev);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  398  	adap =3D pi->adapter;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  399  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  400  	atomic64_inc(&adap->ch_ktls_stats.ktl=
s_tx_connection_open);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  401  	if (direction =3D=3D TLS_OFFLOAD_CTX_=
DIR_RX) {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  402  		pr_err("not expecting for RX directi=
on\n");
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  403  		goto out;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  404  	}
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  405  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  406  	if (tx_ctx->chcr_info)
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  407  		goto out;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  408  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  409  	tx_info =3D kvzalloc(sizeof(*tx_info)=
, GFP_KERNEL);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  410  	if (!tx_info)
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  411  		goto out;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  412  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  413  	tx_info->sk =3D sk;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  414  	spin_lock_init(&tx_info->lock);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  415  	/* initialize tid and atid to -1, 0 i=
s a also a valid id. */
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  416  	tx_info->tid =3D -1;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  417  	tx_info->atid =3D -1;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  418  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  419  	tx_info->adap =3D adap;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  420  	tx_info->netdev =3D netdev;
5a4b9fe7fece62 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  421  	tx_info->first_qset =3D pi->first_qse=
t;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  422  	tx_info->tx_chan =3D pi->tx_chan;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  423  	tx_info->smt_idx =3D pi->smt_idx;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  424  	tx_info->port_id =3D pi->port_id;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  425  	tx_info->prev_ack =3D 0;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  426  	tx_info->prev_win =3D 0;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  427  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  428  	tx_info->rx_qid =3D chcr_get_first_rx=
_qid(adap);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  429  	if (unlikely(tx_info->rx_qid < 0))
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  430  		goto free_tx_info;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  431  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  432  	tx_info->prev_seq =3D start_offload_t=
cp_sn;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  433  	tx_info->tcp_start_seq_number =3D sta=
rt_offload_tcp_sn;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  434  =

8a30923e1598c0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  435  	/* save crypto keys */
8a30923e1598c0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  436  	ret =3D chcr_ktls_save_keys(tx_info, =
crypto_info, direction);
8a30923e1598c0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  437  	if (ret < 0)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  438  		goto free_tx_info;
8a30923e1598c0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  439  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  440  	/* get peer ip */
76d7728db72446 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  441  	if (sk->sk_family =3D=3D AF_INET) {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  442  		memcpy(daaddr, &sk->sk_daddr, 4);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  443  		tx_info->ip_family =3D AF_INET;
76d7728db72446 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  444  #if IS_ENABLED(CONFIG_IPV6)
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  445  	} else {
76d7728db72446 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  446  		if (!sk->sk_ipv6only &&
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  447  		    ipv6_addr_type(&sk->sk_v6_daddr)=
 =3D=3D IPV6_ADDR_MAPPED) {
76d7728db72446 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  448  			memcpy(daaddr, &sk->sk_daddr, 4);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  449  			tx_info->ip_family =3D AF_INET;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  450  		} else {
62370a4f346dda drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  451  			memcpy(daaddr, sk->sk_v6_daddr.in6_=
u.u6_addr8, 16);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  452  			tx_info->ip_family =3D AF_INET6;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  453  		}
76d7728db72446 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  454  #endif
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  455  	}
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  456  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  457  	/* get the l2t index */
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  458  	dst =3D sk_dst_get(sk);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  459  	if (!dst) {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  460  		pr_err("DST entry not found\n");
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  461  		goto free_tx_info;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  462  	}
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  463  	n =3D dst_neigh_lookup(dst, daaddr);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  464  	if (!n || !n->dev) {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  465  		pr_err("neighbour not found\n");
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  466  		dst_release(dst);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  467  		goto free_tx_info;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  468  	}
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  469  	tx_info->l2te  =3D cxgb4_l2t_get(adap=
->l2t, n, n->dev, 0);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  470  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  471  	neigh_release(n);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  472  	dst_release(dst);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  473  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  474  	if (!tx_info->l2te) {
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  475  		pr_err("l2t entry not found\n");
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  476  		goto free_tx_info;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  477  	}
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  478  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  479  	/* Driver shouldn't be removed until =
any single connection exists */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  480  	if (!try_module_get(THIS_MODULE))
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  481  		goto free_l2t;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  482  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  483  	init_completion(&tx_info->completion);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  484  	/* create a filter and call cxgb4_l2t=
_send to send the packet out, which
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  485  	 * will take care of updating l2t ent=
ry in hw if not already done.
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  486  	 */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  487  	tx_info->open_state =3D CH_KTLS_OPEN_=
PENDING;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  488  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  489  	if (chcr_setup_connection(sk, tx_info=
))
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  490  		goto put_module;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  491  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  492  	/* Wait for reply */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  493  	wait_for_completion_timeout(&tx_info-=
>completion, 30 * HZ);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  494  	spin_lock_bh(&tx_info->lock);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  495  	if (tx_info->open_state) {
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  496  		/* need to wait for hw response, can=
't free tx_info yet. */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  497  		if (tx_info->open_state =3D=3D CH_KT=
LS_OPEN_PENDING)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  498  			tx_info->pending_close =3D true;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  499  		/* free the lock after the cleanup */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  500  		goto put_module;
a3ac249a1ab575 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  501  	}
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  502  	spin_unlock_bh(&tx_info->lock);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  503  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  504  	/* initialize tcb */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  505  	reinit_completion(&tx_info->completio=
n);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  506  	/* mark it pending for hw response */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  507  	tx_info->open_state =3D CH_KTLS_OPEN_=
PENDING;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  508  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  509  	if (chcr_init_tcb_fields(tx_info))
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  510  		goto free_tid;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  511  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  512  	/* Wait for reply */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  513  	wait_for_completion_timeout(&tx_info-=
>completion, 30 * HZ);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  514  	spin_lock_bh(&tx_info->lock);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  515  	if (tx_info->open_state) {
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  516  		/* need to wait for hw response, can=
't free tx_info yet. */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  517  		tx_info->pending_close =3D true;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  518  		/* free the lock after cleanup */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  519  		goto free_tid;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  520  	}
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  521  	spin_unlock_bh(&tx_info->lock);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  522  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  523  	if (!cxgb4_check_l2t_valid(tx_info->l=
2te))
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  524  		goto free_tid;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  525  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  526  	atomic64_inc(&adap->ch_ktls_stats.ktl=
s_tx_ctx);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  527  	tx_ctx->chcr_info =3D tx_info;
a3ac249a1ab575 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-06-01  528  =

34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  529  	return 0;
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  530  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  531  free_tid:
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  532  	chcr_ktls_mark_tcb_close(tx_info);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  533  #if IS_ENABLED(CONFIG_IPV6)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  534  	/* clear clip entry */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  535  	if (tx_info->ip_family =3D=3D AF_INET=
6)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  536  		cxgb4_clip_release(netdev, (const u3=
2 *)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  537  				   &sk->sk_v6_rcv_saddr,
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  538  				   1);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  539  #endif
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  540  	cxgb4_remove_tid(&tx_info->adap->tids=
, tx_info->tx_chan,
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  541  			 tx_info->tid, tx_info->ip_family);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  542  =

efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  543  put_module:
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  544  	/* release module refcount */
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  545  	module_put(THIS_MODULE);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  546  free_l2t:
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  547  	cxgb4_l2t_release(tx_info->l2te);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  548  free_tx_info:
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  549  	if (tx_info->pending_close)
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29 @550  		spin_unlock_bh(&tx_info->lock);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  551  	else
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  552  		kvfree(tx_info);
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  553  out:
a8c16e8ed624f2 drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-10  554  	atomic64_inc(&adap->ch_ktls_stats.ktl=
s_tx_connection_fail);
efca3878a5fbda drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls=
.c Rohit Maheshwari 2020-09-29  555  	return -1;
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  556  }
34aba2c45024a0 drivers/crypto/chelsio/chcr_ktls.c                          =
   Rohit Maheshwari 2020-03-07  557  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1567913636612306651==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
yDyDHPzoTHqWr1pn/3/apMMMvskBAA==
--===============1567913636612306651==--

