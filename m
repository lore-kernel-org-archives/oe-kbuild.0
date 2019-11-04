Content-Type: multipart/mixed; boundary="===============4728559398864560752=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-next:master 7938/8210] fs/erofs/super.c:190 erofs_read_superblock() warn: passing the wrong variable to kunmap()
Date: Mon, 04 Nov 2019 09:52:50 +0300
Message-ID: <20191104065250.GE21796@kadam>
In-Reply-To: <20191103021836.GA6810@hsiangkao-HP-ZHAN-66-Pro-G1>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4728559398864560752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 03, 2019 at 10:18:39AM +0800, Gao Xiang wrote:
> > 0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-0=
4  181  	ret =3D strscpy(sbi->volume_name, dsb->volume_name,
> > 0259f209487c83 fs/erofs/super.c              Gao Xiang        2019-09-0=
4  182  		      sizeof(dsb->volume_name));
> > a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-1=
8  183  	if (ret < 0) {	/* -E2BIG */
> > 4f761fa253b49f fs/erofs/super.c              Gao Xiang        2019-09-0=
4  184  		erofs_err(sb, "bad volume name without NIL terminator");
> > a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-1=
8  185  		ret =3D -EFSCORRUPTED;
> > a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-1=
8  186  		goto out;
> > a64d9493f587f8 drivers/staging/erofs/super.c Gao Xiang        2019-08-1=
8  187  	}
> > ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-2=
6  188  	ret =3D 0;
> > ba2b77a8202287 drivers/staging/erofs/super.c Gao Xiang        2018-07-2=
6  189  out:
> > f0a6634246f9d8 fs/erofs/super.c              Pratik Shinde    2019-10-3=
0 @190  	kunmap(data);
> >                                                                        =
         ^^^^^^^^^^^^
> > This should be kunmap(page);.  kmap() and kmap_atomic() are tricky like
> > that.
> =

> Thanks for your report. I will fix it soon (would you mind me fold it
> info the original patch?).

No problem.  Go ahead an fold it in.

regards,
dan carpenter

--===============4728559398864560752==--

