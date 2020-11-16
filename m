Content-Type: multipart/mixed; boundary="===============7169703112602872619=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH RFC 02/12] vdpa: split vdpasim to core and net modules
Date: Mon, 16 Nov 2020 13:47:02 +0300
Message-ID: <20201116104702.GC18329@kadam>
In-Reply-To: <20201116091226.2ryi2nfz7wdduvtb@steredhat>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7169703112602872619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:12:26AM +0100, Stefano Garzarella wrote:
> Hi Dan,
> =

> On Mon, Nov 16, 2020 at 12:06:33PM +0300, Dan Carpenter wrote:
> > Hi Stefano,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Stefano-Garzarella/vdp=
a-generalize-vdpa-simulator-and-add-block-device/20201113-215247
> > base:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > 585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
> > config: x86_64-randconfig-m001-20201114 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/vdpa/vdpa_sim/vdpa_sim.c:242 vdpasim_create() error: uninitiali=
zed symbol 'dev'.
> =

> thanks for the report!
> 'kernel test robot' already sent me the same warning, and I'm surprised t=
hat
> my gcc 10.2.1 didn't report anything to me.

These were disabled in commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized").  You'd have to build with W=3D1

> =

> I'll fix in the next version.

Which static checker was the kbuild test bot using?  I have spent some
ten minutes searching for the report but I haven't been able to find it.

regards,
dan carpenter
--===============7169703112602872619==--

