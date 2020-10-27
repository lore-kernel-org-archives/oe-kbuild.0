Content-Type: multipart/mixed; boundary="===============1201911694170276359=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/display/dc/core/dc.c:2325:43: warning: Either the condition 'if(stream&&should_use_dmub_lock(stream->link))' is redundant or there is possible null pointer dereference: stream.
Date: Tue, 27 Oct 2020 09:44:20 +0800
Message-ID: <202010270913.4uZ7eUy9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1201911694170276359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Wyatt Wood <wyatt.wood@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Anthony Koo <Anthony.Koo@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: dc6e2448558d68a5b87f42ab6df1691be41f5857 drm/amd/display: Use dmub =
fw to lock pipe, cursor, dig
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:
>> drivers/gpu/drm/amd/display/dc/core/dc.c:2325:43: warning: Either the co=
ndition 'if(stream&&should_use_dmub_lock(stream->link))' is redundant or th=
ere is possible null pointer dereference: stream. [nullPointerRedundantChec=
k]
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
                                             ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2327:7: note: Assuming that con=
dition 'if(stream&&should_use_dmub_lock(stream->link))' is not redundant
      if (stream && should_use_dmub_lock(stream->link)) {
         ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2325:43: note: Null pointer der=
eference
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
                                             ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2500:43: warning: Either the co=
ndition 'if(stream&&should_use_dmub_lock(stream->link))' is redundant or th=
ere is possible null pointer dereference: stream. [nullPointerRedundantChec=
k]
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
                                             ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2512:7: note: Assuming that con=
dition 'if(stream&&should_use_dmub_lock(stream->link))' is not redundant
      if (stream && should_use_dmub_lock(stream->link)) {
         ^
   drivers/gpu/drm/amd/display/dc/core/dc.c:2500:43: note: Null pointer der=
eference
    if ((update_type !=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.ds=
c_changed)
                                             ^

vim +2325 drivers/gpu/drm/amd/display/dc/core/dc.c

1e7e86c43f38d2 Samson Tam            2018-05-01  2281  =

bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2282  static void commit_p=
lanes_for_stream(struct dc *dc,
bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2283  		struct dc_surface_=
update *srf_updates,
bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2284  		int surface_count,
0971c40e180696 Harry Wentland        2017-07-27  2285  		struct dc_stream_s=
tate *stream,
bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2286  		struct dc_stream_u=
pdate *stream_update,
bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2287  		enum surface_updat=
e_type update_type,
bc6828e0e6b6c5 Bhawanpreet Lakha     2017-09-12  2288  		struct dc_state *c=
ontext)
e72f0acd369d3d Tony Cheng            2017-01-19  2289  {
e72f0acd369d3d Tony Cheng            2017-01-19  2290  	int i, j;
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2291  	struct pipe_ctx *to=
p_pipe_to_program =3D NULL;
e72f0acd369d3d Tony Cheng            2017-01-19  2292  =

ccce745c28d6cc Martin Leung          2019-11-21  2293  	if (dc->optimize_se=
amless_boot_streams > 0 && surface_count > 0) {
46570f090469c8 Anthony Koo           2019-02-08  2294  		/* Optimize seamle=
ss boot flag keeps clocks and watermarks high until
46570f090469c8 Anthony Koo           2019-02-08  2295  		 * first flip. Aft=
er first flip, optimization is required to lower
4cd75ff096f4ef Anthony Koo           2019-04-12  2296  		 * bandwidth. Impo=
rtant to note that it is expected UEFI will
4cd75ff096f4ef Anthony Koo           2019-04-12  2297  		 * only light up a=
 single display on POST, therefore we only expect
4cd75ff096f4ef Anthony Koo           2019-04-12  2298  		 * one stream with=
 seamless boot flag set.
46570f090469c8 Anthony Koo           2019-02-08  2299  		 */
4cd75ff096f4ef Anthony Koo           2019-04-12  2300  		if (stream->apply_=
seamless_boot_optimization) {
4cd75ff096f4ef Anthony Koo           2019-04-12  2301  			stream->apply_sea=
mless_boot_optimization =3D false;
ccce745c28d6cc Martin Leung          2019-11-21  2302  			dc->optimize_seam=
less_boot_streams--;
ccce745c28d6cc Martin Leung          2019-11-21  2303  =

ccce745c28d6cc Martin Leung          2019-11-21  2304  			if (dc->optimize_=
seamless_boot_streams =3D=3D 0)
0aa63a333ddf39 Yongqiang Sun         2020-03-05  2305  				dc->optimized_re=
quired =3D true;
46570f090469c8 Anthony Koo           2019-02-08  2306  		}
4cd75ff096f4ef Anthony Koo           2019-04-12  2307  	}
46570f090469c8 Anthony Koo           2019-02-08  2308  =

ccce745c28d6cc Martin Leung          2019-11-21  2309  	if (update_type =3D=
=3D UPDATE_TYPE_FULL && dc->optimize_seamless_boot_streams =3D=3D 0) {
9566b67586fb1d Dmytro Laktyushkin    2018-09-18  2310  		dc->hwss.prepare_b=
andwidth(dc, context);
c9742685c24acd Dmytro Laktyushkin    2017-06-07  2311  		context_clock_trac=
e(dc, context);
8748068764e7a5 Eric Yang             2017-07-23  2312  	}
8748068764e7a5 Eric Yang             2017-07-23  2313  =

009114f6df8415 Anthony Koo           2020-01-14  2314  	for (j =3D 0; j < d=
c->res_pool->pipe_count; j++) {
009114f6df8415 Anthony Koo           2020-01-14  2315  		struct pipe_ctx *p=
ipe_ctx =3D &context->res_ctx.pipe_ctx[j];
009114f6df8415 Anthony Koo           2020-01-14  2316  =

009114f6df8415 Anthony Koo           2020-01-14  2317  		if (!pipe_ctx->top=
_pipe &&
009114f6df8415 Anthony Koo           2020-01-14  2318  			!pipe_ctx->prev_o=
dm_pipe &&
009114f6df8415 Anthony Koo           2020-01-14  2319  			pipe_ctx->stream =
&&
009114f6df8415 Anthony Koo           2020-01-14  2320  			pipe_ctx->stream =
=3D=3D stream) {
009114f6df8415 Anthony Koo           2020-01-14  2321  			top_pipe_to_progr=
am =3D pipe_ctx;
009114f6df8415 Anthony Koo           2020-01-14  2322  		}
009114f6df8415 Anthony Koo           2020-01-14  2323  	}
009114f6df8415 Anthony Koo           2020-01-14  2324  =

71b81f1275e0b5 Wenjing Liu           2020-01-22 @2325  	if ((update_type !=
=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
dc6e2448558d68 Wyatt Wood            2020-05-27  2326  		if (top_pipe_to_pr=
ogram->stream_res.tg->funcs->lock_doublebuffer_enable) {
dc6e2448558d68 Wyatt Wood            2020-05-27  2327  			if (stream && sho=
uld_use_dmub_lock(stream->link)) {
dc6e2448558d68 Wyatt Wood            2020-05-27  2328  				union dmub_hw_lo=
ck_flags hw_locks =3D { 0 };
dc6e2448558d68 Wyatt Wood            2020-05-27  2329  				struct dmub_hw_l=
ock_inst_flags inst_flags =3D { 0 };
dc6e2448558d68 Wyatt Wood            2020-05-27  2330  =

dc6e2448558d68 Wyatt Wood            2020-05-27  2331  				hw_locks.bits.lo=
ck_dig =3D 1;
dc6e2448558d68 Wyatt Wood            2020-05-27  2332  				inst_flags.dig_i=
nst =3D top_pipe_to_program->stream_res.tg->inst;
dc6e2448558d68 Wyatt Wood            2020-05-27  2333  =

dc6e2448558d68 Wyatt Wood            2020-05-27  2334  				dmub_hw_lock_mgr=
_cmd(dc->ctx->dmub_srv,
dc6e2448558d68 Wyatt Wood            2020-05-27  2335  							true,
dc6e2448558d68 Wyatt Wood            2020-05-27  2336  							&hw_locks,
dc6e2448558d68 Wyatt Wood            2020-05-27  2337  							&inst_flags);
dc6e2448558d68 Wyatt Wood            2020-05-27  2338  			} else
71b81f1275e0b5 Wenjing Liu           2020-01-22  2339  				top_pipe_to_prog=
ram->stream_res.tg->funcs->lock_doublebuffer_enable(
71b81f1275e0b5 Wenjing Liu           2020-01-22  2340  						top_pipe_to_pr=
ogram->stream_res.tg);
dc6e2448558d68 Wyatt Wood            2020-05-27  2341  		}
71b81f1275e0b5 Wenjing Liu           2020-01-22  2342  =

009114f6df8415 Anthony Koo           2020-01-14  2343  	if ((update_type !=
=3D UPDATE_TYPE_FAST) && dc->hwss.interdependent_update_lock)
009114f6df8415 Anthony Koo           2020-01-14  2344  		dc->hwss.interdepe=
ndent_update_lock(dc, context, true);
009114f6df8415 Anthony Koo           2020-01-14  2345  	else
009114f6df8415 Anthony Koo           2020-01-14  2346  		/* Lock the top pi=
pe while updating plane addrs, since freesync requires
009114f6df8415 Anthony Koo           2020-01-14  2347  		 *  plane addr upd=
ate event triggers to be synchronized.
009114f6df8415 Anthony Koo           2020-01-14  2348  		 *  top_pipe_to_pr=
ogram is expected to never be NULL
009114f6df8415 Anthony Koo           2020-01-14  2349  		 */
009114f6df8415 Anthony Koo           2020-01-14  2350  		dc->hwss.pipe_cont=
rol_lock(dc, top_pipe_to_program, true);
009114f6df8415 Anthony Koo           2020-01-14  2351  =

009114f6df8415 Anthony Koo           2020-01-14  2352  =

1e7e86c43f38d2 Samson Tam            2018-05-01  2353  	// Stream updates
1e7e86c43f38d2 Samson Tam            2018-05-01  2354  	if (stream_update)
1e7e86c43f38d2 Samson Tam            2018-05-01  2355  		commit_planes_do_s=
tream_update(dc, stream, stream_update, update_type, context);
1e7e86c43f38d2 Samson Tam            2018-05-01  2356  =

671a6246e0d365 Yongqiang Sun         2017-09-22  2357  	if (surface_count =
=3D=3D 0) {
671a6246e0d365 Yongqiang Sun         2017-09-22  2358  		/*
671a6246e0d365 Yongqiang Sun         2017-09-22  2359  		 * In case of turn=
ing off screen, no need to program front end a second time.
1e7e86c43f38d2 Samson Tam            2018-05-01  2360  		 * just return aft=
er program blank.
671a6246e0d365 Yongqiang Sun         2017-09-22  2361  		 */
b6e881c947417e Dmytro Laktyushkin    2019-09-13  2362  		if (dc->hwss.apply=
_ctx_for_surface)
1e7e86c43f38d2 Samson Tam            2018-05-01  2363  			dc->hwss.apply_ct=
x_for_surface(dc, stream, 0, context);
b6e881c947417e Dmytro Laktyushkin    2019-09-13  2364  		if (dc->hwss.progr=
am_front_end_for_ctx)
b6e881c947417e Dmytro Laktyushkin    2019-09-13  2365  			dc->hwss.program_=
front_end_for_ctx(dc, context);
b6e881c947417e Dmytro Laktyushkin    2019-09-13  2366  =

009114f6df8415 Anthony Koo           2020-01-14  2367  		if ((update_type !=
=3D UPDATE_TYPE_FAST) && dc->hwss.interdependent_update_lock)
009114f6df8415 Anthony Koo           2020-01-14  2368  			dc->hwss.interdep=
endent_update_lock(dc, context, false);
009114f6df8415 Anthony Koo           2020-01-14  2369  		else
009114f6df8415 Anthony Koo           2020-01-14  2370  			dc->hwss.pipe_con=
trol_lock(dc, top_pipe_to_program, false);
009114f6df8415 Anthony Koo           2020-01-14  2371  =

bbf5f6c3f83bed Anthony Koo           2020-01-14  2372  		dc->hwss.post_unlo=
ck_program_front_end(dc, context);
671a6246e0d365 Yongqiang Sun         2017-09-22  2373  		return;
671a6246e0d365 Yongqiang Sun         2017-09-22  2374  	}
4562236b3bc0a2 Harry Wentland        2017-09-12  2375  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2376  	if (!IS_DIAG_DC(dc-=
>ctx->dce_environment)) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2377  		for (i =3D 0; i < =
surface_count; i++) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2378  			struct dc_plane_s=
tate *plane_state =3D srf_updates[i].surface;
6fbefb84a98ecc Harry Wentland        2019-02-22  2379  			/*set logical fla=
g for lock/unlock use*/
6fbefb84a98ecc Harry Wentland        2019-02-22  2380  			for (j =3D 0; j <=
 dc->res_pool->pipe_count; j++) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2381  				struct pipe_ctx =
*pipe_ctx =3D &context->res_ctx.pipe_ctx[j];
6fbefb84a98ecc Harry Wentland        2019-02-22  2382  				if (!pipe_ctx->p=
lane_state)
6fbefb84a98ecc Harry Wentland        2019-02-22  2383  					continue;
6fbefb84a98ecc Harry Wentland        2019-02-22  2384  				if (pipe_ctx->pl=
ane_state !=3D plane_state)
6fbefb84a98ecc Harry Wentland        2019-02-22  2385  					continue;
6fbefb84a98ecc Harry Wentland        2019-02-22  2386  				plane_state->tri=
plebuffer_flips =3D false;
6fbefb84a98ecc Harry Wentland        2019-02-22  2387  				if (update_type =
=3D=3D UPDATE_TYPE_FAST &&
6fbefb84a98ecc Harry Wentland        2019-02-22  2388  					dc->hwss.progra=
m_triplebuffer !=3D NULL &&
6fbefb84a98ecc Harry Wentland        2019-02-22  2389  					!plane_state->f=
lip_immediate &&
6fbefb84a98ecc Harry Wentland        2019-02-22  2390  					!dc->debug.disa=
ble_tri_buf) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2391  						/*triple buffe=
r for VUpdate  only*/
6fbefb84a98ecc Harry Wentland        2019-02-22  2392  						plane_state->t=
riplebuffer_flips =3D true;
6fbefb84a98ecc Harry Wentland        2019-02-22  2393  				}
6fbefb84a98ecc Harry Wentland        2019-02-22  2394  			}
6fbefb84a98ecc Harry Wentland        2019-02-22  2395  		}
6fbefb84a98ecc Harry Wentland        2019-02-22  2396  	}
6fbefb84a98ecc Harry Wentland        2019-02-22  2397  =

1e7e86c43f38d2 Samson Tam            2018-05-01  2398  	// Update Type FULL=
, Surface updates
156590454259a1 Bhawanpreet Lakha     2017-08-23  2399  	for (j =3D 0; j < d=
c->res_pool->pipe_count; j++) {
f19d5f3520d67c Dmytro Laktyushkin    2017-06-13  2400  		struct pipe_ctx *p=
ipe_ctx =3D &context->res_ctx.pipe_ctx[j];
3e9ad6164b98f8 Eric Yang             2017-08-03  2401  =

e6c258cb4e6fbc Yongqiang Sun         2017-10-30  2402  		if (!pipe_ctx->top=
_pipe &&
285e30049708c4 Dmytro Laktyushkin    2019-08-06  2403  			!pipe_ctx->prev_o=
dm_pipe &&
e6c258cb4e6fbc Yongqiang Sun         2017-10-30  2404  			pipe_ctx->stream =
&&
e6c258cb4e6fbc Yongqiang Sun         2017-10-30  2405  			pipe_ctx->stream =
=3D=3D stream) {
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2406  			struct dc_stream_=
status *stream_status =3D NULL;
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2407  =

98e6436d3af5fe Anthony Koo           2018-08-21  2408  			if (!pipe_ctx->pl=
ane_state)
98e6436d3af5fe Anthony Koo           2018-08-21  2409  				continue;
98e6436d3af5fe Anthony Koo           2018-08-21  2410  =

98e6436d3af5fe Anthony Koo           2018-08-21  2411  			/* Full fe update=
*/
98e6436d3af5fe Anthony Koo           2018-08-21  2412  			if (update_type =
=3D=3D UPDATE_TYPE_FAST)
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2413  				continue;
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2414  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2415  			ASSERT(!pipe_ctx-=
>plane_state->triplebuffer_flips);
6fbefb84a98ecc Harry Wentland        2019-02-22  2416  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2417  			if (dc->hwss.prog=
ram_triplebuffer !=3D NULL &&
6fbefb84a98ecc Harry Wentland        2019-02-22  2418  				!dc->debug.disab=
le_tri_buf) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2419  				/*turn off tripl=
e buffer for full update*/
6fbefb84a98ecc Harry Wentland        2019-02-22  2420  				dc->hwss.program=
_triplebuffer(
6fbefb84a98ecc Harry Wentland        2019-02-22  2421  					dc, pipe_ctx, p=
ipe_ctx->plane_state->triplebuffer_flips);
6fbefb84a98ecc Harry Wentland        2019-02-22  2422  			}
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2423  			stream_status =3D
e6c258cb4e6fbc Yongqiang Sun         2017-10-30  2424  				stream_get_statu=
s(context, pipe_ctx->stream);
3e9ad6164b98f8 Eric Yang             2017-08-03  2425  =

b6e881c947417e Dmytro Laktyushkin    2019-09-13  2426  			if (dc->hwss.appl=
y_ctx_for_surface)
156590454259a1 Bhawanpreet Lakha     2017-08-23  2427  				dc->hwss.apply_c=
tx_for_surface(
156590454259a1 Bhawanpreet Lakha     2017-08-23  2428  					dc, pipe_ctx->s=
tream, stream_status->plane_count, context);
3e9ad6164b98f8 Eric Yang             2017-08-03  2429  		}
f19d5f3520d67c Dmytro Laktyushkin    2017-06-13  2430  	}
b9fe5151052f9d Jaehyun Chung         2019-10-31  2431  	if (dc->hwss.progra=
m_front_end_for_ctx && update_type !=3D UPDATE_TYPE_FAST) {
b6e881c947417e Dmytro Laktyushkin    2019-09-13  2432  		dc->hwss.program_f=
ront_end_for_ctx(dc, context);
a4cea11655fbc5 Jaehyun Chung         2019-11-07  2433  #ifdef CONFIG_DRM_AM=
D_DC_DCN
b9fe5151052f9d Jaehyun Chung         2019-10-31  2434  		if (dc->debug.vali=
date_dml_output) {
b9fe5151052f9d Jaehyun Chung         2019-10-31  2435  			for (i =3D 0; i <=
 dc->res_pool->pipe_count; i++) {
b9fe5151052f9d Jaehyun Chung         2019-10-31  2436  				struct pipe_ctx =
cur_pipe =3D context->res_ctx.pipe_ctx[i];
b9fe5151052f9d Jaehyun Chung         2019-10-31  2437  				if (cur_pipe.str=
eam =3D=3D NULL)
b9fe5151052f9d Jaehyun Chung         2019-10-31  2438  					continue;
b9fe5151052f9d Jaehyun Chung         2019-10-31  2439  =

b9fe5151052f9d Jaehyun Chung         2019-10-31  2440  				cur_pipe.plane_r=
es.hubp->funcs->validate_dml_output(
b9fe5151052f9d Jaehyun Chung         2019-10-31  2441  						cur_pipe.plane=
_res.hubp, dc->ctx,
b9fe5151052f9d Jaehyun Chung         2019-10-31  2442  						&context->res_=
ctx.pipe_ctx[i].rq_regs,
b9fe5151052f9d Jaehyun Chung         2019-10-31  2443  						&context->res_=
ctx.pipe_ctx[i].dlg_regs,
b9fe5151052f9d Jaehyun Chung         2019-10-31  2444  						&context->res_=
ctx.pipe_ctx[i].ttu_regs);
b9fe5151052f9d Jaehyun Chung         2019-10-31  2445  			}
b9fe5151052f9d Jaehyun Chung         2019-10-31  2446  		}
b9fe5151052f9d Jaehyun Chung         2019-10-31  2447  #endif
b9fe5151052f9d Jaehyun Chung         2019-10-31  2448  	}
f19d5f3520d67c Dmytro Laktyushkin    2017-06-13  2449  =

1e7e86c43f38d2 Samson Tam            2018-05-01  2450  	// Update Type FAST=
, Surface updates
1e7e86c43f38d2 Samson Tam            2018-05-01  2451  	if (update_type =3D=
=3D UPDATE_TYPE_FAST) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2452  		if (dc->hwss.set_f=
lip_control_gsl)
00f02019990d90 Leon Elazar           2017-03-17  2453  			for (i =3D 0; i <=
 surface_count; i++) {
3be5262e353b8a Harry Wentland        2017-07-27  2454  				struct dc_plane_=
state *plane_state =3D srf_updates[i].surface;
00f02019990d90 Leon Elazar           2017-03-17  2455  =

156590454259a1 Bhawanpreet Lakha     2017-08-23  2456  				for (j =3D 0; j =
< dc->res_pool->pipe_count; j++) {
00f02019990d90 Leon Elazar           2017-03-17  2457  					struct pipe_ctx=
 *pipe_ctx =3D &context->res_ctx.pipe_ctx[j];
00f02019990d90 Leon Elazar           2017-03-17  2458  =

b8fce2c9d773e1 Yongqiang Sun         2017-11-07  2459  					if (pipe_ctx->s=
tream !=3D stream)
b8fce2c9d773e1 Yongqiang Sun         2017-11-07  2460  						continue;
b8fce2c9d773e1 Yongqiang Sun         2017-11-07  2461  =

3be5262e353b8a Harry Wentland        2017-07-27  2462  					if (pipe_ctx->p=
lane_state !=3D plane_state)
00f02019990d90 Leon Elazar           2017-03-17  2463  						continue;
e72f0acd369d3d Tony Cheng            2017-01-19  2464  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2465  					// GSL has to b=
e used for flip immediate
6fbefb84a98ecc Harry Wentland        2019-02-22  2466  					dc->hwss.set_fl=
ip_control_gsl(pipe_ctx,
6fbefb84a98ecc Harry Wentland        2019-02-22  2467  							plane_state->=
flip_immediate);
6fbefb84a98ecc Harry Wentland        2019-02-22  2468  				}
6fbefb84a98ecc Harry Wentland        2019-02-22  2469  			}
6fbefb84a98ecc Harry Wentland        2019-02-22  2470  		/* Perform request=
ed Updates */
6fbefb84a98ecc Harry Wentland        2019-02-22  2471  		for (i =3D 0; i < =
surface_count; i++) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2472  			struct dc_plane_s=
tate *plane_state =3D srf_updates[i].surface;
6fbefb84a98ecc Harry Wentland        2019-02-22  2473  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2474  			for (j =3D 0; j <=
 dc->res_pool->pipe_count; j++) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2475  				struct pipe_ctx =
*pipe_ctx =3D &context->res_ctx.pipe_ctx[j];
6fbefb84a98ecc Harry Wentland        2019-02-22  2476  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2477  				if (pipe_ctx->st=
ream !=3D stream)
6fbefb84a98ecc Harry Wentland        2019-02-22  2478  					continue;
6fbefb84a98ecc Harry Wentland        2019-02-22  2479  =

6fbefb84a98ecc Harry Wentland        2019-02-22  2480  				if (pipe_ctx->pl=
ane_state !=3D plane_state)
6fbefb84a98ecc Harry Wentland        2019-02-22  2481  					continue;
6fbefb84a98ecc Harry Wentland        2019-02-22  2482  				/*program triple=
 buffer after lock based on flip type*/
6fbefb84a98ecc Harry Wentland        2019-02-22  2483  				if (dc->hwss.pro=
gram_triplebuffer !=3D NULL &&
6fbefb84a98ecc Harry Wentland        2019-02-22  2484  					!dc->debug.disa=
ble_tri_buf) {
6fbefb84a98ecc Harry Wentland        2019-02-22  2485  					/*only enable t=
riplebuffer for  fast_update*/
6fbefb84a98ecc Harry Wentland        2019-02-22  2486  					dc->hwss.progra=
m_triplebuffer(
6fbefb84a98ecc Harry Wentland        2019-02-22  2487  						dc, pipe_ctx, =
plane_state->triplebuffer_flips);
6fbefb84a98ecc Harry Wentland        2019-02-22  2488  				}
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2489  				if (srf_updates[=
i].flip_addr)
156590454259a1 Bhawanpreet Lakha     2017-08-23  2490  					dc->hwss.update=
_plane_addr(dc, pipe_ctx);
56ef6ed9faf35b Anthony Koo           2017-10-23  2491  			}
56ef6ed9faf35b Anthony Koo           2017-10-23  2492  		}
009114f6df8415 Anthony Koo           2020-01-14  2493  	}
56ef6ed9faf35b Anthony Koo           2017-10-23  2494  =

