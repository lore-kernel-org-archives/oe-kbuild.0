Content-Type: multipart/mixed; boundary="===============2160087202112836851=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 759/2366] drivers/gpu/drm/udl/udl_modeset.c:490:15: warning: Redundant initialization for 'format_count'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Thu, 16 Apr 2020 13:50:27 +0800
Message-ID: <202004161305.8kJO03uS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2160087202112836851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ac935d22736659be734251247dcc6f444fb98972
commit: fe5b7c86d6068ac33df2d46cf3c7a1859c3b84a8 [759/2366] drm/udl: Drop e=
xplicit drm_mode_config_cleanup call
:::::: branch date: 25 hours ago
:::::: commit date: 3 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/gpu/drm/udl/udl_modeset.c:333:6: warning: Variable 'ret' is reas=
signed a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/gpu/drm/udl/udl_modeset.c:328:7: note: ret is assigned
     ret =3D udl_submit_urb(dev, urb, len);
         ^
   drivers/gpu/drm/udl/udl_modeset.c:333:6: note: ret is overwritten
    ret =3D 0;
        ^
>> drivers/gpu/drm/udl/udl_modeset.c:490:15: warning: Redundant initializat=
ion for 'format_count'. The initialized value is overwritten before it is r=
ead. [redundantInitialization]
    format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
                 ^
   drivers/gpu/drm/udl/udl_modeset.c:466:22: note: format_count is initiali=
zed
    size_t format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
                        ^
   drivers/gpu/drm/udl/udl_modeset.c:490:15: note: format_count is overwrit=
ten
    format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dfe5b7c86d6068ac33df2d46cf3c7a1859c3b84a8
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout fe5b7c86d6068ac33df2d46cf3c7a1859c3b84a8
vim +/format_count +490 drivers/gpu/drm/udl/udl_modeset.c

5320918b9a87865 Dave Airlie       2010-12-15  463  =

5320918b9a87865 Dave Airlie       2010-12-15  464  int udl_modeset_init(str=
uct drm_device *dev)
5320918b9a87865 Dave Airlie       2010-12-15  465  {
9fda81e00e060e3 Thomas Zimmermann 2019-12-10  466  	size_t format_count =3D=
 ARRAY_SIZE(udl_simple_display_pipe_formats);
9fda81e00e060e3 Thomas Zimmermann 2019-12-10  467  	struct udl_device *udl =
=3D dev->dev_private;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  468  	struct drm_connector *c=
onnector;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  469  	int ret;
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  470  =

fe5b7c86d6068ac Daniel Vetter     2020-03-23  471  	ret =3D drmm_mode_confi=
g_init(dev);
fe5b7c86d6068ac Daniel Vetter     2020-03-23  472  	if (ret)
fe5b7c86d6068ac Daniel Vetter     2020-03-23  473  		return ret;
5320918b9a87865 Dave Airlie       2010-12-15  474  =

5320918b9a87865 Dave Airlie       2010-12-15  475  	dev->mode_config.min_wi=
dth =3D 640;
5320918b9a87865 Dave Airlie       2010-12-15  476  	dev->mode_config.min_he=
ight =3D 480;
5320918b9a87865 Dave Airlie       2010-12-15  477  =

5320918b9a87865 Dave Airlie       2010-12-15  478  	dev->mode_config.max_wi=
dth =3D 2048;
5320918b9a87865 Dave Airlie       2010-12-15  479  	dev->mode_config.max_he=
ight =3D 2048;
5320918b9a87865 Dave Airlie       2010-12-15  480  =

5320918b9a87865 Dave Airlie       2010-12-15  481  	dev->mode_config.prefer=
_shadow =3D 0;
d8177841aa8a5d3 Thomas Zimmermann 2019-12-10  482  	dev->mode_config.prefer=
red_depth =3D 16;
5320918b9a87865 Dave Airlie       2010-12-15  483  =

e6ecefaadfcdb03 Laurent Pinchart  2012-05-17  484  	dev->mode_config.funcs =
=3D &udl_mode_funcs;
5320918b9a87865 Dave Airlie       2010-12-15  485  =

e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  486  	connector =3D udl_conne=
ctor_init(dev);
fe5b7c86d6068ac Daniel Vetter     2020-03-23  487  	if (IS_ERR(connector))
fe5b7c86d6068ac Daniel Vetter     2020-03-23  488  		return PTR_ERR(connect=
or);
e829cf0b30b4b55 Thomas Zimmermann 2019-12-10  489  =

9fda81e00e060e3 Thomas Zimmermann 2019-12-10 @490  	format_count =3D ARRAY_=
SIZE(udl_simple_display_pipe_formats);

:::::: The code at line 490 was first introduced by commit
:::::: 9fda81e00e060e3ab9a56d77552d2d5e296f1007 drm/udl: Convert to struct =
drm_simple_display_pipe

:::::: TO: Thomas Zimmermann <tzimmermann@suse.de>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2160087202112836851==--

