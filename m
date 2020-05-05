Content-Type: multipart/mixed; boundary="===============2894518552957607147=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 06/34] staging: vc04_services: Add new vc-sm-cma driver
Date: Tue, 05 May 2020 22:49:30 +0800
Message-ID: <202005052259.zka0Qx2L%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2894518552957607147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-7-laurent.pinchart@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: linux-media(a)vger.kernel.org
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Jacopo Mondi <jacopo@jmondi.org>
CC: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
CC: Naushir Patuck <naush@raspberrypi.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>

Hi Laurent,

I love your patch! Perhaps something to improve:

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
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/staging/vc04_services/vc-sm-cma/vc_sm.h:60:21: sparse: sparse: d=
ubious one-bit signed bitfield
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.h:61:23: sparse: sparse: d=
ubious one-bit signed bitfield
   drivers/staging/vc04_services/vc-sm-cma/vc_sm.c:1265:24: sparse: sparse:=
 undefined identifier 'dmac_flush_range'
--
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:474:55: sparse:=
 sparse: Using plain integer as NULL pointer
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:503:59: sparse:=
 sparse: Using plain integer as NULL pointer

# https://github.com/0day-ci/linux/commit/5f041a24bca6d9babfbb0e35b8e2f7cea=
4cf933b
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5f041a24bca6d9babfbb0e35b8e2f7cea4cf933b
vim +60 drivers/staging/vc04_services/vc-sm-cma/vc_sm.h

5f041a24bca6d9 Dave Stevenson 2020-05-04  43  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  44  struct vc_sm_buffer {
5f041a24bca6d9 Dave Stevenson 2020-05-04  45  	struct list_head global_buff=
er_list;	/* Global list of buffers. */
5f041a24bca6d9 Dave Stevenson 2020-05-04  46  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  47  	/* Index in the kernel_id id=
r so that we can find the
5f041a24bca6d9 Dave Stevenson 2020-05-04  48  	 * mmal_msg_context again wh=
en servicing the VCHI reply.
5f041a24bca6d9 Dave Stevenson 2020-05-04  49  	 */
5f041a24bca6d9 Dave Stevenson 2020-05-04  50  	int kernel_id;
5f041a24bca6d9 Dave Stevenson 2020-05-04  51  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  52  	size_t size;
5f041a24bca6d9 Dave Stevenson 2020-05-04  53  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  54  	/* Lock over all the followi=
ng state for this buffer */
5f041a24bca6d9 Dave Stevenson 2020-05-04  55  	struct mutex lock;
5f041a24bca6d9 Dave Stevenson 2020-05-04  56  	struct list_head attachments;
5f041a24bca6d9 Dave Stevenson 2020-05-04  57  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  58  	char name[VC_SM_MAX_NAME_LEN=
];
5f041a24bca6d9 Dave Stevenson 2020-05-04  59  =

5f041a24bca6d9 Dave Stevenson 2020-05-04 @60  	int in_use:1;	/* Kernel is s=
till using this resource */
5f041a24bca6d9 Dave Stevenson 2020-05-04  61  	int imported:1;	/* Imported =
dmabuf */
5f041a24bca6d9 Dave Stevenson 2020-05-04  62  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  63  	enum vc_sm_vpu_mapping_state=
 vpu_state;
5f041a24bca6d9 Dave Stevenson 2020-05-04  64  	u32 vc_handle;	/* VideoCore =
handle for this buffer */
5f041a24bca6d9 Dave Stevenson 2020-05-04  65  	int vpu_allocated;	/*
5f041a24bca6d9 Dave Stevenson 2020-05-04  66  				 * The VPU made this allo=
cation. Release the
5f041a24bca6d9 Dave Stevenson 2020-05-04  67  				 * local dma_buf when the=
 VPU releases the
5f041a24bca6d9 Dave Stevenson 2020-05-04  68  				 * resource.
5f041a24bca6d9 Dave Stevenson 2020-05-04  69  				 */
5f041a24bca6d9 Dave Stevenson 2020-05-04  70  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  71  	/* DMABUF related fields */
5f041a24bca6d9 Dave Stevenson 2020-05-04  72  	struct dma_buf *dma_buf;
5f041a24bca6d9 Dave Stevenson 2020-05-04  73  	dma_addr_t dma_addr;
5f041a24bca6d9 Dave Stevenson 2020-05-04  74  	void *cookie;
5f041a24bca6d9 Dave Stevenson 2020-05-04  75  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  76  	struct vc_sm_privdata_t *pri=
vate;
5f041a24bca6d9 Dave Stevenson 2020-05-04  77  =

5f041a24bca6d9 Dave Stevenson 2020-05-04  78  	union {
5f041a24bca6d9 Dave Stevenson 2020-05-04  79  		struct vc_sm_alloc_data all=
oc;
5f041a24bca6d9 Dave Stevenson 2020-05-04  80  		struct vc_sm_imported impor=
t;
5f041a24bca6d9 Dave Stevenson 2020-05-04  81  	};
5f041a24bca6d9 Dave Stevenson 2020-05-04  82  };
5f041a24bca6d9 Dave Stevenson 2020-05-04  83  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2894518552957607147==--

