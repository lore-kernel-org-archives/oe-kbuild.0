Content-Type: multipart/mixed; boundary="===============0294688141784132646=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:iov-cleanup 3/11] lib/iov_iter.c:1802:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Mon, 21 Sep 2020 18:07:12 +0800
Message-ID: <202009211804.ruYdDkbF%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0294688141784132646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Laight <David.Laight@ACULAB.COM>
CC: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git iov-cleanup
head:   7ba0c9cd12a23489a9ed38f8a65ed6b985cf7a2d
commit: f2be6c7759f9ba4ea95b67a4c89d8e60bf92749e [3/11] iov_iter: move rw_c=
opy_check_uvector() into lib/iov_iter.c and mark it static
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

     ^
   lib/iov_iter.c:1324:2: warning: Assignment of function parameter has no =
effect outside the function. [uselessAssignmentArg]
    iterate_all_kinds(i, maxsize, v, ({
    ^
   lib/iov_iter.c:1405:2: warning: Assignment of function parameter has no =
effect outside the function. [uselessAssignmentArg]
    iterate_all_kinds(i, maxsize, v, ({
    ^
   lib/iov_iter.c:1892:2: warning: Assignment of function parameter has no =
effect outside the function. [uselessAssignmentArg]
    iterate_all_kinds(i, bytes, v, -EINVAL, ({
    ^
>> lib/iov_iter.c:1802:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D -EFAULT;
        ^
   lib/iov_iter.c:1791:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EINVAL;
        ^
   lib/iov_iter.c:1802:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EFAULT;
        ^
>> lib/iov_iter.c:1802:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D -EFAULT;
        ^
   lib/iov_iter.c:1795:7: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
     ret =3D -ENOMEM;
         ^
   lib/iov_iter.c:1802:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EFAULT;
        ^
   lib/iov_iter.c:1815:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D -EINVAL;
        ^
   lib/iov_iter.c:1802:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EFAULT;
        ^
   lib/iov_iter.c:1815:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EINVAL;
        ^
   lib/iov_iter.c:1840:6: warning: Variable 'ret' is reassigned a value bef=
ore the old one has been used. [redundantAssignment]
    ret =3D tot_len;
        ^
   lib/iov_iter.c:1815:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D -EINVAL;
        ^
   lib/iov_iter.c:1840:6: note: Variable 'ret' is reassigned a value before=
 the old one has been used.
    ret =3D tot_len;
        ^

git remote add hch-misc git://git.infradead.org/users/hch/misc.git
git fetch --no-tags hch-misc iov-cleanup
git checkout f2be6c7759f9ba4ea95b67a4c89d8e60bf92749e
vim +/ret +1802 lib/iov_iter.c

bc917be8105993c Al Viro      2015-03-21  1772  =

f2be6c7759f9ba4 David Laight 2020-09-15  1773  static ssize_t compat_rw_cop=
y_check_uvector(int type,
f2be6c7759f9ba4 David Laight 2020-09-15  1774  		const struct compat_iovec =
__user *uvector, unsigned long nr_segs,
f2be6c7759f9ba4 David Laight 2020-09-15  1775  		unsigned long fast_segs, s=
truct iovec *fast_pointer,
f2be6c7759f9ba4 David Laight 2020-09-15  1776  		struct iovec **ret_pointer)
f2be6c7759f9ba4 David Laight 2020-09-15  1777  {
f2be6c7759f9ba4 David Laight 2020-09-15  1778  	compat_ssize_t tot_len;
f2be6c7759f9ba4 David Laight 2020-09-15  1779  	struct iovec *iov =3D *ret_=
pointer =3D fast_pointer;
f2be6c7759f9ba4 David Laight 2020-09-15  1780  	ssize_t ret =3D 0;
f2be6c7759f9ba4 David Laight 2020-09-15  1781  	int seg;
f2be6c7759f9ba4 David Laight 2020-09-15  1782  =

f2be6c7759f9ba4 David Laight 2020-09-15  1783  	/*
f2be6c7759f9ba4 David Laight 2020-09-15  1784  	 * SuS says "The readv() fu=
nction *may* fail if the iovcnt argument
f2be6c7759f9ba4 David Laight 2020-09-15  1785  	 * was less than or equal t=
o 0, or greater than {IOV_MAX}.  Linux has
f2be6c7759f9ba4 David Laight 2020-09-15  1786  	 * traditionally returned z=
ero for zero segments, so...
f2be6c7759f9ba4 David Laight 2020-09-15  1787  	 */
f2be6c7759f9ba4 David Laight 2020-09-15  1788  	if (nr_segs =3D=3D 0)
f2be6c7759f9ba4 David Laight 2020-09-15  1789  		goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1790  =

f2be6c7759f9ba4 David Laight 2020-09-15  1791  	ret =3D -EINVAL;
f2be6c7759f9ba4 David Laight 2020-09-15  1792  	if (nr_segs > UIO_MAXIOV)
f2be6c7759f9ba4 David Laight 2020-09-15  1793  		goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1794  	if (nr_segs > fast_segs) {
f2be6c7759f9ba4 David Laight 2020-09-15  1795  		ret =3D -ENOMEM;
f2be6c7759f9ba4 David Laight 2020-09-15  1796  		iov =3D kmalloc_array(nr_s=
egs, sizeof(struct iovec), GFP_KERNEL);
f2be6c7759f9ba4 David Laight 2020-09-15  1797  		if (iov =3D=3D NULL)
f2be6c7759f9ba4 David Laight 2020-09-15  1798  			goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1799  	}
f2be6c7759f9ba4 David Laight 2020-09-15  1800  	*ret_pointer =3D iov;
f2be6c7759f9ba4 David Laight 2020-09-15  1801  =

f2be6c7759f9ba4 David Laight 2020-09-15 @1802  	ret =3D -EFAULT;
f2be6c7759f9ba4 David Laight 2020-09-15  1803  	if (!access_ok(uvector, nr_=
segs*sizeof(*uvector)))
f2be6c7759f9ba4 David Laight 2020-09-15  1804  		goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1805  =

f2be6c7759f9ba4 David Laight 2020-09-15  1806  	/*
f2be6c7759f9ba4 David Laight 2020-09-15  1807  	 * Single unix specificatio=
n:
f2be6c7759f9ba4 David Laight 2020-09-15  1808  	 * We should -EINVAL if an =
element length is not >=3D 0 and fitting an
f2be6c7759f9ba4 David Laight 2020-09-15  1809  	 * ssize_t.
f2be6c7759f9ba4 David Laight 2020-09-15  1810  	 *
f2be6c7759f9ba4 David Laight 2020-09-15  1811  	 * In Linux, the total leng=
th is limited to MAX_RW_COUNT, there is
f2be6c7759f9ba4 David Laight 2020-09-15  1812  	 * no overflow possibility.
f2be6c7759f9ba4 David Laight 2020-09-15  1813  	 */
f2be6c7759f9ba4 David Laight 2020-09-15  1814  	tot_len =3D 0;
f2be6c7759f9ba4 David Laight 2020-09-15  1815  	ret =3D -EINVAL;
f2be6c7759f9ba4 David Laight 2020-09-15  1816  	for (seg =3D 0; seg < nr_se=
gs; seg++) {
f2be6c7759f9ba4 David Laight 2020-09-15  1817  		compat_uptr_t buf;
f2be6c7759f9ba4 David Laight 2020-09-15  1818  		compat_ssize_t len;
f2be6c7759f9ba4 David Laight 2020-09-15  1819  =

f2be6c7759f9ba4 David Laight 2020-09-15  1820  		if (__get_user(len, &uvect=
or->iov_len) ||
f2be6c7759f9ba4 David Laight 2020-09-15  1821  		   __get_user(buf, &uvecto=
r->iov_base)) {
f2be6c7759f9ba4 David Laight 2020-09-15  1822  			ret =3D -EFAULT;
f2be6c7759f9ba4 David Laight 2020-09-15  1823  			goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1824  		}
f2be6c7759f9ba4 David Laight 2020-09-15  1825  		if (len < 0)	/* size_t not=
 fitting in compat_ssize_t .. */
f2be6c7759f9ba4 David Laight 2020-09-15  1826  			goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1827  		if (type >=3D 0 &&
f2be6c7759f9ba4 David Laight 2020-09-15  1828  		    !access_ok(compat_ptr(=
buf), len)) {
f2be6c7759f9ba4 David Laight 2020-09-15  1829  			ret =3D -EFAULT;
f2be6c7759f9ba4 David Laight 2020-09-15  1830  			goto out;
f2be6c7759f9ba4 David Laight 2020-09-15  1831  		}
f2be6c7759f9ba4 David Laight 2020-09-15  1832  		if (len > MAX_RW_COUNT - t=
ot_len)
f2be6c7759f9ba4 David Laight 2020-09-15  1833  			len =3D MAX_RW_COUNT - to=
t_len;
f2be6c7759f9ba4 David Laight 2020-09-15  1834  		tot_len +=3D len;
f2be6c7759f9ba4 David Laight 2020-09-15  1835  		iov->iov_base =3D compat_p=
tr(buf);
f2be6c7759f9ba4 David Laight 2020-09-15  1836  		iov->iov_len =3D (compat_s=
ize_t) len;
f2be6c7759f9ba4 David Laight 2020-09-15  1837  		uvector++;
f2be6c7759f9ba4 David Laight 2020-09-15  1838  		iov++;
f2be6c7759f9ba4 David Laight 2020-09-15  1839  	}
f2be6c7759f9ba4 David Laight 2020-09-15  1840  	ret =3D tot_len;
f2be6c7759f9ba4 David Laight 2020-09-15  1841  =

f2be6c7759f9ba4 David Laight 2020-09-15  1842  out:
f2be6c7759f9ba4 David Laight 2020-09-15  1843  	return ret;
f2be6c7759f9ba4 David Laight 2020-09-15  1844  }
f2be6c7759f9ba4 David Laight 2020-09-15  1845  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0294688141784132646==--

