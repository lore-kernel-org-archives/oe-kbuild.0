Content-Type: multipart/mixed; boundary="===============2253051102568921768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/2] iov_iter: Drop the X argument from iterate_all_kinds() and use B instead
Date: Sat, 10 Apr 2021 07:38:05 +0800
Message-ID: <202104100702.4jLAXojC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2253051102568921768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <161799186664.847742.14555840742293852768.stgit@warthog.proc=
yon.org.uk>
References: <161799186664.847742.14555840742293852768.stgit@warthog.procy=
on.org.uk>
TO: David Howells <dhowells@redhat.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on next-20210409]
[cannot apply to linus/master v5.12-rc6 v5.12-rc5 v5.12-rc4 v5.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Howells/iov_iter-Rem=
ove-iov_iter_for_each_range/20210410-021151
base:    e99d8a8495175df8cb8b739f8cf9b0fc9d0cd3b5
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: microblaze-randconfig-s031-20210409 (attached as .config)
compiler: microblaze-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-279-g6d5d9b42-dirty
        # https://github.com/0day-ci/linux/commit/3a86123438f2aac6764901c84=
62752f378c958c0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Howells/iov_iter-Remove-iov_=
iter_for_each_range/20210410-021151
        git checkout 3a86123438f2aac6764901c8462752f378c958c0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dmicroblaze =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> lib/iov_iter.c:1481:9: sparse: sparse: context imbalance in 'iov_iter_ge=
t_pages' - different lock contexts for basic block
>> lib/iov_iter.c:1607:9: sparse: sparse: context imbalance in 'iov_iter_ge=
t_pages_alloc' - different lock contexts for basic block
   lib/iov_iter.c: note: in included file:
   include/net/checksum.h:31:39: sparse: sparse: incorrect type in argument=
 3 (different base types) @@     expected restricted __wsum [usertype] sum =
@@     got unsigned int @@
   include/net/checksum.h:31:39: sparse:     expected restricted __wsum [us=
ertype] sum
   include/net/checksum.h:31:39: sparse:     got unsigned int
   include/net/checksum.h:39:45: sparse: sparse: incorrect type in argument=
 3 (different base types) @@     expected restricted __wsum [usertype] sum =
@@     got unsigned int @@
   include/net/checksum.h:39:45: sparse:     expected restricted __wsum [us=
ertype] sum
   include/net/checksum.h:39:45: sparse:     got unsigned int
>> lib/iov_iter.c:1818:5: sparse: sparse: context imbalance in 'iov_iter_np=
ages' - different lock contexts for basic block

vim +/iov_iter_get_pages +1481 lib/iov_iter.c

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1480  =

62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04 @1481  ssize_t iov_=
iter_get_pages(struct iov_iter *i,
2c80929c4c4d54 mm/iov_iter.c  Miklos Szeredi 2014-09-24  1482  		   struct =
page **pages, size_t maxsize, unsigned maxpages,
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1483  		   size_t =
*start)
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1484  {
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1485  	if (maxsize=
 > i->count)
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1486  		maxsize =
=3D i->count;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1487  =

00e23707442a75 lib/iov_iter.c David Howells  2018-10-22  1488  	if (unlikel=
y(iov_iter_is_pipe(i)))
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1489  		return pip=
e_get_pages(i, pages, maxsize, maxpages, start);
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1490  	if (unlikel=
y(iov_iter_is_xarray(i)))
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1491  		return ite=
r_xarray_get_pages(i, pages, maxsize, maxpages, start);
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1492  	if (unlikel=
y(iov_iter_is_discard(i)))
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1493  		return -EF=
AULT;
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1494  =

e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1495  	iterate_all=
_kinds(i, maxsize, v, ({
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1496  		unsigned l=
ong addr =3D (unsigned long)v.iov_base;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1497  		size_t len=
 =3D v.iov_len + (*start =3D addr & (PAGE_SIZE - 1));
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1498  		int n;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1499  		int res;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1500  =

e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1501  		if (len > =
maxpages * PAGE_SIZE)
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1502  			len =3D m=
axpages * PAGE_SIZE;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1503  		addr &=3D =
~(PAGE_SIZE - 1);
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1504  		n =3D DIV_=
ROUND_UP(len, PAGE_SIZE);
73b0140bf0fe9d lib/iov_iter.c Ira Weiny      2019-05-13  1505  		res =3D ge=
t_user_pages_fast(addr, n,
73b0140bf0fe9d lib/iov_iter.c Ira Weiny      2019-05-13  1506  				iov_iter=
_rw(i) !=3D WRITE ?  FOLL_WRITE : 0,
73b0140bf0fe9d lib/iov_iter.c Ira Weiny      2019-05-13  1507  				pages);
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1508  		if (unlike=
ly(res < 0))
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1509  			return re=
s;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1510  		return (re=
s =3D=3D n ? len : res * PAGE_SIZE) - *start;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1511  	0;}),({
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1512  		/* can't b=
e more than PAGE_SIZE */
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1513  		*start =3D=
 v.bv_offset;
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1514  		get_page(*=
pages =3D v.bv_page);
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1515  		return v.b=
v_len;
a280455fa87053 mm/iov_iter.c  Al Viro        2014-11-27  1516  	}),({
a280455fa87053 mm/iov_iter.c  Al Viro        2014-11-27  1517  		return -EF=
AULT;
3a86123438f2aa lib/iov_iter.c David Howells  2021-04-09  1518  	})
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1519  	)
e5393fae3b49e8 mm/iov_iter.c  Al Viro        2014-11-27  1520  	return 0;
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1521  }
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1522  EXPORT_SYMBO=
L(iov_iter_get_pages);
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1523  =

1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1524  static struc=
t page **get_pages_array(size_t n)
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1525  {
752ade68cbd81d lib/iov_iter.c Michal Hocko   2017-05-08  1526  	return kvma=
lloc_array(n, sizeof(struct page *), GFP_KERNEL);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1527  }
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1528  =

241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1529  static ssize=
_t pipe_get_pages_alloc(struct iov_iter *i,
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1530  		   struct =
page ***pages, size_t maxsize,
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1531  		   size_t =
*start)
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1532  {
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1533  	struct page=
 **p;
8cefc107ca54c8 lib/iov_iter.c David Howells  2019-11-15  1534  	unsigned in=
t iter_head, npages;
d7760d638b140d lib/iov_iter.c Ilya Dryomov   2018-05-02  1535  	ssize_t n;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1536  =

33844e665104b1 lib/iov_iter.c Al Viro        2016-12-21  1537  	if (!maxsiz=
e)
33844e665104b1 lib/iov_iter.c Al Viro        2016-12-21  1538  		return 0;
33844e665104b1 lib/iov_iter.c Al Viro        2016-12-21  1539  =

241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1540  	if (!sanity=
(i))
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1541  		return -EF=
AULT;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1542  =

8cefc107ca54c8 lib/iov_iter.c David Howells  2019-11-15  1543  	data_start(=
i, &iter_head, start);
8cefc107ca54c8 lib/iov_iter.c David Howells  2019-11-15  1544  	/* Amount o=
f free space: some of this one + all after this one */
8cefc107ca54c8 lib/iov_iter.c David Howells  2019-11-15  1545  	npages =3D =
pipe_space_for_user(iter_head, i->pipe->tail, i->pipe);
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1546  	n =3D npage=
s * PAGE_SIZE - *start;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1547  	if (maxsize=
 > n)
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1548  		maxsize =
=3D n;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1549  	else
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1550  		npages =3D=
 DIV_ROUND_UP(maxsize + *start, PAGE_SIZE);
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1551  	p =3D get_p=
ages_array(npages);
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1552  	if (!p)
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1553  		return -EN=
OMEM;
8cefc107ca54c8 lib/iov_iter.c David Howells  2019-11-15  1554  	n =3D __pip=
e_get_pages(i, maxsize, p, iter_head, start);
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1555  	if (n > 0)
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1556  		*pages =3D=
 p;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1557  	else
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1558  		kvfree(p);
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1559  	return n;
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1560  }
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1561  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1562  static ssize=
_t iter_xarray_get_pages_alloc(struct iov_iter *i,
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1563  					   stru=
ct page ***pages, size_t maxsize,
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1564  					   size=
_t *_start_offset)
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1565  {
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1566  	struct page=
 **p;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1567  	unsigned nr=
, offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1568  	pgoff_t ind=
ex, count;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1569  	size_t size=
 =3D maxsize, actual;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1570  	loff_t pos;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1571  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1572  	if (!size)
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1573  		return 0;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1574  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1575  	pos =3D i->=
xarray_start + i->iov_offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1576  	index =3D p=
os >> PAGE_SHIFT;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1577  	offset =3D =
pos & ~PAGE_MASK;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1578  	*_start_off=
set =3D offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1579  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1580  	count =3D 1;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1581  	if (size > =
PAGE_SIZE - offset) {
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1582  		size -=3D =
PAGE_SIZE - offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1583  		count +=3D=
 size >> PAGE_SHIFT;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1584  		size &=3D =
~PAGE_MASK;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1585  		if (size)
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1586  			count++;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1587  	}
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1588  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1589  	p =3D get_p=
ages_array(count);
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1590  	if (!p)
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1591  		return -EN=
OMEM;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1592  	*pages =3D =
p;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1593  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1594  	nr =3D iter=
_xarray_copy_pages(p, i->xarray, index, count);
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1595  	if (nr =3D=
=3D 0)
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1596  		return 0;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1597  =

788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1598  	actual =3D =
PAGE_SIZE * nr;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1599  	actual -=3D=
 offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1600  	if (nr =3D=
=3D count && size > 0) {
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1601  		unsigned l=
ast_offset =3D (nr > 1) ? 0 : offset;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1602  		actual -=
=3D PAGE_SIZE - (last_offset + size);
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1603  	}
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1604  	return actu=
al;
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1605  }
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1606  =

62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04 @1607  ssize_t iov_=
iter_get_pages_alloc(struct iov_iter *i,
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1608  		   struct =
page ***pages, size_t maxsize,
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1609  		   size_t =
*start)
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1610  {
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1611  	struct page=
 **p;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1612  =

1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1613  	if (maxsize=
 > i->count)
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1614  		maxsize =
=3D i->count;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1615  =

00e23707442a75 lib/iov_iter.c David Howells  2018-10-22  1616  	if (unlikel=
y(iov_iter_is_pipe(i)))
241699cd72a848 lib/iov_iter.c Al Viro        2016-09-22  1617  		return pip=
e_get_pages_alloc(i, pages, maxsize, start);
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1618  	if (unlikel=
y(iov_iter_is_xarray(i)))
788abcfb66c10d lib/iov_iter.c David Howells  2020-02-10  1619  		return ite=
r_xarray_get_pages_alloc(i, pages, maxsize, start);
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1620  	if (unlikel=
y(iov_iter_is_discard(i)))
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1621  		return -EF=
AULT;
9ea9ce0427aab0 lib/iov_iter.c David Howells  2018-10-20  1622  =

1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1623  	iterate_all=
_kinds(i, maxsize, v, ({
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1624  		unsigned l=
ong addr =3D (unsigned long)v.iov_base;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1625  		size_t len=
 =3D v.iov_len + (*start =3D addr & (PAGE_SIZE - 1));
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1626  		int n;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1627  		int res;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1628  =

1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1629  		addr &=3D =
~(PAGE_SIZE - 1);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1630  		n =3D DIV_=
ROUND_UP(len, PAGE_SIZE);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1631  		p =3D get_=
pages_array(n);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1632  		if (!p)
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1633  			return -E=
NOMEM;
73b0140bf0fe9d lib/iov_iter.c Ira Weiny      2019-05-13  1634  		res =3D ge=
t_user_pages_fast(addr, n,
73b0140bf0fe9d lib/iov_iter.c Ira Weiny      2019-05-13  1635  				iov_iter=
_rw(i) !=3D WRITE ?  FOLL_WRITE : 0, p);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1636  		if (unlike=
ly(res < 0)) {
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1637  			kvfree(p);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1638  			return re=
s;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1639  		}
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1640  		*pages =3D=
 p;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1641  		return (re=
s =3D=3D n ? len : res * PAGE_SIZE) - *start;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1642  	0;}),({
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1643  		/* can't b=
e more than PAGE_SIZE */
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1644  		*start =3D=
 v.bv_offset;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1645  		*pages =3D=
 p =3D get_pages_array(1);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1646  		if (!p)
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1647  			return -E=
NOMEM;
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1648  		get_page(*=
p =3D v.bv_page);
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1649  		return v.b=
v_len;
a280455fa87053 mm/iov_iter.c  Al Viro        2014-11-27  1650  	}),({
a280455fa87053 mm/iov_iter.c  Al Viro        2014-11-27  1651  		return -EF=
AULT;
3a86123438f2aa lib/iov_iter.c David Howells  2021-04-09  1652  	})
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1653  	)
1b17f1f2e56a09 mm/iov_iter.c  Al Viro        2014-11-27  1654  	return 0;
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1655  }
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1656  EXPORT_SYMBO=
L(iov_iter_get_pages_alloc);
62a8067a7f35db mm/iov_iter.c  Al Viro        2014-04-04  1657  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============2253051102568921768==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
eGHJAQA=
--===============2253051102568921768==--

