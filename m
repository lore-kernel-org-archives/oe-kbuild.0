Content-Type: multipart/mixed; boundary="===============4610041542877316820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/vdpa.c:296 vdpa_mgmtdev_fill() warn: should '(((1))) << (mdev->id_table[i]->device)' be a 64 bit type?
Date: Thu, 25 Nov 2021 03:58:14 +0800
Message-ID: <202111250317.VUsGtdox-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4610041542877316820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Parav Pandit <parav@nvidia.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eli Cohen <elic@nvidia.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d9f4cf36721aba199975a9be7863a3ff5cd4b59
commit: 33b347503f014ebf76257327cbc7001c6b721956 vdpa: Define vdpa mgmt dev=
ice, ops and a netlink interface
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-m021-20211118 (https://download.01.org/0day-ci/arch=
ive/20211125/202111250317.VUsGtdox-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vdpa/vdpa.c:296 vdpa_mgmtdev_fill() warn: should '(((1))) << (mdev-=
>id_table[i]->device)' be a 64 bit type?
drivers/vdpa/vdpa.c:329 vdpa_nl_cmd_mgmtdev_get_doit() warn: passing a vali=
d pointer to 'PTR_ERR'

vim +296 drivers/vdpa/vdpa.c

33b347503f014eb Parav Pandit 2021-01-05  279  =

33b347503f014eb Parav Pandit 2021-01-05  280  static int vdpa_mgmtdev_fill(=
const struct vdpa_mgmt_dev *mdev, struct sk_buff *msg,
33b347503f014eb Parav Pandit 2021-01-05  281  			     u32 portid, u32 seq, =
int flags)
33b347503f014eb Parav Pandit 2021-01-05  282  {
33b347503f014eb Parav Pandit 2021-01-05  283  	u64 supported_classes =3D 0;
33b347503f014eb Parav Pandit 2021-01-05  284  	void *hdr;
33b347503f014eb Parav Pandit 2021-01-05  285  	int i =3D 0;
33b347503f014eb Parav Pandit 2021-01-05  286  	int err;
33b347503f014eb Parav Pandit 2021-01-05  287  =

33b347503f014eb Parav Pandit 2021-01-05  288  	hdr =3D genlmsg_put(msg, por=
tid, seq, &vdpa_nl_family, flags, VDPA_CMD_MGMTDEV_NEW);
33b347503f014eb Parav Pandit 2021-01-05  289  	if (!hdr)
33b347503f014eb Parav Pandit 2021-01-05  290  		return -EMSGSIZE;
33b347503f014eb Parav Pandit 2021-01-05  291  	err =3D vdpa_nl_mgmtdev_hand=
le_fill(msg, mdev);
33b347503f014eb Parav Pandit 2021-01-05  292  	if (err)
33b347503f014eb Parav Pandit 2021-01-05  293  		goto msg_err;
33b347503f014eb Parav Pandit 2021-01-05  294  =

33b347503f014eb Parav Pandit 2021-01-05  295  	while (mdev->id_table[i].dev=
ice) {
33b347503f014eb Parav Pandit 2021-01-05 @296  		supported_classes |=3D BIT(=
mdev->id_table[i].device);
33b347503f014eb Parav Pandit 2021-01-05  297  		i++;
33b347503f014eb Parav Pandit 2021-01-05  298  	}
33b347503f014eb Parav Pandit 2021-01-05  299  =

33b347503f014eb Parav Pandit 2021-01-05  300  	if (nla_put_u64_64bit(msg, V=
DPA_ATTR_MGMTDEV_SUPPORTED_CLASSES,
33b347503f014eb Parav Pandit 2021-01-05  301  			      supported_classes, V=
DPA_ATTR_UNSPEC)) {
33b347503f014eb Parav Pandit 2021-01-05  302  		err =3D -EMSGSIZE;
33b347503f014eb Parav Pandit 2021-01-05  303  		goto msg_err;
33b347503f014eb Parav Pandit 2021-01-05  304  	}
33b347503f014eb Parav Pandit 2021-01-05  305  =

33b347503f014eb Parav Pandit 2021-01-05  306  	genlmsg_end(msg, hdr);
33b347503f014eb Parav Pandit 2021-01-05  307  	return 0;
33b347503f014eb Parav Pandit 2021-01-05  308  =

33b347503f014eb Parav Pandit 2021-01-05  309  msg_err:
33b347503f014eb Parav Pandit 2021-01-05  310  	genlmsg_cancel(msg, hdr);
33b347503f014eb Parav Pandit 2021-01-05  311  	return err;
33b347503f014eb Parav Pandit 2021-01-05  312  }
33b347503f014eb Parav Pandit 2021-01-05  313  =

