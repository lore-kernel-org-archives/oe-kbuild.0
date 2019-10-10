Content-Type: multipart/mixed; boundary="===============8394864254569129589=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [linux-stable-rc:linux-3.16.y 6719/6738] net/sched/sch_netem.c:581 netem_enqueue() error: we previously assumed 'skb' could be null (see line 505)
Date: Thu, 10 Oct 2019 14:00:16 +0300
Message-ID: <20191010110016.GM13286@kadam>
In-Reply-To: <a7c65ed47401521974c14d1a48419169459a9e05.camel@decadent.org.uk>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8394864254569129589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 04:05:44PM +0100, Ben Hutchings wrote:
> On Wed, 2019-10-09 at 11:12 +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git linux-3.16.y
> > head:   c508a924ddd1119a8037c1ec23f560eade0444c6
> > commit: 61763432af929bd3d091a18469c130719f00c6de [6719/6738] net: netem=
: fix backlog accounting for corrupted GSO frames
> > =

> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > net/sched/sch_netem.c:581 netem_enqueue() error: we previously assumed =
'skb' could be null (see line 505)
> > net/sched/sch_netem.c:581 netem_enqueue() error: dereferencing freed me=
mory 'skb'
> =

> It seems like the same (or similar) bugs are introduced by the upstream
> version.

Huh.  Smatch ignores those because unnecessary checks for NULL are
common inside macros, and unlikely() is a macro so it doesn't print
an inconsistent checking warning.

I'll write a special case for that and see what turns up.

regards,
dan carpenter

--===============8394864254569129589==--

