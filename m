Content-Type: multipart/mixed; boundary="===============1212519516247676932=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/v4l2-core/v4l2-ctrls-core.c:944 v4l2_ctrl_handler_init_class() warn: Please consider using kvcalloc instead
Date: Thu, 24 Mar 2022 12:41:53 +0800
Message-ID: <202203241203.MLZXJZEd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1212519516247676932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d51b1b33c51d147b757f042b4d336603b699f362
commit: 71c689dc2e732d4cb190aaf0edea73116b1611bd media: v4l2-ctrls: split u=
p into four source files
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-m031-20220323 (https://download.01.org/0day-ci/archi=
ve/20220324/202203241203.MLZXJZEd-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-core.c:944 v4l2_ctrl_handler_init_class(=
) warn: Please consider using kvcalloc instead

vim +944 drivers/media/v4l2-core/v4l2-ctrls-core.c

71c689dc2e732d4 Hans Verkuil 2021-04-27  932  =

71c689dc2e732d4 Hans Verkuil 2021-04-27  933  /* Initialize the handler */
71c689dc2e732d4 Hans Verkuil 2021-04-27  934  int v4l2_ctrl_handler_init_cl=
ass(struct v4l2_ctrl_handler *hdl,
71c689dc2e732d4 Hans Verkuil 2021-04-27  935  				 unsigned nr_of_controls_=
hint,
71c689dc2e732d4 Hans Verkuil 2021-04-27  936  				 struct lock_class_key *k=
ey, const char *name)
71c689dc2e732d4 Hans Verkuil 2021-04-27  937  {
71c689dc2e732d4 Hans Verkuil 2021-04-27  938  	mutex_init(&hdl->_lock);
71c689dc2e732d4 Hans Verkuil 2021-04-27  939  	hdl->lock =3D &hdl->_lock;
71c689dc2e732d4 Hans Verkuil 2021-04-27  940  	lockdep_set_class_and_name(h=
dl->lock, key, name);
71c689dc2e732d4 Hans Verkuil 2021-04-27  941  	INIT_LIST_HEAD(&hdl->ctrls);
71c689dc2e732d4 Hans Verkuil 2021-04-27  942  	INIT_LIST_HEAD(&hdl->ctrl_re=
fs);
71c689dc2e732d4 Hans Verkuil 2021-04-27  943  	hdl->nr_of_buckets =3D 1 + n=
r_of_controls_hint / 8;
71c689dc2e732d4 Hans Verkuil 2021-04-27 @944  	hdl->buckets =3D kvmalloc_ar=
ray(hdl->nr_of_buckets,
71c689dc2e732d4 Hans Verkuil 2021-04-27  945  				      sizeof(hdl->buckets=
[0]),
71c689dc2e732d4 Hans Verkuil 2021-04-27  946  				      GFP_KERNEL | __GFP_=
ZERO);
71c689dc2e732d4 Hans Verkuil 2021-04-27  947  	hdl->error =3D hdl->buckets =
? 0 : -ENOMEM;
71c689dc2e732d4 Hans Verkuil 2021-04-27  948  	v4l2_ctrl_handler_init_reque=
st(hdl);
71c689dc2e732d4 Hans Verkuil 2021-04-27  949  	return hdl->error;
71c689dc2e732d4 Hans Verkuil 2021-04-27  950  }
71c689dc2e732d4 Hans Verkuil 2021-04-27  951  EXPORT_SYMBOL(v4l2_ctrl_handl=
er_init_class);
71c689dc2e732d4 Hans Verkuil 2021-04-27  952  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1212519516247676932==--

