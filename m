Content-Type: multipart/mixed; boundary="===============9209909541053372904=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH RFC 02/12] vdpa: split vdpasim to core and net modules
Date: Mon, 16 Nov 2020 14:58:12 +0300
Message-ID: <20201116115812.GD18329@kadam>
In-Reply-To: <20201116111618.y4mlsruc7pvq7dmb@steredhat>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9209909541053372904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 12:16:18PM +0100, Stefano Garzarella wrote:
> On Mon, Nov 16, 2020 at 01:47:02PM +0300, Dan Carpenter wrote:
> > On Mon, Nov 16, 2020 at 10:12:26AM +0100, Stefano Garzarella wrote:
> > > Hi Dan,
> > > =

> > > On Mon, Nov 16, 2020 at 12:06:33PM +0300, Dan Carpenter wrote:
> > > > Hi Stefano,
> > > >
> > > > url:    https://github.com/0day-ci/linux/commits/Stefano-Garzarella=
/vdpa-generalize-vdpa-simulator-and-add-block-device/20201113-215247
> > > > base:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > > 585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
> > > > config: x86_64-randconfig-m001-20201114 (attached as .config)
> > > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > >
> > > > smatch warnings:
> > > > drivers/vdpa/vdpa_sim/vdpa_sim.c:242 vdpasim_create() error: uninit=
ialized symbol 'dev'.
> > > =

> > > thanks for the report!
> > > 'kernel test robot' already sent me the same warning, and I'm surpris=
ed that
> > > my gcc 10.2.1 didn't report anything to me.
> > =

> > These were disabled in commit 78a5255ffb6a ("Stop the ad-hoc games with
> > -Wno-maybe-initialized").  You'd have to build with W=3D1
> > =

> =

> Thanks for pointed that out!
> =

> > > =

> > > I'll fix in the next version.
> > =

> > Which static checker was the kbuild test bot using?  I have spent some
> > ten minutes searching for the report but I haven't been able to find it.
> =

> This is the report that I received:
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org/thread/W3X=
HO6YPAPK7P2HXRXGA455BBGYTPHD5/
> =

> Note: the search box in lists.01.org is not working well...

This is going to be frustrating because the W=3D1 warnings will come first
then the Smatch warnings.  The reason that the Smatch warnings exist is
because GCC doesn't catch everthing...  So they both are required, but
most warnings are going to be duplicative.

Also I think people assume I'm going to look at the warning and then
check whether it exists in their latest devel tree.  But actually I just
look at the warning email and forward it on.

Anyway, if you don't want duplicate static checker warnings, don't
introduce bugs.  I'm really good at ignoring complaints about
duplicates.


regards,
dan carpenter

--===============9209909541053372904==--

