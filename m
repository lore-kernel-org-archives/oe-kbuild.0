Content-Type: multipart/mixed; boundary="===============8156832074859623981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mst-vhost:vhost 26/43] drivers/vhost/vdpa.c:1003:3-9: preceding lock on line 991
Date: Fri, 20 May 2022 17:35:29 +0800
Message-ID: <202205201721.rGqusahl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8156832074859623981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: kvm(a)vger.kernel.org
CC: virtualization(a)lists.linux-foundation.org
CC: netdev(a)vger.kernel.org
TO: Gautam Dawar <gautam.dawar@xilinx.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vhost
head:   73211bf1bc3ac0a3c544225e270401c1fe5d395d
commit: a1468175bb17ca5e477147de5d886e7a22d93527 [26/43] vhost-vdpa: suppor=
t ASID based IOTLB API
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20220520/=
202205201721.rGqusahl-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/vhost/vdpa.c:1003:3-9: preceding lock on line 991
   drivers/vhost/vdpa.c:1016:2-8: preceding lock on line 991

vim +1003 drivers/vhost/vdpa.c

4c8cf31885f69e Tiwei Bie    2020-03-26   980  =

0f05062453fb51 Gautam Dawar 2022-03-30   981  static int vhost_vdpa_process=
_iotlb_msg(struct vhost_dev *dev, u32 asid,
4c8cf31885f69e Tiwei Bie    2020-03-26   982  					struct vhost_iotlb_msg *=
msg)
4c8cf31885f69e Tiwei Bie    2020-03-26   983  {
4c8cf31885f69e Tiwei Bie    2020-03-26   984  	struct vhost_vdpa *v =3D con=
tainer_of(dev, struct vhost_vdpa, vdev);
25abc060d28213 Jason Wang   2020-08-04   985  	struct vdpa_device *vdpa =3D=
 v->vdpa;
25abc060d28213 Jason Wang   2020-08-04   986  	const struct vdpa_config_ops=
 *ops =3D vdpa->config;
a1468175bb17ca Gautam Dawar 2022-03-30   987  	struct vhost_iotlb *iotlb =
=3D NULL;
a1468175bb17ca Gautam Dawar 2022-03-30   988  	struct vhost_vdpa_as *as =3D=
 NULL;
4c8cf31885f69e Tiwei Bie    2020-03-26   989  	int r =3D 0;
4c8cf31885f69e Tiwei Bie    2020-03-26   990  =

a9d064524fc3cf Xie Yongji   2021-04-12  @991  	mutex_lock(&dev->mutex);
a9d064524fc3cf Xie Yongji   2021-04-12   992  =

4c8cf31885f69e Tiwei Bie    2020-03-26   993  	r =3D vhost_dev_check_owner(=
dev);
4c8cf31885f69e Tiwei Bie    2020-03-26   994  	if (r)
a9d064524fc3cf Xie Yongji   2021-04-12   995  		goto unlock;
4c8cf31885f69e Tiwei Bie    2020-03-26   996  =

a1468175bb17ca Gautam Dawar 2022-03-30   997  	if (msg->type =3D=3D VHOST_I=
OTLB_UPDATE ||
a1468175bb17ca Gautam Dawar 2022-03-30   998  	    msg->type =3D=3D VHOST_I=
OTLB_BATCH_BEGIN) {
a1468175bb17ca Gautam Dawar 2022-03-30   999  		as =3D vhost_vdpa_find_allo=
c_as(v, asid);
a1468175bb17ca Gautam Dawar 2022-03-30  1000  		if (!as) {
a1468175bb17ca Gautam Dawar 2022-03-30  1001  			dev_err(&v->dev, "can't fi=
nd and alloc asid %d\n",
a1468175bb17ca Gautam Dawar 2022-03-30  1002  				asid);
a1468175bb17ca Gautam Dawar 2022-03-30 @1003  			return -EINVAL;
a1468175bb17ca Gautam Dawar 2022-03-30  1004  		}
a1468175bb17ca Gautam Dawar 2022-03-30  1005  		iotlb =3D &as->iotlb;
a1468175bb17ca Gautam Dawar 2022-03-30  1006  	} else
a1468175bb17ca Gautam Dawar 2022-03-30  1007  		iotlb =3D asid_to_iotlb(v, =
asid);
a1468175bb17ca Gautam Dawar 2022-03-30  1008  =

a1468175bb17ca Gautam Dawar 2022-03-30  1009  	if ((v->in_batch && v->batch=
_asid !=3D asid) || !iotlb) {
a1468175bb17ca Gautam Dawar 2022-03-30  1010  		if (v->in_batch && v->batch=
_asid !=3D asid) {
a1468175bb17ca Gautam Dawar 2022-03-30  1011  			dev_info(&v->dev, "batch i=
d %d asid %d\n",
a1468175bb17ca Gautam Dawar 2022-03-30  1012  				 v->batch_asid, asid);
a1468175bb17ca Gautam Dawar 2022-03-30  1013  		}
a1468175bb17ca Gautam Dawar 2022-03-30  1014  		if (!iotlb)
a1468175bb17ca Gautam Dawar 2022-03-30  1015  			dev_err(&v->dev, "no iotlb=
 for asid %d\n", asid);
a1468175bb17ca Gautam Dawar 2022-03-30  1016  		return -EINVAL;
a1468175bb17ca Gautam Dawar 2022-03-30  1017  	}
a1468175bb17ca Gautam Dawar 2022-03-30  1018  =

4c8cf31885f69e Tiwei Bie    2020-03-26  1019  	switch (msg->type) {
4c8cf31885f69e Tiwei Bie    2020-03-26  1020  	case VHOST_IOTLB_UPDATE:
3111cb7283065a Gautam Dawar 2022-03-30  1021  		r =3D vhost_vdpa_process_io=
tlb_update(v, iotlb, msg);
4c8cf31885f69e Tiwei Bie    2020-03-26  1022  		break;
4c8cf31885f69e Tiwei Bie    2020-03-26  1023  	case VHOST_IOTLB_INVALIDATE:
3111cb7283065a Gautam Dawar 2022-03-30  1024  		vhost_vdpa_unmap(v, iotlb, =
msg->iova, msg->size);
4c8cf31885f69e Tiwei Bie    2020-03-26  1025  		break;
25abc060d28213 Jason Wang   2020-08-04  1026  	case VHOST_IOTLB_BATCH_BEGIN:
a1468175bb17ca Gautam Dawar 2022-03-30  1027  		v->batch_asid =3D asid;
25abc060d28213 Jason Wang   2020-08-04  1028  		v->in_batch =3D true;
25abc060d28213 Jason Wang   2020-08-04  1029  		break;
25abc060d28213 Jason Wang   2020-08-04  1030  	case VHOST_IOTLB_BATCH_END:
25abc060d28213 Jason Wang   2020-08-04  1031  		if (v->in_batch && ops->set=
_map)
a1468175bb17ca Gautam Dawar 2022-03-30  1032  			ops->set_map(vdpa, asid, i=
otlb);
25abc060d28213 Jason Wang   2020-08-04  1033  		v->in_batch =3D false;
a1468175bb17ca Gautam Dawar 2022-03-30  1034  		if (!iotlb->nmaps)
a1468175bb17ca Gautam Dawar 2022-03-30  1035  			vhost_vdpa_remove_as(v, as=
id);
25abc060d28213 Jason Wang   2020-08-04  1036  		break;
4c8cf31885f69e Tiwei Bie    2020-03-26  1037  	default:
4c8cf31885f69e Tiwei Bie    2020-03-26  1038  		r =3D -EINVAL;
4c8cf31885f69e Tiwei Bie    2020-03-26  1039  		break;
4c8cf31885f69e Tiwei Bie    2020-03-26  1040  	}
a9d064524fc3cf Xie Yongji   2021-04-12  1041  unlock:
a9d064524fc3cf Xie Yongji   2021-04-12  1042  	mutex_unlock(&dev->mutex);
4c8cf31885f69e Tiwei Bie    2020-03-26  1043  =

4c8cf31885f69e Tiwei Bie    2020-03-26  1044  	return r;
4c8cf31885f69e Tiwei Bie    2020-03-26  1045  }
4c8cf31885f69e Tiwei Bie    2020-03-26  1046  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8156832074859623981==--

