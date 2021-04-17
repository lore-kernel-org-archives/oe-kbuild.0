Content-Type: multipart/mixed; boundary="===============0107458564753762923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vc4/vc4_crtc.c:595:50: warning: Function 'vc4_crtc_get_margins' argument order different: declaration 'state, right, left, top, bottom' definition 'state, left, right, top, bottom' [funcArgOrderDifferent]
Date: Sat, 17 Apr 2021 12:14:42 +0800
Message-ID: <202104171234.yWPSTQK2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0107458564753762923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9cdbf6467424045617cd6e79dcaad06bb8efa31c
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/vc4/vc4_crtc.c:595:50: warning: Function 'vc4_crtc_get_m=
argins' argument order different: declaration 'state, right, left, top, bot=
tom' definition 'state, left, right, top, bottom' [funcArgOrderDifferent]
   void vc4_crtc_get_margins(struct drm_crtc_state *state,
                                                    ^
   drivers/gpu/drm/vc4/vc4_drv.h:757:50: note: Function 'vc4_crtc_get_margi=
ns' argument order different: declaration 'state, right, left, top, bottom'=
 definition 'state, left, right, top, bottom'
   void vc4_crtc_get_margins(struct drm_crtc_state *state,
                                                    ^
   drivers/gpu/drm/vc4/vc4_crtc.c:595:50: note: Function 'vc4_crtc_get_marg=
ins' argument order different: declaration 'state, right, left, top, bottom=
' definition 'state, left, right, top, bottom'
   void vc4_crtc_get_margins(struct drm_crtc_state *state,
                                                    ^

vim +595 drivers/gpu/drm/vc4/vc4_crtc.c

acc1be1d351e8d Mario Kleiner   2016-07-19  594  =

666e73587f90f4 Boris Brezillon 2018-12-06 @595  void vc4_crtc_get_margins(s=
truct drm_crtc_state *state,
666e73587f90f4 Boris Brezillon 2018-12-06  596  			  unsigned int *left, un=
signed int *right,
666e73587f90f4 Boris Brezillon 2018-12-06  597  			  unsigned int *top, uns=
igned int *bottom)
666e73587f90f4 Boris Brezillon 2018-12-06  598  {
666e73587f90f4 Boris Brezillon 2018-12-06  599  	struct vc4_crtc_state *vc4=
_state =3D to_vc4_crtc_state(state);
666e73587f90f4 Boris Brezillon 2018-12-06  600  	struct drm_connector_state=
 *conn_state;
666e73587f90f4 Boris Brezillon 2018-12-06  601  	struct drm_connector *conn;
666e73587f90f4 Boris Brezillon 2018-12-06  602  	int i;
666e73587f90f4 Boris Brezillon 2018-12-06  603  =

666e73587f90f4 Boris Brezillon 2018-12-06  604  	*left =3D vc4_state->margi=
ns.left;
666e73587f90f4 Boris Brezillon 2018-12-06  605  	*right =3D vc4_state->marg=
ins.right;
666e73587f90f4 Boris Brezillon 2018-12-06  606  	*top =3D vc4_state->margin=
s.top;
666e73587f90f4 Boris Brezillon 2018-12-06  607  	*bottom =3D vc4_state->mar=
gins.bottom;
666e73587f90f4 Boris Brezillon 2018-12-06  608  =

666e73587f90f4 Boris Brezillon 2018-12-06  609  	/* We have to interate ove=
r all new connector states because
666e73587f90f4 Boris Brezillon 2018-12-06  610  	 * vc4_crtc_get_margins() =
might be called before
666e73587f90f4 Boris Brezillon 2018-12-06  611  	 * vc4_crtc_atomic_check()=
 which means margins info in vc4_crtc_state
666e73587f90f4 Boris Brezillon 2018-12-06  612  	 * might be outdated.
666e73587f90f4 Boris Brezillon 2018-12-06  613  	 */
666e73587f90f4 Boris Brezillon 2018-12-06  614  	for_each_new_connector_in_=
state(state->state, conn, conn_state, i) {
666e73587f90f4 Boris Brezillon 2018-12-06  615  		if (conn_state->crtc !=3D=
 state->crtc)
666e73587f90f4 Boris Brezillon 2018-12-06  616  			continue;
666e73587f90f4 Boris Brezillon 2018-12-06  617  =

666e73587f90f4 Boris Brezillon 2018-12-06  618  		*left =3D conn_state->tv.=
margins.left;
666e73587f90f4 Boris Brezillon 2018-12-06  619  		*right =3D conn_state->tv=
.margins.right;
666e73587f90f4 Boris Brezillon 2018-12-06  620  		*top =3D conn_state->tv.m=
argins.top;
666e73587f90f4 Boris Brezillon 2018-12-06  621  		*bottom =3D conn_state->t=
v.margins.bottom;
666e73587f90f4 Boris Brezillon 2018-12-06  622  		break;
666e73587f90f4 Boris Brezillon 2018-12-06  623  	}
666e73587f90f4 Boris Brezillon 2018-12-06  624  }
666e73587f90f4 Boris Brezillon 2018-12-06  625  =


:::::: The code at line 595 was first introduced by commit
:::::: 666e73587f90f42d90385c1bea1009a650bf73f4 drm/vc4: Take margin setup =
into account when updating planes

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0107458564753762923==--

