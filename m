Content-Type: multipart/mixed; boundary="===============1444920953264689765=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [efi:next 39/40] drivers/firmware/efi/libstub/efi-stub-helper.c:265 efi_convert_cmdline() warn: qualifier 'l' ignored for %s specifier
Date: Wed, 20 May 2020 20:54:49 +0300
Message-ID: <20200520175449.GR3041@kadam>
In-Reply-To: <20200520154308.GA3184088@rani.riverdale.lan>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1444920953264689765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 11:43:08AM -0400, Arvind Sankar wrote:
> On Wed, May 20, 2020 at 05:09:03PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
> > head:   e5fbadd1179cdadeaa44d71a9ec068c5bc100524
> > commit: 85f5afd4322d294a7eca0d304744a1646113fbd9 [39/40] efi/libstub: U=
se snprintf with %ls to convert the command line
> > config: x86_64-defconfig (attached as .config)
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > drivers/firmware/efi/libstub/efi-stub-helper.c:265 efi_convert_cmdline(=
) warn: qualifier 'l' ignored for %s specifier
> > =

> > # https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commit/?i=
d=3D85f5afd4322d294a7eca0d304744a1646113fbd9
> > git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/efi/=
efi.git
> > git remote update efi
> > git checkout 85f5afd4322d294a7eca0d304744a1646113fbd9
> > vim +/l +265 drivers/firmware/efi/libstub/efi-stub-helper.c
> > =

> > c625d1c203941f drivers/firmware/efi/efi-stub-helper.c         H. Peter =
Anvin 2013-09-20  258  	options_bytes++;	/* NUL termination */
> > 9403e462fb5ffa drivers/firmware/efi/efi-stub-helper.c         Leif Lind=
holm  2014-04-04  259  =

> > 1e45bf7372c48c drivers/firmware/efi/libstub/efi-stub-helper.c Ard Biesh=
euvel 2020-02-10  260  	status =3D efi_allocate_pages(options_bytes, &cmdli=
ne_addr, max_addr);
> > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy Franz=
      2013-09-22  261  	if (status !=3D EFI_SUCCESS)
> > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy Franz=
      2013-09-22  262  		return NULL;
> > 5fef3870c572a3 drivers/firmware/efi/efi-stub-helper.c         Roy Franz=
      2013-09-22  263  =

> > 85f5afd4322d29 drivers/firmware/efi/libstub/efi-stub-helper.c Arvind Sa=
nkar  2020-05-18  264  	snprintf((char *)cmdline_addr, options_bytes, "%.*l=
s",
> >                                                                        =
                                                                           ^
> > The "l" doesn't make sense here?
> =

> The previous patches add support for wide strings to the version of
> snprintf used here.

Ah.  Thanks.  I will update the Smatch check.

regards,
dan carpenter

--===============1444920953264689765==--

