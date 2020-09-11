Content-Type: multipart/mixed; boundary="===============1037448637682130223=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/mlx5/main.c:1189 mlx5_ib_query_device() error: we previously assumed 'uhw' could be null (see line 837)
Date: Fri, 11 Sep 2020 18:15:28 +0800
Message-ID: <202009111806.7mmhH57B%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1037448637682130223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Leon Romanovsky <leonro@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   581cb3a26baf846ee9636214afaa5333919875b1
commit: 4835709176e8ccf6561abc9f5c405293e008095f RDMA/mlx5: Don't fake udat=
a for kernel path
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: powerpc-randconfig-m031-20200911 (attached as .config)
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/infiniband/hw/mlx5/main.c:1189 mlx5_ib_query_device() error: we pre=
viously assumed 'uhw' could be null (see line 837)

Old smatch warnings:
drivers/infiniband/hw/mlx5/main.c:614 set_roce_addr() error: we previously =
assumed 'gid' could be null (see line 590)
drivers/infiniband/hw/mlx5/main.c:1939 mlx5_ib_alloc_ucontext() error: unin=
itialized symbol 'dump_fill_mkey'.

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D4835709176e8ccf6561abc9f5c405293e008095f
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 4835709176e8ccf6561abc9f5c405293e008095f
vim +/uhw +1189 drivers/infiniband/hw/mlx5/main.c

1b5daf11b01512 Majd Dibbiny     2015-06-04   813  =

