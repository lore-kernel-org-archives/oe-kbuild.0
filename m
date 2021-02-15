Content-Type: multipart/mixed; boundary="===============3933954192916662218=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [rdma-rdma:wip/jgg-for-next 198/203] drivers/infiniband/ulp/rtrs/rtrs-srv.c:1805 rtrs_rdma_connect() warn: passing zero to 'PTR_ERR'
Date: Mon, 15 Feb 2021 17:16:33 +0300
Message-ID: <20210215141633.GD2222@kadam>
In-Reply-To: <CAMGffEmbY1FMOHQsKeUK-f=JT6QFGE44Mmu=OFttEJVanbeXvg@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3933954192916662218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 03:02:32PM +0100, Jinpu Wang wrote:
> On Mon, Feb 15, 2021 at 2:58 PM Dan Carpenter <dan.carpenter@oracle.com=
> wrote:
> >
> > On Mon, Feb 15, 2021 at 02:03:31PM +0100, Jinpu Wang wrote:
> > > Hi, Dan,
> > >
> > > On Mon, Feb 15, 2021 at 1:44 PM Dan Carpenter <dan.carpenter@oracle=
.com> wrote:
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.g=
it   wip/jgg-for-next
> > > > head:   c88b31c46cefe50f524a1ad3deaf1599bc9ee2e6
> > > > commit: f0751419d3a15fb06d9b7d9435312472c3cb122d [198/203] RDMA/rtr=
s: Only allow addition of path to an already established session
> > > > config: ia64-randconfig-m031-20210209 (attached as .config)
> > > > compiler: ia64-linux-gcc (GCC) 9.3.0
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > >
> > > > smatch warnings:
> > > > drivers/infiniband/ulp/rtrs/rtrs-srv.c:1805 rtrs_rdma_connect() war=
n: passing zero to 'PTR_ERR'
> > > >
> > > > vim +/PTR_ERR +1805 drivers/infiniband/ulp/rtrs/rtrs-srv.c
> > > >
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1760  static int rtrs_rdm=
a_connect(struct rdma_cm_id *cm_id,
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1761                     =
           const struct rtrs_msg_conn_req *msg,
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1762                     =
           size_t len)
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1763  {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1764          struct rtrs=
_srv_ctx *ctx =3D cm_id->context;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1765          struct rtrs=
_srv_sess *sess;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1766          struct rtrs=
_srv *srv;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1767
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1768          u16 version=
, con_num, cid;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1769          u16 recon_c=
nt;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1770          int err;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1771
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1772          if (len < s=
izeof(*msg)) {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1773                  pr_=
err("Invalid RTRS connection request\n");
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1774                  got=
o reject_w_econnreset;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1775          }
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1776          if (le16_to=
_cpu(msg->magic) !=3D RTRS_MAGIC) {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1777                  pr_=
err("Invalid RTRS magic\n");
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1778                  got=
o reject_w_econnreset;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1779          }
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1780          version =3D=
 le16_to_cpu(msg->version);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1781          if (version=
 >> 8 !=3D RTRS_PROTO_VER_MAJOR) {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1782                  pr_=
err("Unsupported major RTRS version: %d, expected %d\n",
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1783                     =
    version >> 8, RTRS_PROTO_VER_MAJOR);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1784                  got=
o reject_w_econnreset;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1785          }
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1786          con_num =3D=
 le16_to_cpu(msg->cid_num);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1787          if (con_num=
 > 4096) {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1788                  /* =
Sanity check */
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1789                  pr_=
err("Too many connections requested: %d\n", con_num);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1790                  got=
o reject_w_econnreset;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1791          }
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1792          cid =3D le1=
6_to_cpu(msg->cid);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1793          if (cid >=
=3D con_num) {
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1794                  /* =
Sanity check */
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1795                  pr_=
err("Incorrect cid: %d >=3D %d\n", cid, con_num);
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1796                  got=
o reject_w_econnreset;
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1797          }
> > > > 9cb837480424e7 Jack Wang      2020-05-11  1798          recon_cnt =
=3D le16_to_cpu(msg->recon_cnt);
> > > > f0751419d3a15f Md Haris Iqbal 2021-02-12  1799          srv =3D get=
_or_create_srv(ctx, &msg->paths_uuid, msg->first_conn);
> > > > d715ff8acbd587 Guoqing Jiang  2020-10-23  1800          /*
> > > > d715ff8acbd587 Guoqing Jiang  2020-10-23  1801           * "refcoun=
t =3D=3D 0" happens if a previous thread calls get_or_create_srv
> > > > d715ff8acbd587 Guoqing Jiang  2020-10-23  1802           * allocate=
 srv, but chunks of srv are not allocated yet.
> > > > d715ff8acbd587 Guoqing Jiang  2020-10-23  1803           */
> > > > f0751419d3a15f Md Haris Iqbal 2021-02-12  1804          if (IS_ERR(=
srv) || refcount_read(&srv->refcount) =3D=3D 0) {
> > > > f0751419d3a15f Md Haris Iqbal 2021-02-12 @1805                  err=
 =3D PTR_ERR(srv);
> > > >
> > > > It's not 100% clear to me that an error code is required when
> > > > refcount_read() is zero.  Maybe "err =3D 0;" is okay in that situat=
ion?
> > > I don't see how srv can be zero
> >
> > The cross function database was probably out of date.
> =

> Thanks for the hint, just curious where is the cross-function
> database? is it auto-generated by gcc during compile?

This is a Smatch warning.

https://www.spinics.net/lists/smatch/msg00568.html

regards,
dan carpenter

--===============3933954192916662218==--

