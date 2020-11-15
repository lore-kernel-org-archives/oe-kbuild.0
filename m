Content-Type: multipart/mixed; boundary="===============9199870400428681676=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.4.y 2645/12234] drivers/gpu/drm/tidss/tidss_wb_m2m.c:185 device_run() error: '%pa' expects argument of type argument 4 has type 'struct
Date: Sun, 15 Nov 2020 20:37:20 +0800
Message-ID: <202011152015.oREe2wYd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9199870400428681676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Benoit Parrot <bparrot@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
4.y
head:   b956d57638aa031e0b660684c0152dd698ecf150
commit: dae914c5f0f8179f680fd68f60058b2817e9fa8e [2645/12234] drm/tidss: ad=
d WB M2M driver
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20201115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/tidss/tidss_wb_m2m.c:185 device_run() error: '%pa' expects =
argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:297 tidss_wbm2m_irq() error: '%pa' exp=
ects argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx=
**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:389 wbm2m_g_fmt() error: '%pa' expects=
 argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:513 __wbm2m_s_fmt() error: '%pa' expec=
ts argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:831 wbm2m_start_streaming() error: '%p=
a' expects argument of type 'phys_addr_t*', argument 4 has type 'struct wbm=
2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:849 wbm2m_stop_streaming() error: '%pa=
' expects argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2=
m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:1019 wbm2m_open() error: '%pa' expects=
 argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:1019 wbm2m_open() error: '%pa' expects=
 argument of type 'phys_addr_t*', argument 5 has type 'struct v4l2_m2m_ctx*=
*'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:1044 wbm2m_release() error: '%pa' expe=
cts argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx*=
*'

Old smatch warnings:
drivers/gpu/drm/tidss/tidss_wb_m2m.c:233 device_run() error: '%pa' expects =
argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx**'
drivers/gpu/drm/tidss/tidss_wb_m2m.c:314 tidss_wbm2m_irq() error: '%pa' exp=
ects argument of type 'phys_addr_t*', argument 4 has type 'struct wbm2m_ctx=
**'

vim +185 drivers/gpu/drm/tidss/tidss_wb_m2m.c

