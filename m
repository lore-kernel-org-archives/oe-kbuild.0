Content-Type: multipart/mixed; boundary="===============2418792395592886829=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 3841/8469] drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we previously assumed 'fb' could be null (see line 536)
Date: Wed, 31 Mar 2021 07:15:21 +0300
Message-ID: <20210331041521.GC2088@kadam>
In-Reply-To: <d905610d-21d2-ddc4-7ade-0f229ad60efc@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2418792395592886829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 08:25:36AM +0800, Rong Chen wrote:
> =

> =

> On 3/30/21 9:20 PM, Dan Carpenter wrote:
> > On Tue, Mar 30, 2021 at 01:49:42PM +0200, Noralf Tr=C3=B8nnes wrote:
> > > =

> > > Den 30.03.2021 12.08, skrev Dan Carpenter:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git   master
> > > > head:   9d49ed9ca93b8c564033c1d6808017bc9052b5db
> > > > commit: 40e1a70b4aedf2859a1829991b48ef0ebe650bf2 [3841/8469] drm: A=
dd GUD USB Display driver
> > > > config: openrisc-randconfig-m031-20210330 (attached as .config)
> > > > compiler: or1k-linux-gcc (GCC) 9.3.0
> > > > =

> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > =

> > > > smatch warnings:
> > > > drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we prev=
iously assumed 'fb' could be null (see line 536)
> > > > =

> > > > vim +/fb +544 drivers/gpu/drm/gud/gud_pipe.c
> > > > =

> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  508  void gud_pipe_u=
pdate(struct drm_simple_display_pipe *pipe,
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  509  		     struct d=
rm_plane_state *old_state)
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  510  {
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  511  	struct drm_dev=
ice *drm =3D pipe->crtc.dev;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  512  	struct gud_dev=
ice *gdrm =3D to_gud_device(drm);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  513  	struct drm_pla=
ne_state *state =3D pipe->plane.state;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  514  	struct drm_fra=
mebuffer *fb =3D state->fb;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  515  	struct drm_crt=
c *crtc =3D &pipe->crtc;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  516  	struct drm_rec=
t damage;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  517  	int idx;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  518
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  519  	if (crtc->stat=
e->mode_changed || !crtc->state->enable) {
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  520  		cancel_work_s=
ync(&gdrm->work);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  521  		mutex_lock(&g=
drm->damage_lock);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  522  		if (gdrm->fb)=
 {
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  523  			drm_framebuf=
fer_put(gdrm->fb);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  524  			gdrm->fb =3D=
 NULL;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  525  		}
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  526  		gud_clear_dam=
age(gdrm);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  527  		mutex_unlock(=
&gdrm->damage_lock);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  528  	}
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  529
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  530  	if (!drm_dev_e=
nter(drm, &idx))
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  531  		return;
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  532
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  533  	if (!old_state=
->fb)
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  534  		gud_usb_set_u=
8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  535
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13 @536  	if (fb && (crt=
c->state->mode_changed || crtc->state->connectors_changed))
> > > >                                                      ^^
> > > > Can "fb" be NULL?
> > > > =

> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  537  		gud_usb_set(g=
drm, GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  538
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  539  	if (crtc->stat=
e->active_changed)
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  540  		gud_usb_set_u=
8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  541
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  542  	if (drm_atomic=
_helper_damage_merged(old_state, state, &damage)) {
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  543  		if (gdrm->fla=
gs & GUD_DISPLAY_FLAG_FULL_UPDATE)
> > > > 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13 @544  			drm_rect_ini=
t(&damage, 0, 0, fb->width, fb->height);
> > > >                                                                    =
                           ^^^^^^^^^^^^^^^^^^^^^
> > > drm_atomic_helper_damage_merged() returns false if state->fb is NULL,=
 so
> > > this is good.
> > > =

> > Thanks.  These warnings are from the zero day bot.  On my own system
> > with the cross function DB then Smatch parses this correctly and does
> > not print a warning.  I probably should have looked at this harder
> > before forwarding the warning.
> > =

> > regards,
> > dan carpenter
> > =

> =

> Sorry for the inconvenience, we'll take a look from the zero day side.

It's not a big deal.  I don't really expect the kbuild bot to have a
current cross function DB.  And one that's slightly old can be more
confusing sometimes.

regards,
dan carpenter

--===============2418792395592886829==--

