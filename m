Content-Type: multipart/mixed; boundary="===============0364749006585492142=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [drm-drm-misc:drm-misc-next 19/44] drivers/gpu/drm/drm_mode_config.c:450 drmm_mode_config_init() error: double unlocked 'resv' (orig line 446)
Date: Sat, 11 Apr 2020 17:08:47 +0800
Message-ID: <202004111734.AyYrUETV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0364749006585492142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   9e1ed9fb1eb0a4bc43a26365c592d3095286038b
commit: c3b790ea07a13da0c46816bda6b04abef346af15 [19/44] drm: Manage drm_mo=
de_config_init with drmm_
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_mode_config.c:450 drmm_mode_config_init() error: double=
 unlocked 'resv' (orig line 446)

git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm-misc
git remote update drm-drm-misc
git checkout c3b790ea07a13da0c46816bda6b04abef346af15
vim +/resv +450 drivers/gpu/drm/drm_mode_config.c

c3b790ea07a13d Daniel Vetter         2020-03-23  381  =

28575f165d3605 Daniel Vetter         2016-11-14  382  /**
c3b790ea07a13d Daniel Vetter         2020-03-23  383   * drmm_mode_config_i=
nit - managed DRM mode_configuration structure
c3b790ea07a13d Daniel Vetter         2020-03-23  384   * 	initialization
28575f165d3605 Daniel Vetter         2016-11-14  385   * @dev: DRM device
28575f165d3605 Daniel Vetter         2016-11-14  386   *
28575f165d3605 Daniel Vetter         2016-11-14  387   * Initialize @dev's =
mode_config structure, used for tracking the graphics
28575f165d3605 Daniel Vetter         2016-11-14  388   * configuration of @=
dev.
28575f165d3605 Daniel Vetter         2016-11-14  389   *
28575f165d3605 Daniel Vetter         2016-11-14  390   * Since this initial=
izes the modeset locks, no locking is possible. Which is no
28575f165d3605 Daniel Vetter         2016-11-14  391   * problem, since thi=
s should happen single threaded at init time. It is the
28575f165d3605 Daniel Vetter         2016-11-14  392   * driver's problem t=
o ensure this guarantee.
28575f165d3605 Daniel Vetter         2016-11-14  393   *
c3b790ea07a13d Daniel Vetter         2020-03-23  394   * Cleanup is automat=
ically handled through registering drm_mode_config_cleanup
c3b790ea07a13d Daniel Vetter         2020-03-23  395   * with drmm_add_acti=
on().
c3b790ea07a13d Daniel Vetter         2020-03-23  396   *
c3b790ea07a13d Daniel Vetter         2020-03-23  397   * Returns: 0 on succ=
ess, negative error value on failure.
28575f165d3605 Daniel Vetter         2016-11-14  398   */
c3b790ea07a13d Daniel Vetter         2020-03-23  399  int drmm_mode_config_=
init(struct drm_device *dev)
28575f165d3605 Daniel Vetter         2016-11-14  400  {
28575f165d3605 Daniel Vetter         2016-11-14  401  	mutex_init(&dev->mod=
e_config.mutex);
28575f165d3605 Daniel Vetter         2016-11-14  402  	drm_modeset_lock_ini=
t(&dev->mode_config.connection_mutex);
28575f165d3605 Daniel Vetter         2016-11-14  403  	mutex_init(&dev->mod=
e_config.idr_mutex);
28575f165d3605 Daniel Vetter         2016-11-14  404  	mutex_init(&dev->mod=
e_config.fb_lock);
28575f165d3605 Daniel Vetter         2016-11-14  405  	mutex_init(&dev->mod=
e_config.blob_lock);
28575f165d3605 Daniel Vetter         2016-11-14  406  	INIT_LIST_HEAD(&dev-=
>mode_config.fb_list);
28575f165d3605 Daniel Vetter         2016-11-14  407  	INIT_LIST_HEAD(&dev-=
>mode_config.crtc_list);
28575f165d3605 Daniel Vetter         2016-11-14  408  	INIT_LIST_HEAD(&dev-=
>mode_config.connector_list);
28575f165d3605 Daniel Vetter         2016-11-14  409  	INIT_LIST_HEAD(&dev-=
>mode_config.encoder_list);
28575f165d3605 Daniel Vetter         2016-11-14  410  	INIT_LIST_HEAD(&dev-=
>mode_config.property_list);
28575f165d3605 Daniel Vetter         2016-11-14  411  	INIT_LIST_HEAD(&dev-=
>mode_config.property_blob_list);
28575f165d3605 Daniel Vetter         2016-11-14  412  	INIT_LIST_HEAD(&dev-=
>mode_config.plane_list);
b962a12050a387 Rob Clark             2018-10-22  413  	INIT_LIST_HEAD(&dev-=
>mode_config.privobj_list);
b5f06893c49925 Shayenne da Luz Moura 2018-12-13  414  	idr_init(&dev->mode_=
config.object_idr);
28575f165d3605 Daniel Vetter         2016-11-14  415  	idr_init(&dev->mode_=
config.tile_idr);
28575f165d3605 Daniel Vetter         2016-11-14  416  	ida_init(&dev->mode_=
config.connector_ida);
613051dac40da1 Daniel Vetter         2016-12-14  417  	spin_lock_init(&dev-=
>mode_config.connector_list_lock);
28575f165d3605 Daniel Vetter         2016-11-14  418  =

ea497bb9206487 Daniel Vetter         2017-12-13  419  	init_llist_head(&dev=
->mode_config.connector_free_list);
ea497bb9206487 Daniel Vetter         2017-12-13  420  	INIT_WORK(&dev->mode=
_config.connector_free_work, drm_connector_free_work_fn);
ea497bb9206487 Daniel Vetter         2017-12-13  421  =

28575f165d3605 Daniel Vetter         2016-11-14  422  	drm_mode_create_stan=
dard_properties(dev);
28575f165d3605 Daniel Vetter         2016-11-14  423  =

28575f165d3605 Daniel Vetter         2016-11-14  424  	/* Just to be sure */
28575f165d3605 Daniel Vetter         2016-11-14  425  	dev->mode_config.num=
_fb =3D 0;
28575f165d3605 Daniel Vetter         2016-11-14  426  	dev->mode_config.num=
_connector =3D 0;
28575f165d3605 Daniel Vetter         2016-11-14  427  	dev->mode_config.num=
_crtc =3D 0;
28575f165d3605 Daniel Vetter         2016-11-14  428  	dev->mode_config.num=
_encoder =3D 0;
28575f165d3605 Daniel Vetter         2016-11-14  429  	dev->mode_config.num=
_total_plane =3D 0;
2c51419e8c06f6 Daniel Vetter         2019-11-19  430  =

2c51419e8c06f6 Daniel Vetter         2019-11-19  431  	if (IS_ENABLED(CONFI=
G_LOCKDEP)) {
2c51419e8c06f6 Daniel Vetter         2019-11-19  432  		struct drm_modeset_=
acquire_ctx modeset_ctx;
2c51419e8c06f6 Daniel Vetter         2019-11-19  433  		struct ww_acquire_c=
tx resv_ctx;
2c51419e8c06f6 Daniel Vetter         2019-11-19  434  		struct dma_resv res=
v;
2c51419e8c06f6 Daniel Vetter         2019-11-19  435  		int ret;
2c51419e8c06f6 Daniel Vetter         2019-11-19  436  =

2c51419e8c06f6 Daniel Vetter         2019-11-19  437  		dma_resv_init(&resv=
);
2c51419e8c06f6 Daniel Vetter         2019-11-19  438  =

2c51419e8c06f6 Daniel Vetter         2019-11-19  439  		drm_modeset_acquire=
_init(&modeset_ctx, 0);
2c51419e8c06f6 Daniel Vetter         2019-11-19  440  		ret =3D drm_modeset=
_lock(&dev->mode_config.connection_mutex,
2c51419e8c06f6 Daniel Vetter         2019-11-19  441  				       &modeset_c=
tx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  442  		if (ret =3D=3D -EDE=
ADLK)
2c51419e8c06f6 Daniel Vetter         2019-11-19  443  			ret =3D drm_modese=
t_backoff(&modeset_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  444  =

2c51419e8c06f6 Daniel Vetter         2019-11-19  445  		ww_acquire_init(&re=
sv_ctx, &reservation_ww_class);
2c51419e8c06f6 Daniel Vetter         2019-11-19 @446  		ret =3D dma_resv_lo=
ck(&resv, &resv_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  447  		if (ret =3D=3D -EDE=
ADLK)
2c51419e8c06f6 Daniel Vetter         2019-11-19  448  			dma_resv_lock_slow=
(&resv, &resv_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  449  =

2c51419e8c06f6 Daniel Vetter         2019-11-19 @450  		dma_resv_unlock(&re=
sv);
2c51419e8c06f6 Daniel Vetter         2019-11-19  451  		ww_acquire_fini(&re=
sv_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  452  =

2c51419e8c06f6 Daniel Vetter         2019-11-19  453  		drm_modeset_drop_lo=
cks(&modeset_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  454  		drm_modeset_acquire=
_fini(&modeset_ctx);
2c51419e8c06f6 Daniel Vetter         2019-11-19  455  		dma_resv_fini(&resv=
);
2c51419e8c06f6 Daniel Vetter         2019-11-19  456  	}
c3b790ea07a13d Daniel Vetter         2020-03-23  457  =

c3b790ea07a13d Daniel Vetter         2020-03-23  458  	return drmm_add_acti=
on_or_reset(dev, drm_mode_config_init_release,
c3b790ea07a13d Daniel Vetter         2020-03-23  459  					NULL);
28575f165d3605 Daniel Vetter         2016-11-14  460  }
c3b790ea07a13d Daniel Vetter         2020-03-23  461  EXPORT_SYMBOL(drmm_mo=
de_config_init);
28575f165d3605 Daniel Vetter         2016-11-14  462  =


:::::: The code at line 450 was first introduced by commit
:::::: 2c51419e8c06f6b8b1b91892688b17dd9a7f6e39 drm/modeset: Prime modeset =
lock vs dma_resv

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0364749006585492142==--

