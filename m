Content-Type: multipart/mixed; boundary="===============5570728673973117143=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:report-refcounts 397/397] fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can be declared with const [constParameter]
Date: Fri, 15 Apr 2022 13:30:20 +0800
Message-ID: <202204151324.oJmSajF6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5570728673973117143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t report-refcounts
head:   d11f6d3475bd6d2742441d3d10e623d2f23ba712
commit: d11f6d3475bd6d2742441d3d10e623d2f23ba712 [397/397] xfs: export refe=
rence count information to userspace
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d11f6d3475bd6d2742441d3d10e623d2f23ba712
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can b=
e declared with const [constParameter]
    struct xfs_refcount_irec *low_rec,
                              ^
>> fs/xfs/libxfs/xfs_refcount.c:1961:28: warning: Parameter 'high_rec' can =
be declared with const [constParameter]
    struct xfs_refcount_irec *high_rec,
                              ^
   fs/xfs/libxfs/xfs_refcount.c:1216:20: warning: Parameter 'pag' can be de=
clared with const [constParameter]
    struct xfs_perag *pag)
                      ^

vim +/low_rec +1960 fs/xfs/libxfs/xfs_refcount.c

d11f6d3475bd6d Darrick J. Wong 2022-01-06  1955  =

d11f6d3475bd6d Darrick J. Wong 2022-01-06  1956  /* Find all refcount recor=
ds between two keys. */
d11f6d3475bd6d Darrick J. Wong 2022-01-06  1957  int
d11f6d3475bd6d Darrick J. Wong 2022-01-06  1958  xfs_refcount_query_range(
d11f6d3475bd6d Darrick J. Wong 2022-01-06  1959  	struct xfs_btree_cur		*cu=
r,
d11f6d3475bd6d Darrick J. Wong 2022-01-06 @1960  	struct xfs_refcount_irec	=
*low_rec,
d11f6d3475bd6d Darrick J. Wong 2022-01-06 @1961  	struct xfs_refcount_irec	=
*high_rec,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5570728673973117143==--

