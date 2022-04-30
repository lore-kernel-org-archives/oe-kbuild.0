Content-Type: multipart/mixed; boundary="===============0613422371710106198=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:report-refcounts 400/400] fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can be declared with const [constParameter]
Date: Sat, 30 Apr 2022 17:25:23 +0800
Message-ID: <202204301743.1CbXM5DL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0613422371710106198==
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
head:   0ba96363d9c626afec1bcac75f71e5914adae2a9
commit: 0ba96363d9c626afec1bcac75f71e5914adae2a9 [400/400] xfs: export refe=
rence count information to userspace
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0ba96363d9c626afec1bcac75f71e5914adae2a9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_qm_syscalls.c:412:2: warning: Redundant assignment of 'dqp' t=
o itself. [selfAssignment]
    xfs_qm_dqrele(dqp);
    ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/xfs/libxfs/xfs_refcount.c:1960:28: warning: Parameter 'low_rec' can b=
e declared with const [constParameter]
    struct xfs_refcount_irec *low_rec,
                              ^
>> fs/xfs/libxfs/xfs_refcount.c:1961:28: warning: Parameter 'high_rec' can =
be declared with const [constParameter]
    struct xfs_refcount_irec *high_rec,
                              ^
>> fs/xfs/libxfs/xfs_refcount.c:1216:20: warning: Parameter 'pag' can be de=
clared with const [constParameter]
    struct xfs_perag *pag)
                      ^

vim +/low_rec +1960 fs/xfs/libxfs/xfs_refcount.c

0ba96363d9c626 Darrick J. Wong 2022-01-06  1955  =

0ba96363d9c626 Darrick J. Wong 2022-01-06  1956  /* Find all refcount recor=
ds between two keys. */
0ba96363d9c626 Darrick J. Wong 2022-01-06  1957  int
0ba96363d9c626 Darrick J. Wong 2022-01-06  1958  xfs_refcount_query_range(
0ba96363d9c626 Darrick J. Wong 2022-01-06  1959  	struct xfs_btree_cur		*cu=
r,
0ba96363d9c626 Darrick J. Wong 2022-01-06 @1960  	struct xfs_refcount_irec	=
*low_rec,
0ba96363d9c626 Darrick J. Wong 2022-01-06 @1961  	struct xfs_refcount_irec	=
*high_rec,

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0613422371710106198==--

