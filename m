Content-Type: multipart/mixed; boundary="===============8008112420289311089=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Fwd: [zen:5.17/ksm 3/5] mm/madvise.c:1529 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
Date: Mon, 06 Jun 2022 17:17:39 +0300
Message-ID: <20220606141738.GO2168@kadam>
In-Reply-To: <10132072.nUPlyArG6x@natalenko.name>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8008112420289311089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 04:10:42PM +0200, Oleksandr Natalenko wrote:
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1504  	for (vma =3D mm->=
mmap; vma; vma =3D vma->vm_next) {
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1505  		switch (behaviou=
r) {
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1506  			case MADV_MERGE=
ABLE:
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1507  				ret =3D ksm_ma=
dvise_merge(vma->vm_mm, vma, &vma->vm_flags);
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1508  				break;
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1509  			case MADV_UNMER=
GEABLE:
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1510  				ret =3D ksm_ma=
dvise_unmerge(vma, vma->vm_start, vma->vm_end, &vma->vm_flags);
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1511  				break;
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1512  			default:
> > 930581120060a7 Oleksandr Natalenko 2021-10-04  1513  				/* look, ma, n=
o brain */
> > =

> > ret =3D -EINVAL;?
> =

> I think whatever performs this check and complains is overly cautious bec=
ause given 1464=E2=80=931472 `switch` block the value of `behaviour` cannot=
 be anything else other than `MADV_MERGEABLE | MADV_UNMERGEABLE`, hence `de=
fault` branch will never be taken.
> =

> I can add this "fix", of course, to shut up the checker, but it doesn't m=
ake much sense from my PoV.
> =

> A more reasonable thing to do is to remove `default` branch. Is this some=
thing that can be tested by the test suite?
> =


You know what, I should have just looked at the date and ignored this.
My own test system does not complain about this, because it has cross
function information so it knows that default is impossible.

My bad.  Just ignore this.  To human reading this code it's pretty clear
from the comments that the default path is just about silencing static
checker warnings.

regards,
dan carpenter

--===============8008112420289311089==--