e126ba97dba9ed Eli Cohen        2013-07-07   814  static int mlx5_ib_query_=
device(struct ib_device *ibdev,
2528e33e680921 Matan Barak      2015-06-11   815  				struct ib_device_attr=
 *props,
2528e33e680921 Matan Barak      2015-06-11   816  				struct ib_udata *uhw)
e126ba97dba9ed Eli Cohen        2013-07-07   817  {
4835709176e8cc Leon Romanovsky  2020-01-15   818  	size_t uhw_outlen =3D (u=
hw) ? uhw->outlen : 0;
e126ba97dba9ed Eli Cohen        2013-07-07   819  	struct mlx5_ib_dev *dev =
=3D to_mdev(ibdev);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   820  	struct mlx5_core_dev *md=
ev =3D dev->mdev;
e126ba97dba9ed Eli Cohen        2013-07-07   821  	int err =3D -ENOMEM;
288c01b746aab4 Eli Cohen        2016-10-27   822  	int max_sq_desc;
e126ba97dba9ed Eli Cohen        2013-07-07   823  	int max_rq_sg;
e126ba97dba9ed Eli Cohen        2013-07-07   824  	int max_sq_sg;
e0238a6a369eaa Sagi Grimberg    2015-07-21   825  	u64 min_page_size =3D 1u=
ll << MLX5_CAP_GEN(mdev, log_pg_sz);
85c7c01499a9eb Daniel Jurgens   2018-01-04   826  	bool raw_support =3D !ml=
x5_core_mp_enabled(mdev);
402ca53644ff19 Bodong Wang      2016-06-17   827  	struct mlx5_ib_query_dev=
ice_resp resp =3D {};
402ca53644ff19 Bodong Wang      2016-06-17   828  	size_t resp_len;
402ca53644ff19 Bodong Wang      2016-06-17   829  	u64 max_tso;
e126ba97dba9ed Eli Cohen        2013-07-07   830  =

402ca53644ff19 Bodong Wang      2016-06-17   831  	resp_len =3D sizeof(resp=
.comp_mask) + sizeof(resp.response_length);
4835709176e8cc Leon Romanovsky  2020-01-15   832  	if (uhw_outlen && uhw_ou=
tlen < resp_len)
402ca53644ff19 Bodong Wang      2016-06-17   833  		return -EINVAL;
6f26b2ac699cc5 Erez Alfasi      2019-10-02   834  =

402ca53644ff19 Bodong Wang      2016-06-17   835  	resp.response_length =3D=
 resp_len;
402ca53644ff19 Bodong Wang      2016-06-17   836  =

4835709176e8cc Leon Romanovsky  2020-01-15   837  	if (uhw && uhw->inlen &&=
 !ib_is_udata_cleared(uhw, 0, uhw->inlen))
2528e33e680921 Matan Barak      2015-06-11   838  		return -EINVAL;
2528e33e680921 Matan Barak      2015-06-11   839  =

1b5daf11b01512 Majd Dibbiny     2015-06-04   840  	memset(props, 0, sizeof(=
*props));
1b5daf11b01512 Majd Dibbiny     2015-06-04   841  	err =3D mlx5_query_syste=
m_image_guid(ibdev,
1b5daf11b01512 Majd Dibbiny     2015-06-04   842  					   &props->sys_image=
_guid);
1b5daf11b01512 Majd Dibbiny     2015-06-04   843  	if (err)
1b5daf11b01512 Majd Dibbiny     2015-06-04   844  		return err;
e126ba97dba9ed Eli Cohen        2013-07-07   845  =

1b5daf11b01512 Majd Dibbiny     2015-06-04   846  	err =3D mlx5_query_max_p=
keys(ibdev, &props->max_pkeys);
e126ba97dba9ed Eli Cohen        2013-07-07   847  	if (err)
1b5daf11b01512 Majd Dibbiny     2015-06-04   848  		return err;
e126ba97dba9ed Eli Cohen        2013-07-07   849  =

1b5daf11b01512 Majd Dibbiny     2015-06-04   850  	err =3D mlx5_query_vendo=
r_id(ibdev, &props->vendor_id);
1b5daf11b01512 Majd Dibbiny     2015-06-04   851  	if (err)
1b5daf11b01512 Majd Dibbiny     2015-06-04   852  		return err;
e126ba97dba9ed Eli Cohen        2013-07-07   853  =

9603b61de1eee9 Jack Morgenstein 2014-07-28   854  	props->fw_ver =3D ((u64)=
fw_rev_maj(dev->mdev) << 32) |
9603b61de1eee9 Jack Morgenstein 2014-07-28   855  		(fw_rev_min(dev->mdev) =
<< 16) |
9603b61de1eee9 Jack Morgenstein 2014-07-28   856  		fw_rev_sub(dev->mdev);
e126ba97dba9ed Eli Cohen        2013-07-07   857  	props->device_cap_flags =
   =3D IB_DEVICE_CHANGE_PHY_PORT |
e126ba97dba9ed Eli Cohen        2013-07-07   858  		IB_DEVICE_PORT_ACTIVE_E=
VENT		|
e126ba97dba9ed Eli Cohen        2013-07-07   859  		IB_DEVICE_SYS_IMAGE_GUI=
D		|
1a4c3a3dc5fdee Eli Cohen        2014-02-06   860  		IB_DEVICE_RC_RNR_NAK_GE=
N;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   861  =

938fe83c8dcbbf Saeed Mahameed   2015-05-28   862  	if (MLX5_CAP_GEN(mdev, p=
kv))
e126ba97dba9ed Eli Cohen        2013-07-07   863  		props->device_cap_flags=
 |=3D IB_DEVICE_BAD_PKEY_CNTR;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   864  	if (MLX5_CAP_GEN(mdev, q=
kv))
e126ba97dba9ed Eli Cohen        2013-07-07   865  		props->device_cap_flags=
 |=3D IB_DEVICE_BAD_QKEY_CNTR;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   866  	if (MLX5_CAP_GEN(mdev, a=
pm))
e126ba97dba9ed Eli Cohen        2013-07-07   867  		props->device_cap_flags=
 |=3D IB_DEVICE_AUTO_PATH_MIG;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   868  	if (MLX5_CAP_GEN(mdev, x=
rc))
e126ba97dba9ed Eli Cohen        2013-07-07   869  		props->device_cap_flags=
 |=3D IB_DEVICE_XRC;
d2370e0a573e5c Matan Barak      2016-02-29   870  	if (MLX5_CAP_GEN(mdev, i=
maicl)) {
d2370e0a573e5c Matan Barak      2016-02-29   871  		props->device_cap_flags=
 |=3D IB_DEVICE_MEM_WINDOW |
d2370e0a573e5c Matan Barak      2016-02-29   872  					   IB_DEVICE_MEM_WIN=
DOW_TYPE_2B;
d2370e0a573e5c Matan Barak      2016-02-29   873  		props->max_mw =3D 1 << =
MLX5_CAP_GEN(mdev, log_max_mkey);
b005d316471374 Sagi Grimberg    2016-02-29   874  		/* We support 'Gappy' m=
emory registration too */
b005d316471374 Sagi Grimberg    2016-02-29   875  		props->device_cap_flags=
 |=3D IB_DEVICE_SG_GAPS_REG;
d2370e0a573e5c Matan Barak      2016-02-29   876  	}
e126ba97dba9ed Eli Cohen        2013-07-07   877  	props->device_cap_flags =
|=3D IB_DEVICE_MEM_MGT_EXTENSIONS;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   878  	if (MLX5_CAP_GEN(mdev, s=
ho)) {
c0a6cbb9cbccff Israel Rukshin   2019-06-11   879  		props->device_cap_flags=
 |=3D IB_DEVICE_INTEGRITY_HANDOVER;
2dea909444c294 Sagi Grimberg    2014-02-23   880  		/* At this stage no sup=
port for signature handover */
2dea909444c294 Sagi Grimberg    2014-02-23   881  		props->sig_prot_cap =3D=
 IB_PROT_T10DIF_TYPE_1 |
2dea909444c294 Sagi Grimberg    2014-02-23   882  				      IB_PROT_T10DIF_=
TYPE_2 |
2dea909444c294 Sagi Grimberg    2014-02-23   883  				      IB_PROT_T10DIF_=
TYPE_3;
2dea909444c294 Sagi Grimberg    2014-02-23   884  		props->sig_guard_cap =
=3D IB_GUARD_T10DIF_CRC |
2dea909444c294 Sagi Grimberg    2014-02-23   885  				       IB_GUARD_T10DI=
F_CSUM;
2dea909444c294 Sagi Grimberg    2014-02-23   886  	}
938fe83c8dcbbf Saeed Mahameed   2015-05-28   887  	if (MLX5_CAP_GEN(mdev, b=
lock_lb_mc))
f360d88a2efddf Eli Cohen        2014-04-02   888  		props->device_cap_flags=
 |=3D IB_DEVICE_BLOCK_MULTICAST_LOOPBACK;
e126ba97dba9ed Eli Cohen        2013-07-07   889  =

85c7c01499a9eb Daniel Jurgens   2018-01-04   890  	if (MLX5_CAP_GEN(dev->md=
ev, eth_net_offloads) && raw_support) {
e8161334403ed3 Noa Osherovich   2017-01-18   891  		if (MLX5_CAP_ETH(mdev, =
csum_cap)) {
e8161334403ed3 Noa Osherovich   2017-01-18   892  			/* Legacy bit to suppo=
rt old userspace libraries */
88115fe7a0e45a Bodong Wang      2015-12-18   893  			props->device_cap_flag=
s |=3D IB_DEVICE_RAW_IP_CSUM;
e8161334403ed3 Noa Osherovich   2017-01-18   894  			props->raw_packet_caps=
 |=3D IB_RAW_PACKET_CAP_IP_CSUM;
e8161334403ed3 Noa Osherovich   2017-01-18   895  		}
e8161334403ed3 Noa Osherovich   2017-01-18   896  =

e8161334403ed3 Noa Osherovich   2017-01-18   897  		if (MLX5_CAP_ETH(dev->m=
dev, vlan_cap))
e8161334403ed3 Noa Osherovich   2017-01-18   898  			props->raw_packet_caps=
 |=3D
e8161334403ed3 Noa Osherovich   2017-01-18   899  				IB_RAW_PACKET_CAP_CVL=
AN_STRIPPING;
88115fe7a0e45a Bodong Wang      2015-12-18   900  =

4835709176e8cc Leon Romanovsky  2020-01-15   901  		if (field_avail(typeof(=
resp), tso_caps, uhw_outlen)) {
402ca53644ff19 Bodong Wang      2016-06-17   902  			max_tso =3D MLX5_CAP_E=
TH(mdev, max_lso_cap);
402ca53644ff19 Bodong Wang      2016-06-17   903  			if (max_tso) {
402ca53644ff19 Bodong Wang      2016-06-17   904  				resp.tso_caps.max_tso=
 =3D 1 << max_tso;
402ca53644ff19 Bodong Wang      2016-06-17   905  				resp.tso_caps.support=
ed_qpts |=3D
402ca53644ff19 Bodong Wang      2016-06-17   906  					1 << IB_QPT_RAW_PACK=
ET;
402ca53644ff19 Bodong Wang      2016-06-17   907  				resp.response_length =
+=3D sizeof(resp.tso_caps);
402ca53644ff19 Bodong Wang      2016-06-17   908  			}
402ca53644ff19 Bodong Wang      2016-06-17   909  		}
31f69a82b456e3 Yishai Hadas     2016-08-28   910  =

4835709176e8cc Leon Romanovsky  2020-01-15   911  		if (field_avail(typeof(=
resp), rss_caps, uhw_outlen)) {
31f69a82b456e3 Yishai Hadas     2016-08-28   912  			resp.rss_caps.rx_hash_=
function =3D
31f69a82b456e3 Yishai Hadas     2016-08-28   913  						MLX5_RX_HASH_FUNC_T=
OEPLITZ;
31f69a82b456e3 Yishai Hadas     2016-08-28   914  			resp.rss_caps.rx_hash_=
fields_mask =3D
31f69a82b456e3 Yishai Hadas     2016-08-28   915  						MLX5_RX_HASH_SRC_IP=
V4 |
31f69a82b456e3 Yishai Hadas     2016-08-28   916  						MLX5_RX_HASH_DST_IP=
V4 |
31f69a82b456e3 Yishai Hadas     2016-08-28   917  						MLX5_RX_HASH_SRC_IP=
V6 |
31f69a82b456e3 Yishai Hadas     2016-08-28   918  						MLX5_RX_HASH_DST_IP=
V6 |
31f69a82b456e3 Yishai Hadas     2016-08-28   919  						MLX5_RX_HASH_SRC_PO=
RT_TCP |
31f69a82b456e3 Yishai Hadas     2016-08-28   920  						MLX5_RX_HASH_DST_PO=
RT_TCP |
31f69a82b456e3 Yishai Hadas     2016-08-28   921  						MLX5_RX_HASH_SRC_PO=
RT_UDP |
4e2b53a5cb5a82 Maor Gottlieb    2017-12-24   922  						MLX5_RX_HASH_DST_PO=
RT_UDP |
4e2b53a5cb5a82 Maor Gottlieb    2017-12-24   923  						MLX5_RX_HASH_INNER;
2d93fc856959bb Matan Barak      2018-03-28   924  			if (mlx5_accel_ipsec_d=
evice_caps(dev->mdev) &
2d93fc856959bb Matan Barak      2018-03-28   925  			    MLX5_ACCEL_IPSEC_C=
AP_DEVICE)
2d93fc856959bb Matan Barak      2018-03-28   926  				resp.rss_caps.rx_hash=
_fields_mask |=3D
2d93fc856959bb Matan Barak      2018-03-28   927  					MLX5_RX_HASH_IPSEC_S=
PI;
31f69a82b456e3 Yishai Hadas     2016-08-28   928  			resp.response_length +=
=3D sizeof(resp.rss_caps);
31f69a82b456e3 Yishai Hadas     2016-08-28   929  		}
31f69a82b456e3 Yishai Hadas     2016-08-28   930  	} else {
4835709176e8cc Leon Romanovsky  2020-01-15   931  		if (field_avail(typeof(=
resp), tso_caps, uhw_outlen))
31f69a82b456e3 Yishai Hadas     2016-08-28   932  			resp.response_length +=
=3D sizeof(resp.tso_caps);
4835709176e8cc Leon Romanovsky  2020-01-15   933  		if (field_avail(typeof(=
resp), rss_caps, uhw_outlen))
31f69a82b456e3 Yishai Hadas     2016-08-28   934  			resp.response_length +=
=3D sizeof(resp.rss_caps);
402ca53644ff19 Bodong Wang      2016-06-17   935  	}
402ca53644ff19 Bodong Wang      2016-06-17   936  =

f031396531fe2b Erez Shitrit     2016-02-21   937  	if (MLX5_CAP_GEN(mdev, i=
poib_basic_offloads)) {
f031396531fe2b Erez Shitrit     2016-02-21   938  		props->device_cap_flags=
 |=3D IB_DEVICE_UD_IP_CSUM;
f031396531fe2b Erez Shitrit     2016-02-21   939  		props->device_cap_flags=
 |=3D IB_DEVICE_UD_TSO;
f031396531fe2b Erez Shitrit     2016-02-21   940  	}
f031396531fe2b Erez Shitrit     2016-02-21   941  =

03404e8ae652e0 Maor Gottlieb    2017-05-30   942  	if (MLX5_CAP_GEN(dev->md=
ev, rq_delay_drop) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04   943  	    MLX5_CAP_GEN(dev->md=
ev, general_notification_event) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04   944  	    raw_support)
03404e8ae652e0 Maor Gottlieb    2017-05-30   945  		props->raw_packet_caps =
|=3D IB_RAW_PACKET_CAP_DELAY_DROP;
03404e8ae652e0 Maor Gottlieb    2017-05-30   946  =

1d54f89094e2d2 Yishai Hadas     2017-06-08   947  	if (MLX5_CAP_GEN(mdev, i=
poib_enhanced_offloads) &&
1d54f89094e2d2 Yishai Hadas     2017-06-08   948  	    MLX5_CAP_IPOIB_ENHAN=
CED(mdev, csum_cap))
1d54f89094e2d2 Yishai Hadas     2017-06-08   949  		props->device_cap_flags=
 |=3D IB_DEVICE_UD_IP_CSUM;
1d54f89094e2d2 Yishai Hadas     2017-06-08   950  =

cff5a0f3a3cda0 Majd Dibbiny     2016-04-17   951  	if (MLX5_CAP_GEN(dev->md=
ev, eth_net_offloads) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04   952  	    MLX5_CAP_ETH(dev->md=
ev, scatter_fcs) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04   953  	    raw_support) {
e8161334403ed3 Noa Osherovich   2017-01-18   954  		/* Legacy bit to suppor=
t old userspace libraries */
cff5a0f3a3cda0 Majd Dibbiny     2016-04-17   955  		props->device_cap_flags=
 |=3D IB_DEVICE_RAW_SCATTER_FCS;
e8161334403ed3 Noa Osherovich   2017-01-18   956  		props->raw_packet_caps =
|=3D IB_RAW_PACKET_CAP_SCATTER_FCS;
e8161334403ed3 Noa Osherovich   2017-01-18   957  	}
cff5a0f3a3cda0 Majd Dibbiny     2016-04-17   958  =

24da00164f7a9c Ariel Levkovich  2018-04-05   959  	if (MLX5_CAP_DEV_MEM(mde=
v, memic)) {
24da00164f7a9c Ariel Levkovich  2018-04-05   960  		props->max_dm_size =3D
24da00164f7a9c Ariel Levkovich  2018-04-05   961  			MLX5_CAP_DEV_MEM(mdev,=
 max_memic_size);
24da00164f7a9c Ariel Levkovich  2018-04-05   962  	}
24da00164f7a9c Ariel Levkovich  2018-04-05   963  =

da6d6ba3c6f085 Maor Gottlieb    2016-06-04   964  	if (mlx5_get_flow_namesp=
ace(dev->mdev, MLX5_FLOW_NAMESPACE_BYPASS))
da6d6ba3c6f085 Maor Gottlieb    2016-06-04   965  		props->device_cap_flags=
 |=3D IB_DEVICE_MANAGED_FLOW_STEERING;
da6d6ba3c6f085 Maor Gottlieb    2016-06-04   966  =

b1383aa6412177 Noa Osherovich   2017-10-29   967  	if (MLX5_CAP_GEN(mdev, e=
nd_pad))
b1383aa6412177 Noa Osherovich   2017-10-29   968  		props->device_cap_flags=
 |=3D IB_DEVICE_PCI_WRITE_END_PADDING;
b1383aa6412177 Noa Osherovich   2017-10-29   969  =

1b5daf11b01512 Majd Dibbiny     2015-06-04   970  	props->vendor_part_id	  =
 =3D mdev->pdev->device;
1b5daf11b01512 Majd Dibbiny     2015-06-04   971  	props->hw_ver		   =3D md=
ev->pdev->revision;
e126ba97dba9ed Eli Cohen        2013-07-07   972  =

e126ba97dba9ed Eli Cohen        2013-07-07   973  	props->max_mr_size	   =
=3D ~0ull;
e0238a6a369eaa Sagi Grimberg    2015-07-21   974  	props->page_size_cap	   =
=3D ~(min_page_size - 1);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   975  	props->max_qp		   =3D 1 =
<< MLX5_CAP_GEN(mdev, log_max_qp);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   976  	props->max_qp_wr	   =3D =
1 << MLX5_CAP_GEN(mdev, log_max_qp_sz);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   977  	max_rq_sg =3D  MLX5_CAP_=
GEN(mdev, max_wqe_sz_rq) /
938fe83c8dcbbf Saeed Mahameed   2015-05-28   978  		     sizeof(struct mlx5=
_wqe_data_seg);
288c01b746aab4 Eli Cohen        2016-10-27   979  	max_sq_desc =3D min_t(in=
t, MLX5_CAP_GEN(mdev, max_wqe_sz_sq), 512);
288c01b746aab4 Eli Cohen        2016-10-27   980  	max_sq_sg =3D (max_sq_de=
sc - sizeof(struct mlx5_wqe_ctrl_seg) -
288c01b746aab4 Eli Cohen        2016-10-27   981  		     sizeof(struct mlx5=
_wqe_raddr_seg)) /
e126ba97dba9ed Eli Cohen        2013-07-07   982  		sizeof(struct mlx5_wqe_=
data_seg);
33023fb85a42b5 Steve Wise       2018-06-18   983  	props->max_send_sge =3D =
max_sq_sg;
33023fb85a42b5 Steve Wise       2018-06-18   984  	props->max_recv_sge =3D =
max_rq_sg;
986ef95ecdd3eb Sagi Grimberg    2016-03-31   985  	props->max_sge_rd	   =3D=
 MLX5_MAX_SGE_RD;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   986  	props->max_cq		   =3D 1 =
<< MLX5_CAP_GEN(mdev, log_max_cq);
9f17768611ebf8 Leon Romanovsky  2016-01-14   987  	props->max_cqe =3D (1 <<=
 MLX5_CAP_GEN(mdev, log_max_cq_sz)) - 1;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   988  	props->max_mr		   =3D 1 =
<< MLX5_CAP_GEN(mdev, log_max_mkey);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   989  	props->max_pd		   =3D 1 =
<< MLX5_CAP_GEN(mdev, log_max_pd);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   990  	props->max_qp_rd_atom	  =
 =3D 1 << MLX5_CAP_GEN(mdev, log_max_ra_req_qp);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   991  	props->max_qp_init_rd_at=
om =3D 1 << MLX5_CAP_GEN(mdev, log_max_ra_res_qp);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   992  	props->max_srq		   =3D 1=
 << MLX5_CAP_GEN(mdev, log_max_srq);
938fe83c8dcbbf Saeed Mahameed   2015-05-28   993  	props->max_srq_wr =3D (1=
 << MLX5_CAP_GEN(mdev, log_max_srq_sz)) - 1;
938fe83c8dcbbf Saeed Mahameed   2015-05-28   994  	props->local_ca_ack_dela=
y  =3D MLX5_CAP_GEN(mdev, local_ca_ack_delay);
e126ba97dba9ed Eli Cohen        2013-07-07   995  	props->max_res_rd_atom	 =
  =3D props->max_qp_rd_atom * props->max_qp;
e126ba97dba9ed Eli Cohen        2013-07-07   996  	props->max_srq_sge	   =
=3D max_rq_sg - 1;
911f4331bc87f4 Sagi Grimberg    2016-03-03   997  	props->max_fast_reg_page=
_list_len =3D
911f4331bc87f4 Sagi Grimberg    2016-03-03   998  		1 << MLX5_CAP_GEN(mdev,=
 log_max_klm_list_size);
62e3c379d4d713 Max Gurtovoy     2019-06-11   999  	props->max_pi_fast_reg_p=
age_list_len =3D
62e3c379d4d713 Max Gurtovoy     2019-06-11  1000  		props->max_fast_reg_pag=
e_list_len / 2;
366090564b8124 Yamin Friedman   2019-10-07  1001  	props->max_sgl_rd =3D
366090564b8124 Yamin Friedman   2019-10-07  1002  		MLX5_CAP_GEN(mdev, max_=
sgl_for_optimized_performance);
776a3906b69296 Moni Shoua       2018-01-02  1003  	get_atomic_caps_qp(dev, =
props);
81bea28ffdaad0 Eli Cohen        2013-09-11  1004  	props->masked_atomic_cap=
   =3D IB_ATOMIC_NONE;
938fe83c8dcbbf Saeed Mahameed   2015-05-28  1005  	props->max_mcast_grp	   =
=3D 1 << MLX5_CAP_GEN(mdev, log_max_mcg);
938fe83c8dcbbf Saeed Mahameed   2015-05-28  1006  	props->max_mcast_qp_atta=
ch =3D MLX5_CAP_GEN(mdev, max_qp_mcg);
e126ba97dba9ed Eli Cohen        2013-07-07  1007  	props->max_total_mcast_q=
p_attach =3D props->max_mcast_qp_attach *
e126ba97dba9ed Eli Cohen        2013-07-07  1008  					   props->max_mcast_=
grp;
e126ba97dba9ed Eli Cohen        2013-07-07  1009  	props->max_map_per_fmr =
=3D INT_MAX; /* no limit in ConnectIB */
86695a6582e3b1 Maor Gottlieb    2016-10-27  1010  	props->max_ah =3D INT_MA=
X;
7c60bcbb68122b Matan Barak      2015-12-15  1011  	props->hca_core_clock =
=3D MLX5_CAP_GEN(mdev, device_frequency_khz);
7c60bcbb68122b Matan Barak      2015-12-15  1012  	props->timestamp_mask =
=3D 0x7FFFFFFFFFFFFFFFULL;
e126ba97dba9ed Eli Cohen        2013-07-07  1013  =

e502b8b011294c Leon Romanovsky  2019-01-08  1014  	if (IS_ENABLED(CONFIG_IN=
FINIBAND_ON_DEMAND_PAGING)) {
008157528ac565 Moni Shoua       2019-08-15  1015  		if (dev->odp_caps.gener=
al_caps & IB_ODP_SUPPORT)
8cdd312cfed706 Haggai Eran      2014-12-11  1016  			props->device_cap_flag=
s |=3D IB_DEVICE_ON_DEMAND_PAGING;
8cdd312cfed706 Haggai Eran      2014-12-11  1017  		props->odp_caps =3D dev=
->odp_caps;
e502b8b011294c Leon Romanovsky  2019-01-08  1018  	}
8cdd312cfed706 Haggai Eran      2014-12-11  1019  =

051f263098a90d Leon Romanovsky  2015-12-20  1020  	if (MLX5_CAP_GEN(mdev, c=
d))
051f263098a90d Leon Romanovsky  2015-12-20  1021  		props->device_cap_flags=
 |=3D IB_DEVICE_CROSS_CHANNEL;
051f263098a90d Leon Romanovsky  2015-12-20  1022  =

e53a9d26cf8056 Parav Pandit     2019-10-28  1023  	if (mlx5_core_is_vf(mdev=
))
eff901d30e6ceb Eli Cohen        2016-03-11  1024  		props->device_cap_flags=
 |=3D IB_DEVICE_VIRTUAL_FUNCTION;
eff901d30e6ceb Eli Cohen        2016-03-11  1025  =

31f69a82b456e3 Yishai Hadas     2016-08-28  1026  	if (mlx5_ib_port_link_la=
yer(ibdev, 1) =3D=3D
85c7c01499a9eb Daniel Jurgens   2018-01-04  1027  	    IB_LINK_LAYER_ETHERN=
ET && raw_support) {
31f69a82b456e3 Yishai Hadas     2016-08-28  1028  		props->rss_caps.max_rwq=
_indirection_tables =3D
31f69a82b456e3 Yishai Hadas     2016-08-28  1029  			1 << MLX5_CAP_GEN(dev-=
>mdev, log_max_rqt);
31f69a82b456e3 Yishai Hadas     2016-08-28  1030  		props->rss_caps.max_rwq=
_indirection_table_size =3D
31f69a82b456e3 Yishai Hadas     2016-08-28  1031  			1 << MLX5_CAP_GEN(dev-=
>mdev, log_max_rqt_size);
31f69a82b456e3 Yishai Hadas     2016-08-28  1032  		props->rss_caps.support=
ed_qpts =3D 1 << IB_QPT_RAW_PACKET;
31f69a82b456e3 Yishai Hadas     2016-08-28  1033  		props->max_wq_type_rq =
=3D
31f69a82b456e3 Yishai Hadas     2016-08-28  1034  			1 << MLX5_CAP_GEN(dev-=
>mdev, log_max_rq);
31f69a82b456e3 Yishai Hadas     2016-08-28  1035  	}
31f69a82b456e3 Yishai Hadas     2016-08-28  1036  =

eb761894351d03 Artemy Kovalyov  2017-08-17  1037  	if (MLX5_CAP_GEN(mdev, t=
ag_matching)) {
78b1beb0998437 Leon Romanovsky  2017-09-24  1038  		props->tm_caps.max_num_=
tags =3D
eb761894351d03 Artemy Kovalyov  2017-08-17  1039  			(1 << MLX5_CAP_GEN(mde=
v, log_tag_matching_list_sz)) - 1;
78b1beb0998437 Leon Romanovsky  2017-09-24  1040  		props->tm_caps.max_ops =
=3D
eb761894351d03 Artemy Kovalyov  2017-08-17  1041  			1 << MLX5_CAP_GEN(mdev=
, log_max_qp_sz);
78b1beb0998437 Leon Romanovsky  2017-09-24  1042  		props->tm_caps.max_sge =
=3D MLX5_TM_MAX_SGE;
eb761894351d03 Artemy Kovalyov  2017-08-17  1043  	}
eb761894351d03 Artemy Kovalyov  2017-08-17  1044  =

89705e92700170 Danit Goldberg   2019-07-05  1045  	if (MLX5_CAP_GEN(mdev, t=
ag_matching) &&
89705e92700170 Danit Goldberg   2019-07-05  1046  	    MLX5_CAP_GEN(mdev, r=
ndv_offload_rc)) {
89705e92700170 Danit Goldberg   2019-07-05  1047  		props->tm_caps.flags =
=3D IB_TM_CAP_RNDV_RC;
89705e92700170 Danit Goldberg   2019-07-05  1048  		props->tm_caps.max_rndv=
_hdr_size =3D MLX5_TM_MAX_RNDV_MSG_SIZE;
89705e92700170 Danit Goldberg   2019-07-05  1049  	}
89705e92700170 Danit Goldberg   2019-07-05  1050  =

87ab3f524efd17 Yonatan Cohen    2017-11-13  1051  	if (MLX5_CAP_GEN(dev->md=
ev, cq_moderation)) {
87ab3f524efd17 Yonatan Cohen    2017-11-13  1052  		props->cq_caps.max_cq_m=
oderation_count =3D
87ab3f524efd17 Yonatan Cohen    2017-11-13  1053  						MLX5_MAX_CQ_COUNT;
87ab3f524efd17 Yonatan Cohen    2017-11-13  1054  		props->cq_caps.max_cq_m=
oderation_period =3D
87ab3f524efd17 Yonatan Cohen    2017-11-13  1055  						MLX5_MAX_CQ_PERIOD;
87ab3f524efd17 Yonatan Cohen    2017-11-13  1056  	}
87ab3f524efd17 Yonatan Cohen    2017-11-13  1057  =

4835709176e8cc Leon Romanovsky  2020-01-15  1058  	if (field_avail(typeof(r=
esp), cqe_comp_caps, uhw_outlen)) {
572f46bf947c3e Yonatan Cohen    2018-05-27  1059  		resp.response_length +=
=3D sizeof(resp.cqe_comp_caps);
572f46bf947c3e Yonatan Cohen    2018-05-27  1060  =

572f46bf947c3e Yonatan Cohen    2018-05-27  1061  		if (MLX5_CAP_GEN(dev->m=
dev, cqe_compression)) {
7e43a2a5bae39f Bodong Wang      2016-10-31  1062  			resp.cqe_comp_caps.max=
_num =3D
572f46bf947c3e Yonatan Cohen    2018-05-27  1063  				MLX5_CAP_GEN(dev->mde=
v,
572f46bf947c3e Yonatan Cohen    2018-05-27  1064  					     cqe_compression=
_max_num);
572f46bf947c3e Yonatan Cohen    2018-05-27  1065  =

7e43a2a5bae39f Bodong Wang      2016-10-31  1066  			resp.cqe_comp_caps.sup=
ported_format =3D
7e43a2a5bae39f Bodong Wang      2016-10-31  1067  				MLX5_IB_CQE_RES_FORMA=
T_HASH |
7e43a2a5bae39f Bodong Wang      2016-10-31  1068  				MLX5_IB_CQE_RES_FORMA=
T_CSUM;
6f1006a43869ff Yonatan Cohen    2018-05-27  1069  =

6f1006a43869ff Yonatan Cohen    2018-05-27  1070  			if (MLX5_CAP_GEN(dev->=
mdev, mini_cqe_resp_stride_index))
6f1006a43869ff Yonatan Cohen    2018-05-27  1071  				resp.cqe_comp_caps.su=
pported_format |=3D
6f1006a43869ff Yonatan Cohen    2018-05-27  1072  					MLX5_IB_CQE_RES_FORM=
AT_CSUM_STRIDX;
572f46bf947c3e Yonatan Cohen    2018-05-27  1073  		}
7e43a2a5bae39f Bodong Wang      2016-10-31  1074  	}
7e43a2a5bae39f Bodong Wang      2016-10-31  1075  =

4835709176e8cc Leon Romanovsky  2020-01-15  1076  	if (field_avail(typeof(r=
esp), packet_pacing_caps, uhw_outlen) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04  1077  	    raw_support) {
d949167d68b304 Bodong Wang      2016-12-01  1078  		if (MLX5_CAP_QOS(mdev, =
packet_pacing) &&
d949167d68b304 Bodong Wang      2016-12-01  1079  		    MLX5_CAP_GEN(mdev, =
qos)) {
d949167d68b304 Bodong Wang      2016-12-01  1080  			resp.packet_pacing_cap=
s.qp_rate_limit_max =3D
d949167d68b304 Bodong Wang      2016-12-01  1081  				MLX5_CAP_QOS(mdev, pa=
cket_pacing_max_rate);
d949167d68b304 Bodong Wang      2016-12-01  1082  			resp.packet_pacing_cap=
s.qp_rate_limit_min =3D
d949167d68b304 Bodong Wang      2016-12-01  1083  				MLX5_CAP_QOS(mdev, pa=
cket_pacing_min_rate);
d949167d68b304 Bodong Wang      2016-12-01  1084  			resp.packet_pacing_cap=
s.supported_qpts |=3D
d949167d68b304 Bodong Wang      2016-12-01  1085  				1 << IB_QPT_RAW_PACKE=
T;
61147f391a8b3b Bodong Wang      2018-03-19  1086  			if (MLX5_CAP_QOS(mdev,=
 packet_pacing_burst_bound) &&
61147f391a8b3b Bodong Wang      2018-03-19  1087  			    MLX5_CAP_QOS(mdev,=
 packet_pacing_typical_size))
61147f391a8b3b Bodong Wang      2018-03-19  1088  				resp.packet_pacing_ca=
ps.cap_flags |=3D
61147f391a8b3b Bodong Wang      2018-03-19  1089  					MLX5_IB_PP_SUPPORT_B=
URST;
d949167d68b304 Bodong Wang      2016-12-01  1090  		}
d949167d68b304 Bodong Wang      2016-12-01  1091  		resp.response_length +=
=3D sizeof(resp.packet_pacing_caps);
d949167d68b304 Bodong Wang      2016-12-01  1092  	}
d949167d68b304 Bodong Wang      2016-12-01  1093  =

9f885201f27407 Leon Romanovsky  2017-01-02  1094  	if (field_avail(typeof(r=
esp), mlx5_ib_support_multi_pkt_send_wqes,
4835709176e8cc Leon Romanovsky  2020-01-15  1095  			uhw_outlen)) {
795b609c8b59f8 Bodong Wang      2017-08-17  1096  		if (MLX5_CAP_ETH(mdev, =
multi_pkt_send_wqe))
9f885201f27407 Leon Romanovsky  2017-01-02  1097  			resp.mlx5_ib_support_m=
ulti_pkt_send_wqes =3D
795b609c8b59f8 Bodong Wang      2017-08-17  1098  				MLX5_IB_ALLOW_MPW;
050da902adde8f Bodong Wang      2017-08-17  1099  =

050da902adde8f Bodong Wang      2017-08-17  1100  		if (MLX5_CAP_ETH(mdev, =
enhanced_multi_pkt_send_wqe))
050da902adde8f Bodong Wang      2017-08-17  1101  			resp.mlx5_ib_support_m=
ulti_pkt_send_wqes |=3D
050da902adde8f Bodong Wang      2017-08-17  1102  				MLX5_IB_SUPPORT_EMPW;
050da902adde8f Bodong Wang      2017-08-17  1103  =

9f885201f27407 Leon Romanovsky  2017-01-02  1104  		resp.response_length +=
=3D
9f885201f27407 Leon Romanovsky  2017-01-02  1105  			sizeof(resp.mlx5_ib_su=
pport_multi_pkt_send_wqes);
9f885201f27407 Leon Romanovsky  2017-01-02  1106  	}
9f885201f27407 Leon Romanovsky  2017-01-02  1107  =

4835709176e8cc Leon Romanovsky  2020-01-15  1108  	if (field_avail(typeof(r=
esp), flags, uhw_outlen)) {
de57f2ad06d5bf Guy Levi         2017-10-19  1109  		resp.response_length +=
=3D sizeof(resp.flags);
7a0c8f4244e9ec Guy Levi         2017-10-19  1110  =

de57f2ad06d5bf Guy Levi         2017-10-19  1111  		if (MLX5_CAP_GEN(mdev, =
cqe_compression_128))
de57f2ad06d5bf Guy Levi         2017-10-19  1112  			resp.flags |=3D
de57f2ad06d5bf Guy Levi         2017-10-19  1113  				MLX5_IB_QUERY_DEV_RES=
P_FLAGS_CQE_128B_COMP;
7a0c8f4244e9ec Guy Levi         2017-10-19  1114  =

7a0c8f4244e9ec Guy Levi         2017-10-19  1115  		if (MLX5_CAP_GEN(mdev, =
cqe_128_always))
7a0c8f4244e9ec Guy Levi         2017-10-19  1116  			resp.flags |=3D MLX5_I=
B_QUERY_DEV_RESP_FLAGS_CQE_128B_PAD;
7e11b911b520de Danit Goldberg   2018-11-30  1117  		if (MLX5_CAP_GEN(mdev, =
qp_packet_based))
7e11b911b520de Danit Goldberg   2018-11-30  1118  			resp.flags |=3D
7e11b911b520de Danit Goldberg   2018-11-30  1119  				MLX5_IB_QUERY_DEV_RES=
P_PACKET_BASED_CREDIT_MODE;
7249c8ea227a58 Guy Levi         2019-04-10  1120  =

7249c8ea227a58 Guy Levi         2019-04-10  1121  		resp.flags |=3D MLX5_IB=
_QUERY_DEV_RESP_FLAGS_SCAT2CQE_DCT;
de57f2ad06d5bf Guy Levi         2017-10-19  1122  	}
9f885201f27407 Leon Romanovsky  2017-01-02  1123  =

4835709176e8cc Leon Romanovsky  2020-01-15  1124  	if (field_avail(typeof(r=
esp), sw_parsing_caps, uhw_outlen)) {
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1125  		resp.response_length +=
=3D sizeof(resp.sw_parsing_caps);
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1126  		if (MLX5_CAP_ETH(mdev, =
swp)) {
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1127  			resp.sw_parsing_caps.s=
w_parsing_offloads |=3D
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1128  				MLX5_IB_SW_PARSING;
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1129  =

96dc3fc5f1d66b Noa Osherovich   2017-08-17  1130  			if (MLX5_CAP_ETH(mdev,=
 swp_csum))
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1131  				resp.sw_parsing_caps.=
sw_parsing_offloads |=3D
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1132  					MLX5_IB_SW_PARSING_C=
SUM;
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1133  =

96dc3fc5f1d66b Noa Osherovich   2017-08-17  1134  			if (MLX5_CAP_ETH(mdev,=
 swp_lso))
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1135  				resp.sw_parsing_caps.=
sw_parsing_offloads |=3D
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1136  					MLX5_IB_SW_PARSING_L=
SO;
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1137  =

96dc3fc5f1d66b Noa Osherovich   2017-08-17  1138  			if (resp.sw_parsing_ca=
ps.sw_parsing_offloads)
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1139  				resp.sw_parsing_caps.=
supported_qpts =3D
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1140  					BIT(IB_QPT_RAW_PACKE=
T);
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1141  		}
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1142  	}
96dc3fc5f1d66b Noa Osherovich   2017-08-17  1143  =

4835709176e8cc Leon Romanovsky  2020-01-15  1144  	if (field_avail(typeof(r=
esp), striding_rq_caps, uhw_outlen) &&
85c7c01499a9eb Daniel Jurgens   2018-01-04  1145  	    raw_support) {
b4f34597a5ce14 Noa Osherovich   2017-10-17  1146  		resp.response_length +=
=3D sizeof(resp.striding_rq_caps);
b4f34597a5ce14 Noa Osherovich   2017-10-17  1147  		if (MLX5_CAP_GEN(mdev, =
striding_rq)) {
b4f34597a5ce14 Noa Osherovich   2017-10-17  1148  			resp.striding_rq_caps.=
min_single_stride_log_num_of_bytes =3D
b4f34597a5ce14 Noa Osherovich   2017-10-17  1149  				MLX5_MIN_SINGLE_STRID=
E_LOG_NUM_BYTES;
b4f34597a5ce14 Noa Osherovich   2017-10-17  1150  			resp.striding_rq_caps.=
max_single_stride_log_num_of_bytes =3D
b4f34597a5ce14 Noa Osherovich   2017-10-17  1151  				MLX5_MAX_SINGLE_STRID=
E_LOG_NUM_BYTES;
c16339b69c0d58 Mark Zhang       2019-11-15  1152  			if (MLX5_CAP_GEN(dev->=
mdev, ext_stride_num_range))
c16339b69c0d58 Mark Zhang       2019-11-15  1153  				resp.striding_rq_caps
c16339b69c0d58 Mark Zhang       2019-11-15  1154  					.min_single_wqe_log_=
num_of_strides =3D
c16339b69c0d58 Mark Zhang       2019-11-15  1155  					MLX5_EXT_MIN_SINGLE_=
WQE_LOG_NUM_STRIDES;
c16339b69c0d58 Mark Zhang       2019-11-15  1156  			else
c16339b69c0d58 Mark Zhang       2019-11-15  1157  				resp.striding_rq_caps
c16339b69c0d58 Mark Zhang       2019-11-15  1158  					.min_single_wqe_log_=
num_of_strides =3D
b4f34597a5ce14 Noa Osherovich   2017-10-17  1159  					MLX5_MIN_SINGLE_WQE_=
LOG_NUM_STRIDES;
b4f34597a5ce14 Noa Osherovich   2017-10-17  1160  			resp.striding_rq_caps.=
max_single_wqe_log_num_of_strides =3D
b4f34597a5ce14 Noa Osherovich   2017-10-17  1161  				MLX5_MAX_SINGLE_WQE_L=
OG_NUM_STRIDES;
b4f34597a5ce14 Noa Osherovich   2017-10-17  1162  			resp.striding_rq_caps.=
supported_qpts =3D
b4f34597a5ce14 Noa Osherovich   2017-10-17  1163  				BIT(IB_QPT_RAW_PACKET=
);
b4f34597a5ce14 Noa Osherovich   2017-10-17  1164  		}
b4f34597a5ce14 Noa Osherovich   2017-10-17  1165  	}
b4f34597a5ce14 Noa Osherovich   2017-10-17  1166  =

4835709176e8cc Leon Romanovsky  2020-01-15  1167  	if (field_avail(typeof(r=
esp), tunnel_offloads_caps, uhw_outlen)) {
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1168  		resp.response_length +=
=3D sizeof(resp.tunnel_offloads_caps);
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1169  		if (MLX5_CAP_ETH(mdev, =
tunnel_stateless_vxlan))
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1170  			resp.tunnel_offloads_c=
aps |=3D
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1171  				MLX5_IB_TUNNELED_OFFL=
OADS_VXLAN;
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1172  		if (MLX5_CAP_ETH(mdev, =
tunnel_stateless_geneve_rx))
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1173  			resp.tunnel_offloads_c=
aps |=3D
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1174  				MLX5_IB_TUNNELED_OFFL=
OADS_GENEVE;
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1175  		if (MLX5_CAP_ETH(mdev, =
tunnel_stateless_gre))
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1176  			resp.tunnel_offloads_c=
aps |=3D
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1177  				MLX5_IB_TUNNELED_OFFL=
OADS_GRE;
e818e255a58d64 Ariel Levkovich  2018-05-13  1178  		if (MLX5_CAP_GEN(mdev, =
flex_parser_protocols) &
e818e255a58d64 Ariel Levkovich  2018-05-13  1179  		    MLX5_FLEX_PROTO_CW_=
MPLS_GRE)
e818e255a58d64 Ariel Levkovich  2018-05-13  1180  			resp.tunnel_offloads_c=
aps |=3D
e818e255a58d64 Ariel Levkovich  2018-05-13  1181  				MLX5_IB_TUNNELED_OFFL=
OADS_MPLS_GRE;
e818e255a58d64 Ariel Levkovich  2018-05-13  1182  		if (MLX5_CAP_GEN(mdev, =
flex_parser_protocols) &
e818e255a58d64 Ariel Levkovich  2018-05-13  1183  		    MLX5_FLEX_PROTO_CW_=
MPLS_UDP)
e818e255a58d64 Ariel Levkovich  2018-05-13  1184  			resp.tunnel_offloads_c=
aps |=3D
e818e255a58d64 Ariel Levkovich  2018-05-13  1185  				MLX5_IB_TUNNELED_OFFL=
OADS_MPLS_UDP;
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1186  	}
f95ef6cbae61fa Maor Gottlieb    2017-10-19  1187  =

4835709176e8cc Leon Romanovsky  2020-01-15  1188  	if (uhw_outlen) {
402ca53644ff19 Bodong Wang      2016-06-17 @1189  		err =3D ib_copy_to_udat=
a(uhw, &resp, resp.response_length);
402ca53644ff19 Bodong Wang      2016-06-17  1190  =

402ca53644ff19 Bodong Wang      2016-06-17  1191  		if (err)
402ca53644ff19 Bodong Wang      2016-06-17  1192  			return err;
402ca53644ff19 Bodong Wang      2016-06-17  1193  	}
402ca53644ff19 Bodong Wang      2016-06-17  1194  =

1b5daf11b01512 Majd Dibbiny     2015-06-04  1195  	return 0;
e126ba97dba9ed Eli Cohen        2013-07-07  1196  }
e126ba97dba9ed Eli Cohen        2013-07-07  1197  =


:::::: The code at line 1189 was first introduced by commit
:::::: 402ca53644ff1928f2ea68cce6fe41b2b5f38510 IB/mlx5: Report mlx5 TSO ca=
pabilities when querying device

:::::: TO: Bodong Wang <bodong@mellanox.com>
:::::: CC: Doug Ledford <dledford@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1037448637682130223==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wIk646vG/wFYm1iidhQCAA==
--===============1037448637682130223==--

