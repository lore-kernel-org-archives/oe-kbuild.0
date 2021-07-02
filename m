Content-Type: multipart/mixed; boundary="===============6630788571501152529=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14] drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
Date: Fri, 02 Jul 2021 14:13:44 +0300
Message-ID: <20210702111344.GV1983@kadam>
In-Reply-To: <20210702110727.GT1983@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6630788571501152529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 02:07:27PM +0300, Dan Carpenter wrote:
> On Fri, Jul 02, 2021 at 11:32:45AM +0100, Matthew Auld wrote:
> > On Fri, 2 Jul 2021 at 09:45, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > > cf586021642d80 Chris Wilson 2021-06-17   84
> > > cf586021642d80 Chris Wilson 2021-06-17   85             err =3D fn(mi=
grate, &ww, src, dst, &rq);
> > > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > > cf586021642d80 Chris Wilson 2021-06-17   87                     conti=
nue;
> > >
> > > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > > complain anyway because it thinks the list could be empty or that we
> > > might hit and early continue for everything.
> > =

> > The fn() will always first initialize the rq to NULL. If it returns
> > success then rq will always be a valid rq. If it returns an err then
> > the rq might be NULL, or a valid rq depending on how far the copy/fn
> > got.
> > =

> > And for_i915_gem_ww() will always run at least once, since ww->loop =3D
> > true, so this looks like a false positive?
> =

> You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
> i915_gem_object_pin_map() can fail?

Btw, I sincerely hope that we will re-enable GCC's uninitialized
variable checks.  Will GCC be able to verify that this is initialized?

regards,
dan carpenter

--===============6630788571501152529==--

