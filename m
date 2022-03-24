Content-Type: multipart/mixed; boundary="===============2454366869192642173=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [djwong-xfs:djwong-wtf 349/351] fs/xfs/xfs_bmap_util.c:1372 xfs_map_free_extent() warn: missing error code 'error'
Date: Thu, 24 Mar 2022 13:45:22 +0300
Message-ID: <20220324104521.GF12805@kadam>
In-Reply-To: <20220322163827.GQ8241@magnolia>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2454366869192642173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 09:38:27AM -0700, Darrick J. Wong wrote:
> On Tue, Mar 22, 2022 at 08:47:26AM +0300, Dan Carpenter wrote:
> > On Mon, Mar 21, 2022 at 02:59:08PM -0700, Darrick J. Wong wrote:
> > > On Mon, Mar 21, 2022 at 10:33:02AM +0300, Dan Carpenter wrote:
> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1365  =

> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1366  	error =3D xfs_all=
oc_find_freesp(tp, pag, cursor, end_agbno, &len);
> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1367  	if (error)
> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1368  		goto out_cancel;
> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1369  =

> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1370  	/* Bail out if th=
e cursor is beyond what we asked for. */
> > > > b82670045aab66 Darrick J. Wong 2022-01-06  1371  	if (*cursor >=3D =
end_agbno)
> > > > b82670045aab66 Darrick J. Wong 2022-01-06 @1372  		goto out_cancel;
> > > > =

> > > > This looks like it should have an error =3D -EINVAL;
> > > =

> > > Nope.  If xfs_alloc_find_freesp moves @cursor goes beyond end_agbno, =
we
> > > want to exit early so that the xfs_map_free_extent caller will return=
 to
> > > userspace.
> > > =

> > > --D
> > =

> > I'm generally pretty happy with this static checker rule.  Returning
> > success on a failure path almost always results if something bad like a
> > NULL deref or a use after free.  But false positives are a real risk
> > because it's tempting to add an error code to this and introduce a bug.
> > =

> > Smatch will not print the warning if error is set within 4 lines of the
> > goto.
> > 	error =3D 0;
> > 	if (*cursor >=3D end_agbno)
> > 		goto out_cancel;
> =

> The trouble is, if I do that:
> =

> 	error =3D xfs_alloc_find_freesp(...);
> 	if (error)
> 		goto out_cancel;
> =

> 	error =3D 0;
> 	if (*cursor >=3D end_agbno)
> 		goto out_cancel;
> =

> then I'll get patch reviewers and/or tools complaining about setting
> error to zero unnecessarily.

Currently nothing would complain.  What causes complaints if the
assignments are not used.  Places where we assign a value and then
immediately re-assign over it.

It would only take a few minutes to write a checker rule which would
complain about assigning "ret =3D 0;" if we already know that foo was
zero, but hopefully no one will write it.

The closest is that Christophe JAILLET has a script to remove
duplicative memset()s to zero.

> Either way we end up with a lot of code
> golf for something the compiler will probably remove for us.
> =

> Question: Can sparse detect that the if() test involves a comparison
> between a non-pointer function argument and a dereferenced pointer
> argument?  Would that be sufficient to detect functions that advance a
> cursor passed in by the caller and return early when the cursor moves
> outside of a range also specified by the caller?

This is a Smatch test (not Sparse).  Smatch doesn't have code to
detect/describe that right now...  I'm not sure if the heuristic is very
useful.  I will look at future false positives and see if it applies.

regards,
dan carpenter
--===============2454366869192642173==--

