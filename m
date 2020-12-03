Content-Type: multipart/mixed; boundary="===============8671358768406335694=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: arch/s390/pci/pci_event.c:101 __zpci_event_availability() error: we previously assumed 'zdev->zbus' could be null (see line 83)
Date: Thu, 03 Dec 2020 14:19:54 +0300
Message-ID: <20201203111954.GK2789@kadam>
In-Reply-To: <52b96642-f78c-478e-913d-b294c385c5ab@linux.ibm.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8671358768406335694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2020 at 11:52:48AM +0100, Niklas Schnelle wrote:
> =

> =

> On 12/3/20 11:27 AM, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   3bb61aa61828499a7d0f5e560051625fd02ae7e4
> > commit: 3047766bc6ec9c6bc9ece85b45a41ff401e8d988 s390/pci: fix enabling=
 a reserved PCI function
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > arch/s390/pci/pci_event.c:101 __zpci_event_availability() error: we pre=
viously assumed 'zdev->zbus' could be null (see line 83)
> > =

> > vim +101 arch/s390/pci/pci_event.c
> > =

> > aa3b7c296732b43 Sebastian Ott   2013-12-12   76  static void __zpci_eve=
nt_availability(struct zpci_ccdf_avail *ccdf)
> > cbc0dd1f856b52b Jan Glauber     2012-11-29   77  {
> > cbc0dd1f856b52b Jan Glauber     2012-11-29   78  	struct zpci_dev *zdev=
 =3D get_zdev_by_fid(ccdf->fid);
> > 9a99649f2a89fdf Sebastian Ott   2016-01-29   79  	struct pci_dev *pdev =
=3D NULL;
> > 623bd44d3f277b7 Sebastian Ott   2017-05-09   80  	enum zpci_state state;
> > d795ddad36cbc82 Sebastian Ott   2013-11-15   81  	int ret;
> > cbc0dd1f856b52b Jan Glauber     2012-11-29   82  =

> > 05bc1be6db4b268 Pierre Morel    2020-03-23  @83  	if (zdev && zdev->zbu=
s && zdev->zbus->bus)
> >                                                                      ^^=
^^^^^^^
> > Check for NULL
> > =

> > 44510d6fa0c00aa Pierre Morel    2020-04-22   84  		pdev =3D pci_get_slo=
t(zdev->zbus->bus, zdev->devfn);
> > 9a99649f2a89fdf Sebastian Ott   2016-01-29   85  =

> > 1f1dcbd4f23bd1f Sebastian Ott   2013-10-22   86  	zpci_err("avail CCDF:=
\n");
> > 1f1dcbd4f23bd1f Sebastian Ott   2013-10-22   87  	zpci_err_hex(ccdf, si=
zeof(*ccdf));
> > cbc0dd1f856b52b Jan Glauber     2012-11-29   88  =

> > cbc0dd1f856b52b Jan Glauber     2012-11-29   89  	switch (ccdf->pec) {
> > 7fc611ff3ff1a0b Sebastian Ott   2015-06-16   90  	case 0x0301: /* Reser=
ved|Standby -> Configured */
> > 7fc611ff3ff1a0b Sebastian Ott   2015-06-16   91  		if (!zdev) {
> > f606b3ef47c9f87 Pierre Morel    2020-03-25   92  			ret =3D clp_add_pci=
_device(ccdf->fid, ccdf->fh, 1);
> > 7fc611ff3ff1a0b Sebastian Ott   2015-06-16   93  			break;
> > 7fc611ff3ff1a0b Sebastian Ott   2015-06-16   94  		}
> > fcf2f402937a669 Sebastian Ott   2013-12-18   95  		zdev->fh =3D ccdf->f=
h;
> > f606b3ef47c9f87 Pierre Morel    2020-03-25   96  		zdev->state =3D ZPCI=
_FN_STATE_CONFIGURED;
> > 3047766bc6ec9c6 Niklas Schnelle 2020-06-18   97  		ret =3D zpci_enable_=
device(zdev);
> > 3047766bc6ec9c6 Niklas Schnelle 2020-06-18   98  		if (ret)
> > 3047766bc6ec9c6 Niklas Schnelle 2020-06-18   99  			break;
> > 3047766bc6ec9c6 Niklas Schnelle 2020-06-18  100  =

> > 3047766bc6ec9c6 Niklas Schnelle 2020-06-18 @101  		pdev =3D pci_scan_si=
ngle_device(zdev->zbus->bus, zdev->devfn);
> >                                                                        =
                       ^^^^^^^^^^^^^^^^
> > Unchecked dereference
> =

> First, thanks for reporting this is definitely appreciated!
> We have also seen the same smatch report internally =

> and I determined that this is a false positive.
> =

> This is because the existing zdev->zbus NULL check could already never
> trigger.

I don't consider it a "false positive" exactly because the NULL checking
is inconsisent.  I would instead say that it is "correct but harmless".

That said, if Smatch can determined that "zdev->zbus" is not NULL then
it doesn't print a warning in these situations.  As it stands now Smatch
doesn't understand lists very well, but I plan to fix this in upcoming
months.  Once that gets fixed, Smatch will still assume that
zpci_create_device() is racy...  :/  And then finally it will only
silence the warning when the cross function database has been built and
I don't think the the zero bot builds the DB for s390.

Anyway, these don't affect runtime so it's not time sensitive.  Thanks
for taking the time to look at these!

regards,
dan carpenter

--===============8671358768406335694==--

