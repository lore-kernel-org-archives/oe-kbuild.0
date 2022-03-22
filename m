Content-Type: multipart/mixed; boundary="===============3436862128383001139=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [djwong-xfs:djwong-wtf 349/351] fs/xfs/xfs_bmap_util.c:1372 xfs_map_free_extent() warn: missing error code 'error'
Date: Tue, 22 Mar 2022 08:47:26 +0300
Message-ID: <20220322054726.GR336@kadam>
In-Reply-To: <20220321215908.GL8241@magnolia>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3436862128383001139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 02:59:08PM -0700, Darrick J. Wong wrote:
> On Mon, Mar 21, 2022 at 10:33:02AM +0300, Dan Carpenter wrote:
> > b82670045aab66 Darrick J. Wong 2022-01-06  1365  =

> > b82670045aab66 Darrick J. Wong 2022-01-06  1366  	error =3D xfs_alloc_f=
ind_freesp(tp, pag, cursor, end_agbno, &len);
> > b82670045aab66 Darrick J. Wong 2022-01-06  1367  	if (error)
> > b82670045aab66 Darrick J. Wong 2022-01-06  1368  		goto out_cancel;
> > b82670045aab66 Darrick J. Wong 2022-01-06  1369  =

> > b82670045aab66 Darrick J. Wong 2022-01-06  1370  	/* Bail out if the cu=
rsor is beyond what we asked for. */
> > b82670045aab66 Darrick J. Wong 2022-01-06  1371  	if (*cursor >=3D end_=
agbno)
> > b82670045aab66 Darrick J. Wong 2022-01-06 @1372  		goto out_cancel;
> > =

> > This looks like it should have an error =3D -EINVAL;
> =

> Nope.  If xfs_alloc_find_freesp moves @cursor goes beyond end_agbno, we
> want to exit early so that the xfs_map_free_extent caller will return to
> userspace.
> =

> --D

I'm generally pretty happy with this static checker rule.  Returning
success on a failure path almost always results if something bad like a
NULL deref or a use after free.  But false positives are a real risk
because it's tempting to add an error code to this and introduce a bug.

Smatch will not print the warning if error is set within 4 lines of the
goto.
	error =3D 0;
	if (*cursor >=3D end_agbno)
		goto out_cancel;

Another option is that people have started adding comments to these
blocks in response to the checker warning.

Or if you had a different idea about how to silence the checker warning
I can also probably implement that.

regards,
dan carpenter


--===============3436862128383001139==--

