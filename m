Content-Type: multipart/mixed; boundary="===============7500896673003824992=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vhost/vhost.c:1603:13: sparse: expected unsigned int const
Date: Wed, 28 Oct 2020 19:50:58 +0800
Message-ID: <202010281949.mK6Z5xY9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7500896673003824992==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ed8780e3f2ecc82645342d070c6b4e530532e680
commit: 20c384f1ea1a0bc7320bc445c72dd02d2970d594 vhost: refine vhost and vr=
ingh kconfig
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: sh-randconfig-s031-20201028 (attached as .config)
compiler: sh4-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-56-gc09e8239-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D20c384f1ea1a0bc7320bc445c72dd02d2970d594
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 20c384f1ea1a0bc7320bc445c72dd02d2970d594
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dsh =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/vhost/vhost.c:1603:13: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected unsigned int const *__gu_ad=
dr @@     got unsigned int [noderef] [usertype] <asn:1> *idxp @@
>> drivers/vhost/vhost.c:1603:13: sparse:     expected unsigned int const *=
__gu_addr
   drivers/vhost/vhost.c:1603:13: sparse:     got unsigned int [noderef] [u=
sertype] <asn:1> *idxp
   drivers/vhost/vhost.c:1603:13: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:1> * @@     got unsigned int const *__gu_addr @@
   drivers/vhost/vhost.c:1603:13: sparse:     expected void const volatile =
[noderef] <asn:1> *
>> drivers/vhost/vhost.c:1603:13: sparse:     got unsigned int const *__gu_=
addr
   drivers/vhost/vhost.c:1800:21: sparse: sparse: incorrect type in initial=
izer (different address spaces) @@     expected int const *__gu_addr @@    =
 got int [noderef] <asn:1> * @@
>> drivers/vhost/vhost.c:1800:21: sparse:     expected int const *__gu_addr
   drivers/vhost/vhost.c:1800:21: sparse:     got int [noderef] <asn:1> *
   drivers/vhost/vhost.c:1800:21: sparse: sparse: incorrect type in argumen=
t 1 (different address spaces) @@     expected void const volatile [noderef=
] <asn:1> * @@     got int const *__gu_addr @@
   drivers/vhost/vhost.c:1800:21: sparse:     expected void const volatile =
[noderef] <asn:1> *
>> drivers/vhost/vhost.c:1800:21: sparse:     got int const *__gu_addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:937:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:937:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:937:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:922:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] [usertype] <asn:1> * @@
   drivers/vhost/vhost.c:922:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:922:16: sparse:     got restricted __virtio16 [nod=
eref] [usertype] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:1014:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1014:16: sparse:     got restricted __virtio16 [no=
deref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:995:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:995:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:944:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:944:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:944:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:1002:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1002:16: sparse:     got restricted __virtio16 [no=
deref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] [usertype] <asn:1> * @@
   drivers/vhost/vhost.c:1008:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1008:16: sparse:     got restricted __virtio16 [no=
deref] [usertype] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] <asn:1> * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] <asn:1> *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] <asn:1> *addr =
@@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] <asn:1=
> *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] <asn:1>=
 * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] <asn:1=
> *
   drivers/vhost/vhost.c:753:17: sparse:     got void *

vim +1603 drivers/vhost/vhost.c

feebcaeac79ad86 Jason Wang         2019-05-24  1566  =

