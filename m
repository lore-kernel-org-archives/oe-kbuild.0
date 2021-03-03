Content-Type: multipart/mixed; boundary="===============3675531433646310868=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/mtd/parsers/qcomsmempart.c:109 parse_qcomsmem_part() warn: passing zero to 'PTR_ERR'
Date: Wed, 03 Mar 2021 14:08:47 +0300
Message-ID: <20210303110847.GA2222@kadam>
In-Reply-To: <20210303094840.0e30392c@xps13>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3675531433646310868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 09:48:40AM +0100, Miquel Raynal wrote:
> =

> @Manni, I thought you would be added in Cc automatically as you're the
> author of the fixed commit, but I was wrong, sorry for the mistake.

That's very weird...  get_maintainer.pl does look up the fixes tag and
adds the commit signers.  I tested your patch and it added
<mani@kernel.org> for me.

regards,
dan carpenter

--===============3675531433646310868==--

