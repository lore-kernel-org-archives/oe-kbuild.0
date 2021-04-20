Content-Type: multipart/mixed; boundary="===============7019300312418433879=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [chrome-os:chromeos-5.4 56/243] drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:751:10: warning: Expression is always false because 'else if' condition matches previous condition at line 749. [multiCondition]
Date: Tue, 20 Apr 2021 11:34:02 +0300
Message-ID: <20210420083402.GE1959@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7019300312418433879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel  ch=
romeos-5.4
head:   52d269f32500581166246e0e494b2b62d979dba6
commit: bc0b0ae994e6bb17b12bfd882c2eb837eb29c078 [56/243] CHROMIUM: media: =
mtk-vcodec: Add vp9 slice api driver for mt8192
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c:751:10: war=
ning: Expression is always false because 'else if' condition matches previo=
us condition at line 749. [multiCondition]
    else if (hdr->reset_frame_context =3D=3D V4L2_VP9_RESET_FRAME_CTX_SPEC)
            ^

vim +751 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

bc0b0ae994e6bb Yunfei Dong 2021-01-21  730  static void vdec_vp9_slice_setu=
p_hdr(
bc0b0ae994e6bb Yunfei Dong 2021-01-21  731  	struct vdec_vp9_slice_instance=
 *instance,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  732  	struct vdec_vp9_slice_uncompre=
ssed_header *uh,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  733  	struct v4l2_ctrl_vp9_frame_dec=
ode_params *hdr)
bc0b0ae994e6bb Yunfei Dong 2021-01-21  734  {
bc0b0ae994e6bb Yunfei Dong 2021-01-21  735  	int i;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  736  =

bc0b0ae994e6bb Yunfei Dong 2021-01-21  737  	uh->profile =3D hdr->profile;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  738  	uh->last_frame_type =3D instan=
ce->frame_type;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  739  	uh->frame_type =3D !HDR_FLAG(K=
EY_FRAME);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  740  	uh->last_show_frame =3D instan=
ce->show_frame;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  741  	uh->show_frame =3D HDR_FLAG(SH=
OW_FRAME);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  742  	uh->error_resilient_mode =3D H=
DR_FLAG(ERROR_RESILIENT);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  743  	uh->bit_depth =3D hdr->bit_dep=
th;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  744  	uh->last_frame_width =3D insta=
nce->width;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  745  	uh->last_frame_height =3D inst=
ance->height;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  746  	uh->frame_width =3D hdr->frame=
_width_minus_1 + 1;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  747  	uh->frame_height =3D hdr->fram=
e_height_minus_1 + 1;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  748  	uh->intra_only =3D HDR_FLAG(IN=
TRA_ONLY);
bc0b0ae994e6bb Yunfei Dong 2021-01-21 @749  	if (hdr->reset_frame_context =
=3D=3D V4L2_VP9_RESET_FRAME_CTX_SPEC)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

bc0b0ae994e6bb Yunfei Dong 2021-01-21  750  		uh->reset_frame_context =3D 2;
bc0b0ae994e6bb Yunfei Dong 2021-01-21 @751  	else if (hdr->reset_frame_cont=
ext =3D=3D V4L2_VP9_RESET_FRAME_CTX_SPEC)
                                                         ^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Same same.

bc0b0ae994e6bb Yunfei Dong 2021-01-21  752  		uh->reset_frame_context =3D 3;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  753  	else
bc0b0ae994e6bb Yunfei Dong 2021-01-21  754  		uh->reset_frame_context =3D 0;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  755  	/*
bc0b0ae994e6bb Yunfei Dong 2021-01-21  756  	 * ref_frame_sign_bias specifi=
es the intended direction
bc0b0ae994e6bb Yunfei Dong 2021-01-21  757  	 * of the motion vector in tim=
e for each reference frame.
bc0b0ae994e6bb Yunfei Dong 2021-01-21  758  	 * - INTRA_FRAME =3D 0,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  759  	 * - LAST_FRAME =3D 1,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  760  	 * - GOLDEN_FRAME =3D 2,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  761  	 * - ALTREF_FRAME =3D 3,
bc0b0ae994e6bb Yunfei Dong 2021-01-21  762  	 * ref_frame_sign_biases[INTRA=
_FRAME] is always 0
bc0b0ae994e6bb Yunfei Dong 2021-01-21  763  	 * and VDA only passes another=
 3 directions
bc0b0ae994e6bb Yunfei Dong 2021-01-21  764  	 */
bc0b0ae994e6bb Yunfei Dong 2021-01-21  765  	uh->ref_frame_sign_bias[0] =3D=
 0;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  766  	for (i =3D 0; i < 3; i++)
bc0b0ae994e6bb Yunfei Dong 2021-01-21  767  		uh->ref_frame_sign_bias[i + 1=
] =3D
bc0b0ae994e6bb Yunfei Dong 2021-01-21  768  			!!(hdr->ref_frame_sign_biase=
s & (1 << i));
bc0b0ae994e6bb Yunfei Dong 2021-01-21  769  	uh->allow_high_precision_mv =
=3D HDR_FLAG(ALLOW_HIGH_PREC_MV);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  770  	uh->interpolation_filter =3D h=
dr->interpolation_filter;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  771  	uh->refresh_frame_context =3D =
HDR_FLAG(REFRESH_FRAME_CTX);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  772  	uh->frame_parallel_decoding_mo=
de =3D HDR_FLAG(PARALLEL_DEC_MODE);
bc0b0ae994e6bb Yunfei Dong 2021-01-21  773  	uh->frame_context_idx =3D hdr-=
>frame_context_idx;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  774  =

bc0b0ae994e6bb Yunfei Dong 2021-01-21  775  	/* tile info */
bc0b0ae994e6bb Yunfei Dong 2021-01-21  776  	uh->tile_cols_log2 =3D hdr->ti=
le_cols_log2;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  777  	uh->tile_rows_log2 =3D hdr->ti=
le_rows_log2;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  778  =

bc0b0ae994e6bb Yunfei Dong 2021-01-21  779  	uh->uncompressed_header_size =
=3D hdr->uncompressed_header_size;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  780  	uh->header_size_in_bytes =3D h=
dr->compressed_header_size;
bc0b0ae994e6bb Yunfei Dong 2021-01-21  781  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =

_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org
--===============7019300312418433879==--