feebcaeac79ad86 Jason Wang         2019-05-24  1567  static long vhost_vrin=
g_set_num_addr(struct vhost_dev *d,
feebcaeac79ad86 Jason Wang         2019-05-24  1568  				     struct vhost_=
virtqueue *vq,
feebcaeac79ad86 Jason Wang         2019-05-24  1569  				     unsigned int =
ioctl,
feebcaeac79ad86 Jason Wang         2019-05-24  1570  				     void __user *=
argp)
feebcaeac79ad86 Jason Wang         2019-05-24  1571  {
feebcaeac79ad86 Jason Wang         2019-05-24  1572  	long r;
feebcaeac79ad86 Jason Wang         2019-05-24  1573  =

feebcaeac79ad86 Jason Wang         2019-05-24  1574  	mutex_lock(&vq->mutex=
);
feebcaeac79ad86 Jason Wang         2019-05-24  1575  =

feebcaeac79ad86 Jason Wang         2019-05-24  1576  	switch (ioctl) {
feebcaeac79ad86 Jason Wang         2019-05-24  1577  	case VHOST_SET_VRING_=
NUM:
feebcaeac79ad86 Jason Wang         2019-05-24  1578  		r =3D vhost_vring_se=
t_num(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1579  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1580  	case VHOST_SET_VRING_=
ADDR:
feebcaeac79ad86 Jason Wang         2019-05-24  1581  		r =3D vhost_vring_se=
t_addr(d, vq, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1582  		break;
feebcaeac79ad86 Jason Wang         2019-05-24  1583  	default:
feebcaeac79ad86 Jason Wang         2019-05-24  1584  		BUG();
feebcaeac79ad86 Jason Wang         2019-05-24  1585  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1586  =

feebcaeac79ad86 Jason Wang         2019-05-24  1587  	mutex_unlock(&vq->mut=
ex);
feebcaeac79ad86 Jason Wang         2019-05-24  1588  =

feebcaeac79ad86 Jason Wang         2019-05-24  1589  	return r;
feebcaeac79ad86 Jason Wang         2019-05-24  1590  }
26b36604523f4a6 Sonny Rao          2018-03-14  1591  long vhost_vring_ioctl=
(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1592  {
cecb46f194460d2 Al Viro            2012-08-27  1593  	struct file *eventfp,=
 *filep =3D NULL;
cecb46f194460d2 Al Viro            2012-08-27  1594  	bool pollstart =3D fa=
lse, pollstop =3D false;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1595  	struct eventfd_ctx *c=
tx =3D NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1596  	u32 __user *idxp =3D =
argp;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1597  	struct vhost_virtqueu=
e *vq;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1598  	struct vhost_vring_st=
ate s;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1599  	struct vhost_vring_fi=
le f;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1600  	u32 idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1601  	long r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1602  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14 @1603  	r =3D get_user(idx, i=
dxp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1604  	if (r < 0)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1605  		return r;
0f3d9a17469d71b Krishna Kumar      2010-05-25  1606  	if (idx >=3D d->nvqs)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1607  		return -ENOBUFS;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1608  =

ff002269a4ee9c7 Jason Wang         2018-10-30  1609  	idx =3D array_index_n=
ospec(idx, d->nvqs);
3ab2e420ec1caf4 Asias He           2013-04-27  1610  	vq =3D d->vqs[idx];
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1611  =

feebcaeac79ad86 Jason Wang         2019-05-24  1612  	if (ioctl =3D=3D VHOS=
T_SET_VRING_NUM ||
feebcaeac79ad86 Jason Wang         2019-05-24  1613  	    ioctl =3D=3D VHOS=
T_SET_VRING_ADDR) {
feebcaeac79ad86 Jason Wang         2019-05-24  1614  		return vhost_vring_s=
et_num_addr(d, vq, ioctl, argp);
feebcaeac79ad86 Jason Wang         2019-05-24  1615  	}
feebcaeac79ad86 Jason Wang         2019-05-24  1616  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1617  	mutex_lock(&vq->mutex=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1618  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1619  	switch (ioctl) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1620  	case VHOST_SET_VRING_=
BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1621  		/* Moving base with =
an active backend?
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1622  		 * You don't want to=
 do that. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1623  		if (vq->private_data=
) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1624  			r =3D -EBUSY;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1625  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1626  		}
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1627  		if (copy_from_user(&=
s, argp, sizeof s)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1628  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1629  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1630  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1631  		if (s.num > 0xffff) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1632  			r =3D -EINVAL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1633  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1634  		}
8d65843c44269c2 Jason Wang         2017-07-27  1635  		vq->last_avail_idx =
=3D s.num;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1636  		/* Forget the cached=
 index value. */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1637  		vq->avail_idx =3D vq=
->last_avail_idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1638  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1639  	case VHOST_GET_VRING_=
BASE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1640  		s.index =3D idx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1641  		s.num =3D vq->last_a=
vail_idx;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1642  		if (copy_to_user(arg=
p, &s, sizeof s))
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1643  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1644  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1645  	case VHOST_SET_VRING_=
KICK:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1646  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1647  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1648  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1649  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1650  		eventfp =3D f.fd =3D=
=3D -1 ? NULL : eventfd_fget(f.fd);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1651  		if (IS_ERR(eventfp))=
 {
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1652  			r =3D PTR_ERR(event=
fp);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1653  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1654  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1655  		if (eventfp !=3D vq-=
>kick) {
cecb46f194460d2 Al Viro            2012-08-27  1656  			pollstop =3D (filep=
 =3D vq->kick) !=3D NULL;
cecb46f194460d2 Al Viro            2012-08-27  1657  			pollstart =3D (vq->=
kick =3D eventfp) !=3D NULL;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1658  		} else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1659  			filep =3D eventfp;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1660  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1661  	case VHOST_SET_VRING_=
CALL:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1662  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1663  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1664  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1665  		}
e050c7d93f4adb2 Eric Biggers       2018-01-06  1666  		ctx =3D f.fd =3D=3D =
-1 ? NULL : eventfd_ctx_fdget(f.fd);
e050c7d93f4adb2 Eric Biggers       2018-01-06  1667  		if (IS_ERR(ctx)) {
e050c7d93f4adb2 Eric Biggers       2018-01-06  1668  			r =3D PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1669  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1670  		}
e050c7d93f4adb2 Eric Biggers       2018-01-06  1671  		swap(ctx, vq->call_c=
tx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1672  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1673  	case VHOST_SET_VRING_=
ERR:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1674  		if (copy_from_user(&=
f, argp, sizeof f)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1675  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1676  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1677  		}
09f332a589232f5 Eric Biggers       2018-01-06  1678  		ctx =3D f.fd =3D=3D =
-1 ? NULL : eventfd_ctx_fdget(f.fd);
09f332a589232f5 Eric Biggers       2018-01-06  1679  		if (IS_ERR(ctx)) {
09f332a589232f5 Eric Biggers       2018-01-06  1680  			r =3D PTR_ERR(ctx);
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1681  			break;
535297a6ae4c3b7 Michael S. Tsirkin 2010-03-17  1682  		}
09f332a589232f5 Eric Biggers       2018-01-06  1683  		swap(ctx, vq->error_=
ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1684  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1685  	case VHOST_SET_VRING_=
ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1686  		r =3D vhost_set_vrin=
g_endian(vq, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1687  		break;
2751c9882b94729 Greg Kurz          2015-04-24  1688  	case VHOST_GET_VRING_=
ENDIAN:
2751c9882b94729 Greg Kurz          2015-04-24  1689  		r =3D vhost_get_vrin=
g_endian(vq, idx, argp);
2751c9882b94729 Greg Kurz          2015-04-24  1690  		break;
030881372460654 Jason Wang         2016-03-04  1691  	case VHOST_SET_VRING_=
BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1692  		if (copy_from_user(&=
s, argp, sizeof(s))) {
030881372460654 Jason Wang         2016-03-04  1693  			r =3D -EFAULT;
030881372460654 Jason Wang         2016-03-04  1694  			break;
030881372460654 Jason Wang         2016-03-04  1695  		}
030881372460654 Jason Wang         2016-03-04  1696  		vq->busyloop_timeout=
 =3D s.num;
030881372460654 Jason Wang         2016-03-04  1697  		break;
030881372460654 Jason Wang         2016-03-04  1698  	case VHOST_GET_VRING_=
BUSYLOOP_TIMEOUT:
030881372460654 Jason Wang         2016-03-04  1699  		s.index =3D idx;
030881372460654 Jason Wang         2016-03-04  1700  		s.num =3D vq->busylo=
op_timeout;
030881372460654 Jason Wang         2016-03-04  1701  		if (copy_to_user(arg=
p, &s, sizeof(s)))
030881372460654 Jason Wang         2016-03-04  1702  			r =3D -EFAULT;
030881372460654 Jason Wang         2016-03-04  1703  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1704  	default:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1705  		r =3D -ENOIOCTLCMD;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1706  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1707  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1708  	if (pollstop && vq->h=
andle_kick)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1709  		vhost_poll_stop(&vq-=
>poll);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1710  =

e050c7d93f4adb2 Eric Biggers       2018-01-06  1711  	if (!IS_ERR_OR_NULL(c=
tx))
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1712  		eventfd_ctx_put(ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1713  	if (filep)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1714  		fput(filep);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1715  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1716  	if (pollstart && vq->=
handle_kick)
2b8b328b61c7999 Jason Wang         2013-01-28  1717  		r =3D vhost_poll_sta=
rt(&vq->poll, vq->kick);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1718  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1719  	mutex_unlock(&vq->mut=
ex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1720  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1721  	if (pollstop && vq->h=
andle_kick)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1722  		vhost_poll_flush(&vq=
->poll);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1723  	return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1724  }
6ac1afbf6132df0 Asias He           2013-05-06  1725  EXPORT_SYMBOL_GPL(vhos=
t_vring_ioctl);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1726  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1727  int vhost_init_device_=
iotlb(struct vhost_dev *d, bool enabled)
6b1e6cc7855b09a Jason Wang         2016-06-23  1728  {
6b1e6cc7855b09a Jason Wang         2016-06-23  1729  	struct vhost_umem *ni=
otlb, *oiotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1730  	int i;
6b1e6cc7855b09a Jason Wang         2016-06-23  1731  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1732  	niotlb =3D vhost_umem=
_alloc();
6b1e6cc7855b09a Jason Wang         2016-06-23  1733  	if (!niotlb)
6b1e6cc7855b09a Jason Wang         2016-06-23  1734  		return -ENOMEM;
6b1e6cc7855b09a Jason Wang         2016-06-23  1735  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1736  	oiotlb =3D d->iotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1737  	d->iotlb =3D niotlb;
6b1e6cc7855b09a Jason Wang         2016-06-23  1738  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1739  	for (i =3D 0; i < d->=
nvqs; ++i) {
b13f9c6364373a1 Jason Wang         2018-08-08  1740  		struct vhost_virtque=
ue *vq =3D d->vqs[i];
b13f9c6364373a1 Jason Wang         2018-08-08  1741  =

b13f9c6364373a1 Jason Wang         2018-08-08  1742  		mutex_lock(&vq->mute=
x);
b13f9c6364373a1 Jason Wang         2018-08-08  1743  		vq->iotlb =3D niotlb;
b13f9c6364373a1 Jason Wang         2018-08-08  1744  		__vhost_vq_meta_rese=
t(vq);
b13f9c6364373a1 Jason Wang         2018-08-08  1745  		mutex_unlock(&vq->mu=
tex);
6b1e6cc7855b09a Jason Wang         2016-06-23  1746  	}
6b1e6cc7855b09a Jason Wang         2016-06-23  1747  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1748  	vhost_umem_clean(oiot=
lb);
6b1e6cc7855b09a Jason Wang         2016-06-23  1749  =

6b1e6cc7855b09a Jason Wang         2016-06-23  1750  	return 0;
6b1e6cc7855b09a Jason Wang         2016-06-23  1751  }
6b1e6cc7855b09a Jason Wang         2016-06-23  1752  EXPORT_SYMBOL_GPL(vhos=
t_init_device_iotlb);
6b1e6cc7855b09a Jason Wang         2016-06-23  1753  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1754  /* Caller must have de=
vice mutex */
935cdee7ee15956 Michael S. Tsirkin 2012-12-06  1755  long vhost_dev_ioctl(s=
truct vhost_dev *d, unsigned int ioctl, void __user *argp)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1756  {
d25cc43c6775bff Eric Biggers       2018-01-06  1757  	struct eventfd_ctx *c=
tx;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1758  	u64 p;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1759  	long r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1760  	int i, fd;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1761  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1762  	/* If you are not the=
 owner, you can become one */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1763  	if (ioctl =3D=3D VHOS=
T_SET_OWNER) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1764  		r =3D vhost_dev_set_=
owner(d);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1765  		goto done;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1766  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1767  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1768  	/* You must be the ow=
ner to do anything else */
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1769  	r =3D vhost_dev_check=
_owner(d);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1770  	if (r)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1771  		goto done;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1772  =

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1773  	switch (ioctl) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1774  	case VHOST_SET_MEM_TA=
BLE:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1775  		r =3D vhost_set_memo=
ry(d, argp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1776  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1777  	case VHOST_SET_LOG_BA=
SE:
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1778  		if (copy_from_user(&=
p, argp, sizeof p)) {
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1779  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1780  			break;
7ad9c9d27048547 Takuya Yoshikawa   2010-05-27  1781  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1782  		if ((u64)(unsigned l=
ong)p !=3D p) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1783  			r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1784  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1785  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1786  		for (i =3D 0; i < d-=
>nvqs; ++i) {
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1787  			struct vhost_virtqu=
eue *vq;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1788  			void __user *base =
=3D (void __user *)(unsigned long)p;
3ab2e420ec1caf4 Asias He           2013-04-27  1789  			vq =3D d->vqs[i];
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1790  			mutex_lock(&vq->mut=
ex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1791  			/* If ring is inact=
ive, will check when it's enabled. */
ea16c51433510f7 Michael S. Tsirkin 2014-06-05  1792  			if (vq->private_dat=
a && !vq_log_access_ok(vq, base))
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1793  				r =3D -EFAULT;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1794  			else
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1795  				vq->log_base =3D b=
ase;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1796  			mutex_unlock(&vq->m=
utex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1797  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1798  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1799  	case VHOST_SET_LOG_FD:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14 @1800  		r =3D get_user(fd, (=
int __user *)argp);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1801  		if (r < 0)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1802  			break;
d25cc43c6775bff Eric Biggers       2018-01-06  1803  		ctx =3D fd =3D=3D -1=
 ? NULL : eventfd_ctx_fdget(fd);
d25cc43c6775bff Eric Biggers       2018-01-06  1804  		if (IS_ERR(ctx)) {
d25cc43c6775bff Eric Biggers       2018-01-06  1805  			r =3D PTR_ERR(ctx);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1806  			break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1807  		}
d25cc43c6775bff Eric Biggers       2018-01-06  1808  		swap(ctx, d->log_ctx=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1809  		for (i =3D 0; i < d-=
>nvqs; ++i) {
3ab2e420ec1caf4 Asias He           2013-04-27  1810  			mutex_lock(&d->vqs[=
i]->mutex);
3ab2e420ec1caf4 Asias He           2013-04-27  1811  			d->vqs[i]->log_ctx =
=3D d->log_ctx;
3ab2e420ec1caf4 Asias He           2013-04-27  1812  			mutex_unlock(&d->vq=
s[i]->mutex);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1813  		}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1814  		if (ctx)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1815  			eventfd_ctx_put(ctx=
);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1816  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1817  	default:
935cdee7ee15956 Michael S. Tsirkin 2012-12-06  1818  		r =3D -ENOIOCTLCMD;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1819  		break;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1820  	}
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1821  done:
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1822  	return r;
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1823  }
6ac1afbf6132df0 Asias He           2013-05-06  1824  EXPORT_SYMBOL_GPL(vhos=
t_dev_ioctl);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  1825  =


:::::: The code at line 1603 was first introduced by commit
:::::: 3a4d5c94e959359ece6d6b55045c3f046677f55c vhost_net: a kernel-level v=
irtio server

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7500896673003824992==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
wAWF0L0M23OY1pbi/wIFLo/f/WUBAA==
--===============7500896673003824992==--

