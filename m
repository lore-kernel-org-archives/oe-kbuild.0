Content-Type: multipart/mixed; boundary="===============0995507605008141642=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [drm-intel:drm-intel-gt-next 8/14] drivers/gpu/drm/i915/gt/selftest_migrate.c:102 copy() error: uninitialized symbol 'rq'.
Date: Fri, 02 Jul 2021 15:19:10 +0300
Message-ID: <20210702121910.GX1983@kadam>
In-Reply-To: <CAM0jSHMyXEdS9wgkypKdvW1BNdUgcLxZR8Pd8nxSpPQHtiX+yA@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0995507605008141642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 12:34:33PM +0100, Matthew Auld wrote:
> > > > cf586021642d80 Chris Wilson 2021-06-17   85             err =3D fn(=
migrate, &ww, src, dst, &rq);
> > > > cf586021642d80 Chris Wilson 2021-06-17   86             if (!err)
> > > > cf586021642d80 Chris Wilson 2021-06-17   87                     con=
tinue;
> > > >
> > > > Does fn() initialize "rq" on the success path?  Anyway Smatch would
> > > > complain anyway because it thinks the list could be empty or that we
> > > > might hit and early continue for everything.
> > >
> > > The fn() will always first initialize the rq to NULL. If it returns
> > > success then rq will always be a valid rq. If it returns an err then
> > > the rq might be NULL, or a valid rq depending on how far the copy/fn
> > > got.
> > >
> > > And for_i915_gem_ww() will always run at least once, since ww->loop =
=3D
> > > true, so this looks like a false positive?
> >
> > You don't think i915_gem_object_lock(), i915_gem_object_pin_map() or
> > i915_gem_object_pin_map() can fail?
> =

> Yeah, they can totally fail but then we mostly likely just hit the
> err_out. The for_i915_gem_ww() is a little strange since it's not
> really looping over anything, it's just about retrying the block if we
> see -EDEADLK(which involves dropping some locks), if we see any other
> error then the loop is terminated with ww->loop =3D false, which then
> hits the goto err_out.
> =


Ah, yeah, you're right.  False positive.

I hadn't looked at this code in context (I only had reviewed the email).
Now that I've pulled the tree and looked at the code, then I'm sort of
surprised that Smatch generates a warning...  I will investigate some
more.  Thanks!

regards,
dan carpenter

--===============0995507605008141642==--

