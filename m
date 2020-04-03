Content-Type: multipart/mixed; boundary="===============7042082212572082857=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 2/2] PCI: HIP: Add handling of HiSilicon HIP PCIe controller errors
Date: Fri, 03 Apr 2020 13:23:13 +0300
Message-ID: <20200403102313.GD2066@kadam>
In-Reply-To: <20200325173639.GA484@google.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7042082212572082857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

I've added the kbuild list because I think you have a point.

On Wed, Mar 25, 2020 at 12:36:39PM -0500, Bjorn Helgaas wrote:
> [+cc Dan]
> =


Shiju had already added me to the CC list...

> On Wed, Mar 25, 2020 at 01:55:18PM +0000, Shiju Jose wrote:
> > The HiSilicon HIP PCIe controller is capable of handling errors
> > on root port and perform port reset separately at each root port.
> > =

> > This patch add error handling driver for HIP PCIe controller to log
> > and report recoverable errors. Perform root port reset and restore
> > link status after the recovery.
> > =

> > Following are some of the PCIe controller's recoverable errors
> > 1. completion transmission timeout error.
> > 2. CRS retry counter over the threshold error.
> > 3. ECC 2 bit errors
> > 4. AXI bresponse/rresponse errors etc.
> > =

> > Also fix the following Smatch warning:
> > warn: should '((((1))) << (9 + i))' be a 64 bit type?
> > if (err->val_bits & BIT(HISI_PCIE_LOCAL_VALID_ERR_MISC + i))
> >      ^^^ This should be BIT_ULL() because it goes up to 9 + 32.
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> I'm glad you did this fix, and thanks for acknowledging Dan, but I
> don't think it's necessary to mention it in the commit log here
> because it won't really be useful in the future.  It's only relevant
> when comparing the unmerged versions of this series, e.g., v4 compared
> to v3.

It's the kbuild template which suggests adding the Reported-by tags but
you're right that it's not really appropriate for patches that haven't
been merged yet.  I wish there were a correct tag.  I just saw yesterday
where a maintainer insisted that someone add a Suggested-by tag and I
don't think that's appropriate either.

regards,
dan carpenter

--===============7042082212572082857==--

