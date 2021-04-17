Content-Type: multipart/mixed; boundary="===============5177073319422318663=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.4 54/243] drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c:575:34: warning: Uninitialized variable: timeout [uninitvar]
Date: Sat, 17 Apr 2021 15:16:04 +0800
Message-ID: <202104171502.gKuG4Jni-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5177073319422318663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   52d269f32500581166246e0e494b2b62d979dba6
commit: 0a438b290ea431bc87156be5819e9f85fa951240 [54/243] CHROMIUM: media: =
mtk-vcodec: Add h264 slice api driver for mt8192
:::::: branch date: 2 hours ago
:::::: commit date: 32 hours ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c:575:34: wa=
rning: Uninitialized variable: timeout [uninitvar]
    if (err =3D=3D SLICE_HEADER_FULL || timeout || (err =3D=3D TRANS_BUFFER=
_FULL &&
                                    ^

vim +575 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_lat_if.c

0a438b290ea431 Yunfei Dong 2021-01-05  472  =

0a438b290ea431 Yunfei Dong 2021-01-05  473  static int vdec_h264_slice_deco=
de(void *h_vdec, struct mtk_vcodec_mem *bs,
0a438b290ea431 Yunfei Dong 2021-01-05  474  	struct vdec_fb *fb, bool *res_=
chg)
0a438b290ea431 Yunfei Dong 2021-01-05  475  {
0a438b290ea431 Yunfei Dong 2021-01-05  476  	struct vdec_h264_slice_inst *i=
nst =3D h_vdec;
0a438b290ea431 Yunfei Dong 2021-01-05  477  	struct vdec_vpu_inst *vpu =3D =
&inst->vpu;
0a438b290ea431 Yunfei Dong 2021-01-05  478  	struct mtk_video_dec_buf *src_=
buf_info;
0a438b290ea431 Yunfei Dong 2021-01-05  479  	int nal_start_idx, err, timeou=
t, i;
0a438b290ea431 Yunfei Dong 2021-01-05  480  	unsigned int nal_type, data[2];
0a438b290ea431 Yunfei Dong 2021-01-05  481  	struct vdec_lat_buf *lat_buf;
0a438b290ea431 Yunfei Dong 2021-01-05  482  	struct vdec_h264_slice_share_i=
nfo *share_info;
0a438b290ea431 Yunfei Dong 2021-01-05  483  	unsigned char *buf;
0a438b290ea431 Yunfei Dong 2021-01-05  484  	struct mtk_vcodec_mem *mem;
0a438b290ea431 Yunfei Dong 2021-01-05  485  =

0a438b290ea431 Yunfei Dong 2021-01-05  486  	mtk_vcodec_debug(inst, "+ [%d]=
 ", ++inst->num_nalu);
0a438b290ea431 Yunfei Dong 2021-01-05  487  =

0a438b290ea431 Yunfei Dong 2021-01-05  488  	if (!inst->ctx->msg_queue.init=
_done) {
0a438b290ea431 Yunfei Dong 2021-01-05  489  		if (vdec_msg_queue_init(inst-=
>ctx, &inst->ctx->msg_queue,
0a438b290ea431 Yunfei Dong 2021-01-05  490  			vdec_h264_slice_core_decode,=
 sizeof(*share_info)))
0a438b290ea431 Yunfei Dong 2021-01-05  491  		return -ENOMEM;
0a438b290ea431 Yunfei Dong 2021-01-05  492  	}
0a438b290ea431 Yunfei Dong 2021-01-05  493  =

0a438b290ea431 Yunfei Dong 2021-01-05  494  	/* bs NULL means flush decoder=
 */
0a438b290ea431 Yunfei Dong 2021-01-05  495  	if (!bs) {
0a438b290ea431 Yunfei Dong 2021-01-05  496  		vdec_msg_queue_wait_lat_buf_f=
ull(&inst->ctx->msg_queue);
0a438b290ea431 Yunfei Dong 2021-01-05  497  		return vpu_dec_reset(vpu);
0a438b290ea431 Yunfei Dong 2021-01-05  498  	}
0a438b290ea431 Yunfei Dong 2021-01-05  499  =

0a438b290ea431 Yunfei Dong 2021-01-05  500  	lat_buf =3D vdec_msg_queue_get=
_lat_buf(&inst->ctx->msg_queue);
0a438b290ea431 Yunfei Dong 2021-01-05  501  	if (!lat_buf) {
0a438b290ea431 Yunfei Dong 2021-01-05  502  		mtk_vcodec_err(inst, "failed =
to get lat buffer");
0a438b290ea431 Yunfei Dong 2021-01-05  503  		return -EINVAL;
0a438b290ea431 Yunfei Dong 2021-01-05  504  	}
0a438b290ea431 Yunfei Dong 2021-01-05  505  	share_info =3D lat_buf->privat=
e_data;
0a438b290ea431 Yunfei Dong 2021-01-05  506  	src_buf_info =3D container_of(=
bs, struct mtk_video_dec_buf, bs_buffer);
0a438b290ea431 Yunfei Dong 2021-01-05  507  =

0a438b290ea431 Yunfei Dong 2021-01-05  508  	buf =3D (unsigned char *)bs->v=
a;
0a438b290ea431 Yunfei Dong 2021-01-05  509  	nal_start_idx =3D mtk_vdec_h26=
4_find_start_code(buf, bs->size);
0a438b290ea431 Yunfei Dong 2021-01-05  510  	if (nal_start_idx < 0) {
0a438b290ea431 Yunfei Dong 2021-01-05  511  		err =3D -EINVAL;
0a438b290ea431 Yunfei Dong 2021-01-05  512  		goto err_free_fb_out;
0a438b290ea431 Yunfei Dong 2021-01-05  513  	}
0a438b290ea431 Yunfei Dong 2021-01-05  514  =

0a438b290ea431 Yunfei Dong 2021-01-05  515  	inst->vsi->dec.nal_info =3D bu=
f[nal_start_idx];
0a438b290ea431 Yunfei Dong 2021-01-05  516  	nal_type =3D NAL_TYPE(buf[nal_=
start_idx]);
0a438b290ea431 Yunfei Dong 2021-01-05  517  	mtk_vcodec_debug(inst, "\n + N=
ALU[%d] type %d +\n", inst->num_nalu,
0a438b290ea431 Yunfei Dong 2021-01-05  518  			 nal_type);
0a438b290ea431 Yunfei Dong 2021-01-05  519  =

0a438b290ea431 Yunfei Dong 2021-01-05  520  	inst->vsi->dec.bs_buf_addr =3D=
 (uint64_t)bs->dma_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  521  	inst->vsi->dec.bs_buf_size =3D=
 bs->size;
0a438b290ea431 Yunfei Dong 2021-01-05  522  =

0a438b290ea431 Yunfei Dong 2021-01-05  523  	v4l2_m2m_buf_copy_metadata(&sr=
c_buf_info->m2m_buf.vb,
0a438b290ea431 Yunfei Dong 2021-01-05  524  		&lat_buf->ts_info, true);
0a438b290ea431 Yunfei Dong 2021-01-05  525  =

0a438b290ea431 Yunfei Dong 2021-01-05  526  	vdec_h264_slice_fill_decode_pa=
rameters(inst, share_info);
0a438b290ea431 Yunfei Dong 2021-01-05  527  	*res_chg =3D inst->resolution_=
changed;
0a438b290ea431 Yunfei Dong 2021-01-05  528  	if (inst->resolution_changed) {
0a438b290ea431 Yunfei Dong 2021-01-05  529  		mtk_vcodec_debug(inst, "- res=
olution changed -");
0a438b290ea431 Yunfei Dong 2021-01-05  530  		if (inst->realloc_mv_buf) {
0a438b290ea431 Yunfei Dong 2021-01-05  531  			err =3D vdec_h264_slice_allo=
c_mv_buf(inst, &inst->ctx->picinfo);
0a438b290ea431 Yunfei Dong 2021-01-05  532  			inst->realloc_mv_buf =3D fal=
se;
0a438b290ea431 Yunfei Dong 2021-01-05  533  			if (err)
0a438b290ea431 Yunfei Dong 2021-01-05  534  				goto err_free_fb_out;
0a438b290ea431 Yunfei Dong 2021-01-05  535  		}
0a438b290ea431 Yunfei Dong 2021-01-05  536  		inst->resolution_changed =3D =
false;
0a438b290ea431 Yunfei Dong 2021-01-05  537  	}
0a438b290ea431 Yunfei Dong 2021-01-05  538  	for (i =3D 0; i < H264_MAX_MV_=
NUM; i++) {
0a438b290ea431 Yunfei Dong 2021-01-05  539  		mem =3D &inst->mv_buf[i];
0a438b290ea431 Yunfei Dong 2021-01-05  540  		inst->vsi->mv_buf_dma[i] =3D =
mem->dma_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  541  	}
0a438b290ea431 Yunfei Dong 2021-01-05  542  	inst->vsi->wdma_start_addr =3D=
 lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  543  	inst->vsi->wdma_end_addr =3D l=
at_buf->ctx->msg_queue.wdma_addr.dma_addr +
0a438b290ea431 Yunfei Dong 2021-01-05  544  		lat_buf->ctx->msg_queue.wdma_=
addr.size;
0a438b290ea431 Yunfei Dong 2021-01-05  545  	inst->vsi->wdma_err_addr =3D l=
at_buf->wdma_err_addr.dma_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  546  	inst->vsi->slice_bc_start_addr=
 =3D lat_buf->slice_bc_addr.dma_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  547  	inst->vsi->slice_bc_end_addr =
=3D lat_buf->slice_bc_addr.dma_addr +
0a438b290ea431 Yunfei Dong 2021-01-05  548  		lat_buf->slice_bc_addr.size;
0a438b290ea431 Yunfei Dong 2021-01-05  549  =

0a438b290ea431 Yunfei Dong 2021-01-05  550  	inst->vsi->trans_end =3D inst-=
>ctx->msg_queue.wdma_rptr_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  551  	inst->vsi->trans_start =3D ins=
t->ctx->msg_queue.wdma_wptr_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  552  	mtk_vcodec_debug(inst, "lat:tr=
ans(0x%llx 0x%llx)err:0x%llx",
0a438b290ea431 Yunfei Dong 2021-01-05  553  		inst->vsi->wdma_start_addr,
0a438b290ea431 Yunfei Dong 2021-01-05  554  		inst->vsi->wdma_end_addr,
0a438b290ea431 Yunfei Dong 2021-01-05  555  		inst->vsi->wdma_err_addr);
0a438b290ea431 Yunfei Dong 2021-01-05  556  =

0a438b290ea431 Yunfei Dong 2021-01-05  557  	mtk_vcodec_debug(inst, "slice(=
0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
0a438b290ea431 Yunfei Dong 2021-01-05  558  		inst->vsi->slice_bc_start_add=
r,
0a438b290ea431 Yunfei Dong 2021-01-05  559  		inst->vsi->slice_bc_end_addr,
0a438b290ea431 Yunfei Dong 2021-01-05  560  		inst->vsi->trans_start,
0a438b290ea431 Yunfei Dong 2021-01-05  561  		inst->vsi->trans_end);
0a438b290ea431 Yunfei Dong 2021-01-05  562  	err =3D vpu_dec_start(vpu, dat=
a, 2);
0a438b290ea431 Yunfei Dong 2021-01-05  563  	if (err) {
0a438b290ea431 Yunfei Dong 2021-01-05  564  		mtk_vcodec_debug(inst, "lat d=
ecode err: %d", err);
0a438b290ea431 Yunfei Dong 2021-01-05  565  		goto err_free_fb_out;
0a438b290ea431 Yunfei Dong 2021-01-05  566  	}
0a438b290ea431 Yunfei Dong 2021-01-05  567  =

0a438b290ea431 Yunfei Dong 2021-01-05  568  	if (nal_type =3D=3D NAL_NON_ID=
R_SLICE || nal_type =3D=3D NAL_IDR_SLICE) {
0a438b290ea431 Yunfei Dong 2021-01-05  569  		/* wait decoder done interrup=
t */
0a438b290ea431 Yunfei Dong 2021-01-05  570  		timeout =3D mtk_vcodec_wait_f=
or_done_ctx(
0a438b290ea431 Yunfei Dong 2021-01-05  571  			inst->ctx, MTK_INST_IRQ_RECE=
IVED, WAIT_INTR_TIMEOUT_MS);
0a438b290ea431 Yunfei Dong 2021-01-05  572  		inst->vsi->dec.timeout =3D !!=
timeout;
0a438b290ea431 Yunfei Dong 2021-01-05  573  	}
0a438b290ea431 Yunfei Dong 2021-01-05  574  	err =3D vpu_dec_end(vpu);
0a438b290ea431 Yunfei Dong 2021-01-05 @575  	if (err =3D=3D SLICE_HEADER_FU=
LL || timeout || (err =3D=3D TRANS_BUFFER_FULL &&
0a438b290ea431 Yunfei Dong 2021-01-05  576  		inst->ctx->msg_queue.wdma_rpt=
r_addr =3D=3D
0a438b290ea431 Yunfei Dong 2021-01-05  577  		inst->ctx->msg_queue.wdma_wpt=
r_addr)) {
0a438b290ea431 Yunfei Dong 2021-01-05  578  		err =3D -EINVAL;
0a438b290ea431 Yunfei Dong 2021-01-05  579  		goto err_free_fb_out;
0a438b290ea431 Yunfei Dong 2021-01-05  580  	} else if (err =3D=3D TRANS_BU=
FFER_FULL){
0a438b290ea431 Yunfei Dong 2021-01-05  581  		goto err_free_fb_out;
0a438b290ea431 Yunfei Dong 2021-01-05  582  	}
0a438b290ea431 Yunfei Dong 2021-01-05  583  =

0a438b290ea431 Yunfei Dong 2021-01-05  584  	share_info->trans_end =3D inst=
->ctx->msg_queue.wdma_addr.dma_addr +
0a438b290ea431 Yunfei Dong 2021-01-05  585  		inst->vsi->wdma_end_addr_offs=
et;
0a438b290ea431 Yunfei Dong 2021-01-05  586  	share_info->trans_start =3D in=
st->ctx->msg_queue.wdma_wptr_addr;
0a438b290ea431 Yunfei Dong 2021-01-05  587  	share_info->nal_info =3D inst-=
>vsi->dec.nal_info;
0a438b290ea431 Yunfei Dong 2021-01-05  588  	vdec_msg_queue_update_ube_wptr=
(&lat_buf->ctx->msg_queue,
0a438b290ea431 Yunfei Dong 2021-01-05  589  		share_info->trans_end);
0a438b290ea431 Yunfei Dong 2021-01-05  590  =

0a438b290ea431 Yunfei Dong 2021-01-05  591  	memcpy(&share_info->h264_slice=
_params, &inst->vsi->h264_slice_params,
0a438b290ea431 Yunfei Dong 2021-01-05  592  		sizeof(share_info->h264_slice=
_params));
0a438b290ea431 Yunfei Dong 2021-01-05  593  	vdec_msg_queue_buf_to_core(ins=
t->ctx->dev, lat_buf);
0a438b290ea431 Yunfei Dong 2021-01-05  594  	mtk_vcodec_debug(inst, "- NALU=
[%d] type=3D%d -\n", inst->num_nalu,
0a438b290ea431 Yunfei Dong 2021-01-05  595  			 nal_type);
0a438b290ea431 Yunfei Dong 2021-01-05  596  	return 0;
0a438b290ea431 Yunfei Dong 2021-01-05  597  =

0a438b290ea431 Yunfei Dong 2021-01-05  598  err_free_fb_out:
0a438b290ea431 Yunfei Dong 2021-01-05  599  	if (lat_buf)
0a438b290ea431 Yunfei Dong 2021-01-05  600  		vdec_msg_queue_buf_to_lat(lat=
_buf);
0a438b290ea431 Yunfei Dong 2021-01-05  601  	mtk_vcodec_err(inst, "- NALU[%=
d] err=3D%d -\n", inst->num_nalu, err);
0a438b290ea431 Yunfei Dong 2021-01-05  602  	return err;
0a438b290ea431 Yunfei Dong 2021-01-05  603  }
0a438b290ea431 Yunfei Dong 2021-01-05  604  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5177073319422318663==--

