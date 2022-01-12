Content-Type: multipart/mixed; boundary="===============3116484211151833292=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:bio_alloc-cleanup 5/13] drivers/block/drbd/drbd_receiver.c:1725:1: sparse: sparse: unused label 'fail'
Date: Wed, 12 Jan 2022 20:33:41 +0800
Message-ID: <202201122005.kVtxiFv4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3116484211151833292==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git bio_alloc-cleanup
head:   152c964c974a6e3bf0dd15a8d100c075087d5186
commit: 192922838a1e77811c20c6b8973983a5939edee2 [5/13] drbd: bio_alloc can=
't fail if it is allow to sleep
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
config: mips-randconfig-s032-20220112 (https://download.01.org/0day-ci/arch=
ive/20220112/202201122005.kVtxiFv4-lkp(a)intel.com/config)
compiler: mips64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        git remote add hch-block git://git.infradead.org/users/hch/block.git
        git fetch --no-tags hch-block bio_alloc-cleanup
        git checkout 192922838a1e77811c20c6b8973983a5939edee2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash drivers/block/drbd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
>> drivers/block/drbd/drbd_receiver.c:1725:1: sparse: sparse: unused label =
'fail'
   drivers/block/drbd/drbd_receiver.c:5350:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5351:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5360:54: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:5417:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:5417:14: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:5417:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:273:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:273:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:273:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:529:29: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:529:29: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:529:29: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:601:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:601:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:601:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:705:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:705:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:705:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:774:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:774:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:774:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:1167:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1168:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1169:28: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1173:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1174:28: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1179:27: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:1180:28: sparse: sparse: cast to rest=
ricted __be16
   drivers/block/drbd/drbd_receiver.c:822:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:822:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:822:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:877:14: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:877:14: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:877:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:1042:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1042:14: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:1042:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:1433:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1433:14: sparse:    struct disk_conf =
[noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:1433:14: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:1587:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:1587:14: sparse:    struct disk_conf =
[noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:1587:14: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:1888:22: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1892:22: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:1904:22: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2152:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:2186:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:2400:22: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2400:22: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:2400:22: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2410:27: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2410:27: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:2410:27: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2589:24: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2617:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:2628:20: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:2661:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2661:14: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:2661:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:2793:22: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:2793:22: sparse:    struct disk_conf =
[noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:2793:22: sparse:    struct disk_conf *
   drivers/block/drbd/drbd_receiver.c:2849:18: sparse: sparse: cast to rest=
ricted __be64
   drivers/block/drbd/drbd_receiver.c:2850:18: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3061:23: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3061:23: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3061:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3137:23: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3137:23: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3137:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3194:23: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3194:23: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3194:23: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3540:14: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3540:14: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3540:14: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3672:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3673:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3674:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3675:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3676:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3677:27: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3698:22: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3698:22: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3698:22: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3782:9: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:3782:9: sparse:    struct net_conf [n=
oderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:3782:9: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:3940:46: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:3999:55: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4000:57: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4001:56: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4002:53: sparse: sparse: cast to rest=
ricted __be32
   drivers/block/drbd/drbd_receiver.c:4036:25: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4036:25: sparse:    struct net_conf [=
noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:4036:25: sparse:    struct net_conf *
   drivers/block/drbd/drbd_receiver.c:4041:17: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   drivers/block/drbd/drbd_receiver.c:4041:17: sparse:    struct disk_conf =
[noderef] __rcu *
   drivers/block/drbd/drbd_receiver.c:4041:17: sparse:    struct disk_conf *

vim +/fail +1725 drivers/block/drbd/drbd_receiver.c

9104d31a759fbad Lars Ellenberg      2016-06-14  1618  =

9104d31a759fbad Lars Ellenberg      2016-06-14  1619  =

6ec2a0f2bc07d42 Lee Jones           2021-03-12  1620  /*
fbe29dec9862236 Andreas Gruenbacher 2011-02-17  1621   * drbd_submit_peer_r=
equest()
b30ab7913b0a7b1 Andreas Gruenbacher 2011-07-03  1622   * @device:	DRBD devi=
ce.
db830c464b69e26 Andreas Gruenbacher 2011-02-04  1623   * @peer_req:	peer re=
quest
10f6d9926cd17af Lars Ellenberg      2011-01-24  1624   *
10f6d9926cd17af Lars Ellenberg      2011-01-24  1625   * May spread the pag=
es to multiple bios,
10f6d9926cd17af Lars Ellenberg      2011-01-24  1626   * depending on bio_a=
dd_page restrictions.
10f6d9926cd17af Lars Ellenberg      2011-01-24  1627   *
10f6d9926cd17af Lars Ellenberg      2011-01-24  1628   * Returns 0 if all b=
ios have been submitted,
10f6d9926cd17af Lars Ellenberg      2011-01-24  1629   * -ENOMEM if we coul=
d not allocate enough bios,
10f6d9926cd17af Lars Ellenberg      2011-01-24  1630   * -ENOSPC (any bette=
r suggestion?) if we have not been able to bio_add_page a
10f6d9926cd17af Lars Ellenberg      2011-01-24  1631   *  single page to an=
 empty bio (which should never happen and likely indicates
10f6d9926cd17af Lars Ellenberg      2011-01-24  1632   *  that the lower le=
vel IO stack is in some way broken). This has been observed
10f6d9926cd17af Lars Ellenberg      2011-01-24  1633   *  on certain Xen de=
ployments.
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1634   */
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1635  /* TODO allocate from=
 our own bio_set. */
b30ab7913b0a7b1 Andreas Gruenbacher 2011-07-03  1636  int drbd_submit_peer_=
request(struct drbd_device *device,
fbe29dec9862236 Andreas Gruenbacher 2011-02-17  1637  			     struct drbd_p=
eer_request *peer_req,
bb3cc85e16431bb Mike Christie       2016-06-05  1638  			     const unsigne=
d op, const unsigned op_flags,
bb3cc85e16431bb Mike Christie       2016-06-05  1639  			     const int fau=
lt_type)
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1640  {
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1641  	struct bio *bios =3D=
 NULL;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1642  	struct bio *bio;
db830c464b69e26 Andreas Gruenbacher 2011-02-04  1643  	struct page *page =
=3D peer_req->pages;
db830c464b69e26 Andreas Gruenbacher 2011-02-04  1644  	sector_t sector =3D =
peer_req->i.sector;
11f8b2b69d32d43 Andreas Gruenbacher 2014-09-11  1645  	unsigned data_size =
=3D peer_req->i.size;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1646  	unsigned n_bios =3D =
0;
11f8b2b69d32d43 Andreas Gruenbacher 2014-09-11  1647  	unsigned nr_pages =
=3D (data_size + PAGE_SIZE -1) >> PAGE_SHIFT;
10f6d9926cd17af Lars Ellenberg      2011-01-24  1648  	int err =3D -ENOMEM;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1649  =

dd4f699da674010 Lars Ellenberg      2016-06-14  1650  	/* TRIM/DISCARD: for=
 now, always use the helper function
dd4f699da674010 Lars Ellenberg      2016-06-14  1651  	 * blkdev_issue_zero=
out(..., discard=3Dtrue).
dd4f699da674010 Lars Ellenberg      2016-06-14  1652  	 * It's synchronous,=
 but it does the right thing wrt. bio splitting.
dd4f699da674010 Lars Ellenberg      2016-06-14  1653  	 * Correctness first=
, performance later.  Next step is to code an
dd4f699da674010 Lars Ellenberg      2016-06-14  1654  	 * asynchronous vari=
ant of the same.
dd4f699da674010 Lars Ellenberg      2016-06-14  1655  	 */
f31e583aa2c2089 Lars Ellenberg      2018-12-20  1656  	if (peer_req->flags =
& (EE_TRIM|EE_WRITE_SAME|EE_ZEROOUT)) {
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1657  		/* wait for all pen=
ding IO completions, before we start
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1658  		 * zeroing things o=
ut. */
5dd2ca1912714a0 Andreas Gruenbacher 2014-08-11  1659  		conn_wait_active_ee=
_empty(peer_req->peer_device->connection);
45d2933c921c51d Lars Ellenberg      2014-04-23  1660  		/* add it to the ac=
tive list now,
45d2933c921c51d Lars Ellenberg      2014-04-23  1661  		 * so we can find i=
t to present it in debugfs */
21ae5d7f95aa1a6 Lars Ellenberg      2014-05-05  1662  		peer_req->submit_ji=
f =3D jiffies;
21ae5d7f95aa1a6 Lars Ellenberg      2014-05-05  1663  		peer_req->flags |=
=3D EE_SUBMITTED;
700ca8c04a0f440 Philipp Reisner     2016-06-14  1664  =

700ca8c04a0f440 Philipp Reisner     2016-06-14  1665  		/* If this was a re=
sync request from receive_rs_deallocated(),
700ca8c04a0f440 Philipp Reisner     2016-06-14  1666  		 * it is already on=
 the sync_ee list */
700ca8c04a0f440 Philipp Reisner     2016-06-14  1667  		if (list_empty(&pee=
r_req->w.list)) {
45d2933c921c51d Lars Ellenberg      2014-04-23  1668  			spin_lock_irq(&dev=
ice->resource->req_lock);
45d2933c921c51d Lars Ellenberg      2014-04-23  1669  			list_add_tail(&pee=
r_req->w.list, &device->active_ee);
45d2933c921c51d Lars Ellenberg      2014-04-23  1670  			spin_unlock_irq(&d=
evice->resource->req_lock);
700ca8c04a0f440 Philipp Reisner     2016-06-14  1671  		}
700ca8c04a0f440 Philipp Reisner     2016-06-14  1672  =

f31e583aa2c2089 Lars Ellenberg      2018-12-20  1673  		if (peer_req->flags=
 & (EE_TRIM|EE_ZEROOUT))
f31e583aa2c2089 Lars Ellenberg      2018-12-20  1674  			drbd_issue_peer_di=
scard_or_zero_out(device, peer_req);
9104d31a759fbad Lars Ellenberg      2016-06-14  1675  		else /* EE_WRITE_SA=
ME */
9104d31a759fbad Lars Ellenberg      2016-06-14  1676  			drbd_issue_peer_ws=
ame(device, peer_req);
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1677  		return 0;
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1678  	}
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1679  =

45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1680  	/* In most cases, we=
 will only need one bio.  But in case the lower
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1681  	 * level restriction=
s happen to be different at this offset on this
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1682  	 * side than those o=
f the sending peer, we may need to submit the
9476f39d66041ca Lars Ellenberg      2011-02-23  1683  	 * request in more t=
han one bio.
9476f39d66041ca Lars Ellenberg      2011-02-23  1684  	 *
9476f39d66041ca Lars Ellenberg      2011-02-23  1685  	 * Plain bio_alloc i=
s good enough here, this is no DRBD internally
9476f39d66041ca Lars Ellenberg      2011-02-23  1686  	 * generated bio, bu=
t a bio allocated on behalf of the peer.
9476f39d66041ca Lars Ellenberg      2011-02-23  1687  	 */
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1688  next_bio:
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1689  	bio =3D bio_alloc(GF=
P_NOIO, nr_pages);
db830c464b69e26 Andreas Gruenbacher 2011-02-04  1690  	/* > peer_req->i.sec=
tor, unless this is the first bio */
4f024f3797c43cb Kent Overstreet     2013-10-11  1691  	bio->bi_iter.bi_sect=
or =3D sector;
74d46992e0d9dee Christoph Hellwig   2017-08-23  1692  	bio_set_dev(bio, dev=
ice->ldev->backing_bdev);
bb3cc85e16431bb Mike Christie       2016-06-05  1693  	bio_set_op_attrs(bio=
, op, op_flags);
db830c464b69e26 Andreas Gruenbacher 2011-02-04  1694  	bio->bi_private =3D =
peer_req;
fcefa62e4c26e70 Andreas Gruenbacher 2011-02-17  1695  	bio->bi_end_io =3D d=
rbd_peer_request_endio;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1696  =

45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1697  	bio->bi_next =3D bio=
s;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1698  	bios =3D bio;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1699  	++n_bios;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1700  =

45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1701  	page_chain_for_each(=
page) {
11f8b2b69d32d43 Andreas Gruenbacher 2014-09-11  1702  		unsigned len =3D mi=
n_t(unsigned, data_size, PAGE_SIZE);
06efffda51d9785 Ming Lei            2016-11-11  1703  		if (!bio_add_page(b=
io, page, len, 0))
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1704  			goto next_bio;
11f8b2b69d32d43 Andreas Gruenbacher 2014-09-11  1705  		data_size -=3D len;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1706  		sector +=3D len >> =
9;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1707  		--nr_pages;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1708  	}
11f8b2b69d32d43 Andreas Gruenbacher 2014-09-11  1709  	D_ASSERT(device, dat=
a_size =3D=3D 0);
a0fb3c47a1aae5d Lars Ellenberg      2014-04-28  1710  	D_ASSERT(device, pag=
e =3D=3D NULL);
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1711  =

db830c464b69e26 Andreas Gruenbacher 2011-02-04  1712  	atomic_set(&peer_req=
->pending_bios, n_bios);
21ae5d7f95aa1a6 Lars Ellenberg      2014-05-05  1713  	/* for debugfs: upda=
te timestamp, mark as submitted */
21ae5d7f95aa1a6 Lars Ellenberg      2014-05-05  1714  	peer_req->submit_jif=
 =3D jiffies;
21ae5d7f95aa1a6 Lars Ellenberg      2014-05-05  1715  	peer_req->flags |=3D=
 EE_SUBMITTED;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1716  	do {
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1717  		bio =3D bios;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1718  		bios =3D bios->bi_n=
ext;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1719  		bio->bi_next =3D NU=
LL;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1720  =

ed00aabd5eb9fb4 Christoph Hellwig   2020-07-01  1721  		drbd_submit_bio_noa=
cct(device, fault_type, bio);
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1722  	} while (bios);
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1723  	return 0;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1724  =

45bb912bd5ea4d2 Lars Ellenberg      2010-05-14 @1725  fail:
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1726  	while (bios) {
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1727  		bio =3D bios;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1728  		bios =3D bios->bi_n=
ext;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1729  		bio_put(bio);
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1730  	}
10f6d9926cd17af Lars Ellenberg      2011-01-24  1731  	return err;
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1732  }
45bb912bd5ea4d2 Lars Ellenberg      2010-05-14  1733  =


:::::: The code at line 1725 was first introduced by commit
:::::: 45bb912bd5ea4d2b3a270a93cbdf767a0e2df6f5 drbd: Allow drbd_epoch_entr=
ies to use multiple bios. This should allow for better performance if the l=
ower level IO stack of the peers differs in limits exposed either via the q=
ueue, or via some merge_bvec_fn.

:::::: TO: Lars Ellenberg <lars.ellenberg@linbit.com>
:::::: CC: Philipp Reisner <philipp.reisner@linbit.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3116484211151833292==--

