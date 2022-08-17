Content-Type: multipart/mixed; boundary="===============0495283536407384977=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:395 dc_stream_set_cursor_position() warn: variable dereferenced before check 'stream' (see line 392)
Date: Wed, 17 Aug 2022 17:15:08 +0800
Message-ID: <202208171701.gFan3WQE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0495283536407384977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alvin Lee <Alvin.Lee2@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Samson Tam <Samson.Tam@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3cc40a443a04d52b0c95255dce264068b01e9bfe
commit: a141d2083b462505727e14d98db5fc3cd43d59c6 drm/amd/display: Add debug=
 option for exiting idle optimizations on cursor updates
date:   9 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 weeks ago
config: ia64-randconfig-m031-20220814 (https://download.01.org/0day-ci/arch=
ive/20220817/202208171701.gFan3WQE-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:395 dc_stream_set=
_cursor_position() warn: variable dereferenced before check 'stream' (see l=
ine 392)

vim +/stream +395 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c

ab2541b6739508 Aric Cyr            2016-12-29  387  =

ab2541b6739508 Aric Cyr            2016-12-29  388  bool dc_stream_set_curs=
or_position(
0971c40e180696 Harry Wentland      2017-07-27  389  	struct dc_stream_state=
 *stream,
beb16b6a0f921f Dmytro Laktyushkin  2017-04-21  390  	const struct dc_cursor=
_position *position)
ab2541b6739508 Aric Cyr            2016-12-29  391  {
a141d2083b4625 Alvin Lee           2022-06-03 @392  	struct dc  *dc =3D str=
eam->ctx->dc;
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  393  	bool reset_idle_optimi=
zations =3D false;
ab2541b6739508 Aric Cyr            2016-12-29  394  =

4fa086b9b66408 Leo (Sunpeng  Li    2017-07-25 @395) 	if (NULL =3D=3D stream=
) {
ab2541b6739508 Aric Cyr            2016-12-29  396  		dm_error("DC: dc_stre=
am is NULL!\n");
ab2541b6739508 Aric Cyr            2016-12-29  397  		return false;
ab2541b6739508 Aric Cyr            2016-12-29  398  	}
ab2541b6739508 Aric Cyr            2016-12-29  399  =

ab2541b6739508 Aric Cyr            2016-12-29  400  	if (NULL =3D=3D positi=
on) {
ab2541b6739508 Aric Cyr            2016-12-29  401  		dm_error("DC: cursor =
position is NULL!\n");
ab2541b6739508 Aric Cyr            2016-12-29  402  		return false;
ab2541b6739508 Aric Cyr            2016-12-29  403  	}
ab2541b6739508 Aric Cyr            2016-12-29  404  =

2b77dcc5e5aa38 Anthony Koo         2019-11-05  405  	dc =3D stream->ctx->dc;
bae1f0b8a5b189 Nicholas Kazlauskas 2021-05-19  406  	dc_z10_restore(dc);
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  407  =

4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  408  	/* disable idle optimi=
zations if enabling cursor */
a141d2083b4625 Alvin Lee           2022-06-03  409  	if (dc->idle_optimizat=
ions_allowed && (!stream->cursor_position.enable || dc->debug.exit_idle_opt=
_for_cursor_updates)
a141d2083b4625 Alvin Lee           2022-06-03  410  			&& position->enable)=
 {
4b675aad969507 Joshua Aberback     2020-08-31  411  		dc_allow_idle_optimiz=
ations(dc, false);
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  412  		reset_idle_optimizati=
ons =3D true;
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  413  	}
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  414  =

33fd17d9125c00 Eric Yang           2018-01-18  415  	stream->cursor_positio=
n =3D *position;
ab2541b6739508 Aric Cyr            2016-12-29  416  =

4fd771ea441ed9 Roy Chan            2021-07-19  417  	program_cursor_positio=
n(dc, stream, position);
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  418  	/* re-enable idle opti=
mizations if necessary */
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  419  	if (reset_idle_optimiz=
ations)
4b675aad969507 Joshua Aberback     2020-08-31  420  		dc_allow_idle_optimiz=
ations(dc, true);
4d55b0dd1cdd85 Bhawanpreet Lakha   2020-05-21  421  =

beb16b6a0f921f Dmytro Laktyushkin  2017-04-21  422  	return true;
ab2541b6739508 Aric Cyr            2016-12-29  423  }
ab2541b6739508 Aric Cyr            2016-12-29  424  =


:::::: The code at line 395 was first introduced by commit
:::::: 4fa086b9b6640818c053c79d4d7104790ba76cb7 drm/amd/display: Roll core_=
stream into dc_stream

:::::: TO: Leo (Sunpeng) Li <sunpeng.li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0495283536407384977==--

