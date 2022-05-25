Content-Type: multipart/mixed; boundary="===============7929737339950516970=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12729/14193] drivers/vhost/vdpa.c:595 vhost_vdpa_unlocked_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Thu, 26 May 2022 00:31:04 +0800
Message-ID: <202205260023.uI6skjJx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7929737339950516970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gautam Dawar <gautam.dawar@xilinx.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8cb8311e95e3bb58bd84d6350365f14a718faa6d
commit: 87f4c217413a256cb5f9fb6d1dd6e11fe96506ae [12729/14193] vhost-vdpa: =
introduce uAPI to get the number of virtqueue groups
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: microblaze-randconfig-m031-20220524 (https://download.01.org/0day-c=
i/archive/20220526/202205260023.uI6skjJx-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vhost/vdpa.c:595 vhost_vdpa_unlocked_ioctl() warn: maybe return -EF=
AULT instead of the bytes remaining?

Old smatch warnings:
drivers/vhost/vdpa.c:837 vhost_vdpa_pa_map() warn: should '(last_pfn - map_=
pfn + 1) << 12' be a 64 bit type?
drivers/vhost/vdpa.c:839 vhost_vdpa_pa_map() warn: should 'map_pfn << 12' b=
e a 64 bit type?
drivers/vhost/vdpa.c:868 vhost_vdpa_pa_map() warn: should '(last_pfn - map_=
pfn + 1) << 12' be a 64 bit type?
drivers/vhost/vdpa.c:869 vhost_vdpa_pa_map() warn: should 'map_pfn << 12' b=
e a 64 bit type?
drivers/vhost/vdpa.c:1080 vhost_vdpa_open() warn: missing error code 'r'

vim +595 drivers/vhost/vdpa.c

4c8cf31885f69e Tiwei Bie     2020-03-26  515  =

