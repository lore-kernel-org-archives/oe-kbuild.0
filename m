Content-Type: multipart/mixed; boundary="===============8253941052348846790=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/memory/fsl_ifc.c:298 fsl_ifc_ctrl_probe() warn: 'fsl_ifc_ctrl_dev->gregs' not released on lines: 298.
Date: Thu, 27 May 2021 17:45:28 +0300
Message-ID: <20210527144528.GM24442@kadam>
In-Reply-To: <CAJKOXPdkDe1iNpZa9X0eRyWO85WBWuhRk-t=ENqkRk3p0=-LuA@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8253941052348846790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 10:36:42AM -0400, Krzysztof Kozlowski wrote:
> On Thu, 27 May 2021 at 05:31, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
> >
> > Hi Krzysztof,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   d7c5303fbc8ac874ae3e597a5a0d3707dc0230b4
> > commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile=
 testing for most of the drivers
> > config: s390-randconfig-m031-20210527 (attached as .config)
> > compiler: s390-linux-gcc (GCC) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > smatch warnings:
> > drivers/memory/fsl_ifc.c:298 fsl_ifc_ctrl_probe() warn: 'fsl_ifc_ctrl_d=
ev->gregs' not released on lines: 298.
> =

> Thanks, I will fix it. I also see some more leaks there...

Oh, yeah?  Which ones?  I will add it to my table of alloc/free pairs.

https://github.com/error27/smatch/blob/master/check_unwind.c#L43

regards,
dan carpenter

--===============8253941052348846790==--

