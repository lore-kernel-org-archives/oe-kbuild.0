Content-Type: multipart/mixed; boundary="===============0625195112502035907=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [linux-next:master 3841/8469] drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we previously assumed 'fb' could be null (see line 536)
Date: Wed, 31 Mar 2021 08:25:36 +0800
Message-ID: <d905610d-21d2-ddc4-7ade-0f229ad60efc@intel.com>
In-Reply-To: <20210330132058.GB2088@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0625195112502035907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/30/21 9:20 PM, Dan Carpenter wrote:
> On Tue, Mar 30, 2021 at 01:49:42PM +0200, Noralf Tr=C3=B8nnes wrote:
>>
>> Den 30.03.2021 12.08, skrev Dan Carpenter:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git  master
>>> head:   9d49ed9ca93b8c564033c1d6808017bc9052b5db
>>> commit: 40e1a70b4aedf2859a1829991b48ef0ebe650bf2 [3841/8469] drm: Add G=
UD USB Display driver
>>> config: openrisc-randconfig-m031-20210330 (attached as .config)
>>> compiler: or1k-linux-gcc (GCC) 9.3.0
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> smatch warnings:
>>> drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we previous=
ly assumed 'fb' could be null (see line 536)
>>>
>>> vim +/fb +544 drivers/gpu/drm/gud/gud_pipe.c
>>>
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  508  void gud_pipe_updat=
e(struct drm_simple_display_pipe *pipe,
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  509  		     struct drm_p=
lane_state *old_state)
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  510  {
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  511  	struct drm_device =
*drm =3D pipe->crtc.dev;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  512  	struct gud_device =
*gdrm =3D to_gud_device(drm);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  513  	struct drm_plane_s=
tate *state =3D pipe->plane.state;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  514  	struct drm_framebu=
ffer *fb =3D state->fb;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  515  	struct drm_crtc *c=
rtc =3D &pipe->crtc;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  516  	struct drm_rect da=
mage;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  517  	int idx;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  518
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  519  	if (crtc->state->m=
ode_changed || !crtc->state->enable) {
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  520  		cancel_work_sync(=
&gdrm->work);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  521  		mutex_lock(&gdrm-=
>damage_lock);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  522  		if (gdrm->fb) {
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  523  			drm_framebuffer_=
put(gdrm->fb);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  524  			gdrm->fb =3D NUL=
L;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  525  		}
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  526  		gud_clear_damage(=
gdrm);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  527  		mutex_unlock(&gdr=
m->damage_lock);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  528  	}
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  529
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  530  	if (!drm_dev_enter=
(drm, &idx))
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  531  		return;
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  532
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  533  	if (!old_state->fb)
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  534  		gud_usb_set_u8(gd=
rm, GUD_REQ_SET_CONTROLLER_ENABLE, 1);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  535
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13 @536  	if (fb && (crtc->s=
tate->mode_changed || crtc->state->connectors_changed))
>>>                                                      ^^
>>> Can "fb" be NULL?
>>>
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  537  		gud_usb_set(gdrm,=
 GUD_REQ_SET_STATE_COMMIT, 0, NULL, 0);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  538
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  539  	if (crtc->state->a=
ctive_changed)
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  540  		gud_usb_set_u8(gd=
rm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  541
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  542  	if (drm_atomic_hel=
per_damage_merged(old_state, state, &damage)) {
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13  543  		if (gdrm->flags &=
 GUD_DISPLAY_FLAG_FULL_UPDATE)
>>> 40e1a70b4aedf2 Noralf Tr=C3=B8nnes 2021-03-13 @544  			drm_rect_init(&d=
amage, 0, 0, fb->width, fb->height);
>>>                                                                        =
                       ^^^^^^^^^^^^^^^^^^^^^
>> drm_atomic_helper_damage_merged() returns false if state->fb is NULL, so
>> this is good.
>>
> Thanks.  These warnings are from the zero day bot.  On my own system
> with the cross function DB then Smatch parses this correctly and does
> not print a warning.  I probably should have looked at this harder
> before forwarding the warning.
>
> regards,
> dan carpenter
>

Sorry for the inconvenience, we'll take a look from the zero day side.

Best Regards,
Rong Chen
--===============0625195112502035907==--

