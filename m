Content-Type: multipart/mixed; boundary="===============7303230517735640398=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitialized symbol 'nents'.
Date: Wed, 30 Oct 2019 11:19:01 +0300
Message-ID: <20191030081628.GD3866@kadam>
In-Reply-To: <20191026024141.GA3339@localhost.localdomain>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7303230517735640398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2019 at 11:41:41AM +0900, Suwan Kim wrote:
> On Thu, Oct 24, 2019 at 04:52:52PM -0600, shuah wrote:
> > On 10/24/19 1:45 PM, Dan Carpenter wrote:
> > > On Wed, Oct 23, 2019 at 04:11:20PM +0900, Suwan Kim wrote:
> > > > On Tue, Oct 22, 2019 at 12:28:39PM +0300, Dan Carpenter wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git master
> > > > > head:   7d194c2100ad2a6dded545887d02754948ca5241
> > > > > commit: ea44d190764b4422af4d1c29eaeb9e69e353b406 usbip: Implement=
 SG support to vhci-hcd and stub driver
> > > > > date:   7 weeks ago
> > > > > =

> > > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > > =

> > > > > New smatch warnings:
> > > > > drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uni=
nitialized symbol 'nents'.
> > > > > =

> > > > > Old smatch warnings:
> > > > > drivers/usb/usbip/stub_rx.c:450 stub_recv_xbuff() error: uninitia=
lized symbol 'ret'.
> =

> Here, ret is not initialized, meaning priv->num_urbs is 0.
> priv->urbs must be greater than zero.
> priv->num_urbs =3D 0 means nents is 0 (line 505)
> =

> Dan, What is the relationship between old and new warnings?
> priv->num_urbs is set as value of "num_urbs" at stub_recv_cmd_submit()
> and "num_urbs" is initialized as 1 first. "num_urbs" will be reset
> only at the place where smatch new warnings happened (line 505).
> =

> So, In my opinion, old smatch warnings should occur after the new
> smatch warnings. Does=C2=A0this look right to=C2=A0you?

I don't know exactly how the 0day bot runs Smatch.  If you have cross
function analysis enabled then silencing the uninitialized "nents"
warning will also silence the uninitialized "ret" warning.

regards,
dan carpenter

--===============7303230517735640398==--

