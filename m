Content-Type: multipart/mixed; boundary="===============1500555640149918545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 16/17] media: uvcvideo: Return -EACCES to inactive controls
Date: Thu, 18 Mar 2021 06:30:47 +0800
Message-ID: <202103180644.V83Quz3Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1500555640149918545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210317164511.39967-17-ribalda@chromium.org>
References: <20210317164511.39967-17-ribalda@chromium.org>
TO: Ricardo Ribalda <ribalda@chromium.org>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
TO: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
TO: linux-kernel(a)vger.kernel.org
TO: tfiga(a)chromium.org
CC: Ricardo Ribalda <ribalda@chromium.org>

Hi Ricardo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linuxtv-media/master]
[also build test WARNING on v5.12-rc3 next-20210317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ricardo-Ribalda/uvcvideo-F=
ix-v4l2-compliance-errors/20210318-004822
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: powerpc64le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/usb/uvc/uvc_ctrl.c:1119:0: warning: syntax error [syntaxEr=
ror]
   =

   ^

vim +1119 drivers/media/usb/uvc/uvc_ctrl.c

194a38e83ffe831 Ricardo Ribalda 2021-03-17  1073  =

194a38e83ffe831 Ricardo Ribalda 2021-03-17  1074  int uvc_ctrl_is_accesible=
(struct uvc_video_chain *chain, u32 v4l2_id,
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1075  			  unsigned long ioctl)
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1076  {
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1077  	struct uvc_control_mappi=
ng *mapping;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1078  	struct uvc_control *ctrl;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1079  	bool read, try;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1080  =

194a38e83ffe831 Ricardo Ribalda 2021-03-17  1081  	switch (ioctl) {
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1082  	case VIDIOC_G_EXT_CTRLS:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1083  		read =3D true;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1084  		try =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1085  		break;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1086  	case VIDIOC_S_EXT_CTRLS:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1087  		read =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1088  		try =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1089  		break;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1090  	case VIDIOC_TRY_EXT_CTRL=
S:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1091  		read =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1092  		try =3D true;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1093  		break;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1094  	case VIDIOC_G_CTRL:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1095  		read =3D true;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1096  		try =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1097  		break;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1098  	case VIDIOC_S_CTRL:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1099  		read =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1100  		try =3D false;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1101  		break;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1102  	default:
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1103  		return -EINVAL;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1104  	}
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1105  =

9634d6352e2fedf Ricardo Ribalda 2021-03-17  1106  	if (__uvc_query_v4l2_cla=
ss(chain, v4l2_id, 0) >=3D 0)
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1107  		return -EACCES;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1108  =

9634d6352e2fedf Ricardo Ribalda 2021-03-17  1109  	ctrl =3D uvc_find_contro=
l(chain, v4l2_id, &mapping);
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1110  	if (!ctrl)
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1111  		return -EINVAL;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1112  =

9634d6352e2fedf Ricardo Ribalda 2021-03-17  1113  	if (!(ctrl->info.flags &=
 UVC_CTRL_FLAG_GET_CUR) && read)
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1114  		return -EACCES;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1115  =

9634d6352e2fedf Ricardo Ribalda 2021-03-17  1116  	if (!(ctrl->info.flags &=
 UVC_CTRL_FLAG_SET_CUR) && !read)
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1117  		return -EACCES;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1118  =

194a38e83ffe831 Ricardo Ribalda 2021-03-17 @1119  	if (!read && !try && uvc=
_ctrl_is_inactive(chain, ctrl, mapping))
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1120  		return -EACCES;
194a38e83ffe831 Ricardo Ribalda 2021-03-17  1121  =

9634d6352e2fedf Ricardo Ribalda 2021-03-17  1122  	return 0;
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1123  }
9634d6352e2fedf Ricardo Ribalda 2021-03-17  1124  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1500555640149918545==--

