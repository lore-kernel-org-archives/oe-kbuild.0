Content-Type: multipart/mixed; boundary="===============1740908895674185930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7596/9759] drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:252 dpu_encoder_phys_wb_atomic_check() error: potentially dereferencing uninitialized 'mode'.
Date: Mon, 09 May 2022 15:42:22 +0800
Message-ID: <202205091519.QG5jEjfp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1740908895674185930==
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
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: d7d0e73f7de33a2b9998b607707a3e944ef3b86d [7596/9759] drm/msm/dpu: i=
ntroduce the dpu_encoder_phys_* for writeback
:::::: branch date: 3 days ago
:::::: commit date: 7 days ago
config: ia64-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220509/202205091519.QG5jEjfp-lkp(a)intel.com/config)
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

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  237  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  238  /**
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  239   * dpu_encoder_phys_wb_atomi=
c_check - verify and fixup given atomic states
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  240   * @phys_enc:	Pointer to phy=
sical encoder
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  241   * @crtc_state:	Pointer to C=
RTC atomic state
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  242   * @conn_state:	Pointer to c=
onnector atomic state
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  243   */
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  244  static int dpu_encoder_phys_=
wb_atomic_check(
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  245  		struct dpu_encoder_phys *p=
hys_enc,
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  246  		struct drm_crtc_state *crt=
c_state,
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  247  		struct drm_connector_state=
 *conn_state)
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  248  {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  249  	struct drm_framebuffer *fb;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  250  	const struct drm_display_mo=
de *mode;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  251  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26 @252  	DPU_DEBUG("[atomic_check:%d=
, \"%s\",%d,%d]\n",
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  253  			phys_enc->wb_idx, mode->n=
ame, mode->hdisplay, mode->vdisplay);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  254  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26 @255  	if (!conn_state->writeback_=
job || !conn_state->writeback_job->fb)
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  256  		return 0;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  257  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  258  	fb =3D conn_state->writebac=
k_job->fb;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  259  	mode =3D &crtc_state->mode;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  260  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26 @261  	if (!conn_state || !conn_st=
ate->connector) {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  262  		DPU_ERROR("invalid connect=
or state\n");
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  263  		return -EINVAL;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  264  	} else if (conn_state->conn=
ector->status !=3D
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  265  			connector_status_connecte=
d) {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  266  		DPU_ERROR("connector not c=
onnected %d\n",
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  267  				conn_state->connector->s=
tatus);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  268  		return -EINVAL;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  269  	}
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  270  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  271  	DPU_DEBUG("[fb_id:%u][fb:%u=
,%u]\n", fb->base.id,
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  272  			fb->width, fb->height);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  273  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  274  	if (fb->width !=3D mode->hd=
isplay) {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  275  		DPU_ERROR("invalid fb w=3D=
%d, mode w=3D%d\n", fb->width,
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  276  				mode->hdisplay);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  277  		return -EINVAL;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  278  	} else if (fb->height !=3D =
mode->vdisplay) {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  279  		DPU_ERROR("invalid fb h=3D=
%d, mode h=3D%d\n", fb->height,
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  280  				  mode->vdisplay);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  281  		return -EINVAL;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  282  	} else if (fb->width > DEFA=
ULT_MAX_WRITEBACK_WIDTH) {
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  283  		DPU_ERROR("invalid fb w=3D=
%d, maxlinewidth=3D%u\n",
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  284  				  fb->width, DEFAULT_MAX=
_WRITEBACK_WIDTH);
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  285  		return -EINVAL;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  286  	}
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  287  =

d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  288  	return 0;
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  289  }
d7d0e73f7de33a2 Abhinav Kumar 2022-04-26  290  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1740908895674185930==--

