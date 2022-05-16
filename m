Content-Type: multipart/mixed; boundary="===============2867637356917776577=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vhost/net.c:1551 vhost_net_set_backend() error: we previously assumed 'sock' could be null (see line 1535)
Date: Mon, 16 May 2022 20:34:30 +0800
Message-ID: <202205162015.L9KEqkf1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2867637356917776577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Al Viro <viro@zeniv.linux.org.uk>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220515-1132=
20/Chengguang-Xu/vfs-move-fdput-to-right-place-in-ksys_sync_file_range/2022=
0511-234644
head:   765e3ca8da36f99cc8134ac0f7810006bb3e2ce9
commit: 765e3ca8da36f99cc8134ac0f7810006bb3e2ce9 double fget() in vhost/net=
 (was Re: [PATCH] vfs: move fdput() to right place in ksys_sync_file_range(=
))
date:   33 hours ago
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-m031-20220516 (https://download.01.org/0day-ci/ar=
chive/20220516/202205162015.L9KEqkf1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vhost/net.c:1551 vhost_net_set_backend() error: we previously assum=
ed 'sock' could be null (see line 1535)

Old smatch warnings:
drivers/vhost/net.c:1090 get_rx_bufs() error: uninitialized symbol 'len'.

vim +/sock +1551 drivers/vhost/net.c

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1498  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1499  static long vhost_net_s=
et_backend(struct vhost_net *n, unsigned index, int fd)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1500  {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1501  	struct socket *sock, *=
oldsock;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1502  	struct vhost_virtqueue=
 *vq;
2839400f8fe28c Asias He           2013-04-27  1503  	struct vhost_net_virtq=
ueue *nvq;
fe729a57c8d85b Asias He           2013-05-06  1504  	struct vhost_net_ubuf_=
ref *ubufs, *oldubufs =3D NULL;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1505  	int r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1506  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1507  	mutex_lock(&n->dev.mut=
ex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1508  	r =3D vhost_dev_check_=
owner(&n->dev);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1509  	if (r)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1510  		goto err;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1511  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1512  	if (index >=3D VHOST_N=
ET_VQ_MAX) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1513  		r =3D -ENOBUFS;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1514  		goto err;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1515  	}
3ab2e420ec1caf Asias He           2013-04-27  1516  	vq =3D &n->vqs[index].=
vq;
2839400f8fe28c Asias He           2013-04-27  1517  	nvq =3D &n->vqs[index];
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1518  	mutex_lock(&vq->mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1519  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1520  	/* Verify that ring ha=
s been setup correctly. */
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1521  	if (!vhost_vq_access_o=
k(vq)) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1522  		r =3D -EFAULT;
1dace8c801ac53 Jeff Dike          2010-03-04  1523  		goto err_vq;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1524  	}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1525  	sock =3D get_socket(fd=
);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1526  	if (IS_ERR(sock)) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1527  		r =3D PTR_ERR(sock);
1dace8c801ac53 Jeff Dike          2010-03-04  1528  		goto err_vq;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1529  	}
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1530  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1531  	/* start polling new s=
ocket */
247643f85782fc Eugenio P=C3=A9rez      2020-03-31  1532  	oldsock =3D vhost=
_vq_get_backend(vq);
dd1f4078f0d2de Jeff Dike          2010-03-04  1533  	if (sock !=3D oldsock)=
 {
fe729a57c8d85b Asias He           2013-05-06  1534  		ubufs =3D vhost_net_u=
buf_alloc(vq,
fe729a57c8d85b Asias He           2013-05-06 @1535  					     sock && vhost=
_sock_zcopy(sock));
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1536  		if (IS_ERR(ubufs)) {
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1537  			r =3D PTR_ERR(ubufs);
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1538  			goto err_ubufs;
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1539  		}
692a998b908ae4 Jason Wang         2013-01-28  1540  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1541  		vhost_net_disable_vq(=
n, vq);
247643f85782fc Eugenio P=C3=A9rez      2020-03-31  1542  		vhost_vq_set_bac=
kend(vq, sock);
c67df11f6e4806 Jason Wang         2017-05-17  1543  		vhost_net_buf_unprodu=
ce(nvq);
80f7d0301e7913 Greg Kurz          2016-02-16  1544  		r =3D vhost_vq_init_a=
ccess(vq);
f59281dafb832b Jason Wang         2011-06-21  1545  		if (r)
692a998b908ae4 Jason Wang         2013-01-28  1546  			goto err_used;
2b8b328b61c799 Jason Wang         2013-01-28  1547  		r =3D vhost_net_enabl=
e_vq(n, vq);
2b8b328b61c799 Jason Wang         2013-01-28  1548  		if (r)
2b8b328b61c799 Jason Wang         2013-01-28  1549  			goto err_used;
303fd71b37fb71 Jason Wang         2018-03-09  1550  		if (index =3D=3D VHOS=
T_NET_VQ_RX)
765e3ca8da36f9 Al Viro            2022-05-15 @1551  			nvq->rx_ring =3D get=
_tap_ptr_ring(sock->file);
692a998b908ae4 Jason Wang         2013-01-28  1552  =

2839400f8fe28c Asias He           2013-04-27  1553  		oldubufs =3D nvq->ubu=
fs;
2839400f8fe28c Asias He           2013-04-27  1554  		nvq->ubufs =3D ubufs;
64e9a9b8a0eef9 Michael S. Tsirkin 2012-12-03  1555  =

64e9a9b8a0eef9 Michael S. Tsirkin 2012-12-03  1556  		n->tx_packets =3D 0;
64e9a9b8a0eef9 Michael S. Tsirkin 2012-12-03  1557  		n->tx_zcopy_err =3D 0;
1280c27f8e29ac Michael S. Tsirkin 2012-12-04  1558  		n->tx_flush =3D false;
dd1f4078f0d2de Jeff Dike          2010-03-04  1559  	}
dd1f4078f0d2de Jeff Dike          2010-03-04  1560  =

1680e9063ea280 Michael S. Tsirkin 2010-07-15  1561  	mutex_unlock(&vq->mute=
x);
1680e9063ea280 Michael S. Tsirkin 2010-07-15  1562  =

c047e5f3170c25 Michael S. Tsirkin 2011-07-20  1563  	if (oldubufs) {
c38e39c378f46f Michael S. Tsirkin 2013-06-25  1564  		vhost_net_ubuf_put_wa=
it_and_free(oldubufs);
c047e5f3170c25 Michael S. Tsirkin 2011-07-20  1565  		mutex_lock(&vq->mutex=
);
eaae8132ef6032 Michael S. Tsirkin 2012-11-01  1566  		vhost_zerocopy_signal=
_used(n, vq);
c047e5f3170c25 Michael S. Tsirkin 2011-07-20  1567  		mutex_unlock(&vq->mut=
ex);
c047e5f3170c25 Michael S. Tsirkin 2011-07-20  1568  	}
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1569  =

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1570  	if (oldsock) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1571  		vhost_net_flush_vq(n,=
 index);
09aaacf02a3e88 Al Viro            2014-03-05  1572  		sockfd_put(oldsock);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1573  	}
1dace8c801ac53 Jeff Dike          2010-03-04  1574  =

