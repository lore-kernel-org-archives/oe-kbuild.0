Content-Type: multipart/mixed; boundary="===============7354078632777751673=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: net/mctp/test/utils.c:15 mctp_test_dev_tx() error: use kfree_skb() here instead of kfree(skb)
Date: Mon, 29 Nov 2021 10:53:14 +0300
Message-ID: <20211129075314.GP18178@kadam>
In-Reply-To: <0b6aec80835439afe62010a4228fc1af49f68e2b.camel@codeconstruct.com.au>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7354078632777751673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 10:24:15AM +0800, Jeremy Kerr wrote:
> Hi Dan,
> =

> > smatch warnings:
> > net/mctp/test/utils.c:15 mctp_test_dev_tx() error: use kfree_skb() here=
 instead of kfree(skb)
> =

> Thanks for the report! I've sent a fix, you're CCed.
> =

> However, I can 't seem to recreate the smatch warning; could you include
> the build command you're using for these? I've tried with
> =

>     make [...] C=3D1 CHECK=3D/path/to/smatch

The CHECK=3D string needs a -p=3Dkernel added to it or it won't do kernel
specific checking.

	make [...] C=3D1 CHECK=3D"/path/to/smatch -p=3Dkernel"

regards,
dan carpenter

--===============7354078632777751673==--

