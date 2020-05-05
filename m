Content-Type: multipart/mixed; boundary="===============2629338590709853693=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface
Date: Tue, 05 May 2020 21:31:09 +0800
Message-ID: <202005052138.RS7sbrMN%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2629338590709853693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-5-laurent.pinchart@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: linux-media(a)vger.kernel.org
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Jacopo Mondi <jacopo@jmondi.org>
CC: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
CC: Naushir Patuck <naush@raspberrypi.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>

Hi Laurent,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.7-rc4]
[cannot apply to linuxtv-media/master anholt/for-next next-20200505]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Laurent-Pinchart/Drivers-f=
or-the-BCM283x-CSI-2-CCP2-receiver-and-ISP/20200505-054310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
9851a0dee7c28514f149f7e4f60ec1b06286cc1b
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/media/platform/bcm2835/bcm2835-unicam.c:2531:15: sparse: sparse:=
 undefined identifier 'v4l2_device_register_ro_subdev_nodes'
>> drivers/media/platform/bcm2835/bcm2835-unicam.c:2566:44: sparse: sparse:=
 missing braces around initializer

# https://github.com/0day-ci/linux/commit/cfc7c7a38d749e5bd51e4a427c9216c30=
ea93b21
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout cfc7c7a38d749e5bd51e4a427c9216c30ea93b21
vim +2566 drivers/media/platform/bcm2835/bcm2835-unicam.c

