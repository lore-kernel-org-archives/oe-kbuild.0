Content-Type: multipart/mixed; boundary="===============3065754415202984511=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [efi:next 39/40] drivers/firmware/efi/libstub/efi-stub-helper.c:265 efi_convert_cmdline() warn: qualifier 'l' ignored for %s specifier
Date: Wed, 20 May 2020 21:20:22 +0300
Message-ID: <20200520182022.GS3041@kadam>
In-Reply-To: <20200520180008.GA3428271@rani.riverdale.lan>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3065754415202984511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 02:00:08PM -0400, Arvind Sankar wrote:
> On Wed, May 20, 2020 at 08:54:49PM +0300, Dan Carpenter wrote:
> > On Wed, May 20, 2020 at 11:43:08AM -0400, Arvind Sankar wrote:
> > > On Wed, May 20, 2020 at 05:09:03PM +0300, Dan Carpenter wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git=
 next
> > > > head:   e5fbadd1179cdadeaa44d71a9ec068c5bc100524
> > > > commit: 85f5afd4322d294a7eca0d304744a1646113fbd9 [39/40] efi/libstu=
b: Use snprintf with %ls to convert the command line
> > > > config: x86_64-defconfig (attached as .config)
> > > > =

> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > =

> > > > New smatch warnings:
> > > > drivers/firmware/efi/libstub/efi-stub-helper.c:265 efi_convert_cmdl=
ine() warn: qualifier 'l' ignored for %s specifier
> > > > =

> > > > # https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commi=
t/?id=3D85f5afd4322d294a7eca0d304744a1646113fbd9
> > > > git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/=
efi/efi.git
> > > > git remote update efi
> > > > git checkout 85f5afd4322d294a7eca0d304744a1646113fbd9
> > > > vim +/l +265 drivers/firmware/efi/libstub/efi-stub-helper.c
> > > > =

> > > > c625d1c203941f drivers/firmware/efi/efi-stub-helper.c         H. Pe=
ter Anvin 2013-09-20  258  	options_bytes++;	/* NUL termination */
> > > > 9403e462fb5ffa drivers/firmware/efi/efi-stub-helper.c         Leif =
Lindholm  2014-04-04  259  =

> > > > 1e45bf7372c48c drivers/firmware/efi/libstub/efi-stub-helper.c Ard B=
iesheuvel 2020-02-10  260  	status =3D efi_allocate_pages(options_bytes, &c=
mdline_addr, max_addr);
> > > > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy F=
ranz      2013-09-22  261  	if (status !=3D EFI_SUCCESS)
> > > > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy F=
ranz      2013-09-22  262  		return NULL;
> > > > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy F=
ranz      2013-09-22  263  =

> > > > 85f5afd4322d29 drivers/firmware/efi/libstub/efi-stub-helper.c Arvin=
d Sankar  2020-05-18  264  	snprintf((char *)cmdline_addr, options_bytes, "=
%.*ls",
> > > >                                                                    =
                                                                           =
    ^
> > > > The "l" doesn't make sense here?
> > > =

> > > The previous patches add support for wide strings to the version of
> > > snprintf used here.
> > =

> > Ah.  Thanks.  I will update the Smatch check.
> > =

> > regards,
> > dan carpenter
> > =

> Note that the main kernel's printf still doesn't support it. It's only
> been added to the version in drivers/firmware/efi/libstub/vsprintf.c
> (added as part of this series).

Ah... I looked and looked at lib/vsprintf.c and wondered if I was going
mad.  :P Thanks.

regards,
dan carpenter
--===============3065754415202984511==--

