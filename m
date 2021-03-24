Content-Type: multipart/mixed; boundary="===============5888918789783068864=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [chrome-os:chromeos-5.4 12/42] drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c:580:2: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Wed, 24 Mar 2021 11:17:26 +0300
Message-ID: <20210324081726.GO1667@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5888918789783068864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel  ch=
romeos-5.4
head:   21ca1f912dcdfbfd6818d3b1e57a106c2e82dc56
commit: 5fa56a01339db0586f27519d81aa226f1bb49f03 [12/42] FROMLIST: media: m=
tk-vcodec: vdec: support stateless H.264 decoding
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c:580:2: warning=
: Assignment of function parameter has no effect outside the function. Did =
you forget dereferencing it? [uselessAssignmentPtrArg]
    pic =3D &ctx->picinfo;
    ^

vim +580 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

5fa56a01339db0 Yunfei Dong 2021-02-26  568  static void get_pic_info(struct=
 vdec_h264_slice_inst *inst,
5fa56a01339db0 Yunfei Dong 2021-02-26  569  			 struct vdec_pic_info *pic)
5fa56a01339db0 Yunfei Dong 2021-02-26  570  {
5fa56a01339db0 Yunfei Dong 2021-02-26  571  	struct mtk_vcodec_ctx *ctx =3D=
 inst->ctx;
5fa56a01339db0 Yunfei Dong 2021-02-26  572  =

5fa56a01339db0 Yunfei Dong 2021-02-26  573  	ctx->picinfo.buf_w =3D (ctx->p=
icinfo.pic_w + 15) & 0xFFFFFFF0;
5fa56a01339db0 Yunfei Dong 2021-02-26  574  	ctx->picinfo.buf_h =3D (ctx->p=
icinfo.pic_h + 31) & 0xFFFFFFE0;
5fa56a01339db0 Yunfei Dong 2021-02-26  575  	ctx->picinfo.fb_sz[0] =3D ctx-=
>picinfo.buf_w * ctx->picinfo.buf_h;
5fa56a01339db0 Yunfei Dong 2021-02-26  576  	ctx->picinfo.fb_sz[1] =3D ctx-=
>picinfo.fb_sz[0] >> 1;
5fa56a01339db0 Yunfei Dong 2021-02-26  577  	inst->vsi_ctx.dec.cap_num_plan=
es =3D
5fa56a01339db0 Yunfei Dong 2021-02-26  578  		ctx->q_data[MTK_Q_DATA_DST].f=
mt->num_planes;
5fa56a01339db0 Yunfei Dong 2021-02-26  579  =

5fa56a01339db0 Yunfei Dong 2021-02-26 @580  	pic =3D &ctx->picinfo;
                                                ^^^^^^^^^^^^^^^^^^^^
no-op code.  It's unclear without more context what was intended.

5fa56a01339db0 Yunfei Dong 2021-02-26  581  	mtk_vcodec_debug(inst, "pic(%d=
, %d), buf(%d, %d)",
5fa56a01339db0 Yunfei Dong 2021-02-26  582  			 ctx->picinfo.pic_w, ctx->pi=
cinfo.pic_h,
5fa56a01339db0 Yunfei Dong 2021-02-26  583  			 ctx->picinfo.buf_w, ctx->pi=
cinfo.buf_h);
5fa56a01339db0 Yunfei Dong 2021-02-26  584  	mtk_vcodec_debug(inst, "Y/C(%d=
, %d)", ctx->picinfo.fb_sz[0],
5fa56a01339db0 Yunfei Dong 2021-02-26  585  		ctx->picinfo.fb_sz[1]);
5fa56a01339db0 Yunfei Dong 2021-02-26  586  =

5fa56a01339db0 Yunfei Dong 2021-02-26  587  	if ((ctx->last_decoded_picinfo=
.pic_w !=3D ctx->picinfo.pic_w) ||
5fa56a01339db0 Yunfei Dong 2021-02-26  588  		(ctx->last_decoded_picinfo.pi=
c_h !=3D ctx->picinfo.pic_h)) {
5fa56a01339db0 Yunfei Dong 2021-02-26  589  		inst->vsi_ctx.dec.resolution_=
changed =3D true;
5fa56a01339db0 Yunfei Dong 2021-02-26  590  		if ((ctx->last_decoded_picinf=
o.buf_w !=3D ctx->picinfo.buf_w) ||
5fa56a01339db0 Yunfei Dong 2021-02-26  591  			(ctx->last_decoded_picinfo.b=
uf_h !=3D ctx->picinfo.buf_h))
5fa56a01339db0 Yunfei Dong 2021-02-26  592  			inst->vsi_ctx.dec.realloc_mv=
_buf =3D true;
5fa56a01339db0 Yunfei Dong 2021-02-26  593  =

5fa56a01339db0 Yunfei Dong 2021-02-26  594  		mtk_v4l2_debug(1, "ResChg: (%=
d %d) : old(%d, %d) -> new(%d, %d)",
5fa56a01339db0 Yunfei Dong 2021-02-26  595  			inst->vsi_ctx.dec.resolution=
_changed,
5fa56a01339db0 Yunfei Dong 2021-02-26  596  			inst->vsi_ctx.dec.realloc_mv=
_buf,
5fa56a01339db0 Yunfei Dong 2021-02-26  597  			ctx->last_decoded_picinfo.pi=
c_w,
5fa56a01339db0 Yunfei Dong 2021-02-26  598  			ctx->last_decoded_picinfo.pi=
c_h,
5fa56a01339db0 Yunfei Dong 2021-02-26  599  			ctx->picinfo.pic_w, ctx->pic=
info.pic_h);
5fa56a01339db0 Yunfei Dong 2021-02-26  600  	}
5fa56a01339db0 Yunfei Dong 2021-02-26  601  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============5888918789783068864==--

