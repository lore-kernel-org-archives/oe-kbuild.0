Content-Type: multipart/mixed; boundary="===============6738889396028448570=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: net/sunrpc/xprtrdma/frwr_ops.c:647 frwr_unmap_async() error: potentially dereferencing uninitialized 'last'.
Date: Wed, 23 Jun 2021 15:27:57 +0300
Message-ID: <20210623122756.GB2094@kadam>
In-Reply-To: <AAA93115-ABDD-44DA-9784-B8A001E9CEC5@oracle.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6738889396028448570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 03:20:10PM +0300, Chuck Lever III wrote:
> Howdy Dan!
> =

> > On Jun 23, 2021, at 6:07 AM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   0c18f29aae7ce3dadd26d8ee3505d07cc982df75
> > commit: e10fa96d347488d1fd278e84f52ba7b25067cc71 xprtrdma: Move cqe to =
struct rpcrdma_mr
> > config: x86_64-randconfig-m001-20210622 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > New smatch warnings:
> > net/sunrpc/xprtrdma/frwr_ops.c:647 frwr_unmap_async() error: potentiall=
y dereferencing uninitialized 'last'.
> > =

> > Old smatch warnings:
> > net/sunrpc/xprtrdma/frwr_ops.c:546 frwr_unmap_sync() error: potentially=
 dereferencing uninitialized 'last'.
> > =

> > vim +/last +647 net/sunrpc/xprtrdma/frwr_ops.c
> > =

> > d8099feda4833b Chuck Lever 2019-06-19  608  void frwr_unmap_async(struc=
t rpcrdma_xprt *r_xprt, struct rpcrdma_req *req)
> > d8099feda4833b Chuck Lever 2019-06-19  609  {
> > d8099feda4833b Chuck Lever 2019-06-19  610  	struct ib_send_wr *first, =
*last, **prev;
> > 5ecef9c8436695 Chuck Lever 2020-11-09  611  	struct rpcrdma_ep *ep =3D =
r_xprt->rx_ep;
> > d8099feda4833b Chuck Lever 2019-06-19  612  	struct rpcrdma_frwr *frwr;
> > d8099feda4833b Chuck Lever 2019-06-19  613  	struct rpcrdma_mr *mr;
> > d8099feda4833b Chuck Lever 2019-06-19  614  	int rc;
> > d8099feda4833b Chuck Lever 2019-06-19  615  =

> > d8099feda4833b Chuck Lever 2019-06-19  616  	/* Chain the LOCAL_INV Wor=
k Requests and post them with
> > d8099feda4833b Chuck Lever 2019-06-19  617  	 * a single ib_post_send()=
 call.
> > d8099feda4833b Chuck Lever 2019-06-19  618  	 */
> > d8099feda4833b Chuck Lever 2019-06-19  619  	frwr =3D NULL;
> > d8099feda4833b Chuck Lever 2019-06-19  620  	prev =3D &first;
> > 265a38d4611360 Chuck Lever 2019-08-19  621  	while ((mr =3D rpcrdma_mr_=
pop(&req->rl_registered))) {
> > =

> > Is it possible for the ->rl_registered list to be empty?
> =

> The one and only call site for frwr_unmap_async() in in rpcrdma_reply_han=
dler():
> =

> 1483         if (!list_empty(&req->rl_registered))
> 1484                 frwr_unmap_async(r_xprt, req);
> 1485                 /* LocalInv completion will complete the RPC */
> 1486         else
> 1487                 kref_put(&req->rl_kref, rpcrdma_reply_done);
> =

> =

> > If not, then just ignore this email.
> =

> I seem to recall smatch catching this problem before. Is there a way
> to annotate frwr_unmap_async() to calm smatch's nerves?

In theory, if you have the cross function DB built then it's not
supposed to print this warning.  But in reality it does.  The data is
stored correctly in DB, but it's not used correctly.  Huh...  I will
investigate.

I don't think the kbuild bot uses the cross function DB, but it only
sends the warning once so who cares.

regards,
dan carpenter

--===============6738889396028448570==--

