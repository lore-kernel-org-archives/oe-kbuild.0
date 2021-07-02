Content-Type: multipart/mixed; boundary="===============3206652081733355456=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14] drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
Date: Fri, 02 Jul 2021 14:07:27 +0300
Message-ID: <20210702110727.GT1983@kadam>
In-Reply-To: <CAM0jSHOb0bGWMt-tmUn62R_FpiM5TL2HFLbBqxhpqk1gH0qSUA@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3206652081733355456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 11:32:45AM +0100, Matthew Auld wrote:
> On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> >
> > tree:   git://anongit.freedesktop.org/drm-intel drm-intel-gt-next
> > head:   5cd57f676bb946a00275408f0dd0d75dbc466d25
> > commit: cf586021642d8017cde111b7dd1ba86224e9da51 [8/14] drm/i915/gt: Pi=
pelined page migration
> > config: x86_64-randconfig-m001-20210630 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitiali=
zed symbol 'rq'.
> > drivers/gpu/drm/i915/gt/selftest_migrate.c:113 copy() error: uninitiali=
zed symbol 'vaddr'.
> >
> > Old smatch warnings:
> > drivers/gpu/drm/i915/gem/i915_gem_object.h:182 __i915_gem_object_lock()=
 error: we previously assumed 'ww' could be null (see line 171)
