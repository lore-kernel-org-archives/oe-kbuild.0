Content-Type: multipart/mixed; boundary="===============7051483714086890036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7455/10218] drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:252 dpu_encoder_phys_wb_atomic_check() error: potentially dereferencing uninitialized 'mode'.
Date: Tue, 10 May 2022 03:12:17 +0800
Message-ID: <202205100304.ofBwUyOe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7051483714086890036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Abhinav Kumar <quic_abhinavk@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ab38272e99730375c5db3db1c4cebf691a0550ab
commit: d7d0e73f7de33a2b9998b607707a3e944ef3b86d [7455/10218] drm/msm/dpu: =
introduce the dpu_encoder_phys_* for writeback
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: ia64-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220510/202205100304.ofBwUyOe-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:252 dpu_encoder_phys_wb=
_atomic_check() error: potentially dereferencing uninitialized 'mode'.
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:261 dpu_encoder_phys_wb=
_atomic_check() warn: variable dereferenced before check 'conn_state' (see =
line 255)

vim +/mode +252 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c

d7d0e73f7de33a Abhinav Kumar 2022-04-26  237  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  238  /**
d7d0e73f7de33a Abhinav Kumar 2022-04-26  239   * dpu_encoder_phys_wb_atomic=
_check - verify and fixup given atomic states
d7d0e73f7de33a Abhinav Kumar 2022-04-26  240   * @phys_enc:	Pointer to phys=
ical encoder
d7d0e73f7de33a Abhinav Kumar 2022-04-26  241   * @crtc_state:	Pointer to CR=
TC atomic state
d7d0e73f7de33a Abhinav Kumar 2022-04-26  242   * @conn_state:	Pointer to co=
nnector atomic state
d7d0e73f7de33a Abhinav Kumar 2022-04-26  243   */
d7d0e73f7de33a Abhinav Kumar 2022-04-26  244  static int dpu_encoder_phys_w=
b_atomic_check(
d7d0e73f7de33a Abhinav Kumar 2022-04-26  245  		struct dpu_encoder_phys *ph=
ys_enc,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  246  		struct drm_crtc_state *crtc=
_state,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  247  		struct drm_connector_state =
*conn_state)
d7d0e73f7de33a Abhinav Kumar 2022-04-26  248  {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  249  	struct drm_framebuffer *fb;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  250  	const struct drm_display_mod=
e *mode;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  251  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26 @252  	DPU_DEBUG("[atomic_check:%d,=
 \"%s\",%d,%d]\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26  253  			phys_enc->wb_idx, mode->na=
me, mode->hdisplay, mode->vdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  254  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26 @255  	if (!conn_state->writeback_j=
ob || !conn_state->writeback_job->fb)
d7d0e73f7de33a Abhinav Kumar 2022-04-26  256  		return 0;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  257  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  258  	fb =3D conn_state->writeback=
_job->fb;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  259  	mode =3D &crtc_state->mode;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  260  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26 @261  	if (!conn_state || !conn_sta=
te->connector) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  262  		DPU_ERROR("invalid connecto=
r state\n");
d7d0e73f7de33a Abhinav Kumar 2022-04-26  263  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  264  	} else if (conn_state->conne=
ctor->status !=3D
d7d0e73f7de33a Abhinav Kumar 2022-04-26  265  			connector_status_connected=
) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  266  		DPU_ERROR("connector not co=
nnected %d\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26  267  				conn_state->connector->st=
atus);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  268  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  269  	}
d7d0e73f7de33a Abhinav Kumar 2022-04-26  270  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  271  	DPU_DEBUG("[fb_id:%u][fb:%u,=
%u]\n", fb->base.id,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  272  			fb->width, fb->height);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  273  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  274  	if (fb->width !=3D mode->hdi=
splay) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  275  		DPU_ERROR("invalid fb w=3D%=
d, mode w=3D%d\n", fb->width,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  276  				mode->hdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  277  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  278  	} else if (fb->height !=3D m=
ode->vdisplay) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  279  		DPU_ERROR("invalid fb h=3D%=
d, mode h=3D%d\n", fb->height,
d7d0e73f7de33a Abhinav Kumar 2022-04-26  280  				  mode->vdisplay);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  281  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  282  	} else if (fb->width > DEFAU=
LT_MAX_WRITEBACK_WIDTH) {
d7d0e73f7de33a Abhinav Kumar 2022-04-26  283  		DPU_ERROR("invalid fb w=3D%=
d, maxlinewidth=3D%u\n",
d7d0e73f7de33a Abhinav Kumar 2022-04-26  284  				  fb->width, DEFAULT_MAX_=
WRITEBACK_WIDTH);
d7d0e73f7de33a Abhinav Kumar 2022-04-26  285  		return -EINVAL;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  286  	}
d7d0e73f7de33a Abhinav Kumar 2022-04-26  287  =

d7d0e73f7de33a Abhinav Kumar 2022-04-26  288  	return 0;
d7d0e73f7de33a Abhinav Kumar 2022-04-26  289  }
d7d0e73f7de33a Abhinav Kumar 2022-04-26  290  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7051483714086890036==--

