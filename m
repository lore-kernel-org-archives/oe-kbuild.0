Content-Type: multipart/mixed; boundary="===============4599508873330259138=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] iov_iter: Add extraction functions
Date: Sun, 11 Sep 2022 16:49:11 +0800
Message-ID: <202209111623.oK8xGunY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4599508873330259138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <3750754.1662765490@warthog.procyon.org.uk>
References: <3750754.1662765490@warthog.procyon.org.uk>
TO: David Howells <dhowells@redhat.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_it=
er-Add-extraction-functions/20220910-072102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
ce888220d5c7a805e0e155302a318d5d23e62950
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20911/202209111623.oK8xGunY-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/iov_iter_extract.c:360 iov_iter_extract_xarray() error: uninitialized s=
ymbol 'ret'.

vim +/ret +360 lib/iov_iter_extract.c

a8df8a89788037 David Howells 2022-09-10  314  =

a8df8a89788037 David Howells 2022-09-10  315  /*
a8df8a89788037 David Howells 2022-09-10  316   * Extract the pages from an =
XARRAY-class iterator and add them to the
a8df8a89788037 David Howells 2022-09-10  317   * destination buffer.  The p=
ages are not pinned.
a8df8a89788037 David Howells 2022-09-10  318   */
a8df8a89788037 David Howells 2022-09-10  319  static ssize_t iov_iter_extra=
ct_xarray(struct iov_iter *iter,
a8df8a89788037 David Howells 2022-09-10  320  				       void *array, unsig=
ned int array_max,
a8df8a89788037 David Howells 2022-09-10  321  				       ssize_t maxsize,
a8df8a89788037 David Howells 2022-09-10  322  				       enum iter_extract_=
dest dest)
a8df8a89788037 David Howells 2022-09-10  323  {
a8df8a89788037 David Howells 2022-09-10  324  	struct xarray *xa =3D iter->=
xarray;
a8df8a89788037 David Howells 2022-09-10  325  	struct folio *folio;
a8df8a89788037 David Howells 2022-09-10  326  	unsigned int ix;
a8df8a89788037 David Howells 2022-09-10  327  	loff_t start =3D iter->xarra=
y_start + iter->iov_offset;
a8df8a89788037 David Howells 2022-09-10  328  	pgoff_t index =3D start / PA=
GE_SIZE;
a8df8a89788037 David Howells 2022-09-10  329  	ssize_t ret;
a8df8a89788037 David Howells 2022-09-10  330  	size_t offset, len;
a8df8a89788037 David Howells 2022-09-10  331  	XA_STATE(xas, xa, index);
a8df8a89788037 David Howells 2022-09-10  332  =

a8df8a89788037 David Howells 2022-09-10  333  	rcu_read_lock();
a8df8a89788037 David Howells 2022-09-10  334  	xas_for_each(&xas, folio, UL=
ONG_MAX) {
a8df8a89788037 David Howells 2022-09-10  335  		if (xas_retry(&xas, folio))
a8df8a89788037 David Howells 2022-09-10  336  			continue;
a8df8a89788037 David Howells 2022-09-10  337  		if (WARN_ON(xa_is_value(fol=
io)))
a8df8a89788037 David Howells 2022-09-10  338  			break;
a8df8a89788037 David Howells 2022-09-10  339  		if (WARN_ON(folio_test_huge=
tlb(folio)))
a8df8a89788037 David Howells 2022-09-10  340  			break;
a8df8a89788037 David Howells 2022-09-10  341  =

a8df8a89788037 David Howells 2022-09-10  342  		offset =3D offset_in_folio(=
folio, start);
a8df8a89788037 David Howells 2022-09-10  343  		len =3D min_t(size_t, maxsi=
ze, folio_size(folio) - offset);
a8df8a89788037 David Howells 2022-09-10  344  =

a8df8a89788037 David Howells 2022-09-10  345  		ix =3D extract_contig_pages=
(array, folio_page(folio, 0),
a8df8a89788037 David Howells 2022-09-10  346  					  offset, len, dest);
a8df8a89788037 David Howells 2022-09-10  347  		maxsize -=3D len;
a8df8a89788037 David Howells 2022-09-10  348  		ret +=3D len;
a8df8a89788037 David Howells 2022-09-10  349  		if (ix >=3D array_max) {
a8df8a89788037 David Howells 2022-09-10  350  			WARN_ON_ONCE(ix > array_ma=
x);
a8df8a89788037 David Howells 2022-09-10  351  			break;
a8df8a89788037 David Howells 2022-09-10  352  		}
a8df8a89788037 David Howells 2022-09-10  353  =

a8df8a89788037 David Howells 2022-09-10  354  		if (maxsize <=3D 0)
a8df8a89788037 David Howells 2022-09-10  355  			break;
a8df8a89788037 David Howells 2022-09-10  356  	}
a8df8a89788037 David Howells 2022-09-10  357  =

a8df8a89788037 David Howells 2022-09-10  358  	rcu_read_unlock();
a8df8a89788037 David Howells 2022-09-10  359  	terminate_array(array, dest);
a8df8a89788037 David Howells 2022-09-10 @360  	return ret;
a8df8a89788037 David Howells 2022-09-10  361  }
a8df8a89788037 David Howells 2022-09-10  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4599508873330259138==--

