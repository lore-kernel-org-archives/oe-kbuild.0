Content-Type: multipart/mixed; boundary="===============3317079179583658896=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-linux-5.10.y 3360/3368] drivers/rpmsg-kdrv/rpmsg_kdrv.c:327:2: warning: Possible null pointer dereference: ctx [nullPointer]
Date: Wed, 07 Apr 2021 18:30:17 +0800
Message-ID: <202104071809.1lx8pgzT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3317079179583658896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Subhajit Paul <subhajit_paul@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y
head:   273179759172db821c14145ec1458ff926e0428b
commit: 9a68bbf173db487a44d2300f7fbb29f3244c8b3a [3360/3368] rpmsg-kdrv: Ad=
d support for device virtualization
:::::: branch date: 4 hours ago
:::::: commit date: 25 hours ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/rpmsg-kdrv/rpmsg_kdrv.c:327:2: warning: Possible null pointer de=
reference: ctx [nullPointer]
    ctx->dev_hdr =3D dev_hdr;
    ^
   drivers/rpmsg-kdrv/rpmsg_kdrv.c:492:4: note: Calling function 'rpmsg_kdr=
v_dev_hdr_alloc', 8th argument 'NULL' value is 0
      NULL);
      ^
   drivers/rpmsg-kdrv/rpmsg_kdrv.c:327:2: note: Null pointer dereference
    ctx->dev_hdr =3D dev_hdr;
    ^

vim +327 drivers/rpmsg-kdrv/rpmsg_kdrv.c

9a68bbf173db48 Subhajit Paul 2021-04-02  297  =

9a68bbf173db48 Subhajit Paul 2021-04-02  298  static struct rpmsg_kdrv_devi=
ce_header *rpmsg_kdrv_dev_hdr_alloc(struct rpmsg_device *rpdev,
9a68bbf173db48 Subhajit Paul 2021-04-02  299  		int device_id, int size, in=
t pkt_type, int pkt_src, void *msg, int len, struct rpmsg_kdrv_ctx *ctx)
9a68bbf173db48 Subhajit Paul 2021-04-02  300  {
9a68bbf173db48 Subhajit Paul 2021-04-02  301  	struct rpmsg_kdrv_device_hea=
der *dev_hdr;
9a68bbf173db48 Subhajit Paul 2021-04-02  302  	void *dst;
9a68bbf173db48 Subhajit Paul 2021-04-02  303  =

9a68bbf173db48 Subhajit Paul 2021-04-02  304  	dev_hdr =3D devm_kzalloc(&rp=
dev->dev, size, GFP_KERNEL);
9a68bbf173db48 Subhajit Paul 2021-04-02  305  	if (!dev_hdr)
9a68bbf173db48 Subhajit Paul 2021-04-02  306  		return NULL;
9a68bbf173db48 Subhajit Paul 2021-04-02  307  =

9a68bbf173db48 Subhajit Paul 2021-04-02  308  	dev_hdr->device_id =3D devic=
e_id;
9a68bbf173db48 Subhajit Paul 2021-04-02  309  	dev_hdr->packet_type =3D pkt=
_type;
9a68bbf173db48 Subhajit Paul 2021-04-02  310  	dev_hdr->packet_source =3D p=
kt_src;
9a68bbf173db48 Subhajit Paul 2021-04-02  311  	dev_hdr->packet_size =3D siz=
e;
9a68bbf173db48 Subhajit Paul 2021-04-02  312  	dev_hdr->packet_id =3D RPMSG=
_KDRV_TP_PACKET_ID_NONE;
9a68bbf173db48 Subhajit Paul 2021-04-02  313  =

9a68bbf173db48 Subhajit Paul 2021-04-02  314  =

9a68bbf173db48 Subhajit Paul 2021-04-02  315  	dst =3D (void *)(&dev_hdr[1]=
);
9a68bbf173db48 Subhajit Paul 2021-04-02  316  	memcpy(dst, msg, len);
9a68bbf173db48 Subhajit Paul 2021-04-02  317  =

9a68bbf173db48 Subhajit Paul 2021-04-02  318  	if (pkt_type =3D=3D RPMSG_KD=
RV_TP_PACKET_TYPE_MESSAGE)
9a68bbf173db48 Subhajit Paul 2021-04-02  319  		return dev_hdr;
9a68bbf173db48 Subhajit Paul 2021-04-02  320  =

9a68bbf173db48 Subhajit Paul 2021-04-02  321  	dev_hdr->packet_id =3D rpmsg=
_kdrv_new_packet_id(rpdev, ctx);
9a68bbf173db48 Subhajit Paul 2021-04-02  322  	if (!dev_hdr->packet_id) {
9a68bbf173db48 Subhajit Paul 2021-04-02  323  		devm_kfree(&rpdev->dev, dev=
_hdr);
9a68bbf173db48 Subhajit Paul 2021-04-02  324  		return NULL;
9a68bbf173db48 Subhajit Paul 2021-04-02  325  	}
9a68bbf173db48 Subhajit Paul 2021-04-02  326  =

9a68bbf173db48 Subhajit Paul 2021-04-02 @327  	ctx->dev_hdr =3D dev_hdr;
9a68bbf173db48 Subhajit Paul 2021-04-02  328  =

9a68bbf173db48 Subhajit Paul 2021-04-02  329  	return dev_hdr;
9a68bbf173db48 Subhajit Paul 2021-04-02  330  }
9a68bbf173db48 Subhajit Paul 2021-04-02  331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3317079179583658896==--