009114f6df8415 Anthony Koo           2020-01-14  2495  	if ((update_type !=
=3D UPDATE_TYPE_FAST) && dc->hwss.interdependent_update_lock)
009114f6df8415 Anthony Koo           2020-01-14  2496  		dc->hwss.interdepe=
ndent_update_lock(dc, context, false);
009114f6df8415 Anthony Koo           2020-01-14  2497  	else
05133ac856d078 SivapiriyanKumarasamy 2018-01-04  2498  		dc->hwss.pipe_cont=
rol_lock(dc, top_pipe_to_program, false);
e63e2491ad9203 Eryk Brol             2019-04-23  2499  =

71b81f1275e0b5 Wenjing Liu           2020-01-22  2500  	if ((update_type !=
=3D UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
71b81f1275e0b5 Wenjing Liu           2020-01-22  2501  		if (top_pipe_to_pr=
ogram->stream_res.tg->funcs->lock_doublebuffer_enable) {
71b81f1275e0b5 Wenjing Liu           2020-01-22  2502  			top_pipe_to_progr=
am->stream_res.tg->funcs->wait_for_state(
71b81f1275e0b5 Wenjing Liu           2020-01-22  2503  					top_pipe_to_pro=
gram->stream_res.tg,
71b81f1275e0b5 Wenjing Liu           2020-01-22  2504  					CRTC_STATE_VACT=
IVE);
71b81f1275e0b5 Wenjing Liu           2020-01-22  2505  			top_pipe_to_progr=
am->stream_res.tg->funcs->wait_for_state(
71b81f1275e0b5 Wenjing Liu           2020-01-22  2506  					top_pipe_to_pro=
gram->stream_res.tg,
71b81f1275e0b5 Wenjing Liu           2020-01-22  2507  					CRTC_STATE_VBLA=
NK);
71b81f1275e0b5 Wenjing Liu           2020-01-22  2508  			top_pipe_to_progr=
am->stream_res.tg->funcs->wait_for_state(
71b81f1275e0b5 Wenjing Liu           2020-01-22  2509  					top_pipe_to_pro=
gram->stream_res.tg,
71b81f1275e0b5 Wenjing Liu           2020-01-22  2510  					CRTC_STATE_VACT=
IVE);
dc6e2448558d68 Wyatt Wood            2020-05-27  2511  =

dc6e2448558d68 Wyatt Wood            2020-05-27  2512  			if (stream && sho=
uld_use_dmub_lock(stream->link)) {
dc6e2448558d68 Wyatt Wood            2020-05-27  2513  				union dmub_hw_lo=
ck_flags hw_locks =3D { 0 };
dc6e2448558d68 Wyatt Wood            2020-05-27  2514  				struct dmub_hw_l=
ock_inst_flags inst_flags =3D { 0 };
dc6e2448558d68 Wyatt Wood            2020-05-27  2515  =

dc6e2448558d68 Wyatt Wood            2020-05-27  2516  				hw_locks.bits.lo=
ck_dig =3D 1;
dc6e2448558d68 Wyatt Wood            2020-05-27  2517  				inst_flags.dig_i=
nst =3D top_pipe_to_program->stream_res.tg->inst;
dc6e2448558d68 Wyatt Wood            2020-05-27  2518  =

dc6e2448558d68 Wyatt Wood            2020-05-27  2519  				dmub_hw_lock_mgr=
_cmd(dc->ctx->dmub_srv,
dc6e2448558d68 Wyatt Wood            2020-05-27  2520  							false,
dc6e2448558d68 Wyatt Wood            2020-05-27  2521  							&hw_locks,
dc6e2448558d68 Wyatt Wood            2020-05-27  2522  							&inst_flags);
dc6e2448558d68 Wyatt Wood            2020-05-27  2523  			} else
71b81f1275e0b5 Wenjing Liu           2020-01-22  2524  				top_pipe_to_prog=
ram->stream_res.tg->funcs->lock_doublebuffer_disable(
71b81f1275e0b5 Wenjing Liu           2020-01-22  2525  					top_pipe_to_pro=
gram->stream_res.tg);
71b81f1275e0b5 Wenjing Liu           2020-01-22  2526  		}
71b81f1275e0b5 Wenjing Liu           2020-01-22  2527  =

bbf5f6c3f83bed Anthony Koo           2020-01-14  2528  	if (update_type !=
=3D UPDATE_TYPE_FAST)
bbf5f6c3f83bed Anthony Koo           2020-01-14  2529  		dc->hwss.post_unlo=
ck_program_front_end(dc, context);
bbf5f6c3f83bed Anthony Koo           2020-01-14  2530  =

4fd334122399a1 Aric Cyr              2019-05-16  2531  	// Fire manual trig=
ger only when bottom plane is flipped
4fd334122399a1 Aric Cyr              2019-05-16  2532  	for (j =3D 0; j < d=
c->res_pool->pipe_count; j++) {
4fd334122399a1 Aric Cyr              2019-05-16  2533  		struct pipe_ctx *p=
ipe_ctx =3D &context->res_ctx.pipe_ctx[j];
e63e2491ad9203 Eryk Brol             2019-04-23  2534  =

4fd334122399a1 Aric Cyr              2019-05-16  2535  		if (pipe_ctx->bott=
om_pipe ||
e63e2491ad9203 Eryk Brol             2019-04-23  2536  				!pipe_ctx->strea=
m ||
e63e2491ad9203 Eryk Brol             2019-04-23  2537  				pipe_ctx->stream=
 !=3D stream ||
4fd334122399a1 Aric Cyr              2019-05-16  2538  				!pipe_ctx->plane=
_state->update_flags.bits.addr_update)
e63e2491ad9203 Eryk Brol             2019-04-23  2539  			continue;
e63e2491ad9203 Eryk Brol             2019-04-23  2540  =

e63e2491ad9203 Eryk Brol             2019-04-23  2541  		if (pipe_ctx->stre=
am_res.tg->funcs->program_manual_trigger)
e63e2491ad9203 Eryk Brol             2019-04-23  2542  			pipe_ctx->stream_=
res.tg->funcs->program_manual_trigger(pipe_ctx->stream_res.tg);
e63e2491ad9203 Eryk Brol             2019-04-23  2543  	}
4562236b3bc0a2 Harry Wentland        2017-09-12  2544  }
4562236b3bc0a2 Harry Wentland        2017-09-12  2545  =


:::::: The code at line 2325 was first introduced by commit
:::::: 71b81f1275e0b5713fae86004be72719a2fa73b7 drm/amd/display: decouple g=
lobal lock out of pipe control lock

:::::: TO: Wenjing Liu <Wenjing.Liu@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1201911694170276359==--

