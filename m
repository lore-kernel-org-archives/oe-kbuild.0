Content-Type: multipart/mixed; boundary="===============0480323786141410479=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
Subject: Re: [kbuild-all] Re: [PATCH 1/3] dma-direct: provide the ability to reserve per-numa CMA
Date: Sat, 06 Jun 2020 11:46:55 +0800
Message-ID: <20200606034655.GH2459@intel.com>
In-Reply-To: <20200605085751.GQ30374@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0480323786141410479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 11:57:51AM +0300, Dan Carpenter wrote:
> On Fri, Jun 05, 2020 at 06:04:31AM +0000, Song Bao Hua (Barry Song) wrote:
> > =

> > =

> > > -----Original Message-----
> > > From: Dan Carpenter [mailto:dan.carpenter(a)oracle.com]
> > > Sent: Thursday, June 4, 2020 11:37 PM
> > > To: kbuild(a)lists.01.org; Song Bao Hua (Barry Song)
> > > <song.bao.hua@hisilicon.com>; hch(a)lst.de; m.szyprowski(a)samsung.=
com;
> > > robin.murphy(a)arm.com; catalin.marinas(a)arm.com
> > > Cc: lkp(a)intel.com; Dan Carpenter <error27@gmail.com>;
> > > kbuild-all(a)lists.01.org; iommu(a)lists.linux-foundation.org;
> > > linux-arm-kernel(a)lists.infradead.org; linux-kernel(a)vger.kernel.or=
g; Linuxarm
> > > <linuxarm@huawei.com>; Jonathan Cameron
> > > <jonathan.cameron@huawei.com>; John Garry <john.garry@huawei.com>
> > > Subject: Re: [PATCH 1/3] dma-direct: provide the ability to reserve p=
er-numa
> > > CMA
> > > =

> > > Hi Barry,
> > > =

> > > url:
> > > https://github.com/0day-ci/linux/commits/Barry-Song/support-per-numa-=
CM
> > > A-for-ARM-server/20200603-104821
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it
> > > for-next/core
> > > config: x86_64-randconfig-m001-20200603 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > Dan, thanks! Good catch!
> > as this patch has not been in mainline yet, is it correct to add these =
"reported-by" in patch v2?
Hi Barry, we provides the suggestion here, but you may decide
to add or not as appropriate for your situation. For the
patch still under development, it is not that necessary to add i think.

> =

> These are just an automated email from the zero day bot.  I look over
> the Smatch warnings and then forward them on.
> =

> regards,
> dan carpenter
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============0480323786141410479==--

