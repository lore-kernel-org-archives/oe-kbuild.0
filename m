Content-Type: multipart/mixed; boundary="===============0892978895420754843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 6/7] usb: gadget: uvc: add VIDIOC function
Date: Sun, 09 Jan 2022 02:23:26 +0800
Message-ID: <202201090204.9HpxUP5B-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0892978895420754843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105115527.3592860-7-m.grzeschik@pengutronix.de>
References: <20220105115527.3592860-7-m.grzeschik@pengutronix.de>
TO: Michael Grzeschik <m.grzeschik@pengutronix.de>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on usb/usb-testing peter-chen-usb/for-usb-next v5.=
16-rc8 next-20220107]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Grzeschik/usb-gadg=
et-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20220105-195807
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20220107 (https://download.01.org/0day-ci/arch=
ive/20220109/202201090204.9HpxUP5B-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/gadget/function/f_uvc.c:983 uvc_alloc() warn: inconsistent retu=
rns '&opts->lock'.

vim +983 drivers/usb/gadget/function/f_uvc.c

6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  909  =

4a6698b80cfe36 Fengguang Wu          2014-09-16  910  static struct usb_fun=
ction *uvc_alloc(struct usb_function_instance *fi)
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  911  {
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  912  	struct uvc_device *u=
vc;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  913  	struct f_uvc_opts *o=
pts;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  914  	struct uvc_descripto=
r_header **strm_cls;
90866d89b13da2 Michael Grzeschik     2022-01-05  915  	struct config_item *=
streaming, *header, *h;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  916  =

6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  917  	uvc =3D kzalloc(size=
of(*uvc), GFP_KERNEL);
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  918  	if (uvc =3D=3D NULL)
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  919  		return ERR_PTR(-ENO=
MEM);
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  920  =

d8e96c4bf6e3cd Hans Verkuil          2015-02-17  921  	mutex_init(&uvc->vid=
eo.mutex);
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  922  	uvc->state =3D UVC_S=
TATE_DISCONNECTED;
bbea6de1bd12dd Andrzej Pietrasiewicz 2014-12-10  923  	opts =3D fi_to_f_uvc=
_opts(fi);
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  924  =

46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  925  	mutex_lock(&opts->lo=
ck);
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  926  	if (opts->uvc_fs_str=
eaming_cls) {
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  927  		strm_cls =3D opts->=
uvc_fs_streaming_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  928  		opts->fs_streaming =
=3D
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  929  			(const struct uvc_=
descriptor_header * const *)strm_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  930  	}
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  931  	if (opts->uvc_hs_str=
eaming_cls) {
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  932  		strm_cls =3D opts->=
uvc_hs_streaming_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  933  		opts->hs_streaming =
=3D
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  934  			(const struct uvc_=
descriptor_header * const *)strm_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  935  	}
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  936  	if (opts->uvc_ss_str=
eaming_cls) {
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  937  		strm_cls =3D opts->=
uvc_ss_streaming_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  938  		opts->ss_streaming =
=3D
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  939  			(const struct uvc_=
descriptor_header * const *)strm_cls;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  940  	}
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  941  =

6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  942  	uvc->desc.fs_control=
 =3D opts->fs_control;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  943  	uvc->desc.ss_control=
 =3D opts->ss_control;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  944  	uvc->desc.fs_streami=
ng =3D opts->fs_streaming;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  945  	uvc->desc.hs_streami=
ng =3D opts->hs_streaming;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  946  	uvc->desc.ss_streami=
ng =3D opts->ss_streaming;
90866d89b13da2 Michael Grzeschik     2022-01-05  947  =

90866d89b13da2 Michael Grzeschik     2022-01-05  948  	streaming =3D config=
_group_find_item(&opts->func_inst.group, "streaming");
90866d89b13da2 Michael Grzeschik     2022-01-05  949  	if (!streaming) {
90866d89b13da2 Michael Grzeschik     2022-01-05  950  		config_item_put(str=
eaming);
90866d89b13da2 Michael Grzeschik     2022-01-05  951  		return ERR_PTR(-ENO=
MEM);
90866d89b13da2 Michael Grzeschik     2022-01-05  952  	}
90866d89b13da2 Michael Grzeschik     2022-01-05  953  	header =3D config_gr=
oup_find_item(to_config_group(streaming), "header");
90866d89b13da2 Michael Grzeschik     2022-01-05  954  	config_item_put(stre=
aming);
90866d89b13da2 Michael Grzeschik     2022-01-05  955  	if (!header) {
90866d89b13da2 Michael Grzeschik     2022-01-05  956  		config_item_put(hea=
der);
90866d89b13da2 Michael Grzeschik     2022-01-05  957  		return ERR_PTR(-ENO=
MEM);
90866d89b13da2 Michael Grzeschik     2022-01-05  958  	}
90866d89b13da2 Michael Grzeschik     2022-01-05  959  	h =3D config_group_f=
ind_item(to_config_group(header), "h");
90866d89b13da2 Michael Grzeschik     2022-01-05  960  	config_item_put(head=
er);
90866d89b13da2 Michael Grzeschik     2022-01-05  961  	if (!h) {
90866d89b13da2 Michael Grzeschik     2022-01-05  962  		config_item_put(h);
90866d89b13da2 Michael Grzeschik     2022-01-05  963  		return ERR_PTR(-ENO=
MEM);
90866d89b13da2 Michael Grzeschik     2022-01-05  964  	}
90866d89b13da2 Michael Grzeschik     2022-01-05  965  	uvc->header =3D to_u=
vcg_streaming_header(h);
90866d89b13da2 Michael Grzeschik     2022-01-05  966  	if (!uvc->header->li=
nked)
90866d89b13da2 Michael Grzeschik     2022-01-05  967  		return ERR_PTR(-EBU=
SY);
90866d89b13da2 Michael Grzeschik     2022-01-05  968  =

46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  969  	++opts->refcnt;
46919a23ee87bb Andrzej Pietrasiewicz 2014-12-10  970  	mutex_unlock(&opts->=
lock);
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  971  =

6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  972  	/* Register the func=
tion. */
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  973  	uvc->func.name =3D "=
uvc";
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  974  	uvc->func.bind =3D u=
vc_function_bind;
e6bab2b66329b4 Michael Tretter       2021-10-17  975  	uvc->func.unbind =3D=
 uvc_function_unbind;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  976  	uvc->func.get_alt =
=3D uvc_function_get_alt;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  977  	uvc->func.set_alt =
=3D uvc_function_set_alt;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  978  	uvc->func.disable =
=3D uvc_function_disable;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  979  	uvc->func.setup =3D =
uvc_function_setup;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  980  	uvc->func.free_func =
=3D uvc_free;
f277bf27cf5cd5 Robert Baldyga        2015-05-04  981  	uvc->func.bind_deact=
ivated =3D true;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  982  =

6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09 @983  	return &uvc->func;
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  984  }
6d11ed76c45dd7 Andrzej Pietrasiewicz 2014-09-09  985  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0892978895420754843==--

