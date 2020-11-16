Content-Type: multipart/mixed; boundary="===============5479020302349390149=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/gpu/drm/i915/gem/i915_gem_throttle.c:59 i915_gem_throttle_ioctl() error: double locked 'ctx->engines_mutex' (orig line 59)
Date: Mon, 16 Nov 2020 13:44:13 +0300
Message-ID: <20201116104413.GB18329@kadam>
In-Reply-To: <160552170467.29277.2663645719015888596@build.alporthouse.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5479020302349390149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:15:04AM +0000, Chris Wilson wrote:
> Quoting Dan Carpenter (2020-11-16 10:08:38)
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   0062442ecfef0d82cd69e3e600d5006357f8d8e4
> > commit: 27a5dcfe73f4b696b3de8c23a560199bb1c193a4 drm/i915/gem: Remove d=
isordered per-file request list for throttling
> > config: i386-randconfig-m021-20201115 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/gpu/drm/i915/gem/i915_gem_throttle.c:59 i915_gem_throttle_ioctl=
() error: double locked 'ctx->engines_mutex' (orig line 59)
> > =

> > vim +59 drivers/gpu/drm/i915/gem/i915_gem_throttle.c
> > =

> >     35  int
> >     36  i915_gem_throttle_ioctl(struct drm_device *dev, void *data,
> >     37                          struct drm_file *file)
> >     38  {
> >     39          const unsigned long recent_enough =3D jiffies - DRM_I91=
5_THROTTLE_JIFFIES;
> >     40          struct drm_i915_file_private *file_priv =3D file->drive=
r_priv;
> >     41          struct i915_gem_context *ctx;
> >     42          unsigned long idx;
> >     43          long ret;
> >     44  =

> >     45          /* ABI: return -EIO if already wedged */
> >     46          ret =3D intel_gt_terminally_wedged(&to_i915(dev)->gt);
> >     47          if (ret)
> >     48                  return ret;
> >     49  =

> >     50          rcu_read_lock();
> >     51          xa_for_each(&file_priv->context_xa, idx, ctx) {
> >     52                  struct i915_gem_engines_iter it;
> >     53                  struct intel_context *ce;
> >     54  =

> >     55                  if (!kref_get_unless_zero(&ctx->ref))
> >     56                          continue;
> >     57                  rcu_read_unlock();
> >     58  =

> >     59                  for_each_gem_engine(ce,
> >     60                                      i915_gem_context_lock_engin=
es(ctx),
> >                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^
> > I don't understand why this takes the lock every iteration through the
> > loop
> =

> It doesn't.
> =

> static inline struct i915_gem_engines *
> i915_gem_context_lock_engines(struct i915_gem_context *ctx)
>         __acquires(&ctx->engines_mutex)
> {
>         mutex_lock(&ctx->engines_mutex);
>         return i915_gem_context_engines(ctx);
> }
> =

> static inline void
> i915_gem_context_unlock_engines(struct i915_gem_context *ctx)
>         __releases(&ctx->engines_mutex)
> {
>         mutex_unlock(&ctx->engines_mutex);
> }
> =

> with the i915_gem_engines stored as a local in the iterator at the start
> of the for loop.

Yeah...  But that's true enough.  But what I think is actually causing
the static checker warning are the continues.

    52          xa_for_each(&file_priv->context_xa, idx, ctx) {
    53                  struct i915_gem_engines_iter it;
    54                  struct intel_context *ce;
    55  =

    56                  if (!kref_get_unless_zero(&ctx->ref))
    57                          continue;
    58                  rcu_read_unlock();
    59  =

    60                  for_each_gem_engine(ce,
    61                                      i915_gem_context_lock_engines(c=
tx),
    62                                      it) {
    63                          struct i915_request *rq, *target =3D NULL;
    64  =

    65                          if (!ce->timeline)
    66                                  continue;
                                        ^^^^^^^^^
This continue is for the inside loop, so "ctx" isn't iterated.  There
is another continue as well later in the loop.  Potentially they could
be replaced with breaks?

    67  =

    68                          mutex_lock(&ce->timeline->mutex);
    69                          list_for_each_entry_reverse(rq,
    70                                                      &ce->timeline->=
requests,
    71                                                      link) {
    72                                  if (i915_request_completed(rq))

regards,
dan carpenter
--===============5479020302349390149==--