4c8cf31885f69e Tiwei Bie     2020-03-26  516  static long vhost_vdpa_unlock=
ed_ioctl(struct file *filep,
4c8cf31885f69e Tiwei Bie     2020-03-26  517  				      unsigned int cmd, u=
nsigned long arg)
4c8cf31885f69e Tiwei Bie     2020-03-26  518  {
4c8cf31885f69e Tiwei Bie     2020-03-26  519  	struct vhost_vdpa *v =3D fil=
ep->private_data;
4c8cf31885f69e Tiwei Bie     2020-03-26  520  	struct vhost_dev *d =3D &v->=
vdev;
4c8cf31885f69e Tiwei Bie     2020-03-26  521  	void __user *argp =3D (void =
__user *)arg;
a127c5bbb6a8ee Jason Wang    2020-09-07  522  	u64 __user *featurep =3D arg=
p;
a127c5bbb6a8ee Jason Wang    2020-09-07  523  	u64 features;
7922460e33c81f Dan Carpenter 2020-10-23  524  	long r =3D 0;
4c8cf31885f69e Tiwei Bie     2020-03-26  525  =

a127c5bbb6a8ee Jason Wang    2020-09-07  526  	if (cmd =3D=3D VHOST_SET_BAC=
KEND_FEATURES) {
7922460e33c81f Dan Carpenter 2020-10-23  527  		if (copy_from_user(&feature=
s, featurep, sizeof(features)))
7922460e33c81f Dan Carpenter 2020-10-23  528  			return -EFAULT;
a127c5bbb6a8ee Jason Wang    2020-09-07  529  		if (features & ~VHOST_VDPA_=
BACKEND_FEATURES)
a127c5bbb6a8ee Jason Wang    2020-09-07  530  			return -EOPNOTSUPP;
a127c5bbb6a8ee Jason Wang    2020-09-07  531  		vhost_set_backend_features(=
&v->vdev, features);
a127c5bbb6a8ee Jason Wang    2020-09-07  532  		return 0;
a127c5bbb6a8ee Jason Wang    2020-09-07  533  	}
a127c5bbb6a8ee Jason Wang    2020-09-07  534  =

4c8cf31885f69e Tiwei Bie     2020-03-26  535  	mutex_lock(&d->mutex);
4c8cf31885f69e Tiwei Bie     2020-03-26  536  =

4c8cf31885f69e Tiwei Bie     2020-03-26  537  	switch (cmd) {
4c8cf31885f69e Tiwei Bie     2020-03-26  538  	case VHOST_VDPA_GET_DEVICE_I=
D:
4c8cf31885f69e Tiwei Bie     2020-03-26  539  		r =3D vhost_vdpa_get_device=
_id(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  540  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  541  	case VHOST_VDPA_GET_STATUS:
4c8cf31885f69e Tiwei Bie     2020-03-26  542  		r =3D vhost_vdpa_get_status=
(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  543  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  544  	case VHOST_VDPA_SET_STATUS:
4c8cf31885f69e Tiwei Bie     2020-03-26  545  		r =3D vhost_vdpa_set_status=
(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  546  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  547  	case VHOST_VDPA_GET_CONFIG:
4c8cf31885f69e Tiwei Bie     2020-03-26  548  		r =3D vhost_vdpa_get_config=
(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  549  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  550  	case VHOST_VDPA_SET_CONFIG:
4c8cf31885f69e Tiwei Bie     2020-03-26  551  		r =3D vhost_vdpa_set_config=
(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  552  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  553  	case VHOST_GET_FEATURES:
4c8cf31885f69e Tiwei Bie     2020-03-26  554  		r =3D vhost_vdpa_get_featur=
es(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  555  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  556  	case VHOST_SET_FEATURES:
4c8cf31885f69e Tiwei Bie     2020-03-26  557  		r =3D vhost_vdpa_set_featur=
es(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  558  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  559  	case VHOST_VDPA_GET_VRING_NU=
M:
4c8cf31885f69e Tiwei Bie     2020-03-26  560  		r =3D vhost_vdpa_get_vring_=
num(v, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  561  		break;
87f4c217413a25 Gautam Dawar  2022-03-30  562  	case VHOST_VDPA_GET_GROUP_NU=
M:
87f4c217413a25 Gautam Dawar  2022-03-30  563  		r =3D copy_to_user(argp, &v=
->vdpa->ngroups,
87f4c217413a25 Gautam Dawar  2022-03-30  564  				 sizeof(v->vdpa->ngroups)=
);
87f4c217413a25 Gautam Dawar  2022-03-30  565  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  566  	case VHOST_SET_LOG_BASE:
4c8cf31885f69e Tiwei Bie     2020-03-26  567  	case VHOST_SET_LOG_FD:
4c8cf31885f69e Tiwei Bie     2020-03-26  568  		r =3D -ENOIOCTLCMD;
4c8cf31885f69e Tiwei Bie     2020-03-26  569  		break;
776f395004d829 Zhu Lingshan  2020-06-05  570  	case VHOST_VDPA_SET_CONFIG_C=
ALL:
776f395004d829 Zhu Lingshan  2020-06-05  571  		r =3D vhost_vdpa_set_config=
_call(v, argp);
776f395004d829 Zhu Lingshan  2020-06-05  572  		break;
a127c5bbb6a8ee Jason Wang    2020-09-07  573  	case VHOST_GET_BACKEND_FEATU=
RES:
a127c5bbb6a8ee Jason Wang    2020-09-07  574  		features =3D VHOST_VDPA_BAC=
KEND_FEATURES;
7922460e33c81f Dan Carpenter 2020-10-23  575  		if (copy_to_user(featurep, =
&features, sizeof(features)))
7922460e33c81f Dan Carpenter 2020-10-23  576  			r =3D -EFAULT;
a127c5bbb6a8ee Jason Wang    2020-09-07  577  		break;
1b48dc03e575a8 Jason Wang    2020-10-23  578  	case VHOST_VDPA_GET_IOVA_RAN=
GE:
1b48dc03e575a8 Jason Wang    2020-10-23  579  		r =3D vhost_vdpa_get_iova_r=
ange(v, argp);
1b48dc03e575a8 Jason Wang    2020-10-23  580  		break;
a61280ddddaa45 Longpeng      2022-03-15  581  	case VHOST_VDPA_GET_CONFIG_S=
IZE:
a61280ddddaa45 Longpeng      2022-03-15  582  		r =3D vhost_vdpa_get_config=
_size(v, argp);
a61280ddddaa45 Longpeng      2022-03-15  583  		break;
b04d910af330b5 Longpeng      2022-03-15  584  	case VHOST_VDPA_GET_VQS_COUN=
T:
b04d910af330b5 Longpeng      2022-03-15  585  		r =3D vhost_vdpa_get_vqs_co=
unt(v, argp);
b04d910af330b5 Longpeng      2022-03-15  586  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  587  	default:
4c8cf31885f69e Tiwei Bie     2020-03-26  588  		r =3D vhost_dev_ioctl(&v->v=
dev, cmd, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  589  		if (r =3D=3D -ENOIOCTLCMD)
4c8cf31885f69e Tiwei Bie     2020-03-26  590  			r =3D vhost_vdpa_vring_ioc=
tl(v, cmd, argp);
4c8cf31885f69e Tiwei Bie     2020-03-26  591  		break;
4c8cf31885f69e Tiwei Bie     2020-03-26  592  	}
4c8cf31885f69e Tiwei Bie     2020-03-26  593  =

4c8cf31885f69e Tiwei Bie     2020-03-26  594  	mutex_unlock(&d->mutex);
4c8cf31885f69e Tiwei Bie     2020-03-26 @595  	return r;
4c8cf31885f69e Tiwei Bie     2020-03-26  596  }
4c8cf31885f69e Tiwei Bie     2020-03-26  597  =


:::::: The code at line 595 was first introduced by commit
:::::: 4c8cf31885f69e86be0b5b9e6677a26797365e1d vhost: introduce vDPA-based=
 backend

:::::: TO: Tiwei Bie <tiwei.bie@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7929737339950516970==--

