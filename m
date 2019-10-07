Content-Type: multipart/mixed; boundary="===============1300122804147609524=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [brauner:debugfs_namespaces 3/5] kernel/utsname.c:108 copy_utsname() error: 'new_ns' dereferencing possible ERR_PTR()
Date: Mon, 07 Oct 2019 13:26:18 +0300
Message-ID: <20191007102618.GF21515@kadam>
In-Reply-To: <20191007100530.xnpvxrhbl77yabjr@wittgenstein>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1300122804147609524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2019 at 12:05:31PM +0200, Christian Brauner wrote:
> On Mon, Oct 07, 2019 at 12:57:57PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.g=
it debugfs_namespaces
> > head:   aef8406e30cf9b60c76e5de205fa77f3791e2c54
> > commit: fce9acb4ffd1b7b342c69f0c39d49835b7232414 [3/5] DEBUG
> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> I'm very confused about this mail. This is a pure development branch
> that is not tracked by anything and is in extremely rough shape... So
> why exactly is this happening? :) I'm really asking, not complaining.

kbuild tries to be as helpful as possible.  :)  There is a way to turn
it off for devel trees.  It's probably described in the FAQ but who
cares, just leave it on.  It doesn't cost me anything to send these
emails.

regards,
dan carpenter
--===============1300122804147609524==--