33b347503f014eb Parav Pandit 2021-01-05  314  static int vdpa_nl_cmd_mgmtde=
v_get_doit(struct sk_buff *skb, struct genl_info *info)
33b347503f014eb Parav Pandit 2021-01-05  315  {
33b347503f014eb Parav Pandit 2021-01-05  316  	struct vdpa_mgmt_dev *mdev;
33b347503f014eb Parav Pandit 2021-01-05  317  	struct sk_buff *msg;
33b347503f014eb Parav Pandit 2021-01-05  318  	int err;
33b347503f014eb Parav Pandit 2021-01-05  319  =

33b347503f014eb Parav Pandit 2021-01-05  320  	msg =3D nlmsg_new(NLMSG_DEFA=
ULT_SIZE, GFP_KERNEL);
33b347503f014eb Parav Pandit 2021-01-05  321  	if (!msg)
33b347503f014eb Parav Pandit 2021-01-05  322  		return -ENOMEM;
33b347503f014eb Parav Pandit 2021-01-05  323  =

33b347503f014eb Parav Pandit 2021-01-05  324  	mutex_lock(&vdpa_dev_mutex);
33b347503f014eb Parav Pandit 2021-01-05  325  	mdev =3D vdpa_mgmtdev_get_fr=
om_attr(info->attrs);
33b347503f014eb Parav Pandit 2021-01-05  326  	if (IS_ERR(mdev)) {
33b347503f014eb Parav Pandit 2021-01-05  327  		mutex_unlock(&vdpa_dev_mute=
x);
33b347503f014eb Parav Pandit 2021-01-05  328  		NL_SET_ERR_MSG_MOD(info->ex=
tack, "Fail to find the specified mgmt device");
33b347503f014eb Parav Pandit 2021-01-05 @329  		err =3D PTR_ERR(mdev);
33b347503f014eb Parav Pandit 2021-01-05  330  		goto out;
33b347503f014eb Parav Pandit 2021-01-05  331  	}
33b347503f014eb Parav Pandit 2021-01-05  332  =

33b347503f014eb Parav Pandit 2021-01-05  333  	err =3D vdpa_mgmtdev_fill(md=
ev, msg, info->snd_portid, info->snd_seq, 0);
33b347503f014eb Parav Pandit 2021-01-05  334  	mutex_unlock(&vdpa_dev_mutex=
);
33b347503f014eb Parav Pandit 2021-01-05  335  	if (err)
33b347503f014eb Parav Pandit 2021-01-05  336  		goto out;
33b347503f014eb Parav Pandit 2021-01-05  337  	err =3D genlmsg_reply(msg, i=
nfo);
33b347503f014eb Parav Pandit 2021-01-05  338  	return err;
33b347503f014eb Parav Pandit 2021-01-05  339  =

33b347503f014eb Parav Pandit 2021-01-05  340  out:
33b347503f014eb Parav Pandit 2021-01-05  341  	nlmsg_free(msg);
33b347503f014eb Parav Pandit 2021-01-05  342  	return err;
33b347503f014eb Parav Pandit 2021-01-05  343  }
33b347503f014eb Parav Pandit 2021-01-05  344  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4610041542877316820==--

