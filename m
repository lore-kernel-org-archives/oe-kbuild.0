Content-Type: multipart/mixed; boundary="===============1822332675241591415=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pinchartl-media:rpi/next/bcm2835-isp 5/49] drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:130 get_kernel_id() warn: sleeping in atomic context
Date: Thu, 13 Jan 2022 03:13:41 +0800
Message-ID: <202201130306.YgzUxxgI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1822332675241591415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/pinchartl/media.git rpi/next/bcm2835-isp
head:   97975aa0732da0e2084ed69d140656c2162bec05
commit: 0cfa42bcc0795e569f1312e6ef5843c97bd36642 [5/49] staging: vc04_servi=
ces: Add new vc-sm-cma driver
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-m031-20220112 (https://download.01.org/0day-ci/archi=
ve/20220113/202201130306.YgzUxxgI-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:130 get_kernel_id() warn: s=
leeping in atomic context
drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1245 vc_sm_cma_ioctl_alloc(=
) error: we previously assumed 'buffer' could be null (see line 1133)

vim +130 drivers/staging/vc04_services/vc-sm-cma/vc_sm.c

0cfa42bcc0795e Dave Stevenson 2020-10-08  124  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  125  static int get_kernel_id(str=
uct vc_sm_buffer *buffer)
0cfa42bcc0795e Dave Stevenson 2020-10-08  126  {
0cfa42bcc0795e Dave Stevenson 2020-10-08  127  	int handle;
0cfa42bcc0795e Dave Stevenson 2020-10-08  128  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  129  	spin_lock(&sm_state->kernel=
id_map_lock);
0cfa42bcc0795e Dave Stevenson 2020-10-08 @130  	handle =3D idr_alloc(&sm_st=
ate->kernelid_map, buffer, 0, 0, GFP_KERNEL);
0cfa42bcc0795e Dave Stevenson 2020-10-08  131  	spin_unlock(&sm_state->kern=
elid_map_lock);
0cfa42bcc0795e Dave Stevenson 2020-10-08  132  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  133  	return handle;
0cfa42bcc0795e Dave Stevenson 2020-10-08  134  }
0cfa42bcc0795e Dave Stevenson 2020-10-08  135  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1822332675241591415==--

