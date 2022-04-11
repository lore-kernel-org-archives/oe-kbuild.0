Content-Type: multipart/mixed; boundary="===============3326961541518206006=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: video-mux: Use dev_err_probe()
Date: Tue, 12 Apr 2022 07:18:24 +0800
Message-ID: <202204120703.9LLj1dO9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3326961541518206006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411135314.1012346-1-p.zabel@pengutronix.de>
References: <20220411135314.1012346-1-p.zabel@pengutronix.de>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: linux-media(a)vger.kernel.org
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>

Hi Philipp,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Zabel/media-=
video-mux-Use-dev_err_probe/20220411-215408
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001-20220411 (https://download.01.org/0day-ci/ar=
chive/20220412/202204120703.9LLj1dO9-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/video-mux.c:444 video_mux_probe() error: uninitializ=
ed symbol 'ret'.

vim +/ret +444 drivers/media/platform/video-mux.c

c5afc789bf3069 Steve Longerbeam 2018-09-29  404  =

68803ad4522f5d Philipp Zabel    2017-06-07  405  static int video_mux_probe=
(struct platform_device *pdev)
68803ad4522f5d Philipp Zabel    2017-06-07  406  {
68803ad4522f5d Philipp Zabel    2017-06-07  407  	struct device_node *np =
=3D pdev->dev.of_node;
68803ad4522f5d Philipp Zabel    2017-06-07  408  	struct device *dev =3D &p=
dev->dev;
68803ad4522f5d Philipp Zabel    2017-06-07  409  	struct device_node *ep;
68803ad4522f5d Philipp Zabel    2017-06-07  410  	struct video_mux *vmux;
68803ad4522f5d Philipp Zabel    2017-06-07  411  	unsigned int num_pads =3D=
 0;
efe1958ec41bab Philipp Zabel    2018-05-24  412  	unsigned int i;
68803ad4522f5d Philipp Zabel    2017-06-07  413  	int ret;
68803ad4522f5d Philipp Zabel    2017-06-07  414  =

68803ad4522f5d Philipp Zabel    2017-06-07  415  	vmux =3D devm_kzalloc(dev=
, sizeof(*vmux), GFP_KERNEL);
68803ad4522f5d Philipp Zabel    2017-06-07  416  	if (!vmux)
68803ad4522f5d Philipp Zabel    2017-06-07  417  		return -ENOMEM;
68803ad4522f5d Philipp Zabel    2017-06-07  418  =

68803ad4522f5d Philipp Zabel    2017-06-07  419  	platform_set_drvdata(pdev=
, vmux);
68803ad4522f5d Philipp Zabel    2017-06-07  420  =

68803ad4522f5d Philipp Zabel    2017-06-07  421  	v4l2_subdev_init(&vmux->s=
ubdev, &video_mux_subdev_ops);
f764e6d6803915 Rob Herring      2018-08-27  422  	snprintf(vmux->subdev.nam=
e, sizeof(vmux->subdev.name), "%pOFn", np);
68803ad4522f5d Philipp Zabel    2017-06-07  423  	vmux->subdev.flags |=3D V=
4L2_SUBDEV_FL_HAS_DEVNODE;
68803ad4522f5d Philipp Zabel    2017-06-07  424  	vmux->subdev.dev =3D dev;
68803ad4522f5d Philipp Zabel    2017-06-07  425  =

68803ad4522f5d Philipp Zabel    2017-06-07  426  	/*
68803ad4522f5d Philipp Zabel    2017-06-07  427  	 * The largest numbered p=
ort is the output port. It determines
68803ad4522f5d Philipp Zabel    2017-06-07  428  	 * total number of pads.
68803ad4522f5d Philipp Zabel    2017-06-07  429  	 */
68803ad4522f5d Philipp Zabel    2017-06-07  430  	for_each_endpoint_of_node=
(np, ep) {
68803ad4522f5d Philipp Zabel    2017-06-07  431  		struct of_endpoint endpo=
int;
68803ad4522f5d Philipp Zabel    2017-06-07  432  =

68803ad4522f5d Philipp Zabel    2017-06-07  433  		of_graph_parse_endpoint(=
ep, &endpoint);
68803ad4522f5d Philipp Zabel    2017-06-07  434  		num_pads =3D max(num_pad=
s, endpoint.port + 1);
68803ad4522f5d Philipp Zabel    2017-06-07  435  	}
68803ad4522f5d Philipp Zabel    2017-06-07  436  =

68803ad4522f5d Philipp Zabel    2017-06-07  437  	if (num_pads < 2) {
68803ad4522f5d Philipp Zabel    2017-06-07  438  		dev_err(dev, "Not enough=
 ports %d\n", num_pads);
68803ad4522f5d Philipp Zabel    2017-06-07  439  		return -EINVAL;
68803ad4522f5d Philipp Zabel    2017-06-07  440  	}
68803ad4522f5d Philipp Zabel    2017-06-07  441  =

435945e08551ef Philipp Zabel    2017-07-18  442  	vmux->mux =3D devm_mux_co=
ntrol_get(dev, NULL);
475ef968829498 Philipp Zabel    2022-04-11  443  	if (IS_ERR(vmux->mux))
475ef968829498 Philipp Zabel    2022-04-11 @444  		return dev_err_probe(dev=
, ret, "Failed to get mux\n");
68803ad4522f5d Philipp Zabel    2017-06-07  445  =

68803ad4522f5d Philipp Zabel    2017-06-07  446  	mutex_init(&vmux->lock);
68803ad4522f5d Philipp Zabel    2017-06-07  447  	vmux->active =3D -1;
68803ad4522f5d Philipp Zabel    2017-06-07  448  	vmux->pads =3D devm_kcall=
oc(dev, num_pads, sizeof(*vmux->pads),
68803ad4522f5d Philipp Zabel    2017-06-07  449  				  GFP_KERNEL);
aeb0d0f581e207 Kangjie Lu       2019-03-09  450  	if (!vmux->pads)
aeb0d0f581e207 Kangjie Lu       2019-03-09  451  		return -ENOMEM;
aeb0d0f581e207 Kangjie Lu       2019-03-09  452  =

68803ad4522f5d Philipp Zabel    2017-06-07  453  	vmux->format_mbus =3D dev=
m_kcalloc(dev, num_pads,
68803ad4522f5d Philipp Zabel    2017-06-07  454  					 sizeof(*vmux->format=
_mbus),
68803ad4522f5d Philipp Zabel    2017-06-07  455  					 GFP_KERNEL);
aeb0d0f581e207 Kangjie Lu       2019-03-09  456  	if (!vmux->format_mbus)
aeb0d0f581e207 Kangjie Lu       2019-03-09  457  		return -ENOMEM;
68803ad4522f5d Philipp Zabel    2017-06-07  458  =

efe1958ec41bab Philipp Zabel    2018-05-24  459  	for (i =3D 0; i < num_pad=
s; i++) {
efe1958ec41bab Philipp Zabel    2018-05-24  460  		vmux->pads[i].flags =3D =
(i < num_pads - 1) ? MEDIA_PAD_FL_SINK
efe1958ec41bab Philipp Zabel    2018-05-24  461  							 : MEDIA_PAD_FL_SOU=
RCE;
efe1958ec41bab Philipp Zabel    2018-05-24  462  		vmux->format_mbus[i] =3D=
 video_mux_format_mbus_default;
efe1958ec41bab Philipp Zabel    2018-05-24  463  	}
68803ad4522f5d Philipp Zabel    2017-06-07  464  =

68803ad4522f5d Philipp Zabel    2017-06-07  465  	vmux->subdev.entity.funct=
ion =3D MEDIA_ENT_F_VID_MUX;
68803ad4522f5d Philipp Zabel    2017-06-07  466  	ret =3D media_entity_pads=
_init(&vmux->subdev.entity, num_pads,
68803ad4522f5d Philipp Zabel    2017-06-07  467  				     vmux->pads);
68803ad4522f5d Philipp Zabel    2017-06-07  468  	if (ret < 0)
68803ad4522f5d Philipp Zabel    2017-06-07  469  		return ret;
68803ad4522f5d Philipp Zabel    2017-06-07  470  =

68803ad4522f5d Philipp Zabel    2017-06-07  471  	vmux->subdev.entity.ops =
=3D &video_mux_ops;
68803ad4522f5d Philipp Zabel    2017-06-07  472  =

f4d7a681b82665 Steve Longerbeam 2020-05-01  473  	ret =3D video_mux_async_r=
egister(vmux, num_pads - 1);
f4d7a681b82665 Steve Longerbeam 2020-05-01  474  	if (ret) {
3c8c153914812a Sakari Ailus     2021-03-05  475  		v4l2_async_nf_unregister=
(&vmux->notifier);
3c8c153914812a Sakari Ailus     2021-03-05  476  		v4l2_async_nf_cleanup(&v=
mux->notifier);
f4d7a681b82665 Steve Longerbeam 2020-05-01  477  	}
f4d7a681b82665 Steve Longerbeam 2020-05-01  478  =

f4d7a681b82665 Steve Longerbeam 2020-05-01  479  	return ret;
68803ad4522f5d Philipp Zabel    2017-06-07  480  }
68803ad4522f5d Philipp Zabel    2017-06-07  481  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3326961541518206006==--

