Content-Type: multipart/mixed; boundary="===============1882287176144594338=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/3] dma-direct: provide the ability to reserve per-numa CMA
Date: Fri, 05 Jun 2020 11:57:51 +0300
Message-ID: <20200605085751.GQ30374@kadam>
In-Reply-To: <B926444035E5E2439431908E3842AFD24E0011@DGGEMI525-MBS.china.huawei.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1882287176144594338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 06:04:31AM +0000, Song Bao Hua (Barry Song) wrote:
> =

> =

> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter(a)oracle.com]
> > Sent: Thursday, June 4, 2020 11:37 PM
> > To: kbuild(a)lists.01.org; Song Bao Hua (Barry Song)
> > <song.bao.hua@hisilicon.com>; hch(a)lst.de; m.szyprowski(a)samsung.co=
m;
> > robin.murphy(a)arm.com; catalin.marinas(a)arm.com
> > Cc: lkp(a)intel.com; Dan Carpenter <error27@gmail.com>;
> > kbuild-all(a)lists.01.org; iommu(a)lists.linux-foundation.org;
> > linux-arm-kernel(a)lists.infradead.org; linux-kernel(a)vger.kernel.org;=
 Linuxarm
> > <linuxarm@huawei.com>; Jonathan Cameron
> > <jonathan.cameron@huawei.com>; John Garry <john.garry@huawei.com>
> > Subject: Re: [PATCH 1/3] dma-direct: provide the ability to reserve per=
-numa
> > CMA
> > =

> > Hi Barry,
> > =

> > url:
> > https://github.com/0day-ci/linux/commits/Barry-Song/support-per-numa-CM
> > A-for-ARM-server/20200603-104821
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> > for-next/core
> > config: x86_64-randconfig-m001-20200603 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> Dan, thanks! Good catch!
> as this patch has not been in mainline yet, is it correct to add these "r=
eported-by" in patch v2?

These are just an automated email from the zero day bot.  I look over
the Smatch warnings and then forward them on.

regards,
dan carpenter

--===============1882287176144594338==--