1680e9063ea280 Michael S. Tsirkin 2010-07-15  1575  	mutex_unlock(&n->dev.m=
utex);
1680e9063ea280 Michael S. Tsirkin 2010-07-15  1576  	return 0;
1680e9063ea280 Michael S. Tsirkin 2010-07-15  1577  =

692a998b908ae4 Jason Wang         2013-01-28  1578  err_used:
247643f85782fc Eugenio P=C3=A9rez      2020-03-31  1579  	vhost_vq_set_back=
end(vq, oldsock);
692a998b908ae4 Jason Wang         2013-01-28  1580  	vhost_net_enable_vq(n,=
 vq);
692a998b908ae4 Jason Wang         2013-01-28  1581  	if (ubufs)
c38e39c378f46f Michael S. Tsirkin 2013-06-25  1582  		vhost_net_ubuf_put_wa=
it_and_free(ubufs);
bab632d69ee48a Michael S. Tsirkin 2011-07-18  1583  err_ubufs:
b8f1f65882f079 Jason Wang         2018-06-21  1584  	if (sock)
09aaacf02a3e88 Al Viro            2014-03-05  1585  		sockfd_put(sock);
1dace8c801ac53 Jeff Dike          2010-03-04  1586  err_vq:
1dace8c801ac53 Jeff Dike          2010-03-04  1587  	mutex_unlock(&vq->mute=
x);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1588  err:
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1589  	mutex_unlock(&n->dev.m=
utex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1590  	return r;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1591  }
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1592  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2867637356917776577==--