cfc7c7a38d749e Naushir Patuck 2020-05-04  2562  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2563  static int of_unicam_connec=
t_subdevs(struct unicam_device *dev)
cfc7c7a38d749e Naushir Patuck 2020-05-04  2564  {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2565  	struct platform_device *pd=
ev =3D dev->pdev;
cfc7c7a38d749e Naushir Patuck 2020-05-04 @2566  	struct v4l2_fwnode_endpoin=
t ep =3D { 0 };
cfc7c7a38d749e Naushir Patuck 2020-05-04  2567  	struct device_node *ep_nod=
e;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2568  	struct device_node *sensor=
_node;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2569  	unsigned int lane;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2570  	int ret =3D -EINVAL;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2571  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2572  	if (of_property_read_u32(p=
dev->dev.of_node, "brcm,num-data-lanes",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2573  				 &dev->max_data_lanes) =
< 0) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2574  		unicam_err(dev, "number o=
f data lanes not set\n");
cfc7c7a38d749e Naushir Patuck 2020-05-04  2575  		return -EINVAL;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2576  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2577  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2578  	/* Get the local endpoint =
and remote device. */
cfc7c7a38d749e Naushir Patuck 2020-05-04  2579  	ep_node =3D of_graph_get_n=
ext_endpoint(pdev->dev.of_node, NULL);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2580  	if (!ep_node) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2581  		unicam_dbg(3, dev, "can't=
 get next endpoint\n");
cfc7c7a38d749e Naushir Patuck 2020-05-04  2582  		return -EINVAL;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2583  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2584  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2585  	unicam_dbg(3, dev, "ep_nod=
e is %pOF\n", ep_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2586  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2587  	sensor_node =3D of_graph_g=
et_remote_port_parent(ep_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2588  	if (!sensor_node) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2589  		unicam_dbg(3, dev, "can't=
 get remote parent\n");
cfc7c7a38d749e Naushir Patuck 2020-05-04  2590  		goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2591  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2592  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2593  	unicam_dbg(1, dev, "found =
subdevice %pOF\n", sensor_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2594  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2595  	/* Parse the local endpoin=
t and validate its configuration. */
cfc7c7a38d749e Naushir Patuck 2020-05-04  2596  	v4l2_fwnode_endpoint_parse=
(of_fwnode_handle(ep_node), &ep);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2597  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2598  	unicam_dbg(3, dev, "parsed=
 local endpoint, bus_type %u\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2599  		   ep.bus_type);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2600  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2601  	dev->bus_type =3D ep.bus_t=
ype;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2602  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2603  	switch (ep.bus_type) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2604  	case V4L2_MBUS_CSI2_DPHY:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2605  		switch (ep.bus.mipi_csi2.=
num_data_lanes) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2606  		case 1:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2607  		case 2:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2608  		case 4:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2609  			break;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2610  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2611  		default:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2612  			unicam_err(dev, "subdevi=
ce %pOF: %u data lanes not supported\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2613  				   sensor_node,
cfc7c7a38d749e Naushir Patuck 2020-05-04  2614  				   ep.bus.mipi_csi2.num=
_data_lanes);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2615  			goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2616  		}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2617  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2618  		for (lane =3D 0; lane < e=
p.bus.mipi_csi2.num_data_lanes; lane++) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2619  			if (ep.bus.mipi_csi2.dat=
a_lanes[lane] !=3D lane + 1) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2620  				unicam_err(dev, "subdev=
ice %pOF: data lanes reordering not supported\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2621  					   sensor_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2622  				goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2623  			}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2624  		}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2625  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2626  		if (ep.bus.mipi_csi2.num_=
data_lanes > dev->max_data_lanes) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2627  			unicam_err(dev, "subdevi=
ce requires %u data lanes when %u are supported\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2628  				   ep.bus.mipi_csi2.num=
_data_lanes,
cfc7c7a38d749e Naushir Patuck 2020-05-04  2629  				   dev->max_data_lanes);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2630  		}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2631  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2632  		dev->max_data_lanes =3D e=
p.bus.mipi_csi2.num_data_lanes;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2633  		dev->bus_flags =3D ep.bus=
.mipi_csi2.flags;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2634  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2635  		break;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2636  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2637  	case V4L2_MBUS_CCP2:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2638  		if (ep.bus.mipi_csi1.cloc=
k_lane !=3D 0 ||
cfc7c7a38d749e Naushir Patuck 2020-05-04  2639  		    ep.bus.mipi_csi1.data=
_lane !=3D 1) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2640  			unicam_err(dev, "subdevi=
ce %pOF: unsupported lanes configuration\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2641  				   sensor_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2642  			goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2643  		}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2644  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2645  		dev->max_data_lanes =3D 1;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2646  		dev->bus_flags =3D ep.bus=
.mipi_csi1.strobe;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2647  		break;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2648  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2649  	default:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2650  		/* Unsupported bus type */
cfc7c7a38d749e Naushir Patuck 2020-05-04  2651  		unicam_err(dev, "subdevic=
e %pOF: unsupported bus type %u\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2652  			   sensor_node, ep.bus_t=
ype);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2653  		goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2654  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2655  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2656  	unicam_dbg(3, dev, "subdev=
ice %pOF: %s bus, %u data lanes, flags=3D0x%08x\n",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2657  		   sensor_node,
cfc7c7a38d749e Naushir Patuck 2020-05-04  2658  		   dev->bus_type =3D=3D V=
4L2_MBUS_CSI2_DPHY ? "CSI-2" : "CCP2",
cfc7c7a38d749e Naushir Patuck 2020-05-04  2659  		   dev->max_data_lanes, d=
ev->bus_flags);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2660  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2661  	/* Initialize and register=
 the async notifier. */
cfc7c7a38d749e Naushir Patuck 2020-05-04  2662  	v4l2_async_notifier_init(&=
dev->notifier);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2663  	dev->notifier.ops =3D &uni=
cam_async_ops;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2664  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2665  	dev->asd.match_type =3D V4=
L2_ASYNC_MATCH_FWNODE;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2666  	dev->asd.match.fwnode =3D =
of_fwnode_handle(sensor_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2667  	ret =3D v4l2_async_notifie=
r_add_subdev(&dev->notifier, &dev->asd);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2668  	if (ret) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2669  		unicam_err(dev, "Error ad=
ding subdevice: %d\n", ret);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2670  		goto cleanup_exit;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2671  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2672  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2673  	ret =3D v4l2_async_notifie=
r_register(&dev->v4l2_dev, &dev->notifier);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2674  	if (ret) {
cfc7c7a38d749e Naushir Patuck 2020-05-04  2675  		unicam_err(dev, "Error re=
gistering async notifier: %d\n", ret);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2676  		ret =3D -EINVAL;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2677  	}
cfc7c7a38d749e Naushir Patuck 2020-05-04  2678  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2679  cleanup_exit:
cfc7c7a38d749e Naushir Patuck 2020-05-04  2680  	of_node_put(sensor_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2681  	of_node_put(ep_node);
cfc7c7a38d749e Naushir Patuck 2020-05-04  2682  =

cfc7c7a38d749e Naushir Patuck 2020-05-04  2683  	return ret;
cfc7c7a38d749e Naushir Patuck 2020-05-04  2684  }
cfc7c7a38d749e Naushir Patuck 2020-05-04  2685  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2629338590709853693==--