dae914c5f0f8179 Benoit Parrot 2020-01-09  130  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  131  /* device_run() - prepares a=
nd starts the device
dae914c5f0f8179 Benoit Parrot 2020-01-09  132   *
dae914c5f0f8179 Benoit Parrot 2020-01-09  133   * This function is only cal=
led when both the source and destination
dae914c5f0f8179 Benoit Parrot 2020-01-09  134   * buffers are in place.
dae914c5f0f8179 Benoit Parrot 2020-01-09  135   */
dae914c5f0f8179 Benoit Parrot 2020-01-09  136  static void device_run(void =
*priv)
dae914c5f0f8179 Benoit Parrot 2020-01-09  137  {
dae914c5f0f8179 Benoit Parrot 2020-01-09  138  	struct wbm2m_ctx *ctx =3D p=
riv;
dae914c5f0f8179 Benoit Parrot 2020-01-09  139  	struct wbm2m_dev *dev =3D c=
tx->dev;
dae914c5f0f8179 Benoit Parrot 2020-01-09  140  	struct wb_q_data *d_q_data =
=3D &ctx->q_data[Q_DATA_DST];
dae914c5f0f8179 Benoit Parrot 2020-01-09  141  	struct wb_q_data *s_q_data =
=3D &ctx->q_data[Q_DATA_SRC];
dae914c5f0f8179 Benoit Parrot 2020-01-09  142  	struct vb2_v4l2_buffer *s_v=
b, *d_vb;
dae914c5f0f8179 Benoit Parrot 2020-01-09  143  	struct v4l2_pix_format_mpla=
ne *spix, *dpix;
dae914c5f0f8179 Benoit Parrot 2020-01-09  144  	struct v4l2_rect *srect, *d=
rect;
dae914c5f0f8179 Benoit Parrot 2020-01-09  145  	bool ok;
dae914c5f0f8179 Benoit Parrot 2020-01-09  146  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  147  	s_vb =3D v4l2_m2m_next_src_=
buf(ctx->fh.m2m_ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  148  	d_vb =3D v4l2_m2m_next_dst_=
buf(ctx->fh.m2m_ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  149  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  150  	/* fill source info */
dae914c5f0f8179 Benoit Parrot 2020-01-09  151  	srect =3D &s_q_data->c_rect;
dae914c5f0f8179 Benoit Parrot 2020-01-09  152  	spix =3D &s_q_data->format.=
fmt.pix_mp;
dae914c5f0f8179 Benoit Parrot 2020-01-09  153  	prepare_plane_state(&ctx->s=
_state, &ctx->s_fb,
dae914c5f0f8179 Benoit Parrot 2020-01-09  154  			    spix->pixelformat, ct=
x->s_cma_gem_obj);
dae914c5f0f8179 Benoit Parrot 2020-01-09  155  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  156  	ctx->s_state.src_w =3D srec=
t->width << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  157  	ctx->s_state.src_h =3D srec=
t->height << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  158  	ctx->s_state.src_x =3D srec=
t->left << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  159  	ctx->s_state.src_y =3D srec=
t->top << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  160  	ctx->s_state.crtc_w =3D sre=
ct->width;
dae914c5f0f8179 Benoit Parrot 2020-01-09  161  	ctx->s_state.crtc_h =3D sre=
ct->height;
dae914c5f0f8179 Benoit Parrot 2020-01-09  162  	ctx->s_state.fb->pitches[0]=
 =3D spix->plane_fmt[0].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  163  	ctx->s_state.alpha =3D DRM_=
BLEND_ALPHA_OPAQUE;
dae914c5f0f8179 Benoit Parrot 2020-01-09  164  	ctx->s_state.color_encoding=
 =3D DRM_COLOR_YCBCR_BT601;
dae914c5f0f8179 Benoit Parrot 2020-01-09  165  	ctx->s_state.color_range =
=3D DRM_COLOR_YCBCR_FULL_RANGE;
dae914c5f0f8179 Benoit Parrot 2020-01-09  166  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  167  	ctx->s_cma_gem_obj[0].paddr=
 =3D
dae914c5f0f8179 Benoit Parrot 2020-01-09  168  			vb2_dma_contig_plane_dma_=
addr(&s_vb->vb2_buf, 0);
dae914c5f0f8179 Benoit Parrot 2020-01-09  169  	if (spix->num_planes =3D=3D=
 2) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  170  		ctx->s_cma_gem_obj[1].padd=
r =3D
dae914c5f0f8179 Benoit Parrot 2020-01-09  171  			vb2_dma_contig_plane_dma_=
addr(&s_vb->vb2_buf, 1);
dae914c5f0f8179 Benoit Parrot 2020-01-09  172  		ctx->s_state.fb->pitches[1=
] =3D spix->plane_fmt[1].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  173  	} else if (spix->pixelforma=
t =3D=3D V4L2_PIX_FMT_NV12) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  174  		ctx->s_cma_gem_obj[1].padd=
r =3D ctx->s_cma_gem_obj[0].paddr +
dae914c5f0f8179 Benoit Parrot 2020-01-09  175  			(spix->plane_fmt[0].bytes=
perline * spix->height);
dae914c5f0f8179 Benoit Parrot 2020-01-09  176  		ctx->s_state.fb->pitches[1=
] =3D spix->plane_fmt[0].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  177  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  178  	if (!ctx->s_cma_gem_obj[0].=
paddr) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  179  		log_err(dev,
dae914c5f0f8179 Benoit Parrot 2020-01-09  180  			"acquiring source buffer(=
%d) dma_addr failed\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  181  			(&s_vb->vb2_buf)->index);
dae914c5f0f8179 Benoit Parrot 2020-01-09  182  		return;
dae914c5f0f8179 Benoit Parrot 2020-01-09  183  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  184  =

dae914c5f0f8179 Benoit Parrot 2020-01-09 @185  	log_dbg(dev, "SRC: ctx %pa =
buf_index %d %dx%d, pitches: %d, cpp: %d, sw %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  186  		&ctx, (&s_vb->vb2_buf)->in=
dex,
dae914c5f0f8179 Benoit Parrot 2020-01-09  187  		ctx->s_state.crtc_w, ctx->=
s_state.crtc_h,
dae914c5f0f8179 Benoit Parrot 2020-01-09  188  		ctx->s_state.fb->pitches[0=
], ctx->s_state.fb->format->cpp[0],
dae914c5f0f8179 Benoit Parrot 2020-01-09  189  		ctx->s_state.fb->pitches[0=
] / ctx->s_state.fb->format->cpp[0]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  190  	if (spix->num_planes =3D=3D=
 2 || spix->pixelformat =3D=3D V4L2_PIX_FMT_NV12) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  191  		log_dbg(dev, "SRC: pitches=
_uv: %d, cpp_uv: %d, sw_uv %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  192  			ctx->s_state.fb->pitches[=
1],
dae914c5f0f8179 Benoit Parrot 2020-01-09  193  			ctx->s_state.fb->format->=
cpp[1],
dae914c5f0f8179 Benoit Parrot 2020-01-09  194  			ctx->s_state.fb->pitches[=
1] /
dae914c5f0f8179 Benoit Parrot 2020-01-09  195  				ctx->s_state.fb->format-=
>cpp[1]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  196  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  197  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  198  	/* fill WB info */
dae914c5f0f8179 Benoit Parrot 2020-01-09  199  	drect =3D &d_q_data->c_rect;
dae914c5f0f8179 Benoit Parrot 2020-01-09  200  	dpix =3D &d_q_data->format.=
fmt.pix_mp;
dae914c5f0f8179 Benoit Parrot 2020-01-09  201  	prepare_plane_state(&ctx->d=
_state, &ctx->d_fb,
dae914c5f0f8179 Benoit Parrot 2020-01-09  202  			    dpix->pixelformat, ct=
x->d_cma_gem_obj);
dae914c5f0f8179 Benoit Parrot 2020-01-09  203  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  204  	ctx->d_state.src_w =3D ctx-=
>s_state.crtc_w << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  205  	ctx->d_state.src_h =3D ctx-=
>s_state.crtc_h << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  206  	ctx->d_state.src_x =3D drec=
t->left << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  207  	ctx->d_state.src_y =3D drec=
t->top << 16;
dae914c5f0f8179 Benoit Parrot 2020-01-09  208  	ctx->d_state.crtc_w =3D dre=
ct->width;
dae914c5f0f8179 Benoit Parrot 2020-01-09  209  	ctx->d_state.crtc_h =3D dre=
ct->height;
dae914c5f0f8179 Benoit Parrot 2020-01-09  210  	ctx->d_state.fb->pitches[0]=
 =3D dpix->plane_fmt[0].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  211  	ctx->d_state.alpha =3D DRM_=
BLEND_ALPHA_OPAQUE;
dae914c5f0f8179 Benoit Parrot 2020-01-09  212  	ctx->d_state.color_encoding=
 =3D DRM_COLOR_YCBCR_BT601;
dae914c5f0f8179 Benoit Parrot 2020-01-09  213  	ctx->d_state.color_range =
=3D DRM_COLOR_YCBCR_FULL_RANGE;
dae914c5f0f8179 Benoit Parrot 2020-01-09  214  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  215  	ctx->d_cma_gem_obj[0].paddr=
 =3D
dae914c5f0f8179 Benoit Parrot 2020-01-09  216  			vb2_dma_contig_plane_dma_=
addr(&d_vb->vb2_buf, 0);
dae914c5f0f8179 Benoit Parrot 2020-01-09  217  	if (dpix->num_planes =3D=3D=
 2) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  218  		ctx->d_cma_gem_obj[1].padd=
r =3D
dae914c5f0f8179 Benoit Parrot 2020-01-09  219  			vb2_dma_contig_plane_dma_=
addr(&d_vb->vb2_buf, 1);
dae914c5f0f8179 Benoit Parrot 2020-01-09  220  		ctx->d_state.fb->pitches[1=
] =3D dpix->plane_fmt[1].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  221  	} else if (dpix->pixelforma=
t =3D=3D V4L2_PIX_FMT_NV12) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  222  		ctx->d_cma_gem_obj[1].padd=
r =3D ctx->d_cma_gem_obj[0].paddr +
dae914c5f0f8179 Benoit Parrot 2020-01-09  223  			(dpix->plane_fmt[0].bytes=
perline * dpix->height);
dae914c5f0f8179 Benoit Parrot 2020-01-09  224  		ctx->d_state.fb->pitches[1=
] =3D dpix->plane_fmt[0].bytesperline;
dae914c5f0f8179 Benoit Parrot 2020-01-09  225  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  226  	if (!ctx->d_cma_gem_obj[0].=
paddr) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  227  		log_err(dev,
dae914c5f0f8179 Benoit Parrot 2020-01-09  228  			"acquiring destination bu=
ffer(%d) dma_addr failed\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  229  			(&d_vb->vb2_buf)->index);
dae914c5f0f8179 Benoit Parrot 2020-01-09  230  		return;
dae914c5f0f8179 Benoit Parrot 2020-01-09  231  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  232  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  233  	log_dbg(dev, "DST: ctx %pa =
buf_index %d %dx%d, pitches: %d, cpp: %d, sw %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  234  		&ctx, (&d_vb->vb2_buf)->in=
dex,
dae914c5f0f8179 Benoit Parrot 2020-01-09  235  		ctx->d_state.crtc_w, ctx->=
d_state.crtc_h,
dae914c5f0f8179 Benoit Parrot 2020-01-09  236  		ctx->d_state.fb->pitches[0=
], ctx->d_state.fb->format->cpp[0],
dae914c5f0f8179 Benoit Parrot 2020-01-09  237  		ctx->d_state.fb->pitches[0=
] / ctx->d_state.fb->format->cpp[0]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  238  	if (dpix->num_planes =3D=3D=
 2 || dpix->pixelformat =3D=3D V4L2_PIX_FMT_NV12) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  239  		log_dbg(dev, "DST: pitches=
_uv: %d, cpp_uv: %d, sw_uv %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  240  			ctx->d_state.fb->pitches[=
1],
dae914c5f0f8179 Benoit Parrot 2020-01-09  241  			ctx->d_state.fb->format->=
cpp[1],
dae914c5f0f8179 Benoit Parrot 2020-01-09  242  			ctx->d_state.fb->pitches[=
1] /
dae914c5f0f8179 Benoit Parrot 2020-01-09  243  				ctx->d_state.fb->format-=
>cpp[1]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  244  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  245  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  246  	ok =3D wbm2m_convert(dev, c=
tx->dev->plane,
dae914c5f0f8179 Benoit Parrot 2020-01-09  247  			   (const struct drm_plan=
e_state *)&ctx->s_state,
dae914c5f0f8179 Benoit Parrot 2020-01-09  248  			   (const struct drm_plan=
e_state *)&ctx->d_state);
dae914c5f0f8179 Benoit Parrot 2020-01-09  249  	if (!ok) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  250  		log_err(dev,
dae914c5f0f8179 Benoit Parrot 2020-01-09  251  			"Conversion setup failed,=
 check source and destination parameters\n"
dae914c5f0f8179 Benoit Parrot 2020-01-09  252  			);
dae914c5f0f8179 Benoit Parrot 2020-01-09  253  		log_err(dev, "\tSRC: %dx%d=
, fmt: %4.4s sw %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  254  			ctx->s_state.crtc_w, ctx-=
>s_state.crtc_h,
dae914c5f0f8179 Benoit Parrot 2020-01-09  255  			(char *)&spix->pixelforma=
t,
dae914c5f0f8179 Benoit Parrot 2020-01-09  256  			ctx->s_state.fb->pitches[=
0] /
dae914c5f0f8179 Benoit Parrot 2020-01-09  257  				ctx->s_state.fb->format-=
>cpp[0]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  258  		log_err(dev, "\tDST: %dx%d=
, fmt: %4.4s sw %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  259  			ctx->d_state.crtc_w, ctx-=
>d_state.crtc_h,
dae914c5f0f8179 Benoit Parrot 2020-01-09  260  			(char *)&dpix->pixelforma=
t,
dae914c5f0f8179 Benoit Parrot 2020-01-09  261  			ctx->d_state.fb->pitches[=
0] /
dae914c5f0f8179 Benoit Parrot 2020-01-09  262  				ctx->d_state.fb->format-=
>cpp[0]);
dae914c5f0f8179 Benoit Parrot 2020-01-09  263  		return;
dae914c5f0f8179 Benoit Parrot 2020-01-09  264  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  265  }
dae914c5f0f8179 Benoit Parrot 2020-01-09  266  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  267  void tidss_wbm2m_irq(struct =
wbm2m_dev *wbm2m, u64 irqstatus)
dae914c5f0f8179 Benoit Parrot 2020-01-09  268  {
dae914c5f0f8179 Benoit Parrot 2020-01-09  269  	struct wbm2m_ctx *ctx;
dae914c5f0f8179 Benoit Parrot 2020-01-09  270  	struct vb2_v4l2_buffer *s_v=
b, *d_vb;
dae914c5f0f8179 Benoit Parrot 2020-01-09  271  	unsigned long flags;
dae914c5f0f8179 Benoit Parrot 2020-01-09  272  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  273  	if (irqstatus & DSS_IRQ_DEV=
ICE_WBBUFFEROVERFLOW)
dae914c5f0f8179 Benoit Parrot 2020-01-09  274  		log_err(wbm2m, "WB: UNDERF=
LOW\n");
dae914c5f0f8179 Benoit Parrot 2020-01-09  275  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  276  	if (irqstatus & DSS_IRQ_DEV=
ICE_WBUNCOMPLETEERROR)
dae914c5f0f8179 Benoit Parrot 2020-01-09  277  		log_err(wbm2m, "WB: UNCOMP=
LETEERROR\n");
dae914c5f0f8179 Benoit Parrot 2020-01-09  278  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  279  	if (irqstatus & DSS_IRQ_DEV=
ICE_WBSECURITYVIOLATION)
dae914c5f0f8179 Benoit Parrot 2020-01-09  280  		log_err(wbm2m, "WB: SECURI=
TYVIOLATION\n");
dae914c5f0f8179 Benoit Parrot 2020-01-09  281  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  282  	if (irqstatus & DSS_IRQ_DEV=
ICE_WBSYNC)
dae914c5f0f8179 Benoit Parrot 2020-01-09  283  		log_dbg(wbm2m, "WB: SYNC\n=
");
dae914c5f0f8179 Benoit Parrot 2020-01-09  284  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  285  	/* If DISPC_IRQ_FRAMEDONEWB=
 is not set then we are done */
dae914c5f0f8179 Benoit Parrot 2020-01-09  286  	if (!(irqstatus & DSS_IRQ_D=
EVICE_FRAMEDONEWB))
dae914c5f0f8179 Benoit Parrot 2020-01-09  287  		goto handled;
dae914c5f0f8179 Benoit Parrot 2020-01-09  288  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  289  	log_dbg(wbm2m, "WB: FRAMEDO=
NE\n");
dae914c5f0f8179 Benoit Parrot 2020-01-09  290  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  291  	ctx =3D v4l2_m2m_get_curr_p=
riv(wbm2m->m2m_dev);
dae914c5f0f8179 Benoit Parrot 2020-01-09  292  	if (!ctx) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  293  		log_err(wbm2m, "instance r=
eleased before end of transaction\n");
dae914c5f0f8179 Benoit Parrot 2020-01-09  294  		goto handled;
dae914c5f0f8179 Benoit Parrot 2020-01-09  295  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  296  =

dae914c5f0f8179 Benoit Parrot 2020-01-09 @297  	log_dbg(ctx->dev, "ctx %pa\=
n", &ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  298  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  299  	s_vb =3D v4l2_m2m_src_buf_r=
emove(ctx->fh.m2m_ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  300  	d_vb =3D v4l2_m2m_dst_buf_r=
emove(ctx->fh.m2m_ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  301  	if (!s_vb || !d_vb) {
dae914c5f0f8179 Benoit Parrot 2020-01-09  302  		log_err(wbm2m, "source or =
dest vb pointer is NULL!!");
dae914c5f0f8179 Benoit Parrot 2020-01-09  303  		goto handled;
dae914c5f0f8179 Benoit Parrot 2020-01-09  304  	}
dae914c5f0f8179 Benoit Parrot 2020-01-09  305  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  306  	d_vb->flags =3D s_vb->flags;
dae914c5f0f8179 Benoit Parrot 2020-01-09  307  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  308  	d_vb->vb2_buf.timestamp =3D=
 s_vb->vb2_buf.timestamp;
dae914c5f0f8179 Benoit Parrot 2020-01-09  309  	if (s_vb->flags & V4L2_BUF_=
FLAG_TIMECODE)
dae914c5f0f8179 Benoit Parrot 2020-01-09  310  		d_vb->timecode =3D s_vb->t=
imecode;
dae914c5f0f8179 Benoit Parrot 2020-01-09  311  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  312  	d_vb->sequence =3D ctx->seq=
uence;
dae914c5f0f8179 Benoit Parrot 2020-01-09  313  	s_vb->sequence =3D ctx->seq=
uence;
dae914c5f0f8179 Benoit Parrot 2020-01-09  314  	log_dbg(wbm2m, "ctx %pa seq=
uence %d\n",
dae914c5f0f8179 Benoit Parrot 2020-01-09  315  		&ctx, ctx->sequence);
dae914c5f0f8179 Benoit Parrot 2020-01-09  316  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  317  	d_vb->field =3D V4L2_FIELD_=
NONE;
dae914c5f0f8179 Benoit Parrot 2020-01-09  318  	ctx->sequence++;
dae914c5f0f8179 Benoit Parrot 2020-01-09  319  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  320  	spin_lock_irqsave(&wbm2m->l=
ock, flags);
dae914c5f0f8179 Benoit Parrot 2020-01-09  321  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  322  	v4l2_m2m_buf_done(s_vb, VB2=
_BUF_STATE_DONE);
dae914c5f0f8179 Benoit Parrot 2020-01-09  323  	v4l2_m2m_buf_done(d_vb, VB2=
_BUF_STATE_DONE);
dae914c5f0f8179 Benoit Parrot 2020-01-09  324  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  325  	spin_unlock_irqrestore(&wbm=
2m->lock, flags);
dae914c5f0f8179 Benoit Parrot 2020-01-09  326  =

dae914c5f0f8179 Benoit Parrot 2020-01-09  327  	v4l2_m2m_job_finish(wbm2m->=
m2m_dev, ctx->fh.m2m_ctx);
dae914c5f0f8179 Benoit Parrot 2020-01-09  328  handled:
dae914c5f0f8179 Benoit Parrot 2020-01-09  329  	return;
dae914c5f0f8179 Benoit Parrot 2020-01-09  330  }
dae914c5f0f8179 Benoit Parrot 2020-01-09  331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9199870400428681676==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9199870400428681676==--