> >
> > vim +/rq +102 drivers/gpu/drm/i915/gt/selftest_migrate.c
> >
> > cf586021642d80 Chris Wilson 2021-06-17   32  static int copy(struct int=
el_migrate *migrate,
> > cf586021642d80 Chris Wilson 2021-06-17   33             int (*fn)(struc=
t intel_migrate *migrate,
> > cf586021642d80 Chris Wilson 2021-06-17   34                       struc=
t i915_gem_ww_ctx *ww,
> > cf586021642d80 Chris Wilson 2021-06-17   35                       struc=
t drm_i915_gem_object *src,
> > cf586021642d80 Chris Wilson 2021-06-17   36                       struc=
t drm_i915_gem_object *dst,
> > cf586021642d80 Chris Wilson 2021-06-17   37                       struc=
t i915_request **out),
> > cf586021642d80 Chris Wilson 2021-06-17   38             u32 sz, struct =
rnd_state *prng)
> > cf586021642d80 Chris Wilson 2021-06-17   39  {
> > cf586021642d80 Chris Wilson 2021-06-17   40     struct drm_i915_private=
 *i915 =3D migrate->context->engine->i915;
> > cf586021642d80 Chris Wilson 2021-06-17   41     struct drm_i915_gem_obj=
ect *src, *dst;
> > cf586021642d80 Chris Wilson 2021-06-17   42     struct i915_request *rq;
> > cf586021642d80 Chris Wilson 2021-06-17   43     struct i915_gem_ww_ctx =
ww;
> > cf586021642d80 Chris Wilson 2021-06-17   44     u32 *vaddr;
> > cf586021642d80 Chris Wilson 2021-06-17   45     int err =3D 0;
> >
> > One way to silence these warnings would be to initialize err =3D -EINVA=
L.
> > Then Smatch would know that we goto err_out for an empty list.
> >
> > cf586021642d80 Chris Wilson 2021-06-17   46     int i;
> > cf586021642d80 Chris Wilson 2021-06-17   47
> > cf586021642d80 Chris Wilson 2021-06-17   48     src =3D create_lmem_or_=
internal(i915, sz);
> > cf586021642d80 Chris Wilson 2021-06-17   49     if (IS_ERR(src))
> > cf586021642d80 Chris Wilson 2021-06-17   50             return 0;
> > cf586021642d80 Chris Wilson 2021-06-17   51
> > cf586021642d80 Chris Wilson 2021-06-17   52     dst =3D i915_gem_object=
_create_internal(i915, sz);
> > cf586021642d80 Chris Wilson 2021-06-17   53     if (IS_ERR(dst))
> > cf586021642d80 Chris Wilson 2021-06-17   54             goto err_free_s=
rc;
> > cf586021642d80 Chris Wilson 2021-06-17   55
> > cf586021642d80 Chris Wilson 2021-06-17   56     for_i915_gem_ww(&ww, er=
r, true) {
> > cf586021642d80 Chris Wilson 2021-06-17   57             err =3D i915_ge=
m_object_lock(src, &ww);
> > cf586021642d80 Chris Wilson 2021-06-17   58             if (err)
> > cf586021642d80 Chris Wilson 2021-06-17   59                     continu=
e;
> > cf586021642d80 Chris Wilson 2021-06-17   60
> > cf586021642d80 Chris Wilson 2021-06-17   61             err =3D i915_ge=
m_object_lock(dst, &ww);
> > cf586021642d80 Chris Wilson 2021-06-17   62             if (err)
> > cf586021642d80 Chris Wilson 2021-06-17   63                     continu=
e;
> > cf586021642d80 Chris Wilson 2021-06-17   64
> > cf586021642d80 Chris Wilson 2021-06-17   65             vaddr =3D i915_=
gem_object_pin_map(src, I915_MAP_WC);
> > cf586021642d80 Chris Wilson 2021-06-17   66             if (IS_ERR(vadd=
r)) {
> > cf586021642d80 Chris Wilson 2021-06-17   67                     err =3D=
 PTR_ERR(vaddr);
> > cf586021642d80 Chris Wilson 2021-06-17   68                     continu=
e;
> > cf586021642d80 Chris Wilson 2021-06-17   69             }
> > cf586021642d80 Chris Wilson 2021-06-17   70
> > cf586021642d80 Chris Wilson 2021-06-17   71             for (i =3D 0; i=
 < sz / sizeof(u32); i++)
> > cf586021642d80 Chris Wilson 2021-06-17   72                     vaddr[i=
] =3D i;
> > cf586021642d80 Chris Wilson 2021-06-17   73             i915_gem_object=
_flush_map(src);
> > cf586021642d80 Chris Wilson 2021-06-17   74
> > cf586021642d80 Chris Wilson 2021-06-17   75             vaddr =3D i915_=
gem_object_pin_map(dst, I915_MAP_WC);
> > cf586021642d80 Chris Wilson 2021-06-17   76             if (IS_ERR(vadd=
r)) {
> > cf586021642d80 Chris Wilson 2021-06-17   77                     err =3D=
 PTR_ERR(vaddr);
> > cf586021642d80 Chris Wilson 2021-06-17   78                     goto un=
pin_src;
> > cf586021642d80 Chris Wilson 2021-06-17   79             }
> > cf586021642d80 Chris Wilson 2021-06-17   80
> > cf586021642d80 Chris Wilson 2021-06-17   81             for (i =3D 0; i=
 < sz / sizeof(u32); i++)
> > cf586021642d80 Chris Wilson 2021-06-17   82                     vaddr[i=
] =3D ~i;
> > cf586021642d80 Chris Wilson 2021-06-17   83             i915_gem_object=
_flush_map(dst);
> > cf586021642d80 Chris Wilson 2021-06-17   84
> > cf586021642d80 Chris Wilson 2021-06-17   85             err =3D fn(migr=
ate, &ww, src, dst, &rq);
> > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > cf586021642d80 Chris Wilson 2021-06-17   87                     continu=
e;
> >
> > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > complain anyway because it thinks the list could be empty or that we
> > might hit and early continue for everything.
> =

> The fn() will always first initialize the rq to NULL. If it returns
> success then rq will always be a valid rq. If it returns an err then
> the rq might be NULL, or a valid rq depending on how far the copy/fn
> got.
> =

> And for_i915_gem_ww() will always run at least once, since ww->loop =3D
> true, so this looks like a false positive?

You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
i915_gem_object_pin_map() can fail?

regards,
dan carpenter

--===============3206652081733355456==--

