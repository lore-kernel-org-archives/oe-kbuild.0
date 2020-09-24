Content-Type: multipart/mixed; boundary="===============1300184711457875625=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH RFC v2 4/4] 9p: fix race issue in fid contention.
Date: Thu, 24 Sep 2020 11:40:09 +0300
Message-ID: <20200924084009.GR18329@kadam>
In-Reply-To: <CY4PR1101MB2326913B505A1FA1378FFFB9E7390@CY4PR1101MB2326.namprd11.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1300184711457875625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 08:29:48AM +0000, Reshetova, Elena wrote:
> > > >> net/9p/client.c:1469:6-25: atomic_dec_and_test variation before ob=
ject free at
> > line 1497.
> > =

> > =

> > This warning was confusing for me.  Perhaps a better wording would be:
> > "Use refcount_t instead of atomic_t for refcounting"?  =

> =

> The reason we didn't want to have such a strong statement, because this d=
etection
> can give false positives, i.e. suggest converting smth that should be lef=
t as atomic_t.
> So, it should be always carefully analyzed by a code author before just p=
lainly converting.
> Also, this way it gives you the background on which exact pattern (we hav=
e a number
> of them) triggered this case, and if we see that one pattern gives too mu=
ch mistakes, =

> we can remove/update it. But atomic_dec_and_test usage before freeing the=
 object is
> actually one of the most common cases., so maybe I can add a statement sa=
ying =

> "consider using refcount_t instead of atomic_t"?

That works.  The original message was just confusing and I spent some
time trying to spot a bug in the code.  And really the code is fine
(probably.  maybe.  no reason to think it's not fine).  It's just that
refcounting is preferred as a hardening measure.

regards,
dan carpenter

--===============1300184711457875625==--

