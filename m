Content-Type: multipart/mixed; boundary="===============8031294579688026655=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 678/2089] drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:678 get_surf_rq_param() warn: right shifting more than type allows 32 vs 4294966273
Date: Thu, 18 Jun 2020 08:37:24 +0800
Message-ID: <202006180824.gUkrwkhf%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8031294579688026655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Eric Bernstein <Eric.Bernstein@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5fcb9628fd1227a5f11d87171cb1b8b5c414d9d9
commit: b236e048ec633a35b2a83d663f74c22ef04b9bab [678/2089] drm/amd/display=
: simplify dml log2 function
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021-20200617 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:678=
 get_surf_rq_param() warn: right shifting more than type allows 32 vs 42949=
66273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:450 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:450 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:442 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:684=
 get_surf_rq_param() warn: right shifting more than type allows 32 vs 42949=
66273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:454 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:638 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20.c=
:638 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:454 get_meta_and_pte_attr() warn: right shifting more than type allows 3=
2 vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:638 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_rq_dlg_calc_20v2=
.c:638 get_meta_and_pte_attr() warn: maybe use && instead of &
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:448 get_meta_and_pte_attr() warn: right shifting more than type allows 32 =
vs 4294966273
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:644 get_meta_and_pte_attr() warn: add some parenthesis here?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c=
:644 get_meta_and_pte_attr() warn: maybe use && instead of &

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Db236e048ec633a35b2a83d663f74c22ef04b9bab
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout b236e048ec633a35b2a83d663f74c22ef04b9bab
vim +678 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  535  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  536  static void get_surf_r=
q_param(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  537  		struct display_mode_=
lib *mode_lib,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  538  		struct _vcs_dpi_disp=
lay_data_rq_sizing_params_st *rq_sizing_param,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  539  		struct _vcs_dpi_disp=
lay_data_rq_dlg_params_st *rq_dlg_param,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  540  		struct _vcs_dpi_disp=
lay_data_rq_misc_params_st *rq_misc_param,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  541  		const struct _vcs_dp=
i_display_pipe_source_params_st pipe_src_param,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  542  		bool is_chroma)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  543  {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  544  	bool mode_422 =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  545  	unsigned int vp_width=
 =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  546  	unsigned int vp_heigh=
t =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  547  	unsigned int data_pit=
ch =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  548  	unsigned int meta_pit=
ch =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  549  	unsigned int ppe =3D =
mode_422 ? 2 : 1;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  550  	bool surf_linear;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  551  	bool surf_vert;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  552  	unsigned int bytes_pe=
r_element;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  553  	unsigned int log2_byt=
es_per_element;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  554  	unsigned int blk256_w=
idth;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  555  	unsigned int blk256_h=
eight;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  556  	unsigned int log2_blk=
256_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  557  	unsigned int log2_blk=
256_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  558  	unsigned int blk_byte=
s;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  559  	unsigned int log2_blk=
_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  560  	unsigned int log2_blk=
_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  561  	unsigned int log2_blk=
_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  562  	unsigned int log2_met=
a_req_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  563  	unsigned int log2_met=
a_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  564  	unsigned int log2_met=
a_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  565  	unsigned int meta_req=
_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  566  	unsigned int meta_req=
_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  567  	unsigned int log2_met=
a_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  568  	unsigned int meta_row=
_width_ub;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  569  	unsigned int log2_met=
a_chunk_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  570  	unsigned int log2_met=
a_chunk_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  571  	unsigned int log2_met=
a_chunk_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  572  	unsigned int log2_min=
_meta_chunk_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  573  	unsigned int min_meta=
_chunk_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  574  	unsigned int meta_chu=
nk_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  575  	unsigned int meta_chu=
nk_per_row_int;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  576  	unsigned int meta_row=
_remainder;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  577  	unsigned int meta_chu=
nk_threshold;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  578  	unsigned int meta_blk=
_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  579  	unsigned int meta_blk=
_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  580  	unsigned int meta_blk=
_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  581  	unsigned int meta_sur=
face_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  582  	unsigned int vmpg_byt=
es;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  583  	unsigned int meta_pte=
_req_per_frame_ub;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  584  	unsigned int meta_pte=
_bytes_per_frame_ub;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  585  	unsigned int log2_vmp=
g_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  586  	unsigned int dpte_buf=
_in_pte_reqs;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  587  	unsigned int log2_vmp=
g_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  588  	unsigned int log2_vmp=
g_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  589  	unsigned int log2_dpt=
e_req_height_ptes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  590  	unsigned int log2_dpt=
e_req_width_ptes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  591  	unsigned int log2_dpt=
e_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  592  	unsigned int log2_dpt=
e_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  593  	unsigned int log2_dpt=
e_row_height_linear;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  594  	unsigned int log2_dpt=
e_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  595  	unsigned int log2_dpt=
e_group_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  596  	unsigned int dpte_row=
_width_ub;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  597  	unsigned int dpte_row=
_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  598  	unsigned int dpte_req=
_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  599  	unsigned int dpte_req=
_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  600  	unsigned int dpte_gro=
up_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  601  	unsigned int log2_dpt=
e_group_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  602  	unsigned int log2_dpt=
e_group_length;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  603  	unsigned int func_met=
a_row_height, func_dpte_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  604  =

dabeea6427dfb03 Qingqing Zhuo       2019-08-22  605  	/* TODO check if ppe =
apply for both luma and chroma in 422 case */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  606  	if (is_chroma) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  607  		vp_width =3D pipe_sr=
c_param.viewport_width_c / ppe;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  608  		vp_height =3D pipe_s=
rc_param.viewport_height_c;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  609  		data_pitch =3D pipe_=
src_param.data_pitch_c;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  610  		meta_pitch =3D pipe_=
src_param.meta_pitch_c;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  611  	} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  612  		vp_width =3D pipe_sr=
c_param.viewport_width / ppe;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  613  		vp_height =3D pipe_s=
rc_param.viewport_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  614  		data_pitch =3D pipe_=
src_param.data_pitch;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  615  		meta_pitch =3D pipe_=
src_param.meta_pitch;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  616  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  617  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  618  	rq_sizing_param->chun=
k_bytes =3D 8192;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  619  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  620  	if (rq_sizing_param->=
chunk_bytes =3D=3D 64 * 1024)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  621  		rq_sizing_param->min=
_chunk_bytes =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  622  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  623  		rq_sizing_param->min=
_chunk_bytes =3D 1024;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  624  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  625  	rq_sizing_param->meta=
_chunk_bytes =3D 2048;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  626  	rq_sizing_param->min_=
meta_chunk_bytes =3D 256;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  627  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  628  	rq_sizing_param->mpte=
_group_bytes =3D 2048;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  629  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  630  	surf_linear =3D (pipe=
_src_param.sw_mode =3D=3D dm_sw_linear);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  631  	surf_vert =3D (pipe_s=
rc_param.source_scan =3D=3D dm_vert);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  632  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  633  	bytes_per_element =3D=
 get_bytes_per_element(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  634  			(enum source_format=
_class) pipe_src_param.source_format,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  635  			is_chroma);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  636  	log2_bytes_per_elemen=
t =3D dml_log2(bytes_per_element);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  637  	blk256_width =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  638  	blk256_height =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  639  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  640  	if (surf_linear) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  641  		blk256_width =3D 256=
 / bytes_per_element;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  642  		blk256_height =3D 1;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  643  	} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  644  		get_blk256_size(&blk=
256_width, &blk256_height, bytes_per_element);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  645  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  646  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  647  	DTRACE("DLG: %s: surf=
_linear        =3D %d", __func__, surf_linear);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  648  	DTRACE("DLG: %s: surf=
_vert          =3D %d", __func__, surf_vert);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  649  	DTRACE("DLG: %s: blk2=
56_width       =3D %d", __func__, blk256_width);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  650  	DTRACE("DLG: %s: blk2=
56_height      =3D %d", __func__, blk256_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  651  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  652  	log2_blk256_width =3D=
 dml_log2((double) blk256_width);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  653  	log2_blk256_height =
=3D dml_log2((double) blk256_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  654  	blk_bytes =3D
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  655  			surf_linear ? 256 :=
 get_blk_size_bytes(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  656  							(enum source_ma=
cro_tile_size) pipe_src_param.macro_tile_size);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  657  	log2_blk_bytes =3D dm=
l_log2((double) blk_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  658  	log2_blk_height =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  659  	log2_blk_width =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  660  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  661  	/* remember log rule
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  662  	 * "+" in log is mult=
iply
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  663  	 * "-" in log is divi=
de
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  664  	 * "/2" is like squar=
e root
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  665  	 * blk is vertical bi=
ased
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  666  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  667  	if (pipe_src_param.sw=
_mode !=3D dm_sw_linear)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  668  		log2_blk_height =3D =
log2_blk256_height
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  669  				+ dml_ceil((double=
) (log2_blk_bytes - 8) / 2.0, 1);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  670  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  671  		log2_blk_height =3D =
0; /* blk height of 1 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  672  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  673  	log2_blk_width =3D lo=
g2_blk_bytes - log2_bytes_per_element - log2_blk_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  674  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  675  	if (!surf_vert) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  676  		rq_dlg_param->swath_=
width_ub =3D dml_round_to_multiple(vp_width - 1, blk256_width, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  677  				+ blk256_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23 @678  		rq_dlg_param->req_pe=
r_swath_ub =3D rq_dlg_param->swath_width_ub >> log2_blk256_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  679  	} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  680  		rq_dlg_param->swath_=
width_ub =3D dml_round_to_multiple(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  681  				vp_height - 1,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  682  				blk256_height,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  683  				1) + blk256_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  684  		rq_dlg_param->req_pe=
r_swath_ub =3D rq_dlg_param->swath_width_ub >> log2_blk256_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  685  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  686  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  687  	if (!surf_vert)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  688  		rq_misc_param->full_=
swath_bytes =3D rq_dlg_param->swath_width_ub * blk256_height
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  689  				* bytes_per_elemen=
t;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  690  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  691  		rq_misc_param->full_=
swath_bytes =3D rq_dlg_param->swath_width_ub * blk256_width
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  692  				* bytes_per_elemen=
t;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  693  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  694  	rq_misc_param->blk256=
_height =3D blk256_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  695  	rq_misc_param->blk256=
_width =3D blk256_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  696  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  697  	/* -------  */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  698  	/* meta     */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  699  	/* -------  */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  700  	log2_meta_req_bytes =
=3D 6; /* meta request is 64b and is 8x8byte meta element */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  701  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  702  	/* each 64b meta requ=
est for dcn is 8x8 meta elements and
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  703  	 * a meta element cov=
ers one 256b block of the the data surface.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  704  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  705  	log2_meta_req_height =
=3D log2_blk256_height + 3; /* meta req is 8x8 byte, each byte represent 1 =
blk256 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  706  	log2_meta_req_width =
=3D log2_meta_req_bytes + 8 - log2_bytes_per_element
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  707  			- log2_meta_req_hei=
ght;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  708  	meta_req_width =3D 1 =
<< log2_meta_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  709  	meta_req_height =3D 1=
 << log2_meta_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  710  	log2_meta_row_height =
=3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  711  	meta_row_width_ub =3D=
 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  712  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  713  	/* the dimensions of =
a meta row are meta_row_width x meta_row_height in elements.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  714  	 * calculate upper bo=
und of the meta_row_width
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  715  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  716  	if (!surf_vert) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  717  		log2_meta_row_height=
 =3D log2_meta_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  718  		meta_row_width_ub =
=3D dml_round_to_multiple(vp_width - 1, meta_req_width, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  719  				+ meta_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  720  		rq_dlg_param->meta_r=
eq_per_row_ub =3D meta_row_width_ub / meta_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  721  	} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  722  		log2_meta_row_height=
 =3D log2_meta_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  723  		meta_row_width_ub =
=3D dml_round_to_multiple(vp_height - 1, meta_req_height, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  724  				+ meta_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  725  		rq_dlg_param->meta_r=
eq_per_row_ub =3D meta_row_width_ub / meta_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  726  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  727  	rq_dlg_param->meta_by=
tes_per_row_ub =3D rq_dlg_param->meta_req_per_row_ub * 64;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  728  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  729  	log2_meta_chunk_bytes=
 =3D dml_log2(rq_sizing_param->meta_chunk_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  730  	log2_meta_chunk_heigh=
t =3D log2_meta_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  731  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  732  	/*full sized meta chu=
nk width in unit of data elements */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  733  	log2_meta_chunk_width=
 =3D log2_meta_chunk_bytes + 8 - log2_bytes_per_element
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  734  			- log2_meta_chunk_h=
eight;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  735  	log2_min_meta_chunk_b=
ytes =3D dml_log2(rq_sizing_param->min_meta_chunk_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  736  	min_meta_chunk_width =
=3D 1
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  737  			<< (log2_min_meta_c=
hunk_bytes + 8 - log2_bytes_per_element
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  738  					- log2_meta_chunk=
_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  739  	meta_chunk_width =3D =
1 << log2_meta_chunk_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  740  	meta_chunk_per_row_in=
t =3D (unsigned int) (meta_row_width_ub / meta_chunk_width);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  741  	meta_row_remainder =
=3D meta_row_width_ub % meta_chunk_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  742  	meta_chunk_threshold =
=3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  743  	meta_blk_bytes =3D 40=
96;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  744  	meta_blk_height =3D b=
lk256_height * 64;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  745  	meta_blk_width =3D me=
ta_blk_bytes * 256 / bytes_per_element / meta_blk_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  746  	meta_surface_bytes =
=3D meta_pitch
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  747  			* (dml_round_to_mul=
tiple(vp_height - 1, meta_blk_height, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  748  					+ meta_blk_height=
) * bytes_per_element / 256;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  749  	vmpg_bytes =3D mode_l=
ib->soc.vmm_page_size_bytes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  750  	meta_pte_req_per_fram=
e_ub =3D (dml_round_to_multiple(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  751  			meta_surface_bytes =
- vmpg_bytes,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  752  			8 * vmpg_bytes,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  753  			1) + 8 * vmpg_bytes=
) / (8 * vmpg_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  754  	meta_pte_bytes_per_fr=
ame_ub =3D meta_pte_req_per_frame_ub * 64; /*64B mpte request */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  755  	rq_dlg_param->meta_pt=
e_bytes_per_frame_ub =3D meta_pte_bytes_per_frame_ub;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  756  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  757  	DTRACE("DLG: %s: meta=
_blk_height             =3D %d", __func__, meta_blk_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  758  	DTRACE("DLG: %s: meta=
_blk_width              =3D %d", __func__, meta_blk_width);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  759  	DTRACE("DLG: %s: meta=
_surface_bytes          =3D %d", __func__, meta_surface_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  760  	DTRACE("DLG: %s: meta=
_pte_req_per_frame_ub   =3D %d", __func__, meta_pte_req_per_frame_ub);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  761  	DTRACE("DLG: %s: meta=
_pte_bytes_per_frame_ub =3D %d", __func__, meta_pte_bytes_per_frame_ub);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  762  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  763  	if (!surf_vert)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  764  		meta_chunk_threshold=
 =3D 2 * min_meta_chunk_width - meta_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  765  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  766  		meta_chunk_threshold=
 =3D 2 * min_meta_chunk_width - meta_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  767  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  768  	if (meta_row_remainde=
r <=3D meta_chunk_threshold)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  769  		rq_dlg_param->meta_c=
hunks_per_row_ub =3D meta_chunk_per_row_int + 1;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  770  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  771  		rq_dlg_param->meta_c=
hunks_per_row_ub =3D meta_chunk_per_row_int + 2;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  772  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  773  	rq_dlg_param->meta_ro=
w_height =3D 1 << log2_meta_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  774  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  775  	/* ------ */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  776  	/* dpte   */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  777  	/* ------ */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  778  	log2_vmpg_bytes =3D d=
ml_log2(mode_lib->soc.vmm_page_size_bytes);
fb57452fb4023a8 Dmytro Laktyushkin  2018-11-08  779  	dpte_buf_in_pte_reqs =
=3D mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  780  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  781  	log2_vmpg_height =3D =
0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  782  	log2_vmpg_width =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  783  	log2_dpte_req_height_=
ptes =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  784  	log2_dpte_req_width_p=
tes =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  785  	log2_dpte_req_height =
=3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  786  	log2_dpte_req_width =
=3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  787  	log2_dpte_row_height_=
linear =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  788  	log2_dpte_row_height =
=3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  789  	log2_dpte_group_width=
 =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  790  	dpte_row_width_ub =3D=
 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  791  	dpte_row_height =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  792  	dpte_req_height =3D 0=
; /* 64b dpte req height in data element */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  793  	dpte_req_width =3D 0;=
 /* 64b dpte req width in data element */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  794  	dpte_group_width =3D =
0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  795  	log2_dpte_group_bytes=
 =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  796  	log2_dpte_group_lengt=
h =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  797  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  798  	if (surf_linear)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  799  		log2_vmpg_height =3D=
 0; /* one line high */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  800  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  801  		log2_vmpg_height =3D=
 (log2_vmpg_bytes - 8) / 2 + log2_blk256_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  802  	log2_vmpg_width =3D l=
og2_vmpg_bytes - log2_bytes_per_element - log2_vmpg_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  803  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  804  	/* only 3 possible sh=
apes for dpte request in dimensions of ptes: 8x1, 4x2, 2x4. */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  805  	if (log2_blk_bytes <=
=3D log2_vmpg_bytes)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  806  		log2_dpte_req_height=
_ptes =3D 0;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  807  	else if (log2_blk_hei=
ght - log2_vmpg_height >=3D 2)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  808  		log2_dpte_req_height=
_ptes =3D 2;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  809  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  810  		log2_dpte_req_height=
_ptes =3D log2_blk_height - log2_vmpg_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  811  	log2_dpte_req_width_p=
tes =3D 3 - log2_dpte_req_height_ptes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  812  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  813  	/* Ensure we only hav=
e the 3 shapes */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  814  	ASSERT((log2_dpte_req=
_width_ptes =3D=3D 3 && log2_dpte_req_height_ptes =3D=3D 0) || /* 8x1 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  815  			(log2_dpte_req_widt=
h_ptes =3D=3D 2 && log2_dpte_req_height_ptes =3D=3D 1) || /* 4x2 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  816  			(log2_dpte_req_widt=
h_ptes =3D=3D 1 && log2_dpte_req_height_ptes =3D=3D 2)); /* 2x4 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  817  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  818  	/* The dpte request d=
imensions in data elements is dpte_req_width x dpte_req_height
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  819  	 * log2_vmpg_width is=
 how much 1 pte represent, now calculating how much a 64b pte req represent
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  820  	 * That depends on th=
e pte shape (i.e. 8x1, 4x2, 2x4)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  821  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  822  	log2_dpte_req_height =
=3D log2_vmpg_height + log2_dpte_req_height_ptes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  823  	log2_dpte_req_width =
=3D log2_vmpg_width + log2_dpte_req_width_ptes;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  824  	dpte_req_height =3D 1=
 << log2_dpte_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  825  	dpte_req_width =3D 1 =
<< log2_dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  826  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  827  	/* calculate pitch dp=
te row buffer can hold
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  828  	 * round the result d=
own to a power of two.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  829  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  830  	if (surf_linear) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  831  		log2_dpte_row_height=
_linear =3D dml_floor(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  832  				dml_log2(dpte_buf_=
in_pte_reqs * dpte_req_width / data_pitch),
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  833  				1);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  834  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  835  		ASSERT(log2_dpte_row=
_height_linear >=3D 3);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  836  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  837  		if (log2_dpte_row_he=
ight_linear > 7)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  838  			log2_dpte_row_heigh=
t_linear =3D 7;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  839  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  840  		log2_dpte_row_height=
 =3D log2_dpte_row_height_linear;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  841  		rq_dlg_param->dpte_r=
ow_height =3D 1 << log2_dpte_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  842  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  843  		/* For linear, the d=
pte row is pitch dependent and the pte requests wrap@the pitch boundary.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  844  		 * the dpte_row_widt=
h_ub is the upper bound of data_pitch*dpte_row_height in elements with this=
 unique buffering.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  845  		 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  846  		dpte_row_width_ub =
=3D dml_round_to_multiple(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  847  				data_pitch * dpte_=
row_height - 1,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  848  				dpte_req_width,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  849  				1) + dpte_req_widt=
h;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  850  		rq_dlg_param->dpte_r=
eq_per_row_ub =3D dpte_row_width_ub / dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  851  	} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  852  		/* for tiled mode, r=
ow height is the same as req height and row store up to vp size upper bound=
 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  853  		if (!surf_vert) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  854  			log2_dpte_row_heigh=
t =3D log2_dpte_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  855  			dpte_row_width_ub =
=3D dml_round_to_multiple(vp_width - 1, dpte_req_width, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  856  					+ dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  857  			rq_dlg_param->dpte_=
req_per_row_ub =3D dpte_row_width_ub / dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  858  		} else {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  859  			log2_dpte_row_heigh=
t =3D
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  860  					(log2_blk_width <=
 log2_dpte_req_width) ?
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  861  							log2_blk_width =
: log2_dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  862  			dpte_row_width_ub =
=3D dml_round_to_multiple(vp_height - 1, dpte_req_height, 1)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  863  					+ dpte_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  864  			rq_dlg_param->dpte_=
req_per_row_ub =3D dpte_row_width_ub / dpte_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  865  		}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  866  		rq_dlg_param->dpte_r=
ow_height =3D 1 << log2_dpte_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  867  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  868  	rq_dlg_param->dpte_by=
tes_per_row_ub =3D rq_dlg_param->dpte_req_per_row_ub * 64;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  869  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  870  	/* From programming g=
uide:
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  871  	 * There is a special=
 case of saving only half of ptes returned due to buffer space limits.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  872  	 * this case applies =
to 4 and 8bpe in horizontal access of a vp_width greater than 2560+16
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  873  	 * when the pte reque=
st is 2x4 ptes (which happens when vmpg_bytes =3D4kb and tile blk_bytes >=
=3D64kb).
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  874  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  875  	if (!surf_vert && vp_=
width > (2560 + 16) && bytes_per_element >=3D 4 && log2_vmpg_bytes =3D=3D 12
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  876  			&& log2_blk_bytes >=
=3D 16) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  877  		log2_dpte_row_height=
 =3D log2_dpte_row_height - 1; /*half of the full height */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  878  		rq_dlg_param->dpte_r=
ow_height =3D 1 << log2_dpte_row_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  879  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  880  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  881  	/* the dpte_group_byt=
es is reduced for the specific case of vertical
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  882  	 * access of a tile s=
urface that has dpte request of 8x1 ptes.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  883  	 */
66f92bcff0f9040 Gustavo A. R. Silva 2019-01-03  884  	if (!surf_linear && (=
log2_dpte_req_height_ptes =3D=3D 0) && surf_vert) /*reduced, in this case, =
will have page fault within a group */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  885  		rq_sizing_param->dpt=
e_group_bytes =3D 512;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  886  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  887  		/*full size */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  888  		rq_sizing_param->dpt=
e_group_bytes =3D 2048;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  889  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  890  	/*since pte request s=
ize is 64byte, the number of data pte requests per full sized group is as f=
ollows.  */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  891  	log2_dpte_group_bytes=
 =3D dml_log2(rq_sizing_param->dpte_group_bytes);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  892  	log2_dpte_group_lengt=
h =3D log2_dpte_group_bytes - 6; /*length in 64b requests  */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  893  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  894  	/* full sized data pt=
e group width in elements */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  895  	if (!surf_vert)
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  896  		log2_dpte_group_widt=
h =3D log2_dpte_group_length + log2_dpte_req_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  897  	else
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  898  		log2_dpte_group_widt=
h =3D log2_dpte_group_length + log2_dpte_req_height;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  899  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  900  	dpte_group_width =3D =
1 << log2_dpte_group_width;
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  901  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  902  	/* since dpte groups =
are only aligned to dpte_req_width and not dpte_group_width,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  903  	 * the upper bound fo=
r the dpte groups per row is as follows.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  904  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  905  	rq_dlg_param->dpte_gr=
oups_per_row_ub =3D dml_ceil(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  906  			(double) dpte_row_w=
idth_ub / dpte_group_width,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  907  			1);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  908  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  909  	dml1_rq_dlg_get_row_h=
eights(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  910  			mode_lib,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  911  			&func_dpte_row_heig=
ht,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  912  			&func_meta_row_heig=
ht,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  913  			vp_width,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  914  			data_pitch,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  915  			pipe_src_param.sour=
ce_format,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  916  			pipe_src_param.sw_m=
ode,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  917  			pipe_src_param.macr=
o_tile_size,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  918  			pipe_src_param.sour=
ce_scan,
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  919  			is_chroma);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  920  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  921  	/* Just a check to ma=
ke sure this function and the new one give the same
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  922  	 * result. The standa=
lone get_row_heights() function is based off of the
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  923  	 * code in this funct=
ion so the same changes need to be made to both.
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  924  	 */
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  925  	if (rq_dlg_param->met=
a_row_height !=3D func_meta_row_height) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  926  		DTRACE(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  927  				"MISMATCH: rq_dlg_=
param->meta_row_height =3D %d",
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  928  				rq_dlg_param->meta=
_row_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  929  		DTRACE("MISMATCH: fu=
nc_meta_row_height =3D %d", func_meta_row_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  930  		ASSERT(0);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  931  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  932  =

6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  933  	if (rq_dlg_param->dpt=
e_row_height !=3D func_dpte_row_height) {
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  934  		DTRACE(
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  935  				"MISMATCH: rq_dlg_=
param->dpte_row_height =3D %d",
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  936  				rq_dlg_param->dpte=
_row_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  937  		DTRACE("MISMATCH: fu=
nc_dpte_row_height =3D %d", func_dpte_row_height);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  938  		ASSERT(0);
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  939  	}
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  940  }
6d04ee9dc10149d Dmytro Laktyushkin  2017-08-23  941  =


:::::: The code at line 678 was first introduced by commit
:::::: 6d04ee9dc10149db842d41de66eca201c9d91b60 drm/amd/display: Restructur=
ing and cleaning up DML

:::::: TO: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8031294579688026655==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
j32oesrJcxZFKPO78/8AeeX3LWv6AQA=
--===============8031294579688026655==--

