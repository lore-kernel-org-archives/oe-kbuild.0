Content-Type: multipart/mixed; boundary="===============6851076486495107930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][PATCH] iov_iter: Add extraction functions
Date: Mon, 12 Sep 2022 08:44:39 +0800
Message-ID: <202209120843.RvCuk9sv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6851076486495107930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/iov_i=
ter_extract.c:348:21: warning: use of uninitialized value 'ret' [CWE-457] [=
-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <3750754.1662765490@warthog.procyon.org.uk>
References: <3750754.1662765490@warthog.procyon.org.uk>
TO: David Howells <dhowells@redhat.com>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc5 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_it=
er-Add-extraction-functions/20220910-072102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
ce888220d5c7a805e0e155302a318d5d23e62950
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220911 (https://download.01.org/0day-ci/archi=
ve/20220912/202209120843.RvCuk9sv-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a8df8a897880379087a=
0a9fc4f6fc1391e352217
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/iov_iter-Add-extract=
ion-functions/20220910-072102
        git checkout a8df8a897880379087a0a9fc4f6fc1391e352217
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   lib/iov_iter_extract.c: In function 'iov_iter_extract_xarray':
>> lib/iov_iter_extract.c:348:21: warning: use of uninitialized value 'ret'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     348 |                 ret +=3D len;
         |                     ^~
     'iov_iter_extract_pages.part.0': events 1-8
       |
       |  363 | static ssize_t iov_iter_extract_pages(struct iov_iter *iter,
       |      |                ^~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (1) entry to 'iov_iter_extract_pages.part.0'
       |......
       |  371 |         if (iov_iter_is_bvec(iter))
       |      |            ~    =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  374 |         if (iov_iter_is_kvec(iter))
       |      |            ~    =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'false' branch...
       |......
       |  377 |         if (iov_iter_is_xarray(iter))
       |      |            ~    =

       |      |            |
       |      |            (5) ...to here
       |      |            (6) following 'true' branch...
       |  378 |                 return iov_iter_extract_xarray(iter, array,=
 array_max, maxsize,
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (7) ...to here
       |      |                        (8) calling 'iov_iter_extract_xarray=
' from 'iov_iter_extract_pages.part.0'
       |  379 |                                                dest);
       |      |                                                ~~~~~
       |
       +--> 'iov_iter_extract_xarray': events 9-10
              |
              |  319 | static ssize_t iov_iter_extract_xarray(struct iov_it=
er *iter,
              |      |                ^~~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (9) entry to 'iov_iter_extract_xarray'
              |......
              |  329 |         ssize_t ret;
              |      |                 ~~~
              |      |                 |
              |      |                 (10) region created on stack here
              |
            'iov_iter_extract_xarray': event 11
              |
              |  334 |         xas_for_each(&xas, folio, ULONG_MAX) {
              |      |                            ^~~~~
              |      |                            |
              |      |                            (11) following 'true' bra=
nch (when 'folio' is non-NULL)...
   include/linux/xarray.h:1770:42: note: in definition of macro 'xas_for_ea=
ch'
              | 1770 |         for (entry =3D xas_find(xas, max); entry; \
              |      |                                          ^~~~~
              |
            'iov_iter_extract_xarray': event 12
              |
              |include/linux/compiler.h:78:42:
              |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
              |      |                                          ^~~~~
              |      |                                          |
              |      |                                          (12) ...to =
here
   include/linux/xarray.h:187:16: note: in expansion of macro 'unlikely'
              |  187 |         return unlikely(entry =3D=3D XA_ZERO_ENTRY);
              |      |                ^~~~~~~~
              |
            'iov_iter_extract_xarray': event 13
              |
              | 1506 |         if (xa_is_zero(entry))
              |      |            ^
              |      |            |
              |      |            (13) following 'false' branch...
              |
            'iov_iter_extract_xarray': event 14
              |
              |include/linux/compiler.h:78:42:
              |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
              |      |                                          ^~~~~
              |      |                                          |
              |      |                                          (14) ...to =
here
   include/linux/xarray.h:1279:16: note: in expansion of macro 'unlikely'
              | 1279 |         return unlikely(entry =3D=3D XA_RETRY_ENTRY);
              |      |                ^~~~~~~~
              |
            'iov_iter_extract_xarray': events 15-16
              |
              |   81 |         return (unsigned long)entry & 1;
              |      |                ~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (16) ...to here
              |......
              | 1508 |         if (!xa_is_retry(entry))
              |      |            ^
              |      |            |
              |      |            (15) following 'true' branch...
              |
            'iov_iter_extract_xarray': event 17
              |
              |lib/iov_iter_extract.c:337:20:
              |  337 |                 if (WARN_ON(xa_is_value(folio)))
              |      |                    ^
              |      |                    |
              |      |                    (17) following 'false' branch...
              |
            'iov_iter_extract_xarray': event 18
              |
              |include/linux/mm.h:1771:36:
              | 1771 | #define offset_in_folio(folio, p) ((unsigned long)(p=
) & (folio_size(folio) - 1))
              |      |                                    ^~~~~~~~~~~~~~~~~~
              |      |                                    |
              |      |                                    (18) ...to here
   lib/iov_iter_extract.c:342:26: note: in expansion of macro 'offset_in_fo=
lio'
              |  342 |                 offset =3D offset_in_folio(folio, st=
art);
              |      |                          ^~~~~~~~~~~~~~~
              |
            'iov_iter_extract_xarray': event 19
              |
              |  348 |                 ret +=3D len;
              |      |                     ^~
              |      |                     |
              |      |                     (19) use of uninitialized value =
'ret' here
              |
>> lib/iov_iter_extract.c:348:21: warning: use of uninitialized value 'ret'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     'extract_iter_to_sg': events 1-2
       |
       |  477 | ssize_t extract_iter_to_sg(struct iov_iter *iter, size_t le=
n,
       |      |         ^~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (1) entry to 'extract_iter_to_sg'
       |......
       |  504 |         if (!sg)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |
     'extract_iter_to_sg': event 3
       |
       |include/linux/fortify-string.h:280:9:
       |  280 |         fortify_memset_chk(__fortify_size, p_size, p_size_f=
ield),       \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |         |
       |      |         (3) ...to here
   include/linux/fortify-string.h:288:25: note: in expansion of macro '__fo=
rtify_memset_chk'
       |  288 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,      =
             \
       |      |                         ^~~~~~~~~~~~~~~~~~~~
   lib/iov_iter_extract.c:506:9: note: in expansion of macro 'memset'
       |  506 |         memset(sg, 0, sg_size);
       |      |         ^~~~~~
       |
     'extract_iter_to_sg': event 4
       |
       |  511 |         ret =3D iov_iter_extract_pages(iter, sgtable, sg_ma=
x, len,
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |               |
       |      |               (4) calling 'iov_iter_extract_pages' from 'ex=
tract_iter_to_sg'
       |  512 |                                      EXTRACT_TO_SGLIST);
       |      |                                      ~~~~~~~~~~~~~~~~~~
       |
       +--> 'iov_iter_extract_pages': events 5-6
              |
              |  363 | static ssize_t iov_iter_extract_pages(struct iov_ite=
r *iter,
              |      |                ^~~~~~~~~~~~~~~~~~~~~~
              |      |                |
              |      |                (5) entry to 'iov_iter_extract_pages'
              |......
              |  368 |         if (likely(user_backed_iter(iter)))
              |      |            ~    =

              |      |            |
              |      |            (6) following 'false' branch...
              |
            'iov_iter_extract_pages': event 7
              |
              |cc1:
              | (7): ...to here
              |
            'iov_iter_extract_pages': event 8
              |
              |cc1:
              | (8): calling 'iov_iter_extract_pages.part.0' from 'iov_iter=
_extract_pages'
              |
              +--> 'iov_iter_extract_pages.part.0': events 9-16
                     |
                     |  363 | static ssize_t iov_iter_extract_pages(struct =
iov_iter *iter,
                     |      |                ^~~~~~~~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (9) entry to 'iov_iter_extract=
_pages.part.0'
                     |......
                     |  371 |         if (iov_iter_is_bvec(iter))
                     |      |            ~    =

                     |      |            |
                     |      |            (10) following 'false' branch...
                     |......
                     |  374 |         if (iov_iter_is_kvec(iter))
                     |      |            ~    =

                     |      |            |
                     |      |            (11) ...to here
                     |      |            (12) following 'false' branch...
                     |......
                     |  377 |         if (iov_iter_is_xarray(iter))
                     |      |            ~    =

                     |      |            |
                     |      |            (13) ...to here
                     |      |            (14) following 'true' branch...
                     |  378 |                 return iov_iter_extract_xarra=
y(iter, array, array_max, maxsize,
                     |      |                        ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (15) ...to here
                     |      |                        (16) calling 'iov_iter=
_extract_xarray' from 'iov_iter_extract_pages.part.0'
                     |  379 |                                              =
  dest);
                     |      |                                              =
  ~~~~~
                     |
                     +--> 'iov_iter_extract_xarray': events 17-18
                            |
                            |  319 | static ssize_t iov_iter_extract_xarray=
(struct iov_iter *iter,
                            |      |                ^~~~~~~~~~~~~~~~~~~~~~~
                            |      |                |
                            |      |                (17) entry to 'iov_iter=
_extract_xarray'
                            |......
                            |  329 |         ssize_t ret;
                            |      |                 ~~~
                            |      |                 |
                            |      |                 (18) region created on=
 stack here
                            |

vim +/ret +348 lib/iov_iter_extract.c

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
a8df8a89788037 David Howells 2022-09-10 @348  		ret +=3D len;
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
a8df8a89788037 David Howells 2022-09-10  360  	return ret;
a8df8a89788037 David Howells 2022-09-10  361  }
a8df8a89788037 David Howells 2022-09-10  362  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6851076486495107930==--

